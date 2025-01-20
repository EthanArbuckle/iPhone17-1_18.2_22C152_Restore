@interface TSDStyledLayout
- (BOOL)canFlip;
- (BOOL)isInvisible;
- (CGRect)aliasedAlignmentFrameForScale:(double)a3;
- (CGRect)alignmentFrameInRoot;
- (CGRect)frameForCulling;
- (CGRect)i_baseFrame;
- (CGRect)reflectionBoundsForRect:(CGRect)a3;
- (CGRect)reflectionFrame;
- (CGRect)reflectionFrameForSubRect:(CGRect)a3;
- (CGRect)reflectionFrameInRoot;
- (CGRect)shadowedNaturalBoundsWithoutOffset;
- (double)opacity;
- (void)dynamicOpacityChangeDidBegin;
- (void)dynamicOpacityChangeDidEnd;
- (void)dynamicOpacityUpdateToValue:(double)a3;
@end

@implementation TSDStyledLayout

- (CGRect)aliasedAlignmentFrameForScale:(double)a3
{
  [(TSDAbstractLayout *)self alignmentFrame];

  double v8 = TSDRoundedRectForScale(v4, v5, v6, v7, a3);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)alignmentFrameInRoot
{
  v3 = [(TSDAbstractLayout *)self parent];
  [(TSDAbstractLayout *)self alignmentFrame];
  CGFloat x = v4;
  CGFloat y = v6;
  CGFloat width = v8;
  CGFloat height = v10;
  if (v3)
  {
    v12 = [(TSDAbstractLayout *)self parent];
    if (v12) {
      [(TSDAbstractLayout *)v12 transformInRoot];
    }
    else {
      memset(&v17, 0, sizeof(v17));
    }
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    CGRect v19 = CGRectApplyAffineTransform(v18, &v17);
    CGFloat x = v19.origin.x;
    CGFloat y = v19.origin.y;
    CGFloat width = v19.size.width;
    CGFloat height = v19.size.height;
  }
  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)shadowedNaturalBoundsWithoutOffset
{
  [(TSDLayoutGeometry *)[(TSDAbstractLayout *)self geometry] size];
  double x = TSDRectWithSize();
  CGFloat y = v4;
  CGFloat width = v6;
  CGFloat height = v8;
  double v10 = objc_msgSend(-[TSDStyledLayout styledInfo](self, "styledInfo"), "shadow");
  if (v10)
  {
    double v11 = v10;
    if ([v10 isEnabled])
    {
      [v11 radius];
      CGFloat v13 = -v12;
      v18.origin.double x = x;
      v18.origin.CGFloat y = y;
      v18.size.CGFloat width = width;
      v18.size.CGFloat height = height;
      CGRect v19 = CGRectInset(v18, v13, v13);
      double x = v19.origin.x;
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
  result.origin.double x = v14;
  return result;
}

- (CGRect)reflectionBoundsForRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat v7 = a3.size.height * 0.400000006;
  double v8 = a3.size.height * 0.400000006 + 1.0;
  CGFloat MinX = CGRectGetMinX(a3);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v15);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double v11 = CGRectGetWidth(v16);
  if (v7 >= 120.0) {
    double v12 = 121.0;
  }
  else {
    double v12 = v8;
  }
  double v13 = MinX;
  double v14 = MaxY;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)i_baseFrame
{
  [(TSDStyledLayout *)self alignmentFrameInRoot];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(TSDAbstractLayout *)self parent])
  {
    objc_msgSend(-[TSDAbstractLayout geometryInRoot](-[TSDAbstractLayout parent](self, "parent"), "geometryInRoot"), "frame");
    double v4 = TSDSubtractPoints(v4, v6, v11);
    double v6 = v12;
  }
  double v13 = v4;
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)reflectionFrame
{
  [(TSDStyledLayout *)self i_baseFrame];

  -[TSDStyledLayout reflectionBoundsForRect:](self, "reflectionBoundsForRect:");
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (CGRect)reflectionFrameInRoot
{
  [(TSDStyledLayout *)self alignmentFrameInRoot];

  -[TSDStyledLayout reflectionBoundsForRect:](self, "reflectionBoundsForRect:");
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (CGRect)reflectionFrameForSubRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(TSDStyledLayout *)self i_baseFrame];
  double v9 = v8;
  double v11 = v10;
  CGFloat v13 = v12;
  double v38 = v12;
  double v15 = v14;
  CGFloat v16 = -v8;
  CGFloat v17 = -v10;
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  CGRect v42 = CGRectOffset(v41, v16, v17);
  CGFloat v35 = v42.origin.y;
  CGFloat r1 = v42.origin.x;
  CGFloat v33 = v42.size.height;
  CGFloat v34 = v42.size.width;
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v42);
  v43.origin.CGFloat x = v9;
  v43.origin.CGFloat y = v11;
  v43.size.CGFloat width = v13;
  v43.size.CGFloat height = v15;
  double v18 = v15 + CGRectGetMaxY(v43);
  v44.origin.CGFloat y = v35;
  v44.origin.CGFloat x = r1;
  v44.size.CGFloat height = v33;
  v44.size.CGFloat width = v34;
  double r1a = v18 - CGRectGetMaxY(v44);
  v45.origin.CGFloat x = x;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  CGFloat v19 = CGRectGetWidth(v45);
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  CGFloat v20 = CGRectGetHeight(v46) + 1.0;
  -[TSDStyledLayout reflectionBoundsForRect:](self, "reflectionBoundsForRect:", v9, v11, v38, v15);
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  CGFloat v29 = MinX;
  double v30 = r1a;
  CGFloat v31 = v19;
  CGFloat v32 = v20;

  return CGRectIntersection(*(CGRect *)&v29, *(CGRect *)&v22);
}

