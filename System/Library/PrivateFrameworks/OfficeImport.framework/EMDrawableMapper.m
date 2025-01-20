@interface EMDrawableMapper
+ (BOOL)isAnchorRelative:(id)a3;
- (CGPoint)anchorMarkerToPosition:(EDCellAnchorMarker)a3 rowGrid:(double *)a4 columnGrid:(double *)a5 start:(BOOL)a6 relative:(BOOL)a7;
- (CGRect)getImageRect;
- (CGRect)mapAnchorToRect:(id)a3 rowGrid:(double *)a4 columnGrid:(double *)a5;
- (EMDrawableMapper)initWithChartDrawable:(id)a3 box:(CGRect)a4 parent:(id)a5;
- (EMDrawableMapper)initWithOADDrawable:(id)a3 parent:(id)a4;
- (EMDrawableMapper)initWithOADDrawable:(id)a3 rowGrid:(double *)a4 columnGrid:(double *)a5;
- (id)worksheetMapper;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapBounds;
- (void)mapChartAt:(id)a3 withState:(id)a4;
- (void)mapDiagramAt:(id)a3 withState:(id)a4;
- (void)mapOfficeArtGroupAt:(id)a3 withState:(id)a4;
- (void)mapOfficeArtShapeAt:(id)a3 withState:(id)a4;
- (void)mapTextBoxAt:(id)a3 withState:(id)a4;
- (void)setBoundingBox;
@end

@implementation EMDrawableMapper

- (EMDrawableMapper)initWithOADDrawable:(id)a3 parent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)EMDrawableMapper;
  v8 = [(CMDrawableMapper *)&v13 initWithOadDrawable:v6 parent:v7];
  v9 = v8;
  if (v8)
  {
    v10 = [(EMDrawableMapper *)v8 worksheetMapper];
    v9->mRowGrid = (double *)[v10 rowGrid];

    v11 = [(EMDrawableMapper *)v9 worksheetMapper];
    v9->mColumnGrid = (double *)[v11 columnGrid];
  }
  return v9;
}

- (id)worksheetMapper
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super.mParent);
  if (WeakRetained)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [WeakRetained parent];

      id WeakRetained = (id)v3;
    }
    while (v3);
  }
  return WeakRetained;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(OADDrawable *)self->super.mDrawable hidden])
  {
    [(EMDrawableMapper *)self mapBounds];
    -[CMDrawableStyle addPositionProperties:](self->super.mStyle, "addPositionProperties:", self->super.mBox.origin.x, self->super.mBox.origin.y, self->super.mBox.size.width, self->super.mBox.size.height);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(EMDrawableMapper *)self mapOfficeArtShapeAt:v6 withState:v7];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(EMDrawableMapper *)self mapOfficeArtGroupAt:v6 withState:v7];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(EMDrawableMapper *)self mapChartAt:v6 withState:v7];
        }
        else
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          mDrawable = self->super.mDrawable;
          if (isKindOfClass)
          {
            v17.receiver = self;
            v17.super_class = (Class)EMDrawableMapper;
            [(CMDrawableMapper *)&v17 setWithOadImage:mDrawable];
            if (!self->super.mImageBinaryData) {
              goto LABEL_16;
            }
            uint64_t v10 = +[OIXMLElement elementWithType:9];
            mImageBinaryData = self->super.mImageBinaryData;
            uint64_t mResourceType = self->super.mResourceType;
            v16.receiver = self;
            v16.super_class = (Class)EMDrawableMapper;
            objc_super v13 = [(CMDrawableMapper *)&v16 saveResourceAndReturnPath:mImageBinaryData withType:mResourceType];
            [(CMMapper *)self addAttribute:0x26EC19158 toNode:v10 value:v13];

            v14 = (void *)v10;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [(EMDrawableMapper *)self mapDiagramAt:v6 withState:v7];
              goto LABEL_16;
            }
            v14 = +[OIXMLElement elementWithType:3];
            [(CMStyle *)self->super.mStyle appendPropertyForName:0x26EC191D8 stringWithColons:@": 1px solid black;"];
          }
          if (v14)
          {
            [v6 addChild:v14];
            v15 = [(EMCellStyle *)self->super.mStyle cssStyleString];
            [(CMMapper *)self addAttribute:0x26EBFB938 toNode:v14 value:v15];
          }
        }
      }
    }
  }
LABEL_16:
}

- (void)mapBounds
{
  if (!self->super.mOrientedBounds)
  {
    [(EMDrawableMapper *)self getImageRect];
    self->super.mBox.origin.x = v3;
    self->super.mBox.origin.y = v4;
    self->super.mBox.size.width = v5;
    self->super.mBox.size.height = v6;
    +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:");
    id v7 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue();
    mOrientedBounds = self->super.mOrientedBounds;
    self->super.mOrientedBounds = v7;
  }
}

