@interface CMDiagramPointContinuousArrowMapper
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)setIsArrow:(BOOL)a3;
@end

@implementation CMDiagramPointContinuousArrowMapper

- (void)setIsArrow:(BOOL)a3
{
  self->mIsArrow = a3;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CMDiagramPointMapper *)self applyDiagramStyleToShapeProperties];
  mDrawingContext = self->super.mDrawingContext;
  [(OADOrientedBounds *)self->super.mOrientedBounds bounds];
  -[CMDrawingContext transformRectToGroup:](mDrawingContext, "transformRectToGroup:");
  v9 = +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:");
  v10 = +[OIXMLElement elementWithType:3];
  v11 = objc_alloc_init(CMDrawableStyle);
  [v9 bounds];
  -[CMDrawableStyle addPositionProperties:](v11, "addPositionProperties:");
  [v6 addChild:v10];
  v12.receiver = self;
  v12.super_class = (Class)CMDiagramPointContinuousArrowMapper;
  [(CMMapper *)&v12 addStyleUsingGlobalCacheTo:v10 style:v11];
  [(CMDiagramPointMapper *)self mapTextAt:v10 withBounds:v9 isCentered:1 includeChildren:1 withState:v7];
}

@end