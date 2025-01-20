@interface EXDrawing
+ (EDCellAnchorMarker)readAnchorMarkerFromNode:(_xmlNode *)a3 state:(id)a4;
+ (id)readAbsoluteAnchorNode:(_xmlNode *)a3 state:(id)a4;
+ (id)readAnchorNode:(_xmlNode *)a3 state:(id)a4;
+ (id)readDrawableNode:(_xmlNode *)a3 anchor:(id)a4 state:(id)a5;
+ (id)readOneCellAnchorNode:(_xmlNode *)a3 state:(id)a4;
+ (id)readTwoCellAnchorNode:(_xmlNode *)a3 state:(id)a4;
+ (void)initialize;
+ (void)readFromPart:(id)a3 state:(id)a4;
@end

@implementation EXDrawing

+ (void)readFromPart:(id)a3 state:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (v13)
  {
    v7 = [v6 officeArtState];
    [v7 setPackagePart:v13];

    xmlNodePtr v8 = OCXGetRootElement((_xmlDoc *)[v13 xmlDocument]);
    if (v8)
    {
      v9 = [v6 EXSpreadsheetDrawingNamespace];
      if ([v9 containsNode:v8])
      {
        int v10 = xmlStrEqual(v8->name, (const xmlChar *)"wsDr");

        if (v10)
        {
          for (i = OCXFirstChild(v8); i; i = OCXNextSibling(i))
            id v12 = (id)[a1 readAnchorNode:i state:v6];
        }
      }
      else
      {
      }
    }
  }
}

+ (id)readTwoCellAnchorNode:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  v7 = objc_alloc_init(EDTwoCellAnchor);
  [(EDTwoCellAnchor *)v7 setRelative:0];
  xmlNodePtr v8 = [v6 EXSpreadsheetDrawingNamespace];
  v9 = OCXFirstChild(a3, v8, (xmlChar *)"from");

  uint64_t v10 = [a1 readAnchorMarkerFromNode:v9 state:v6];
  -[EDTwoCellAnchor setFrom:](v7, "setFrom:", v10, v11);
  id v12 = [v6 EXSpreadsheetDrawingNamespace];
  id v13 = OCXNextSibling(v9, v12, (xmlChar *)"to");

  uint64_t v14 = [a1 readAnchorMarkerFromNode:v13 state:v6];
  -[EDTwoCellAnchor setTo:](v7, "setTo:", v14, v15);
  v16 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"editAs", 0);
  if ([v16 isEqualToString:@"twoCell"])
  {
    uint64_t v17 = 0;
  }
  else if ([v16 isEqualToString:@"oneCell"])
  {
    uint64_t v17 = 1;
  }
  else if ([v16 isEqualToString:@"absolute"])
  {
    uint64_t v17 = 2;
  }
  else
  {
    uint64_t v17 = 0;
  }
  [(EDTwoCellAnchor *)v7 setEditAs:v17];
  v18 = [a1 readDrawableNode:OCXNextSibling(v13) anchor:v7 state:v6];

  return v18;
}

+ (id)readDrawableNode:(_xmlNode *)a3 anchor:(id)a4 state:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [v8 EXSpreadsheetDrawingNamespace];
  uint64_t v10 = [v8 officeArtState];
  uint64_t v11 = +[OAXDrawable readDrawableFromXmlNode:a3 inNamespace:v9 drawingState:v10];

  if (v11)
  {
    id v12 = [v11 clientData];
    if (!v12)
    {
      id v13 = objc_alloc_init(EDOfficeArtClient);
      uint64_t v14 = [v8 currentSheet];
      [(EDOfficeArtClient *)v13 setSheet:v14];

      id v12 = v13;
      [v11 setClientData:v13];
    }
    [v12 setAnchor:v7];
    uint64_t v15 = [v8 currentSheet];
    [v15 addDrawable:v11];
  }
  return v11;
}