- (CGRect)getImageRect
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  id v7 = [(OADDrawable *)self->super.mDrawable clientData];
  if ([v7 hasBounds])
  {
    [v7 bounds];
    double v3 = v8;
    double v4 = v9;
    double v5 = v10;
    double v6 = v11;
  }
  else
  {
    v12 = [v7 anchor];

    if (v12)
    {
      objc_super v13 = [v7 anchor];
      [(EMDrawableMapper *)self mapAnchorToRect:v13 rowGrid:self->mRowGrid columnGrid:self->mColumnGrid];
      double v3 = v14;
      double v4 = v15;
      double v5 = v16;
      double v6 = v17;
    }
  }

  double v18 = v3;
  double v19 = v4;
  double v20 = v5;
  double v21 = v6;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)mapAnchorToRect:(id)a3 rowGrid:(double *)a4 columnGrid:(double *)a5
{
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 position];
    double v11 = v10;
    [v9 size];
    double v13 = v12;
    double v15 = v14;
    double v16 = 0.0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v17 = [v9 from];
      -[EMDrawableMapper anchorMarkerToPosition:rowGrid:columnGrid:start:relative:](self, "anchorMarkerToPosition:rowGrid:columnGrid:start:relative:", v17, v18, a4, a5, 1, [v9 isRelative]);
      double v16 = v19;
      double v11 = v20;
      [v9 size];
      double v13 = v21;
      double v15 = v22;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v23 = [v9 from];
        -[EMDrawableMapper anchorMarkerToPosition:rowGrid:columnGrid:start:relative:](self, "anchorMarkerToPosition:rowGrid:columnGrid:start:relative:", v23, v24, a4, a5, 1, [v9 isRelative]);
        double v16 = v25;
        double v11 = v26;
        uint64_t v27 = [v9 to];
        -[EMDrawableMapper anchorMarkerToPosition:rowGrid:columnGrid:start:relative:](self, "anchorMarkerToPosition:rowGrid:columnGrid:start:relative:", v27, v28, a4, a5, 0, [v9 isRelative]);
        double v13 = v29 - v16;
        double v15 = v30 - v11;
      }
      else
      {
        v31 = [MEMORY[0x263F08690] currentHandler];
        [v31 handleFailureInMethod:a2, self, @"EMDrawableMapper.mm", 253, @"Unknown class %@", v9 object file lineNumber description];

        double v16 = *MEMORY[0x263F00148];
        double v11 = *(double *)(MEMORY[0x263F00148] + 8);
        double v13 = *MEMORY[0x263F001B0];
        double v15 = *(double *)(MEMORY[0x263F001B0] + 8);
      }
    }
  }

  double v32 = v16;
  double v33 = v11;
  double v34 = v13;
  double v35 = v15;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (CGPoint)anchorMarkerToPosition:(EDCellAnchorMarker)a3 rowGrid:(double *)a4 columnGrid:(double *)a5 start:(BOOL)a6 relative:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v10 = *(void *)&a3.rowIndex;
  uint64_t v11 = *(void *)&a3.columnIndex;
  double v13 = [(EMDrawableMapper *)self worksheetMapper];
  uint64_t v14 = [v13 columnCount];

  double v15 = [(EMDrawableMapper *)self worksheetMapper];
  unint64_t v16 = [v15 maxRowNumber];

  uint64_t v17 = 0;
  double v18 = 0.0;
  while (v14 != v17)
  {
    if (a5)
    {
      double v19 = a5[v17];
      double v18 = v18 + v19;
    }
    else
    {
      double v20 = [(EMDrawableMapper *)self worksheetMapper];
      [v20 defaultColumnWidth];
      double v19 = v21;
    }
    if (++v17 > (unint64_t)(int)v11) {
      goto LABEL_9;
    }
  }
  double v22 = [(EMDrawableMapper *)self worksheetMapper];
  [v22 defaultColumnWidth];
  double v24 = v23;

  double v25 = [(EMDrawableMapper *)self worksheetMapper];
  [v25 defaultColumnWidth];
  double v19 = v26;
  double v18 = v18 + (double)(unint64_t)((int)v11 - v14 + 1) * v24;

LABEL_9:
  unint64_t v27 = 0;
  if (v7) {
    double v28 = v18 + v19 * (float)(*((float *)&v11 + 1) + -1.0);
  }
  else {
    double v28 = v18 + *((float *)&v11 + 1) - v19;
  }
  double v29 = 0.0;
  while (v27 <= v16)
  {
    double v30 = a4[v27] / 20.0;
    double v29 = v29 + v30;
    if (++v27 > (int)v10) {
      goto LABEL_17;
    }
  }
  v31 = [(EMDrawableMapper *)self worksheetMapper];
  [v31 defaultRowHeight];
  double v33 = v32;

  double v34 = [(EMDrawableMapper *)self worksheetMapper];
  [v34 defaultRowHeight];
  double v29 = v29 + v33 * (double)((int)v10 - v16) / 20.0;
  double v30 = v35 / 20.0;

