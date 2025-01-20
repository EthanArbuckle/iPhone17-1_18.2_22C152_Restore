@interface OAXTable
+ (id)readCellBorderStyle:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)readCellPropertiesFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)readCellStyle:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)readDefaultTableStyleWithDrawingState:(id)a3;
+ (id)readFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)readPartStyle:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)readTableStyle:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)readTextStyle:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)readThemableEffectsFromParent:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)readThemableFillFromParent:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)readThemableStrokeFromParent:(_xmlNode *)a3 drawingState:(id)a4;
+ (int)readOnOffFlag:(id)a3;
+ (void)cacheTableStylesInPart:(id)a3 cache:(id)a4 drawingState:(id)a5;
+ (void)readCellFromXmlNode:(_xmlNode *)a3 toCell:(id)a4 drawingState:(id)a5;
+ (void)readGridFromXmlNode:(_xmlNode *)a3 toGrid:(id)a4 drawingState:(id)a5;
+ (void)readPropertiesFromXmlNode:(_xmlNode *)a3 toProperties:(id)a4 drawingState:(id)a5;
+ (void)readRowFromXmlNode:(_xmlNode *)a3 toRow:(id)a4 drawingState:(id)a5;
+ (void)readRowsFromTableXmlNode:(_xmlNode *)a3 toTable:(id)a4 drawingState:(id)a5;
@end

@implementation OAXTable

+ (id)readDefaultTableStyleWithDrawingState:(id)a3
{
  id v4 = a3;
  v5 = [v4 tableStyleCache];
  v6 = objc_msgSend(a1, "readTableStyle:drawingState:", objc_msgSend(v5, "defaultStyleNode"), v4);

  return v6;
}

+ (id)readTableStyle:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    v7 = CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"styleId");
    v8 = [v6 OAXMainNamespace];
    char v9 = [v8 containsNode:a3];

    if (v9)
    {
      v10 = objc_alloc_init(OADTableStyle);
      [(OADTableStyle *)v10 setId:v7];
      v11 = CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"styleName");
      [(OADTableStyle *)v10 setName:v11];
      v12 = [v6 OAXMainNamespace];
      uint64_t v13 = OCXFindChild(a3, v12, "tblBg");

      if (v13)
      {
        v14 = objc_alloc_init(OADTableBackground);
        v15 = [a1 readThemableFillFromParent:v13 drawingState:v6];
        if (v15) {
          [(OADTableBackground *)v14 setFill:v15];
        }
        v16 = [a1 readThemableEffectsFromParent:v13 drawingState:v6];
        if (v16) {
          [(OADTableBackground *)v14 setEffects:v16];
        }
        [(OADTableStyle *)v10 setBackground:v14];
      }
      for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
      {
        v18 = [a1 readPartStyle:i drawingState:v6];
        if (xmlStrEqual(i->name, (const xmlChar *)"wholeTbl"))
        {
          [(OADTableStyle *)v10 setWholeTableStyle:v18];
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"band1H"))
        {
          [(OADTableStyle *)v10 setBand1HorzStyle:v18];
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"band2H"))
        {
          [(OADTableStyle *)v10 setBand2HorzStyle:v18];
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"band1V"))
        {
          [(OADTableStyle *)v10 setBand1VertStyle:v18];
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"band2V"))
        {
          [(OADTableStyle *)v10 setBand2VertStyle:v18];
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"firstRow"))
        {
          [(OADTableStyle *)v10 setFirstRowStyle:v18];
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"lastRow"))
        {
          [(OADTableStyle *)v10 setLastRowStyle:v18];
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"firstCol"))
        {
          [(OADTableStyle *)v10 setFirstColumnStyle:v18];
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"lastCol"))
        {
          [(OADTableStyle *)v10 setLastColumnStyle:v18];
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"neCell"))
        {
          [(OADTableStyle *)v10 setNorthEastStyle:v18];
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"nwCell"))
        {
          [(OADTableStyle *)v10 setNorthWestStyle:v18];
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"seCell"))
        {
          [(OADTableStyle *)v10 setSouthEastStyle:v18];
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"swCell"))
        {
          [(OADTableStyle *)v10 setSouthWestStyle:v18];
        }
      }
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)readPartStyle:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6 = a4;
  v7 = objc_alloc_init(OADTablePartStyle);
  v8 = [v6 OAXMainNamespace];
  uint64_t v9 = OCXFindChild(a3, v8, "tcStyle");

  if (v9)
  {
    v10 = [a1 readCellStyle:v9 drawingState:v6];
    [(OADTablePartStyle *)v7 setCellStyle:v10];
  }
  v11 = [v6 OAXMainNamespace];
  uint64_t v12 = OCXFindChild(a3, v11, "tcTxStyle");

  if (v12)
  {
    uint64_t v13 = [a1 readTextStyle:v12 drawingState:v6];
    [(OADTablePartStyle *)v7 setTextStyle:v13];
  }
  return v7;
}

