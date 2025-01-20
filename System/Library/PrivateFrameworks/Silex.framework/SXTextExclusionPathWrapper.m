@interface SXTextExclusionPathWrapper
- (BOOL)hasAlpha;
- (BOOL)isHTMLWrap;
- (BOOL)isRectangular;
- (CGRect)boundsInRoot;
- (CGRect)boundsInfluencingExteriorWrap;
- (SXTextExclusionPath)exclusionPath;
- (SXTextExclusionPathWrapper)initWithTextExclusionPath:(id)a3;
- (TSDWrapPolygon)myWrapPolygon;
- (id)parent;
- (id)wrapPolygon;
- (int)wrapDirection;
- (int)wrapFitType;
- (int)wrapType;
@end

@implementation SXTextExclusionPathWrapper

- (SXTextExclusionPathWrapper)initWithTextExclusionPath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXTextExclusionPathWrapper;
  v5 = [(SXTextExclusionPathWrapper *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_exclusionPath, v4);
    -[SXTextExclusionPath path]((double *)v4);
    id v7 = objc_claimAutoreleasedReturnValue();
    v6->_isRectangular = CGPathIsRect((CGPathRef)[v7 CGPath], 0);
  }
  return v6;
}

- (int)wrapDirection
{
  return 2;
}

- (int)wrapFitType
{
  return ![(SXTextExclusionPathWrapper *)self isRectangular];
}

- (id)wrapPolygon
{
  v3 = [(SXTextExclusionPathWrapper *)self myWrapPolygon];

  if (!v3)
  {
    id v4 = [(SXTextExclusionPathWrapper *)self exclusionPath];
    v5 = -[SXTextExclusionPath path](v4);
    v6 = [v5 TSDBezierPath];

    memset(&v22, 0, sizeof(v22));
    id v7 = [(SXTextExclusionPathWrapper *)self exclusionPath];
    double v8 = -[SXTextExclusionPath position]((uint64_t)v7);
    objc_super v9 = [(SXTextExclusionPathWrapper *)self exclusionPath];
    -[SXTextExclusionPath position]((uint64_t)v9);
    CGAffineTransformMakeTranslation(&v22, v8, v10);

    CGAffineTransform v21 = v22;
    [v6 transformUsingAffineTransform:&v21];
    v11 = [(SXTextExclusionPathWrapper *)self exclusionPath];
    double v12 = -[SXAnimatedImageFrame duration]((uint64_t)v11);

    if (v12 > 0.0)
    {
      v13 = [(SXTextExclusionPathWrapper *)self exclusionPath];
      double v14 = -[SXAnimatedImageFrame duration]((uint64_t)v13);
      [v6 setLineWidth:v14 + v14];

      v15 = [MEMORY[0x263F7C690] outlineBezierPath:v6 withThreshold:0.0];
      uint64_t v16 = [v6 uniteWithBezierPath:v15];

      v6 = (void *)v16;
    }
    v17 = (TSDWrapPolygon *)[objc_alloc(MEMORY[0x263F7C6F0]) initWithPath:v6];
    myWrapPolygon = self->_myWrapPolygon;
    self->_myWrapPolygon = v17;
  }
  v19 = [(SXTextExclusionPathWrapper *)self myWrapPolygon];
  return v19;
}

- (int)wrapType
{
  return 1;
}

- (BOOL)isHTMLWrap
{
  return 0;
}

- (CGRect)boundsInfluencingExteriorWrap
{
  v2 = [(SXTextExclusionPathWrapper *)self wrapPolygon];
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
  v2 = [(SXTextExclusionPathWrapper *)self wrapPolygon];
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

- (id)parent
{
  return 0;
}

- (BOOL)hasAlpha
{
  return 0;
}

- (SXTextExclusionPath)exclusionPath
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exclusionPath);
  return (SXTextExclusionPath *)WeakRetained;
}

- (BOOL)isRectangular
{
  return self->_isRectangular;
}

- (TSDWrapPolygon)myWrapPolygon
{
  return self->_myWrapPolygon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myWrapPolygon, 0);
  objc_destroyWeak((id *)&self->_exclusionPath);
}

@end