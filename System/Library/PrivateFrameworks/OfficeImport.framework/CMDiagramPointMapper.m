@interface CMDiagramPointMapper
- (CMDiagramPointMapper)initWithPoint:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 parent:(id)a6;
- (float)defaultFontSize;
- (id)baseTextListStyleWithBounds:(id)a3 isCentered:(BOOL)a4;
- (id)diagram;
- (id)fill;
- (id)plainText;
- (id)presentationName;
- (id)presentationWithName:(id)a3;
- (id)shapeStyle;
- (id)stroke;
- (id)styleMatrix;
- (id)transformForPresentationWithName:(id)a3;
- (id)transformPresentationName;
- (void)applyDiagramStyleToShapeProperties;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapChildrenTextAt:(id)a3 style:(id)a4 level:(int)a5 withState:(id)a6;
- (void)mapPointTextAt:(id)a3 style:(id)a4 level:(int)a5 withState:(id)a6;
- (void)mapSiblingTextAt:(id)a3 style:(id)a4 level:(int)a5 withState:(id)a6;
- (void)mapStyledRectangle:(CGRect)a3 at:(id)a4 withState:(id)a5;
- (void)mapTextAt:(id)a3 withBounds:(id)a4 isCentered:(BOOL)a5 includeChildren:(BOOL)a6 withState:(id)a7;
- (void)setPresentationName:(id)a3;
@end

@implementation CMDiagramPointMapper

- (CMDiagramPointMapper)initWithPoint:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 parent:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CMDiagramPointMapper;
  v14 = [(CMMapper *)&v18 initWithParent:a6];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->mPoint, a3);
    objc_storeStrong((id *)&v15->mDrawingContext, a4);
    objc_storeStrong((id *)&v15->mOrientedBounds, a5);
    mPresentationName = v15->mPresentationName;
    v15->mPresentationName = 0;
  }
  return v15;
}

- (id)transformPresentationName
{
  return 0;
}

- (id)transformForPresentationWithName:(id)a3
{
  v4 = [(CMDiagramPointMapper *)self presentationWithName:a3];
  v5 = [v4 propertySet];
  [v5 customScaleX];
  double v7 = v6;

  v8 = [v4 propertySet];
  [v8 customScaleY];
  double v10 = v9;

  id v11 = [MEMORY[0x263F08680] transform];
  [v11 scaleXBy:v7 yBy:v10];
  id v12 = [v4 propertySet];
  [v12 customOffsetX];
  double v14 = v13;
  [(OADOrientedBounds *)self->mOrientedBounds bounds];
  double Width = CGRectGetWidth(v23);

  v16 = [v4 propertySet];
  [v16 customOffsetY];
  double v18 = v17;
  [(OADOrientedBounds *)self->mOrientedBounds bounds];
  double v19 = v14 * Width;
  double v20 = v18 * CGRectGetHeight(v24);

  [v11 translateXBy:v19 yBy:v20];
  return v11;
}

