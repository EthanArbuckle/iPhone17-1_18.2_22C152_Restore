@interface ODILinear
+ (BOOL)mapIdentifier:(id)a3 state:(id)a4;
+ (void)mapUnknownWithState:(id)a3;
- (ODILinear)initWithState:(id)a3;
- (void)map;
- (void)mapPoint:(id)a3 bounds:(CGRect)a4;
- (void)mapStyleFromPoint:(id)a3 shape:(id)a4;
- (void)mapStyleFromTransition:(id)a3 shape:(id)a4;
- (void)mapTransition:(id)a3 pointBounds:(CGRect)a4;
- (void)nextPointBounds:(CGRect *)a3;
- (void)setConnectorWidth:(float)a3;
- (void)setIsHorizontal:(BOOL)a3;
- (void)setIsTextCentered:(BOOL)a3;
- (void)setIsTextCenteredHorizontally:(BOOL)a3;
- (void)setIsTextCenteredVertically:(BOOL)a3;
- (void)setLogicalBounds;
- (void)setMaxPointCount:(unsigned int)a3;
- (void)setPadding:(float)a3;
- (void)setPointHeight:(float)a3;
- (void)setStretch:(BOOL)a3;
- (void)setWithConnectors:(BOOL)a3;
@end

@implementation ODILinear

