@interface CRLPathSourceCommandHelper
+ (double)adjustedCalloutTailPositionXWithValue:(double)a3 isAnchoredAtRight:(BOOL)a4 layoutGeometry:(id)a5;
+ (id)commandForSettingArrowHead:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6;
+ (id)commandForSettingArrowHead:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5;
+ (id)commandForSettingArrowIndent:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6;
+ (id)commandForSettingArrowIndent:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5;
+ (id)commandForSettingCalloutCornerRadius:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6;
+ (id)commandForSettingCalloutCornerRadius:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5;
+ (id)commandForSettingCalloutTailPositionX:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6 isAnchoredAtRight:(BOOL)a7 layoutGeometry:(id)a8;
+ (id)commandForSettingCalloutTailPositionX:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5 isAnchoredAtRight:(BOOL)a6 layoutGeometry:(id)a7;
+ (id)commandForSettingCalloutTailPositionY:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6;
+ (id)commandForSettingCalloutTailPositionY:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5;
+ (id)commandForSettingCalloutTailSize:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6;
+ (id)commandForSettingCalloutTailSize:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5;
+ (id)commandForSettingCornerRadius:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6;
+ (id)commandForSettingCornerRadius:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5;
+ (id)commandForSettingNumberOfSides:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6;
+ (id)commandForSettingNumberOfSides:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5;
+ (id)commandForSettingStarPoints:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6;
+ (id)commandForSettingStarPoints:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5;
+ (id)commandForSettingStarRadius:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6;
+ (id)commandForSettingStarRadius:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5;
+ (id)p_calloutPathSourceForCommandWithPathSource:(id)a3;
+ (id)p_commandForSettingPathSourcePointValue:(CGPoint)a3 onPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6;
+ (id)p_commandForSettingPathSourcePointValue:(CGPoint)a3 onPathSource:(id)a4 shapeItem:(id)a5;
+ (id)p_commandToSetPathSourceScalarValue:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6;
+ (id)p_commandToSetPathSourceScalarValue:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5;
@end

@implementation CRLPathSourceCommandHelper

+ (double)adjustedCalloutTailPositionXWithValue:(double)a3 isAnchoredAtRight:(BOOL)a4 layoutGeometry:(id)a5
{
  if (a4)
  {
    [a5 frame];
    return v6 - a3;
  }
  return a3;
}

+ (id)commandForSettingCornerRadius:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5
{
  return [a1 p_commandToSetPathSourceScalarValue:a4 withPathSource:a5 shapeItem:a3];
}

+ (id)commandForSettingNumberOfSides:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5
{
  return _objc_msgSend(a1, "p_commandToSetPathSourceScalarValue:withPathSource:shapeItem:", a4, a5, a3);
}

+ (id)commandForSettingStarPoints:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = objc_opt_class();
  v11 = sub_1002469D0(v10, v9);

  [v11 point];
  v12 = [a1 p_commandForSettingPathSourcePointValue:v11 onPathSource:v8 shapeItem:a3];

  return v12;
}

+ (id)commandForSettingStarRadius:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = sub_1002469D0(v9, v8);

  [v10 point];
  v11 = [a1 p_commandForSettingPathSourcePointValue:v10 onPathSource:v7 shapeItem:nil];

  return v11;
}

+ (id)commandForSettingArrowHead:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = objc_opt_class();
  v11 = sub_1002469D0(v10, v9);

  [v11 point];
  v12 = [a1 p_commandForSettingPathSourcePointValue:v11 onPathSource:v8 shapeItem:a3];

  return v12;
}

+ (id)commandForSettingArrowIndent:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = sub_1002469D0(v9, v8);

  [v10 point];
  v11 = [a1 p_commandForSettingPathSourcePointValue:v10 onPathSource:v7 shapeItem:nil];

  return v11;
}

