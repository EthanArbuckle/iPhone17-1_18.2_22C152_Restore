@interface WMOfficeArtMapper
- (BOOL)isInsideGroup;
- (CGSize)expandedSizeForTextBox:(id)a3 withState:(id)a4;
- (WMOfficeArtMapper)initWithOadDrawable:(id)a3 asFloating:(BOOL)a4 parent:(id)a5;
- (WMOfficeArtMapper)initWithWdOfficeArt:(id)a3 parent:(id)a4;
- (id)blipAtIndex:(unsigned int)a3;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapDiagramAt:(id)a3 withState:(id)a4;
- (void)mapOfficeArtGroupAt:(id)a3 withState:(id)a4;
- (void)mapOfficeArtImageAt:(id)a3 withState:(id)a4;
- (void)mapOfficeArtShapeAt:(id)a3 withState:(id)a4;
- (void)mapOfficeArtTextboxAt:(id)a3 withState:(id)a4;
- (void)mapTextBoxAt:(id)a3 withState:(id)a4;
- (void)setBoundingBox;
- (void)setCurrentPage:(unsigned int)a3;
- (void)setIsInsideGroup:(BOOL)a3;
- (void)setWithClientData:(id)a3 state:(id)a4;
@end

@implementation WMOfficeArtMapper

- (WMOfficeArtMapper)initWithWdOfficeArt:(id)a3 parent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isDrawableOverridden])
  {
    self->mIsInsideGroup = 0;
    v8 = [v6 drawable];
    v9 = -[WMOfficeArtMapper initWithOadDrawable:asFloating:parent:](self, "initWithOadDrawable:asFloating:parent:", v8, [v6 isFloating], v7);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)WMOfficeArtMapper;
    v10 = [(CMDrawableMapper *)&v12 initWithParent:v7];
    if (v10) {
      v10->mIsMapped = 0;
    }
    v9 = v10;
  }

  return v9;
}

- (void)setBoundingBox
{
  id v7 = +[OAITOrientedBounds absoluteOrientedBoundsOfDrawable:self->super.mDrawable];
  [v7 bounds];
  self->super.mBox.origin.x = v3;
  self->super.mBox.origin.y = v4;
  self->super.mBox.size.width = v5;
  self->super.mBox.size.height = v6;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = v6;
  if (self->mIsMapped)
  {
    self->mCurrentPage = [v6 currentPage];
    v8 = [(OADDrawable *)self->super.mDrawable clientData];
    [(WMOfficeArtMapper *)self setWithClientData:v8 state:v7];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [(OADDrawable *)self->super.mDrawable graphicProperties];
      v10 = [v9 clickHyperlink];

      if (v10)
      {
        v11 = +[OIXMLElement elementWithType:0];
        objc_super v12 = [v10 targetLocation];
        v13 = [v12 absoluteString];
        v14 = +[OIXMLAttribute attributeWithName:0x26EC19118 stringValue:v13];
        [v11 addAttribute:v14];

        [v15 addChild:v11];
        id v15 = v11;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(WMOfficeArtMapper *)self mapOfficeArtShapeAt:v15 withState:v7];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(WMOfficeArtMapper *)self mapOfficeArtImageAt:v15 withState:v7];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(WMOfficeArtMapper *)self mapOfficeArtGroupAt:v15 withState:v7];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(WMOfficeArtMapper *)self mapDiagramAt:v15 withState:v7];
          }
        }
      }
    }
  }
}

