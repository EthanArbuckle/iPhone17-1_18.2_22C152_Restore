@interface PMDrawableMapper
- (BOOL)isTopLevelMapper;
- (CGRect)shapeTextBoxWithState:(id)a3;
- (CGRect)slideRect;
- (CGRect)transformRectToPage:(CGRect)result;
- (id)drawingContext;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapBounds;
- (void)mapChartAt:(id)a3 withState:(id)a4;
- (void)mapDiagramAt:(id)a3 withState:(id)a4;
- (void)mapFreeForm:(id)a3 orientedBounds:(id)a4 transformedBounds:(CGRect *)a5 state:(id)a6;
- (void)mapOfficeArtGroupAt:(id)a3 withState:(id)a4;
- (void)mapOfficeArtImageAt:(id)a3 withState:(id)a4;
- (void)mapOfficeArtShapeAt:(id)a3 withState:(id)a4;
- (void)mapRectangularShapeAt:(id)a3 withState:(id)a4;
- (void)mapShapeAsBackgroundAt:(id)a3 withState:(id)a4;
- (void)setDrawingContext:(id)a3;
- (void)setTopLevelMapper:(BOOL)a3;
@end

@implementation PMDrawableMapper

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 childrenCount];
  if (self->mDrawingContext)
  {
    v9 = 0;
  }
  else
  {
    v10 = +[CMGlobalCache drawableElementCache];
    v11 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self->super.mDrawable];
    v9 = [v10 objectForKey:v11];
  }
  [(PMDrawableMapper *)self mapBounds];
  if (!self->mDrawingContext)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [(PMDrawableMapper *)self setTopLevelMapper:1];
      v12 = [CMDrawingContext alloc];
      [(OADOrientedBounds *)self->super.mOrientedBounds bounds];
      v13 = -[CMDrawingContext initWithFrame:](v12, "initWithFrame:");
      [(CMDrawingContext *)v13 setMapper:self];
      [(PMDrawableMapper *)self setDrawingContext:v13];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(PMDrawableMapper *)self mapOfficeArtImageAt:v6 withState:v7];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(PMDrawableMapper *)self mapDiagramAt:v6 withState:v7];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(PMDrawableMapper *)self mapOfficeArtShapeAt:v6 withState:v7];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(PMDrawableMapper *)self mapOfficeArtGroupAt:v6 withState:v7];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v14 = [[PMTableMapper alloc] initWithOadTable:self->super.mDrawable bounds:self->super.mOrientedBounds parent:self];
            [(PMTableMapper *)v14 mapAt:v6 withState:v7];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [(PMDrawableMapper *)self mapChartAt:v6 withState:v7];
            }
          }
        }
      }
    }
  }
  if (v9)
  {
    [v6 addChild:v9];
  }
  else if ([(PMDrawableMapper *)self isTopLevelMapper])
  {
    id v15 = [(CMDrawingContext *)self->mDrawingContext copyPDF];
    if (v15)
    {
      v9 = +[OIXMLElement elementWithType:9];
      [v6 insertChild:v9 atIndex:v8];
      v16 = +[CMGlobalCache drawableElementCache];
      v17 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self->super.mDrawable];
      [v16 setObject:v9 forKey:v17];

      v30.receiver = self;
      v30.super_class = (Class)PMDrawableMapper;
      v18 = [(CMMapper *)&v30 archiver];
      v19 = [v18 addResourceForDrawable:v15 withType:7 drawable:self->super.mDrawable];
      [(CMMapper *)self addAttribute:0x26EC19158 toNode:v9 value:v19];
      [(CMDrawingContext *)self->mDrawingContext pdfFrame];
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      v28 = objc_alloc_init(CMDrawableStyle);
      -[CMDrawableStyle addPositionProperties:](v28, "addPositionProperties:", v21, v23, v25, v27);
      v29.receiver = self;
      v29.super_class = (Class)PMDrawableMapper;
      [(CMMapper *)&v29 addStyleUsingGlobalCacheTo:v9 style:v28 embedStyle:1];
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
}

