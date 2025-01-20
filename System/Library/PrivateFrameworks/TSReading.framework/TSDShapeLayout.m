@interface TSDShapeLayout
- (BOOL)canBeIntersected;
- (BOOL)canResetTextAndObjectHandles;
- (BOOL)isBeingManipulated;
- (BOOL)isInvisible;
- (BOOL)isInvisibleAutosizingShape;
- (BOOL)isStrokeBeingManipulated;
- (BOOL)isTailEndOnLeft;
- (BOOL)p_cachedPathIsLineSegment;
- (BOOL)p_cachedPathIsOpen;
- (BOOL)shouldBeDisplayedInShowMode;
- (BOOL)supportsResize;
- (BOOL)supportsRotation;
- (CGAffineTransform)computeLayoutTransform;
- (CGPoint)centerForConnecting;
- (CGPoint)getControlKnobPosition:(unint64_t)a3;
- (CGPoint)headLineEndPoint;
- (CGPoint)headPoint;
- (CGPoint)tailLineEndPoint;
- (CGPoint)tailPoint;
- (CGRect)aliasedAlignmentFrameForScale:(double)a3;
- (CGRect)alignmentFrame;
- (CGRect)alignmentFrameInRoot;
- (CGRect)boundsForStandardKnobs;
- (CGRect)p_boundsOfLineEndForHead:(BOOL)a3 transform:(CGAffineTransform *)a4;
- (CGRect)p_cachedPathBounds;
- (CGRect)p_cachedPathBoundsWithoutStroke;
- (CGRect)shapeFrameWithTransform:(CGAffineTransform *)a3;
- (CGSize)minimumSize;
- (TSDFill)dynamicFill;
- (TSDFill)fill;
- (TSDShapeLayout)initWithInfo:(id)a3;
- (double)headLineEndAngle;
- (double)lineEndScale;
- (double)tailLineEndAngle;
- (id)clippedPathForLineEnds;
- (id)computeLayoutGeometry;
- (id)editablePathSource;
- (id)i_computeWrapPath;
- (id)i_computeWrapPathClosed:(BOOL)a3;
- (id)initialInfoGeometry;
- (id)layoutGeometryFromInfo;
- (id)layoutInfoGeometry;
- (id)p_cachedPath;
- (id)p_createClippedPath;
- (id)p_unitePath:(id)a3 withLineEndForHead:(BOOL)a4 stroke:(id)a5;
- (id)pathSource;
- (id)shapeInfo;
- (id)smartPathSource;
- (id)stroke;
- (id)strokeHeadLineEnd;
- (id)strokeTailLineEnd;
- (unint64_t)numberOfControlKnobs;
- (void)aliasPathForScale:(double)a3 adjustedStroke:(id *)a4 adjustedPath:(id *)a5 startDelta:(CGPoint *)a6 endDelta:(CGPoint *)a7;
- (void)aliasPathForScale:(double)a3 originalStroke:(id)a4 adjustedStroke:(id *)a5 adjustedPath:(id *)a6 startDelta:(CGPoint *)a7 endDelta:(CGPoint *)a8;
- (void)beginDynamicOperation;
- (void)dealloc;
- (void)dynamicStrokeWidthChangeDidBegin;
- (void)dynamicStrokeWidthChangeDidEnd;
- (void)dynamicStrokeWidthUpdateToValue:(double)a3;
- (void)endDynamicOperation;
- (void)invalidateFrame;
- (void)invalidatePath;
- (void)invalidatePathBounds;
- (void)p_computeAngle:(double *)a3 point:(CGPoint *)a4 cutSegment:(int64_t *)a5 cutT:(double *)a6 forLineEndAtHead:(BOOL)a7;
- (void)p_invalidateClippedPath;
- (void)p_invalidateHead;
- (void)p_invalidateTail;
- (void)p_updateResizeInfoGeometryFromResizePathSource;
- (void)p_validateHeadAndTail;
- (void)p_validateHeadLineEnd;
- (void)p_validateTailLineEnd;
- (void)processChangedProperty:(int)a3;
- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4;
- (void)setDynamicFill:(id)a3;
- (void)setGeometry:(id)a3;
@end

@implementation TSDShapeLayout

- (TSDShapeLayout)initWithInfo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSDShapeLayout;
  v3 = [(TSDLayout *)&v6 initWithInfo:a3];
  v4 = v3;
  if (v3)
  {
    if ([(TSDShapeLayout *)v3 shapeInfo])
    {
      *(_WORD *)&v4->mShapeInvalidFlags |= 0x3FFu;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDShapeLayout;
  [(TSDDrawableLayout *)&v3 dealloc];
}

- (id)layoutGeometryFromInfo
{
  if (self->mResizeInfoGeometry)
  {
    v2 = [[TSDLayoutGeometry alloc] initWithInfoGeometry:self->mResizeInfoGeometry];
    return v2;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)TSDShapeLayout;
    return [(TSDLayout *)&v4 layoutGeometryFromInfo];
  }
}

- (id)computeLayoutGeometry
{
  objc_opt_class();
  [(TSDAbstractLayout *)self parent];
  objc_super v3 = (void *)TSUDynamicCast();
  if (v3)
  {
    [v3 maximumFrameSizeForChild:self];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v5 = 1.79769313e308;
    double v7 = 1.79769313e308;
  }
  id v8 = [(TSDShapeLayout *)self pathSource];
  id v9 = [(TSDLayout *)self i_layoutGeometryProvider];
  uint64_t v10 = [v9 layoutGeometryForLayout:self];
  if (v10)
  {
    v11 = (TSDLayoutGeometry *)v10;
    v12 = objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "pathSource");
    [v12 naturalSize];
    double v14 = v13;
    double v16 = v15;
    [(TSDLayoutGeometry *)v11 size];
    if (v14 != v18 || v16 != v17)
    {

      self->mProvidedPathSource = 0;
      v19 = (TSDPathSource *)[v12 copy];
      self->mProvidedPathSource = v19;
      [(TSDLayoutGeometry *)v11 size];
      -[TSDPathSource scaleToNaturalSize:](v19, "scaleToNaturalSize:");
      [(TSDShapeLayout *)self invalidatePath];
      [(TSDShapeLayout *)self invalidatePathBounds];
    }
  }
  else
  {
    if (v5 < 1.79769313e308 || v7 < 1.79769313e308)
    {
      v20 = (TSDPathSource *)objc_msgSend((id)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "pathSource"), "copy");
      id v21 = [(TSDShapeLayout *)self stroke];
      objc_msgSend(-[TSDShapeLayout layoutInfoGeometry](self, "layoutInfoGeometry"), "center");
      double v23 = v22;
      double v25 = v24;
      objc_msgSend(-[TSDShapeLayout layoutInfoGeometry](self, "layoutInfoGeometry"), "position");
      double v27 = v26;
      memset(&v56, 0, sizeof(v56));
      id v28 = [(TSDShapeLayout *)self layoutInfoGeometry];
      if (v28)
      {
        v29 = v28;
        double v30 = TSDSubtractPoints(v23, v25, v27);
        objc_msgSend(v29, "transformBasedOnPoint:centeredAtPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v30, v31);
      }
      else
      {
        memset(&v56, 0, sizeof(v56));
      }
      unsigned int v32 = 0;
      while (1)
      {
        id v33 = [(TSDPathSource *)v20 bezierPath];
        CGAffineTransform v55 = v56;
        if (!CGAffineTransformIsIdentity(&v55))
        {
          CGAffineTransform v55 = v56;
          [v33 transformUsingAffineTransform:&v55];
        }
        TSDPathBoundsIncludingStroke((CGPathRef)[v33 CGPath], v21);
        double v35 = v34;
        double v37 = v36;
        double v38 = TSDSubtractSizes(v34, v36, v5);
        if (!v32 && v38 <= 0.0 && v39 <= 0.0) {
          break;
        }
        if (!v32) {
          goto LABEL_29;
        }
        BOOL v40 = v38 > 0.0 || v38 <= -1.0;
        if (!v40 && v39 <= 0.0 || v38 <= 0.0 && v39 <= 0.0 && v39 > -1.0) {
          goto LABEL_43;
        }
        if (v32 <= 3)
        {
LABEL_29:
          double v41 = v5 / v35;
          if (v7 / v37 >= 1.0 || v41 <= 1.0) {
            double v43 = v5 / v35;
          }
          else {
            double v43 = v7 / v37;
          }
          if (v5 / v35 < 1.0 && v7 / v37 > 1.0) {
            double v43 = v5 / v35;
          }
          else {
            double v41 = v7 / v37;
          }
          float v44 = v43;
          float v45 = v41;
          double v46 = fminf(v44, v45);
          [(TSDPathSource *)v20 naturalSize];
          [(TSDPathSource *)v20 setNaturalSize:TSDMultiplySizeScalar(v47, v48, v46)];
        }
        if (++v32 == 5) {
          goto LABEL_43;
        }
      }
    }
    v20 = 0;
LABEL_43:

    self->mShrunkenPathSource = v20;
    if ([(TSDShapeLayout *)self pathSource] != v8)
    {
      [(TSDShapeLayout *)self invalidatePath];
      [(TSDShapeLayout *)self invalidatePathBounds];
    }
    [(TSDShapeLayout *)self pathBounds];
    double v50 = v49;
    double v52 = v51;
    memset(&v56, 0, sizeof(v56));
    [(TSDShapeLayout *)self computeLayoutTransform];
    v53 = [TSDLayoutGeometry alloc];
    CGAffineTransform v55 = v56;
    v11 = -[TSDLayoutGeometry initWithSize:transform:](v53, "initWithSize:transform:", &v55, v50, v52);
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
      return (id)[v9 adjustLayoutGeometry:v11 forLayout:self];
    }
  }
  return v11;
}