- (void)setWithClientData:(id)a3 state:(id)a4
{
  CGFloat v5 = a3;
  id v52 = a3;
  id v7 = a4;
  self->mIsMapped = 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_45;
  }
  p_mContent = &self->mContent;
  objc_storeStrong((id *)&self->mContent, v5);
  if (!self->mFloating && !self->mIsInsideGroup)
  {
    [(CMStyle *)self->super.mStyle appendPropertyForName:0x26EBFB8D8 length:1 unit:self->super.mBox.size.width];
    [(CMStyle *)self->super.mStyle appendPropertyForName:0x26EC07B38 length:1 unit:self->super.mBox.size.height];
    goto LABEL_45;
  }
  if ([v7 isHeaderOrFooter]) {
    double v9 = -1000.0;
  }
  else {
    double v9 = 0.0;
  }
  BOOL v10 = [(WDAContent *)*p_mContent isShape];
  BOOL v11 = v10;
  if (v10)
  {
    CGFloat v5 = [(WDAContent *)*p_mContent anchor];
    if ([v5 relativeVerticalPosition] != 2)
    {
      if ([(WDAContent *)*p_mContent floating])
      {

LABEL_11:
        [v7 pageOffset];
        self->super.mBox.origin.double y = self->super.mBox.origin.y + v12;
        v13 = [(WDAContent *)*p_mContent anchor];
        int v14 = [v13 relativeVerticalPosition];

        if (v14)
        {
          double y = self->super.mBox.origin.y;
        }
        else
        {
          [v7 topMargin];
          double y = v45 / 20.0 + self->super.mBox.origin.y;
          self->super.mBox.origin.double y = y;
        }
        -[CMDrawableStyle addPositionProperties:](self->super.mStyle, "addPositionProperties:", self->super.mBox.origin.x, y, self->super.mBox.size.width, self->super.mBox.size.height);
        double v46 = self->super.mBox.origin.y;
        double height = self->super.mBox.size.height;
        [v7 totalPageHeight];
        if (v46 + height > v48)
        {
          CGFloat v49 = self->super.mBox.origin.y + self->super.mBox.size.height;
          *(float *)&CGFloat v49 = v49;
          [v7 setTotalPageHeight:v49];
        }
        mStyle = self->super.mStyle;
        v51 = [(WDAContent *)*p_mContent anchor];
        -[CMStyle appendPropertyForName:intValue:](mStyle, "appendPropertyForName:intValue:", 0x26EC15D38, (int)(v9 + (double)[v51 zIndex]));

        goto LABEL_45;
      }
    }
  }
  if (![(WDAContent *)*p_mContent isShape]) {
    goto LABEL_18;
  }
  v16 = [(WDAContent *)*p_mContent anchor];
  if (([v16 zIndex] & 0x8000000000000000) == 0)
  {
LABEL_17:

LABEL_18:
    if (v11) {

    }
    goto LABEL_20;
  }
  v17 = [(WDAContent *)*p_mContent anchor];
  if ([v17 relativeVerticalPosition] == 2)
  {

    goto LABEL_17;
  }
  BOOL v39 = [(WDAContent *)*p_mContent floating];

  if (v11)
  {

    if (v39) {
      goto LABEL_11;
    }
  }
  else if (v39)
  {
    goto LABEL_11;
  }
