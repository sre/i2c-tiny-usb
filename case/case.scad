module round_square(size, radius) {
    hull() {
        translate([0+radius,0+radius]) scale([1/100, 1/100]) circle(radius * 100.0);
        translate([size[0]-radius,0+radius]) scale([1/100, 1/100]) circle(radius * 100.0);
        translate([0+radius,size[1]-radius]) scale([1/100, 1/100]) circle(radius * 100.0);
        translate([size[0]-radius,size[1]-radius]) scale([1/100, 1/100]) circle(radius * 100.0);
    }
}

module base(hole_diameter) {
    difference() {
        round_square([50,50], 5);
        translate([5,5]) scale([1/100, 1/100]) circle(d=hole_diameter*100.0);
        translate([45,5]) scale([1/100, 1/100]) circle(d=hole_diameter*100.0);
        translate([5,45]) scale([1/100, 1/100]) circle(d=hole_diameter*100.0);
        translate([45,45]) scale([1/100, 1/100]) circle(d=hole_diameter*100.0);
    }
}

module top2() {
    base(3.0);
}

module top1() {
    difference() {
        base(3.0);
        translate([9,9]) round_square([50-2*9,50-2*9], 5);
    }
}

module bottom1() {
    difference() {
        base(2.9);
        translate([25,50-10/2.0]) square(size=[12,10], center=true); // USB
        translate([12/2.0,25]) square(size=[12,11], center=true); // 5V I2C Port
        translate([50-12/2.0,25]) square(size=[12,11], center=true); // 1.8V I2C Port
        translate([25,12/2.0]) square(size=[11,12], center=true); // 3.3V I2C Port
    }
}

module bottom2() {
    base(2.9);
}

module all() {
    translate([0,0]) bottom2();
    translate([0,50+2]) bottom1();
    translate([50+2,0]) top1();
    translate([50+2,50+2]) top2();
}

all();