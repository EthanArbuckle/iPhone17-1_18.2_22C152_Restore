@interface CMDiagramPointChevronMapper
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)setIsHomePlate:(BOOL)a3;
- (void)setIsPlaceholder:(BOOL)a3;
@end

@implementation CMDiagramPointChevronMapper

- (void)setIsHomePlate:(BOOL)a3
{
  self->mHomePlate = a3;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CMDiagramPointMapper *)self applyDiagramStyleToShapeProperties];
  v8 = [(CMDiagramPointMapper *)self fill];
  v9 = [(CMDiagramPointMapper *)self stroke];
  v10 = NSDictionary;
  v11 = [NSNumber numberWithBool:self->mHomePlate];
  v12 = [v10 dictionaryWithObject:v11 forKey:@"IsHomePlate"];
  +[CMShapeRenderer renderCanonicalShape:55 fill:v8 stroke:v9 adjustValues:v12 orientedBounds:self->super.mOrientedBounds state:v7 drawingContext:self->super.mDrawingContext];

  mDrawingContext = self->super.mDrawingContext;
  [(OADOrientedBounds *)self->super.mOrientedBounds bounds];
  -[CMDrawingContext transformRectToGroup:](mDrawingContext, "transformRectToGroup:");
  v14 = +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:");
  v15 = +[OIXMLElement elementWithType:3];
  v16 = objc_alloc_init(CMDrawableStyle);
  [v14 bounds];
  -[CMDrawableStyle addPositionProperties:](v16, "addPositionProperties:");
  [v6 addChild:v15];
  v17.receiver = self;
  v17.super_class = (Class)CMDiagramPointChevronMapper;
  [(CMMapper *)&v17 addStyleUsingGlobalCacheTo:v15 style:v16];
  [(CMDiagramPointMapper *)self mapTextAt:v15 withBounds:v14 isCentered:1 includeChildren:1 withState:v7];
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->mPlaceholder = a3;
}

@end