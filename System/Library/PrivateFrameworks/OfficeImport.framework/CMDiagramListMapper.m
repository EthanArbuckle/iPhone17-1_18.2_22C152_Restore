@interface CMDiagramListMapper
- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4;
- (CGSize)textSize;
- (float)setFonSizeForChildNode:(id)a3 atIndex:(unint64_t)a4 level:(int)a5;
- (id)suggestedBoundsForHListItemWithIndex:(unint64_t)a3;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapChildrenAt:(id)a3 withState:(id)a4;
- (void)mapListItemAt:(id)a3 index:(unint64_t)a4 withState:(id)a5;
- (void)setDefaultFonSize;
@end

@implementation CMDiagramListMapper

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  *((_DWORD *)&self->super.mDefaultScale + 1) = 1077936128;
  [(CMDiagramListMapper *)self setDefaultFonSize];
  float mDefaultFontSize = self->super.mDefaultFontSize;
  float v9 = *(&self->super.mDefaultScale + 1);
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  float Height = (float)(mDefaultFontSize * 0.5) + (float)((float)(mDefaultFontSize * 1.5) * v9);
  if (CGRectGetHeight(v22) < Height)
  {
    [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
    float Height = CGRectGetHeight(v23);
  }
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  double v11 = CGRectGetHeight(v24);
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  double Width = CGRectGetWidth(v25);
  v13 = objc_alloc_init(CMDrawableStyle);
  v14 = +[OIXMLElement elementWithType:3];
  +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", 0.0, (v11 - Height) * 0.5, Width);
  v15 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue();
  mDiagramShapeBounds = self->super.mDiagramShapeBounds;
  self->super.mDiagramShapeBounds = v15;

  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  -[CMDrawableStyle addPositionProperties:](v13, "addPositionProperties:");
  [v6 addChild:v14];
  v21.receiver = self;
  v21.super_class = (Class)CMDiagramListMapper;
  [(CMMapper *)&v21 addStyleUsingGlobalCacheTo:v14 style:v13];
  id v17 = v14;

  v18 = [MEMORY[0x263F08680] transform];
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  double v20 = v19;
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  objc_msgSend(v18, "translateXBy:yBy:", v20);
  [(CMDrawingContext *)self->super.super.mDrawingContext addTransform:v18];
  [(CMDiagramListMapper *)self mapChildrenAt:v17 withState:v7];
  [(CMDrawingContext *)self->super.super.mDrawingContext restoreLastTransform];
}

- (void)setDefaultFonSize
{
  id v9 = [(ODDDiagram *)self->super.super.mDiagram documentPoint];
  v3 = [v9 children];
  if (self->super.mChildCount)
  {
    unint64_t v4 = 0;
    do
    {
      v5 = [v3 objectAtIndex:v4];
      [(CMDiagramListMapper *)self setFonSizeForChildNode:v5 atIndex:v4 level:0];

      ++v4;
    }
    while (self->super.mChildCount > v4);
  }
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  float v6 = CGRectGetHeight(v11) / (float)((float)(*(&self->super.mDefaultScale + 1) * 1.5) + 0.5);
  if (self->super.mDefaultFontSize > v6) {
    self->super.float mDefaultFontSize = v6;
  }
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  float v7 = CGRectGetWidth(v12)
     / (float)((float)self->super.mChildCount + (float)((float)(self->super.mChildCount - 1) * 0.14));
  float v8 = v7 * 0.25;
  if (self->super.mDefaultFontSize > v8) {
    self->super.float mDefaultFontSize = v8;
  }
}

- (float)setFonSizeForChildNode:(id)a3 atIndex:(unint64_t)a4 level:(int)a5
{
  id v7 = a3;
  float v8 = [[CMDiagramPointMapper alloc] initWithPoint:v7 drawingContext:self->super.super.mDrawingContext orientedBounds:self->super.super.super.mOrientedBounds parent:self];
  [(CMDiagramListMapper *)self textSize];
  double v10 = v9;
  double v12 = v11;
  v13 = [(CMDiagramPointMapper *)v8 plainText];
  +[CMShapeUtils fontSizeForText:insideRectangle:](CMShapeUtils, "fontSizeForText:insideRectangle:", v13, v10, v12);
  float v15 = v14;

  if (self->super.mDefaultFontSize > v15) {
    self->super.float mDefaultFontSize = v15;
  }
  v16 = [v7 children];
  uint64_t v17 = [v16 count];
  if (v17)
  {
    uint64_t v18 = 0;
    float v19 = 1.0;
    do
    {
      double v20 = [v16 objectAtIndex:v18];
      [(CMDiagramListMapper *)self setFonSizeForChildNode:v20 atIndex:v18 level:(a5 + 1)];
      if (self->super.mMaxMappableTreeDepth > a5) {
        float v21 = -0.0;
      }
      float v19 = v19 + v21;

      ++v18;
    }
    while (v17 != v18);
  }
  else
  {
    float v19 = 1.0;
  }
  if (*(&self->super.mDefaultScale + 1) < v19) {
    *(&self->super.mDefaultScale + 1) = v19;
  }

  return v19;
}

- (CGSize)textSize
{
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  double v3 = CGRectGetWidth(v6)
     / (float)((float)self->super.mChildCount + (float)((float)(self->super.mChildCount - 1) * 0.14));
  double v4 = 97.5;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)mapChildrenAt:(id)a3 withState:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (self->super.mChildCount)
  {
    unint64_t v7 = 0;
    do
      [(CMDiagramListMapper *)self mapListItemAt:v8 index:v7++ withState:v6];
    while (self->super.mChildCount > v7);
  }
}

- (void)mapListItemAt:(id)a3 index:(unint64_t)a4 withState:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  double v9 = [(CMDiagramListMapper *)self suggestedBoundsForHListItemWithIndex:a4];
  double v10 = [(ODDDiagram *)self->super.super.mDiagram documentPoint];
  double v11 = [v10 children];
  double v12 = [v11 objectAtIndex:a4];

  v13 = [[CMDiagramPointListItemL1Mapper alloc] initWithPoint:v12 drawingContext:self->super.super.mDrawingContext orientedBounds:v9 listIndex:a4 parent:self];
  [(CMDiagramPointListItemL1Mapper *)v13 mapAt:v14 withState:v8];
}

- (id)suggestedBoundsForHListItemWithIndex:(unint64_t)a3
{
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  double v5 = CGRectGetWidth(v9)
     / (float)((float)self->super.mChildCount + (float)((float)(self->super.mChildCount - 1) * 0.14));
  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  double Height = CGRectGetHeight(v10);
  return +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", v5 * (double)a3 * 1.13999999, 0.0, v5, Height);
}

- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4
{
  double v4 = [(CMDiagramListMapper *)self suggestedBoundsForHListItemWithIndex:a4];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

@end