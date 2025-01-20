@interface CMDrawableMapper
- (BOOL)isCropped;
- (CGRect)box;
- (CGRect)shapeTextBoxRect;
- (CGRect)uncroppedBox;
- (CMDrawableMapper)initWithOadDrawable:(id)a3 parent:(id)a4;
- (CMDrawableMapper)initWithParent:(id)a3;
- (float)rotation;
- (id)blipAtIndex:(unsigned int)a3;
- (id)convertMetafileToPdf;
- (id)saveResourceAndReturnPath:(id)a3 withType:(int)a4;
- (void)calculateUncroppedBox:(id)a3;
- (void)mapDrawingContext:(id)a3 at:(id)a4 relative:(BOOL)a5 withState:(id)a6;
- (void)mapShapeGraphicsAt:(id)a3 withState:(id)a4;
- (void)setRotation:(float)a3;
- (void)setWithOadImage:(id)a3;
@end

@implementation CMDrawableMapper

- (CMDrawableMapper)initWithOadDrawable:(id)a3 parent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CMDrawableMapper;
  v9 = [(CMMapper *)&v14 initWithParent:v8];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mDrawable, a3);
    v11 = objc_alloc_init(CMDrawableStyle);
    mStyle = v10->mStyle;
    v10->mStyle = v11;
  }
  return v10;
}

- (void)setWithOadImage:(id)a3
{
  id v4 = a3;
  self->mIsSupported = 0;
  id v24 = v4;
  v5 = [v4 imageProperties];
  v6 = [v5 imageFill];
  if (![v6 isBlipRefOverridden]) {
    goto LABEL_11;
  }
  id v7 = [v6 blipRef];
  id v8 = [v7 blip];
  if (!v8)
  {
    uint64_t v20 = [v7 index];
    if ((int)v20 > 0)
    {
      id v8 = [(CMDrawableMapper *)self blipAtIndex:v20];

      if (!v8) {
        goto LABEL_19;
      }
      goto LABEL_4;
    }

LABEL_11:
    id v8 = 0;
    goto LABEL_19;
  }

LABEL_4:
  v9 = [v8 mainSubBlip];
  char v10 = [v9 load];

  if (v10)
  {
    v11 = [v8 mainSubBlip];
    v12 = [v11 data];
    mImageBinaryData = self->mImageBinaryData;
    self->mImageBinaryData = v12;

    objc_super v14 = [v8 mainSubBlip];
    uint64_t v15 = [v14 type];

    self->mResourceType = +[CMArchiveManager blipTypeToResourceType:v15];
    switch((int)v15)
    {
      case 2:
        mExtension = self->mExtension;
        v23 = @"jpg";
        goto LABEL_17;
      case 3:
        mExtension = self->mExtension;
        v23 = @"png";
        goto LABEL_17;
      case 4:
      case 5:
      case 6:
        v16 = self->mExtension;
        self->mExtension = (NSString *)@"pdf";

        v17 = [(CMDrawableMapper *)self convertMetafileToPdf];
        v18 = self->mImageBinaryData;
        self->mImageBinaryData = v17;

        BOOL v19 = self->mImageBinaryData != 0;
        goto LABEL_18;
      case 7:
        mExtension = self->mExtension;
        v23 = @"gif";
        goto LABEL_17;
      case 8:
        mExtension = self->mExtension;
        v23 = @"tiff";
LABEL_17:
        self->mExtension = (NSString *)v23;

        BOOL v19 = 1;
LABEL_18:
        self->mIsSupported = v19;
        break;
      default:
        v21 = self->mExtension;
        self->mExtension = 0;

        break;
    }
  }
LABEL_19:
}

- (id)saveResourceAndReturnPath:(id)a3 withType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(CMMapper *)self archiver];
  id v8 = [v7 addResource:v6 withType:v4];

  return v8;
}