- (id)presentationWithName:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(ODDPoint *)self->mPoint presentations];
    double v6 = v5;
    if (v5 && [v5 count])
    {
      if (v4)
      {
        double v7 = [v6 objectEnumerator];
        while (1)
        {
          v8 = [v7 nextObject];
          double v9 = v8;
          if (!v8)
          {

            goto LABEL_12;
          }
          double v10 = [v8 propertySet];
          id v11 = [v10 presentationName];
          int v12 = [v4 isEqualToString:v11];

          if (v12) {
            break;
          }
        }
      }
      else
      {
LABEL_12:
        double v9 = [v6 objectAtIndex:0];
      }
    }
    else
    {
      double v9 = 0;
    }
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (id)plainText
{
  v2 = [(ODDPoint *)self->mPoint text];
  v3 = [v2 plainText];

  return v3;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CMDiagramPointMapper *)self transformPresentationName];
  if (v8)
  {
    double v9 = [(CMDiagramPointMapper *)self transformForPresentationWithName:v8];
    double v10 = +[CMShapeUtils transformedBoundsWithBounds:self->mOrientedBounds transform:v9];
  }
  else
  {
    double v10 = self->mOrientedBounds;
  }
  [(CMDiagramPointMapper *)self applyDiagramStyleToShapeProperties];
  [(CMDiagramPointMapper *)self renderShapeAsBackgroundInBounds:v10];
  id v11 = +[OIXMLElement elementWithType:3];
  [(OADOrientedBounds *)v10 bounds];
  -[CMDiagramPointMapper mapStyledRectangle:at:withState:](self, "mapStyledRectangle:at:withState:", v11, v7);
  [v6 addChild:v11];
  id v12 = v11;

  -[CMDiagramPointMapper mapTextAt:withBounds:isCentered:includeChildren:withState:](self, "mapTextAt:withBounds:isCentered:includeChildren:withState:");
  -[CMDiagramPointMapper mapChlidrenAt:withState:](self, "mapChlidrenAt:withState:");
}

- (void)applyDiagramStyleToShapeProperties
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(CMDiagramPointMapper *)self shapeStyle];
    v3 = [(CMDiagramPointMapper *)self styleMatrix];
    id v4 = [(ODDPoint *)self->mPoint shapeProperties];
    [v5 applyToGraphicProperties:v4 styleMatrix:v3];
  }
}

- (id)shapeStyle
{
  v3 = [(CMDiagramPointMapper *)self diagram];
  id v4 = [v3 styleDefinition];

  id v5 = [(CMDiagramPointMapper *)self presentationName];
  id v6 = [(CMDiagramPointMapper *)self presentationWithName:v5];

  id v7 = [v6 propertySet];
  v8 = [v7 presentationStyleLabel];

  double v9 = [v4 labelForName:v8];
  double v10 = [v9 shapeStyle];

  if (v10)
  {
    id v11 = [(CMDiagramPointMapper *)self diagram];
    id v12 = [v11 colorTransform];
    double v13 = [v12 labelForName:v8];

    double v14 = [v6 propertySet];
    uint64_t v15 = [v14 presentationStyleIndex];

    if (v13)
    {
      uint64_t v16 = [v10 copy];

      double v10 = (void *)v16;
      [v13 applyToShapeStyle:v16 index:v15 count:0 state:0];
    }
  }
  return v10;
}

- (id)diagram
{
  uint64_t v2 = [(CMMapper *)self parent];
  if (v2)
  {
    v3 = (void *)v2;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      id v4 = [v3 parent];

      v3 = v4;
      if (!v4) {
        goto LABEL_8;
      }
    }
    id v4 = [v3 diagram];
  }
  else
  {
    id v4 = 0;
  }
LABEL_8:
  return v4;
}

- (id)presentationName
{
  mPresentationName = self->mPresentationName;
  if (mPresentationName)
  {
    v3 = mPresentationName;
  }
  else
  {
    int v4 = [(ODDPoint *)self->mPoint type];
    id v5 = @"node0";
    if (v4 == 2) {
      id v5 = @"node1";
    }
    if (v4) {
      v3 = v5;
    }
    else {
      v3 = @"asst0";
    }
  }
  return v3;
}

- (id)styleMatrix
{
  uint64_t v2 = [(CMMapper *)self parent];
  if (v2)
  {
    v3 = (void *)v2;
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      uint64_t v4 = [v3 parent];

      v3 = (void *)v4;
      if (!v4) {
        goto LABEL_5;
      }
    }
    id v5 = [v3 styleMatrix];
  }
  else
  {
LABEL_5:
    id v5 = 0;
  }
  return v5;
}

