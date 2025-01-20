@interface SXTextTangierAttachmentLayout
- (CGRect)boundsInRoot;
- (CGRect)boundsInfluencingExteriorWrap;
- (TSDWrapPolygon)polygon;
- (id)wrapPolygon;
- (void)fixTransformFromInterimPosition;
- (void)setPolygon:(id)a3;
- (void)storeActualPosition;
- (void)validate;
@end

@implementation SXTextTangierAttachmentLayout

- (id)wrapPolygon
{
  v3 = [(SXTextTangierAttachmentLayout *)self polygon];

  if (!v3)
  {
    v4 = [(TSDLayout *)self info];
    v5 = [v4 exclusionPath];
    v6 = -[SXTextExclusionPath path](v5);
    v7 = [v6 TSDBezierPath];

    memset(&v26, 0, sizeof(v26));
    v8 = [(TSDLayout *)self info];
    v9 = [v8 exclusionPath];
    double v10 = -[SXTextExclusionPath position]((uint64_t)v9);
    v11 = [(TSDLayout *)self info];
    v12 = [v11 exclusionPath];
    -[SXTextExclusionPath position]((uint64_t)v12);
    CGAffineTransformMakeTranslation(&v26, v10, v13);

    CGAffineTransform v25 = v26;
    [v7 transformUsingAffineTransform:&v25];
    v14 = [(TSDLayout *)self info];
    v15 = [v14 exclusionPath];
    double v16 = -[SXAnimatedImageFrame duration]((uint64_t)v15);

    if (v16 > 0.0)
    {
      v17 = [(TSDLayout *)self info];
      v18 = [v17 exclusionPath];
      double v19 = -[SXAnimatedImageFrame duration]((uint64_t)v18);
      [v7 setLineWidth:v19 + v19];

      v20 = [MEMORY[0x263F7C690] outlineBezierPath:v7 withThreshold:0.0];
      uint64_t v21 = [v7 uniteWithBezierPath:v20];

      v7 = (void *)v21;
    }
    v22 = (void *)[objc_alloc(MEMORY[0x263F7C6F0]) initWithPath:v7];
    [(SXTextTangierAttachmentLayout *)self setPolygon:v22];
  }
  v23 = [(SXTextTangierAttachmentLayout *)self polygon];
  return v23;
}

- (void)fixTransformFromInterimPosition
{
  v7.receiver = self;
  v7.super_class = (Class)SXTextTangierAttachmentLayout;
  [(TSDAbstractLayout *)&v7 fixTransformFromInterimPosition];
  [(SXTextTangierAttachmentLayout *)self storeActualPosition];
  v3 = [(TSDLayout *)self info];
  v4 = [v3 exclusionPath];
  [(TSDAbstractLayout *)self frame];
  [(SXTextExclusionPath *)(uint64_t)v4 adjustYPositionWithCurrentPosition:v6];

  [(SXTextTangierAttachmentLayout *)self setPolygon:0];
}

- (void)validate
{
  BOOL v3 = [(TSDLayout *)self invalidGeometry];
  v4.receiver = self;
  v4.super_class = (Class)SXTextTangierAttachmentLayout;
  [(TSDLayout *)&v4 validate];
  if (v3) {
    [(SXTextTangierAttachmentLayout *)self storeActualPosition];
  }
}

- (CGRect)boundsInfluencingExteriorWrap
{
  v2 = [(SXTextTangierAttachmentLayout *)self wrapPolygon];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)boundsInRoot
{
  v2 = [(SXTextTangierAttachmentLayout *)self wrapPolygon];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)storeActualPosition
{
  double v3 = [(TSDLayout *)self info];
  double v4 = [v3 exclusionPath];
  if (-[SXTextExclusionPath type]((uint64_t)v4) == 2)
  {
    double v5 = [(TSDAbstractLayout *)self geometry];
    [v5 frame];
    double v7 = v6;
    double v8 = [(TSDLayout *)self info];
    double v9 = [v8 exclusionPath];
    -[SXTextExclusionPath position]((uint64_t)v9);
    double v11 = v10;

    if (v7 < v11)
    {
      id v22 = [(TSDLayout *)self info];
      double v12 = [v22 exclusionPath];
      double v13 = -[SXTextExclusionPath position]((uint64_t)v12);
      double v15 = v14;
      double v16 = [(TSDLayout *)self info];
      v17 = [v16 exclusionPath];
      [(SXTextExclusionPath *)(uint64_t)v17 setActualPosition:v15];

      goto LABEL_6;
    }
  }
  else
  {
  }
  id v22 = [(TSDAbstractLayout *)self geometry];
  [v22 frame];
  double v19 = v18;
  double v21 = v20;
  double v12 = [(TSDLayout *)self info];
  double v16 = [v12 exclusionPath];
  [(SXTextExclusionPath *)(uint64_t)v16 setActualPosition:v21];
LABEL_6:
}

- (TSDWrapPolygon)polygon
{
  return self->_polygon;
}

- (void)setPolygon:(id)a3
{
}

- (void).cxx_destruct
{
}

@end