@interface CRLCanvasCenterAlignmentGuide
- (BOOL)canBeSnappedToByEdge:(int)a3 ofFrame:(CGRect)a4 inVisibleUnscaledRect:(CGRect)a5;
- (BOOL)isAssociatedContentVisibleInUnscaledRect:(CGRect)a3;
- (double)exactOffset;
- (id)description;
- (id)initBetweenRect:(CGRect)a3 andRect:(CGRect)a4 withGuideType:(int64_t)a5;
- (id)renderableWithICC:(id)a3;
- (int)integerOffset;
- (int64_t)compare:(id)a3;
@end

@implementation CRLCanvasCenterAlignmentGuide

- (id)initBetweenRect:(CGRect)a3 andRect:(CGRect)a4 withGuideType:(int64_t)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v9 = a3.size.height;
  double v10 = a3.size.width;
  double v11 = a3.origin.y;
  double v12 = a3.origin.x;
  if (a5 == 1) {
    +[CRLSwappableAxesGeometry standardAxesGeometry];
  }
  else {
  v14 = +[CRLSwappableAxesGeometry swappedAxesGeometry];
  }
  mVerticalGeom = self->mVerticalGeom;
  self->mVerticalGeom = v14;

  -[CRLSwappableAxesGeometry makeHorizontalSpacingRectBetweenRect:andRect:](self->mVerticalGeom, "makeHorizontalSpacingRectBetweenRect:andRect:", v12, v11, v10, v9, x, y, width, height);
  double v30 = width;
  double v31 = height;
  double v17 = v16;
  double v19 = v18;
  double v28 = x;
  double v29 = y;
  double v21 = v20;
  double v23 = v22;
  BOOL v24 = sub_1004BB3CC([(CRLSwappableAxesGeometry *)self->mVerticalGeom verticalOrientation]);
  -[CRLSwappableAxesGeometry rectMidX:](self->mVerticalGeom, "rectMidX:", v17, v19, v21, v23);
  v35.receiver = self;
  v35.super_class = (Class)CRLCanvasCenterAlignmentGuide;
  v25 = -[CRLCanvasAlignmentGuide initWithType:offset:](&v35, "initWithType:offset:", v24);
  p_isa = (id *)&v25->super.super.super.isa;
  if (v25)
  {
    v25->mLeftGeneratingObjectRect.origin.double x = v12;
    v25->mLeftGeneratingObjectRect.origin.double y = v11;
    v25->mLeftGeneratingObjectRect.size.double width = v10;
    v25->mLeftGeneratingObjectRect.size.double height = v9;
    v25->mRightGeneratingObjectRect.origin.double x = v28;
    v25->mRightGeneratingObjectRect.origin.double y = v29;
    v25->mRightGeneratingObjectRect.size.double width = v30;
    v25->mRightGeneratingObjectRect.size.double height = v31;
    v34.receiver = v25;
    v34.super_class = (Class)CRLCanvasCenterAlignmentGuide;
    [(CRLCanvasAlignmentGuide *)&v34 setInfinite:0];
    [p_isa[28] rectMinY:v17, v19, v21, v23];
    v33.receiver = p_isa;
    v33.super_class = (Class)CRLCanvasCenterAlignmentGuide;
    -[CRLCanvasAlignmentGuide setStart:](&v33, "setStart:");
    [p_isa[28] rectMaxY:v17, v19, v21, v23];
    v32.receiver = p_isa;
    v32.super_class = (Class)CRLCanvasCenterAlignmentGuide;
    -[CRLCanvasAlignmentGuide setEnd:](&v32, "setEnd:");
    [p_isa setSnapsToMin:0];
    [p_isa setSnapsToMax:0];
    [p_isa setSnapsToMid:1];
  }
  return p_isa;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  signed int v5 = [(CRLCanvasCenterAlignmentGuide *)self integerOffset];
  signed int v6 = [v4 integerOffset];

  if (v6 <= v5) {
    int64_t v7 = 0;
  }
  else {
    int64_t v7 = -1;
  }
  if (v5 > v6) {
    return 1;
  }
  else {
    return v7;
  }
}

