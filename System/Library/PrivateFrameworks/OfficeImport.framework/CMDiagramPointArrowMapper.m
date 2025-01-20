@interface CMDiagramPointArrowMapper
- (CMDiagramPointArrowMapper)initWithPoint:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 parent:(id)a6;
- (id)getTextBoundsForBounds:(id)a3;
- (id)transformPresentationName;
- (void)mapAt:(id)a3 withState:(id)a4;
@end

@implementation CMDiagramPointArrowMapper

- (CMDiagramPointArrowMapper)initWithPoint:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 parent:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)CMDiagramPointArrowMapper;
  v6 = [(CMDiagramPointMapper *)&v13 initWithPoint:a3 drawingContext:a4 orientedBounds:a5 parent:a6];
  v7 = v6;
  if (v6)
  {
    [(OADOrientedBounds *)v6->super.mOrientedBounds rotation];
    if (v8 == -90.0 || v8 == 90.0) {
      int v10 = 247;
    }
    else {
      int v10 = 248;
    }
    v7->mArrowType = v10;
    v11 = v7;
  }

  return v7;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v21 = a4;
  v20 = [(CMDiagramPointMapper *)self transformForPresentationWithName:@"arrow"];
  v7 = +[CMShapeUtils transformedBoundsWithBounds:self->super.mOrientedBounds transform:v20];
  [v7 rotation];
  if (+[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:"))
  {
    [v7 bounds];
    objc_msgSend(v7, "setBounds:", NSTransposedRectWithSameCenter(v8, v9, v10, v11));
  }
  [(CMDiagramPointMapper *)self applyDiagramStyleToShapeProperties];
  v12 = [(CMDiagramPointMapper *)self fill];
  objc_super v13 = [(CMDiagramPointMapper *)self stroke];
  +[CMShapeRenderer renderCanonicalShape:248 fill:v12 stroke:v13 adjustValues:0 orientedBounds:v7 state:v21 drawingContext:self->super.mDrawingContext];

  v14 = objc_alloc_init(CMDrawableStyle);
  v15 = +[OIXMLElement elementWithType:3];
  [v7 bounds];
  -[CMDrawableStyle addPositionProperties:](v14, "addPositionProperties:");
  [v6 addChild:v15];
  v23.receiver = self;
  v23.super_class = (Class)CMDiagramPointArrowMapper;
  [(CMMapper *)&v23 addStyleUsingGlobalCacheTo:v15 style:v14];
  id v16 = v15;

  v17 = objc_alloc_init(CMDrawableStyle);
  v18 = +[OIXMLElement elementWithType:3];

  v19 = [(CMDiagramPointArrowMapper *)self getTextBoundsForBounds:v7];
  [v19 bounds];
  -[CMDrawableStyle addPositionProperties:](v17, "addPositionProperties:");
  [v16 addChild:v18];
  v22.receiver = self;
  v22.super_class = (Class)CMDiagramPointArrowMapper;
  [(CMMapper *)&v22 addStyleUsingGlobalCacheTo:v18 style:v17];
  [(CMDiagramPointMapper *)self mapTextAt:v18 withBounds:v19 isCentered:1 includeChildren:1 withState:v21];
}

- (id)getTextBoundsForBounds:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->mArrowType == 248)
  {
    [v4 bounds];
    double Width = CGRectGetWidth(v25);
    [v5 bounds];
    double Height = CGRectGetHeight(v26);
    [v5 bounds];
    double v8 = CGRectGetWidth(v27);
    [v5 rotation];
    double v9 = Width * 0.5;
    double v10 = Height * 0.699999988;
    float v11 = v8 * 0.25;
    double v12 = 0.0;
    if (v13 <= 0.0)
    {
      [v5 bounds];
      double v12 = CGRectGetHeight(v28) * 0.300000012;
    }
  }
  else
  {
    [v4 bounds];
    double v14 = CGRectGetWidth(v29);
    [v5 bounds];
    double v15 = CGRectGetHeight(v30);
    [v5 bounds];
    double v16 = CGRectGetHeight(v31);
    [v5 rotation];
    double v9 = v14 * 0.699999988;
    double v10 = v15 * 0.5;
    double v12 = v16 * 0.25;
    float v11 = 0.0;
    if (v17 <= 0.0)
    {
      [v5 bounds];
      float v11 = CGRectGetWidth(v32) * 0.300000012;
    }
  }
  v18 = [OADOrientedBounds alloc];
  float v19 = v12;
  float v20 = v9;
  float v21 = v10;
  objc_super v22 = -[OADOrientedBounds initWithBounds:](v18, "initWithBounds:", v11, v19, v20, v21);

  return v22;
}

- (id)transformPresentationName
{
  return @"arrow";
}

@end