+ (id)readCellStyle:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6 = a4;
  v7 = objc_alloc_init(OADTableCellStyle);
  v8 = [v6 OAXMainNamespace];
  uint64_t v9 = OCXFindChild(a3, v8, "tcBdr");

  if (v9)
  {
    v10 = [a1 readCellBorderStyle:v9 drawingState:v6];
    [(OADTableCellStyle *)v7 setBorderStyle:v10];
  }
  v11 = [a1 readThemableFillFromParent:a3 drawingState:v6];
  if (v11) {
    [(OADTableCellStyle *)v7 setFill:v11];
  }

  return v7;
}

+ (id)readCellBorderStyle:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6 = a4;
  v7 = objc_alloc_init(OADTableCellBorderStyle);
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    uint64_t v9 = [a1 readThemableStrokeFromParent:i drawingState:v6];
    if (xmlStrEqual(i->name, (const xmlChar *)"left"))
    {
      [(OADTableCellBorderStyle *)v7 setLeftStroke:v9];
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"right"))
    {
      [(OADTableCellBorderStyle *)v7 setRightStroke:v9];
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"top"))
    {
      [(OADTableCellBorderStyle *)v7 setTopStroke:v9];
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"bottom"))
    {
      [(OADTableCellBorderStyle *)v7 setBottomStroke:v9];
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"insideH"))
    {
      [(OADTableCellBorderStyle *)v7 setHorzInsideStroke:v9];
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"insideV"))
    {
      [(OADTableCellBorderStyle *)v7 setVertInsideStroke:v9];
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"tl2br"))
    {
      [(OADTableCellBorderStyle *)v7 setTopLeftToBottomRightStroke:v9];
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"tr2bl"))
    {
      [(OADTableCellBorderStyle *)v7 setBottomLeftToTopRightStroke:v9];
    }
  }
  return v7;
}

+ (id)readThemableStrokeFromParent:(_xmlNode *)a3 drawingState:(id)a4
{
  id v5 = a4;
  id v6 = [v5 OAXMainNamespace];
  uint64_t v7 = OCXFindChild(a3, v6, "ln");

  if (v7)
  {
    v8 = [v5 packagePart];
    uint64_t v9 = +[OAXStroke readStrokeFromXmlNode:v7 packagePart:v8 drawingState:v5];
  }
  else
  {
    v10 = [v5 styleMatrix];
    unsigned int v17 = 0;
    v11 = [v5 OAXMainNamespace];
    id v16 = 0;
    +[OAXStyleMatrix readReferenceFromParentNode:a3 name:"lnRef" inNamespace:v11 color:&v16 index:&v17];
    id v12 = v16;

    uint64_t v13 = [v10 strokeAtIndex:v17];
    v14 = v13;
    if (v13)
    {
      uint64_t v9 = (void *)[v13 copy];

      if (v12) {
        [v9 setStyleColor:v12];
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  return v9;
}

+ (id)readThemableFillFromParent:(_xmlNode *)a3 drawingState:(id)a4
{
  id v5 = a4;
  id v6 = [v5 OAXMainNamespace];
  uint64_t v7 = (_xmlNode *)OCXFindChild(a3, v6, "fill");

  if (v7)
  {
    for (i = OCXFirstChild(v7); i; i = OCXNextSibling(i))
    {
      uint64_t v9 = [v5 packagePart];
      v10 = +[OAXFill readFillFromXmlNode:i packagePart:v9 drawingState:v5];

      if (v10) {
        goto LABEL_12;
      }
    }
    v10 = 0;
  }
  else
  {
    v11 = [v5 styleMatrix];
    unsigned int v18 = 0;
    id v12 = [v5 OAXMainNamespace];
    id v17 = 0;
    +[OAXStyleMatrix readReferenceFromParentNode:a3 name:"fillRef" inNamespace:v12 color:&v17 index:&v18];
    id v13 = v17;

    v14 = [v11 fillAtIndex:v18];
    v15 = v14;
    if (v14)
    {
      v10 = (void *)[v14 copy];

      if (v13) {
        [v10 setStyleColor:v13];
      }
    }
    else
    {
      v10 = 0;
    }
  }
LABEL_12:

  return v10;
}

+ (id)readTextStyle:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(OADTableTextStyle);
  v8 = [v6 OAXMainNamespace];
  uint64_t v9 = OCXFindChild(a3, v8, "fontRef");

  if (v9)
  {
    v10 = objc_alloc_init(OADFontReference);
    [(OADTableTextStyle *)v7 setFontReference:v10];
    +[OAXFontReference readFromNode:v9 fontReference:v10];
  }
  v11 = +[OAXColor readColorFromParentXmlNode:a3];
  if (v11) {
    [(OADTableTextStyle *)v7 setColor:v11];
  }
  id v18 = 0;
  BOOL v12 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"b", &v18);
  id v13 = v18;
  if (v12) {
    -[OADTableTextStyle setBold:](v7, "setBold:", [a1 readOnOffFlag:v13]);
  }
  id v17 = 0;
  BOOL v14 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"i", &v17);
  id v15 = v17;
  if (v14) {
    -[OADTableTextStyle setItalic:](v7, "setItalic:", [a1 readOnOffFlag:v15]);
  }

  return v7;
}

