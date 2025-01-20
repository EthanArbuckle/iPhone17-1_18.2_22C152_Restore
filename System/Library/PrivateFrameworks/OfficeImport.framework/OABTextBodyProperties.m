@interface OABTextBodyProperties
+ (void)readTextBodyProperties:(id)a3 textBox:(const EshTextBox *)a4 useDefaults:(BOOL)a5 state:(id)a6;
+ (void)setAutoFit:(BOOL)a3 textBodyProperties:(id)a4;
+ (void)setIsAnchorCenter:(int)a3 textBodyProperties:(id)a4;
+ (void)setTextAnchor:(int)a3 textBodyProperties:(id)a4;
+ (void)setTextDirection:(int)a3 textBodyProperties:(id)a4;
+ (void)setTextFlow:(int)a3 textBodyProperties:(id)a4;
+ (void)setTextRotation:(int)a3 textBodyProperties:(id)a4;
+ (void)setWrap:(int)a3 textBodyProperties:(id)a4;
+ (void)writeTextBodyProperties:(id)a3 toShapeBase:(void *)a4 state:(id)a5;
@end

@implementation OABTextBodyProperties

+ (void)readTextBodyProperties:(id)a3 textBox:(const EshTextBox *)a4 useDefaults:(BOOL)a5 state:(id)a6
{
  BOOL v7 = a5;
  id v45 = a3;
  id v10 = a6;
  int v11 = objc_msgSend((id)objc_msgSend(v10, "client"), "escherIsFullySupported");
  [v45 setIsUpright:v11 ^ 1u];
  isInsetLeftSet = (EshTextBox *)EshTextBox::isInsetLeftSet((EshTextBox *)a4);
  if (isInsetLeftSet)
  {
    int InsetLeft = EshTextBox::getInsetLeft((EshTextBox *)a4);
  }
  else
  {
    if (!v7) {
      goto LABEL_6;
    }
    int InsetLeft = EshTextBox::getDefaultInsetLeft(isInsetLeftSet);
  }
  double v14 = (double)InsetLeft / 12700.0;
  *(float *)&double v14 = v14;
  [v45 setLeftInset:v14];
LABEL_6:
  isInsetRightSet = (EshTextBox *)EshTextBox::isInsetRightSet((EshTextBox *)a4);
  if (isInsetRightSet)
  {
    int InsetRight = EshTextBox::getInsetRight((EshTextBox *)a4);
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    int InsetRight = EshTextBox::getDefaultInsetLeft(isInsetRightSet);
  }
  double v17 = (double)InsetRight / 12700.0;
  *(float *)&double v17 = v17;
  [v45 setRightInset:v17];
LABEL_11:
  isInsetTopSet = (EshTextBox *)EshTextBox::isInsetTopSet((EshTextBox *)a4);
  if (isInsetTopSet)
  {
    int InsetTop = EshTextBox::getInsetTop((EshTextBox *)a4);
  }
  else
  {
    if (!v7) {
      goto LABEL_16;
    }
    int InsetTop = EshTextBox::getDefaultInsetTop(isInsetTopSet);
  }
  double v20 = (double)InsetTop / 12700.0;
  *(float *)&double v20 = v20;
  [v45 setTopInset:v20];
LABEL_16:
  isInsetBottomSet = (EshTextBox *)EshTextBox::isInsetBottomSet((EshTextBox *)a4);
  if (isInsetBottomSet)
  {
    int InsetBottom = EshTextBox::getInsetBottom((EshTextBox *)a4);
  }
  else
  {
    if (!v7) {
      goto LABEL_21;
    }
    int InsetBottom = EshTextBox::getDefaultInsetTop(isInsetBottomSet);
  }
  double v23 = (double)InsetBottom / 12700.0;
  *(float *)&double v23 = v23;
  [v45 setBottomInset:v23];
LABEL_21:
  isColumnCountSet = (EshContentProperties *)EshTextBox::isColumnCountSet((EshTextBox *)a4);
  if (isColumnCountSet)
  {
    uint64_t ColumnCount = EshTextBox::getColumnCount((EshTextBox *)a4);
  }
  else
  {
    if (!v7) {
      goto LABEL_26;
    }
    uint64_t ColumnCount = EshContentProperties::getDefaultAllowOverlap(isColumnCountSet);
  }
  [v45 setColumnCount:ColumnCount];
LABEL_26:
  isColumnMarginSet = (EshTextBox *)EshTextBox::isColumnMarginSet((EshTextBox *)a4);
  if (isColumnMarginSet)
  {
    int ColumnMargin = EshTextBox::getColumnMargin((EshTextBox *)a4);
  }
  else
  {
    if (!v7) {
      goto LABEL_31;
    }
    int ColumnMargin = EshTextBox::getDefaultInsetLeft(isColumnMarginSet);
  }
  double v28 = (double)ColumnMargin / 12700.0;
  *(float *)&double v28 = v28;
  [v45 setColumnSpacing:v28];
LABEL_31:
  isRotateSet = (EshContentProperties *)EshTextBox::isRotateSet((EshTextBox *)a4);
  if (!isRotateSet)
  {
    if (!v7) {
      goto LABEL_40;
    }
    if (v11)
    {
      uint64_t DefaultPositionHorizontal = EshContentProperties::getDefaultPositionHorizontal(isRotateSet);
      goto LABEL_37;
    }
LABEL_38:
    uint64_t v31 = 0;
    goto LABEL_39;
  }
  if (!v11) {
    goto LABEL_38;
  }
  uint64_t DefaultPositionHorizontal = EshTextBox::getRotate((EshTextBox *)a4);
LABEL_37:
  uint64_t v31 = DefaultPositionHorizontal;
LABEL_39:
  [a1 setTextRotation:v31 textBodyProperties:v45];
LABEL_40:
  isFlowSet = (EshContentProperties *)EshTextBox::isFlowSet((EshTextBox *)a4);
  if (isFlowSet) {
    uint64_t Flow = EshTextBox::getFlow((EshTextBox *)a4);
  }
  else {
    uint64_t Flow = EshContentProperties::getDefaultPositionHorizontal(isFlowSet);
  }
  [a1 setTextFlow:Flow textBodyProperties:v45];
  isDirectionSet = (EshContentProperties *)EshTextBox::isDirectionSet((EshTextBox *)a4);
  if (isDirectionSet)
  {
    uint64_t Direction = EshTextBox::getDirection((EshTextBox *)a4);
  }
  else
  {
    if (!v7) {
      goto LABEL_48;
    }
    uint64_t Direction = EshContentProperties::getDefaultPositionHorizontal(isDirectionSet);
  }
  [a1 setTextDirection:Direction textBodyProperties:v45];
LABEL_48:
  isFitShapeToTextSet = (EshContentProperties *)EshTextBox::isFitShapeToTextSet((EshTextBox *)a4);
  if (isFitShapeToTextSet)
  {
    uint64_t FitShapeToText = EshTextBox::getFitShapeToText((EshTextBox *)a4);
  }
  else
  {
    if (!v7) {
      goto LABEL_53;
    }
    uint64_t FitShapeToText = EshContentProperties::getDefaultPositionHorizontal(isFitShapeToTextSet);
  }
  [a1 setAutoFit:FitShapeToText textBodyProperties:v45];
LABEL_53:
  isWrapStyleSet = (EshContentProperties *)EshTextBox::isWrapStyleSet((EshTextBox *)a4);
  if (!isWrapStyleSet)
  {
    if (!v7) {
      goto LABEL_62;
    }
    if (v11)
    {
      uint64_t WrapStyle = EshContentProperties::getDefaultPositionHorizontal(isWrapStyleSet);
      goto LABEL_59;
    }
LABEL_60:
    uint64_t v40 = 0;
    goto LABEL_61;
  }
  if (!v11) {
    goto LABEL_60;
  }
  uint64_t WrapStyle = EshTextBox::getWrapStyle((EshTextBox *)a4);
LABEL_59:
  uint64_t v40 = WrapStyle;
LABEL_61:
  [a1 setWrap:v40 textBodyProperties:v45];
LABEL_62:
  if (v11)
  {
    [v45 setHorizontalOverflowType:0];
    uint64_t v41 = 0;
  }
  else
  {
    [v45 setHorizontalOverflowType:1];
    uint64_t v41 = 2;
  }
  [v45 setVerticalOverflowType:v41];
  if ((EshTextBox::isAnchorSet((EshTextBox *)a4) | v7) == 1)
  {
    if (v11)
    {
      isAnchorSet = (EshContentProperties *)EshTextBox::isAnchorSet((EshTextBox *)a4);
      if (isAnchorSet) {
        uint64_t Anchor = EshTextBox::getAnchor((EshTextBox *)a4);
      }
      else {
        uint64_t Anchor = EshContentProperties::getDefaultPositionHorizontal(isAnchorSet);
      }
      uint64_t v44 = Anchor;
    }
    else
    {
      uint64_t v44 = 0;
    }
    [a1 setTextAnchor:v44 textBodyProperties:v45];
    [a1 setIsAnchorCenter:v44 textBodyProperties:v45];
  }
}