- (id)convertMetafileToPdf
{
  v3 = [(OADDrawable *)self->mDrawable drawableProperties];
  uint64_t v4 = [v3 orientedBounds];
  [v4 bounds];
  double width = v5;
  double height = v7;

  if (width == 0.0 || height == 0.0)
  {
    double width = self->mBox.size.width;
    double height = self->mBox.size.height;
  }
  v9 = +[MFConverter play:frame:colorMap:fillMap:](MFConverter, "play:frame:colorMap:fillMap:", self->mImageBinaryData, 0, 0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), width, height);
  return v9;
}

- (id)blipAtIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  double v5 = [(CMMapper *)self root];
  int v6 = [v5 conformsToProtocol:&unk_26ECDAAE8];

  if (v6)
  {
    double v7 = [(CMMapper *)self root];
    id v8 = [v7 blipAtIndex:v3];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (CGRect)box
{
  double x = self->mBox.origin.x;
  double y = self->mBox.origin.y;
  double width = self->mBox.size.width;
  double height = self->mBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)mapShapeGraphicsAt:(id)a3 withState:(id)a4
{
  id v31 = a3;
  id v30 = a4;
  int v6 = self->mDrawable;
  uint64_t v7 = [(OADDrawable *)v6 type];
  if (!v7)
  {
    if (+[CMShapeUtils isShapeALine:v6]) {
      uint64_t v7 = 20;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  id v8 = [(OADDrawable *)v6 shapeProperties];
  v32 = [v8 orientedBounds];

  mOrientedBounds = self->mOrientedBounds;
  if (mOrientedBounds)
  {
    [(OADOrientedBounds *)mOrientedBounds bounds];
  }
  else
  {
    double x = self->mBox.origin.x;
    double y = self->mBox.origin.y;
    double width = self->mBox.size.width;
    double height = self->mBox.size.height;
  }
  objc_msgSend(v32, "setBounds:", x, y, width, height);
  v33 = -[CMDrawingContext initWithFrame:]([CMDrawingContext alloc], "initWithFrame:", self->mBox.origin.x, self->mBox.origin.y, self->mBox.size.width, self->mBox.size.height);
  switch((int)v7)
  {
    case 0:
      v29 = [(OADDrawable *)v6 geometry];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_12;
      }
      v26 = [(OADDrawable *)v6 geometry];
      uint64_t v27 = [v26 pathCount];

      if (!v27) {
        goto LABEL_13;
      }
      v29 = [(OADDrawable *)v6 geometry];
      objc_super v14 = [(OADDrawable *)v6 shapeProperties];
      uint64_t v15 = [v14 fill];
      v16 = [(OADDrawable *)v6 shapeProperties];
      v17 = [v16 stroke];
      +[CMShapeRenderer renderFreeForm:v29 fill:v15 stroke:v17 orientedBounds:v32 state:v30 drawingContext:v33];
      goto LABEL_10;
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
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
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
      goto LABEL_9;
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
    case 47:
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
      goto LABEL_16;
    case 20:
      v28 = [(OADDrawable *)v6 geometry];
      objc_opt_class();
      objc_opt_isKindOfClass();

      v29 = [(OADDrawable *)v6 shapeProperties];
      objc_super v14 = [v29 stroke];
      uint64_t v15 = [(OADDrawable *)v6 geometry];
      v16 = [v15 adjustValues];
      +[CMShapeRenderer renderLine:20 stroke:v14 adjustValues:v16 orientedBounds:v32 state:v30 drawingContext:v33];
      goto LABEL_11;
    default:
      char v25 = v7 + 92;
      if ((v7 - 164) > 0x2F) {
        goto LABEL_16;
      }
      if (((1 << v25) & 0xF04000840000) != 0) {
        goto LABEL_9;
      }
      if (((1 << v25) & 3) != 0)
      {
        uint64_t v7 = 1;
LABEL_9:
        v29 = [(OADDrawable *)v6 shapeProperties];
        objc_super v14 = [v29 fill];
        uint64_t v15 = [(OADDrawable *)v6 shapeProperties];
        v16 = [v15 stroke];
        v17 = [(OADDrawable *)v6 geometry];
        v18 = [v17 adjustValues];
        +[CMShapeRenderer renderCanonicalShape:v7 fill:v14 stroke:v16 adjustValues:v18 orientedBounds:v32 state:v30 drawingContext:v33];

LABEL_10:
LABEL_11:

LABEL_12:
LABEL_13:
        BOOL v19 = objc_alloc_init(CMDrawableStyle);
        [(CMDrawingContext *)v33 pdfFrame];
        -[CMDrawableStyle addPositionUsingOffsets:](v19, "addPositionUsingOffsets:", v20 - self->mBox.origin.x, v21 - self->mBox.origin.y);
        v22 = +[OIXMLElement elementWithType:9];
        id v23 = [(CMDrawingContext *)v33 copyPDF];
        if (v23)
        {
          id v24 = [(CMDrawableMapper *)self saveResourceAndReturnPath:v23 withType:7];
          [(CMMapper *)self addAttribute:0x26EC19158 toNode:v22 value:v24];
        }
        v34.receiver = self;
        v34.super_class = (Class)CMDrawableMapper;
        [(CMMapper *)&v34 addStyleUsingGlobalCacheTo:v22 style:v19 embedStyle:1];
        [v31 addChild:v22];
      }
LABEL_16:

      return;
  }
}

- (void)calculateUncroppedBox:(id)a3
{
  id v22 = a3;
  if ([v22 isSourceRectOverridden])
  {
    uint64_t v4 = [v22 sourceRect];
    double v5 = v4;
    if (!v4
      || ([v4 left], v6 == 0.0)
      && ([v5 right], v7 == 0.0)
      && ([v5 top], v8 == 0.0)
      && ([v5 bottom], v9 == 0.0))
    {
      self->mIsCropped = 0;
    }
    else
    {
      self->mIsCropped = 1;
      p_mBodouble x = &self->mBox;
      double width = self->mBox.size.width;
      [v5 left];
      float v13 = v12;
      [v5 right];
      p_mUncroppedBodouble x = &self->mUncroppedBox;
      p_mUncroppedBox->size.double width = width / (float)((float)(1.0 - v13) - v14);
      double height = p_mBox->size.height;
      [v5 top];
      float v18 = v17;
      [v5 bottom];
      p_mUncroppedBox->size.double height = height / (float)((float)(1.0 - v18) - v19);
      [v5 left];
      p_mUncroppedBox->origin.double x = p_mUncroppedBox->size.width * (float)-v20;
      [v5 top];
      p_mUncroppedBox->origin.double y = p_mUncroppedBox->size.height * (float)-v21;
    }
  }
  else
  {
    self->mIsCropped = 0;
  }
}

- (BOOL)isCropped
{
  return self->mIsCropped;
}

- (CGRect)shapeTextBoxRect
{
  uint64_t v3 = [(OADDrawable *)self->mDrawable geometry];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [v3 equivalentCustomGeometry];
  }
  double v5 = v4;
  if ([v4 textBodyRectCount])
  {
    float v6 = [v5 textBodyRectAtIndex:0];
    if (v5)
    {
      [v5 geometryCoordSpace];
    }
    else
    {
      uint64_t v34 = 0;
      uint64_t v35 = 0;
    }
    double width = self->mBox.size.width;
    double height = self->mBox.size.height;
    +[CMShapeUtils mapAdjustCoord:geometry:](CMShapeUtils, "mapAdjustCoord:geometry:", objc_msgSend(v6, "left", v34, v35), v5);
    double v14 = v13;
    +[CMShapeUtils mapAdjustCoord:geometry:](CMShapeUtils, "mapAdjustCoord:geometry:", [v6 right], v5);
    double v16 = v15;
    +[CMShapeUtils mapAdjustCoord:geometry:](CMShapeUtils, "mapAdjustCoord:geometry:", [v6 top], v5);
    double v18 = v17;
    +[CMShapeUtils mapAdjustCoord:geometry:](CMShapeUtils, "mapAdjustCoord:geometry:", [v6 bottom], v5);
    float v19 = width / 21600.0;
    float v20 = height / 21600.0;
    float v21 = v14;
    float v22 = v16;
    float v23 = v18;
    float v25 = v24;
    float v26 = v19 * v21;
    float v27 = (float)(v22 - v21) * v19;
    if (v27 <= 0.0) {
      double v9 = self->mBox.size.width + v27;
    }
    else {
      double v9 = v27;
    }
    double v28 = v26;
    float v29 = (float)(v25 - v23) * v20;
    if (v29 <= 0.0) {
      double v10 = self->mBox.size.height + v29;
    }
    else {
      double v10 = v29;
    }
    double x = self->mBox.origin.x + v28;
    double y = self->mBox.origin.y + (float)(v20 * v23);
  }
  else
  {
    double x = self->mBox.origin.x;
    double y = self->mBox.origin.y;
    double v9 = self->mBox.size.width;
    double v10 = self->mBox.size.height;
  }

  double v30 = x;
  double v31 = y;
  double v32 = v9;
  double v33 = v10;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

- (CGRect)uncroppedBox
{
  double x = self->mUncroppedBox.origin.x;
  double y = self->mUncroppedBox.origin.y;
  double width = self->mUncroppedBox.size.width;
  double height = self->mUncroppedBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CMDrawableMapper)initWithParent:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CMDrawableMapper;
  uint64_t v3 = [(CMMapper *)&v12 initWithParent:a3];
  id v4 = v3;
  if (v3)
  {
    v3->mIsSupported = 0;
    v3->mIsCropped = 0;
    mImageBinaryData = v3->mImageBinaryData;
    v3->mImageBinaryData = 0;

    CGSize v6 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    v4->mBox.origin = (CGPoint)*MEMORY[0x263F001A8];
    v4->mBox.size = v6;
    mDrawable = v4->mDrawable;
    v4->mDrawable = 0;

    mStyle = v4->mStyle;
    v4->mStyle = 0;

    mSourcePath = v4->mSourcePath;
    v4->mSourcePath = 0;

    mOrientedBounds = v4->mOrientedBounds;
    v4->mOrientedBounds = 0;
  }
  return v4;
}

- (float)rotation
{
  return self->mRotation;
}

- (void)setRotation:(float)a3
{
  self->mRotation = a3;
}

- (void)mapDrawingContext:(id)a3 at:(id)a4 relative:(BOOL)a5 withState:(id)a6
{
  BOOL v6 = a5;
  id v9 = a3;
  id v10 = a4;
  v11 = (void *)[v9 copyPDF];
  if (v11)
  {
    objc_super v12 = +[OIXMLElement elementWithType:9];
    double v13 = objc_alloc_init(CMDrawableStyle);
    [v9 pdfFrame];
    if (v6)
    {
      double v14 = v14 - self->mBox.origin.x;
      double v15 = v15 - self->mBox.origin.y;
    }
    -[CMDrawableStyle addPositionUsingOffsets:](v13, "addPositionUsingOffsets:", v14, v15);
    double v16 = [(CMDrawableMapper *)self saveResourceAndReturnPath:v11 withType:7];
    [(CMMapper *)self addAttribute:0x26EC19158 toNode:v12 value:v16];
    v17.receiver = self;
    v17.super_class = (Class)CMDrawableMapper;
    [(CMMapper *)&v17 addStyleUsingGlobalCacheTo:v12 style:v13 embedStyle:1];
    [v10 addChild:v12];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOrientedBounds, 0);
  objc_storeStrong((id *)&self->mSourcePath, 0);
  objc_storeStrong((id *)&self->mExtension, 0);
  objc_storeStrong((id *)&self->mName, 0);
  objc_storeStrong((id *)&self->mImageBinaryData, 0);
  objc_storeStrong((id *)&self->mStyle, 0);
  objc_storeStrong((id *)&self->mDrawable, 0);
}

@end