LABEL_17:
  double v36 = v29 + v30 * (float)(*((float *)&v10 + 1) + -1.0);
  if (!v7) {
    double v36 = v29 + *((float *)&v10 + 1) - v30;
  }
  double v37 = v28 + 5.0;
  double v38 = v36 + 11.0;
  result.y = v38;
  result.x = v37;
  return result;
}

- (void)mapOfficeArtShapeAt:(id)a3 withState:(id)a4
{
  id v37 = a3;
  id v38 = a4;
  double v6 = [(OADDrawable *)self->super.mDrawable clientData];
  BOOL v7 = [v6 comment];
  if (!v7
    || ([v6 comment],
        double v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 visible],
        v8,
        v7,
        (v9 & 1) != 0))
  {
    double v35 = self->super.mDrawable;
    int v10 = [(OADDrawable *)v35 type];
    uint64_t v11 = [(OADDrawable *)v35 shapeProperties];
    uint64_t v12 = [v11 fill];
    int v13 = v12;
    double v36 = (void *)v12;
    if (v12)
    {
      objc_opt_class();
      int v13 = objc_opt_isKindOfClass() ^ 1;
    }
    uint64_t v14 = [v11 stroke];
    BOOL v15 = +[CMBordersProperty isStroked:v14];

    char v16 = [v11 isTextBox];
    uint64_t v17 = +[OIXMLElement elementWithType:3];
    if (v10 == 202) {
      char v18 = 1;
    }
    else {
      char v18 = v16;
    }
    if ((v18 & 1) != 0 || v10 == 1 || v10 == 75 || ((v13 | v15) & 1) == 0)
    {
      [(EMDrawableMapper *)self mapTextBoxAt:v17 withState:v38];
      if (v15)
      {
        double v29 = [CMBordersProperty alloc];
        double v30 = [v11 stroke];
        v31 = [(CMBordersProperty *)v29 initWithOADStroke:v30];

        [(CMStyle *)self->super.mStyle addProperty:v31 forKey:0x26EC191D8];
      }
      if (v13)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          mStyle = self->super.mStyle;
          double v33 = [v36 color];
          double v34 = +[CMColorProperty cssStringFromOADColor:v33];
          [(CMStyle *)mStyle appendPropertyForName:0x26EC19198 stringWithColons:v34];
        }
      }
      [(CMMapper *)self addStyleUsingGlobalCacheTo:v17 style:self->super.mStyle];
      [v37 addChild:v17];
    }
    else
    {
      [(CMMapper *)self addStyleUsingGlobalCacheTo:v17 style:self->super.mStyle];
      v40.receiver = self;
      v40.super_class = (Class)EMDrawableMapper;
      [(CMDrawableMapper *)&v40 mapShapeGraphicsAt:v17 withState:v38];
      [v37 addChild:v17];
      if ([v6 hasText])
      {
        double v19 = +[OIXMLElement elementWithType:3];
        [(EMDrawableMapper *)self mapTextBoxAt:v19 withState:v38];
        v39.receiver = self;
        v39.super_class = (Class)EMDrawableMapper;
        [(CMDrawableMapper *)&v39 shapeTextBoxRect];
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        double v27 = v26;
        double v28 = objc_alloc_init(CMStyle);
        -[CMStyle appendPositionInfoFromRect:](v28, "appendPositionInfoFromRect:", v21 - self->super.mBox.origin.x, v23 - self->super.mBox.origin.y, v25, v27);
        [(CMStyle *)v28 appendPropertyForName:0x26EC07038 stringWithColons:@":absolute;"];
        [(CMMapper *)self addStyleUsingGlobalCacheTo:v19 style:v28];
        [v17 addChild:v19];
      }
    }
  }
}

- (void)mapTextBoxAt:(id)a3 withState:(id)a4
{
  id v13 = a3;
  double v5 = [(OADDrawable *)self->super.mDrawable clientData];
  double v6 = [v5 comment];
  if (!v6
    || ([v5 comment],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 visible],
        v7,
        v6,
        (v8 & 1) != 0))
  {
    if ([v5 hasText])
    {
      char v9 = [v5 textBox];
      int v10 = [EMCellTextMapper alloc];
      uint64_t v11 = [v9 text];
      uint64_t v12 = [(EMCellTextMapper *)v10 initWithEDString:v11 style:0 parent:self];

      [(EMCellTextMapper *)v12 mapTextRunsAt:v13];
    }
  }
}