- (double)exactOffset
{
  mVerticalGeom = self->mVerticalGeom;
  p_mRightGeneratingObjectRect = &self->mRightGeneratingObjectRect;
  [(CRLCanvasAbstractGuide *)self snappingObjectFrame];
  -[CRLSwappableAxesGeometry makeHorizontalSpacingRectBetweenRect:andRect:](mVerticalGeom, "makeHorizontalSpacingRectBetweenRect:andRect:", p_mRightGeneratingObjectRect->origin.x, p_mRightGeneratingObjectRect->origin.y, p_mRightGeneratingObjectRect->size.width, p_mRightGeneratingObjectRect->size.height, v4, v5, v6, v7);

  -[CRLSwappableAxesGeometry rectWidth:](mVerticalGeom, "rectWidth:");
  return result;
}

- (int)integerOffset
{
  [(CRLCanvasCenterAlignmentGuide *)self exactOffset];
  return (int)sub_100407DFC(v2);
}

- (BOOL)canBeSnappedToByEdge:(int)a3 ofFrame:(CGRect)a4 inVisibleUnscaledRect:(CGRect)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)CRLCanvasCenterAlignmentGuide;
  BOOL v10 = -[CRLCanvasAlignmentGuide canBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:](&v16, "canBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:", *(void *)&a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  if (v10)
  {
    -[CRLSwappableAxesGeometry makeHorizontalSpacingRectBetweenRect:andRect:](self->mVerticalGeom, "makeHorizontalSpacingRectBetweenRect:andRect:", self->mLeftGeneratingObjectRect.origin.x, self->mLeftGeneratingObjectRect.origin.y, self->mLeftGeneratingObjectRect.size.width, self->mLeftGeneratingObjectRect.size.height, self->mRightGeneratingObjectRect.origin.x, self->mRightGeneratingObjectRect.origin.y, self->mRightGeneratingObjectRect.size.width, self->mRightGeneratingObjectRect.size.height);
    v19.origin.double x = x;
    v19.origin.double y = y;
    v19.size.double width = width;
    v19.size.double height = height;
    CGRect v18 = CGRectIntersection(v17, v19);
    if (CGRectIsNull(v18))
    {
      LOBYTE(v10) = 0;
    }
    else
    {
      mVerticalGeom = self->mVerticalGeom;
      -[CRLSwappableAxesGeometry makeHorizontalSpacingRectBetweenRect:andRect:](mVerticalGeom, "makeHorizontalSpacingRectBetweenRect:andRect:", self->mLeftGeneratingObjectRect.origin.x, self->mLeftGeneratingObjectRect.origin.y, self->mLeftGeneratingObjectRect.size.width, self->mLeftGeneratingObjectRect.size.height, self->mRightGeneratingObjectRect.origin.x, self->mRightGeneratingObjectRect.origin.y, self->mRightGeneratingObjectRect.size.width, self->mRightGeneratingObjectRect.size.height);
      -[CRLSwappableAxesGeometry rectWidth:](mVerticalGeom, "rectWidth:");
      double v13 = v12;
      -[CRLSwappableAxesGeometry rectWidth:](self->mVerticalGeom, "rectWidth:", x, y, width, height);
      LOBYTE(v10) = v13 > v14 + 1.0;
    }
  }
  return v10;
}

- (BOOL)isAssociatedContentVisibleInUnscaledRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v8 = sub_10006525C(self->mLeftGeneratingObjectRect.origin.x, self->mLeftGeneratingObjectRect.origin.y, self->mLeftGeneratingObjectRect.size.width, self->mLeftGeneratingObjectRect.size.height, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v8)
  {
    double v9 = self->mRightGeneratingObjectRect.origin.x;
    double v10 = self->mRightGeneratingObjectRect.origin.y;
    double v11 = self->mRightGeneratingObjectRect.size.width;
    double v12 = self->mRightGeneratingObjectRect.size.height;
    LOBYTE(v8) = sub_10006525C(v9, v10, v11, v12, x, y, width, height);
  }
  return v8;
}