- (CGAffineTransform)computeLayoutTransform
{
  memset(&v10, 0, sizeof(v10));
  id v5 = [(TSDShapeLayout *)self layoutInfoGeometry];
  if (v5) {
    [v5 transform];
  }
  else {
    memset(&v10, 0, sizeof(v10));
  }
  [(TSDShapeLayout *)self pathBounds];
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  CGAffineTransform v9 = v10;
  return CGAffineTransformTranslate(retstr, &v9, v6, v7);
}

- (void)setGeometry:(id)a3
{
  if ((*(_WORD *)&self->mShapeInvalidFlags & 0x20) == 0)
  {
    id v5 = [(TSDAbstractLayout *)self geometry];
    if (!v5)
    {
LABEL_5:
      *(_WORD *)&self->mShapeInvalidFlags |= 0x20u;
      goto LABEL_10;
    }
    CGFloat v6 = v5;
    if (![(TSDLayoutGeometry *)v5 isEqual:a3])
    {
      if ([(TSDLayoutGeometry *)v6 differsInMoreThanTranslationFrom:a3]) {
        goto LABEL_5;
      }
      if (a3)
      {
        [a3 transform];
        float64x2_t v8 = v21;
        float64x2_t v9 = v22;
        float64x2_t v10 = v23;
      }
      else
      {
        float64x2_t v10 = 0uLL;
        float64x2_t v22 = 0u;
        float64x2_t v23 = 0u;
        float64x2_t v21 = 0u;
        float64x2_t v8 = 0uLL;
        float64x2_t v9 = 0uLL;
      }
      double v11 = *(double *)(MEMORY[0x263F00148] + 8);
      long long v15 = *MEMORY[0x263F00148];
      float64x2_t v16 = vaddq_f64(v10, vmlaq_n_f64(vmulq_n_f64(v9, v11), v8, *MEMORY[0x263F00148]));
      [(TSDLayoutGeometry *)v6 transform];
      double v12 = TSDSubtractPoints(v16.f64[0], v16.f64[1], vaddq_f64(v20, vmlaq_n_f64(vmulq_n_f64(v19, v14), v18, *(double *)&v15)).f64[0]);
      self->mCachedAlignmentFrame.origin.x = TSDAddPoints(self->mCachedAlignmentFrame.origin.x, self->mCachedAlignmentFrame.origin.y, v12);
      self->mCachedAlignmentFrame.origin.y = v13;
    }
  }
LABEL_10:
  v17.receiver = self;
  v17.super_class = (Class)TSDShapeLayout;
  [(TSDDrawableLayout *)&v17 setGeometry:a3];
}

- (CGRect)alignmentFrame
{
  if ((*(_WORD *)&self->mShapeInvalidFlags & 0x20) != 0)
  {
    p_mCachedAlignmentFrame = &self->mCachedAlignmentFrame;
    [(TSDAbstractLayout *)self transform];
    [(TSDShapeLayout *)self shapeFrameWithTransform:&v12];
    p_mCachedAlignmentFrame->origin.double x = v4;
    p_mCachedAlignmentFrame->origin.double y = v5;
    p_mCachedAlignmentFrame->size.double width = v6;
    p_mCachedAlignmentFrame->size.double height = v7;
    *(_WORD *)&self->mShapeInvalidFlags &= ~0x20u;
  }
  double x = self->mCachedAlignmentFrame.origin.x;
  double y = self->mCachedAlignmentFrame.origin.y;
  double width = self->mCachedAlignmentFrame.size.width;
  double height = self->mCachedAlignmentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)alignmentFrameInRoot
{
  if ([(TSDAbstractLayout *)self parent])
  {
    if (self) {
      [(TSDAbstractLayout *)self transformInRoot];
    }
    else {
      memset(v7, 0, sizeof(v7));
    }
    [(TSDShapeLayout *)self shapeFrameWithTransform:v7];
  }
  else
  {
    [(TSDShapeLayout *)self alignmentFrame];
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)processChangedProperty:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSDShapeLayout;
  -[TSDDrawableLayout processChangedProperty:](&v5, sel_processChangedProperty_);
  switch(a3)
  {
    case 517:
      [(TSDShapeLayout *)self invalidatePathBounds];
      [(TSDShapeLayout *)self p_invalidateHead];
      goto LABEL_5;
    case 522:
      [(TSDShapeLayout *)self invalidatePathBounds];
      [(TSDShapeLayout *)self p_invalidateHead];
      goto LABEL_7;
    case 523:
      [(TSDShapeLayout *)self invalidatePathBounds];
LABEL_5:
      [(TSDShapeLayout *)self p_invalidateTail];
      goto LABEL_7;
    case 526:
      [(TSDShapeLayout *)self invalidatePath];
LABEL_7:
      [(TSDShapeLayout *)self invalidateFrame];
      break;
    default:
      return;
  }
}

- (CGRect)boundsForStandardKnobs
{
  objc_msgSend(-[TSDShapeLayout pathSource](self, "pathSource"), "naturalSize");
  double v3 = TSDRectWithSize();
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  [(TSDShapeLayout *)self pathBounds];
  double v11 = -v10;
  double v13 = -v12;
  double v14 = v3;
  uint64_t v15 = v5;
  uint64_t v16 = v7;
  uint64_t v17 = v9;

  return CGRectOffset(*(CGRect *)&v14, v11, v13);
}