+ (BOOL)mapIdentifier:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 hasPrefix:@"process"])
  {
    v8 = [v6 substringFromIndex:objc_msgSend(@"process", "length")];
    int v9 = [v8 intValue];

    switch(v9)
    {
      case 1:
      case 3:
        v10 = (ODIAccentedImageLinear *)[objc_alloc((Class)a1) initWithState:v7];
        [(ODILinear *)v10 setWithConnectors:1];
        LODWORD(v11) = 0.75;
        [(ODILinear *)v10 setPointHeight:v11];
        goto LABEL_45;
      case 2:
        v10 = (ODIAccentedImageLinear *)[objc_alloc((Class)a1) initWithState:v7];
        [(ODILinear *)v10 setIsHorizontal:0];
        [(ODILinear *)v10 setWithConnectors:1];
        LODWORD(v22) = 1057971241;
        [(ODILinear *)v10 setPointHeight:v22];
        LODWORD(v23) = 1025758986;
        [(ODILinear *)v10 setPadding:v23];
        goto LABEL_45;
      case 4:
        v10 = [(ODILinear *)[ODIVerticalProcess2 alloc] initWithState:v7];
        [(ODILinear *)v10 setIsHorizontal:0];
        [(ODILinear *)v10 setStretch:1];
        [(ODILinear *)v10 setWithConnectors:1];
        [(ODILinear *)v10 setPadding:0.0];
        LODWORD(v24) = 1031127695;
        [(ODILinear *)v10 setConnectorWidth:v24];
        goto LABEL_45;
      default:
        goto LABEL_69;
    }
  }
  if (![v6 hasPrefix:@"hProcess"])
  {
    if ([v6 hasPrefix:@"hList"])
    {
      v16 = [v6 substringFromIndex:objc_msgSend(@"hList", "length")];
      int v17 = [v16 intValue];

      switch(v17)
      {
        case 2:
          v10 = [[ODIImageLinear alloc] initWithImagePresentationName:@"image" state:v7];
          [(ODILinear *)v10 setStretch:1];
          [v7 setPresentationName:@"childNode" forPointType:2];
          break;
        case 6:
          v10 = (ODIAccentedImageLinear *)[objc_alloc((Class)a1) initWithState:v7];
          [(ODILinear *)v10 setStretch:1];
          LODWORD(v37) = 1031127695;
          [(ODILinear *)v10 setPadding:v37];
          break;
        case 7:
          v10 = [[ODIImageLinear alloc] initWithImagePresentationName:@"imagNode" state:v7];
          [(ODILinear *)v10 setStretch:1];
          LODWORD(v18) = 1025758986;
          [(ODILinear *)v10 setPadding:v18];
          [(ODILinear *)v10 setIsTextCentered:1];
          [v7 setPresentationName:@"bkgdShape" forPointType:2];
          break;
        default:
LABEL_69:
          BOOL v14 = 0;
          v10 = 0;
          goto LABEL_70;
      }
    }
    else
    {
      if ([v6 hasPrefix:@"vList"])
      {
        v19 = [v6 substringFromIndex:objc_msgSend(@"vList", "length")];
        int v20 = [v19 intValue];

        switch(v20)
        {
          case 2:
          case 5:
          case 6:
            v10 = (ODIAccentedImageLinear *)[objc_alloc((Class)a1) initWithState:v7];
            [(ODILinear *)v10 setIsHorizontal:0];
            [(ODILinear *)v10 setStretch:1];
            LODWORD(v21) = 1017370378;
            [(ODILinear *)v10 setPadding:v21];
            goto LABEL_45;
          case 3:
            v10 = [[ODIImageLinear alloc] initWithImagePresentationName:@"imgShp" state:v7];
            [(ODILinear *)v10 setIsHorizontal:0];
            [(ODILinear *)v10 setStretch:1];
            LODWORD(v39) = 1017370378;
            [(ODILinear *)v10 setPadding:v39];
            [v7 setPresentationName:@"txShp" forPointType:2];
            goto LABEL_45;
          case 4:
            v10 = [[ODIImageLinear alloc] initWithImagePresentationName:@"img" state:v7];
            [(ODILinear *)v10 setIsHorizontal:0];
            [(ODILinear *)v10 setStretch:1];
            LODWORD(v40) = 1017370378;
            [(ODILinear *)v10 setPadding:v40];
            [v7 setPresentationName:@"box" forPointType:2];
            goto LABEL_45;
          case 7:
            v10 = [[ODIImageLinear alloc] initWithImagePresentationName:@"rect1" state:v7];
            [(ODILinear *)v10 setIsHorizontal:0];
            [(ODILinear *)v10 setStretch:1];
            LODWORD(v41) = 1017370378;
            [(ODILinear *)v10 setPadding:v41];
            [v7 setPresentationName:@"rect2" forPointType:2];
            goto LABEL_45;
          case 8:
            v10 = [[ODIImageLinear alloc] initWithImagePresentationName:@"horz1" state:v7];
            [(ODILinear *)v10 setIsHorizontal:0];
            [(ODILinear *)v10 setStretch:1];
            LODWORD(v42) = 1017370378;
            [(ODILinear *)v10 setPadding:v42];
            [v7 setPresentationName:@"tx1" forPointType:2];
            goto LABEL_45;
          case 9:
            v10 = [(ODIImageLinear *)[ODIAccentedImageLinear alloc] initWithImagePresentationName:@"desPictures" state:v7];
            [(ODILinear *)v10 setIsHorizontal:0];
            [(ODILinear *)v10 setStretch:1];
            LODWORD(v43) = 1017370378;
            [(ODILinear *)v10 setPadding:v43];
            [v7 setPresentationName:@"desText" forPointType:2];
            goto LABEL_45;
          default:
            goto LABEL_69;
        }
      }
      if ([v6 hasPrefix:@"pList"])
      {
        v25 = [v6 substringFromIndex:objc_msgSend(@"pList", "length")];
        int v26 = [v25 intValue];

        if (v26 == 1)
        {
          v10 = [[ODIImageLinear alloc] initWithImagePresentationName:@"pictRect" state:v7];
          LODWORD(v38) = 2.0;
          [(ODILinear *)v10 setPointHeight:v38];
          [v7 setPresentationName:@"pictRect" forPointType:2];
        }
        else
        {
          if (v26 != 2) {
            goto LABEL_69;
          }
          v10 = [[ODIImageLinear alloc] initWithImagePresentationName:@"imagNode" state:v7];
          [(ODILinear *)v10 setStretch:1];
          LODWORD(v27) = 1017370378;
          [(ODILinear *)v10 setPadding:v27];
        }
      }
      else if ([v6 hasPrefix:@"lProcess"])
      {
        v30 = [v6 substringFromIndex:objc_msgSend(@"lProcess", "length")];
        int v31 = [v30 intValue];

        switch(v31)
        {
          case 1:
            v10 = (ODIAccentedImageLinear *)[objc_alloc((Class)a1) initWithState:v7];
            [v7 setPresentationName:@"header" forPointType:2];
            break;
          case 2:
            v10 = (ODIAccentedImageLinear *)[objc_alloc((Class)a1) initWithState:v7];
            [(ODILinear *)v10 setStretch:1];
            LODWORD(v44) = 1025758986;
            [(ODILinear *)v10 setPadding:v44];
            [v7 setPresentationName:@"textNode" forPointType:2];
            break;
          case 3:
            v10 = (ODIAccentedImageLinear *)[objc_alloc((Class)a1) initWithState:v7];
            [(ODILinear *)v10 setIsHorizontal:0];
            LODWORD(v32) = 0.5;
            [(ODILinear *)v10 setPointHeight:v32];
            LODWORD(v33) = 1025758986;
            [(ODILinear *)v10 setPadding:v33];
            [v7 setPresentationName:@"bigChev" forPointType:2];
            break;
          default:
            goto LABEL_69;
        }
      }
      else if ([v6 isEqualToString:@"arrow2"])
      {
        v10 = [(ODILinear *)[ODIArrow2 alloc] initWithState:v7];
        [(ODILinear *)v10 setWithConnectors:1];
      }
      else if (([v6 isEqualToString:@"equation1"] & 1) != 0 {
             || [v6 isEqualToString:@"equation2"])
      }
      {
LABEL_37:
        v10 = (ODIAccentedImageLinear *)[objc_alloc((Class)a1) initWithState:v7];
        [(ODILinear *)v10 setWithConnectors:1];
      }
      else if ([v6 isEqualToString:@"funnel1"])
      {
        v10 = (ODIAccentedImageLinear *)[objc_alloc((Class)a1) initWithState:v7];
        [(ODILinear *)v10 setIsHorizontal:0];
        [(ODILinear *)v10 setWithConnectors:1];
        [(ODILinear *)v10 setMaxPointCount:4];
      }
      else if (([v6 isEqualToString:@"hChevron1"] & 1) != 0 {
             || [v6 isEqualToString:@"hChevron3"])
      }
      {
        v10 = (ODIAccentedImageLinear *)[objc_alloc((Class)a1) initWithState:v7];
        [(ODILinear *)v10 setWithConnectors:1];
        [(ODILinear *)v10 setMaxPointCount:4];
      }
      else if ([v6 isEqualToString:@"target1"])
      {
        v10 = [(ODILinear *)[ODITarget1 alloc] initWithState:v7];
        [(ODILinear *)v10 setMaxPointCount:5];
      }
      else if ([v6 isEqualToString:@"target2"])
      {
        v10 = [(ODILinear *)[ODITarget2 alloc] initWithState:v7];
        [(ODILinear *)v10 setMaxPointCount:3];
        [(ODILinear *)v10 setStretch:1];
        [(ODILinear *)v10 setIsTextCentered:0];
      }
      else if ([v6 isEqualToString:@"target3"])
      {
        v10 = [(ODILinear *)[ODITarget3 alloc] initWithState:v7];
        [(ODILinear *)v10 setStretch:1];
        [(ODILinear *)v10 setIsHorizontal:0];
        [(ODILinear *)v10 setPadding:0.0];
      }
      else if ([v6 isEqualToString:@"venn2"])
      {
        v10 = [(ODILinear *)[ODIVenn2 alloc] initWithState:v7];
        [(ODILinear *)v10 setStretch:1];
        [(ODILinear *)v10 setIsHorizontal:0];
        [(ODILinear *)v10 setPadding:0.0];
        [(ODILinear *)v10 setMaxPointCount:7];
      }
      else if ([v6 isEqualToString:@"chevron2"])
      {
        v10 = (ODIAccentedImageLinear *)[objc_alloc((Class)a1) initWithState:v7];
        [(ODILinear *)v10 setStretch:1];
        [(ODILinear *)v10 setIsHorizontal:0];
        LODWORD(v45) = 1031127695;
        [(ODILinear *)v10 setPadding:v45];
        [v7 setPresentationName:@"parentText" forPointType:2];
      }
      else if ([v6 isEqualToString:@"list1"])
      {
        v10 = [(ODILinear *)[ODIList1 alloc] initWithState:v7];
        [(ODILinear *)v10 setStretch:1];
        [(ODILinear *)v10 setIsHorizontal:0];
        [(ODILinear *)v10 setIsTextCenteredHorizontally:0];
        [(ODILinear *)v10 setIsTextCenteredVertically:1];
        LODWORD(v46) = 1017370378;
        [(ODILinear *)v10 setPadding:v46];
        [v7 setPresentationName:@"parentText" forPointType:2];
      }
      else if ([v6 isEqualToString:@"balance1"])
      {
        v10 = [[ODILinear alloc] initWithState:v7];
        [(ODILinear *)v10 setIsHorizontal:0];
        [(ODILinear *)v10 setWithConnectors:0];
        LODWORD(v47) = 1057971241;
        [(ODILinear *)v10 setPointHeight:v47];
        LODWORD(v48) = 1025758986;
        [(ODILinear *)v10 setPadding:v48];
      }
      else
      {
        if (![v6 isEqualToString:@"vProcess5"]) {
          goto LABEL_69;
        }
        v10 = [[ODILinear alloc] initWithState:v7];
        [(ODILinear *)v10 setIsHorizontal:0];
        [(ODILinear *)v10 setWithConnectors:1];
        LODWORD(v49) = 1057971241;
        [(ODILinear *)v10 setPointHeight:v49];
        LODWORD(v50) = 1025758986;
        [(ODILinear *)v10 setPadding:v50];
      }
    }
LABEL_45:
    if (v10)
    {
      [(ODILinear *)v10 map];
      BOOL v14 = 1;
    }
    else
    {
      BOOL v14 = 0;
    }
    goto LABEL_70;
  }
  v12 = [v6 substringFromIndex:objc_msgSend(@"hProcess", "length")];
  int v13 = [v12 intValue];

  v10 = 0;
  BOOL v14 = 0;
  switch(v13)
  {
    case 3:
      v10 = [(ODILinear *)[ODIHorizontalProcess3 alloc] initWithState:v7];
      LODWORD(v15) = 1066611507;
      [(ODILinear *)v10 setPointHeight:v15];
      [(ODILinear *)v10 setWithConnectors:1];
      goto LABEL_45;
    case 4:
    case 9:
      v10 = (ODIAccentedImageLinear *)[objc_alloc((Class)a1) initWithState:v7];
      LODWORD(v28) = 1.0;
      [(ODILinear *)v10 setPointHeight:v28];
      [(ODILinear *)v10 setWithConnectors:1];
      goto LABEL_45;
    case 6:
      goto LABEL_37;
    case 7:
      v10 = (ODIAccentedImageLinear *)[objc_alloc((Class)a1) initWithState:v7];
      LODWORD(v34) = 1067114824;
      [(ODILinear *)v10 setPointHeight:v34];
      LODWORD(v35) = 1025758986;
      [(ODILinear *)v10 setPadding:v35];
      goto LABEL_45;
    case 10:
      v10 = [[ODIImageLinear alloc] initWithImagePresentationName:@"imagSh" state:v7];
      [(ODILinear *)v10 setWithConnectors:1];
      LODWORD(v29) = 2.0;
      [(ODILinear *)v10 setPointHeight:v29];
      [(ODILinear *)v10 setIsTextCentered:1];
      goto LABEL_45;
    case 11:
      v10 = [(ODILinear *)[ODIHorizontalProcess11 alloc] initWithState:v7];
      LODWORD(v36) = 1066611507;
      [(ODILinear *)v10 setPointHeight:v36];
      [(ODILinear *)v10 setWithConnectors:1];
      goto LABEL_45;
    default:
      break;
  }