- (CGRect)frameForCulling
{
  [(TSDAbstractLayout *)self alignmentFrame];
  double x = v25.origin.x;
  double y = v25.origin.y;
  double width = v25.size.width;
  double height = v25.size.height;
  CGFloat v7 = v25.origin.x;
  CGFloat v8 = v25.origin.y;
  CGFloat v9 = v25.size.width;
  CGFloat v10 = v25.size.height;
  if (!CGRectIsEmpty(v25))
  {
    double v11 = objc_msgSend(-[TSDStyledLayout styledInfo](self, "styledInfo"), "shadow");
    if (v11)
    {
      double v12 = v11;
      if ([v11 isEnabled])
      {
        objc_msgSend(v12, "shadowBoundsForRect:", x, y, width, height);
        v31.origin.double x = v13;
        v31.origin.double y = v14;
        v31.size.double width = v15;
        v31.size.double height = v16;
        v26.origin.double x = x;
        v26.origin.double y = y;
        v26.size.double width = width;
        v26.size.double height = height;
        CGRect v27 = CGRectUnion(v26, v31);
        CGFloat v7 = v27.origin.x;
        CGFloat v8 = v27.origin.y;
        CGFloat v9 = v27.size.width;
        CGFloat v10 = v27.size.height;
      }
    }
    if (objc_msgSend(-[TSDStyledLayout styledInfo](self, "styledInfo"), "reflection"))
    {
      -[TSDStyledLayout reflectionBoundsForRect:](self, "reflectionBoundsForRect:", x, y, width, height);
      v32.origin.double x = v17;
      v32.origin.double y = v18;
      v32.size.double width = v19;
      v32.size.double height = v20;
      v28.origin.double x = v7;
      v28.origin.double y = v8;
      v28.size.double width = v9;
      v28.size.double height = v10;
      CGRect v29 = CGRectUnion(v28, v32);
      CGFloat v7 = v29.origin.x;
      CGFloat v8 = v29.origin.y;
      CGFloat v9 = v29.size.width;
      CGFloat v10 = v29.size.height;
    }
  }
  double v21 = v7;
  double v22 = v8;
  double v23 = v9;
  double v24 = v10;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (double)opacity
{
  if (self->mIsUpdatingOpacity) {
    return self->mDynamicOpacity;
  }
  objc_msgSend(-[TSDStyledLayout styledInfo](self, "styledInfo"), "opacity");
  return v3;
}

- (BOOL)isInvisible
{
  return 0;
}

- (BOOL)canFlip
{
  return 1;
}

- (void)dynamicOpacityChangeDidBegin
{
  self->mIsUpdatingOpacitdouble y = 1;
}

- (void)dynamicOpacityUpdateToValue:(double)a3
{
  self->mDynamicOpacitdouble y = a3;
  float v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "canvasController"), "repForLayout:", self);

  [v3 processChangedProperty:518];
}

- (void)dynamicOpacityChangeDidEnd
{
  self->mIsUpdatingOpacitdouble y = 0;
}

@end