@interface EXWorksheet
+ (BOOL)readDistinctSheetElementsFrom:(_xmlTextReader *)a3 state:(id)a4;
+ (id)edSheetWithState:(id)a3;
+ (void)readColumnInfosFrom:(_xmlNode *)a3 state:(id)a4;
+ (void)readCommentTextFrom:(id)a3;
+ (void)readHyperlinksFrom:(_xmlNode *)a3 state:(id)a4;
+ (void)readOleObjectsFrom:(_xmlNode *)a3 state:(id)a4;
+ (void)readOtherSheetComponentsWithState:(id)a3;
+ (void)readPivotTables:(id)a3;
+ (void)readSheetExtension:(_xmlNode *)a3 state:(id)a4;
+ (void)readSheetExtensions:(_xmlNode *)a3 state:(id)a4;
+ (void)readTables:(id)a3;
+ (void)readWorksheetFormatPropertiesFrom:(_xmlNode *)a3 state:(id)a4;
+ (void)readWorksheetViewsFrom:(_xmlNode *)a3 state:(id)a4;
+ (void)setupProcessors:(id)a3;
@end

@implementation EXWorksheet

+ (id)edSheetWithState:(id)a3
{
  id v4 = a3;
  v5 = [EDWorksheet alloc];
  v6 = [v4 workbook];
  v7 = [(EDSheet *)v5 initWithWorkbook:v6];

  v8 = [(EDSheet *)v7 processors];
  [a1 setupProcessors:v8];

  return v7;
}

+ (void)setupProcessors:(id)a3
{
  id v3 = a3;
  [v3 removeAllObjects];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
}