- (void)mapBounds
{
  v3 = +[OAITOrientedBounds relativeOrientedBoundsOfDrawable:self->super.mDrawable];
  mOrientedBounds = self->super.mOrientedBounds;
  self->super.mOrientedBounds = v3;

  [(OADOrientedBounds *)self->super.mOrientedBounds rotation];
  if (+[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:"))
  {
    v5 = self->super.mOrientedBounds;
    [(OADOrientedBounds *)v5 bounds];
    [(OADOrientedBounds *)v5 setBounds:NSTransposedRectWithSameCenter(v6, v7, v8, v9)];
  }
  v10 = self->super.mOrientedBounds;
  if (v10)
  {
    [(OADOrientedBounds *)v10 bounds];
    self->super.mBox.origin.x = v11;
    self->super.mBox.origin.y = v12;
    self->super.mBox.size.width = v13;
    self->super.mBox.size.height = v14;
  }
}

- (void)setTopLevelMapper:(BOOL)a3
{
  self->mTopLevelMapper = a3;
}

- (void)setDrawingContext:(id)a3
{
}

- (void)mapOfficeArtShapeAt:(id)a3 withState:(id)a4
{
  id v33 = a3;
  id v6 = a4;
  p_mShape = &self->mShape;
  objc_storeStrong((id *)&self->mShape, self->super.mDrawable);
  int v8 = [(OADShape *)self->mShape type];
  CGFloat v9 = [(OADShape *)self->mShape shapeProperties];
  v10 = [v9 orientedBounds];
  CGFloat v11 = [v9 fill];
  char v12 = [v9 isTextBox];
  if (v8 == 202) {
    char v13 = 1;
  }
  else {
    char v13 = v12;
  }
  [v10 rotation];
  float v15 = v14;
  [v11 alpha];
  float v17 = v16;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = [v11 color];
    +[CMColorProperty transformedAlphaFromOADColor:v18];
    float v17 = v17 * v19;
  }
  if (((v13 & 1) != 0 || v8 == 75 || v8 == 1)
    && (v15 == 0.0 ? (BOOL v20 = v17 == 1.0) : (BOOL v20 = 0),
        v20 && [(PMDrawableMapper *)self isTopLevelMapper]))
  {
    [(PMDrawableMapper *)self mapRectangularShapeAt:v33 withState:v6];
  }
  else
  {
    [(PMDrawableMapper *)self mapShapeAsBackgroundAt:v33 withState:v6];
    double v21 = [(OADShape *)*p_mShape textBody];
    if (v21)
    {
      double v22 = [(OADShape *)*p_mShape textBody];
      char v23 = [v22 isEmpty];

      if ((v23 & 1) == 0)
      {
        v32 = +[OIXMLElement elementWithType:3];
        [(PMDrawableMapper *)self shapeTextBoxWithState:v6];
        if (v25 <= 0.0 || v24 <= 0.0)
        {
          [v10 bounds];
          -[PMDrawableMapper transformRectToPage:](self, "transformRectToPage:");
        }
        else
        {
          -[PMDrawableMapper transformRectToPage:](self, "transformRectToPage:");
        }
        double v26 = +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:");
        mStyle = self->super.mStyle;
        [v26 bounds];
        -[CMDrawableStyle addPositionProperties:](mStyle, "addPositionProperties:");
        [v33 addChild:v32];
        v28 = self->super.mStyle;
        v34.receiver = self;
        v34.super_class = (Class)PMDrawableMapper;
        [(CMMapper *)&v34 addStyleUsingGlobalCacheTo:v32 style:v28 embedStyle:1];
        objc_super v29 = [PMShapeTextMapper alloc];
        objc_super v30 = [(OADShape *)*p_mShape textBody];
        v31 = [(PMShapeTextMapper *)v29 initWithOadTextBody:v30 bounds:v26 parent:self];

        [(PMShapeTextMapper *)v31 mapAt:v32 withState:v6];
      }
    }
  }
}

- (BOOL)isTopLevelMapper
{
  return self->mTopLevelMapper;
}

- (void)mapRectangularShapeAt:(id)a3 withState:(id)a4
{
  id v25 = a3;
  id v24 = a4;
  id v6 = [(OADShape *)self->mShape shapeProperties];
  CGFloat v7 = [v6 orientedBounds];
  [v7 bounds];
  -[PMDrawableMapper transformRectToPage:](self, "transformRectToPage:");
  int v8 = +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:");

  mStyle = self->super.mStyle;
  [v8 bounds];
  -[CMDrawableStyle addPositionProperties:](mStyle, "addPositionProperties:");
  v10 = [v6 fill];
  if (v10)
  {
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v11 = 0;
  }
  char v12 = [v6 stroke];
  char v13 = [v12 fill];

  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      float v14 = [CMBordersProperty alloc];
      float v15 = [v6 stroke];
      float v16 = [(CMBordersProperty *)v14 initWithOADStroke:v15];

      [(CMStyle *)self->super.mStyle addProperty:v16 forKey:0x26EC191D8];
    }
  }
  if (v11)
  {
    float v17 = [CMImageFillMapper alloc];
    [(OADOrientedBounds *)self->super.mOrientedBounds bounds];
    v18 = -[CMImageFillMapper initWithOadFill:bounds:parent:](v17, "initWithOadFill:bounds:parent:", v10, self);
    [(CMImageFillMapper *)v18 mapNonImageFillAt:v25 toStyle:self->super.mStyle withState:v24];
  }
  float v19 = +[OIXMLElement elementWithType:3];
  [v25 addChild:v19];
  BOOL v20 = self->super.mStyle;
  v26.receiver = self;
  v26.super_class = (Class)PMDrawableMapper;
  [(CMMapper *)&v26 addStyleUsingGlobalCacheTo:v19 style:v20 embedStyle:1];
  double v21 = [PMShapeTextMapper alloc];
  double v22 = [(OADShape *)self->mShape textBody];
  char v23 = [(PMShapeTextMapper *)v21 initWithOadTextBody:v22 bounds:v8 parent:self];

  [(PMShapeTextMapper *)v23 setRectangular:1];
  [(PMShapeTextMapper *)v23 mapAt:v19 withState:v24];
}