LABEL_20:
  v18 = [(WDAContent *)*p_mContent anchor];
  int v19 = [v18 textWrappingMode];

  if (v19 == 1)
  {
    [(CMStyle *)self->super.mStyle appendPropertyForName:0x26EC05B58 stringValue:0x26EC0C998];
    -[CMStyle appendSizeInfoFromRect:](self->super.mStyle, "appendSizeInfoFromRect:", self->super.mBox.origin.x, self->super.mBox.origin.y, self->super.mBox.size.width, self->super.mBox.size.height);
    self->mFloating = 0;
  }
  else
  {
    v20 = [(WDAContent *)*p_mContent anchor];
    if ([v20 textWrappingMode] == 3)
    {
    }
    else
    {
      BOOL mIsInsideGroup = self->mIsInsideGroup;

      if (!mIsInsideGroup)
      {
        v40 = [(CMMapper *)self root];
        [v40 contentSizeForDevice];
        double v42 = v41;

        -[CMStyle appendPositionInfoFromRect:](self->super.mStyle, "appendPositionInfoFromRect:", self->super.mBox.origin.x, self->super.mBox.origin.y, self->super.mBox.size.width, self->super.mBox.size.height);
        float v43 = v42;
        self->mFloating = 0;
        if (self->super.mBox.origin.x <= v43 - self->super.mBox.origin.x - self->super.mBox.size.width) {
          v44 = @":left;";
        }
        else {
          v44 = @":right;";
        }
        [(CMStyle *)self->super.mStyle appendPropertyForName:0x26EC169F8 stringWithColons:v44];
        goto LABEL_45;
      }
    }
    [v7 pageOffset];
    self->super.mBox.origin.double y = self->super.mBox.origin.y + v22;
    v23 = [(WDAContent *)*p_mContent anchor];
    int v24 = [v23 relativeHorizontalPosition];

    v25 = self->super.mStyle;
    double x = self->super.mBox.origin.x;
    double v27 = self->super.mBox.origin.y;
    double width = self->super.mBox.size.width;
    double v29 = self->super.mBox.size.height;
    if (v24 == 2) {
      -[CMDrawableStyle addPositionUsingOffsets:](v25, "addPositionUsingOffsets:", x, v27, width, v29);
    }
    else {
      -[CMDrawableStyle addPositionProperties:](v25, "addPositionProperties:", x, v27, width, v29);
    }
    double v30 = self->super.mBox.origin.y;
    double v31 = self->super.mBox.size.height;
    [v7 totalPageHeight];
    if (v30 + v31 > v32)
    {
      CGFloat v33 = self->super.mBox.origin.y + self->super.mBox.size.height;
      *(float *)&CGFloat v33 = v33;
      [v7 setTotalPageHeight:v33];
    }
    v34 = [(WDAContent *)*p_mContent anchor];
    uint64_t v35 = [v34 zIndex];

    v36 = [(WDAContent *)*p_mContent anchor];
    uint64_t v37 = [v36 zIndex];

    v38 = self->super.mStyle;
    if (v37 < 0)
    {
      [(CMStyle *)v38 appendPropertyForName:0x26EC15D38 stringWithColons:@":-1;"];
      [(CMStyle *)self->super.mStyle appendPropertyForName:0x26EC194F8 stringWithColons:@":0.25;"];
    }
    else
    {
      [(CMStyle *)v38 appendPropertyForName:0x26EC15D38 intValue:(int)(v9 + (double)v35)];
    }
  }
LABEL_45:
}