+ (void)readTables:(id)a3
{
  v22 = (OCXState *)a3;
  id v3 = [(OCXState *)v22 currentSheet];
  id v4 = [v3 tables];

  v5 = [(OCXState *)v22 currentPart];
  v6 = OCXPartRelationshipsByTypeWithFallback(v5, v22, (objc_selector *)sel_OCXTableRelationshipType);
  if (v6)
  {
    +[EXTableStyleTable readPredefinedTableStylesWithState:v22];
    v7 = [(OCPPackagePart *)v5 package];
    v21 = v5;
    if (!v7) {
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    for (unsigned int i = 0; ; unsigned int i = v9 + 1)
    {
      uint64_t v9 = i;
      if (objc_msgSend(v6, "count", v21) <= (unint64_t)i) {
        break;
      }
      v10 = [v6 objectAtIndex:i];
      v11 = [v10 targetLocation];
      v12 = [v7 partForLocation:v11];

      if (!v12) {
        +[TCMessageException raise:TCInvalidFileFormatMessage];
      }
      v13 = (_xmlDoc *)[v12 xmlDocument];
      if (!v13) {
        +[TCMessageException raise:TCInvalidFileFormatMessage];
      }
      xmlNodePtr v14 = OCXGetRootElement(v13);
      xmlNodePtr v15 = v14;
      if (!v14
        || !xmlStrEqual(v14->name, (const xmlChar *)"table")
        || ([(OCXState *)v22 EXSpreadsheetMLNamespace],
            v16 = objc_claimAutoreleasedReturnValue(),
            char v17 = [v16 containsNode:v15],
            v16,
            (v17 & 1) == 0))
      {
        +[TCMessageException raise:TCInvalidFileFormatMessage];
      }
      v18 = +[EXTable edTableFromXmlTableElement:v15 state:v22];
      [v4 addObject:v18];

      v19 = [v6 objectAtIndex:v9];
      v20 = [v19 targetLocation];
      [v7 resetPartForLocation:v20];
    }
    v5 = v21;
  }
}

+ (void)readOtherSheetComponentsWithState:(id)a3
{
  id v4 = a3;
  objc_msgSend(a1, "readCommentTextFrom:");
  [a1 readPivotTables:v4];
}

+ (void)readCommentTextFrom:(id)a3
{
  id v3 = (OCXState *)a3;
  id v4 = [(OCXState *)v3 currentPart];
  v5 = OCXPartRelationshipsByTypeWithFallback(v4, v3, (objc_selector *)sel_OCXCommentsRelationshipType);
  if (v5)
  {
    v6 = [(OCPPackagePart *)v4 package];
    if (!v6) {
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    v7 = [v5 objectAtIndex:0];
    v8 = [v7 targetLocation];
    uint64_t v9 = [v6 partForLocation:v8];

    if (v9)
    {
      v42 = v9;
      v10 = (_xmlDoc *)[v9 xmlDocument];
      if (v10)
      {
        v39 = v6;
        v41 = v4;
        v43 = v5;
        xmlNodePtr v11 = OCXGetRootElement(v10);
        v12 = v11;
        if (!v11
          || !xmlStrEqual(v11->name, (const xmlChar *)"comments")
          || ([(OCXState *)v3 EXSpreadsheetMLNamespace],
              v13 = objc_claimAutoreleasedReturnValue(),
              char v14 = [v13 containsNode:v12],
              v13,
              (v14 & 1) == 0))
        {
          +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage, v6);
        }
        id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
        v16 = [(OCXState *)v3 EXSpreadsheetMLNamespace];
        char v17 = (_xmlNode *)OCXFindChild(v12, v16, "authors");

        v18 = [(OCXState *)v3 EXSpreadsheetMLNamespace];
        Child = (_xmlNode *)OCXFindChild(v17, v18, "author");

        while (Child)
        {
          v20 = +[EXString readStringWithAsciiCodeFromXmlStringElement:](EXString, "readStringWithAsciiCodeFromXmlStringElement:", Child, v39);
          v21 = +[EDString edStringWithString:v20];

          if (!v21)
          {
            v21 = +[EDString string];
          }
          [v15 addObject:v21];
          v22 = [(OCXState *)v3 EXSpreadsheetMLNamespace];
          Child = OCXFindNextChild(Child, v22, (xmlChar *)"author");
        }
        v23 = [(OCXState *)v3 EXSpreadsheetMLNamespace];
        v24 = (_xmlNode *)OCXFindChild(v12, v23, "commentList");

        v25 = [(OCXState *)v3 EXSpreadsheetMLNamespace];
        v26 = (_xmlNode *)OCXFindChild(v24, v25, "comment");

        while (v26)
        {
          id v45 = 0;
          BOOL v27 = CXOptionalStringAttribute(v26, (void *)CXNoNamespace, (xmlChar *)"ref", &v45);
          id v28 = v45;
          if (v27)
          {
            v29 = +[EXReference edReferenceFromXmlReference:v28];
          }
          else
          {
            v29 = 0;
          }
          uint64_t v44 = 0;
          if (CXOptionalLongAttribute(v26, (CXNamespace *)CXNoNamespace, (xmlChar *)"authorId", &v44)
            && (uint64_t v30 = v44, v30 < [v15 count]))
          {
            v31 = [v15 objectAtIndexedSubscript:v44];
            if (!v29) {
              goto LABEL_23;
            }
          }
          else
          {
            v31 = 0;
            if (!v29) {
LABEL_23:
            }
              +[TCMessageException raise:TCInvalidFileFormatMessage];
          }
          v32 = [(OCXState *)v3 EXSpreadsheetMLNamespace];
          uint64_t v33 = OCXFindChild(v26, v32, "text");

          v34 = +[EDTextBox textBox];
          v35 = +[EXString edStringWithRunsFromXmlStringElement:v33 state:v3];
          [v34 setText:v35];

          [(OCXState *)v3 setTextBox:v34 author:v31 forReference:v29];
          v36 = [(OCXState *)v3 EXSpreadsheetMLNamespace];
          v26 = OCXFindNextChild(v26, v36, (xmlChar *)"comment");
        }
        uint64_t v9 = v42;
        v6 = v40;
        v37 = [v43 objectAtIndex:0];
        v38 = [v37 targetLocation];
        [v40 resetPartForLocation:v38];

        id v4 = v41;
        v5 = v43;
      }
    }
  }
}

+ (void)readPivotTables:(id)a3
{
  v22 = (OCXState *)a3;
  id v3 = [(OCXState *)v22 currentSheet];
  id v4 = [v3 pivotTables];

  v5 = [(OCXState *)v22 currentPart];
  v6 = OCXPartRelationshipsByTypeWithFallback(v5, v22, (objc_selector *)sel_OCXPivotTableRelationshipType);
  if (v6)
  {
    +[EXTableStyleTable readPredefinedTableStylesWithState:v22];
    v7 = [(OCPPackagePart *)v5 package];
    if (!v7) {
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    if (objc_msgSend(v6, "count", v5)) {
      [(OCXState *)v22 reportWorksheetWarning:ECPivotTables];
    }
    for (unsigned int i = 0; ; unsigned int i = v9 + 1)
    {
      uint64_t v9 = i;
      if ([v6 count] <= (unint64_t)i) {
        break;
      }
      v10 = [v6 objectAtIndex:i];
      xmlNodePtr v11 = [v10 targetLocation];
      v12 = [v7 partForLocation:v11];

      if (!v12) {
        +[TCMessageException raise:TCInvalidFileFormatMessage];
      }
      v13 = (_xmlDoc *)[v12 xmlDocument];
      if (!v13) {
        +[TCMessageException raise:TCInvalidFileFormatMessage];
      }
      xmlNodePtr v14 = OCXGetRootElement(v13);
      xmlNodePtr v15 = v14;
      if (!v14
        || !xmlStrEqual(v14->name, (const xmlChar *)"pivotTableDefinition")
        || ([(OCXState *)v22 EXSpreadsheetMLNamespace],
            v16 = objc_claimAutoreleasedReturnValue(),
            char v17 = [v16 containsNode:v15],
            v16,
            (v17 & 1) == 0))
      {
        +[TCMessageException raise:TCInvalidFileFormatMessage];
      }
      v18 = +[EXPivotTable edPivotTableFromXmlPivotTableElement:v15 state:v22];
      [v4 addObject:v18];

      v19 = [v6 objectAtIndex:v9];
      v20 = [v19 targetLocation];
      [v7 resetPartForLocation:v20];
    }
    v5 = v21;
  }
}

+ (BOOL)readDistinctSheetElementsFrom:(_xmlTextReader *)a3 state:(id)a4
{
  id v6 = a4;
  v7 = xmlTextReaderConstLocalName(a3);
  if (xmlStrEqual(v7, (const xmlChar *)"sheetData"))
  {
    +[EXRow readRowsFrom:a3 state:v6];
LABEL_3:
    xmlNodePtr v8 = 0;
    goto LABEL_6;
  }
  if (!v7) {
    goto LABEL_3;
  }
  xmlNodePtr v8 = xmlTextReaderExpand(a3);
LABEL_6:
  if (xmlStrEqual(v7, (const xmlChar *)"sheetViews"))
  {
    [a1 readWorksheetViewsFrom:v8 state:v6];
  }
  else if (xmlStrEqual(v7, (const xmlChar *)"sheetFormatPr"))
  {
    [a1 readWorksheetFormatPropertiesFrom:v8 state:v6];
  }
  else if (xmlStrEqual(v7, (const xmlChar *)"cols"))
  {
    [a1 readColumnInfosFrom:v8 state:v6];
  }
  else if (xmlStrEqual(v7, (const xmlChar *)"mergeCells"))
  {
    +[EXMergeTable readFrom:v8 state:v6];
  }
  else if (xmlStrEqual(v7, (const xmlChar *)"conditionalFormatting"))
  {
    +[EXConditionalFormatting readFrom:v8 x14:0 state:v6];
  }
  else if (xmlStrEqual(v7, (const xmlChar *)"hyperlinks"))
  {
    [a1 readHyperlinksFrom:v8 state:v6];
  }
  else if (xmlStrEqual(v7, (const xmlChar *)"oleObjects"))
  {
    [a1 readOleObjectsFrom:v8 state:v6];
  }
  else if (xmlStrEqual(v7, (const xmlChar *)"dimension"))
  {
    Attribute = xmlTextReaderGetAttribute(a3, (const xmlChar *)"ref");
    v10 = objc_msgSend(NSString, "tc_stringWithXmlString:", Attribute);
    ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(Attribute);
    xmlNodePtr v11 = +[EXReference edReferenceFromXmlReference:v10];
    [v6 setSheetDimension:v11];
  }
  else
  {
    if (!xmlStrEqual(v7, (const xmlChar *)"extLst"))
    {
      BOOL v12 = 0;
      goto LABEL_25;
    }
    [a1 readSheetExtensions:v8 state:v6];
  }
  BOOL v12 = 1;
LABEL_25:

  return v12;
}

+ (void)readWorksheetViewsFrom:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3)
  {
    v7 = [v5 EXSpreadsheetMLNamespace];
    xmlNodePtr v8 = (_xmlNode *)OCXFindChild(a3, v7, "sheetView");

    if (v8)
    {
      uint64_t v9 = [v6 currentSheet];
      v10 = [v6 EXSpreadsheetMLNamespace];
      uint64_t v11 = OCXFindChild(v8, v10, "pane");

      if (v11)
      {
        BOOL v12 = +[EXPane edPaneFromXMLPaneElement:v11];
        [v9 setPane:v12];
      }
      BOOL v19 = 1;
      if (CXOptionalBoolAttribute(v8, (CXNamespace *)CXNoNamespace, (xmlChar *)"showFormulas", &v19)) {
        [v9 setDisplayFormulas:v19];
      }
      BOOL v18 = 1;
      if (CXOptionalBoolAttribute(v8, (CXNamespace *)CXNoNamespace, (xmlChar *)"showGridLines", &v18)) {
        [v9 setDisplayGridlines:v18];
      }
      BOOL v17 = 1;
      CXOptionalBoolAttribute(v8, (CXNamespace *)CXNoNamespace, (xmlChar *)"defaultGridColor", &v17);
      if (!v17)
      {
        unint64_t v16 = 0;
        if (CXOptionalUnsignedLongAttribute(v8, (CXNamespace *)CXNoNamespace, (xmlChar *)"colorId", &v16))
        {
          unint64_t v13 = v16;
          xmlNodePtr v14 = [v6 resources];
          xmlNodePtr v15 = +[EDColorReference colorReferenceWithColorIndex:v13 resources:v14];
          [v9 setDefaultGridlineColorReference:v15];
        }
      }
    }
  }
}

