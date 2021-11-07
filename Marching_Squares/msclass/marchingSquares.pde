class MarchingSquares {

    float[] col;
    float[] row;
    float scale;
    int[][] bin_color;
    boolean brush = false;
    //constructor 
    MarchingSquares(int c, int r, int s) {
        col = new float[c];
        row = new float[r];
        scale = s;
        bin_color = new int[c * 2][r * 2];
    }


    
    void generateGrid() {
        float xval = 0;
        float yval = 0;
        float shift_val = scale;

        for (int i = 0; i < row.length; i++) {
            for (int k = 0; k < col.length; k++) {
                col[k] = xval;
                row[i] = yval;
                xval += shift_val;            
            }
            yval += shift_val;
            xval = 0;
        }
    }

    void staticGrid() {
        for (int i = 0; i < row.length; i++) {
            for (int k = 0; k < col.length; k++) {
                  bin_color[k][i] = int(random(1.5)) * 255;
                  strokeWeight(5);
                  stroke(bin_color[k][i]);
                  point(col[k], row[i]);
            }
        }
    }

    void point_status() {
        for (int i = 0; i < row.length; i++) {
            for (int k = 0; k < col.length; k++) {
                float x = col[k];
                float y = col[i];
                PVector a = new PVector(x + scale / 2, y);
                PVector b = new PVector(x + scale, y + scale / 2);
                PVector c = new PVector(x + scale / 2, y + scale);
                PVector d = new PVector(x, y + scale / 2);
                int status = calc_status(bin_color[k][i], bin_color[k + 1][i],
                    bin_color[k + 1][i + 1], bin_color[k][i + 1]);

                strokeWeight(2);
                stroke(255);
                // possible line combinations
                switch (status) {
                    case 0:
                        break;
                    case 1:                 
                        line(c.x, c.y, d.x, d.y);
                        break;
                    case 2:                      
                        line(b.x, b.y, c.x, c.y);
                        break;
                    case 3:                    
                        line(b.x, b.y, d.x, d.y);
                        break;
                    case 4:                      
                        line(b.x, b.y, a.x, a.y);
                        break;
                    case 5:                     
                        line(b.x, b.y, c.x, c.y);
                        line(d.x, d.y, a.x, a.y);
                        break;
                    case 6:               
                        line(c.x, c.y, a.x, a.y);
                        break;
                    case 7:
                        line(d.x, d.y, a.x, a.y);
                        break;
                    case 8:
                        line(d.x, d.y, a.x, a.y);
                        break;
                    case 9:
                        line(c.x, c.y, a.x, a.y);
                        break;
                    case 10:
                        line(c.x, c.y, d.x, d.y);
                        line(b.x, b.y, a.x, a.y);
                        break;
                    case 11:
                        line(b.x, b.y, a.x, a.y);
                        break;
                    case 12:
                        line(b.x, b.y, d.x, d.y);
                        break;
                    case 13:
                        line(b.x, b.y, c.x, c.y);
                        break;
                    case 14:
                        line(c.x, c.y, d.x, d.y);
                        break;
                    case 15:
                        break;
                }

            }
        }

    }
    // calculate case for line combinations
    int calc_status(int a, int b, int c, int d) {
        return (a * 8 + b * 4 + c * 2 + d * 1) / 255;
    }
    
    int x_print = 1;
    int y_print = 1;
    void animation(int frame) {
        if (frameCount % frame == 0) {
           
            // 2d printing animation
            if(x_print <= 22) 
            { x_print++;}
            else
            {y_print ++;
             x_print = 1;}
            
            if(y_print >= 24)
            {y_print = 1;}
                   
            for (int i = 0; i < row.length; i++) {
                for (int k = 0; k < col.length; k++) { 
                   bin_color[x_print][y_print] = int(random(2)) * 255;
                }
            }
        }
         point_status();
    }

    void brush(boolean brush, int size) {
        noFill();
        stroke(255, 0, 0);
        rect(mouseX, mouseY, size, size);

        for (int i = 0; i < row.length; i++) {
            for (int k = 0; k < col.length; k++) {

                if (col[k] > mouseX && col[k] < mouseX + size && row[i] > mouseY && row[i] < mouseY + size && brush == true) {
                    bin_color[k][i] = 255;
                } else {
                    // binary_col[k][i] = 0;
                }
                strokeWeight(5);
                stroke(bin_color[k][i]);
                point(col[k], row[i]);

            }
        }
        point_status();
    }
}
