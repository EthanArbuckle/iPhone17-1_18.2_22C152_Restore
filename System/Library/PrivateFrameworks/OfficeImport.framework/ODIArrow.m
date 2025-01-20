@interface ODIArrow
+ (BOOL)mapIdentifier:(id)a3 state:(id)a4;
+ (unint64_t)nodeCountWithState:(id)a3;
+ (void)mapWithState:(id)a3 outward:(BOOL)a4;
@end

@implementation ODIArrow

+ (BOOL)mapIdentifier:(id)a3 state:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 isEqualToString:@"arrow1"] & 1) != 0
    || ([v5 isEqualToString:@"arrow6"] & 1) != 0)
  {
    uint64_t v7 = 1;
  }
  else
  {
    int v10 = [v5 isEqualToString:@"arrow5"];
    uint64_t v7 = 0;
    BOOL v8 = 0;
    if (!v10) {
      goto LABEL_5;
    }
  }
  +[ODIArrow mapWithState:v6 outward:v7];
  BOOL v8 = 1;
LABEL_5:

  return v8;
}

+ (unint64_t)nodeCountWithState:(id)a3
{
  v3 = [a3 diagram];
  v4 = [v3 documentPoint];
  id v5 = [v4 children];
  unint64_t v6 = [v5 count];

  return v6;
}