- (void)mapStyledRectangle:(CGRect)a3 at:(id)a4 withState:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  double v13 = objc_alloc_init(CMDrawableStyle);
  -[CMDrawableStyle addPositionProperties:](v13, "addPositionProperties:", x, y, width, height);
  [(CMDiagramPointMapper *)self applyDiagramStyleToShapeProperties];
  double v14 = [(CMDiagramPointMapper *)self fill];
  uint64_t v15 = +[CMColorProperty nsColorFromOADFill:v14 state:v12];

  [(CMStyle *)v13 appendPropertyForName:0x26EC19198 color:v15];
  uint64_t v16 = [(CMDiagramPointMapper *)self stroke];
  double v17 = [CMBordersProperty alloc];
  [(CMBordersProperty *)v17 setFromOadStroke:v16 atLocation:0 state:v12];
  double v18 = [(CMBordersProperty *)v17 cssString];
  [(CMStyle *)v13 appendPropertyString:v18];

  v19.receiver = self;
  v19.super_class = (Class)CMDiagramPointMapper;
  [(CMMapper *)&v19 addStyleUsingGlobalCacheTo:v11 style:v13];
}

- (id)fill
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [(ODDPoint *)self->mPoint shapeProperties];
    uint64_t v4 = [v3 fill];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)stroke
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [(ODDPoint *)self->mPoint shapeProperties];
    uint64_t v4 = [v3 stroke];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (void)mapTextAt:(id)a3 withBounds:(id)a4 isCentered:(BOOL)a5 includeChildren:(BOOL)a6 withState:(id)a7
{
  BOOL v8 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  double v14 = [(CMDiagramPointMapper *)self baseTextListStyleWithBounds:v12 isCentered:v8];
  if (v8)
  {
    double v18 = +[OIXMLElement elementWithType:3];
    [v11 addChild:v18];
    id v15 = v18;

    uint64_t v16 = objc_alloc_init(CMStyle);
    [(CMStyle *)v16 appendPropertyForName:0x26EC193F8 stringValue:@"table"];
    [v12 bounds];
    -[CMStyle appendSizeInfoFromRect:](v16, "appendSizeInfoFromRect:");
    v20.receiver = self;
    v20.super_class = (Class)CMDiagramPointMapper;
    [(CMMapper *)&v20 addStyleUsingGlobalCacheTo:v15 style:v16];
    id v11 = +[OIXMLElement elementWithType:3];
    double v17 = objc_alloc_init(CMStyle);
    [(CMStyle *)v17 appendPropertyForName:0x26EC193F8 stringValue:@"table-cell"];
    [(CMStyle *)v17 appendPropertyForName:0x26EC18B78 stringValue:0x26EC084F8];
    v19.receiver = self;
    v19.super_class = (Class)CMDiagramPointMapper;
    [(CMMapper *)&v19 addStyleUsingGlobalCacheTo:v11 style:v17];
    [v15 addChild:v11];
  }
  [(CMDiagramPointMapper *)self mapPointTextAt:v11 style:v14 level:0 withState:v13];
}

- (id)baseTextListStyleWithBounds:(id)a3 isCentered:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = objc_alloc_init(OADTextListStyle);
  [(CMDiagramPointMapper *)self defaultFontSize];
  float v8 = v7;
  BOOL v9 = 0;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v9 = 1;
    }
  }
  double v10 = [NSString stringWithCharacters:&HUChDisc length:1];
  for (uint64_t i = -1; i != 8; ++i)
  {
    id v12 = [(OADTextListStyle *)v6 propertiesForListLevel:i + 1];
    *(float *)&double v13 = v8;
    [v12 setSize:v13];
    [v12 setAlign:v9];
    if (i != -1)
    {
      float v8 = v8 * 0.8;
      if (i)
      {
        double v14 = v8 * 0.8 * (double)i;
        *(float *)&double v14 = v14;
        [v12 setLeftMargin:v14];
        *(float *)&double v15 = v8;
        [v12 setIndent:v15];
      }
      uint64_t v16 = [[OADCharacterBulletProperties alloc] initWithBullet:v10];
      [v12 setBulletProperties:v16];
    }
  }

  return v6;
}