- (id)stroke
{
  if (self->mDynamicStroke) {
    return self->mDynamicStroke;
  }
  id v3 = [(TSDShapeLayout *)self shapeInfo];

  return (id)[v3 stroke];
}

- (void)dynamicStrokeWidthChangeDidBegin
{
  if (self->mDynamicStroke)
  {
    id v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDShapeLayout dynamicStrokeWidthChangeDidBegin]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeLayout.m"), 357, @"expected nil value for '%s'", "mDynamicStroke");
  }
  self->mDynamicStroke = (TSDMutableStroke *)objc_msgSend((id)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "stroke"), "mutableCopy");
}

- (void)dynamicStrokeWidthUpdateToValue:(double)a3
{
  mDynamicStroke = self->mDynamicStroke;
  if (!mDynamicStroke)
  {
    uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDShapeLayout dynamicStrokeWidthUpdateToValue:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeLayout.m"), 363, @"invalid nil value for '%s'", "mDynamicStroke");
    mDynamicStroke = self->mDynamicStroke;
  }
  BOOL v8 = [(TSDStroke *)mDynamicStroke isFrame];
  uint64_t v9 = self->mDynamicStroke;
  if (v8) {
    [(TSDMutableStroke *)v9 setAssetScale:a3];
  }
  else {
    [(TSDMutableStroke *)v9 setWidth:a3];
  }
  [(TSDShapeLayout *)self processChangedProperty:517];
  double v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "canvasController"), "repForLayout:", self);

  [v10 processChangedProperty:517];
}

- (void)dynamicStrokeWidthChangeDidEnd
{
  self->mDynamicStroke = 0;
}

- (BOOL)isStrokeBeingManipulated
{
  return self->mDynamicStroke != 0;
}

- (id)shapeInfo
{
  objc_opt_class();
  [(TSDLayout *)self info];

  return (id)TSUDynamicCast();
}

- (id)pathSource
{
  mResizePathSource = self->mResizePathSource;
  if (mResizePathSource) {
    return mResizePathSource;
  }
  mResizePathSource = self->mShrunkenPathSource;
  if (mResizePathSource) {
    return mResizePathSource;
  }
  mResizePathSource = self->mProvidedPathSource;
  if (mResizePathSource) {
    return mResizePathSource;
  }
  id v4 = [(TSDShapeLayout *)self shapeInfo];

  return (id)[v4 pathSource];
}

- (id)editablePathSource
{
  id v3 = [(TSDShapeLayout *)self pathSource];
  id v4 = (TSDPathSource *)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "pathSource");
  objc_opt_class();
  uint64_t v5 = TSUDynamicCast();
  if (v5)
  {
    uint64_t v6 = (void *)v5;

    self->mCachedEditableBezierPathSource = 0;
    self->mCachedPathSource = 0;
  }
  else
  {
    if (v4 != self->mCachedPathSource)
    {

      self->mCachedEditableBezierPathSource = 0;
      self->mCachedEditableBezierPathSource = +[TSDEditableBezierPathSource editableBezierPathSourceWithPathSource:v3];
      self->mCachedPathSource = v3;
    }
    return self->mCachedEditableBezierPathSource;
  }
  return v6;
}

- (id)smartPathSource
{
  [(TSDShapeLayout *)self pathSource];

  return (id)TSUProtocolCast();
}

- (id)layoutInfoGeometry
{
  if (self->mResizeInfoGeometry) {
    return self->mResizeInfoGeometry;
  }
  id v3 = [(TSDLayout *)self info];

  return (id)[(TSDInfo *)v3 geometry];
}

- (CGPoint)headPoint
{
  [(TSDShapeLayout *)self p_validateHeadAndTail];
  double x = self->mHeadPoint.x;
  double y = self->mHeadPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)tailPoint
{
  [(TSDShapeLayout *)self p_validateHeadAndTail];
  double x = self->mTailPoint.x;
  double y = self->mTailPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)headLineEndPoint
{
  [(TSDShapeLayout *)self p_validateHeadLineEnd];
  double x = self->mHeadLineEndPoint.x;
  double y = self->mHeadLineEndPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)tailLineEndPoint
{
  [(TSDShapeLayout *)self p_validateTailLineEnd];
  double x = self->mTailLineEndPoint.x;
  double y = self->mTailLineEndPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)headLineEndAngle
{
  return self->mHeadLineEndAngle;
}

- (double)tailLineEndAngle
{
  return self->mTailLineEndAngle;
}

- (BOOL)isTailEndOnLeft
{
  [(TSDShapeLayout *)self tailLineEndPoint];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(TSDAbstractLayout *)self geometryInRoot];
  if (v7)
  {
    [v7 transform];
    double v9 = v29;
    double v8 = v28;
    double v11 = v31;
    double v10 = v30;
    double v12 = v33;
    double v13 = v32;
  }
  else
  {
    double v12 = 0.0;
    double v11 = 0.0;
    double v9 = 0.0;
    double v13 = 0.0;
    double v10 = 0.0;
    double v8 = 0.0;
  }
  [(TSDShapeLayout *)self headLineEndPoint];
  double v23 = v15;
  double v24 = v14;
  id v16 = [(TSDAbstractLayout *)self geometryInRoot];
  if (v16)
  {
    [v16 transform];
    float64x2_t v17 = v25;
    float64x2_t v18 = v26;
    float64x2_t v19 = v27;
  }
  else
  {
    float64x2_t v19 = 0uLL;
    float64x2_t v17 = 0uLL;
    float64x2_t v18 = 0uLL;
  }
  double v20 = TSDSubtractPoints(v13 + v6 * v10 + v8 * v4, v12 + v6 * v11 + v9 * v4, vaddq_f64(v19, vmlaq_n_f64(vmulq_n_f64(v18, v23), v17, v24)).f64[0]);
  if (fabs(v20) < 1.0) {
    double v20 = v21;
  }
  return v20 < 0.0;
}

- (double)lineEndScale
{
  objc_msgSend(-[TSDShapeLayout stroke](self, "stroke"), "width");
  if (result > 1.0) {
    return (result + -1.0) * 0.6 + 1.0;
  }
  return result;
}

- (id)clippedPathForLineEnds
{
  if ((*(_WORD *)&self->mShapeInvalidFlags & 0x200) != 0)
  {
    self->mCachedClippedPath = (TSDBezierPath *)[(TSDShapeLayout *)self p_createClippedPath];
    *(_WORD *)&self->mShapeInvalidFlags &= ~0x200u;
  }
  return self->mCachedClippedPath;
}

