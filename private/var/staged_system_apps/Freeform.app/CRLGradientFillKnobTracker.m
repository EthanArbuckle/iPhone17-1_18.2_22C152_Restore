@interface CRLGradientFillKnobTracker
- (id)shapeLayout;
- (void)beginMovingKnob;
- (void)endMovingKnob;
- (void)moveKnobToRepPosition:(CGPoint)a3;
@end

@implementation CRLGradientFillKnobTracker

- (id)shapeLayout
{
  v2 = [(CRLCanvasKnobTracker *)self rep];
  v3 = [v2 layout];

  return v3;
}

- (void)beginMovingKnob
{
  v2 = self;
  v24.receiver = self;
  v24.super_class = (Class)CRLGradientFillKnobTracker;
  [(CRLCanvasKnobTracker *)&v24 beginMovingKnob];
  uint64_t v3 = objc_opt_class();
  v4 = [(CRLGradientFillKnobTracker *)v2 shapeLayout];
  v5 = [v4 fill];
  v6 = sub_1002469D0(v3, v5);

  v7 = [(CRLGradientFillKnobTracker *)v2 shapeLayout];
  [v7 boundsForStandardKnobs];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  v16 = [(CRLGradientFillKnobTracker *)v2 shapeLayout];
  v17 = [v16 path];

  v18 = -[CRLTransformGradientFill initWithGradient:inPath:andBounds:]([CRLMutableTransformGradientFill alloc], "initWithGradient:inPath:andBounds:", v6, v17, v9, v11, v13, v15);
  v19 = [(CRLGradientFillKnobTracker *)v2 shapeLayout];
  [v19 setDynamicFill:v18];

  [v6 startPointForPath:v17 andBounds:v9, v11, v13, v15];
  v2->mOriginalStartPoint.x = v20;
  v2->mOriginalStartPoint.y = v21;
  v2 = (CRLGradientFillKnobTracker *)((char *)v2 + 96);
  [v6 endPointForPath:v17 andBounds:v9, v11, v13, v15];
  v2->super.super.isa = v22;
  v2->super._rep = v23;
}

- (void)moveKnobToRepPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = objc_opt_class();
  v7 = [(CRLGradientFillKnobTracker *)self shapeLayout];
  double v8 = [v7 dynamicFill];
  double v9 = sub_1002469D0(v6, v8);

  double v10 = [(CRLCanvasKnobTracker *)self knob];
  if ([v10 tag] == (id)25)
  {
    BOOL v11 = 1;
  }
  else
  {
    double v12 = [(CRLCanvasKnobTracker *)self knob];
    BOOL v11 = [v12 tag] == (id)26;
  }
  double v13 = [(CRLGradientFillKnobTracker *)self shapeLayout];
  [v13 boundsForStandardKnobs];
  double v15 = sub_100064680(x, y, v14);
  double v17 = v16;

  if ([v9 gradientType])
  {
    if (!v11) {
      goto LABEL_13;
    }
  }
  else
  {
    v18 = &OBJC_IVAR___CRLGradientFillKnobTracker_mOriginalStartPoint;
    if (v11) {
      v18 = &OBJC_IVAR___CRLGradientFillKnobTracker_mOriginalEndPoint;
    }
    v19 = (double *)((char *)self + *v18);
    double v21 = *v19;
    double v20 = v19[1];
    v22 = [(CRLCanvasKnobTracker *)self rep];
    [v22 boundsForStandardKnobs];
    if (!v11)
    {
      [v9 setStartPoint:v21 inShapeWithNaturalSize:v20];

LABEL_13:
      v23 = [(CRLCanvasKnobTracker *)self rep];
      [v23 boundsForStandardKnobs];
      [v9 setEndPoint:v15 inShapeWithNaturalSize:v17];
      goto LABEL_14;
    }
    [v9 setEndPoint:v21 inShapeWithNaturalSize:v20];
  }
  v23 = [(CRLCanvasKnobTracker *)self rep];
  [v23 boundsForStandardKnobs];
  [v9 setStartPoint:v15 inShapeWithNaturalSize:v17];
LABEL_14:

  objc_super v24 = [(CRLCanvasKnobTracker *)self rep];
  [v24 invalidateKnobPositions];

  v25 = [(CRLCanvasKnobTracker *)self rep];
  [v25 setNeedsDisplay];

  v26.receiver = self;
  v26.super_class = (Class)CRLGradientFillKnobTracker;
  -[CRLCanvasKnobTracker moveKnobToRepPosition:](&v26, "moveKnobToRepPosition:", v15, v17);
}

- (void)endMovingKnob
{
  v13.receiver = self;
  v13.super_class = (Class)CRLGradientFillKnobTracker;
  [(CRLCanvasKnobTracker *)&v13 endMovingKnob];
  uint64_t v3 = [(CRLCanvasKnobTracker *)self rep];
  v4 = [v3 interactiveCanvasController];

  v5 = [v4 commandController];
  uint64_t v6 = [(CRLCanvasKnobTracker *)self rep];
  v7 = [v6 info];

  double v8 = [_TtC8Freeform17CRLCommandSetFill alloc];
  double v9 = [(CRLGradientFillKnobTracker *)self shapeLayout];
  double v10 = [v9 dynamicFill];
  BOOL v11 = [(CRLCommandSetFill *)v8 initWithShapeItem:v7 fill:v10];

  [v5 enqueueCommand:v11];
  double v12 = [(CRLGradientFillKnobTracker *)self shapeLayout];
  [v12 setDynamicFill:0];
}

@end