+ (void)setTextRotation:(int)a3 textBodyProperties:(id)a4
{
  id v5 = a4;
  double v6 = 0.0;
  if ((a3 - 1) <= 2) {
    LODWORD(v6) = dword_238EDC294[a3 - 1];
  }
  id v7 = v5;
  [v5 setRotation:v6];
}

+ (void)setTextFlow:(int)a3 textBodyProperties:(id)a4
{
  id v5 = a4;
  unint64_t v6 = 0x40102030600uLL >> (8 * a3);
  if (a3 >= 6) {
    LOBYTE(v6) = 0;
  }
  id v7 = v5;
  [v5 setFlowType:v6 & 7];
}

+ (void)setTextDirection:(int)a3 textBodyProperties:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  [v6 setIsLeftToRightColumns:v5];
LABEL_6:
}

+ (void)setAutoFit:(BOOL)a3 textBodyProperties:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v5 = [[OADTextBodyAutoFit alloc] initWithType:v4];
  [v6 setAutoFit:v5];
}

+ (void)setWrap:(int)a3 textBodyProperties:(id)a4
{
}

+ (void)setTextAnchor:(int)a3 textBodyProperties:(id)a4
{
  id v5 = a4;
  if ((a3 - 1) > 8) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = byte_238EDC2A0[a3 - 1];
  }
  id v7 = v5;
  [v5 setTextAnchorType:v6];
}