- (CGRect)transformRectToPage:(CGRect)result
{
  mDrawingContext = self->mDrawingContext;
  if (mDrawingContext) {
    -[CMDrawingContext transformRectToPage:](mDrawingContext, "transformRectToPage:", result.origin.x, result.origin.y, result.size.width, result.size.height);
  }
  return result;
}

- (void)mapOfficeArtImageAt:(id)a3 withState:(id)a4
{
  id v18 = a3;
  id v19 = a4;
  id v6 = self->super.mDrawable;
  [(OADDrawable *)v6 movie];

  CGFloat v7 = +[OIXMLElement elementWithType:9];
  int v8 = [(OADDrawable *)self->super.mDrawable imageProperties];
  if ([v8 hasImageFill])
  {
    float v17 = [v8 imageFill];
    CGFloat v9 = [CMImageFillMapper alloc];
    [(OADOrientedBounds *)self->super.mOrientedBounds bounds];
    -[PMDrawableMapper transformRectToPage:](self, "transformRectToPage:");
    v10 = -[CMImageFillMapper initWithOadFill:bounds:parent:](v9, "initWithOadFill:bounds:parent:", v17, self);
    if ([(CMImageFillMapper *)v10 isCropped])
    {
      id v11 = +[OIXMLElement elementWithType:3];
      char v12 = objc_alloc_init(CMDrawableStyle);
      [(CMStyle *)self->super.mStyle appendPropertyForName:0x26EC060D8 stringWithColons:@":hidden;"];
      [(CMImageFillMapper *)v10 uncroppedBox];
      -[CMDrawableStyle addPositionProperties:](v12, "addPositionProperties:");
      [(CMMapper *)self addStyleUsingGlobalCacheTo:v7 style:v12 embedStyle:1];
      [v11 addChild:v7];
      mStyle = self->super.mStyle;
      float v14 = [v8 orientedBounds];
      [v14 bounds];
      -[PMDrawableMapper transformRectToPage:](self, "transformRectToPage:");
      -[CMDrawableStyle addPositionProperties:](mStyle, "addPositionProperties:");
    }
    else
    {
      id v11 = v7;
      float v15 = self->super.mStyle;
      char v12 = [v8 orientedBounds];
      [(CMDrawableStyle *)v12 bounds];
      -[PMDrawableMapper transformRectToPage:](self, "transformRectToPage:");
      -[CMDrawableStyle addPositionProperties:](v15, "addPositionProperties:");
    }

    float v16 = [(CMImageFillMapper *)v10 mapImageFill:v7 withState:v19];
    if (v16) {
      [(CMMapper *)self addAttribute:0x26EC19158 toNode:v7 value:v16];
    }
    else {
      [(CMStyle *)self->super.mStyle appendPropertyForName:0x26EC191D8 stringWithColons:@":1px solid black;"];
    }
    [(CMMapper *)self addStyleUsingGlobalCacheTo:v11 style:self->super.mStyle embedStyle:1];
    [v18 addChild:v11];
  }
  else
  {
    id v11 = 0;
  }
}

