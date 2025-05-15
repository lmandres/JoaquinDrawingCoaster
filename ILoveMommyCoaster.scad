// Import inch unit from MCAD
inch = 25.4;

coaster_size = 4 * inch;   // 4 inches = 101.6 mm
corner_radius = 0.5 * inch; // 0.5 inch = 12.7 mm
thickness = 0.25 * inch;   // Optional: coaster thickness = 0.25 inch (6.35 mm)

// Create rounded square using offset and minkowski methods
module rounded_square(size, radius, height) {
    linear_extrude(height)
        minkowski() {
            square([size - 2*radius, size - 2*radius], center=true);
            circle(r=radius, $fn=64);
        }
}

module svg_shape(height) {
    translate([0, 0, 0.125 * inch])
        linear_extrude(height)
            scale([ (3.75 * inch) / 800, (3.75 * inch) / 800, 1])
                offset(0.001)
                    import("i_love_mommy_paths_v1.3.svg", center=true);
}

module svg_text(height) {
    translate([0, 0.45 * inch, 0])
        linear_extrude(height)
            scale([ (3.75 * inch) / 800, (3.75 * inch) / 800, 1])
                offset(0.001)
                    import("i_love_mommy_text_paths_v1.3.svg", center=true);
}

// Generate the coaster
difference () {
    rounded_square(coaster_size, corner_radius, thickness);
    difference () {
        svg_shape(thickness);
        svg_text(thickness);
    }
}