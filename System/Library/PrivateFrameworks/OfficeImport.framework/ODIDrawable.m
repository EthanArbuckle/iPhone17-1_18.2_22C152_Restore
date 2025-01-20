@interface ODIDrawable
+ (CGSize)sizeOfDiagram:(id)a3;
+ (id)addShapeWithBounds:(CGRect)a3 rotation:(float)a4 geometry:(id)a5 state:(id)a6;
+ (id)presentationWithName:(id)a3 point:(id)a4;
+ (id)shapeGeometryForBezierPath:(id)a3 gSpace:(CGRect)a4;
+ (id)shapeGeometryForDoubleArrowWithControlPoint:(CGPoint)a3;
+ (id)shapeGeometryForEllipse;
+ (id)shapeGeometryForRectangle;
+ (id)shapeGeometryForRightArrowWithControlPoint:(CGPoint)a3;
+ (id)shapeGeometryForRoundedRectangleWithRadius:(float)a3;
+ (id)shapeGeometryWithShapeType:(int)a3 adjustValues:(const int *)a4;
+ (id)styleForLabelName:(id)a3 styleCount:(int)a4 styleIndex:(int)a5 state:(id)a6;
+ (id)styleForPresentation:(id)a3 point:(id)a4 state:(id)a5;
+ (void)addArrowHeadToShapeProperties:(id)a3;
+ (void)map1dArrowStyleFromPoint:(id)a3 shape:(id)a4 state:(id)a5;
+ (void)map1dArrowStyleToShape:(id)a3 state:(id)a4;
+ (void)mapShapeProperties:(id)a3 shape:(id)a4 state:(id)a5;
+ (void)mapShapeProperties:(id)a3 shapeStyle:(id)a4 shape:(id)a5 state:(id)a6;
+ (void)mapStyleAndTextFromPoint:(id)a3 shape:(id)a4 state:(id)a5;
+ (void)mapStyleForLabelName:(id)a3 point:(id)a4 shape:(id)a5 state:(id)a6;
+ (void)mapStyleForLabelName:(id)a3 shape:(id)a4 state:(id)a5;
+ (void)mapStyleForPresentationName:(id)a3 point:(id)a4 shape:(id)a5 state:(id)a6;
+ (void)mapStyleFromPoint:(id)a3 shape:(id)a4 state:(id)a5;
@end

@implementation ODIDrawable

+ (id)shapeGeometryForRectangle
{
  v2 = objc_alloc_init(OADPresetShapeGeometry);
  [(OADPresetShapeGeometry *)v2 setType:1];
  return v2;
}

+ (id)shapeGeometryForEllipse
{
  v2 = objc_alloc_init(OADPresetShapeGeometry);
  [(OADPresetShapeGeometry *)v2 setType:3];
  return v2;
}

+ (id)shapeGeometryForRoundedRectangleWithRadius:(float)a3
{
  v4 = objc_alloc_init(OADPresetShapeGeometry);
  [(OADPresetShapeGeometry *)v4 setType:2];
  [(OADShapeGeometry *)v4 setIsEscher:1];
  [(OADShapeGeometry *)v4 setAdjustValue:(int)(float)(a3 * 21600.0) atIndex:0];
  return v4;
}

+ (id)shapeGeometryForRightArrowWithControlPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = objc_alloc_init(OADPresetShapeGeometry);
  [(OADPresetShapeGeometry *)v5 setType:13];
  [(OADShapeGeometry *)v5 setIsEscher:1];
  [(OADShapeGeometry *)v5 setAdjustValue:(int)((1.0 - x) * 21600.0) atIndex:0];
  [(OADShapeGeometry *)v5 setAdjustValue:(int)(y * 21600.0) atIndex:1];
  return v5;
}

+ (id)shapeGeometryForDoubleArrowWithControlPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = objc_alloc_init(OADPresetShapeGeometry);
  [(OADPresetShapeGeometry *)v5 setType:69];
  [(OADShapeGeometry *)v5 setIsEscher:1];
  [(OADShapeGeometry *)v5 setAdjustValue:(int)(x * 21600.0) atIndex:0];
  [(OADShapeGeometry *)v5 setAdjustValue:(int)(y * 21600.0) atIndex:1];
  return v5;
}

