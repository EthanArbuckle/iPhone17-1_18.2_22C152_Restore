@interface TSDDrawableLayout
- (BOOL)allowsConnections;
- (BOOL)hasAlpha;
- (BOOL)isHTMLWrap;
- (BOOL)supportsInspectorPositioning;
- (CGRect)boundsInfluencingExteriorWrap;
- (id)i_computeWrapPath;
- (id)i_externalWrapPath;
- (id)i_wrapPath;
- (id)wrapPolygon;
- (int)wrapDirection;
- (int)wrapFitType;
- (int)wrapType;
- (void)dealloc;
- (void)dragBy:(CGPoint)a3;
- (void)i_invalidateWrap;
- (void)invalidate;
- (void)invalidateExteriorWrap;
- (void)invalidateParentForWrap;
- (void)parentDidChange;
- (void)processChangedProperty:(int)a3;
- (void)setGeometry:(id)a3;
@end

@implementation TSDDrawableLayout

- (void)dealloc
{
  self->mCachedWrapPolygon = 0;
  self->mCachedWrapPath = 0;

  self->mCachedExternalWrapPath = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSDDrawableLayout;
  [(TSDLayout *)&v3 dealloc];
}

- (CGRect)boundsInfluencingExteriorWrap
{
  [(TSDAbstractLayout *)self frameInRoot];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  v11 = (void *)[(TSDInfo *)[(TSDLayout *)self info] exteriorTextWrap];
  if (v11)
  {
    [v11 margin];
    if (v12 > 0.0)
    {
      CGFloat v13 = -v12;
      v18.origin.CGFloat x = x;
      v18.origin.CGFloat y = y;
      v18.size.CGFloat width = width;
      v18.size.CGFloat height = height;
      CGRect v19 = CGRectInset(v18, v13, v13);
      CGFloat x = v19.origin.x;
      CGFloat y = v19.origin.y;
      CGFloat width = v19.size.width;
      CGFloat height = v19.size.height;
    }
  }
  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (id)i_computeWrapPath
{
  [(TSDLayoutGeometry *)[(TSDAbstractLayout *)self geometry] size];
  double v2 = TSDRectWithSize();

  return +[TSDBezierPath bezierPathWithRect:v2];
}

- (id)i_wrapPath
{
  id result = self->mCachedWrapPath;
  if (!result)
  {
    id result = [(TSDDrawableLayout *)self i_computeWrapPath];
    self->mCachedWrapPath = (TSDBezierPath *)result;
  }
  return result;
}

- (id)i_externalWrapPath
{
  id result = self->mCachedExternalWrapPath;
  if (!result)
  {
    id result = +[TSDBezierPath exteriorOfBezierPath:[(TSDDrawableLayout *)self i_wrapPath]];
    self->mCachedExternalWrapPath = (TSDBezierPath *)result;
  }
  return result;
}

- (id)wrapPolygon
{
  id result = self->mCachedWrapPolygon;
  if (!result)
  {
    v4 = [(TSDDrawableLayout *)self i_wrapPath];
    double v5 = (void *)[(TSDInfo *)[(TSDLayout *)self info] exteriorTextWrap];
    if (v5 && (v6 = v5, [v5 margin], v7 > 0.0))
    {
      if ([(TSDBezierPath *)v4 elementCount] >= 1001)
      {
        [(TSDLayoutGeometry *)[(TSDAbstractLayout *)self geometry] size];
        v4 = +[TSDBezierPath bezierPathWithRect:TSDRectWithSize()];
      }
      [v6 margin];
      id v8 = -[TSDBezierPath bezierPathByOffsettingPath:joinStyle:withThreshold:](v4, "bezierPathByOffsettingPath:joinStyle:withThreshold:", 1);
    }
    else
    {
      id v8 = (id)[(TSDBezierPath *)v4 copy];
    }
    double v9 = v8;
    [(TSDAbstractLayout *)self transformInRoot];
    [v9 transformUsingAffineTransform:v13];
    v10 = [[TSDWrapPolygon alloc] initWithPath:v9];
    self->mCachedWrapPolygon = v10;
    [(TSDWrapPolygon *)v10 setIntersectsSelf:0];
    id result = self->mCachedWrapPolygon;
    if (!result)
    {
      v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[TSDDrawableLayout wrapPolygon]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDrawableLayout.m"), 118, @"invalid nil value for '%s'", "mCachedWrapPolygon");
      return self->mCachedWrapPolygon;
    }
  }
  return result;
}

- (BOOL)isHTMLWrap
{
  double v2 = (void *)[(TSDInfo *)[(TSDLayout *)self info] exteriorTextWrap];
  if (v2)
  {
    LOBYTE(v2) = [v2 isHTMLWrap];
  }
  return (char)v2;
}

- (int)wrapType
{
  double v2 = (void *)[(TSDInfo *)[(TSDLayout *)self info] exteriorTextWrap];
  if (v2)
  {
    LODWORD(v2) = [v2 type];
  }
  return (int)v2;
}

- (int)wrapDirection
{
  double v2 = (void *)[(TSDInfo *)[(TSDLayout *)self info] exteriorTextWrap];
  if (!v2) {
    return 2;
  }

  return [v2 direction];
}

- (int)wrapFitType
{
  double v2 = (void *)[(TSDInfo *)[(TSDLayout *)self info] exteriorTextWrap];
  if (v2)
  {
    LODWORD(v2) = [v2 fitType];
  }
  return (int)v2;
}

- (BOOL)hasAlpha
{
  return 0;
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)TSDDrawableLayout;
  [(TSDLayout *)&v3 invalidate];
  [(TSDDrawableLayout *)self invalidateParentForWrap];
}