+ (void)readWorksheetFormatPropertiesFrom:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  id v6 = [v5 currentSheet];
  if (a3)
  {
    double v13 = 0.0;
    if (!CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"defaultColWidth", &v13)) {
      CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"defColWidth", &v13);
    }
    double v7 = v13;
    if (v13 == 0.0)
    {
      double v12 = 8.0;
      CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"baseColWidth", &v12);
      xmlNodePtr v8 = [v5 columnWidthConvertor];
      [v8 xlColumnWidthFromXlBaseColumnWidth:v12];
      double v13 = v9;

      double v7 = v13;
    }
    [v6 setDefaultColumnWidth:v7];
    [v5 setDefaultColumnWidth:v13];
    double v12 = 15.0;
    if (!CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"defaultRowHeight", &v12)) {
      CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"defRowHeight", &v12);
    }
    [v6 setDefaultRowHeight:(int)(v12 * 20.0)];
    [v5 setDefaultRowHeight:v12 * 20.0];
    unint64_t v11 = 0;
    if (CXOptionalUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"outlineLevelRow", &v11)) {
      [v6 setMaxRowOutlineLevel:v11];
    }
    unint64_t v10 = 0;
    if (CXOptionalUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"outlineLevelCol", &v10)) {
      [v6 setMaxColumnOutlineLevel:v10];
    }
  }
}