+ (id)commandForSettingCalloutCornerRadius:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [a1 p_calloutPathSourceForCommandWithPathSource:a4];
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 setCornerRadius:a3];
    v11 = [[_TtC8Freeform23CRLCommandSetPathSource alloc] initWithShapeItem:v8 pathSource:v10];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)commandForSettingCalloutTailSize:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [a1 p_calloutPathSourceForCommandWithPathSource:a4];
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 setTailSize:a3];
    v11 = [[_TtC8Freeform23CRLCommandSetPathSource alloc] initWithShapeItem:v8 pathSource:v10];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)commandForSettingCalloutTailPositionX:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5 isAnchoredAtRight:(BOOL)a6 layoutGeometry:(id)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a7;
  v14 = [a1 p_calloutPathSourceForCommandWithPathSource:a4];
  v15 = v14;
  if (v14)
  {
    [v14 tailKnobPosition];
    [a1 adjustedCalloutTailPositionXWithValue:v8 isAnchoredAtRight:v13 layoutGeometry:a3];
    [v15 setTailKnobPosition:];
    v16 = [[_TtC8Freeform23CRLCommandSetPathSource alloc] initWithShapeItem:v12 pathSource:v15];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)commandForSettingCalloutTailPositionY:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5
{
  id v7 = a5;
  BOOL v8 = [a1 p_calloutPathSourceForCommandWithPathSource:a4];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 tailKnobPosition];
    [v9 setTailKnobPosition:];
    uint64_t v10 = [[_TtC8Freeform23CRLCommandSetPathSource alloc] initWithShapeItem:v7 pathSource:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)commandForSettingCornerRadius:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6
{
  return _objc_msgSend(a1, "p_commandToSetPathSourceScalarValue:withPathSource:imageItem:maskLayout:", a4, a5, a6, a3);
}

+ (id)commandForSettingNumberOfSides:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6
{
  return _objc_msgSend(a1, "p_commandToSetPathSourceScalarValue:withPathSource:imageItem:maskLayout:", a4, a5, a6, a3);
}

+ (id)commandForSettingStarPoints:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = objc_opt_class();
  v14 = sub_1002469D0(v13, v12);

  [v14 point];
  v15 = [a1 p_commandForSettingPathSourcePointValue:v14 onPathSource:v11 imageItem:v10 maskLayout:a3];

  return v15;
}

+ (id)commandForSettingStarRadius:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = sub_1002469D0(v12, v11);

  [v13 point];
  v14 = [a1 p_commandForSettingPathSourcePointValue:v13 onPathSource:v10 imageItem:v9 maskLayout:];

  return v14;
}

+ (id)commandForSettingArrowHead:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = objc_opt_class();
  v14 = sub_1002469D0(v13, v12);

  [v14 point];
  v15 = [a1 p_commandForSettingPathSourcePointValue:v14 onPathSource:v11 imageItem:v10 maskLayout:a3];

  return v15;
}

+ (id)commandForSettingArrowIndent:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = sub_1002469D0(v12, v11);

  [v13 point];
  v14 = [a1 p_commandForSettingPathSourcePointValue:v13 onPathSource:v10 imageItem:v9 maskLayout:];

  return v14;
}

