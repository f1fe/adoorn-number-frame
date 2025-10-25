// Adoorn Mailbox Number Positioning Frame (Split for Bambu P1S)
// Raised Border Version – 2-piece print for smaller bed
// Flat-printable notches for alignment (top + bottom)
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

split_pos = frame_length / 2;  // divide into two equal parts

// Notch specs
notch_width = 0.25 * inch;     // horizontal thickness of notch
notch_depth = 0.125 * inch;    // how far it overlaps
notch_height = 0.25 * inch;    // vertical size of notch

//---------------------------------------------
// --- Base Frame Shape (with cutouts) ---
//---------------------------------------------
module full_frame() {
    difference() {
        cube([frame_length, frame_height, frame_thickness]);
        
        // Number cutouts
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

//---------------------------------------------
// --- Part A (rear half with female notches) ---
//---------------------------------------------
module partA() {
    difference() {
        intersection() {
            full_frame();
            cube([split_pos, frame_height, frame_thickness + 1]);
        }

        // Top notch (female)
        translate([split_pos - notch_depth, frame_height - notch_height, 0])
            cube([notch_depth, notch_height, frame_thickness + 1]);

        // Bottom notch (female)
        translate([split_pos - notch_depth, 0, 0])
            cube([notch_depth, notch_height, frame_thickness + 1]);
    }
}

//---------------------------------------------
// --- Part B (front half with male bumps) ---
//---------------------------------------------
module partB() {
    union() {
        // Base section (front half)
        intersection() {
            full_frame();
            translate([split_pos, 0, 0])
                cube([frame_length, frame_height, frame_thickness + 1]);
        }

        // Top notch bump (male)
        translate([split_pos - notch_depth, frame_height - notch_height, 0])
            cube([notch_depth, notch_height, frame_thickness]);

        // Bottom notch bump (male)
        translate([split_pos - notch_depth, 0, 0])
            cube([notch_depth, notch_height, frame_thickness]);
    }
}

//---------------------------------------------
// Uncomment to export one at a time
//---------------------------------------------
//partA();
partB();