- (void)mapOfficeArtShapeAt:(id)a3 withState:(id)a4
{
  id v40 = a3;
  id v41 = a4;
  BOOL v39 = self->super.mDrawable;
  int v6 = [(OADDrawable *)v39 type];
  id v7 = [(OADDrawable *)v39 shapeProperties];
  v8 = [v7 fill];
  if (v8)
  {
    objc_opt_class();
    int v9 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    int v9 = 0;
  }
  BOOL v10 = [v7 stroke];
  BOOL v11 = [v10 fill];

  if (v11)
  {
    objc_opt_class();
    int v12 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    int v12 = 0;
  }
  char v13 = [v7 isTextBox];
  int v14 = +[OIXMLElement elementWithType:3];
  if (v6 == 202) {
    char v15 = 1;
  }
  else {
    char v15 = v13;
  }
  if ((v15 & 1) != 0 || v6 == 1 || v6 == 75 || ((v9 | v12) & 1) == 0)
  {
    [(WMOfficeArtMapper *)self mapOfficeArtTextboxAt:v14 withState:v41];
    if (v12)
    {
      float v32 = [CMBordersProperty alloc];
      CGFloat v33 = [v7 stroke];
      v34 = [(CMBordersProperty *)v32 initWithOADStroke:v33];

      [(CMStyle *)self->super.mStyle addProperty:v34 forKey:0x26EC191D8];
    }
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v35 = [v8 color];
        mStyle = self->super.mStyle;
        uint64_t v37 = +[CMColorProperty cssStringFromOADColor:v35];
        [(CMStyle *)mStyle appendPropertyForName:0x26EC19198 stringWithColons:v37];

        +[CMColorProperty transformedAlphaFromOADColor:v35];
        if (v38 != 1.0) {
          -[CMStyle appendPropertyForName:floatValue:](self->super.mStyle, "appendPropertyForName:floatValue:", 0x26EC194F8);
        }
      }
    }
    [(CMMapper *)self addStyleUsingGlobalCacheTo:v14 style:self->super.mStyle];
    [v40 addChild:v14];
  }
  else
  {
    [(CMMapper *)self addStyleUsingGlobalCacheTo:v14 style:self->super.mStyle];
    v43.receiver = self;
    v43.super_class = (Class)WMOfficeArtMapper;
    [(CMDrawableMapper *)&v43 mapShapeGraphicsAt:v14 withState:v41];
    [v40 addChild:v14];
    v16 = [(WDAContent *)self->mContent textBox];
    if (v16)
    {
      double Width = CGRectGetWidth(self->super.mBox);

      if (Width > 0.0)
      {
        v18 = +[OIXMLElement elementWithType:3];
        [(WMOfficeArtMapper *)self mapTextBoxAt:v18 withState:v41];
        v42.receiver = self;
        v42.super_class = (Class)WMOfficeArtMapper;
        [(CMDrawableMapper *)&v42 shapeTextBoxRect];
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        double v27 = objc_alloc_init(CMDrawableStyle);
        double v28 = v20 - self->super.mBox.origin.x;
        double v29 = v22 - self->super.mBox.origin.y;
        -[CMDrawableStyle addPositionUsingOffsets:](v27, "addPositionUsingOffsets:", v28, v29, v24, v26);
        [v41 totalPageHeight];
        double v31 = v30;
        if (v26 + v29 > v31)
        {
          *(float *)&double v31 = v26 + v29;
          [v41 setTotalPageHeight:v31];
        }
        [(CMMapper *)self addStyleUsingGlobalCacheTo:v18 style:v27];
        [v14 addChild:v18];
      }
    }
  }
}

- (void)mapOfficeArtTextboxAt:(id)a3 withState:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = [(WDAContent *)self->mContent textBox];
  if ([v7 nextTextBoxId])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super.super.mParent);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      [(WMOfficeArtMapper *)self expandedSizeForTextBox:v7 withState:v6];
      double v11 = v10;
      self->super.mBox.size.double width = v12;
      self->super.mBox.size.double height = v10;
      -[CMStyle appendPropertyForName:length:unit:](self->super.mStyle, "appendPropertyForName:length:unit:", 0x26EBFB8D8, 1);
      [(CMStyle *)self->super.mStyle appendPropertyForName:0x26EC07B38 length:1 unit:v11];
    }
  }
  char v13 = [WMSectionContentMapper alloc];
  int v14 = [v7 text];
  char v15 = [(WMSectionContentMapper *)v13 initWithWDText:v14 parent:self];

  [(WMSectionContentMapper *)v15 mapAt:v16 withState:v6];
}

- (id)blipAtIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  CGFloat v4 = [(CMMapper *)self root];
  CGFloat v5 = [v4 blipAtIndex:v3];

  return v5;
}