+ (void)readColumnInfosFrom:(_xmlNode *)a3 state:(id)a4
{
  id v11 = a4;
  id v5 = [v11 currentSheet];
  id v6 = [v5 columnInfos];

  if (a3)
  {
    double v7 = [v11 EXSpreadsheetMLNamespace];
    Child = (_xmlNode *)OCXFindChild(a3, v7, "col");

    while (Child)
    {
      double v9 = +[EXColumnInfo edColumnInfoFromXmlColumnInfoElement:Child state:v11];
      [v6 addObject:v9];

      unint64_t v10 = [v11 EXSpreadsheetMLNamespace];
      Child = OCXFindNextChild(Child, v10, (xmlChar *)"col");
    }
  }
}

+ (void)readHyperlinksFrom:(_xmlNode *)a3 state:(id)a4
{
  id v11 = a4;
  if (a3)
  {
    id v5 = [v11 EXSpreadsheetMLNamespace];
    Child = (_xmlNode *)OCXFindChild(a3, v5, "hyperlink");

    if (Child)
    {
      double v7 = 0;
      do
      {
        if (!v7)
        {
          xmlNodePtr v8 = [v11 currentSheet];
          double v7 = [v8 hyperlinks];
        }
        double v9 = +[EXHyperlink edHyperlinkFromXmlHyperlinkElement:Child state:v11];
        [v7 addObject:v9];

        unint64_t v10 = [v11 EXSpreadsheetMLNamespace];
        Child = OCXFindNextChild(Child, v10, (xmlChar *)"hyperlink");
      }
      while (Child);
    }
  }
}

