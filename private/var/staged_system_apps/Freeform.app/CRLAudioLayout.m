@interface CRLAudioLayout
- (BOOL)canAspectRatioLockBeChangedByUser;
- (BOOL)supportsFlipping;
- (BOOL)supportsRotation;
- (CGRect)computeAlignmentFrameInRoot:(BOOL)a3;
- (CGSize)minimumSize;
- (CRLAudioLayout)initWithInfo:(id)a3;
- (_TtC8Freeform12CRLMovieItem)movieInfo;
- (id)computeLayoutGeometry;
@end

@implementation CRLAudioLayout

- (CRLAudioLayout)initWithInfo:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRLAudioLayout;
  v3 = [(CRLMediaLayout *)&v7 initWithInfo:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(CRLAudioLayout *)v3 movieInfo];
    if (!v5)
    {

      v4 = 0;
    }
    [(CRLCanvasLayout *)v4 invalidateFrame];
  }
  return v4;
}

- (BOOL)supportsRotation
{
  return 1;
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  return 0;
}

- (CGRect)computeAlignmentFrameInRoot:(BOOL)a3
{
  BOOL v3 = a3;
  memset(&v13, 0, sizeof(v13));
  v5 = [(CRLCanvasAbstractLayout *)self geometry];
  v6 = v5;
  if (v5) {
    [v5 fullTransform];
  }
  else {
    memset(&v13, 0, sizeof(v13));
  }

  if (v3)
  {
    objc_super v7 = [(CRLCanvasAbstractLayout *)self parent];

    if (v7)
    {
      v8 = [(CRLCanvasAbstractLayout *)self parent];
      v9 = v8;
      if (v8) {
        [v8 transformInRoot];
      }
      else {
        memset(&t2, 0, sizeof(t2));
      }
      CGAffineTransform v10 = v13;
      CGAffineTransformConcat(&v12, &v10, &t2);
      CGAffineTransform v13 = v12;
    }
  }
  CGAffineTransform v12 = v13;
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = 1.0;
  v14.size.height = 1.0;
  return CGRectApplyAffineTransform(v14, &v12);
}

- (CGSize)minimumSize
{
  +[CRLMovieItem defaultAudioItemSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)supportsFlipping
{
  return 0;
}

- (_TtC8Freeform12CRLMovieItem)movieInfo
{
  uint64_t v3 = objc_opt_class();
  v4 = [(CRLCanvasLayout *)self info];
  v5 = sub_1002469D0(v3, v4);

  return (_TtC8Freeform12CRLMovieItem *)v5;
}

- (id)computeLayoutGeometry
{
  uint64_t v3 = [(CRLBoardItemLayout *)self layoutGeometryFromInfo];
  uint64_t v4 = objc_opt_class();
  v5 = [(CRLMediaLayout *)self stroke];
  v6 = sub_1002469D0(v4, v5);

  if (v6 && [v6 shouldRender])
  {
    [v6 renderedWidth];
    uint64_t v8 = [v3 geometryByOutsettingBy:v7 * 0.5, v7 * 0.5];

    uint64_t v3 = (void *)v8;
  }
  [v3 size];
  [(CRLMediaLayout *)self setBoundsForStandardKnobs:sub_100064070()];

  return v3;
}

@end