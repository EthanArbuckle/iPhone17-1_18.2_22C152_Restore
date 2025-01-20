@interface TSDAudioLayout
- (BOOL)allowsConnections;
- (BOOL)canAspectRatioLockBeChangedByUser;
- (BOOL)canFlip;
- (BOOL)resizeMayChangeAspectRatio;
- (BOOL)shouldDisplayGuides;
- (BOOL)supportsRotation;
- (CGRect)alignmentFrame;
- (CGRect)computeAlignmentFrameInRoot:(BOOL)a3;
- (TSDAudioLayout)initWithInfo:(id)a3;
- (id)layoutGeometryFromInfo;
- (id)movieInfo;
- (int)wrapType;
@end

@implementation TSDAudioLayout

- (TSDAudioLayout)initWithInfo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSDAudioLayout;
  v3 = [(TSDMediaLayout *)&v6 initWithInfo:a3];
  v4 = v3;
  if (v3)
  {
    if (![(TSDAudioLayout *)v3 movieInfo])
    {

      v4 = 0;
    }
    [(TSDLayout *)v4 invalidateFrame];
  }
  return v4;
}

- (BOOL)supportsRotation
{
  return 0;
}

- (BOOL)resizeMayChangeAspectRatio
{
  return 0;
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  return 0;
}

- (id)layoutGeometryFromInfo
{
  v2 = [(TSDLayoutGeometry *)[TSDMutableLayoutGeometry alloc] initWithInfoGeometry:[(TSDInfo *)[(TSDLayout *)self info] geometry]];
  -[TSDMutableLayoutGeometry setSize:](v2, "setSize:", 130.0, 66.0);
  v3 = (void *)[(TSDMutableLayoutGeometry *)v2 copy];

  return v3;
}

- (BOOL)shouldDisplayGuides
{
  return 0;
}

- (CGRect)computeAlignmentFrameInRoot:(BOOL)a3
{
  BOOL v3 = a3;
  memset(&v10, 0, sizeof(v10));
  v5 = [(TSDAbstractLayout *)self geometry];
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
    objc_super v6 = [(TSDAbstractLayout *)self parent];
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
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = 1.0;
  v11.size.height = 1.0;
  return CGRectApplyAffineTransform(v11, &v9);
}

- (CGRect)alignmentFrame
{
  v2 = [(TSDAbstractLayout *)self geometry];

  [(TSDLayoutGeometry *)v2 frame];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)allowsConnections
{
  return 0;
}

- (BOOL)canFlip
{
  return 0;
}

- (int)wrapType
{
  return 5;
}

- (id)movieInfo
{
  objc_opt_class();
  [(TSDLayout *)self info];

  return (id)TSUDynamicCast();
}

@end