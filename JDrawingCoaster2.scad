// Import inch unit from MCAD
inch = 2.54;

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
    translate([-0.5 * inch, -0.5 * inch, 0.125 * inch])
        linear_extrude(height)
            scale([ 0.035, 0.035, 1])
                offset(0.001)
                    import("JoaquinDrawing2.svg", center=true);
}

// Generate the coaster
difference () {
    rounded_square(coaster_size, corner_radius, thickness);
    svg_shape(thickness);
}