+ (id)readAbsoluteAnchorNode:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(EDAbsoluteAnchor);
  id v8 = [v6 EXSpreadsheetDrawingNamespace];
  v9 = OCXFirstChild(a3, v8, (xmlChar *)"pos");

  +[OAXBaseTypes readPoint2DFromXmlNode:v9];
  -[EDAbsoluteAnchor setPosition:](v7, "setPosition:");
  uint64_t v10 = [v6 EXSpreadsheetDrawingNamespace];
  uint64_t v11 = OCXNextSibling(v9, v10, (xmlChar *)"ext");

  +[OAXBaseTypes readSize2DFromXmlNode:v11];
  -[EDAbsoluteAnchor setSize:](v7, "setSize:");
  id v12 = [a1 readDrawableNode:OCXNextSibling(v11) anchor:v7 state:v6];

  return v12;
}

+ (id)readOneCellAnchorNode:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(EDOneCellAnchor);
  [(EDOneCellAnchor *)v7 setRelative:0];
  id v8 = [v6 EXSpreadsheetDrawingNamespace];
  v9 = OCXFirstChild(a3, v8, (xmlChar *)"from");

  uint64_t v10 = [a1 readAnchorMarkerFromNode:v9 state:v6];
  -[EDOneCellAnchor setFrom:](v7, "setFrom:", v10, v11);
  id v12 = [v6 EXSpreadsheetDrawingNamespace];
  id v13 = OCXNextSibling(v9, v12, (xmlChar *)"ext");

  +[OAXBaseTypes readSize2DFromXmlNode:v13];
  -[EDOneCellAnchor setSize:](v7, "setSize:");
  uint64_t v14 = [a1 readDrawableNode:OCXNextSibling(v13) anchor:v7 state:v6];

  return v14;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_opt_class();
  }
}

+ (id)readAnchorNode:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3->type == XML_ELEMENT_NODE)
  {
    id v8 = [v6 EXSpreadsheetDrawingNamespace];
    int v9 = [v8 containsNode:a3];

    if (v9)
    {
      if (xmlStrEqual(a3->name, (const xmlChar *)"twoCellAnchor"))
      {
        uint64_t v10 = [a1 readTwoCellAnchorNode:a3 state:v7];
LABEL_9:
        uint64_t v11 = (void *)v10;
        goto LABEL_11;
      }
      if (xmlStrEqual(a3->name, (const xmlChar *)"oneCellAnchor"))
      {
        uint64_t v10 = [a1 readOneCellAnchorNode:a3 state:v7];
        goto LABEL_9;
      }
      if (xmlStrEqual(a3->name, (const xmlChar *)"absoluteAnchor"))
      {
        uint64_t v10 = [a1 readAbsoluteAnchorNode:a3 state:v7];
        goto LABEL_9;
      }
    }
  }
  uint64_t v11 = 0;
LABEL_11:

  return v11;
}

+ (EDCellAnchorMarker)readAnchorMarkerFromNode:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  id v6 = [v5 EXSpreadsheetDrawingNamespace];
  unsigned int v7 = CXRequiredLongChild(a3, v6, (xmlChar *)"col");

  id v8 = [v5 EXSpreadsheetDrawingNamespace];
  int v9 = CXRequiredLongChild(a3, v8, (xmlChar *)"colOff", 12);

  uint64_t v10 = [v5 EXSpreadsheetDrawingNamespace];
  LODWORD(v8) = CXRequiredLongChild(a3, v10, (xmlChar *)"row");

  uint64_t v11 = [v5 EXSpreadsheetDrawingNamespace];
  *(float *)&unsigned int v12 = (float)(uint64_t)CXRequiredLongChild(a3, v11, (xmlChar *)"rowOff", 12) / 12700.0;

  unint64_t v13 = v7 | ((unint64_t)COERCE_UNSIGNED_INT((float)(uint64_t)v9 / 12700.0) << 32);
  unint64_t v14 = v8 | ((unint64_t)v12 << 32);
  result.rowIndex = v14;
  result.rowAdjustment = *((float *)&v14 + 1);
  result.columnIndex = v13;
  result.columnAdjustment = *((float *)&v13 + 1);
  return result;
}

@end