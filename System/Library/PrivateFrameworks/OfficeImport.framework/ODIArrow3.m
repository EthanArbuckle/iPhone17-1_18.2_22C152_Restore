@interface ODIArrow3
+ (BOOL)mapIdentifier:(id)a3 state:(id)a4;
+ (id)pointAtIndex:(unsigned int)a3 points:(id)a4;
@end

@implementation ODIArrow3

+ (BOOL)mapIdentifier:(id)a3 state:(id)a4
{
  id v6 = a4;
  char v7 = [a3 isEqualToString:@"arrow3"];
  if (v7)
  {
    v29 = [v6 diagram];
    v28 = [v29 documentPoint];
    v8 = [v28 children];
    unint64_t v9 = [v8 count];
    v31 = [a1 pointAtIndex:0 points:v8];
    v30 = [a1 pointAtIndex:1 points:v8];
    +[ODIDrawable sizeOfDiagram:v29];
    float v12 = v11 / v10;
    objc_msgSend(v6, "setLogicalBounds:maintainAspectRatio:", 0, 0.0, 0.0, 1.0, v12);
    uint64_t v13 = +[ODIDrawable shapeGeometryForRightArrowWithControlPoint:](ODIDrawable, "shapeGeometryForRightArrowWithControlPoint:", 0.349999994, 0.25);
    LODWORD(v14) = -1014562816;
    v27 = (void *)v13;
    v26 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v13, v6, 0.119999997, (float)(v12 * 0.05), (float)(v12 * 0.41), 0.310000002, v14);
    +[ODIDrawable mapStyleForPresentationName:@"downArrow" point:v31 shape:v26 state:v6];
    v15 = +[ODIDrawable shapeGeometryForRightArrowWithControlPoint:](ODIDrawable, "shapeGeometryForRightArrowWithControlPoint:", 0.349999994, 0.25);
    LODWORD(v16) = -1028390912;
    v17 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v15, v6, 0.569999993, (float)(v12 * 0.54), (float)(v12 * 0.41), 0.310000002, v16);
    +[ODIDrawable mapStyleForPresentationName:@"upArrow" point:v30 shape:v17 state:v6];
    if (v9)
    {
      v18 = +[ODIDrawable shapeGeometryForRectangle];
      v19 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v18, v6, 0.529999971, 0.0, 0.319999993, (float)(v12 * 0.43), 0.0);

      [v6 setPresentationName:@"downArrowText" forPointType:2];
      +[ODIDrawable mapStyleFromPoint:v31 shape:v19 state:v6];
      +[ODIText mapTextFromPoint:v31 toShape:v19 isCentered:1 includeChildren:1 state:v6];

      if (v9 >= 2)
      {
        v20 = +[ODIDrawable shapeGeometryForRectangle];
        v21 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v20, v6, 0.150000006, (float)(v12 * 0.57), 0.319999993, (float)(v12 * 0.43), 0.0);

        [v6 setPresentationName:@"upArrowText" forPointType:2];
        +[ODIDrawable mapStyleFromPoint:v30 shape:v21 state:v6];
        +[ODIText mapTextFromPoint:v30 toShape:v21 isCentered:1 includeChildren:1 state:v6];
      }
    }
    v22 = +[ODIDrawable shapeGeometryForRectangle];
    *(float *)&double v23 = v12 * -4.96;
    v24 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v22, v6, 0.140000001, (float)(v12 * 0.457), 0.72, (float)(v12 * 0.023), v23);

    +[ODIDrawable mapStyleForPresentationName:@"divider" point:v28 shape:v24 state:v6];
  }

  return v7;
}

+ (id)pointAtIndex:(unsigned int)a3 points:(id)a4
{
  id v5 = a4;
  if ([v5 count] <= (unint64_t)a3)
  {
    id v6 = objc_alloc_init(ODDNodePoint);
    [(ODDNodePoint *)v6 setType:2];
  }
  else
  {
    id v6 = [v5 objectAtIndex:a3];
  }

  return v6;
}

@end