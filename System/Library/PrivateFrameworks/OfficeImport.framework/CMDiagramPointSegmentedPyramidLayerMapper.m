@interface CMDiagramPointSegmentedPyramidLayerMapper
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)setIsPlaceholder:(BOOL)a3;
@end

@implementation CMDiagramPointSegmentedPyramidLayerMapper

- (void)setIsPlaceholder:(BOOL)a3
{
  self->mPlaceholder = a3;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  [(CMDiagramPointMapper *)self applyDiagramStyleToShapeProperties];
  v7 = [(CMDiagramPointMapper *)self fill];
  v8 = [(CMDiagramPointMapper *)self stroke];
  v9 = NSDictionary;
  LODWORD(v10) = 1195593728;
  v11 = [NSNumber numberWithFloat:v10];
  v12 = [NSNumber numberWithInt:0];
  v13 = [v9 dictionaryWithObject:v11 forKey:v12];
  +[CMShapeRenderer renderCanonicalShape:5 fill:v7 stroke:v8 adjustValues:v13 orientedBounds:self->super.mOrientedBounds state:v6 drawingContext:self->super.mDrawingContext];

  if (!self->mPlaceholder)
  {
    [(OADOrientedBounds *)self->super.mOrientedBounds bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    BOOL v22 = [(OADOrientedBounds *)self->super.mOrientedBounds flipY];
    double v23 = -0.0;
    if (!v22) {
      double v23 = v21 * 0.5;
    }
    -[CMDrawingContext transformRectToGroup:](self->super.mDrawingContext, "transformRectToGroup:", v15, v17 + v23, v19);
    v24 = +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:");
    v25 = +[OIXMLElement elementWithType:3];
    v26 = objc_alloc_init(CMDrawableStyle);
    [v24 bounds];
    -[CMDrawableStyle addPositionProperties:](v26, "addPositionProperties:");
    [v27 addChild:v25];
    v28.receiver = self;
    v28.super_class = (Class)CMDiagramPointSegmentedPyramidLayerMapper;
    [(CMMapper *)&v28 addStyleUsingGlobalCacheTo:v25 style:v26];
    [(CMDiagramPointMapper *)self mapTextAt:v25 withBounds:v24 isCentered:1 includeChildren:1 withState:v6];
  }
}

@end