LABEL_70:

  return v14;
}

+ (void)mapUnknownWithState:(id)a3
{
}

- (void).cxx_destruct
{
}

- (ODILinear)initWithState:(id)a3
{
  id v5 = a3;
  id v6 = [(ODILinear *)self init];
  id v7 = v6;
  if (v6)
  {
    *(_WORD *)&v6->mIsHorizontal = 1;
    v6->mStretch = 0;
    *(void *)&v6->mPointHeight = 0x3E6147AE3F800000;
    v6->mPadding = 0.11;
    objc_storeStrong((id *)&v6->mState, a3);
    v7->mMaxPointCount = -1;
    *(_WORD *)&v7->mIsTextCenteredHorizontally = 257;
  }

  return v7;
}

- (void)setIsHorizontal:(BOOL)a3
{
  self->mIsHorizontal = a3;
}

- (void)setWithConnectors:(BOOL)a3
{
  self->mWithConnectors = a3;
}

- (void)setStretch:(BOOL)a3
{
  self->mStretch = a3;
}

- (void)setPointHeight:(float)a3
{
  self->mPointHeight = a3;
}

- (void)setConnectorWidth:(float)a3
{
  self->mConnectorWidth = a3;
}

- (void)setPadding:(float)a3
{
  self->mPadding = a3;
}

