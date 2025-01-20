@interface OAXTextBody
+ (id)stringWithTextAnchorType:(unsigned __int8)a3;
+ (id)stringWithTextBodyFlowType:(unsigned __int8)a3;
+ (id)stringWithTextBodyHorizontalOverflowType:(unsigned __int8)a3;
+ (id)stringWithTextBodyVerticalOverflowType:(unsigned __int8)a3;
+ (id)stringWithTextBodyWrapType:(unsigned __int8)a3;
+ (unsigned)readAnchorType:(id)a3;
+ (unsigned)readFlowType:(id)a3;
+ (unsigned)readHorizontalOverflowType:(id)a3;
+ (void)readFlowType:(id)a3 textBodyProperties:(id)a4;
+ (void)readHorizontalOverflowType:(id)a3 textBodyProperties:(id)a4;
+ (void)readTextBodyFromXmlNode:(_xmlNode *)a3 textBody:(id)a4 drawingState:(id)a5;
+ (void)readTextBodyProperties:(_xmlNode *)a3 textBodyProperties:(id)a4 drawingState:(id)a5;
+ (void)readVerticalOverflowType:(id)a3 textBodyProperties:(id)a4;
+ (void)readWrapType:(id)a3 textBodyProperties:(id)a4;
+ (void)writeTextBodyAutoFit:(id)a3 to:(id)a4;
@end

@implementation OAXTextBody

+ (void)readTextBodyProperties:(_xmlNode *)a3 textBodyProperties:(id)a4 drawingState:(id)a5
{
  id v7 = a4;
  uint64_t v45 = 0;
  BOOL v44 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"lIns", &v45, 12))
  {
    double v8 = (double)v45 / 12700.0;
    *(float *)&double v8 = v8;
    [v7 setLeftInset:v8];
  }
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"tIns", &v45, 12))
  {
    double v9 = (double)v45 / 12700.0;
    *(float *)&double v9 = v9;
    [v7 setTopInset:v9];
  }
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rIns", &v45, 12))
  {
    double v10 = (double)v45 / 12700.0;
    *(float *)&double v10 = v10;
    [v7 setRightInset:v10];
  }
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"bIns", &v45, 12))
  {
    double v11 = (double)v45 / 12700.0;
    *(float *)&double v11 = v11;
    [v7 setBottomInset:v11];
  }
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"numCol", &v45)) {
    [v7 setColumnCount:v45];
  }
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"spcCol", &v45))
  {
    double v12 = (double)v45 / 12700.0;
    *(float *)&double v12 = v12;
    [v7 setColumnSpacing:v12];
  }
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rtlCol", &v44)) {
    [v7 setIsLeftToRightColumns:v44];
  }
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"spcFirstLastPara", &v44)) {
    [v7 setRespectLastFirstLineSpacing:v44];
  }
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"anchorCtr", &v44)) {
    [v7 setIsAnchorCenter:v44];
  }
  id v43 = 0;
  BOOL v13 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"anchor", &v43);
  id v14 = v43;
  if (v13) {
    objc_msgSend(v7, "setTextAnchorType:", objc_msgSend(a1, "readAnchorType:", v14));
  }
  id v42 = 0;
  BOOL v15 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"vert", &v42);
  id v16 = v42;
  if (v15) {
    [a1 readFlowType:v16 textBodyProperties:v7];
  }
  +[OAXBaseTypes readOptionalAngleFromXmlNode:a3 name:"rot"];
  *(float *)&double v17 = v17;
  [v7 setRotation:v17];
  id v41 = 0;
  BOOL v18 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"wrap", &v41);
  id v19 = v41;
  if (v18) {
    [a1 readWrapType:v19 textBodyProperties:v7];
  }
  id v40 = 0;
  BOOL v20 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"vertOverflow", &v40);
  id v21 = v40;
  if (v20) {
    [a1 readVerticalOverflowType:v21 textBodyProperties:v7];
  }
  id v39 = 0;
  v36 = v19;
  BOOL v22 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"horzOverflow", &v39);
  id v23 = v39;
  if (v22) {
    [a1 readHorizontalOverflowType:v23 textBodyProperties:v7];
  }
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"upright", &v44)) {
    [v7 setIsUpright:v44];
  }
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (xmlStrEqual(i->name, (const xmlChar *)"noAutofit"))
    {
      v25 = [[OADTextBodyAutoFit alloc] initWithType:0];
      [v7 setAutoFit:v25];
LABEL_43:

      continue;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"normAutofit"))
    {
      double v38 = 0.0;
      BOOL v26 = CXOptionalFractionAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"fontScale", &v38);
      double v27 = v38 * 100.0;
      if (!v26) {
        double v27 = 100.0;
      }
      double v38 = v27;
      double v37 = 0.0;
      BOOL v28 = CXOptionalFractionAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"lnSpcReduction", &v37);
      double v29 = v37 * 100.0;
      if (!v28) {
        double v29 = 0.0;
      }
      double v37 = v29;
      v30 = [OADNormalTextBodyAutoFit alloc];
      HIDWORD(v32) = HIDWORD(v37);
      HIDWORD(v31) = HIDWORD(v38);
      *(float *)&double v31 = v38;
      *(float *)&double v32 = v37;
      v25 = [(OADNormalTextBodyAutoFit *)v30 initWithFontScalePercent:v31 lineSpacingReductionPercent:v32];
      [v7 setAutoFit:v25];
      goto LABEL_43;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"spAutoFit"))
    {
      v25 = [[OADTextBodyAutoFit alloc] initWithType:1];
      [v7 setAutoFit:v25];
      goto LABEL_43;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"prstTxWarp"))
    {
      CXDefaultStringAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"prst", 0);
      v33 = (OADTextBodyAutoFit *)objc_claimAutoreleasedReturnValue();
      v25 = v33;
      if (v33 && ([(OADTextBodyAutoFit *)v33 isEqualToString:@"textNoShape"] & 1) == 0)
      {
        id v35 = v14;
        v34 = objc_alloc_init(OADPresetTextWarp);
        [(OADPresetTextWarp *)v34 setPresetTextWarpType:29];
        [v7 setTextWarp:v34];

        id v14 = v35;
      }
      goto LABEL_43;
    }
  }
}

