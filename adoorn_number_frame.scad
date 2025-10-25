// Adoorn Mailbox Number Positioning Frame (Split for Bambu P1S)
// Raised Border Version – 2-piece print for smaller bed
// Export partA() and partB() separately to STL

inch = 25.4;  // convert inches to mm

// Dimensions
num_height = 4 * inch;
num_width = 2.8125 * inch;
spacing = 0.75 * inch;
rear_offset = 17.3125 * inch;
bottom_offset = 0.75 * inch;

frame_thickness = 0.25 * inch;
frame_height = num_height + bottom_offset + 0.5 * inch;
frame_length = rear_offset;

split_pos = frame_length / 2; // divide into two equal parts
join_tab_depth = 0.5 * inch;
join_tab_height = 1.0 * inch;
join_tab_thickness = frame_thickness;

// --- Base Frame Shape (with cutouts) ---
module full_frame() {
    difference() {
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
}

// --- Part A (rear half, includes tab) ---
module partA() {
    intersection() {
        full_frame();
        cube([split_pos, frame_height, frame_thickness + 1]);
    }

    // Add join tab extending from front edge
    translate([split_pos - join_tab_depth, (frame_height - join_tab_height) / 2, frame_thickness])
        cube([join_tab_depth, join_tab_height, join_tab_thickness]);
}

// --- Part B (front half, includes slot) ---
module partB() {
    intersection() {
        full_frame();
        translate([split_pos, 0, 0])
            cube([frame_length, frame_height, frame_thickness + 1]);
    }

    // Add receiving slot
    difference() {
        translate([split_pos, (frame_height - join_tab_height) / 2, frame_thickness - join_tab_thickness])
            cube([join_tab_depth, join_tab_height, join_tab_thickness]);
    }
}

// Uncomment one of the following to export:
partA();
//partB();