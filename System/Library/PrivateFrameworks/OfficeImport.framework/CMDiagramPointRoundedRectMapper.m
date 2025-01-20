@interface CMDiagramPointRoundedRectMapper
- (void)mapAt:(id)a3 withState:(id)a4;
@end

@implementation CMDiagramPointRoundedRectMapper

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CMDiagramPointMapper *)self transformPresentationName];
  if (v8)
  {
    v9 = [(CMDiagramPointMapper *)self transformForPresentationWithName:v8];
    v10 = +[CMShapeUtils transformedBoundsWithBounds:self->super.mOrientedBounds transform:v9];
  }
  else
  {
    v10 = self->super.mOrientedBounds;
  }
  [(CMDiagramPointMapper *)self applyDiagramStyleToShapeProperties];
  v11 = [(CMDiagramPointMapper *)self fill];
  v12 = [(CMDiagramPointMapper *)self stroke];
  +[CMShapeRenderer renderCanonicalShape:2 fill:v11 stroke:v12 adjustValues:0 orientedBounds:self->super.mOrientedBounds state:v7 drawingContext:self->super.mDrawingContext];

  v13 = [(CMDiagramPointMapper *)self plainText];

  if (v13)
  {
    v14 = objc_alloc_init(CMDrawableStyle);
    v15 = +[OIXMLElement elementWithType:3];
    [(OADOrientedBounds *)self->super.mOrientedBounds bounds];
    -[CMDrawableStyle addPositionProperties:](v14, "addPositionProperties:");
    [v6 addChild:v15];
    v17.receiver = self;
    v17.super_class = (Class)CMDiagramPointRoundedRectMapper;
    [(CMMapper *)&v17 addStyleUsingGlobalCacheTo:v15 style:v14];
    id v16 = v15;

    [(CMDiagramPointMapper *)self mapTextAt:v16 withBounds:v10 isCentered:1 includeChildren:0 withState:v7];
    [(CMDiagramPointMapper *)self mapChlidrenAt:v16 withState:v7];
  }
  else
  {
    id v16 = v6;
  }
}

@end