+ (id)commandForSettingCalloutCornerRadius:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [a1 p_calloutPathSourceForCommandWithPathSource:a4];
  uint64_t v13 = v12;
  if (v12)
  {
    [v12 setCornerRadius:a3];
    v14 = [CRLMaskInfo alloc];
    v15 = [v11 infoGeometry];
    v16 = [(CRLMaskInfo *)v14 initWithImageItem:v10 geometry:v15 pathSource:v13];

    v17 = [[_TtC8Freeform17CRLCommandSetMask alloc] initWithImageItem:v10 maskInfo:v16];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)commandForSettingCalloutTailSize:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [a1 p_calloutPathSourceForCommandWithPathSource:a4];
  uint64_t v13 = v12;
  if (v12)
  {
    [v12 setTailSize:a3];
    v14 = [CRLMaskInfo alloc];
    v15 = [v11 infoGeometry];
    v16 = [(CRLMaskInfo *)v14 initWithImageItem:v10 geometry:v15 pathSource:v13];

    v17 = [[_TtC8Freeform17CRLCommandSetMask alloc] initWithImageItem:v10 maskInfo:v16];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)commandForSettingCalloutTailPositionX:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6 isAnchoredAtRight:(BOOL)a7 layoutGeometry:(id)a8
{
  BOOL v9 = a7;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  v17 = [a1 p_calloutPathSourceForCommandWithPathSource:a4];
  v18 = v17;
  if (v17)
  {
    [v17 tailKnobPosition];
    [a1 adjustedCalloutTailPositionXWithValue:v9 isAnchoredAtRight:v16 layoutGeometry:a3];
    [v18 setTailKnobPosition:];
    v19 = [CRLMaskInfo alloc];
    v20 = [v15 infoGeometry];
    v21 = [(CRLMaskInfo *)v19 initWithImageItem:v14 geometry:v20 pathSource:v18];

    v22 = [[_TtC8Freeform17CRLCommandSetMask alloc] initWithImageItem:v14 maskInfo:v21];
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)commandForSettingCalloutTailPositionY:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = [a1 p_calloutPathSourceForCommandWithPathSource:a4];
  uint64_t v12 = v11;
  if (v11)
  {
    [v11 tailKnobPosition];
    [v12 setTailKnobPosition:];
    uint64_t v13 = [CRLMaskInfo alloc];
    id v14 = [v10 infoGeometry];
    id v15 = [(CRLMaskInfo *)v13 initWithImageItem:v9 geometry:v14 pathSource:v12];

    id v16 = [[_TtC8Freeform17CRLCommandSetMask alloc] initWithImageItem:v9 maskInfo:v15];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (id)p_commandToSetPathSourceScalarValue:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = objc_opt_class();
  id v10 = sub_1002469D0(v9, v8);

  if (v10)
  {
    id v11 = [v10 copy];
    [v11 setScalar:a3];
    uint64_t v12 = [[_TtC8Freeform23CRLCommandSetPathSource alloc] initWithShapeItem:v7 pathSource:v11];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)p_commandForSettingPathSourcePointValue:(CGPoint)a3 onPathSource:(id)a4 shapeItem:(id)a5
{
  v5 = (_TtC8Freeform23CRLCommandSetPathSource *)a4;
  if (a4)
  {
    double y = a3.y;
    double x = a3.x;
    id v8 = a5;
    id v9 = [(CRLCommandSetPathSource *)v5 copy];
    [v9 setPoint:x, y];
    v5 = [[_TtC8Freeform23CRLCommandSetPathSource alloc] initWithShapeItem:v8 pathSource:v9];
  }

  return v5;
}

+ (id)p_commandToSetPathSourceScalarValue:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = a4;
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = sub_1002469D0(v12, v11);

  if (v13)
  {
    id v14 = [v13 copy];
    [v14 setScalar:a3];
    id v15 = [v10 maskInfo];
    id v16 = [v15 mutableCopy];

    [v16 setPathSource:v14];
    v17 = [[_TtC8Freeform17CRLCommandSetMask alloc] initWithImageItem:v9 maskInfo:v16];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)p_commandForSettingPathSourcePointValue:(CGPoint)a3 onPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6
{
  double v6 = (_TtC8Freeform17CRLCommandSetMask *)a4;
  if (a4)
  {
    double y = a3.y;
    double x = a3.x;
    id v10 = a6;
    id v11 = a5;
    id v12 = [(CRLCommandSetMask *)v6 copy];
    [v12 setPoint:x, y];
    uint64_t v13 = [_TtC8Freeform17CRLCommandSetMask alloc];
    id v14 = [v10 infoGeometry];

    double v6 = [(CRLCommandSetMask *)v13 initWithImageItem:v11 maskGeometry:v14 maskPath:v12];
  }

  return v6;
}

+ (id)p_calloutPathSourceForCommandWithPathSource:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  v5 = sub_1002469D0(v4, v3);

  if (v5) {
    id v6 = [v5 copy];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

@end