+ (int)readOnOffFlag:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"on"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"off"])
  {
    int v4 = 1;
  }
  else
  {
    [v3 isEqualToString:@"def"];
    int v4 = 2;
  }

  return v4;
}

+ (id)readFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(OADTable);
  v8 = [v6 OAXMainNamespace];
  uint64_t v9 = OCXFindChild(a3, v8, "tblPr");

  if (v9)
  {
    v10 = [(OADTable *)v7 tableProperties];
    [a1 readPropertiesFromXmlNode:v9 toProperties:v10 drawingState:v6];
  }
  v11 = [v6 OAXMainNamespace];
  uint64_t v12 = OCXFindChild(a3, v11, "tblGrid");

  if (!v12) {
    +[TCMessageException raise:OABadFormat];
  }
  id v13 = [(OADTable *)v7 grid];
  [a1 readGridFromXmlNode:v12 toGrid:v13 drawingState:v6];

  [a1 readRowsFromTableXmlNode:a3 toTable:v7 drawingState:v6];
  return v7;
}

+ (void)readPropertiesFromXmlNode:(_xmlNode *)a3 toProperties:(id)a4 drawingState:(id)a5
{
  id v20 = a4;
  id v8 = a5;
  objc_msgSend(v20, "setFirstColumn:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"firstCol", 0));
  objc_msgSend(v20, "setFirstRow:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"firstRow", 0));
  objc_msgSend(v20, "setLastColumn:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"lastCol", 0));
  objc_msgSend(v20, "setLastRow:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"lastRow", 0));
  objc_msgSend(v20, "setBandColumn:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"bandCol", 0));
  objc_msgSend(v20, "setBandRow:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"bandRow", 0));
  objc_msgSend(v20, "setRightToLeft:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rtl", 0));
  uint64_t v9 = [v8 OAXMainNamespace];
  uint64_t v10 = OCXFindChild(a3, v9, "effectLst");

  if (v10)
  {
    v11 = [v8 packagePart];
    uint64_t v12 = +[OAXEffect readEffectsFromXmlNode:v10 packagePart:v11 drawingState:v8];
  }
  else
  {
    uint64_t v12 = 0;
  }
  [v20 setEffects:v12];
  id v13 = [v8 OAXMainNamespace];
  uint64_t v14 = OCXFindChild(a3, v13, "tableStyle");

  if (v14) {
    goto LABEL_5;
  }
  id v16 = [v8 OAXMainNamespace];
  uint64_t v17 = OCXFindChild(a3, v16, "tableStyleId");

  if (v17)
  {
    uint64_t v18 = *(void *)(v17 + 24);
    if (v18)
    {
      if (*(_DWORD *)(v18 + 8) == 3)
      {
        uint64_t v17 = *(void *)(v17 + 24);
      }
      else
      {
        +[TCMessageException raise:OABadFormat];
        uint64_t v17 = v18;
      }
    }
    if (*(void *)(v17 + 80))
    {
      id v15 = objc_msgSend(NSString, "stringWithUTF8String:");
      v19 = [v8 tableStyleCache];
      uint64_t v14 = [v19 styleNodeForId:v15];

      if (!v14)
      {
        +[TCMessageException raise:OABadFormat];
        goto LABEL_6;
      }

LABEL_5:
      id v15 = [a1 readTableStyle:v14 drawingState:v8];
      [v20 setStyle:v15];
LABEL_6:
    }
  }
}

+ (void)readRowsFromTableXmlNode:(_xmlNode *)a3 toTable:(id)a4 drawingState:(id)a5
{
  id v13 = a4;
  id v8 = a5;
  uint64_t v9 = [v8 OAXMainNamespace];
  Child = (_xmlNode *)OCXFindChild(a3, v9, "tr");

  while (Child)
  {
    v11 = [v13 addRow];
    [a1 readRowFromXmlNode:Child toRow:v11 drawingState:v8];

    uint64_t v12 = [v8 OAXMainNamespace];
    Child = OCXFindNextChild(Child, v12, (xmlChar *)"tr");
  }
}

+ (void)readRowFromXmlNode:(_xmlNode *)a3 toRow:(id)a4 drawingState:(id)a5
{
  id v13 = a4;
  id v8 = a5;
  +[OAXBaseTypes readRequiredLengthFromXmlNode:a3 name:"h"];
  objc_msgSend(v13, "setHeight:");
  uint64_t v9 = [v8 OAXMainNamespace];
  Child = (_xmlNode *)OCXFindChild(a3, v9, "tc");

  while (Child)
  {
    v11 = [v13 addCell];
    [a1 readCellFromXmlNode:Child toCell:v11 drawingState:v8];

    uint64_t v12 = [v8 OAXMainNamespace];
    Child = OCXFindNextChild(Child, v12, (xmlChar *)"tc");
  }
}

+ (void)readCellFromXmlNode:(_xmlNode *)a3 toCell:(id)a4 drawingState:(id)a5
{
  id v15 = a4;
  id v8 = a5;
  objc_msgSend(v15, "setRowSpan:", CXDefaultLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rowSpan", 1));
  objc_msgSend(v15, "setGridSpan:", CXDefaultLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"gridSpan", 1));
  objc_msgSend(v15, "setHorzMerge:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"hMerge", 0));
  objc_msgSend(v15, "setVertMerge:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"vMerge", 0));
  uint64_t v9 = [v8 OAXMainNamespace];
  uint64_t v10 = OCXFindChild(a3, v9, "txBody");

  if (v10)
  {
    v11 = objc_alloc_init(OADTextBody);
    [v15 setTextBody:v11];
    +[OAXTextBody readTextBodyFromXmlNode:v10 textBody:v11 drawingState:v8];
  }
  uint64_t v12 = [v8 OAXMainNamespace];
  uint64_t v13 = OCXFindChild(a3, v12, "tcPr");

  if (v13)
  {
    uint64_t v14 = [a1 readCellPropertiesFromXmlNode:v13 drawingState:v8];
    [v15 setProperties:v14];
  }
}

+ (id)readCellPropertiesFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(OADTableCellProperties);
  uint64_t v7 = [v5 packagePart];
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (i->type != XML_ELEMENT_NODE) {
      continue;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"lnL"))
    {
      uint64_t v9 = +[OAXStroke readStrokeFromXmlNode:i packagePart:v7 drawingState:v5];
      [(OADTableCellProperties *)v6 setLeftStroke:v9];
LABEL_16:

      continue;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"lnR"))
    {
      uint64_t v9 = +[OAXStroke readStrokeFromXmlNode:i packagePart:v7 drawingState:v5];
      [(OADTableCellProperties *)v6 setRightStroke:v9];
      goto LABEL_16;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"lnT"))
    {
      uint64_t v9 = +[OAXStroke readStrokeFromXmlNode:i packagePart:v7 drawingState:v5];
      [(OADTableCellProperties *)v6 setTopStroke:v9];
      goto LABEL_16;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"lnB"))
    {
      uint64_t v9 = +[OAXStroke readStrokeFromXmlNode:i packagePart:v7 drawingState:v5];
      [(OADTableCellProperties *)v6 setBottomStroke:v9];
      goto LABEL_16;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"lnTlToBr"))
    {
      uint64_t v9 = +[OAXStroke readStrokeFromXmlNode:i packagePart:v7 drawingState:v5];
      [(OADTableCellProperties *)v6 setTopLeftToBottomRightStroke:v9];
      goto LABEL_16;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"lnBlToTr"))
    {
      uint64_t v9 = +[OAXStroke readStrokeFromXmlNode:i packagePart:v7 drawingState:v5];
      [(OADTableCellProperties *)v6 setBottomLeftToTopRightStroke:v9];
      goto LABEL_16;
    }
    if (!xmlStrEqual(i->name, (const xmlChar *)"cell3D")
      && !xmlStrEqual(i->name, (const xmlChar *)"ext")
      && !xmlStrEqual(i->name, (const xmlChar *)"headers"))
    {
      uint64_t v9 = +[OAXFill readFillFromXmlNode:i packagePart:v7 drawingState:v5];
      if (v9) {
        [(OADTableCellProperties *)v6 setFill:v9];
      }
      goto LABEL_16;
    }
  }
  uint64_t v28 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"marL", &v28, 12))
  {
    double v10 = (double)v28 / 12700.0;
    *(float *)&double v10 = v10;
    [(OADTableCellProperties *)v6 setLeftMargin:v10];
  }
  uint64_t v27 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"marR", &v27, 12))
  {
    double v11 = (double)v27 / 12700.0;
    *(float *)&double v11 = v11;
    [(OADTableCellProperties *)v6 setRightMargin:v11];
  }
  uint64_t v26 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"marT", &v26, 12))
  {
    double v12 = (double)v26 / 12700.0;
    *(float *)&double v12 = v12;
    [(OADTableCellProperties *)v6 setTopMargin:v12];
  }
  uint64_t v25 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"marB", &v25, 12))
  {
    double v13 = (double)v25 / 12700.0;
    *(float *)&double v13 = v13;
    [(OADTableCellProperties *)v6 setBottomMargin:v13];
  }
  id v24 = 0;
  BOOL v14 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"vert", &v24);
  id v15 = v24;
  if (v14) {
    [(OADTableCellProperties *)v6 setTextFlow:+[OAXTextBody readFlowType:v15]];
  }
  id v23 = 0;
  BOOL v16 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"anchor", &v23);
  id v17 = v23;
  if (v16) {
    [(OADTableCellProperties *)v6 setTextAnchor:+[OAXTextBody readAnchorType:v17]];
  }
  BOOL v22 = 0;
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"anchorCtr", &v22)) {
    [(OADTableCellProperties *)v6 setTextAnchorCenter:v22];
  }
  id v21 = 0;
  BOOL v18 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"horzOverflow", &v21);
  id v19 = v21;
  if (v18) {
    [(OADTableCellProperties *)v6 setTextHorizontalOverflow:+[OAXTextBody readHorizontalOverflowType:v19]];
  }

  return v6;
}

