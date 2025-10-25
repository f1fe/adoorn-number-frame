
// Adoorn Mailbox Number Positioning Frame
// Designed for Bambu P1S printer - Raised Border Version

inch = 25.4;  // convert inches to mm

// Dimensions
num_height = 4 * inch;
num_width = 2.8125 * inch;
spacing = 0.75 * inch;
rear_offset = 17.3125 * inch;
bottom_offset = 0.75 * inch;

frame_thickness = 0.25 * inch;
frame_height = num_height + bottom_offset + 0.5 * inch;
// frame_length = (num_width * 4) + (spacing * 3) + (1.0 * inch);
frame_length = rear_offset;

// Create main frame
difference() {
    // Main plate
    cube([frame_length, frame_height, frame_thickness]);
    
    // Cutouts for numbers
    translate([1.0 * inch, bottom_offset, 0])
        cube([num_width, num_height, frame_thickness + 1]);
    translate([1.0 * inch + num_width + spacing, bottom_offset, 0])
        cube([num_width, num_height, frame_thickness + 1]);
    translate([1.0 * inch + (num_width + spacing) * 2, bottom_offset, 0])
        cube([num_width, num_height, frame_thickness + 1]);
    translate([1.0 * inch + (num_width + spacing) * 3, bottom_offset, 0])
        cube([num_width, num_height, frame_thickness + 1]);
}

// Rear alignment tab
translate([0, 0, 0])
    cube([1.0 * inch, frame_height, frame_thickness]);

// Bottom flange
translate([0, 0, -0.75 * inch])
    cube([frame_length, 0.75 * inch, frame_thickness]);