- (EMDrawableMapper)initWithChartDrawable:(id)a3 box:(CGRect)a4 parent:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)EMDrawableMapper;
  id v13 = [(CMDrawableMapper *)&v18 initWithOadDrawable:v11 parent:v12];
  uint64_t v14 = v13;
  if (v13)
  {
    v13->mRowGrid = 0;
    v13->mColumnGrid = 0;
    v13->super.mBox.origin.double x = x;
    v13->super.mBox.origin.double y = y;
    v13->super.mBox.size.double width = width;
    v13->super.mBox.size.double height = height;
    uint64_t v15 = +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", x, y, width, height);
    mOrientedBounds = v14->super.mOrientedBounds;
    v14->super.mOrientedBounds = (OADOrientedBounds *)v15;
  }
  return v14;
}

- (void)mapChartAt:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [[EMChartMapper alloc] initWithChart:self->super.mDrawable parent:self];
  [(OADOrientedBounds *)self->super.mOrientedBounds bounds];
  id v11 = -[EMChartMapper copyPdfWithState:withSize:](v8, "copyPdfWithState:withSize:", v7, v9, v10);
  id v12 = +[OIXMLElement elementWithType:9];
  if (v11)
  {
    v14.receiver = self;
    v14.super_class = (Class)EMDrawableMapper;
    id v13 = [(CMDrawableMapper *)&v14 saveResourceAndReturnPath:v11 withType:7];
    [(CMMapper *)self addAttribute:0x26EC19158 toNode:v12 value:v13];
  }
  else
  {
    [(CMStyle *)self->super.mStyle appendPropertyForName:0x26EC191D8 stringWithColons:@": 1px solid black;"];
  }
  [v6 addChild:v12];
  [(CMMapper *)self addStyleUsingGlobalCacheTo:v12 style:self->super.mStyle];
}

- (void)mapOfficeArtGroupAt:(id)a3 withState:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = self->super.mDrawable;
  uint64_t v8 = [(OADDrawable *)v7 childCount];
  if (v8)
  {
    uint64_t v9 = 0;
    double v10 = 0;
    do
    {
      id v11 = [(OADDrawable *)v7 childAtIndex:v9];

      id v12 = [[EMDrawableMapper alloc] initWithOADDrawable:v11 parent:self];
      [(EMDrawableMapper *)v12 mapAt:v13 withState:v6];

      ++v9;
      double v10 = v11;
    }
    while (v8 != v9);
  }
}

- (EMDrawableMapper)initWithOADDrawable:(id)a3 rowGrid:(double *)a4 columnGrid:(double *)a5
{
  v8.receiver = self;
  v8.super_class = (Class)EMDrawableMapper;
  CGPoint result = [(CMDrawableMapper *)&v8 initWithOadDrawable:a3 parent:0];
  if (result)
  {
    result->mRowGrid = a4;
    result->mColumnGrid = a5;
  }
  return result;
}

- (void)setBoundingBox
{
  [(EMDrawableMapper *)self getImageRect];
  self->super.mBox.origin.double x = v3;
  self->super.mBox.origin.double y = v4;
  self->super.mBox.size.double width = v5;
  self->super.mBox.size.double height = v6;
}

+ (BOOL)isAnchorRelative:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    char v4 = [v3 isRelative];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)mapDiagramAt:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = +[OIXMLElement elementWithType:3];
  [(CMMapper *)self addStyleUsingGlobalCacheTo:v8 style:self->super.mStyle];
  [v6 addChild:v8];
  id v17 = v8;

  double Width = CGRectGetWidth(self->super.mBox);
  double Height = CGRectGetHeight(self->super.mBox);
  id v11 = -[CMDrawingContext initWithFrame:]([CMDrawingContext alloc], "initWithFrame:", 0.0, 0.0, Width, Height);
  +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", 0.0, 0.0, Width, Height);
  id v12 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue();
  mOrientedBounds = self->super.mOrientedBounds;
  self->super.mOrientedBounds = v12;

  objc_super v14 = +[OIXMLElement elementWithType:3];
  uint64_t v15 = objc_alloc_init(CMDrawableStyle);
  [(CMStyle *)v15 appendPropertyForName:0x26EC07038 stringWithColons:@":absolute;"];
  [(CMMapper *)self addStyleUsingGlobalCacheTo:v14 style:v15];
  char v16 = [[CMDiagramMapper alloc] initWithOddDiagram:self->super.mDrawable drawingContext:v11 orientedBounds:self->super.mOrientedBounds parent:self];
  [(CMDiagramMapper *)v16 mapAt:v14 withState:v7];
  [(CMDrawableMapper *)self mapDrawingContext:v11 at:v17 relative:0 withState:v7];
  [v17 addChild:v14];
}

@end