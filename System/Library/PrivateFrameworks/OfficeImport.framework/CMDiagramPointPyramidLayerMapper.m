@interface CMDiagramPointPyramidLayerMapper
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)setPyramidAspectRatio:(double)a3;
@end

@implementation CMDiagramPointPyramidLayerMapper

- (void)setPyramidAspectRatio:(double)a3
{
  self->mPyramidAspectRatio = a3;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CMDiagramPointMapper *)self applyDiagramStyleToShapeProperties];
  v8 = [(CMDiagramPointMapper *)self fill];
  v9 = [(CMDiagramPointMapper *)self stroke];
  v10 = NSDictionary;
  double mPyramidAspectRatio = self->mPyramidAspectRatio;
  *(float *)&double mPyramidAspectRatio = mPyramidAspectRatio;
  v12 = [NSNumber numberWithFloat:mPyramidAspectRatio];
  v13 = [NSNumber numberWithInt:0];
  v14 = [v10 dictionaryWithObject:v12 forKey:v13];
  +[CMShapeRenderer renderCanonicalShape:249 fill:v8 stroke:v9 adjustValues:v14 orientedBounds:self->super.mOrientedBounds state:v7 drawingContext:self->super.mDrawingContext];

  mDrawingContext = self->super.mDrawingContext;
  [(OADOrientedBounds *)self->super.mOrientedBounds bounds];
  -[CMDrawingContext transformRectToGroup:](mDrawingContext, "transformRectToGroup:");
  v16 = +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:");
  v17 = +[OIXMLElement elementWithType:3];
  v18 = objc_alloc_init(CMDrawableStyle);
  [v16 bounds];
  -[CMDrawableStyle addPositionProperties:](v18, "addPositionProperties:");
  [v6 addChild:v17];
  v19.receiver = self;
  v19.super_class = (Class)CMDiagramPointPyramidLayerMapper;
  [(CMMapper *)&v19 addStyleUsingGlobalCacheTo:v17 style:v18];
  [(CMDiagramPointMapper *)self mapTextAt:v17 withBounds:v16 isCentered:1 includeChildren:1 withState:v7];
}

@end