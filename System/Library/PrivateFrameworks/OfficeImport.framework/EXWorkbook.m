@interface EXWorkbook
+ (id)edWorkbookFromState:(id)a3 package:(id)a4 reader:(id)a5 fileName:(id)a6 temporaryDirectory:(id)a7 delegate:(id)a8 forThumbnail:(BOOL)a9;
+ (id)edWorkbookFromState:(id)a3 package:(id)a4 reader:(id)a5 resourcesOnly:(BOOL)a6 fileName:(id)a7 temporaryDirectory:(id)a8 delegate:(id)a9 forThumbnail:(BOOL)a10;
+ (void)readSheetsFrom:(id)a3 relationNS:(_xmlNs *)a4 state:(id)a5 delegate:(id)a6 forThumbnail:(BOOL)a7;
+ (void)readStringsFrom:(id)a3 state:(id)a4;
+ (void)readStylesFrom:(id)a3 state:(id)a4;
+ (void)setDefaultParagraphProperties:(id)a3;
+ (void)setupDefaultTextStyleWithState:(id)a3;
+ (void)setupProcessors:(id)a3;
@end

@implementation EXWorkbook

+ (void)setupProcessors:(id)a3
{
  id v3 = a3;
  [v3 removeAllObjects];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
}

+ (void)readStylesFrom:(id)a3 state:(id)a4
{
  v38 = (OCPPackagePart *)a3;
  v6 = (OCXState *)a4;
  v7 = [(OCPPackagePart *)v38 package];
  v8 = OCXPartRelationshipsByTypeWithFallback(v38, v6, (objc_selector *)sel_OCXStylesRelationshipType);
  v9 = v8;
  if (v8)
  {
    v10 = [v8 objectAtIndex:0];
    if (!v10) {
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    v11 = [v10 targetLocation];
    v12 = [v7 partForLocation:v11];

    if (!v12
      || ([v12 contentType],
          v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = [v13 isEqualToString:@"application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml"], v13, (v14 & 1) == 0))
    {
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    v15 = (_xmlDoc *)[v12 xmlDocument];
    if (!v15) {
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    xmlNodePtr v16 = OCXGetRootElement(v15);
    v17 = v16;
    if (!v16 || !xmlStrEqual(v16->name, (const xmlChar *)"styleSheet")) {
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    v18 = [(OCXState *)v6 EXSpreadsheetMLNamespace];
    uint64_t v19 = OCXFindChild(v17, v18, "colors");

    +[EXColorTable readFrom:v19 state:v6];
    +[TCProgressContext advanceProgress:1.0];
    v20 = [(OCXState *)v6 EXSpreadsheetMLNamespace];
    uint64_t v21 = OCXFindChild(v17, v20, "numFmts");

    +[EXContentFormatTable readFrom:v21 state:v6];
    +[TCProgressContext advanceProgress:1.0];
    v22 = [(OCXState *)v6 EXSpreadsheetMLNamespace];
    uint64_t v23 = OCXFindChild(v17, v22, "fonts");

    +[EXFontTable readFrom:v23 state:v6];
    +[TCProgressContext advanceProgress:1.0];
    v24 = [(OCXState *)v6 EXSpreadsheetMLNamespace];
    uint64_t v25 = OCXFindChild(v17, v24, "fills");

    +[EXFillTable readFrom:v25 state:v6];
    +[TCProgressContext advanceProgress:1.0];
    v26 = [(OCXState *)v6 EXSpreadsheetMLNamespace];
    uint64_t v27 = OCXFindChild(v17, v26, "borders");

    +[EXBordersTable readFrom:v27 state:v6];
    +[TCProgressContext advanceProgress:1.0];
    v28 = [(OCXState *)v6 EXSpreadsheetMLNamespace];
    uint64_t v29 = OCXFindChild(v17, v28, "cellXfs");

    +[EXCellFormatTable readFromCellXfsElement:v29 state:v6];
    v30 = [(OCXState *)v6 EXSpreadsheetMLNamespace];
    uint64_t v31 = OCXFindChild(v17, v30, "cellStyleXfs");

    +[EXCellFormatTable readFromCellStyleXfsElement:v31 state:v6];
    v32 = [(OCXState *)v6 EXSpreadsheetMLNamespace];
    uint64_t v33 = OCXFindChild(v17, v32, "cellStyles");

    +[EXCellFormatTable readFromCellStylesElement:v33 state:v6];
    +[TCProgressContext advanceProgress:1.0];
    v34 = [(OCXState *)v6 EXSpreadsheetMLNamespace];
    uint64_t v35 = OCXFindChild(v17, v34, "dxfs");

    +[EXDifferentialStyleTable readFrom:v35 state:v6];
    v36 = [(OCXState *)v6 EXSpreadsheetMLNamespace];
    uint64_t v37 = OCXFindChild(v17, v36, "tableStyles");

    +[EXTableStyleTable readFrom:v37 state:v6];
    +[TCProgressContext advanceProgress:1.0];
  }
  else
  {
    +[EXFontTable setDefaultWithState:v6];
    +[EXFillTable setDefaultWithState:v6];
    +[EXBordersTable setDefaultWithState:v6];
    +[EXCellFormatTable setDefaultWithState:v6];
    +[TCProgressContext advanceProgress:7.0];
  }
  [a1 setupDefaultTextStyleWithState:v6];
}

+ (void)setupDefaultTextStyleWithState:(id)a3
{
  v4 = [a3 workbook];
  id v8 = [v4 defaultTextStyle];

  v5 = [v8 defaultProperties];
  [a1 setDefaultParagraphProperties:v5];

  for (uint64_t i = 0; i != 9; ++i)
  {
    v7 = [v8 propertiesForListLevel:i];
    [a1 setDefaultParagraphProperties:v7];
  }
}

+ (void)setDefaultParagraphProperties:(id)a3
{
  id v3 = a3;
  LODWORD(v4) = 11.0;
  id v6 = v3;
  [v3 setSize:v4];
  v5 = +[OADSolidFill blackFill];
  [v6 setFill:v5];

  [v6 setLatinFont:@"+mn-lt"];
  [v6 setEastAsianFont:@"+mn-ea"];
  [v6 setBidiFont:@"+mn-cs"];
}

+ (void)readStringsFrom:(id)a3 state:(id)a4
{
  char v14 = (OCPPackagePart *)a3;
  v5 = (OCXState *)a4;
  id v6 = [(OCPPackagePart *)v14 package];
  v7 = OCXPartRelationshipsByTypeWithFallback(v14, v5, (objc_selector *)sel_OCXSharedStringsRelationshipType);
  id v8 = [v7 objectAtIndex:0];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 targetLocation];
    v11 = [v6 partForLocation:v10];

    if (!v11
      || ([v11 contentType],
          v12 = objc_claimAutoreleasedReturnValue(),
          char v13 = [v12 isEqualToString:@"application/vnd.openxmlformats-officedocument.spreadsheetml.sharedStrings+xml"], v12, (v13 & 1) == 0))
    {
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    [(OCXState *)v5 setCurrentPart:v11];
    +[EXStringTable readFromState:v5];
  }
}

+ (id)edWorkbookFromState:(id)a3 package:(id)a4 reader:(id)a5 fileName:(id)a6 temporaryDirectory:(id)a7 delegate:(id)a8 forThumbnail:(BOOL)a9
{
  LOBYTE(v11) = a9;
  v9 = [a1 edWorkbookFromState:a3 package:a4 reader:a5 resourcesOnly:0 fileName:a6 temporaryDirectory:a7 delegate:a8 forThumbnail:v11];
  return v9;
}

+ (id)edWorkbookFromState:(id)a3 package:(id)a4 reader:(id)a5 resourcesOnly:(BOOL)a6 fileName:(id)a7 temporaryDirectory:(id)a8 delegate:(id)a9 forThumbnail:(BOOL)a10
{
  char v13 = (OCXState *)a3;
  id v66 = a5;
  id v67 = a7;
  id v65 = a8;
  id v68 = a9;
  char v14 = [(OCXState *)v13 workbookPart];
  v69 = [(OCPPackagePart *)v14 contentType];
  if (v69
    && ([v69 isEqualToString:@"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml"] & 1) == 0&& (objc_msgSend(v69, "isEqualToString:", @"application/vnd.ms-excel.sheet.macroEnabled.main+xml") & 1) == 0&& (objc_msgSend(v69, "isEqualToString:", @"application/vnd.openxmlformats-officedocument.spreadsheetml.template.main+xml") & 1) == 0&& (objc_msgSend(v69, "isEqualToString:", @"application/vnd.ms-excel.addin.macroEnabled.main+xml") & 1) == 0&& (objc_msgSend(v69, "isEqualToString:", @"application/vnd.ms-excel.template.macroEnabled.main+xml") & 1) == 0)
  {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  v15 = [(OCPPackagePart *)v14 xmlDocument];
  if (!v15) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  xmlNodePtr v16 = OCXGetRootElement(v15);
  v17 = v16;
  if (!v16 || !xmlStrEqual(v16->name, (const xmlChar *)"workbook"))
  {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
    uint64_t v21 = 0;
    goto LABEL_40;
  }
  id v72 = 0;
  CXOptionalStringAttribute(v17, (void *)CXNoNamespace, (xmlChar *)"conformance", &v72);
  id v62 = v72;
  if (v62 && [v62 isEqualToString:@"strict"]) {
    [(OCXState *)v13 setupNSForXMLFormat:1];
  }
  ns = v17->ns;
  if (!ns
    || (href = ns->href,
        [(OCXState *)v13 EXSpreadsheetMLNamespace],
        v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
        LODWORD(href) = CXXmlStrEqualToNsUriOrFallbackNsUri(href, v20),
        v20,
        !href))
  {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  uint64_t v21 = [[EDWorkbook alloc] initWithFileName:v67 andStringOptimization:0];
  [(OCDDocument *)v21 setReader:v66];
  [(EDWorkbook *)v21 setTemporaryDirectory:v65];
  v22 = [(EDWorkbook *)v21 processors];
  [a1 setupProcessors:v22];

  +[TCProgressContext createStageWithSteps:@"read globals" takingSteps:10.0 name:0.1];
  [(OCXState *)v13 setWorkbook:v21];
  uint64_t v23 = [(EDWorkbook *)v21 resources];
  [(OCXState *)v13 setResources:v23];

  v24 = [(OCXState *)v13 EXSpreadsheetMLNamespace];
  uint64_t v25 = (_xmlNode *)OCXFindChild(v17, v24, "workbookPr");

  if (v25)
  {
    BOOL v71 = 1;
    CXOptionalBoolAttribute(v25, (CXNamespace *)CXNoNamespace, (xmlChar *)"dateCompatibility", &v71);
    if (v71)
    {
      BOOL v70 = 0;
      CXOptionalBoolAttribute(v25, (CXNamespace *)CXNoNamespace, (xmlChar *)"date1904", &v70);
      if (v70) {
        uint64_t v26 = 2;
      }
      else {
        uint64_t v26 = 1;
      }
      [(EDWorkbook *)v21 setDateBase:v26];
    }
    else
    {
      [(EDWorkbook *)v21 setDateBase:0];
    }
  }
  else
  {
    [(EDWorkbook *)v21 setDateBase:1];
  }
  uint64_t v27 = [(OCXState *)v13 EXSpreadsheetMLNamespace];
  v28 = (_xmlNode *)OCXFindChild(v17, v27, "bookViews");

  if (v28
    && ([(OCXState *)v13 EXSpreadsheetMLNamespace],
        uint64_t v29 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
        v30 = (_xmlNode *)OCXFindChild(v28, v29, "workbookView"),
        v29,
        v30))
  {
    uint64_t v31 = CXDefaultLongAttribute(v30, (CXNamespace *)CXNoNamespace, (xmlChar *)"activeTab", 0);
  }
  else
  {
    uint64_t v31 = 0;
  }
  [(EDWorkbook *)v21 setActiveSheetIndex:v31];
  +[TCProgressContext advanceProgress:1.0];
  v32 = OCXFirstPartWithRelationshipOfTypeToPartWithFallback(v14, v13, (objc_selector *)sel_OCXThemeRelationshipType);
  if (v32
    || [(OCXState *)v13 xmlFormat] == 1
    && ([(OCPPackagePart *)v14 firstPartWithRelationshipOfType:@"http://schemas.openxmlformats.org/officeDocument/2006/relationships/theme"], (v32 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v33 = [(OCDDocument *)v21 theme];
    v34 = [(OCXState *)v13 officeArtState];
    +[OAXTheme readFromPackagePart:v32 toTheme:v33 state:v34];

    uint64_t v35 = [(OCDDocument *)v21 theme];
    v36 = [v35 baseStyles];
    uint64_t v37 = [v36 colorScheme];

    v38 = [(OCXState *)v13 officeArtState];
    [v38 setColorScheme:v37];

    v39 = [(OCXState *)v13 officeArtState];
    v40 = [(OCDDocument *)v21 theme];
    v41 = [v40 baseStyles];
    v42 = [v41 fontScheme];
    [v39 setFontScheme:v42];
  }
  else
  {
    v51 = [(OCDDocument *)v21 theme];
    int v52 = [v51 isEmpty];

    if (!v52)
    {
      v32 = 0;
      goto LABEL_34;
    }
    v53 = [(OCDDocument *)v21 theme];
    [v53 validateTheme];

    v54 = [(OCXState *)v13 officeArtState];
    v55 = [(OCDDocument *)v21 theme];
    v56 = [v55 baseStyles];
    v57 = [v56 styleMatrix];
    [v54 setStyleMatrix:v57];

    v58 = [(OCXState *)v13 officeArtState];
    v59 = [(OCDDocument *)v21 theme];
    v60 = [v59 baseStyles];
    v61 = [v60 colorScheme];
    [v58 setColorScheme:v61];

    uint64_t v37 = [(OCXState *)v13 officeArtState];
    v39 = [(OCDDocument *)v21 theme];
    v40 = [v39 baseStyles];
    v41 = [v40 fontScheme];
    [v37 setFontScheme:v41];
    v32 = 0;
  }

LABEL_34:
  [a1 readStylesFrom:v14 state:v13];
  if (a6)
  {
    +[TCProgressContext advanceProgress:2.0];
  }
  else
  {
    v43 = [(OCXState *)v13 EXSpreadsheetMLNamespace];
    uint64_t v44 = OCXFindChild(v17, v43, "definedNames");

    +[EXNameTable readFrom:v44 state:v13];
    +[TCProgressContext advanceProgress:1.0];
    [a1 readStringsFrom:v14 state:v13];
    +[TCProgressContext advanceProgress:1.0];
  }
  +[TCProgressContext endStage];
  +[TCProgressContext createStageWithSteps:@"read sheets" takingSteps:1.0 name:0.9];
  v45 = [(OCPPackagePart *)v14 xmlDocument];
  v46 = [(OCXState *)v13 OCXRelationshipsNamespace];
  xmlNsPtr v47 = CXXmlSearchNsByHrefWithFallbackNs(v45, v17, v46);

  [(OCXState *)v13 relationshipNameSpaceForWorkbook:v47];
  if (!a6) {
    [a1 readSheetsFrom:v14 relationNS:v47 state:v13 delegate:v68 forThumbnail:a10];
  }
  +[TCProgressContext endStage];
  v48 = [(OCDDocument *)v21 summary];
  v49 = [(OCPPackagePart *)v14 package];
  +[OCXSummary readSummary:v48 package:v49];

  [v68 readerDidEndDocument:v21];
LABEL_40:

  return v21;
}

+ (void)readSheetsFrom:(id)a3 relationNS:(_xmlNs *)a4 state:(id)a5 delegate:(id)a6 forThumbnail:(BOOL)a7
{
  BOOL v29 = a7;
  id v9 = a3;
  id v10 = a5;
  id v30 = a6;
  v28 = v9;
  uint64_t v11 = (_xmlDoc *)[v9 xmlDocument];
  if (!v11) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  xmlNodePtr v12 = OCXGetRootElement(v11);
  char v13 = v12;
  if (!v12 || !xmlStrEqual(v12->name, (const xmlChar *)"workbook")) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  char v14 = [v10 EXSpreadsheetMLNamespace];
  v15 = (_xmlNode *)OCXFindChild(v13, v14, "sheets");

  if (!v15) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  xmlNodePtr v16 = [v10 EXSpreadsheetMLNamespace];
  int v17 = CXCountChildren(v15, v16, (xmlChar *)"sheet");

  +[TCProgressContext createStageWithSteps:@"read sheets" takingSteps:(double)v17 name:1.0];
  v18 = [v10 workbook];
  [v30 readerDidStartDocument:v18 withElementCount:v17];

  uint64_t v19 = [v10 EXSpreadsheetMLNamespace];
  Child = (_xmlNode *)OCXFindChild(v15, v19, "sheet");

  if (Child)
  {
    uint64_t v21 = 0;
    do
    {
      if ([v10 isCancelled]) {
        +[TCMessageException raiseUntaggedMessage:@"TCUserCancelled", 0];
      }
      id v31 = 0;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"state", &v31);
      id v22 = v31;
      uint64_t v23 = v22;
      if (v22 && [v22 isEqualToString:@"veryHidden"])
      {
        LODWORD(v21) = v21 - 1;
      }
      else
      {
        [v10 setCurrentSheetIndex:v21];
        +[EXSheet readFrom:Child state:v10];
        v24 = [v10 workbook];
        uint64_t v25 = [v24 sheetAtIndex:(int)v21];

        uint64_t v26 = [v10 workbook];
        [v30 readerDidReadElement:v25 atIndex:(int)v21 inDocument:v26 isLastElement:v21 == v17 - 1];

        if (v29 && ([v25 isHidden] & 1) == 0)
        {

          break;
        }
      }
      uint64_t v27 = [v10 EXSpreadsheetMLNamespace];
      Child = OCXFindNextChild(Child, v27, (xmlChar *)"sheet");
      uint64_t v21 = (v21 + 1);
    }
    while (Child);
  }
  +[TCProgressContext endStage];
}

@end