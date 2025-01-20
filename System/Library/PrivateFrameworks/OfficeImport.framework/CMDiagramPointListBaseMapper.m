@interface CMDiagramPointListBaseMapper
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapTextAt:(id)a3 withBounds:(id)a4 isCentered:(BOOL)a5 includeChildren:(BOOL)a6 withState:(id)a7;
@end

@implementation CMDiagramPointListBaseMapper

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(CMDrawableStyle);
  [(CMDiagramPointMapper *)self applyDiagramStyleToShapeProperties];
  v9 = [(CMDiagramPointMapper *)self stroke];
  [v9 width];
  float v11 = v10;
  float v12 = v10 * 0.5;
  if (v11 <= 1.5) {
    float v13 = 0.0;
  }
  else {
    float v13 = v12;
  }
  [(OADOrientedBounds *)self->super.mOrientedBounds bounds];
  double x = v26.origin.x;
  double y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;
  double v18 = CGRectGetWidth(v26);
  v27.origin.double x = x;
  v27.origin.double y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  v19 = +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", x - (float)(v11 - v13), y - (float)(v11 - v13), v18 - v13, CGRectGetHeight(v27) - v13);
  v20 = +[OIXMLElement elementWithType:3];
  [v19 bounds];
  -[CMDrawableStyle addPositionProperties:](v8, "addPositionProperties:");
  v21 = [(CMDiagramPointMapper *)self fill];
  v22 = +[CMColorProperty nsColorFromOADFill:v21 state:v7];

  [(CMStyle *)v8 appendPropertyForName:0x26EC19198 color:v22];
  v23 = [CMBordersProperty alloc];
  [(CMBordersProperty *)v23 setFromOadStroke:v9 atLocation:0 state:v7];
  v24 = [(CMBordersProperty *)v23 cssString];
  [(CMStyle *)v8 appendPropertyString:v24];

  [v6 addChild:v20];
  v25.receiver = self;
  v25.super_class = (Class)CMDiagramPointListBaseMapper;
  [(CMMapper *)&v25 addStyleUsingGlobalCacheTo:v20 style:v8];
  [(CMDiagramPointListBaseMapper *)self mapTextAt:v20 withBounds:v19 isCentered:1 includeChildren:0 withState:v7];
}

- (void)mapTextAt:(id)a3 withBounds:(id)a4 isCentered:(BOOL)a5 includeChildren:(BOOL)a6 withState:(id)a7
{
  id v10 = a3;
  id v11 = a7;
  float v12 = [(CMDiagramPointMapper *)self baseTextListStyleWithBounds:a4 isCentered:0];
  v13.receiver = self;
  v13.super_class = (Class)CMDiagramPointListBaseMapper;
  [(CMDiagramPointMapper *)&v13 mapSiblingTextAt:v10 style:v12 level:1 withState:v11];
}

@end