+ (id)readThemableEffectsFromParent:(_xmlNode *)a3 drawingState:(id)a4
{
  id v5 = a4;
  id v6 = [v5 OAXMainNamespace];
  uint64_t v7 = OCXFindChild(a3, v6, "effect");

  if (v7)
  {
    id v8 = [v5 packagePart];
    uint64_t v9 = +[OAXEffect readEffectsFromXmlNode:v7 packagePart:v8 drawingState:v5];
  }
  else
  {
    double v10 = [v5 styleMatrix];
    unsigned int v16 = 0;
    double v11 = [v5 OAXMainNamespace];
    id v15 = 0;
    +[OAXStyleMatrix readReferenceFromParentNode:a3 name:"effectRef" inNamespace:v11 color:&v15 index:&v16];
    id v12 = v15;

    double v13 = [v10 effectsAtIndex:v16];
    if (v13)
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v13 copyItems:1];

      if (v12) {
        [v9 makeObjectsPerformSelector:sel_setStyleColor_ withObject:v12];
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  return v9;
}

+ (void)cacheTableStylesInPart:(id)a3 cache:(id)a4 drawingState:(id)a5
{
  id v16 = a3;
  id v7 = a4;
  id v8 = a5;
  if (v16)
  {
    xmlNodePtr v9 = OCXGetRootElement((_xmlDoc *)[v16 xmlDocument]);
    double v10 = v9;
    if (!v9 || !xmlStrEqual(v9->name, (const xmlChar *)"tblStyleLst")) {
      +[TCMessageException raise:OABadFormat];
    }
    [v7 setStylesPart:v16];
    double v11 = CXDefaultStringAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"def", 0);
    [v7 setDefaultStyleId:v11];
    id v12 = [v8 OAXMainNamespace];
    Child = (_xmlNode *)OCXFindChild(v10, v12, "tblStyle");

    while (Child)
    {
      BOOL v14 = CXDefaultStringAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"styleId", 0);
      [v7 setStyleNode:Child forId:v14];
      id v15 = [v8 OAXMainNamespace];
      Child = OCXFindNextChild(Child, v15, (xmlChar *)"tblStyle");
    }
  }
}

+ (void)readGridFromXmlNode:(_xmlNode *)a3 toGrid:(id)a4 drawingState:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  id v8 = [v7 OAXMainNamespace];
  Child = (_xmlNode *)OCXFindChild(a3, v8, "gridCol");

  while (Child)
  {
    double v10 = [v12 addColumn];
    +[OAXBaseTypes readRequiredLengthFromXmlNode:Child name:"w"];
    objc_msgSend(v10, "setWidth:");
    double v11 = [v7 OAXMainNamespace];
    Child = OCXFindNextChild(Child, v11, (xmlChar *)"gridCol");
  }
}

@end