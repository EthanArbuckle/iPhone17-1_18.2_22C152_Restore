@interface CMDiagramPointListItemL1Mapper
- (CMDiagramPointListItemL1Mapper)initWithPoint:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 listIndex:(unint64_t)a6 parent:(id)a7;
- (void)mapAt:(id)a3 withState:(id)a4;
@end

@implementation CMDiagramPointListItemL1Mapper

- (CMDiagramPointListItemL1Mapper)initWithPoint:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 listIndex:(unint64_t)a6 parent:(id)a7
{
  v9.receiver = self;
  v9.super_class = (Class)CMDiagramPointListItemL1Mapper;
  result = [(CMDiagramPointMapper *)&v9 initWithPoint:a3 drawingContext:a4 orientedBounds:a5 parent:a7];
  if (result) {
    result->mListIndex = a6;
  }
  return result;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v41 = a4;
  v7 = objc_alloc_init(CMDrawableStyle);
  [(CMDiagramPointMapper *)self applyDiagramStyleToShapeProperties];
  v8 = +[OIXMLElement elementWithType:3];
  [(OADOrientedBounds *)self->super.mOrientedBounds bounds];
  -[CMDrawableStyle addPositionProperties:](v7, "addPositionProperties:");
  [v6 addChild:v8];
  id v9 = v8;

  v43.receiver = self;
  v43.super_class = (Class)CMDiagramPointListItemL1Mapper;
  [(CMMapper *)&v43 addStyleUsingGlobalCacheTo:v9 style:v7];
  [(OADOrientedBounds *)self->super.mOrientedBounds bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v40 = [(CMDiagramPointMapper *)self stroke];
  [v40 width];
  float v19 = v18;
  float v20 = v18 * 0.5;
  if (v19 <= 1.5) {
    float v21 = 0.0;
  }
  else {
    float v21 = v20;
  }
  [(CMDiagramPointMapper *)self defaultFontSize];
  float v23 = v22;
  v44.origin.x = v11;
  v44.origin.y = v13;
  v44.size.width = v15;
  v44.size.height = v17;
  float v24 = (float)(v23 + v23) * 1.1;
  +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", (float)-(float)(v19 - v21), (float)-(float)(v19 - v21), CGRectGetWidth(v44) - v21, (float)(v24 - v21));
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  v26 = +[OIXMLElement elementWithType:3];

  v27 = objc_alloc_init(CMDrawableStyle);
  [v25 bounds];
  -[CMDrawableStyle addPositionProperties:](v27, "addPositionProperties:");
  v28 = [(CMDiagramPointMapper *)self fill];
  uint64_t v29 = +[CMColorProperty nsColorFromOADFill:v28 state:v41];

  v39 = (void *)v29;
  [(CMStyle *)v27 appendPropertyForName:0x26EC19198 color:v29];
  v30 = [CMBordersProperty alloc];
  [(CMBordersProperty *)v30 setFromOadStroke:v40 atLocation:0 state:v41];
  v31 = [(CMBordersProperty *)v30 cssString];
  [(CMStyle *)v27 appendPropertyString:v31];

  [v9 addChild:v26];
  v42.receiver = self;
  v42.super_class = (Class)CMDiagramPointListItemL1Mapper;
  [(CMMapper *)&v42 addStyleUsingGlobalCacheTo:v26 style:v27];
  [(CMDiagramPointMapper *)self mapTextAt:v26 withBounds:v25 isCentered:1 includeChildren:0 withState:v41];
  v45.origin.x = v11;
  v45.origin.y = v13;
  v45.size.width = v15;
  v45.size.height = v17;
  double Width = CGRectGetWidth(v45);
  v46.origin.x = v11;
  v46.origin.y = v13;
  v46.size.width = v15;
  v46.size.height = v17;
  double v33 = CGRectGetHeight(v46) - v24;
  +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", 0.0, v24, Width, v33);
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  v35 = [(ODDPoint *)self->super.mPoint children];
  v36 = [v35 objectAtIndex:0];

  if (v36)
  {
    v37 = [(CMDiagramPointMapper *)[CMDiagramPointListBaseMapper alloc] initWithPoint:v36 drawingContext:self->super.mDrawingContext orientedBounds:v34 parent:self];
    [(CMDiagramPointListBaseMapper *)v37 mapAt:v9 withState:v41];
  }
  else
  {
    v37 = [(ODDPoint *)self->super.mPoint shapeProperties];
    [(CMDiagramPointListBaseMapper *)v37 setFill:0];
    [(CMDiagramPointListBaseMapper *)v37 setStroke:0];
    [(CMDiagramPointMapper *)self setPresentationName:@"desTx"];
    [(CMDiagramPointMapper *)self applyDiagramStyleToShapeProperties];
    v38 = +[OIXMLElement elementWithType:3];
    -[CMDiagramPointMapper mapStyledRectangle:at:withState:](self, "mapStyledRectangle:at:withState:", v38, v41, 0.0, v24, Width, v33);
    [v9 addChild:v38];
  }
}

@end