+ (void)mapWithState:(id)a3 outward:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unint64_t v7 = [a1 nodeCountWithState:v6];
  BOOL v8 = [v6 diagram];
  v9 = [v8 documentPoint];
  int v10 = [v9 children];

  if (v7 == 2)
  {
    objc_msgSend(v6, "setLogicalBounds:", TSURectWithCenterAndSize(*MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), 2.0999999));
    uint64_t v15 = 0;
    char v16 = 1;
    do
    {
      char v17 = v16;
      v18 = [v10 objectAtIndex:v15];
      double v19 = TSURectWithCenterAndSize((float)((float)(2 * v15 - 1) * 0.55), 0.0, 1.0);
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      v26 = +[ODIDrawable shapeGeometryForRightArrowWithControlPoint:](ODIDrawable, "shapeGeometryForRightArrowWithControlPoint:", 0.349999994, 0.25);
      int v28 = 180 * (v15 ^ 1);
      if (v4) {
        *(float *)&double v27 = (float)v28;
      }
      else {
        *(float *)&double v27 = (float)v28 + 180.0;
      }
      v29 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v26, v6, v19, v21, v23, v25, v27);
      +[ODIDrawable mapStyleAndTextFromPoint:v18 shape:v29 state:v6];

      char v16 = 0;
      uint64_t v15 = 1;
    }
    while ((v17 & 1) != 0);
  }
  else if (v7 == 1)
  {
    objc_msgSend(v6, "setLogicalBounds:", 0.0, 0.0, 1.0, 1.0);
    v11 = +[ODIDrawable shapeGeometryForRightArrowWithControlPoint:](ODIDrawable, "shapeGeometryForRightArrowWithControlPoint:", 0.349999994, 0.25);
    if (v4) {
      *(float *)&double v12 = -90.0;
    }
    else {
      *(float *)&double v12 = 90.0;
    }
    v13 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v11, v6, 0.0, 0.0, 1.0, 1.0, v12);
    v14 = [v10 objectAtIndex:0];
    +[ODIDrawable mapStyleAndTextFromPoint:v14 shape:v13 state:v6];
  }
  else
  {
    long double v30 = tan(2.82743331 / (double)v7);
    double v31 = v30 + v30;
    if (v4)
    {
      float v32 = 0.5 / v31;
      float v33 = 1.0 / v31 + -0.649999976;
      if (v32 >= v33) {
        float v33 = v32;
      }
    }
    else
    {
      float v33 = 1.0 / v31 + -0.349999994;
    }
    float v71 = v33;
    if (v7)
    {
      LODWORD(v34) = 0;
      double tx = v33;
      float v35 = 0.33;
      if (v4) {
        float v35 = 0.5;
      }
      float v73 = v35;
      float v36 = 0.66;
      if (!v4) {
        float v36 = 0.5;
      }
      float v72 = v36;
      unint64_t v37 = v7 - 3;
      float v38 = 0.0;
      double v39 = -0.5;
      float v40 = 0.0;
      do
      {
        float v41 = ((float)((float)((float)v34 + (float)v34) / (float)v7) + v39) * 3.14159265;
        memset(&v79, 0, sizeof(v79));
        CGAffineTransformMakeTranslation(&v79, tx, 0.0);
        memset(&v78, 0, sizeof(v78));
        CGAffineTransformMakeRotation(&v78, v41);
        CGAffineTransform t1 = v79;
        memset(&v77, 0, sizeof(v77));
        CGAffineTransform t2 = v78;
        CGAffineTransformConcat(&v77, &t1, &t2);
        float v42 = 0.0;
        if (v37 <= 3) {
          float v42 = flt_238EDC490[v37];
        }
        double v43 = v42;
        double v44 = (v77.tx + v77.a + v77.c * 0.0) * (float)(1.0 - v42);
        float v45 = v44 + v43 * (v77.tx + v77.a + v77.c * 0.25);
        if (v38 >= v45) {
          float v45 = v38;
        }
        float v46 = v44 + v43 * (v77.tx + v77.a - v77.c * 0.25);
        if (v45 >= v46) {
          float v38 = v45;
        }
        else {
          float v38 = v46;
        }
        if (v7 == 7)
        {
          float v47 = v73;
          double v39 = -0.5;
        }
        else
        {
          float v47 = 0.0;
          double v39 = -0.5;
          if (v7 == 5) {
            float v47 = v72;
          }
        }
        double v48 = v77.ty + v77.d * v39 + v77.b * 0.649999976;
        double v49 = v47;
        double v50 = (v77.ty + v77.b + v77.d * 0.0) * (float)(1.0 - v47);
        double v51 = v50 + v47 * (v77.ty + v77.b + v77.d * 0.25);
        if (v7 == 3) {
          double v51 = v77.ty + v77.d * 0.5 + v77.b * 0.649999976;
        }
        float v52 = v51;
        double v53 = v50 + v49 * (v77.ty + v77.b - v77.d * 0.25);
        if (v7 != 3) {
          double v48 = v53;
        }
        if (v40 >= v52) {
          float v54 = v40;
        }
        else {
          float v54 = v52;
        }
        float v55 = v48;
        if (v54 >= v55) {
          float v40 = v54;
        }
        else {
          float v40 = v55;
        }
        unint64_t v34 = (v34 + 1);
      }
      while (v7 > v34);
    }
    else
    {
      float v40 = 0.0;
      float v38 = 0.0;
    }
    objc_msgSend(v6, "setLogicalBounds:", (float)-v38, (float)-(float)(v71 + 1.0), (float)(v38 + v38), (float)((float)(v71 + 1.0) + v40));
    if (v7)
    {
      uint64_t v56 = 0;
      for (i = 0; i < v7; uint64_t v56 = ++i)
      {
        v58 = [v10 objectAtIndex:v56];
        float v59 = (double)i * 360.0 / (double)v7 + -90.0;
        __double2 v60 = __sincos_stret(v59 * 3.14159265 / 180.0);
        double v61 = TSURectWithCenterAndSize(v60.__cosval * (float)(v71 + 0.5), v60.__sinval * (float)(v71 + 0.5), 1.0);
        double v63 = v62;
        double v65 = v64;
        double v67 = v66;
        v68 = +[ODIDrawable shapeGeometryForRightArrowWithControlPoint:](ODIDrawable, "shapeGeometryForRightArrowWithControlPoint:", 0.349999994, 0.25);
        if (v4) {
          *(float *)&double v69 = (double)i * 360.0 / (double)v7 + -90.0;
        }
        else {
          *(float *)&double v69 = v59 + 180.0;
        }
        v70 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v68, v6, v61, v63, v65, v67, v69);
        +[ODIDrawable mapStyleAndTextFromPoint:v58 shape:v70 state:v6];
      }
    }
  }
}

@end