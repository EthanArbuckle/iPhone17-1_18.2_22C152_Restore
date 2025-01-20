@interface TSDMovieLayout
- (BOOL)supportsRotation;
- (CGRect)computeAlignmentFrameInRoot:(BOOL)a3;
- (CGRect)fullReflectionBoundsForRect:(CGRect)a3;
- (CGRect)fullReflectionFrame;
- (TSDMovieLayout)initWithInfo:(id)a3;
- (id)computeLayoutGeometry;
- (id)i_computeWrapPath;
- (id)layoutGeometryFromInfo;
- (id)movieInfo;
- (void)beginDynamicOperation;
- (void)dealloc;
- (void)endDynamicOperation;
- (void)p_createDynamicCopies;
- (void)p_destroyDynamicCopies;
- (void)processChangedProperty:(int)a3;
- (void)takeRotationFromTracker:(id)a3;
@end

@implementation TSDMovieLayout

- (TSDMovieLayout)initWithInfo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSDMovieLayout;
  v3 = [(TSDMediaLayout *)&v6 initWithInfo:a3];
  v4 = v3;
  if (v3)
  {
    if (![(TSDMovieLayout *)v3 movieInfo])
    {

      v4 = 0;
    }
    [(TSDLayout *)v4 invalidateFrame];
  }
  return v4;
}

- (void)dealloc
{
  self->mDynamicInfoGeometry = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSDMovieLayout;
  [(TSDDrawableLayout *)&v3 dealloc];
}

- (void)processChangedProperty:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSDMovieLayout;
  -[TSDMediaLayout processChangedProperty:](&v5, sel_processChangedProperty_);
  if (a3 == 517) {
    [(TSDDrawableLayout *)self invalidateExteriorWrap];
  }
}

- (id)i_computeWrapPath
{
  [(TSDLayoutGeometry *)[(TSDAbstractLayout *)self geometry] size];
  double v2 = TSDRectWithSize();

  return +[TSDBezierPath bezierPathWithRect:v2];
}

- (BOOL)supportsRotation
{
  return 1;
}

- (id)layoutGeometryFromInfo
{
  if (self->mDynamicInfoGeometry)
  {
    double v2 = [[TSDLayoutGeometry alloc] initWithInfoGeometry:self->mDynamicInfoGeometry];
    return v2;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)TSDMovieLayout;
    return [(TSDLayout *)&v4 layoutGeometryFromInfo];
  }
}

- (id)movieInfo
{
  objc_opt_class();
  [(TSDLayout *)self info];

  return (id)TSUDynamicCast();
}

- (void)takeRotationFromTracker:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TSDMovieLayout;
  -[TSDLayout takeRotationFromTracker:](&v11, sel_takeRotationFromTracker_);

  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  if (a3) {
    [a3 rotateTransform];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  [(TSDLayout *)self layoutTransformInInfoSpace:v7];
  objc_super v5 = (void *)[(TSDInfo *)[(TSDLayout *)self info] geometry];
  v6[0] = v8;
  v6[1] = v9;
  v6[2] = v10;
  self->mDynamicInfoGeometry = (TSDInfoGeometry *)(id)[v5 geometryByAppendingTransform:v6];
  [(TSDLayout *)self invalidatePosition];
}

- (void)beginDynamicOperation
{
  v3.receiver = self;
  v3.super_class = (Class)TSDMovieLayout;
  [(TSDLayout *)&v3 beginDynamicOperation];
  [(TSDMovieLayout *)self p_createDynamicCopies];
}

