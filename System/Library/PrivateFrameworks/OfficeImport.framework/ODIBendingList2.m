@interface ODIBendingList2
+ (void)mapWithState:(id)a3;
@end

@implementation ODIBendingList2

+ (void)mapWithState:(id)a3
{
  id v40 = a3;
  v4 = [v40 diagram];
  v5 = [v4 documentPoint];
  v6 = [v5 children];
  uint64_t v7 = [v6 count];

  unsigned int v36 = objc_msgSend(a1, "mapLogicalBoundsWithShapeSize:spaceSize:maxNodeCount:maxColumnCount:state:", 0xFFFFFFFFLL, 0xFFFFFFFFLL, v40);
  v8 = [v40 diagram];
  v9 = [v8 documentPoint];
  v39 = [v9 children];
  unint64_t v10 = v7 + v36 - 1;

  if (v10 >= v36)
  {
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    unint64_t v38 = v10 / v36 - 1;
    double v37 = (double)(v10 / v36 * v36 - v7) * 0.5;
    if (v10 / v36 <= 1) {
      unint64_t v13 = 1;
    }
    else {
      unint64_t v13 = v10 / v36;
    }
    uint64_t v34 = -v7;
    unint64_t v35 = v13;
    uint64_t v33 = 0x3FA8F5C23F7851ECLL;
    do
    {
      if (v36)
      {
        unint64_t v14 = 0;
        float v15 = (float)v12 * *((float *)&v33 + 1);
        double v16 = v15;
        double v17 = (float)(v15 + *(float *)&v33);
        uint64_t v18 = v34 + v11;
        do
        {
          if (!(v18 + v14)) {
            break;
          }
          v19 = [v39 objectAtIndex:v11 + v14];
          if (v12 == v38)
          {
            float v20 = (float)((float)v14 * 1.17) + v37 * 1.16999996;
            float v21 = v20;
          }
          else
          {
            float v21 = (float)v14 * 1.17;
          }
          v22 = +[ODIDrawable shapeGeometryForRectangle];
          v23 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v22, v40, v21, v16, 1.0, 1.06999993, 0.0);

          +[ODIDrawable mapStyleAndTextFromPoint:v19 shape:v23 state:v40];
          double v24 = TSURectWithCenterAndSize((float)(v21 + 0.9), v17, 0.340000004);
          double v26 = v25;
          double v28 = v27;
          double v30 = v29;
          v31 = +[ODIDrawable shapeGeometryForEllipse];
          v32 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v31, v40, v24, v26, v28, v30, 0.0);

          +[ODIDrawable mapStyleForPresentationName:@"adorn" point:v19 shape:v32 state:v40];
          ++v14;
        }
        while (v36 != v14);
      }
      ++v12;
      v11 += v36;
    }
    while (v12 != v35);
  }
}

@end