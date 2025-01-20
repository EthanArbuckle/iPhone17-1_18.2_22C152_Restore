@interface CMDiagramMapper
+ (int)diagramTypeFromString:(id)a3;
- (CMDiagramMapper)initWithOddDiagram:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 parent:(id)a6;
- (id)copyDiagramMapperForId:(id)a3;
- (id)diagram;
- (id)identifierFromLayoutTypeId:(id)a3;
- (id)styleMatrix;
- (void)mapAt:(id)a3 withState:(id)a4;
@end

@implementation CMDiagramMapper

- (CMDiagramMapper)initWithOddDiagram:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 parent:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CMDiagramMapper;
  v15 = [(CMDrawableMapper *)&v20 initWithParent:v14];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->mDiagram, a3);
    objc_storeStrong((id *)&v16->mDrawingContext, a4);
    objc_storeStrong((id *)&v16->super.mOrientedBounds, a5);
    v17 = objc_alloc_init(CMDrawableStyle);
    mStyle = v16->super.mStyle;
    v16->super.mStyle = v17;
  }
  return v16;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mStyle = self->super.mStyle;
  [(OADOrientedBounds *)self->super.mOrientedBounds bounds];
  -[CMDrawableStyle addPositionProperties:](mStyle, "addPositionProperties:");
  v9 = +[OIXMLElement elementWithType:3];
  [v6 addChild:v9];
  v10 = self->super.mStyle;
  v20.receiver = self;
  v20.super_class = (Class)CMDiagramMapper;
  [(CMMapper *)&v20 addStyleUsingGlobalCacheTo:v9 style:v10];
  id v11 = v9;

  id v12 = [(ODDDiagram *)self->mDiagram documentPoint];
  id v13 = [v12 children];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    v15 = [v12 propertySet];
    v16 = [v15 layoutTypeId];

    v17 = [(CMDiagramMapper *)self identifierFromLayoutTypeId:v16];
    id v18 = [(CMDiagramMapper *)self copyDiagramMapperForId:v17];
    v19 = v18;
    if (v18) {
      [v18 mapAt:v11 withState:v7];
    }
  }
}

- (id)identifierFromLayoutTypeId:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"urn:microsoft.com/office/officeart/2005/8/layout/"])
  {
    uint64_t v4 = [v3 rangeOfString:@"#"];
    if (v5)
    {
      uint64_t v6 = [v3 substringToIndex:v4];

      id v3 = (id)v6;
    }
    id v7 = [v3 substringFromIndex:objc_msgSend(@"urn:microsoft.com/office/officeart/2005/8/layout/", "length")];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)copyDiagramMapperForId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 0;
  int v6 = +[CMDiagramMapper diagramTypeFromString:v4] - 1;
  id v7 = off_264D60230;
  switch(v6)
  {
    case 0:
      goto LABEL_15;
    case 1:
      id v7 = off_264D60270;
      goto LABEL_15;
    case 2:
      uint64_t v5 = [(CMDiagramShapeMapper *)[CMDiagramSegmentedPieMapper alloc] initWithOddDiagram:self->mDiagram drawingContext:self->mDrawingContext orientedBounds:self->super.mOrientedBounds identifier:v4 parent:self];
      [(CMDiagramSegmentedPieMapper *)v5 setDrawArrows:0];
      break;
    case 3:
      id v7 = off_264D60238;
      goto LABEL_15;
    case 4:
      uint64_t v5 = [(CMDiagramShapeMapper *)[CMDiagramChevronMapper alloc] initWithOddDiagram:self->mDiagram drawingContext:self->mDrawingContext orientedBounds:self->super.mOrientedBounds identifier:v4 parent:self];
      [(CMDiagramSegmentedPieMapper *)v5 setIsHChevron:1];
      break;
    case 5:
    case 6:
    case 7:
    case 8:
      id v7 = off_264D60278;
      goto LABEL_15;
    case 9:
      uint64_t v5 = [(CMDiagramShapeMapper *)[CMDiagramSegmentedPieMapper alloc] initWithOddDiagram:self->mDiagram drawingContext:self->mDrawingContext orientedBounds:self->super.mOrientedBounds identifier:v4 parent:self];
      [(CMDiagramSegmentedPieMapper *)v5 setDrawArrows:1];
      break;
    case 10:
      id v7 = off_264D60280;
      goto LABEL_15;
    case 11:
      id v7 = off_264D60240;
      goto LABEL_15;
    case 12:
      id v7 = off_264D60288;
      goto LABEL_15;
    case 14:
      id v7 = off_264D60260;
      goto LABEL_15;
    case 15:
      uint64_t v5 = [(CMDiagramShapeMapper *)[CMDiagramPyramidMapper alloc] initWithOddDiagram:self->mDiagram drawingContext:self->mDrawingContext orientedBounds:self->super.mOrientedBounds identifier:v4 parent:self];
      [(CMDiagramSegmentedPieMapper *)v5 setIsFlipped:1];
      break;
    case 16:
      id v7 = off_264D60268;
      goto LABEL_15;
    case 17:
      id v7 = &off_264D60290;
LABEL_15:
      uint64_t v5 = (CMDiagramSegmentedPieMapper *)[objc_alloc(*v7) initWithOddDiagram:self->mDiagram drawingContext:self->mDrawingContext orientedBounds:self->super.mOrientedBounds identifier:v4 parent:self];
      break;
    default:
      break;
  }

  return v5;
}

+ (int)diagramTypeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"arrow4"])
  {
    int v4 = 2;
  }
  else if ([v3 hasPrefix:@"arrow"])
  {
    int v4 = 1;
  }
  else if (([v3 isEqualToString:@"hList1"] & 1) != 0 {
         || ([v3 isEqualToString:@"lProcess2"] & 1) != 0
  }
         || ([v3 isEqualToString:@"hList3"] & 1) != 0)
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"pyramid1"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"pyramid3"])
  {
    int v4 = 16;
  }
  else if (([v3 hasPrefix:@"hierarchy"] & 1) != 0 {
         || ([v3 isEqualToString:@"orgChart1"] & 1) != 0)
  }
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"pyramid4"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"chevron1"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"hChevron3"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"cycle1"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"cycle2"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"cycle5"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"cycle7"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"cycle8"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"chart3"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"hProcess3"])
  {
    int v4 = 14;
  }
  else if (([v3 isEqualToString:@"default"] & 1) != 0 {
         || ([v3 isEqualToString:@"process1"] & 1) != 0
  }
         || ([v3 isEqualToString:@"bProcess4"] & 1) != 0)
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"venn1"])
  {
    int v4 = 18;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)diagram
{
  return self->mDiagram;
}

- (id)styleMatrix
{
  uint64_t v2 = [(CMMapper *)self parent];
  if (v2)
  {
    id v3 = (void *)v2;
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      uint64_t v4 = [v3 parent];

      id v3 = (void *)v4;
      if (!v4) {
        goto LABEL_5;
      }
    }
    uint64_t v5 = [v3 styleMatrix];
  }
  else
  {
LABEL_5:
    uint64_t v5 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDrawingContext, 0);
  objc_storeStrong((id *)&self->mDiagram, 0);
}

@end