- (void)mapOfficeArtImageAt:(id)a3 withState:(id)a4
{
  id v5 = a3;
  id v6 = [(OADDrawable *)self->super.mDrawable imageProperties];
  id v7 = [v6 imageFill];
  v16.receiver = self;
  v16.super_class = (Class)WMOfficeArtMapper;
  [(CMDrawableMapper *)&v16 calculateUncroppedBox:v7];
  v8 = +[OIXMLElement elementWithType:9];
  if ([(CMDrawableMapper *)self isCropped] && self->super.mIsSupported)
  {
    int v9 = +[OIXMLElement elementWithType:3];
    CGFloat v10 = objc_alloc_init(CMDrawableStyle);
    [(CMStyle *)self->super.mStyle appendPropertyForName:0x26EC060D8 stringWithColons:@":hidden;"];
    [(CMDrawableMapper *)self uncroppedBox];
    -[CMStyle appendPositionInfoFromRect:](v10, "appendPositionInfoFromRect:");
    [(CMMapper *)self addStyleUsingGlobalCacheTo:v8 style:v10];
    [v9 addChild:v8];

    id v11 = v9;
  }
  else
  {
    id v11 = v8;
  }
  if (self->super.mIsSupported)
  {
    mImageBinaryData = self->super.mImageBinaryData;
    uint64_t mResourceType = self->super.mResourceType;
    v15.receiver = self;
    v15.super_class = (Class)WMOfficeArtMapper;
    int v14 = [(CMDrawableMapper *)&v15 saveResourceAndReturnPath:mImageBinaryData withType:mResourceType];
    [(CMMapper *)self addAttribute:0x26EC19158 toNode:v8 value:v14];
  }
  else
  {
    [(CMStyle *)self->super.mStyle appendDefaultBorderStyle];
  }
  [(CMMapper *)self addStyleUsingGlobalCacheTo:v11 style:self->super.mStyle];
  [v5 addChild:v11];
}

- (void)mapOfficeArtGroupAt:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self->super.mDrawable;
  uint64_t v9 = [(OADDrawable *)v8 childCount];
  unint64_t v10 = v9;
  if (self->mFloating || self->mIsInsideGroup)
  {
    id v18 = v6;
    if (!v9) {
      goto LABEL_7;
    }
  }
  else
  {
    v17 = +[OIXMLElement elementWithType:3];
    [v6 addChild:v17];
    id v18 = v17;

    -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:");
    [(OADDrawable *)v8 logicalBounds];

    if (!v10) {
      goto LABEL_7;
    }
  }
  uint64_t v11 = 0;
  CGFloat v12 = 0;
  unsigned int v13 = 1;
  do
  {
    int v14 = [(OADDrawable *)v8 childAtIndex:v11];

    objc_super v15 = [[WMOfficeArtMapper alloc] initWithOadDrawable:v14 asFloating:self->mFloating parent:self];
    [(WMOfficeArtMapper *)v15 setIsInsideGroup:1];
    [(WMOfficeArtMapper *)v15 mapAt:v18 withState:v7];

    uint64_t v11 = v13;
    BOOL v16 = v10 > v13++;
    CGFloat v12 = v14;
  }
  while (v16);

LABEL_7:
}

- (void)setIsInsideGroup:(BOOL)a3
{
  self->BOOL mIsInsideGroup = a3;
}

- (CGSize)expandedSizeForTextBox:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_mBodouble x = &self->super.mBox;
  double width = self->super.mBox.size.width;
  double height = self->super.mBox.size.height;
  uint64_t v11 = [v7 runIndex];
  [v7 pageOffset];
  float v13 = v12;
  uint64_t v37 = [v6 nextTextBoxId];
  int v14 = 0;
  p_mParent = &self->super.super.mParent;
  double v16 = v13;
LABEL_2:
  v17 = v14;
  while (1)
  {
    ++v11;
    id WeakRetained = objc_loadWeakRetained((id *)p_mParent);
    int v14 = [WeakRetained runAtIndex:v11];

    if (!v14) {
      break;
    }
    v17 = v14;
    if ([v14 runType] == 3)
    {
      double v19 = [v14 drawable];
      double v20 = v19;
      if (v19)
      {
        double v21 = [v19 clientData];
        if (v21 && v37 != [v20 id])
        {
          int v32 = 0;
        }
        else
        {
          double v22 = [v20 clientData];
          [v22 bounds];
          double v24 = v23;
          double v26 = v25;
          double v28 = v27;
          double v30 = v29;

          double x = v26 + v16;
          if (v26 + v16 == p_mBox->origin.y)
          {
            double width = width + v28;
          }
          else
          {
            double x = p_mBox->origin.x;
            if (v24 == p_mBox->origin.x) {
              double height = height + v30;
            }
          }
          CGFloat v33 = objc_msgSend(v21, "textBox", x);
          v34 = v33;
          if (v33 && [v33 nextTextBoxId])
          {
            uint64_t v37 = [v34 nextTextBoxId];
            int v32 = 0;
          }
          else
          {
            int v32 = 3;
          }
        }
      }
      else
      {
        int v32 = 2;
      }

      if (v32 != 3) {
        goto LABEL_2;
      }
      break;
    }
  }

  double v35 = width;
  double v36 = height;
  result.double height = v36;
  result.double width = v35;
  return result;
}