+ (unsigned)readAnchorType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"t"])
  {
    unsigned __int8 v4 = 0;
  }
  else if ([v3 isEqualToString:@"ctr"])
  {
    unsigned __int8 v4 = 1;
  }
  else if ([v3 isEqualToString:@"b"])
  {
    unsigned __int8 v4 = 2;
  }
  else if ([v3 isEqualToString:@"just"])
  {
    unsigned __int8 v4 = 3;
  }
  else if ([v3 isEqualToString:@"dist"])
  {
    unsigned __int8 v4 = 4;
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

+ (void)readWrapType:(id)a3 textBodyProperties:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if ([v7 isEqualToString:@"none"]) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = [v7 isEqualToString:@"square"];
  }
  [v5 setWrapType:v6];
}

+ (void)readTextBodyFromXmlNode:(_xmlNode *)a3 textBody:(id)a4 drawingState:(id)a5
{
  id v19 = a4;
  id v8 = a5;
  double v9 = [v8 OAXMainNamespace];
  uint64_t v10 = OCXFindChild(a3, v9, "bodyPr");

  if (!v10) {
    +[TCMessageException raise:OABadFormat];
  }
  double v11 = [v19 properties];
  [a1 readTextBodyProperties:v10 textBodyProperties:v11 drawingState:v8];

  double v12 = [v8 OAXMainNamespace];
  Child = (_xmlNode *)OCXFindChild(a3, v12, "p");

  while (Child)
  {
    id v14 = [v19 addParagraph];
    +[OAXParagraph readParagraph:Child paragraph:v14 drawingState:v8];

    BOOL v15 = [v8 OAXMainNamespace];
    Child = OCXFindNextChild(Child, v15, (xmlChar *)"p");
  }
  id v16 = [v8 OAXMainNamespace];
  uint64_t v17 = OCXFindChild(a3, v16, "lstStyle");

  if (v17 && *(void *)(v17 + 24))
  {
    BOOL v18 = [v19 overrideTextListStyle];
    +[OAXTextListStyle readNode:v17 textListStyle:v18 state:v8];
  }
}