- (CGRect)shapeFrameWithTransform:(CGAffineTransform *)a3
{
  [(TSDShapeLayout *)self pathBounds];
  long long v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v35.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v35.c = v7;
  *(_OWORD *)&v35.tCGFloat x = *(_OWORD *)&a3->tx;
  CGAffineTransformTranslate(&v36, &v35, -v5, -v6);
  long long v8 = *(_OWORD *)&v36.c;
  *(_OWORD *)&a3->a = *(_OWORD *)&v36.a;
  *(_OWORD *)&a3->c = v8;
  *(_OWORD *)&a3->tCGFloat x = *(_OWORD *)&v36.tx;
  if (objc_msgSend(-[TSDShapeLayout stroke](self, "stroke"), "isFrame")) {
    [(TSDShapeLayout *)self pathBounds];
  }
  else {
    objc_msgSend(-[TSDShapeLayout stroke](self, "stroke"), "boundsForPath:", -[TSDShapeLayout clippedPathForLineEnds](self, "clippedPathForLineEnds"));
  }
  long long v13 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v36.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v36.c = v13;
  *(_OWORD *)&v36.tCGFloat x = *(_OWORD *)&a3->tx;
  CGRect v37 = CGRectApplyAffineTransform(*(CGRect *)&v9, &v36);
  CGFloat x = v37.origin.x;
  CGFloat y = v37.origin.y;
  CGFloat width = v37.size.width;
  CGFloat height = v37.size.height;
  if ([(TSDShapeLayout *)self pathIsOpen])
  {
    long long v18 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v36.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v36.c = v18;
    *(_OWORD *)&v36.tCGFloat x = *(_OWORD *)&a3->tx;
    [(TSDShapeLayout *)self p_boundsOfLineEndForHead:1 transform:&v36];
    v43.origin.CGFloat x = v19;
    v43.origin.CGFloat y = v20;
    v43.size.CGFloat width = v21;
    v43.size.CGFloat height = v22;
    v38.origin.CGFloat x = x;
    v38.origin.CGFloat y = y;
    v38.size.CGFloat width = width;
    v38.size.CGFloat height = height;
    CGRect v39 = CGRectUnion(v38, v43);
    CGFloat v23 = v39.origin.x;
    CGFloat v24 = v39.origin.y;
    CGFloat v25 = v39.size.width;
    CGFloat v26 = v39.size.height;
    *(_OWORD *)&v39.origin.CGFloat y = *(_OWORD *)&a3->c;
    *(_OWORD *)&v36.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v36.c = *(_OWORD *)&v39.origin.y;
    *(_OWORD *)&v36.tCGFloat x = *(_OWORD *)&a3->tx;
    [(TSDShapeLayout *)self p_boundsOfLineEndForHead:0 transform:&v36];
    v44.origin.CGFloat x = v27;
    v44.origin.CGFloat y = v28;
    v44.size.CGFloat width = v29;
    v44.size.CGFloat height = v30;
    v40.origin.CGFloat x = v23;
    v40.origin.CGFloat y = v24;
    v40.size.CGFloat width = v25;
    v40.size.CGFloat height = v26;
    CGRect v41 = CGRectUnion(v40, v44);
    CGFloat x = v41.origin.x;
    CGFloat y = v41.origin.y;
    CGFloat width = v41.size.width;
    CGFloat height = v41.size.height;
  }
  double v31 = x;
  double v32 = y;
  double v33 = width;
  double v34 = height;
  result.size.CGFloat height = v34;
  result.size.CGFloat width = v33;
  result.origin.CGFloat y = v32;
  result.origin.CGFloat x = v31;
  return result;
}

- (BOOL)isInvisible
{
  return 0;
}

- (BOOL)shouldBeDisplayedInShowMode
{
  [(TSDStyledLayout *)self frameForCulling];
  char HasNaNComponents = TSDRectHasNaNComponents();
  v6.receiver = self;
  v6.super_class = (Class)TSDShapeLayout;
  unsigned int v4 = [(TSDLayout *)&v6 shouldBeDisplayedInShowMode];
  if (v4) {
    LOBYTE(v4) = ([(TSDShapeLayout *)self isInvisibleAutosizingShape] | HasNaNComponents) ^ 1;
  }
  return v4;
}