- (void)setIsTextCentered:(BOOL)a3
{
  self->mIsTextCenteredHorizontally = a3;
  self->mIsTextCenteredVertically = a3;
}

- (void)setIsTextCenteredHorizontally:(BOOL)a3
{
  self->mIsTextCenteredHorizontally = a3;
}

- (void)setIsTextCenteredVertically:(BOOL)a3
{
  self->mIsTextCenteredVertically = a3;
}

- (void)setMaxPointCount:(unsigned int)a3
{
  self->mMaxPointCount = a3;
}

- (void)map
{
  v3 = [(ODIState *)self->mState diagram];
  v4 = [v3 documentPoint];
  id v5 = [v4 children];

  unsigned int v6 = [v5 count];
  unsigned int mMaxPointCount = self->mMaxPointCount;
  if (mMaxPointCount >= v6) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = mMaxPointCount;
  }
  [(ODIState *)self->mState setPointCount:v8];
  [(ODILinear *)self setLogicalBounds];
  double mPointHeight = self->mPointHeight;
  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = 1.0;
  double v16 = mPointHeight;
  if (v8)
  {
    for (unint64_t i = 0; i != v8; ++i)
    {
      double v11 = objc_msgSend(v5, "objectAtIndex:", i, *(void *)&v13, *(void *)&v14, *(void *)&v15, *(void *)&v16);
      [(ODIState *)self->mState setPointIndex:i];
      -[ODILinear mapPoint:bounds:](self, "mapPoint:bounds:", v11, v13, v14, v15, v16);
      if (i < (v8 - 1) && self->mWithConnectors)
      {
        v12 = [v11 siblingTransition];
        -[ODILinear mapTransition:pointBounds:](self, "mapTransition:pointBounds:", v12, v13, v14, v15, v16);
      }
      [(ODILinear *)self nextPointBounds:&v13];
    }
  }
}