+ (void)readFlowType:(id)a3 textBodyProperties:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  objc_msgSend(v6, "setFlowType:", objc_msgSend(a1, "readFlowType:", v7));
}

+ (unsigned)readFlowType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"horz"])
  {
    unsigned __int8 v4 = 0;
  }
  else if ([v3 isEqualToString:@"vert"])
  {
    unsigned __int8 v4 = 2;
  }
  else if ([v3 isEqualToString:@"vert270"])
  {
    unsigned __int8 v4 = 3;
  }
  else if ([v3 isEqualToString:@"wordArtVert"])
  {
    unsigned __int8 v4 = 4;
  }
  else if ([v3 isEqualToString:@"eaVert"])
  {
    unsigned __int8 v4 = 6;
  }
  else if ([v3 isEqualToString:@"mongolianVert"])
  {
    unsigned __int8 v4 = 7;
  }
  else if ([v3 isEqualToString:@"wordArtVertRtl"])
  {
    unsigned __int8 v4 = 5;
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

+ (unsigned)readHorizontalOverflowType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"overflow"]) {
    unsigned __int8 v4 = 0;
  }
  else {
    unsigned __int8 v4 = [v3 isEqualToString:@"clip"];
  }

  return v4;
}

+ (void)readVerticalOverflowType:(id)a3 textBodyProperties:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if ([v7 isEqualToString:@"overflow"])
  {
    uint64_t v6 = 0;
  }
  else if ([v7 isEqualToString:@"ellipsis"])
  {
    uint64_t v6 = 1;
  }
  else if ([v7 isEqualToString:@"clip"])
  {
    uint64_t v6 = 2;
  }
  else
  {
    uint64_t v6 = 0;
  }
  [v5 setVerticalOverflowType:v6];
}

+ (void)readHorizontalOverflowType:(id)a3 textBodyProperties:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  objc_msgSend(v6, "setHorizontalOverflowType:", objc_msgSend(a1, "readHorizontalOverflowType:", v7));
}

+ (id)stringWithTextBodyVerticalOverflowType:(unsigned __int8)a3
{
  id v3 = @"clip";
  if (a3 == 1) {
    id v3 = @"ellipsis";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"overflow";
  }
}

+ (id)stringWithTextBodyHorizontalOverflowType:(unsigned __int8)a3
{
  if (a3) {
    return @"clip";
  }
  else {
    return @"overflow";
  }
}

+ (id)stringWithTextBodyFlowType:(unsigned __int8)a3
{
  if (a3 > 7u) {
    return @"horz";
  }
  else {
    return off_264D62600[(char)a3];
  }
}

+ (id)stringWithTextBodyWrapType:(unsigned __int8)a3
{
  id v3 = &stru_26EBF24D8;
  if (a3 == 1) {
    id v3 = @"square";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"none";
  }
}

+ (id)stringWithTextAnchorType:(unsigned __int8)a3
{
  if (a3 > 4u) {
    return @"b";
  }
  else {
    return off_264D62640[(char)a3];
  }
}

+ (void)writeTextBodyAutoFit:(id)a3 to:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v11;
      [v5 startOAElement:@"normAutofit"];
      [v6 fontScalePercent];
      [v5 writeOAAttribute:@"fontScale" intContent:(uint64_t)(v7 * 100000.0 / 100.0)];
      [v6 lineSpacingReductionPercent];
      [v5 writeOAAttribute:@"lnSpcReduction" intContent:(uint64_t)(v8 * 100000.0 / 100.0)];
      [v5 endElement];

      goto LABEL_9;
    }
    int v9 = [v11 type];
    if (v9)
    {
      if (v9 != 1) {
        goto LABEL_9;
      }
      uint64_t v10 = @"spAutoFit";
    }
    else
    {
      uint64_t v10 = @"noAutofit";
    }
    [v5 startOAElement:v10];
    [v5 endElement];
  }
LABEL_9:
}

@end