- (void)mapShapeAsBackgroundAt:(id)a3 withState:(id)a4
{
  id v20 = a4;
  uint64_t v5 = [(OADShape *)self->mShape type];
  if (!v5)
  {
    if (+[CMShapeUtils isShapeALine:self->mShape]) {
      uint64_t v5 = 20;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  id v6 = [(OADShape *)self->mShape shapeProperties];
  CGFloat v7 = [v6 orientedBounds];

  long long v8 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  v21[0] = *MEMORY[0x263F001A8];
  v21[1] = v8;
  switch((int)v5)
  {
    case 0:
      float v17 = [(OADShape *)self->mShape geometry];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v19 = [(OADShape *)self->mShape geometry];
        [(PMDrawableMapper *)self mapFreeForm:v19 orientedBounds:v7 transformedBounds:v21 state:v20];
      }
      goto LABEL_8;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 15:
    case 16:
    case 22:
    case 47:
    case 55:
    case 56:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 92:
    case 96:
    case 97:
    case 99:
    case 106:
    case 110:
      goto LABEL_6;
    case 14:
    case 17:
    case 18:
    case 19:
    case 21:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 57:
    case 64:
    case 65:
    case 71:
    case 72:
    case 73:
    case 74:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 93:
    case 94:
    case 95:
    case 98:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 107:
    case 108:
    case 109:
      goto LABEL_8;
    case 20:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
      CGFloat v9 = [(OADShape *)self->mShape shapeProperties];
      v10 = [v9 stroke];
      id v11 = [(OADShape *)self->mShape geometry];
      float v15 = [v11 adjustValues];
      +[CMShapeRenderer renderLine:v5 stroke:v10 adjustValues:v15 orientedBounds:v7 state:v20 drawingContext:self->mDrawingContext];

      goto LABEL_7;
    default:
      if ((v5 - 176) > 0x23 || ((1 << (v5 + 80)) & 0xF04000841) == 0) {
        goto LABEL_8;
      }
LABEL_6:
      CGFloat v9 = [(OADShape *)self->mShape shapeProperties];
      v10 = [v9 fill];
      id v11 = [(OADShape *)self->mShape shapeProperties];
      char v12 = [v11 stroke];
      char v13 = [(OADShape *)self->mShape geometry];
      float v14 = [v13 adjustValues];
      +[CMShapeRenderer renderCanonicalShape:v5 fill:v10 stroke:v12 adjustValues:v14 orientedBounds:v7 state:v20 drawingContext:self->mDrawingContext];

LABEL_7:
LABEL_8:

      return;
  }
}

- (CGRect)shapeTextBoxWithState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(OADShape *)self->mShape geometry];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
LABEL_5:
    CGFloat v7 = v6;
    goto LABEL_7;
  }
  if ([v4 sourceFormat] == 5)
  {
    id v6 = [v5 equivalentCustomGeometry];
    goto LABEL_5;
  }
  CGFloat v7 = [v5 equivalentCustomGeometry];
  +[CMShapeUtils setCoordSpaceForCustomeGeometry:self->super.mBox.size.width fromSize:self->super.mBox.size.height];
LABEL_7:
  if ([v7 textBodyRectCount])
  {
    long long v8 = [v7 textBodyRectAtIndex:0];
    +[CMShapeUtils mapAdjustCoord:geometry:](CMShapeUtils, "mapAdjustCoord:geometry:", [v8 left], v7);
    double v10 = v9;
    +[CMShapeUtils mapAdjustCoord:geometry:](CMShapeUtils, "mapAdjustCoord:geometry:", [v8 right], v7);
    double v12 = v11;
    +[CMShapeUtils mapAdjustCoord:geometry:](CMShapeUtils, "mapAdjustCoord:geometry:", [v8 top], v7);
    double v14 = v13;
    +[CMShapeUtils mapAdjustCoord:geometry:](CMShapeUtils, "mapAdjustCoord:geometry:", [v8 bottom], v7);
    float v15 = v10;
    float v16 = v12;
    float v17 = v14;
    float v19 = v18;
    if ([v7 isEscher])
    {
      if (v7) {
        [v7 geometryCoordSpace];
      }
      double width = self->super.mBox.size.width;
      float v21 = width / 21600.0;
      double x = self->super.mBox.origin.x + (float)(v15 * v21);
      float v23 = self->super.mBox.size.height / 21600.0;
      float v24 = (float)(v16 - v15) * v21;
      if (v24 > 0.0) {
        double width = -0.0;
      }
      double v25 = width + v24;
      double y = self->super.mBox.origin.y + (float)(v17 * v23);
      float v27 = (float)(v19 - v17) * v23;
      double v28 = v27;
      if (v27 <= 0.0) {
        double height = self->super.mBox.size.height;
      }
      else {
        double height = -0.0;
      }
      double v30 = height + v28;
    }
    else
    {
      double y = self->super.mBox.origin.y + v17;
      double v30 = (float)(v19 - v17);
      double x = self->super.mBox.origin.x + v15;
      double v25 = (float)(v16 - v15);
    }
  }
  else
  {
    double x = self->super.mBox.origin.x;
    double y = self->super.mBox.origin.y;
    double v25 = self->super.mBox.size.width;
    double v30 = self->super.mBox.size.height;
  }

  double v31 = x;
  double v32 = y;
  double v33 = v25;
  double v34 = v30;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