+ (void)setIsAnchorCenter:(int)a3 textBodyProperties:(id)a4
{
  id v5 = a4;
  [v5 setIsAnchorCenter:(a3 < 0xA) & (0x338u >> a3)];
}

+ (void)writeTextBodyProperties:(id)a3 toShapeBase:(void *)a4 state:(id)a5
{
  id v33 = a3;
  [v33 leftInset];
  uint64_t v6 = (EshTextBox *)((char *)a4 + 272);
  objc_msgSend(v33, "topInset", EshTextBox::setInsetLeft(v6, (int)(float)(v7 * 12700.0)));
  objc_msgSend(v33, "rightInset", EshTextBox::setInsetTop(v6, (int)(float)(v8 * 12700.0)));
  objc_msgSend(v33, "bottomInset", EshTextBox::setInsetRight(v6, (int)(float)(v9 * 12700.0)));
  unsigned int v11 = objc_msgSend(v33, "columnCount", EshTextBox::setInsetBottom(v6, (int)(float)(v10 * 12700.0)));
  objc_msgSend(v33, "columnSpacing", EshTextBox::setColumnCount(v6, v11));
  int v13 = objc_msgSend(v33, "isAnchorCenter", EshTextBox::setColumnMargin(v6, (int)(float)(v12 * 12700.0)));
  int v14 = [v33 textAnchorType];
  if (v14)
  {
    if (v14 == 1)
    {
      if (v13) {
        unsigned int v15 = 4;
      }
      else {
        unsigned int v15 = 1;
      }
    }
    else if (v14 == 2)
    {
      if (v13) {
        unsigned int v15 = 5;
      }
      else {
        unsigned int v15 = 2;
      }
    }
    else
    {
      unsigned int v15 = 0;
    }
  }
  else if (v13)
  {
    unsigned int v15 = 3;
  }
  else
  {
    unsigned int v15 = 0;
  }
  BOOL v16 = objc_msgSend(v33, "wrapType", EshTextBox::setAnchor((uint64_t)v6, v15)) != 1;
  int v17 = objc_msgSend(v33, "isLeftToRightColumns", EshTextBox::setWrapStyle((uint64_t)v6, 2 * v16));
  v18 = objc_msgSend(v33, "autoFit", EshTextBox::setDirection((uint64_t)v6, v17 ^ 1u));
  int v19 = [v18 type];

  if (v19 == 2)
  {
    EshTextBox::setFitShapeToText(v6, 0);
    unsigned __int8 v22 = 1;
  }
  else
  {
    if (v19 == 1)
    {
      unsigned __int8 v21 = 1;
    }
    else
    {
      if (v19) {
        goto LABEL_22;
      }
      unsigned __int8 v21 = 0;
    }
    EshTextBox::setFitShapeToText(v6, v21);
    unsigned __int8 v22 = 0;
  }
  double v20 = EshTextBox::setFitTextToShape(v6, v22);
LABEL_22:
  objc_msgSend(v33, "rotation", v20);
  double v24 = (double)(int)llroundf(v23) / 360.0;
  unint64_t v25 = llround((v24 - floor(v24)) * 4.0);
  int v26 = v25 & 3;
  uint64_t v28 = -(uint64_t)v25;
  BOOL v27 = v28 < 0;
  uint64_t v29 = v28 & 3;
  if (v27) {
    LODWORD(v30) = v26;
  }
  else {
    uint64_t v30 = -v29;
  }
  unsigned int v31 = objc_msgSend(v33, "flowType", EshTextBox::setRotate((uint64_t)v6, v30)) - 1;
  if (v31 >= 7) {
    unsigned int v32 = 0;
  }
  else {
    unsigned int v32 = dword_238EDC2AC[(char)v31];
  }
  EshTextBox::setFlow((uint64_t)v6, v32);
}

@end