+ (void)readOleObjectsFrom:(_xmlNode *)a3 state:(id)a4
{
  id v40 = a4;
  +[TCProgressContext createStageWithSteps:@"read OLE objects" takingSteps:1.0 name:1.0];
  if (a3)
  {
    v37 = [v40 currentPart];
    id v5 = [v37 package];
    if (!v5) {
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    parent = a3->parent;
    if (parent)
    {
      double v7 = [v40 EXSpreadsheetMLNamespace];
      OCXFindChild(parent, v7, "oleObjects");
    }
    xmlNodePtr v8 = [v40 EXSpreadsheetMLNamespace];
    Child = (_xmlNode *)OCXFindChild(a3, v8, "oleObject");

    if (Child)
    {
      int v10 = -1;
      v38 = v5;
      do
      {
        +[TCProgressContext createStageWithSteps:@"read OLE object" takingSteps:1.0 name:(double)ldexp(1.0, v10)];
        uint64_t v11 = CXDefaultStringAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"progId", 0);
        double v12 = objc_alloc_init(OADOle);
        double v13 = v12;
        if (v11) {
          [(OADOle *)v12 setAnsiProgID:v11];
        }
        xmlNodePtr v14 = CXRequiredStringAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"shapeId");
        v39 = (void *)v11;
        xmlNodePtr v15 = [NSString stringWithFormat:@"_x0000_s%@", v14];

        unint64_t v16 = [v40 oavState];
        BOOL v17 = [v16 drawableForVmlShapeId:v15];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v18 = v17;
          [v18 setOle:v13];
        }
        else
        {
          uint64_t v19 = objc_opt_class();
          v20 = TSUDynamicCast(v19, (uint64_t)v17);
          int v21 = [v20 type];

          if (v21 != 75) {
            goto LABEL_15;
          }
          id v18 = [(OADOle *)v13 object];
        }

LABEL_15:
        v22 = [v40 EXSpreadsheetMLNamespace];
        v23 = (_xmlNode *)OCXFindChild(Child, v22, "objectPr");

        if (v23)
        {
          v24 = [v40 EXSpreadsheetMLNamespace];
          v25 = (_xmlNode *)OCXFindChild(v23, v24, "anchor");

          if (v25)
          {
            v26 = [v17 clientData];
            if (v26)
            {
              BOOL v27 = objc_alloc_init(EDTwoCellAnchor);
              [(EDTwoCellAnchor *)v27 setRelative:0];
              [(EDTwoCellAnchor *)v27 setEditAs:1];
              id v28 = [v40 EXSpreadsheetMLNamespace];
              v29 = OCXFirstChild(v25, v28, (xmlChar *)"from");

              uint64_t v30 = +[EXDrawing readAnchorMarkerFromNode:v29 state:v40];
              -[EDTwoCellAnchor setFrom:](v27, "setFrom:", v30, v31);
              v32 = [v40 EXSpreadsheetMLNamespace];
              uint64_t v33 = OCXNextSibling(v29, v32, (xmlChar *)"to");

              uint64_t v34 = +[EXDrawing readAnchorMarkerFromNode:v33 state:v40];
              -[EDTwoCellAnchor setTo:](v27, "setTo:", v34, v35);
              [v26 setAnchor:v27];
            }
          }
        }
        +[TCProgressContext endStage];

        id v5 = v38;
        v36 = [v40 EXSpreadsheetMLNamespace];
        Child = OCXFindNextChild(a3, v36, (xmlChar *)"oleObject");

        --v10;
      }
      while (Child);
    }
  }
  +[TCProgressContext endStage];
}

+ (void)readSheetExtensions:(_xmlNode *)a3 state:(id)a4
{
  id v9 = a4;
  for (unsigned int i = OCXFirstChild(a3); i; unsigned int i = OCXNextSibling(i))
  {
    if (i->type == XML_ELEMENT_NODE)
    {
      double v7 = [v9 EXSpreadsheetMLNamespace];
      char v8 = [v7 containsNode:i];

      if (v8)
      {
        if (xmlStrEqual(i->name, (const xmlChar *)"ext")) {
          [a1 readSheetExtension:i state:v9];
        }
      }
    }
  }
}

+ (void)readSheetExtension:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  for (unsigned int i = OCXFirstChild(a3); i; unsigned int i = OCXNextSibling(i))
  {
    if (i->type == XML_ELEMENT_NODE && [(id)EXXL2010Namespace containsNode:i])
    {
      if (xmlStrEqual(i->name, (const xmlChar *)"sparklineGroups"))
      {
        [v6 reportWarning:ECUnsupportedSparklines];
      }
      else if (xmlStrEqual(i->name, (const xmlChar *)"conditionalFormattings"))
      {
        +[EXConditionalFormatting readConditionalFormattingsFrom:i x14:1 state:v6];
      }
    }
  }
}

@end