- (void)mapTextBoxAt:(id)a3 withState:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(WDAContent *)self->mContent textBox];
  v8 = [WMSectionContentMapper alloc];
  uint64_t v9 = [v7 text];
  unint64_t v10 = [(WMSectionContentMapper *)v8 initWithWDText:v9 parent:self];

  [(WMSectionContentMapper *)v10 mapAt:v11 withState:v6];
}

- (BOOL)isInsideGroup
{
  return self->mIsInsideGroup;
}

- (WMOfficeArtMapper)initWithOadDrawable:(id)a3 asFloating:(BOOL)a4 parent:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WMOfficeArtMapper;
  unint64_t v10 = [(CMDrawableMapper *)&v16 initWithOadDrawable:v8 parent:v9];
  id v11 = v10;
  if (v10)
  {
    mContent = v10->mContent;
    v10->mContent = 0;

    v11->mFloating = a4;
    v11->mIsMapped = 1;
    [(WMOfficeArtMapper *)v11 setBoundingBox];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      mDrawable = v11->super.mDrawable;
      v15.receiver = v11;
      v15.super_class = (Class)WMOfficeArtMapper;
      [(CMDrawableMapper *)&v15 setWithOadImage:mDrawable];
    }
  }

  return v11;
}

- (void)setCurrentPage:(unsigned int)a3
{
  self->mCurrentPage = a3;
}

- (void).cxx_destruct
{
}

- (void)mapDiagramAt:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[OIXMLElement elementWithType:3];
  [(CMStyle *)self->super.mStyle appendPropertyString:@"display:inline-block;"];
  [(CMMapper *)self addStyleUsingGlobalCacheTo:v8 style:self->super.mStyle];
  [v6 addChild:v8];
  id v15 = v8;

  id v9 = objc_alloc_init(CMDrawableStyle);
  unint64_t v10 = +[OIXMLElement elementWithType:3];
  [(CMStyle *)v9 appendPropertyString:@" position:absolute;"];
  [(CMMapper *)self addStyleUsingGlobalCacheTo:v10 style:v9];
  id v11 = -[CMDrawingContext initWithFrame:]([CMDrawingContext alloc], "initWithFrame:", self->super.mBox.origin.x, self->super.mBox.origin.y, self->super.mBox.size.width, self->super.mBox.size.height);
  +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", self->super.mBox.origin.x, self->super.mBox.origin.y, self->super.mBox.size.width, self->super.mBox.size.height);
  float v12 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue();
  mOrientedBounds = self->super.mOrientedBounds;
  self->super.mOrientedBounds = v12;

  int v14 = [[CMDiagramMapper alloc] initWithOddDiagram:self->super.mDrawable drawingContext:v11 orientedBounds:self->super.mOrientedBounds parent:self];
  [(CMDiagramMapper *)v14 mapAt:v10 withState:v7];
  [(CMDrawableMapper *)self mapDrawingContext:v11 at:v15 relative:1 withState:v7];
  [v15 addChild:v10];
  +[WMParagraphMapper mapPlaceholderAt:rect:withState:](WMParagraphMapper, "mapPlaceholderAt:rect:withState:", v15, v7, self->super.mBox.origin.x, self->super.mBox.origin.y, self->super.mBox.size.width, self->super.mBox.size.height);
}

@end