+ (id)shapeGeometryWithShapeType:(int)a3 adjustValues:(const int *)a4
{
  uint64_t v5 = *(void *)&a3;
  v6 = objc_alloc_init(OADPresetShapeGeometry);
  [(OADPresetShapeGeometry *)v6 setType:v5];
  if (a4)
  {
    for (uint64_t i = 0; ; ++i)
    {
      uint64_t v8 = a4[i];
      if (v8 != -559038738)
      {
        if (v8 == -559038737) {
          break;
        }
        [(OADShapeGeometry *)v6 setAdjustValue:v8 atIndex:i];
      }
    }
  }
  return v6;
}

+ (id)shapeGeometryForBezierPath:(id)a3 gSpace:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v31[6] = *(double *)MEMORY[0x263EF8340];
  id v8 = a3;
  if (width >= height) {
    double v9 = width;
  }
  else {
    double v9 = height;
  }
  v10 = objc_alloc_init(OADCustomShapeGeometry);
  double v11 = 21600.0 / v9;
  CGFloat v12 = height * (21600.0 / v9);
  CGFloat v13 = width * (21600.0 / v9);
  CGFloat v14 = y * (21600.0 / v9);
  CGFloat v15 = x * (21600.0 / v9);
  v33.origin.double x = v15;
  v33.origin.double y = v14;
  v33.size.double width = v13;
  v33.size.double height = v12;
  double MinX = CGRectGetMinX(v33);
  v34.origin.double x = v15;
  v34.origin.double y = v14;
  v34.size.double width = v13;
  v34.size.double height = v12;
  double MinY = CGRectGetMinY(v34);
  v35.origin.double x = v15;
  v35.origin.double y = v14;
  v35.size.double width = v13;
  v35.size.double height = v12;
  double MaxX = CGRectGetMaxX(v35);
  v36.origin.double x = v15;
  v36.origin.double y = v14;
  v36.size.double width = v13;
  v36.size.double height = v12;
  v30[0] = (int)MinX;
  v30[1] = (int)MinY;
  v30[2] = (int)MaxX;
  v30[3] = (int)CGRectGetMaxY(v36);
  [(OADCustomShapeGeometry *)v10 setGeometryCoordSpace:v30];
  [(OADShapeGeometry *)v10 setIsEscher:1];
  v19 = 0;
  uint64_t v20 = [v8 elementCount];
  if (v20)
  {
    uint64_t v21 = 0;
    while (2)
    {
      if (!v19)
      {
        v19 = objc_alloc_init(OADPath);
        [(OADCustomShapeGeometry *)v10 addPath:v19];
      }
      uint64_t v22 = [v8 elementAtIndex:v21 associatedPoints:v31];
      unint64_t v23 = (unint64_t)(int)(v11 * v31[0]) << 32;
      unint64_t v24 = (unint64_t)(int)(v11 * v31[1]) << 32;
      v25 = off_264D60528;
      switch(v22)
      {
        case 0:
          goto LABEL_10;
        case 1:
          v25 = off_264D60520;
LABEL_10:
          v26 = (OADCubicBezierToPathElement *)objc_msgSend(objc_alloc(*v25), "initWithToPoint:", v23, v24);
          goto LABEL_12;
        case 2:
          v26 = -[OADCubicBezierToPathElement initWithControlPoint1:controlPoint2:toPoint:]([OADCubicBezierToPathElement alloc], "initWithControlPoint1:controlPoint2:toPoint:", v23, v24, (unint64_t)(int)(v11 * v31[2]) << 32, (unint64_t)(int)(v11 * v31[3]) << 32, (unint64_t)(int)(v11 * v31[4]) << 32, (unint64_t)(int)(v11 * v31[5]) << 32);
LABEL_12:
          v27 = v26;
          if (v26) {
            [(OADPath *)v19 addElement:v26];
          }
          goto LABEL_16;
        case 3:
          v28 = objc_alloc_init(OADClosePathElement);
          [(OADPath *)v19 addElement:v28];

          v19 = 0;
          goto LABEL_15;
        default:
LABEL_15:
          v27 = 0;
LABEL_16:

          if (v20 == ++v21) {
            break;
          }
          continue;
      }
      break;
    }
  }

  return v10;
}

