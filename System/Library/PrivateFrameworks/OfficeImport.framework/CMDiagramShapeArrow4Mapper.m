@interface CMDiagramShapeArrow4Mapper
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapChildrenAt:(id)a3 withState:(id)a4;
@end

@implementation CMDiagramShapeArrow4Mapper

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263F08680] transform];
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  double v9 = v8;
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  objc_msgSend(v7, "translateXBy:yBy:", v9);
  [(CMDrawingContext *)self->super.super.mDrawingContext addTransform:v7];
  [(CMDiagramShapeArrow4Mapper *)self mapChildrenAt:v10 withState:v6];
  [(CMDrawingContext *)self->super.super.mDrawingContext restoreLastTransform];
}

- (void)mapChildrenAt:(id)a3 withState:(id)a4
{
  id v44 = a3;
  id v6 = a4;
  v7 = [(ODDDiagram *)self->super.super.mDiagram documentPoint];
  double v8 = [v7 children];

  uint64_t v9 = [v8 count];
  if (v9)
  {
    id v42 = v6;
    [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
    float v10 = CGRectGetHeight(v47) * 0.479999989;
    if (v9 == 1)
    {
      [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
      double Height = CGRectGetHeight(v48);
    }
    else
    {
      double Height = v10;
    }
    [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
    double Width = CGRectGetWidth(v49);
    v13 = [(ODDDiagram *)self->super.super.mDiagram documentPoint];
    v14 = [v13 children];
    v41 = [v14 objectAtIndex:0];

    float v15 = Height;
    double v16 = v10;
    double v17 = v15;
    v43 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", 0.0, 0.0, v10, v15);
    v18 = [[CMDiagramPointMapper alloc] initWithPoint:v41 drawingContext:self->super.super.mDrawingContext orientedBounds:v43 parent:self];
    [(CMDiagramPointMapper *)v18 setPresentationName:@"upArrow"];
    [(CMDiagramPointMapper *)v18 applyDiagramStyleToShapeProperties];
    v19 = [(CMDiagramPointMapper *)v18 fill];
    v20 = [(CMDiagramPointMapper *)v18 stroke];
    +[CMShapeRenderer renderCanonicalShape:248 fill:v19 stroke:v20 adjustValues:0 orientedBounds:v43 state:v6 drawingContext:self->super.super.mDrawingContext];

    [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
    float v21 = Width * 0.100000001;
    float v22 = v10 + 1.0;
    double v23 = (float)(v10 + 1.0);
    CGFloat v24 = CGRectGetWidth(v50) - v16 - v21;
    v25 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", v23, 0.0, v24, v15);
    v26 = objc_alloc_init(CMDrawableStyle);
    v27 = +[OIXMLElement elementWithType:3];
    -[CMDrawableStyle addPositionProperties:](v26, "addPositionProperties:", v23, 0.0, v24, v15);
    [v44 addChild:v27];
    v46.receiver = self;
    v46.super_class = (Class)CMDiagramShapeArrow4Mapper;
    [(CMMapper *)&v46 addStyleUsingGlobalCacheTo:v27 style:v26];
    [(CMDiagramPointMapper *)v18 setPresentationName:@"upArrowText"];
    [(CMDiagramPointMapper *)v18 applyDiagramStyleToShapeProperties];
    [(CMDiagramPointMapper *)v18 mapTextAt:v27 withBounds:v25 isCentered:1 includeChildren:0 withState:v42];
    if (v9 == 1)
    {
      v28 = v27;
      v29 = v26;
    }
    else
    {
      v39 = v25;
      v30 = [(ODDDiagram *)self->super.super.mDiagram documentPoint];
      v31 = [v30 children];
      v40 = [v31 objectAtIndex:1];

      double v32 = (float)(v15 + 1.0);
      v33 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", v21, v32, v16, v15);
      [(OADOrientedBounds *)v33 setFlipY:1];
      v34 = [[CMDiagramPointMapper alloc] initWithPoint:v40 drawingContext:self->super.super.mDrawingContext orientedBounds:v43 parent:self];
      [(CMDiagramPointMapper *)v34 setPresentationName:@"downArrow"];
      [(CMDiagramPointMapper *)v34 applyDiagramStyleToShapeProperties];
      v35 = [(CMDiagramPointMapper *)v34 fill];
      v36 = [(CMDiagramPointMapper *)v34 stroke];
      +[CMShapeRenderer renderCanonicalShape:248 fill:v35 stroke:v36 adjustValues:0 orientedBounds:v33 state:v42 drawingContext:self->super.super.mDrawingContext];

      [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
      CGFloat v37 = CGRectGetWidth(v51) - v16 - v21;
      v38 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", (float)(v22 + v21), v32, v37, v17);
      v29 = objc_alloc_init(CMDrawableStyle);

      v28 = +[OIXMLElement elementWithType:3];

      -[CMDrawableStyle addPositionProperties:](v29, "addPositionProperties:", (float)(v22 + v21), v32, v37, v17);
      [v44 addChild:v28];
      v45.receiver = self;
      v45.super_class = (Class)CMDiagramShapeArrow4Mapper;
      [(CMMapper *)&v45 addStyleUsingGlobalCacheTo:v28 style:v29];
      [(CMDiagramPointMapper *)v34 setPresentationName:@"downArrowText"];
      [(CMDiagramPointMapper *)v34 applyDiagramStyleToShapeProperties];
      [(CMDiagramPointMapper *)v34 mapTextAt:v28 withBounds:v38 isCentered:1 includeChildren:0 withState:v42];

      v25 = v39;
    }

    id v6 = v42;
  }
}

@end