- (BOOL)isInvisibleAutosizingShape
{
  int v3 = objc_msgSend((id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry"), "widthValid");
  char v4 = objc_msgSend((id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry"), "heightValid");
  if (v3 && (v4 & 1) != 0) {
    return 0;
  }
  else {
    return objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "shouldShowInstructionalText") ^ 1;
  }
}

- (CGPoint)centerForConnecting
{
  v11.receiver = self;
  v11.super_class = (Class)TSDShapeLayout;
  [(TSDLayout *)&v11 centerForConnecting];
  double v4 = v3;
  double v6 = v5;
  if ([(TSDShapeLayout *)self isInvisibleAutosizingShape])
  {
    objc_msgSend((id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry"), "center");
    double v4 = v7;
    double v6 = v8;
  }
  double v9 = v4;
  double v10 = v6;
  result.CGFloat y = v10;
  result.CGFloat x = v9;
  return result;
}

- (CGRect)aliasedAlignmentFrameForScale:(double)a3
{
  id v51 = 0;
  id v52 = 0;
  CGFloat v49 = 0.0;
  CGFloat v50 = 0.0;
  CGFloat v47 = 0.0;
  CGFloat v48 = 0.0;
  [(TSDShapeLayout *)self aliasPathForScale:&v52 adjustedStroke:&v51 adjustedPath:&v49 startDelta:&v47 endDelta:a3];
  [(TSDShapeLayout *)self pathBounds];
  double v5 = v4;
  double v7 = v6;
  memset(&v46, 0, sizeof(v46));
  if (self) {
    [(TSDAbstractLayout *)self transform];
  }
  CGAffineTransform v44 = v46;
  CGAffineTransformTranslate(&v45, &v44, -v5, -v7);
  CGAffineTransform v46 = v45;
  id v8 = v52;
  if ([v52 isFrame])
  {
    [v51 bounds];
    objc_msgSend(v8, "coverageRect:");
    CGAffineTransform v45 = v46;
    CGRect v54 = CGRectApplyAffineTransform(v53, &v45);
    CGFloat x = v54.origin.x;
    CGFloat y = v54.origin.y;
    CGFloat width = v54.size.width;
    CGFloat height = v54.size.height;
  }
  else
  {
    long long v13 = (void *)[v51 copy];
    CGAffineTransform v45 = v46;
    [v13 transformUsingAffineTransform:&v45];
    [v8 boundsForPath:v13];
    CGFloat x = v14;
    CGFloat y = v15;
    CGFloat width = v16;
    CGFloat height = v17;
  }
  if ([(TSDShapeLayout *)self pathIsOpen])
  {
    CGAffineTransform v45 = v46;
    [(TSDShapeLayout *)self p_boundsOfLineEndForHead:1 transform:&v45];
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGAffineTransformMakeTranslation(&v43, v49, v50);
    v55.origin.CGFloat x = v19;
    v55.origin.CGFloat y = v21;
    v55.size.CGFloat width = v23;
    v55.size.CGFloat height = v25;
    CGRect v62 = CGRectApplyAffineTransform(v55, &v43);
    v56.origin.CGFloat x = x;
    v56.origin.CGFloat y = y;
    v56.size.CGFloat width = width;
    v56.size.CGFloat height = height;
    CGRect v57 = CGRectUnion(v56, v62);
    CGFloat v26 = v57.origin.x;
    CGFloat v27 = v57.origin.y;
    CGFloat v28 = v57.size.width;
    CGFloat v29 = v57.size.height;
    CGAffineTransform v45 = v46;
    [(TSDShapeLayout *)self p_boundsOfLineEndForHead:0 transform:&v45];
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    CGFloat v37 = v36;
    CGAffineTransformMakeTranslation(&v42, v47, v48);
    v58.origin.CGFloat x = v31;
    v58.origin.CGFloat y = v33;
    v58.size.CGFloat width = v35;
    v58.size.CGFloat height = v37;
    CGRect v63 = CGRectApplyAffineTransform(v58, &v42);
    v59.origin.CGFloat x = v26;
    v59.origin.CGFloat y = v27;
    v59.size.CGFloat width = v28;
    v59.size.CGFloat height = v29;
    CGRect v60 = CGRectUnion(v59, v63);
    CGFloat x = v60.origin.x;
    CGFloat y = v60.origin.y;
    CGFloat width = v60.size.width;
    CGFloat height = v60.size.height;
  }
  double v38 = x;
  double v39 = y;
  double v40 = width;
  double v41 = height;
  result.size.CGFloat height = v41;
  result.size.CGFloat width = v40;
  result.origin.CGFloat y = v39;
  result.origin.CGFloat x = v38;
  return result;
}

- (void)aliasPathForScale:(double)a3 adjustedStroke:(id *)a4 adjustedPath:(id *)a5 startDelta:(CGPoint *)a6 endDelta:(CGPoint *)a7
{
  id v13 = [(TSDShapeLayout *)self stroke];

  [(TSDShapeLayout *)self aliasPathForScale:v13 originalStroke:a4 adjustedStroke:a5 adjustedPath:a6 startDelta:a7 endDelta:a3];
}

- (void)aliasPathForScale:(double)a3 originalStroke:(id)a4 adjustedStroke:(id *)a5 adjustedPath:(id *)a6 startDelta:(CGPoint *)a7 endDelta:(CGPoint *)a8
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v15 = [(TSDShapeLayout *)self shapeInfo];
  if ([(TSDShapeLayout *)self pathIsOpen]
    && ([v15 headLineEnd] || objc_msgSend(v15, "tailLineEnd")))
  {
    id v16 = [(TSDShapeLayout *)self clippedPathForLineEnds];
  }
  else
  {
    id v16 = [(TSDShapeLayout *)self path];
  }
  double v17 = v16;
  memset(&v42, 0, sizeof(v42));
  if (self) {
    [(TSDAbstractLayout *)self transformInRoot];
  }
  *a5 = a4;
  *a6 = (id)[v17 copy];
  CGPoint v18 = (CGPoint)*MEMORY[0x263F00148];
  *a7 = *(CGPoint *)MEMORY[0x263F00148];
  CGPoint v37 = v18;
  *a8 = v18;
  if (v17)
  {
    CGAffineTransform v43 = v42;
    if (TSDIsTransformAxisAligned(&v43.a))
    {
      [(TSDShapeLayout *)self pathBounds];
      double v20 = v19;
      double v22 = v21;
      if (![a4 shouldRender] || objc_msgSend(a4, "shouldAntialiasDefeat"))
      {
        id v23 = (id)objc_msgSend(a4, "mutableCopy", v37);
        double v24 = 0.0;
        if ([v23 shouldRender] && (objc_msgSend(v23, "isFrame") & 1) == 0)
        {
          [a4 width];
          double v24 = 1.0;
          if (v25 * a3 > 1.0)
          {
            TSURound();
            double v24 = v26;
            [v23 setWidth:v26 / a3];
          }
          [a4 width];
          objc_msgSend(v23, "setActualWidth:");
        }
        id v27 = (id)[v17 copy];
        [v17 elementAtIndex:0 associatedPoints:&v43];
        *a7 = *(CGPoint *)&v43.a;
        [v17 currentPoint];
        a8->CGFloat x = v28;
        a8->CGFloat y = v29;
        CGAffineTransform v40 = v42;
        CGAffineTransformTranslate(&v41, &v40, -v20, -v22);
        CGAffineTransform v42 = v41;
        [v27 transformUsingAffineTransform:&v41];
        *(float *)&double v30 = a3;
        *(float *)&double v31 = v24;
        double v32 = (void *)[v27 aliasedPathWithViewScale:v30 effectiveStrokeWidth:v31];
        CGAffineTransform v41 = v42;
        CGAffineTransformInvert(&v39, &v41);
        [v32 transformUsingAffineTransform:&v39];
        *(_OWORD *)&v41.a = v38;
        [v32 elementAtIndex:0 associatedPoints:&v41];
        a7->CGFloat x = TSDSubtractPoints(v41.a, v41.b, a7->x);
        a7->CGFloat y = v33;
        [v32 currentPoint];
        a8->CGFloat x = TSDSubtractPoints(v34, v35, a8->x);
        a8->CGFloat y = v36;
        *a5 = v23;
        *a6 = v32;
      }
    }
  }
}

- (TSDFill)fill
{
  if (self->mDynamicFill) {
    return self->mDynamicFill;
  }
  id v3 = [(TSDShapeLayout *)self shapeInfo];

  return (TSDFill *)[v3 fill];
}

- (BOOL)canBeIntersected
{
  return ![(TSDShapeLayout *)self pathIsLineSegment];
}

- (BOOL)canResetTextAndObjectHandles
{
  return ![(TSDShapeLayout *)self pathIsLineSegment];
}

- (void)invalidateFrame
{
  v3.receiver = self;
  v3.super_class = (Class)TSDShapeLayout;
  [(TSDLayout *)&v3 invalidateFrame];
  *(_WORD *)&self->mShapeInvalidFlags |= 0x20u;
}

- (void)invalidatePath
{
  *(_WORD *)&self->mShapeInvalidFlags |= 0x19u;

  self->mCachedPath = 0;
  [(TSDShapeLayout *)self invalidatePathBounds];
  [(TSDShapeLayout *)self p_invalidateHead];
  [(TSDShapeLayout *)self p_invalidateTail];

  [(TSDShapeLayout *)self p_invalidateClippedPath];
}

- (void)invalidatePathBounds
{
  *(_WORD *)&self->mShapeInvalidFlags |= 0x26u;
  CGPoint v2 = (CGPoint)*MEMORY[0x263F001A8];
  CGSize v3 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  self->mCachedPathBounds.origin = (CGPoint)*MEMORY[0x263F001A8];
  self->mCachedPathBounds.size = v3;
  self->mCachedPathBoundsWithoutStroke.origin = v2;
  self->mCachedPathBoundsWithoutStroke.size = v3;
  [(TSDDrawableLayout *)self invalidateExteriorWrap];
}

- (BOOL)supportsResize
{
  objc_msgSend(-[TSDShapeLayout path](self, "path"), "bounds");
  double v4 = v3;
  double v6 = v5;
  if ([(TSDShapeLayout *)self pathIsLineSegment]) {
    return 0;
  }
  if (v6 >= 0.00000001) {
    return v4 >= 0.00000001;
  }
  return 0;
}

- (void)beginDynamicOperation
{
  v10.receiver = self;
  v10.super_class = (Class)TSDShapeLayout;
  [(TSDLayout *)&v10 beginDynamicOperation];
  if (self->mResizePathSource)
  {
    double v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDShapeLayout beginDynamicOperation]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeLayout.m"), 784, @"expected nil value for '%s'", "mResizePathSource");
  }
  if (self->mResizeInfoGeometry)
  {
    double v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDShapeLayout beginDynamicOperation]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeLayout.m"), 785, @"expected nil value for '%s'", "mResizeInfoGeometry");
  }
  self->mResizePathSource = (TSDPathSource *)objc_msgSend((id)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "pathSource"), "copy");
  if ([(TSDLayout *)self isInTopLevelContainerForEditing]
    || objc_msgSend((id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry"), "widthValid")
    && (objc_msgSend((id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry"), "heightValid") & 1) != 0)
  {
    id v7 = (id)[(TSDInfo *)[(TSDLayout *)self info] geometry];
  }
  else
  {
    id v8 = [(TSDLayout *)self info];
    if (v8) {
      [(TSDInfo *)v8 computeFullTransform];
    }
    else {
      memset(v9, 0, sizeof(v9));
    }
    id v7 = +[TSDInfoGeometry geometryFromFullTransform:v9];
  }
  self->mInitialInfoGeometrCGFloat y = (TSDInfoGeometry *)v7;
  self->mResizeInfoGeometrCGFloat y = (TSDInfoGeometry *)objc_msgSend((id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry"), "copy");
}

- (void)endDynamicOperation
{
  [(TSDShapeLayout *)self invalidatePath];
  [(TSDShapeLayout *)self invalidateFrame];
  if (!self->mResizeInfoGeometry)
  {
    double v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDShapeLayout endDynamicOperation]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeLayout.m"), 807, @"invalid nil value for '%s'", "mResizeInfoGeometry");
  }
  if (!self->mInitialInfoGeometry)
  {
    double v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDShapeLayout endDynamicOperation]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeLayout.m"), 808, @"invalid nil value for '%s'", "mInitialInfoGeometry");
  }
  v7.receiver = self;
  v7.super_class = (Class)TSDShapeLayout;
  [(TSDLayout *)&v7 endDynamicOperation];

  self->mResizePathSource = 0;
  self->mResizeInfoGeometrCGFloat y = 0;

  self->mInitialInfoGeometrCGFloat y = 0;
}

- (CGSize)minimumSize
{
  int v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "pathSource"), "bezierPath"), "isLineSegment");
  double v3 = 1.0;
  double v4 = 0.0;
  if (!v2) {
    double v4 = 1.0;
  }
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (id)initialInfoGeometry
{
  return self->mInitialInfoGeometry;
}

- (BOOL)supportsRotation
{
  return 1;
}

- (BOOL)isBeingManipulated
{
  if ([(TSDShapeLayout *)self isStrokeBeingManipulated]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSDShapeLayout;
  return [(TSDLayout *)&v4 isBeingManipulated];
}

- (id)strokeHeadLineEnd
{
  id result = (id)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "headLineEnd");
  if (result)
  {
    id v4 = [(TSDShapeLayout *)self stroke];
    uint64_t v5 = objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "headLineEnd");
    return (id)[v4 strokeLineEnd:v5];
  }
  return result;
}

- (id)strokeTailLineEnd
{
  id result = (id)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "tailLineEnd");
  if (result)
  {
    id v4 = [(TSDShapeLayout *)self stroke];
    uint64_t v5 = objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "tailLineEnd");
    return (id)[v4 strokeLineEnd:v5];
  }
  return result;
}

- (unint64_t)numberOfControlKnobs
{
  [(TSDShapeLayout *)self pathSource];
  objc_opt_class();
  int v2 = (void *)TSUClassAndProtocolCast();

  return [v2 numberOfControlKnobs];
}

- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  [(TSDShapeLayout *)self pathSource];
  objc_opt_class();
  objc_super v7 = (void *)TSUClassAndProtocolCast();

  objc_msgSend(v7, "setControlKnobPosition:toPoint:", a3, x, y);
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  [(TSDShapeLayout *)self pathSource];
  objc_opt_class();
  id v4 = (void *)TSUClassAndProtocolCast();

  [v4 getControlKnobPosition:a3];
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (id)i_computeWrapPath
{
  double v3 = [(TSDShapeLayout *)self fill];
  if (v3) {
    uint64_t v4 = [(TSDFill *)v3 isClear] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }

  return [(TSDShapeLayout *)self i_computeWrapPathClosed:v4];
}

- (id)i_computeWrapPathClosed:(BOOL)a3
{
  id v5 = [(TSDShapeLayout *)self stroke];
  if (!v5 || (id v6 = v5, ![v5 shouldRender]))
  {
    objc_super v7 = +[TSDBezierPath outsideEdgeOfBezierPath:[(TSDShapeLayout *)self path]];
    goto LABEL_6;
  }
  objc_opt_class();
  if (TSUDynamicCast())
  {
    [(TSDShapeLayout *)self pathBounds];
    objc_super v7 = +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:");
LABEL_6:
    id v8 = v7;
    goto LABEL_7;
  }
  id v14 = (id)objc_msgSend(-[TSDShapeLayout path](self, "path"), "copy");
  [v14 takeAttributesFromStroke:v6];
  if (a3 || [v14 isEffectivelyClosed]) {
    uint64_t v15 = objc_msgSend(v14, "uniteWithBezierPath:", objc_msgSend(v14, "outlineStroke"));
  }
  else {
    uint64_t v15 = [v14 outlineStroke];
  }
  id v8 = (void *)v15;
  if ([(TSDShapeLayout *)self pathIsOpen])
  {
    objc_super v7 = [(TSDShapeLayout *)self p_unitePath:[(TSDShapeLayout *)self p_unitePath:v8 withLineEndForHead:1 stroke:v6] withLineEndForHead:0 stroke:v6];
    goto LABEL_6;
  }
LABEL_7:
  [(TSDShapeLayout *)self pathBounds];
  double v10 = v9;
  double v12 = v11;
  if (!TSDNearlyEqualPoints(*MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v9, v11))
  {
    CGAffineTransformMakeTranslation(&v16, -v10, -v12);
    [v8 transformUsingAffineTransform:&v16];
  }
  return v8;
}

- (id)p_cachedPath
{
  if (*(_WORD *)&self->mShapeInvalidFlags)
  {
    self->mCachedPath = (TSDBezierPath *)(id)objc_msgSend(-[TSDShapeLayout pathSource](self, "pathSource"), "bezierPath");
    *(_WORD *)&self->mShapeInvalidFlags &= ~1u;
  }
  return self->mCachedPath;
}

- (CGRect)p_cachedPathBounds
{
  if ((*(_WORD *)&self->mShapeInvalidFlags & 2) != 0)
  {
    objc_msgSend(-[TSDShapeLayout stroke](self, "stroke"), "boundsForPath:", -[TSDShapeLayout path](self, "path"));
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    if ([(TSDShapeLayout *)self pathIsOpen]
      && objc_msgSend(-[TSDShapeLayout stroke](self, "stroke"), "supportsWidth"))
    {
      long long v29 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      long long v30 = *MEMORY[0x263F000D0];
      long long v28 = v30;
      long long v31 = v29;
      long long v32 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      long long v27 = v32;
      [(TSDShapeLayout *)self p_boundsOfLineEndForHead:1 transform:&v30];
      v38.origin.CGFloat x = v11;
      v38.origin.CGFloat y = v12;
      v38.size.CGFloat width = v13;
      v38.size.CGFloat height = v14;
      v33.origin.CGFloat x = v4;
      v33.origin.CGFloat y = v6;
      v33.size.CGFloat width = v8;
      v33.size.CGFloat height = v10;
      CGRect v34 = CGRectUnion(v33, v38);
      CGFloat x = v34.origin.x;
      CGFloat y = v34.origin.y;
      CGFloat width = v34.size.width;
      CGFloat height = v34.size.height;
      long long v30 = v28;
      long long v31 = v29;
      long long v32 = v27;
      [(TSDShapeLayout *)self p_boundsOfLineEndForHead:0 transform:&v30];
      v39.origin.CGFloat x = v19;
      v39.origin.CGFloat y = v20;
      v39.size.CGFloat width = v21;
      v39.size.CGFloat height = v22;
      v35.origin.CGFloat x = x;
      v35.origin.CGFloat y = y;
      v35.size.CGFloat width = width;
      v35.size.CGFloat height = height;
      CGRect v36 = CGRectUnion(v35, v39);
      CGFloat v4 = v36.origin.x;
      CGFloat v6 = v36.origin.y;
      CGFloat v8 = v36.size.width;
      CGFloat v10 = v36.size.height;
    }
    self->mCachedPathBounds.origin.CGFloat x = v4;
    self->mCachedPathBounds.origin.CGFloat y = v6;
    self->mCachedPathBounds.size.CGFloat width = v8;
    self->mCachedPathBounds.size.CGFloat height = v10;
    *(_WORD *)&self->mShapeInvalidFlags &= ~2u;
  }
  double v23 = self->mCachedPathBounds.origin.x;
  double v24 = self->mCachedPathBounds.origin.y;
  double v25 = self->mCachedPathBounds.size.width;
  double v26 = self->mCachedPathBounds.size.height;
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

- (CGRect)p_cachedPathBoundsWithoutStroke
{
  if ((*(_WORD *)&self->mShapeInvalidFlags & 4) != 0)
  {
    objc_msgSend(-[TSDShapeLayout path](self, "path"), "bounds");
    self->mCachedPathBoundsWithoutStroke.origin.double x = v3;
    self->mCachedPathBoundsWithoutStroke.origin.double y = v4;
    self->mCachedPathBoundsWithoutStroke.size.double width = v5;
    self->mCachedPathBoundsWithoutStroke.size.double height = v6;
    *(_WORD *)&self->mShapeInvalidFlags &= ~4u;
  }
  double x = self->mCachedPathBoundsWithoutStroke.origin.x;
  double y = self->mCachedPathBoundsWithoutStroke.origin.y;
  double width = self->mCachedPathBoundsWithoutStroke.size.width;
  double height = self->mCachedPathBoundsWithoutStroke.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)p_cachedPathIsOpen
{
  if ((*(_WORD *)&self->mShapeInvalidFlags & 8) != 0)
  {
    self->mCachedPathIsOpen = objc_msgSend(-[TSDShapeLayout path](self, "path"), "isOpen");
    *(_WORD *)&self->mShapeInvalidFlags &= ~8u;
  }
  return self->mCachedPathIsOpen;
}

- (BOOL)p_cachedPathIsLineSegment
{
  if ((*(_WORD *)&self->mShapeInvalidFlags & 0x10) != 0)
  {
    self->mCachedPathIsLineSegment = objc_msgSend(-[TSDShapeLayout path](self, "path"), "isLineSegment");
    *(_WORD *)&self->mShapeInvalidFlags &= ~0x10u;
  }
  return self->mCachedPathIsLineSegment;
}

- (void)p_invalidateHead
{
  *(_WORD *)&self->mShapeInvalidFlags |= 0xC0u;
  [(TSDShapeLayout *)self p_invalidateClippedPath];
}

- (void)p_invalidateTail
{
  *(_WORD *)&self->mShapeInvalidFlags |= 0x140u;
  [(TSDShapeLayout *)self p_invalidateClippedPath];
}

- (void)p_invalidateClippedPath
{
  *(_WORD *)&self->mShapeInvalidFlags |= 0x200u;

  self->mCachedClippedPath = 0;
}

- (void)p_validateHeadAndTail
{
  __int16 mShapeInvalidFlags = (__int16)self->mShapeInvalidFlags;
  if ((mShapeInvalidFlags & 0x40) != 0)
  {
    *(_WORD *)&self->__int16 mShapeInvalidFlags = mShapeInvalidFlags & 0xFFBF;
    id v4 = [(TSDShapeLayout *)self path];
    [v4 getStartPoint:&self->mTailPoint andEndPoint:&self->mHeadPoint];
  }
}

- (void)p_validateHeadLineEnd
{
  [(TSDShapeLayout *)self p_validateHeadAndTail];
  __int16 mShapeInvalidFlags = (__int16)self->mShapeInvalidFlags;
  if ((mShapeInvalidFlags & 0x80) != 0)
  {
    *(_WORD *)&self->__int16 mShapeInvalidFlags = mShapeInvalidFlags & 0xFF7F;
    [(TSDShapeLayout *)self p_computeAngle:&self->mHeadLineEndAngle point:&self->mHeadLineEndPoint cutSegment:&self->mHeadCutSegment cutT:&self->mHeadCutT forLineEndAtHead:1];
  }
}

- (void)p_validateTailLineEnd
{
  if ((*(_WORD *)&self->mShapeInvalidFlags & 0x100) != 0)
  {
    *(_WORD *)&self->mShapeInvalidFlags &= ~0x100u;
    [(TSDShapeLayout *)self p_computeAngle:&self->mTailLineEndAngle point:&self->mTailLineEndPoint cutSegment:&self->mTailCutSegment cutT:&self->mTailCutT forLineEndAtHead:0];
  }
}

- (void)p_computeAngle:(double *)a3 point:(CGPoint *)a4 cutSegment:(int64_t *)a5 cutT:(double *)a6 forLineEndAtHead:(BOOL)a7
{
  BOOL v7 = a7;
  [(TSDShapeLayout *)self p_validateHeadAndTail];
  CGFloat v13 = &OBJC_IVAR___TSDShapeLayout_mTailPoint;
  if (v7) {
    CGFloat v13 = &OBJC_IVAR___TSDShapeLayout_mHeadPoint;
  }
  CGFloat v14 = (double *)((char *)self + *v13);
  double v16 = *v14;
  double v15 = v14[1];
  if (v7) {
    id v17 = [(TSDShapeLayout *)self strokeHeadLineEnd];
  }
  else {
    id v17 = [(TSDShapeLayout *)self strokeTailLineEnd];
  }
  CGPoint v18 = v17;
  if (v17 && ([v17 isNone] & 1) == 0)
  {
    BoundingBodouble x = CGPathGetBoundingBox((CGPathRef)[v18 path]);
    double MaxY = CGRectGetMaxY(BoundingBox);
    [v18 endPoint];
    double v21 = MaxY - v20;
    if (![v18 isFilled]) {
      double v21 = v21 + 0.75;
    }
    [(TSDShapeLayout *)self lineEndScale];
    double v23 = v22 * v21;
    double v24 = +[TSDBezierPath bezierPathWithOvalInRect:](TSDBezierPath, "bezierPathWithOvalInRect:", v16 - v23, v15 - v23, v23 + v23, v23 + v23);
    id v43 = objc_alloc_init(MEMORY[0x263EFF980]);
    objc_msgSend(-[TSDShapeLayout path](self, "path"), "addIntersectionsWithPath:to:allIntersections:reversed:", v24, v43, 0, v7);
    if ([v43 count])
    {
      [v43 sortUsingSelector:sel_compareSegmentAndT_];
      if (v7) {
        double v25 = (void *)[v43 lastObject];
      }
      else {
        double v25 = (void *)[v43 objectAtIndex:0];
      }
      double v26 = v25;
      [v25 point];
      double v29 = v28;
      double v31 = v30;
    }
    else
    {
      if (v7)
      {
        double v26 = 0;
        uint64_t v27 = 440;
      }
      else
      {
        double v26 = 0;
        uint64_t v27 = 424;
      }
      long long v32 = (double *)((char *)self + v27);
      double v29 = *v32;
      double v31 = v32[1];
    }
    double v33 = TSDSubtractPoints(v16, v15, v29);
    *a3 = TSDAngleFromDelta(v33, v34) + -1.57079633;
    double v35 = TSDSubtractPoints(v29, v31, v16);
    double v37 = *MEMORY[0x263F00148];
    if (v35 != *MEMORY[0x263F00148] || v36 != *(double *)(MEMORY[0x263F00148] + 8))
    {
      double v39 = TSDNormalizePoint(v35, v36);
      double v37 = TSDMultiplyPointScalar(v39, v40, v23);
    }
    a4->double x = TSDAddPoints(v16, v15, v37);
    a4->double y = v41;
    if (v26)
    {
      *a5 = [v26 segment];
      [v26 t];
    }
    else
    {
      *a5 = 0;
      uint64_t v42 = 0;
    }
    *(void *)a6 = v42;
  }
  else
  {
    *a3 = 1.57079633;
    a4->double x = v16;
    a4->double y = v15;
    *a5 = -1;
    *a6 = 0.0;
  }
}

- (id)p_createClippedPath
{
  if ([(TSDShapeLayout *)self pathIsOpen])
  {
    if (objc_msgSend(-[TSDShapeLayout stroke](self, "stroke"), "supportsWidth"))
    {
      [(TSDShapeLayout *)self p_validateHeadLineEnd];
      [(TSDShapeLayout *)self p_validateTailLineEnd];
      if ((self->mHeadCutSegment & 0x8000000000000000) == 0 || (self->mTailCutSegment & 0x8000000000000000) == 0)
      {
        objc_msgSend(-[TSDShapeLayout stroke](self, "stroke"), "width");
        double v4 = v3;
        CGFloat v5 = objc_alloc_init(TSDBezierPath);
        objc_msgSend(-[TSDShapeLayout stroke](self, "stroke"), "lineEndInsetAdjustment");
        double v7 = v6;
        double v8 = TSDDeltaFromAngle(self->mTailLineEndAngle + 1.57079633);
        double v9 = v4 * v7;
        double v11 = TSDMultiplyPointScalar(v8, v10, v9);
        double x = self->mTailLineEndPoint.x;
        double y = self->mTailLineEndPoint.y;
        double v14 = TSDAddPoints(x, y, v11);
        double v16 = v15;
        double v17 = TSDDeltaFromAngle(self->mHeadLineEndAngle + 1.57079633);
        double v19 = TSDMultiplyPointScalar(v17, v18, v9);
        double v20 = TSDAddPoints(self->mHeadLineEndPoint.x, self->mHeadLineEndPoint.y, v19);
        double v22 = v21;
        int64_t mHeadCutSegment = self->mHeadCutSegment;
        int64_t mTailCutSegment = self->mTailCutSegment;
        if ((mHeadCutSegment < 0 || mHeadCutSegment >= mTailCutSegment)
          && (mHeadCutSegment != mTailCutSegment || self->mHeadCutT >= self->mTailCutT))
        {
          if (mTailCutSegment < 0)
          {
            -[TSDBezierPath moveToPoint:](v5, "moveToPoint:", x, y);
          }
          else
          {
            -[TSDBezierPath moveToPoint:](v5, "moveToPoint:", v14, v16);
            -[TSDBezierPath lineToPoint:](v5, "lineToPoint:", self->mTailLineEndPoint.x, self->mTailLineEndPoint.y);
          }
          [(TSDBezierPath *)v5 appendBezierPath:[(TSDShapeLayout *)self path] fromSegment:self->mTailCutSegment t:self->mHeadCutSegment toSegment:1 t:self->mTailCutT withoutMove:self->mHeadCutT];
          if (self->mHeadCutSegment < 0) {
            return v5;
          }
        }
        else
        {
          -[TSDBezierPath moveToPoint:](v5, "moveToPoint:", v14, v16);
        }
        -[TSDBezierPath lineToPoint:](v5, "lineToPoint:", v20, v22);
        return v5;
      }
    }
  }
  id v25 = [(TSDShapeLayout *)self path];

  return v25;
}

- (CGRect)p_boundsOfLineEndForHead:(BOOL)a3 transform:(CGAffineTransform *)a4
{
  BOOL v5 = a3;
  double v7 = (double *)MEMORY[0x263F001A0];
  if (a3) {
    id v8 = [(TSDShapeLayout *)self strokeHeadLineEnd];
  }
  else {
    id v8 = [(TSDShapeLayout *)self strokeTailLineEnd];
  }
  id v9 = v8;
  double v10 = *v7;
  double v11 = v7[1];
  double v12 = v7[2];
  double v13 = v7[3];
  if (v8 && ([v8 isNone] & 1) == 0)
  {
    if (v5)
    {
      [(TSDShapeLayout *)self headLineEndPoint];
      double v15 = v14;
      double v17 = v16;
      [(TSDShapeLayout *)self headLineEndAngle];
    }
    else
    {
      [(TSDShapeLayout *)self tailLineEndPoint];
      double v15 = v19;
      double v17 = v20;
      [(TSDShapeLayout *)self tailLineEndAngle];
    }
    double v21 = v18;
    id v22 = [(TSDShapeLayout *)self stroke];
    [(TSDShapeLayout *)self lineEndScale];
    long long v23 = *(_OWORD *)&a4->c;
    v33[0] = *(_OWORD *)&a4->a;
    v33[1] = v23;
    v33[2] = *(_OWORD *)&a4->tx;
    objc_msgSend(v22, "boundsForLineEnd:atPoint:atAngle:withScale:transform:", v9, v33, v15, v17, v21, v24);
    double v10 = v25;
    double v11 = v26;
    double v12 = v27;
    double v13 = v28;
  }
  double v29 = v10;
  double v30 = v11;
  double v31 = v12;
  double v32 = v13;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

- (id)p_unitePath:(id)a3 withLineEndForHead:(BOOL)a4 stroke:(id)a5
{
  BOOL v6 = a4;
  if (a4) {
    id v9 = [(TSDShapeLayout *)self strokeHeadLineEnd];
  }
  else {
    id v9 = [(TSDShapeLayout *)self strokeTailLineEnd];
  }
  id v10 = v9;
  if (!v9 || ([v9 isNone] & 1) != 0) {
    return a3;
  }
  if (v6)
  {
    [(TSDShapeLayout *)self headLineEndPoint];
    double v13 = v12;
    double v15 = v14;
    [(TSDShapeLayout *)self headLineEndAngle];
  }
  else
  {
    [(TSDShapeLayout *)self tailLineEndPoint];
    double v13 = v17;
    double v15 = v18;
    [(TSDShapeLayout *)self tailLineEndAngle];
  }
  double v19 = v16;
  [(TSDShapeLayout *)self lineEndScale];
  uint64_t v21 = objc_msgSend(a5, "pathForLineEnd:wrapPath:atPoint:atAngle:withScale:", v10, 1, v13, v15, v19, v20);

  return (id)[a3 uniteWithBezierPath:v21];
}

- (void)p_updateResizeInfoGeometryFromResizePathSource
{
  mResizePathSource = self->mResizePathSource;
  objc_msgSend(-[TSDPathSource bezierPath](mResizePathSource, "bezierPath"), "bounds");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = self->mResizeInfoGeometry;
  self->mResizeInfoGeometrdouble y = -[TSDInfoGeometry geometryWithNewBounds:](self->mResizeInfoGeometry, "geometryWithNewBounds:", v5, v7, v9, v11);

  [(TSDPathSource *)mResizePathSource alignToOrigin];
}

- (TSDFill)dynamicFill
{
  return self->mDynamicFill;
}

- (void)setDynamicFill:(id)a3
{
}

@end