- (void)setLogicalBounds
{
  id v15 = [(ODIState *)self->mState diagram];
  float v3 = (float)[(ODIState *)self->mState pointCount];
  if (self->mWithConnectors) {
    float mPadding = self->mConnectorWidth + (float)(self->mPadding * 2.0);
  }
  else {
    float mPadding = self->mPadding;
  }
  double v5 = *MEMORY[0x263F00148];
  double v6 = *(double *)(MEMORY[0x263F00148] + 8);
  float v7 = (float)(v3 + -1.0) * mPadding;
  if (self->mIsHorizontal)
  {
    double v8 = (float)(v7 + v3);
    if (self->mStretch)
    {
      +[ODIDrawable sizeOfDiagram:v15];
      float mPointHeight = v9 * v8 / v10;
      self->float mPointHeight = mPointHeight;
    }
    else
    {
      float mPointHeight = self->mPointHeight;
    }
  }
  else
  {
    if (self->mStretch)
    {
      +[ODIDrawable sizeOfDiagram:v15];
      float v14 = (v13 / v12 - v7) / v3;
      self->float mPointHeight = v14;
    }
    else
    {
      float v14 = self->mPointHeight;
    }
    float mPointHeight = v7 + (float)(v3 * v14);
    double v8 = 1.0;
  }
  -[ODIState setLogicalBounds:](self->mState, "setLogicalBounds:", v5, v6, v8, mPointHeight);
}

- (void)nextPointBounds:(CGRect *)a3
{
  if (self->mWithConnectors) {
    float mPadding = self->mConnectorWidth + (float)(self->mPadding * 2.0);
  }
  else {
    float mPadding = self->mPadding;
  }
  if (self->mIsHorizontal)
  {
    double v4 = (float)(mPadding + 1.0);
  }
  else
  {
    double v4 = a3->size.height + mPadding;
    a3 = (CGRect *)((char *)a3 + 8);
  }
  a3->origin.x = a3->origin.x + v4;
}

- (void)mapPoint:(id)a3 bounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v12 = a3;
  LODWORD(v9) = 1033476506;
  double v10 = +[ODIDrawable shapeGeometryForRoundedRectangleWithRadius:v9];
  double v11 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v10, self->mState, x, y, width, height, 0.0);
  [(ODILinear *)self mapStyleFromPoint:v12 shape:v11];
  +[ODIText mapTextFromPoint:v12 toShape:v11 isCenteredHorizontally:self->mIsTextCenteredHorizontally isCenteredVertically:self->mIsTextCenteredVertically includeChildren:1 state:self->mState];
}

- (void)mapStyleFromPoint:(id)a3 shape:(id)a4
{
}

- (void)mapTransition:(id)a3 pointBounds:(CGRect)a4
{
  double height = a4.size.height;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v8 = a3;
  float mConnectorWidth = self->mConnectorWidth;
  double v10 = mConnectorWidth;
  id v16 = v8;
  if (self->mIsHorizontal)
  {
    double v11 = x + 1.0 + self->mPadding;
    double v12 = y + (height - v10) * 0.5;
  }
  else
  {
    double v11 = x + (float)((float)(1.0 - mConnectorWidth) * 0.5);
    double v12 = y + height + self->mPadding;
  }
  double v13 = +[ODIDrawable shapeGeometryForRightArrowWithControlPoint:](ODIDrawable, "shapeGeometryForRightArrowWithControlPoint:", 0.5, 0.180000007);
  if (self->mIsHorizontal) {
    *(float *)&double v14 = 0.0;
  }
  else {
    *(float *)&double v14 = -270.0;
  }
  id v15 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v13, self->mState, v11, v12, v10, v10, v14);
  [(ODILinear *)self mapStyleFromTransition:v16 shape:v15];
}

- (void)mapStyleFromTransition:(id)a3 shape:(id)a4
{
}

@end