- (float)defaultFontSize
{
  uint64_t v2 = [(CMMapper *)self parent];
  float v3 = 0.0;
  if (v2)
  {
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v4 = [v2 parent];

      uint64_t v2 = (void *)v4;
      if (!v4) {
        goto LABEL_6;
      }
    }
    [v2 defaultFontSize];
    float v3 = v5;
  }
LABEL_6:

  return v3;
}

- (void)mapPointTextAt:(id)a3 style:(id)a4 level:(int)a5 withState:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v23 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [(ODDPoint *)self->mPoint text];
  if (v12)
  {
    v22 = [(CMDiagramPointMapper *)self shapeStyle];
    [v22 applyToTextBody:v12];
    uint64_t v13 = [v12 paragraphCount];
    if (v13)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        double v15 = [v12 paragraphAtIndex:i];
        uint64_t v16 = [v15 properties];
        [v16 setLevel:v7];
        double v17 = objc_msgSend(v10, "propertiesForListLevel:", (int)objc_msgSend(v16, "level"));
        [v16 setParent:v17];
      }
    }
    double v18 = objc_alloc_init(PMState);
    [(CMState *)v18 copyFromCMStateWithoutComponents:v11];
    if (v13)
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        objc_super v20 = [v12 paragraphAtIndex:j];
        v21 = [[PMParagraphMapper alloc] initWithOadParagraph:v20 parent:self];
        [(PMParagraphMapper *)v21 mapAt:v23 withState:v18 isFirstParagraph:j == 0];
      }
    }
  }
}

- (void)mapSiblingTextAt:(id)a3 style:(id)a4 level:(int)a5 withState:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v18 = a3;
  id v10 = a4;
  id v17 = a6;
  -[CMDiagramPointMapper mapPointTextAt:style:level:withState:](self, "mapPointTextAt:style:level:withState:", v18, v10, v7);
  id v11 = [(ODDPoint *)self->mPoint parent];
  id v12 = [v11 children];

  unint64_t v13 = [v12 count];
  if (v13 >= 2)
  {
    for (uint64_t i = 1; i != v13; ++i)
    {
      double v15 = [v12 objectAtIndex:i];
      uint64_t v16 = [[CMDiagramPointMapper alloc] initWithPoint:v15 drawingContext:self->mDrawingContext orientedBounds:self->mOrientedBounds parent:self];
      [(CMDiagramPointMapper *)v16 mapChildrenTextAt:v18 style:v10 level:v7 withState:v17];
    }
  }
}

- (void)mapChildrenTextAt:(id)a3 style:(id)a4 level:(int)a5 withState:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v18 = a3;
  id v10 = a4;
  id v11 = a6;
  [(CMDiagramPointMapper *)self mapPointTextAt:v18 style:v10 level:v7 withState:v11];
  id v12 = [(ODDPoint *)self->mPoint children];
  uint64_t v13 = [v12 count];
  if (v13)
  {
    uint64_t v14 = 0;
    uint64_t v15 = (v7 + 1);
    do
    {
      uint64_t v16 = [v12 objectAtIndex:v14];
      id v17 = [[CMDiagramPointMapper alloc] initWithPoint:v16 drawingContext:self->mDrawingContext orientedBounds:self->mOrientedBounds parent:self];
      [(CMDiagramPointMapper *)v17 mapChildrenTextAt:v18 style:v10 level:v15 withState:v11];

      ++v14;
    }
    while (v13 != v14);
  }
}

- (void)setPresentationName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPresentationName, 0);
  objc_storeStrong((id *)&self->mOrientedBounds, 0);
  objc_storeStrong((id *)&self->mDrawingContext, 0);
  objc_storeStrong((id *)&self->mPoint, 0);
}

@end