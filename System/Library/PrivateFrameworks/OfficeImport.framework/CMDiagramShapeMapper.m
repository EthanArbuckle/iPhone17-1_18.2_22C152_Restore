@interface CMDiagramShapeMapper
- (CGRect)circumscribedBounds;
- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4;
- (CMDiagramShapeMapper)initWithOddDiagram:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 identifier:(id)a6 parent:(id)a7;
- (float)defaultFontSize;
- (float)setFonSizeForChildNode:(id)a3 atIndex:(unint64_t)a4 level:(int)a5;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)setDefaultFonSize;
- (void)setFonSizeForChildNode:(id)a3 atIndex:(unint64_t)a4;
@end

@implementation CMDiagramShapeMapper

- (CMDiagramShapeMapper)initWithOddDiagram:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 identifier:(id)a6 parent:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)CMDiagramShapeMapper;
  v17 = [(CMDiagramMapper *)&v22 initWithOddDiagram:v12 drawingContext:v13 orientedBounds:v14 parent:v16];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->mIdentifier, a6);
    v19 = [(ODDDiagram *)v18->super.mDiagram documentPoint];
    v20 = [v19 children];
    v18->mChildCount = [v20 count];

    v18->mDefaultFontSize = 65.0;
    v18->mMaxMappableTreeDepth = 0;
    v18->mDefaultScale = 1.0;
  }

  return v18;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CMDiagramShapeMapper *)self circumscribedBounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  id v16 = +[CMShapeUtils inscribedBoundsWithBounds:logicalBounds:](CMShapeUtils, "inscribedBoundsWithBounds:logicalBounds:", self->super.super.mOrientedBounds);
  v17 = objc_alloc_init(CMDrawableStyle);
  v18 = +[OIXMLElement elementWithType:3];
  v19 = +[CMShapeUtils relatvieBoundsWithAbsoluteInnerBounds:v16 parentBounds:self->super.super.mOrientedBounds];
  mDiagramShapeBounds = self->mDiagramShapeBounds;
  self->mDiagramShapeBounds = v19;

  [(OADOrientedBounds *)self->mDiagramShapeBounds bounds];
  double Width = CGRectGetWidth(v28);
  v29.origin.x = v9;
  v29.origin.y = v11;
  v29.size.width = v13;
  v29.size.height = v15;
  float v22 = Width / CGRectGetWidth(v29);
  self->mDefaultScale = v22;
  [(OADOrientedBounds *)self->mDiagramShapeBounds bounds];
  -[CMDrawableStyle addPositionProperties:](v17, "addPositionProperties:");
  [v6 addChild:v18];
  v27.receiver = self;
  v27.super_class = (Class)CMDiagramShapeMapper;
  [(CMMapper *)&v27 addStyleUsingGlobalCacheTo:v18 style:v17];
  id v23 = v18;

  v24 = [MEMORY[0x263F08680] transform];
  [(OADOrientedBounds *)self->super.super.mOrientedBounds bounds];
  double v26 = v25;
  [(OADOrientedBounds *)self->super.super.mOrientedBounds bounds];
  objc_msgSend(v24, "translateXBy:yBy:", v26);
  [(CMDrawingContext *)self->super.mDrawingContext addTransform:v24];
  [(CMDiagramShapeMapper *)self mapChildrenAt:v23 withState:v7];
  [(CMDrawingContext *)self->super.mDrawingContext restoreLastTransform];
}

- (void)setDefaultFonSize
{
  id v6 = [(ODDDiagram *)self->super.mDiagram documentPoint];
  v3 = [v6 children];
  if (self->mChildCount)
  {
    unint64_t v4 = 0;
    do
    {
      v5 = [v3 objectAtIndex:v4];
      [(CMDiagramShapeMapper *)self setFonSizeForChildNode:v5 atIndex:v4];

      ++v4;
    }
    while (self->mChildCount > v4);
  }
}

- (void)setFonSizeForChildNode:(id)a3 atIndex:(unint64_t)a4
{
}

- (float)setFonSizeForChildNode:(id)a3 atIndex:(unint64_t)a4 level:(int)a5
{
  id v8 = a3;
  CGFloat v9 = [[CMDiagramPointMapper alloc] initWithPoint:v8 drawingContext:self->super.mDrawingContext orientedBounds:self->super.super.mOrientedBounds parent:self];
  [(CMDiagramShapeMapper *)self sizeForNode:v8 atIndex:a4];
  double v11 = v10;
  double v13 = v12;
  double v14 = [(CMDiagramPointMapper *)v9 transformPresentationName];
  if (v14)
  {
    CGFloat v15 = [(CMDiagramPointMapper *)v9 transformForPresentationWithName:v14];
    id v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "transformSize:", v11, v13);
      double v11 = v17;
      double v13 = v18;
    }
  }
  -[CMDiagramShapeMapper textSizeForShapeSize:](self, "textSizeForShapeSize:", v11, v13);
  double v20 = v19;
  double v22 = v21;
  id v23 = [(CMDiagramPointMapper *)v9 plainText];
  +[CMShapeUtils fontSizeForText:insideRectangle:](CMShapeUtils, "fontSizeForText:insideRectangle:", v23, v20, v22);
  float v25 = v24;

  if (self->mDefaultFontSize > v25) {
    self->mDefaultFontSize = v25;
  }
  double v26 = [v8 children];
  uint64_t v27 = [v26 count];
  if (v27)
  {
    uint64_t v28 = 0;
    float v29 = 1.0;
    do
    {
      v30 = [v26 objectAtIndex:v28];
      [(CMDiagramShapeMapper *)self setFonSizeForChildNode:v30 atIndex:v28 level:(a5 + 1)];
      if (self->mMaxMappableTreeDepth > a5) {
        float v31 = -0.0;
      }
      float v29 = v29 + v31;

      ++v28;
    }
    while (v27 != v28);
  }
  else
  {
    float v29 = 1.0;
  }
  if (self->mMaxMappableTreeDepth == a5 && v13 < (float)((float)(v29 * self->mDefaultFontSize) * 1.2))
  {
    float v32 = v13 / v29 / 1.20000005;
    self->mDefaultFontSize = v32;
  }

  return v29;
}

- (float)defaultFontSize
{
  return self->mDefaultFontSize;
}

- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4
{
  [(OADOrientedBounds *)self->mDiagramShapeBounds bounds];
  CGFloat Width = CGRectGetWidth(v9);
  [(OADOrientedBounds *)self->mDiagramShapeBounds bounds];
  double Height = CGRectGetHeight(v10);
  double v7 = Width;
  result.height = Height;
  result.width = v7;
  return result;
}

- (CGRect)circumscribedBounds
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 1.0;
  double v5 = 1.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mIdentifier, 0);
  objc_storeStrong((id *)&self->mDiagramShapeBounds, 0);
}

@end