- (void)endDynamicOperation
{
  if ([(TSDInfo *)[(TSDLayout *)self info] owningAttachment]) {
    [(TSDDrawableLayout *)self invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)TSDMovieLayout;
  [(TSDLayout *)&v3 endDynamicOperation];
  [(TSDMovieLayout *)self p_destroyDynamicCopies];
}

- (CGRect)fullReflectionBoundsForRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat MinX = CGRectGetMinX(a3);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  CGFloat v9 = CGRectGetWidth(v15);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double v10 = CGRectGetHeight(v16) + 1.0;
  double v11 = MinX;
  double v12 = MaxY;
  double v13 = v9;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (CGRect)fullReflectionFrame
{
  [(TSDStyledLayout *)self i_baseFrame];

  -[TSDMovieLayout fullReflectionBoundsForRect:](self, "fullReflectionBoundsForRect:");
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (id)computeLayoutGeometry
{
  v36.receiver = self;
  v36.super_class = (Class)TSDMovieLayout;
  id v3 = [(TSDLayout *)&v36 computeLayoutGeometry];
  objc_opt_class();
  [(TSDMediaLayout *)self stroke];
  double v4 = (void *)TSUDynamicCast();
  [(TSDMediaLayout *)self setShouldRenderFrameStroke:0];
  if (v4 && [v4 shouldRender])
  {
    if ([v4 isFrame])
    {
      [v3 size];
      double v5 = TSDRectWithSize();
      uint64_t v7 = v6;
      uint64_t v9 = v8;
      uint64_t v11 = v10;
      objc_msgSend(v4, "coverageRect:");
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      double v17 = v16;
      double v19 = v18;
      v20 = (void *)[v3 mutableCopy];
      objc_msgSend(v20, "setSize:", v17, v19);
      if (v20) {
        [v20 transform];
      }
      else {
        memset(&v34, 0, sizeof(v34));
      }
      CGAffineTransformTranslate(&v35, &v34, v13, v15);
      CGAffineTransform v33 = v35;
      [v20 setTransform:&v33];
      id v21 = v20;
      double v28 = -v13;
      double v29 = -v15;
      double v24 = v5;
      uint64_t v25 = v7;
      uint64_t v26 = v9;
      uint64_t v27 = v11;
    }
    else
    {
      [v4 width];
      double v23 = v22 * 0.5;
      id v21 = (id)objc_msgSend(v3, "geometryByOutsettingBy:", v23, v23);
      [v3 size];
      double v24 = TSDRectWithSize();
      double v28 = v23;
      double v29 = v23;
    }
    CGRect v37 = CGRectOffset(*(CGRect *)&v24, v28, v29);
    -[TSDMediaLayout setBoundsForStandardKnobs:](self, "setBoundsForStandardKnobs:", v37.origin.x, v37.origin.y, v37.size.width, v37.size.height);
  }
  else
  {
    [v3 size];
    [(TSDMediaLayout *)self setBoundsForStandardKnobs:TSDRectWithSize()];
    id v21 = v3;
    if (!v4) {
      return v3;
    }
  }
  if ([v4 isFrame])
  {
    [v3 size];
    [v4 coverageRectWithoutAdornment:TSDRectWithSize()];
    -[TSDMediaLayout setShouldRenderFrameStroke:](self, "setShouldRenderFrameStroke:", objc_msgSend(v4, "shouldRenderForSizeIncludingCoverage:", v30, v31));
  }
  return v21;
}

- (CGRect)computeAlignmentFrameInRoot:(BOOL)a3
{
  BOOL v3 = a3;
  memset(&v10, 0, sizeof(v10));
  double v5 = [(TSDAbstractLayout *)self geometry];
  if (v5)
  {
    [(TSDLayoutGeometry *)v5 fullTransform];
    if (!v3) {
      goto LABEL_10;
    }
  }
  else
  {
    memset(&v10, 0, sizeof(v10));
    if (!v3) {
      goto LABEL_10;
    }
  }
  if ([(TSDAbstractLayout *)self parent])
  {
    uint64_t v6 = [(TSDAbstractLayout *)self parent];
    if (v6) {
      [(TSDAbstractLayout *)v6 transformInRoot];
    }
    else {
      memset(&t2, 0, sizeof(t2));
    }
    CGAffineTransform v7 = v10;
    CGAffineTransformConcat(&v9, &v7, &t2);
    CGAffineTransform v10 = v9;
  }
LABEL_10:
  CGAffineTransform v9 = v10;
  v11.origin.CGFloat x = 0.0;
  v11.origin.CGFloat y = 0.0;
  v11.size.CGFloat width = 1.0;
  v11.size.CGFloat height = 1.0;
  return CGRectApplyAffineTransform(v11, &v9);
}

- (void)p_createDynamicCopies
{
  if (self->mDynamicInfoGeometry)
  {
    BOOL v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDMovieLayout p_createDynamicCopies]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieLayout.m"), 240, @"expected nil value for '%s'", "mDynamicInfoGeometry");
  }
  self->mDynamicInfoGeometrCGFloat y = (TSDInfoGeometry *)objc_msgSend((id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry"), "copy");
}

- (void)p_destroyDynamicCopies
{
  mDynamicInfoGeometrCGFloat y = self->mDynamicInfoGeometry;
  if (!mDynamicInfoGeometry)
  {
    uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSDMovieLayout p_destroyDynamicCopies]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieLayout.m"), 246, @"invalid nil value for '%s'", "mDynamicInfoGeometry");
    mDynamicInfoGeometrCGFloat y = self->mDynamicInfoGeometry;
  }

  self->mDynamicInfoGeometrCGFloat y = 0;
}

@end