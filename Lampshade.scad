$fn=30;

// Creating shape of Africa
  module africa_base() {
   polygon([[5*.75,-20*.75], [-5*.75, -20*.75], [-10*.75, -5*.75], [-17*.75, 5*.75], [-10*.75, 5*.75], [-7*.75, 20*.75], [7*.75, 20*.75], [13*.75, 10*.75], [13*.75, 0], [5*.75, -5*.75]]);
     translate([13*.75-5.2, (10-5)*.75]){
         circle(r=6.4);
     }
     translate([-7*.75+2.5, 20*.75-2.5]){
         circle(r=2.8);
     }
     translate([0,-20*.75+2.5]){
         circle(r=4.3);
     }    
 }
 
  module africa() {
   linear_extrude(height=120, center = true) {
     africa_base ();
   }
 }
 
 // Creating pentagon shapes
  module p(){
    for (i=[0:20:360]){
        for (j=[70:8:156]){
            rotate([0,0,i]){
                rotate([j,0,0]){
                    pentagon();
                }
            }
        }
    }
}

  module pentagon() {
   linear_extrude(height=120, center = true) {
       
     pentagon_base ();
       
   }
 }

 module pentagon_base() {
   polygon([[-2.5,-3],[2.5,-3],[4,0],[0,2.5],[-4,0]]);

 }


// Lampshade
difference(){
    sphere(50.5);
    sphere(48.5);
    cylinder(r=42.5,h=100);
    africa();
    p();
    }