+ (CGSize)sizeOfDiagram:(id)a3
{
  v3 = +[OAITOrientedBounds relativeOrientedBoundsOfDrawable:a3];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

+ (id)addShapeWithBounds:(CGRect)a3 rotation:(float)a4 geometry:(id)a5 state:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a5;
  id v13 = a6;
  CGFloat v14 = objc_alloc_init(OADShape);
  CGFloat v15 = [v13 group];
  [v15 addChild:v14];

  [v13 scale];
  double v17 = v16;
  v18 = [OADOrientedBounds alloc];
  *(float *)&double v19 = a4;
  uint64_t v20 = -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](v18, "initWithBounds:rotation:flipX:flipY:", 0, 0, x * v17, y * v17, width * v17, height * v17, v19);
  uint64_t v21 = [(OADDrawable *)v14 drawableProperties];
  [v21 setOrientedBounds:v20];

  [(OADShape *)v14 setGeometry:v12];
  return v14;
}

+ (void)mapStyleFromPoint:(id)a3 shape:(id)a4 state:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_msgSend(v9, "presentationNameForPointType:", objc_msgSend(v17, "type"));
  double v11 = [a1 presentationWithName:v10 point:v17];
  id v12 = [a1 styleForPresentation:v11 point:v17 state:v9];
  [v9 setTextStyle:v12];
  id v13 = [v17 shapeProperties];
  CGFloat v14 = [v9 drawingTheme];
  CGFloat v15 = [v14 styleMatrix];

  if (v11)
  {
    double v16 = [v11 shapeProperties];
    [v12 applyToGraphicProperties:v16 styleMatrix:v15];
    [v13 setParent:v16];
  }
  else
  {
    [v12 applyToGraphicProperties:v13 styleMatrix:v15];
  }
  [a1 mapShapeProperties:v13 shape:v8 state:v9];
}

+ (void)mapStyleForPresentationName:(id)a3 point:(id)a4 shape:(id)a5 state:(id)a6
{
  id v16 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [a1 presentationWithName:a3 point:v16];
  id v13 = [a1 styleForPresentation:v12 point:v16 state:v11];
  if (v12)
  {
    CGFloat v14 = [v12 shapeProperties];
  }
  else
  {
    CGFloat v14 = objc_alloc_init(OADShapeProperties);
  }
  CGFloat v15 = v14;
  [a1 mapShapeProperties:v14 shapeStyle:v13 shape:v10 state:v11];
}

+ (void)mapStyleForLabelName:(id)a3 shape:(id)a4 state:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(OADShapeProperties);
  id v11 = objc_msgSend(a1, "styleForLabelName:styleCount:styleIndex:state:", v12, objc_msgSend(v9, "pointCount"), objc_msgSend(v9, "pointIndex"), v9);
  [a1 mapShapeProperties:v10 shapeStyle:v11 shape:v8 state:v9];
}

+ (void)mapStyleForLabelName:(id)a3 point:(id)a4 shape:(id)a5 state:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_msgSend(a1, "styleForLabelName:styleCount:styleIndex:state:", v15, objc_msgSend(v12, "pointCount"), objc_msgSend(v12, "pointIndex"), v12);
  [v12 setTextStyle:v13];
  CGFloat v14 = [v10 shapeProperties];
  [a1 mapShapeProperties:v14 shapeStyle:v13 shape:v11 state:v12];
}

+ (void)map1dArrowStyleFromPoint:(id)a3 shape:(id)a4 state:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_msgSend(v9, "presentationNameForPointType:", objc_msgSend(v16, "type"));
  id v11 = [a1 presentationWithName:v10 point:v16];
  id v12 = [a1 styleForPresentation:v11 point:v16 state:v9];
  id v13 = [v16 shapeProperties];
  CGFloat v14 = [v9 drawingTheme];
  id v15 = [v14 styleMatrix];
  [v12 applyToGraphicProperties:v13 styleMatrix:v15];

  [a1 addArrowHeadToShapeProperties:v13];
  [v9 setTextStyle:v12];
  [a1 mapShapeProperties:v13 shape:v8 state:v9];
}