- (void)invalidateExteriorWrap
{
  self->mCachedWrapPolygon = 0;
  self->mCachedWrapPath = 0;

  self->mCachedExternalWrapPath = 0;
}

- (void)dragBy:(CGPoint)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSDDrawableLayout;
  -[TSDLayout dragBy:](&v4, sel_dragBy_, a3.x, a3.y);
  [(TSDDrawableLayout *)self invalidateParentForWrap];
}

- (void)setGeometry:(id)a3
{
  double v5 = [(TSDAbstractLayout *)self geometry];
  if (!v5)
  {
    if (!self->mCachedWrapPolygon) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  v6 = v5;
  if ([(TSDLayoutGeometry *)v5 isEqual:a3] || !self->mCachedWrapPolygon) {
    goto LABEL_11;
  }
  if ([(TSDLayoutGeometry *)v6 differsInMoreThanTranslationFrom:a3])
  {
LABEL_8:
    [(TSDDrawableLayout *)self invalidateExteriorWrap];
    goto LABEL_11;
  }
  if (a3)
  {
    [a3 transform];
    float64x2_t v8 = v23;
    float64x2_t v9 = v24;
    float64x2_t v10 = v25;
  }
  else
  {
    float64x2_t v10 = 0uLL;
    float64x2_t v24 = 0u;
    float64x2_t v25 = 0u;
    float64x2_t v23 = 0u;
    float64x2_t v8 = 0uLL;
    float64x2_t v9 = 0uLL;
  }
  double v11 = *(double *)(MEMORY[0x263F00148] + 8);
  long long v16 = *MEMORY[0x263F00148];
  float64x2_t v17 = vaddq_f64(v10, vmlaq_n_f64(vmulq_n_f64(v9, v11), v8, *MEMORY[0x263F00148]));
  [(TSDLayoutGeometry *)v6 transform];
  double v12 = TSDSubtractPoints(v17.f64[0], v17.f64[1], vaddq_f64(v22, vmlaq_n_f64(vmulq_n_f64(v21, v15), v20, *(double *)&v16)).f64[0]);
  mCachedWrapPolygon = self->mCachedWrapPolygon;
  CGAffineTransformMakeTranslation(&v19, v12, v14);
  [(TSDWrapPolygon *)mCachedWrapPolygon transformUsingAffineTransform:&v19];
LABEL_11:
  v18.receiver = self;
  v18.super_class = (Class)TSDDrawableLayout;
  [(TSDAbstractLayout *)&v18 setGeometry:a3];
}

- (void)processChangedProperty:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSDDrawableLayout;
  -[TSDLayout processChangedProperty:](&v5, sel_processChangedProperty_);
  if (a3 == 521) {
    [(TSDDrawableLayout *)self invalidateExteriorWrap];
  }
}

- (void)parentDidChange
{
  [(TSDDrawableLayout *)self invalidateExteriorWrap];
  v3.receiver = self;
  v3.super_class = (Class)TSDDrawableLayout;
  [(TSDLayout *)&v3 parentDidChange];
}

- (BOOL)allowsConnections
{
  return 1;
}

- (void)i_invalidateWrap
{
  objc_super v3 = [(TSDAbstractLayout *)self parent];
  if (v3)
  {
    objc_super v4 = v3;
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_super v4 = [(TSDAbstractLayout *)v4 parent];
      if (!v4) {
        return;
      }
    }
    [(TSDAbstractLayout *)v4 wrappableChildInvalidated:self];
  }
}

- (void)invalidateParentForWrap
{
  if ([(TSDLayout *)self isBeingManipulated])
  {
    [(TSDDrawableLayout *)self i_invalidateWrap];
  }
}

- (BOOL)supportsInspectorPositioning
{
  if ([(TSDInfo *)[(TSDLayout *)self info] isAnchoredToText]
    && (objc_msgSend((id)-[TSDInfo exteriorTextWrap](-[TSDLayout info](self, "info"), "exteriorTextWrap"), "isHTMLWrap") & 1) != 0)
  {
    return 0;
  }
  else
  {
    return [(TSDInfo *)[(TSDLayout *)self info] isInlineWithText] ^ 1;
  }
}

@end