- (void)mapOfficeArtGroupAt:(id)a3 withState:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  CGFloat v7 = self->super.mDrawable;
  unint64_t v8 = [(OADDrawable *)v7 childCount];
  [(OADDrawable *)v7 logicalBounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  float v27 = +[OAITOrientedBounds relativeOrientedBoundsOfDrawable:v7];
  float v17 = +[CMShapeUtils transformFromBounds:toOrientedBounds:](CMShapeUtils, "transformFromBounds:toOrientedBounds:", v27, v10, v12, v14, v16);
  double v18 = [(PMDrawableMapper *)self drawingContext];
  [v18 addTransform:v17];

  if (v8)
  {
    uint64_t v19 = 0;
    id v20 = 0;
    unsigned int v21 = 1;
    do
    {
      double v22 = [(OADDrawable *)v7 childAtIndex:v19];

      if (([v22 hidden] & 1) == 0)
      {
        float v23 = [(CMDrawableMapper *)[PMDrawableMapper alloc] initWithOadDrawable:v22 parent:self];
        float v24 = [(PMDrawableMapper *)self drawingContext];
        [(PMDrawableMapper *)v23 setDrawingContext:v24];

        [(PMDrawableMapper *)v23 mapAt:v28 withState:v6];
      }
      uint64_t v19 = v21;
      BOOL v25 = v8 > v21++;
      id v20 = v22;
    }
    while (v25);
  }
  else
  {
    double v22 = 0;
  }
  objc_super v26 = [(PMDrawableMapper *)self drawingContext];
  [v26 restoreLastTransform];
}

- (id)drawingContext
{
  return self->mDrawingContext;
}

- (void)mapFreeForm:(id)a3 orientedBounds:(id)a4 transformedBounds:(CGRect *)a5 state:(id)a6
{
  id v15 = a3;
  id v9 = a4;
  id v10 = a6;
  if ([v15 pathCount])
  {
    double v11 = [(OADShape *)self->mShape shapeProperties];
    double v12 = [v11 fill];
    double v13 = [(OADShape *)self->mShape shapeProperties];
    double v14 = [v13 stroke];
    +[CMShapeRenderer renderFreeForm:v15 fill:v12 stroke:v14 orientedBounds:v9 state:v10 drawingContext:self->mDrawingContext];
  }
}

- (void)mapDiagramAt:(id)a3 withState:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  CGFloat v7 = [[CMDiagramMapper alloc] initWithOddDiagram:self->super.mDrawable drawingContext:self->mDrawingContext orientedBounds:self->super.mOrientedBounds parent:self];
  [(CMDiagramMapper *)v7 mapAt:v8 withState:v6];
}

- (void)mapChartAt:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[EMChartMapper alloc] initWithChart:self->super.mDrawable parent:self];
  [(OADOrientedBounds *)self->super.mOrientedBounds bounds];
  id v11 = -[EMChartMapper copyPdfWithState:withSize:](v8, "copyPdfWithState:withSize:", v7, v9, v10);
  double v12 = +[OIXMLElement elementWithType:9];
  if (v11)
  {
    v14.receiver = self;
    v14.super_class = (Class)PMDrawableMapper;
    double v13 = [(CMDrawableMapper *)&v14 saveResourceAndReturnPath:v11 withType:7];
    [(CMMapper *)self addAttribute:0x26EC19158 toNode:v12 value:v13];
  }
  else
  {
    [(CMStyle *)self->super.mStyle appendPropertyForName:0x26EC191D8 stringWithColons:@": 1px solid black;"];
  }
  [v6 addChild:v12];
  -[CMDrawableStyle addPositionProperties:](self->super.mStyle, "addPositionProperties:", self->super.mBox.origin.x, self->super.mBox.origin.y, self->super.mBox.size.width, self->super.mBox.size.height);
  [(CMMapper *)self addStyleUsingGlobalCacheTo:v12 style:self->super.mStyle embedStyle:1];
}

- (CGRect)slideRect
{
  v2 = [(CMMapper *)self root];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v2 slideSize];
    double v4 = v3;
    double v6 = v5;
    double v7 = 0.0;
    double v8 = 0.0;
  }
  else
  {
    double v7 = *MEMORY[0x263F001A8];
    double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v4 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v9 = v7;
  double v10 = v8;
  double v11 = v4;
  double v12 = v6;
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDrawingContext, 0);
  objc_storeStrong((id *)&self->mShape, 0);
}

@end