+ (void)map1dArrowStyleToShape:(id)a3 state:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  double v7 = objc_alloc_init(OADShapeProperties);
  id v8 = objc_msgSend(a1, "styleForLabelName:styleCount:styleIndex:state:", @"sibTrans1D1", objc_msgSend(v6, "pointCount"), objc_msgSend(v6, "pointIndex"), v6);
  id v9 = [v6 drawingTheme];
  id v10 = [v9 styleMatrix];
  [v8 applyToGraphicProperties:v7 styleMatrix:v10];

  [a1 addArrowHeadToShapeProperties:v7];
  [a1 mapShapeProperties:v7 shape:v11 state:v6];
}

+ (void)mapStyleAndTextFromPoint:(id)a3 shape:(id)a4 state:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  [a1 mapStyleFromPoint:v11 shape:v8 state:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v11 text];

    if (v10) {
      +[ODIText mapTextFromPoint:v11 toShape:v8 isCentered:1 includeChildren:1 state:v9];
    }
  }
}

+ (id)presentationWithName:(id)a3 point:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v6 presentations];
  id v8 = v7;
  if (v5)
  {
    id v9 = [v7 objectEnumerator];
    while (1)
    {
      id v10 = [v9 nextObject];
      id v11 = v10;
      if (!v10)
      {

        goto LABEL_7;
      }
      id v12 = [v10 propertySet];
      id v13 = [v12 presentationName];
      int v14 = [v5 isEqualToString:v13];

      if (v14) {
        break;
      }
    }
  }
  else
  {
LABEL_7:
    if ([v8 count])
    {
      id v11 = [v8 objectAtIndex:0];
    }
    else
    {
      id v11 = 0;
    }
  }

  return v11;
}

+ (id)styleForPresentation:(id)a3 point:(id)a4 state:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8
    || ([v8 propertySet],
        id v11 = objc_claimAutoreleasedReturnValue(),
        [v11 presentationStyleLabel],
        id v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v11 presentationStyleCount],
        uint64_t v14 = [v11 presentationStyleIndex],
        v11,
        !v12))
  {
    uint64_t v15 = objc_msgSend(v10, "defaultStyleLabelNameForPointType:", objc_msgSend(v9, "type"));
    uint64_t v13 = [v10 pointCount];
    uint64_t v14 = [v10 pointIndex];
    id v12 = (void *)v15;
  }
  id v16 = [a1 styleForLabelName:v12 styleCount:v13 styleIndex:v14 state:v10];

  return v16;
}

+ (id)styleForLabelName:(id)a3 styleCount:(int)a4 styleIndex:(int)a5 state:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v9 = a3;
  id v10 = a6;
  id v11 = [v10 diagram];
  id v12 = [v11 styleDefinition];
  uint64_t v13 = [v12 labelForName:v9];
  uint64_t v14 = [v13 shapeStyle];

  if (v14)
  {
    uint64_t v15 = [v11 colorTransform];
    id v16 = [v15 labelForName:v9];

    if (v16)
    {
      uint64_t v17 = [v14 copy];

      uint64_t v14 = (void *)v17;
      [v16 applyToShapeStyle:v17 index:v7 count:v8 state:v10];
    }
  }
  return v14;
}

+ (void)mapShapeProperties:(id)a3 shapeStyle:(id)a4 shape:(id)a5 state:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v12 drawingTheme];
  uint64_t v14 = [v13 styleMatrix];
  [v10 applyToGraphicProperties:v15 styleMatrix:v14];

  [a1 mapShapeProperties:v15 shape:v11 state:v12];
}

+ (void)mapShapeProperties:(id)a3 shape:(id)a4 state:(id)a5
{
  id v10 = a3;
  id v6 = [a4 shapeProperties];
  if (v6 != v10)
  {
    uint64_t v7 = [v10 fill];
    [v6 setFill:v7];

    uint64_t v8 = [v10 stroke];
    [v6 setStroke:v8];

    id v9 = [v10 effects];
    [v6 setEffects:v9];
  }
}

+ (void)addArrowHeadToShapeProperties:(id)a3
{
  id v6 = a3;
  v3 = [v6 stroke];
  double v4 = (void *)[v3 copy];

  [v6 setStroke:v4];
  id v5 = [[OADLineEnd alloc] initWithType:1 width:1 length:1];
  [v4 setHead:v5];
}

@end