- (id)renderableWithICC:(id)a3
{
  id v4 = a3;
  mVerticalGeom = self->mVerticalGeom;
  [(CRLCanvasAbstractGuide *)self snappingObjectFrame];
  -[CRLSwappableAxesGeometry makeHorizontalSpacingRectBetweenRect:andRect:](mVerticalGeom, "makeHorizontalSpacingRectBetweenRect:andRect:", self->mLeftGeneratingObjectRect.origin.x, self->mLeftGeneratingObjectRect.origin.y, self->mLeftGeneratingObjectRect.size.width, self->mLeftGeneratingObjectRect.size.height, v6, v7, v8, v9);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  CGRect v18 = self->mVerticalGeom;
  [(CRLCanvasAbstractGuide *)self snappingObjectFrame];
  -[CRLSwappableAxesGeometry makeHorizontalSpacingRectBetweenRect:andRect:](v18, "makeHorizontalSpacingRectBetweenRect:andRect:", self->mRightGeneratingObjectRect.origin.x, self->mRightGeneratingObjectRect.origin.y, self->mRightGeneratingObjectRect.size.width, self->mRightGeneratingObjectRect.size.height, v19, v20, v21, v22);
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  if (self->super.mRenderable)
  {
    if (!self->super.super.mLocationInvalidated) {
      goto LABEL_6;
    }
  }
  else
  {
    double v31 = +[CRLCanvasRenderable renderable];
    mRenderable = self->super.mRenderable;
    self->super.mRenderable = v31;

    [(CRLCanvasRenderable *)self->super.mRenderable setEdgeAntialiasingMask:0];
    objc_super v33 = +[CRLColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.0];
    -[CRLCanvasRenderable setBackgroundColor:](self->super.mRenderable, "setBackgroundColor:", [v33 CGColor]);

    objc_super v34 = -[CRLCanvasSpacingGuideUILayer initWithSpacingRect:ofOrientation:icc:useVisibleRect:]([CRLCanvasSpacingGuideUILayer alloc], "initWithSpacingRect:ofOrientation:icc:useVisibleRect:", [(CRLSwappableAxesGeometry *)self->mVerticalGeom horizontalOrientation], v4, 1, v11, v13, v15, v17);
    mLeftSpacingUILayer = self->mLeftSpacingUILayer;
    self->mLeftSpacingUILayer = v34;

    v36 = self->super.mRenderable;
    v37 = +[CRLCanvasRenderable renderableFromLayer:self->mLeftSpacingUILayer];
    [(CRLCanvasRenderable *)v36 addSubrenderable:v37];

    v38 = -[CRLCanvasSpacingGuideUILayer initWithSpacingRect:ofOrientation:icc:useVisibleRect:]([CRLCanvasSpacingGuideUILayer alloc], "initWithSpacingRect:ofOrientation:icc:useVisibleRect:", [(CRLSwappableAxesGeometry *)self->mVerticalGeom horizontalOrientation], v4, 1, v24, v26, v28, v30);
    mRightSpacingUILayer = self->mRightSpacingUILayer;
    self->mRightSpacingUILayer = v38;

    v40 = self->super.mRenderable;
    v41 = +[CRLCanvasRenderable renderableFromLayer:self->mRightSpacingUILayer];
    [(CRLCanvasRenderable *)v40 addSubrenderable:v41];

    self->super.super.mLocationInvalidated = 1;
  }
  -[CRLCanvasSpacingGuideUILayer setFrameFromSpacingRect:icc:](self->mLeftSpacingUILayer, "setFrameFromSpacingRect:icc:", v4, v11, v13, v15, v17);
  -[CRLCanvasSpacingGuideUILayer setFrameFromSpacingRect:icc:](self->mRightSpacingUILayer, "setFrameFromSpacingRect:icc:", v4, v24, v26, v28, v30);
  self->super.super.mLocationInvalidated = 0;
LABEL_6:
  v42 = self->super.mRenderable;

  return v42;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  if ([(CRLCanvasAlignmentGuide *)self guideType]) {
    CFStringRef v5 = @"vertical";
  }
  else {
    CFStringRef v5 = @"horizontal";
  }
  [(CRLCanvasAbstractGuide *)self offset];
  double v7 = +[NSString stringWithFormat:@"%@: %p %@ center spacing guide at %p with offset %f", v4, self, v5, self, v6];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mVerticalGeom, 0);
  objc_storeStrong((id *)&self->mRightSpacingUILayer, 0);

  objc_storeStrong((id *)&self->mLeftSpacingUILayer, 0);
}

@end