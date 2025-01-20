@interface EXSheet
+ (Class)exSheetClassFromXmlSheetType:(id)a3 location:(id)a4;
+ (void)readAllDrawablesWithState:(id)a3;
+ (void)readCommonSheetElementsFrom:(_xmlTextReader *)a3 state:(id)a4;
+ (void)readDelayedSheeWithLocation:(id)a3 sheetXmlType:(id)a4 state:(id)a5;
+ (void)readDrawablesWithState:(id)a3;
+ (void)readFrom:(_xmlNode *)a3 state:(id)a4;
+ (void)readLegacyDrawablesWithState:(id)a3;
+ (void)readSheetProperties:(_xmlNode *)a3 state:(id)a4;
@end

@implementation EXSheet

+ (void)readFrom:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  [v6 resetForNewSheet];
  v25 = [v6 workbookPart];
  v7 = [v6 OCXReadRequiredRelationshipForNode:a3 packagePart:v25];
  v8 = [v25 package];
  if (!v8) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  v9 = [v7 targetLocation];
  v10 = [v8 partForLocation:v9];

  if (!v10) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  v11 = [v10 location];
  v26 = [v11 relativeString];

  id v29 = 0;
  CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"type", &v29);
  id v12 = v29;
  v13 = (void *)[a1 exSheetClassFromXmlSheetType:v12 location:v26];
  if (v13)
  {
    [v6 setCurrentPart:v10];
    v14 = [v13 edSheetWithState:v6];
    id v28 = 0;
    BOOL v15 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"name", &v28);
    id v24 = v28;
    if (v15)
    {
      v16 = +[EDString edStringWithString:v24];
      [v14 setName:v16];
    }
    id v27 = 0;
    CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"state", &v27);
    id v17 = v27;
    v18 = v17;
    if (v17
      && (([v17 isEqualToString:@"hidden"] & 1) != 0
       || [v18 isEqualToString:@"veryHidden"]))
    {
      [v14 setHidden:1];
    }
    v19 = [EXSheetContext alloc];
    v20 = [v7 targetLocation];
    v21 = [(EXSheetContext *)v19 initWithSheetLocation:v20 sheetXmlType:v12 state:v6];

    [v14 setDelayedContext:v21];
    v22 = [v6 workbook];
    [v22 addSheet:v14];

    [v6 setCurrentSheet:v14];
    [v13 readTables:v6];
    [v6 setCurrentSheet:0];
    [v6 setCurrentPart:0];
    v23 = [v7 targetLocation];
    [v8 resetPartForLocation:v23];
  }
}

+ (Class)exSheetClassFromXmlSheetType:(id)a3 location:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (([v5 isEqualToString:@"work"] & 1) == 0
      && ([v5 isEqualToString:@"chartsheet"] & 1) == 0
      && ([v5 isEqualToString:@"macrosheet"] & 1) == 0
      && ([v5 isEqualToString:@"dialogsheet"] & 1) == 0
      && ![v5 isEqualToString:@"basic"])
    {
LABEL_7:
      v8 = 0;
      goto LABEL_19;
    }
  }
  else if (([v6 hasPrefix:@"chartsheets"] & 1) == 0 {
         && ([v7 hasPrefix:@"worksheets"] & 1) == 0
  }
         && [v7 rangeOfString:@"/worksheets"] == 0x7FFFFFFFFFFFFFFFLL
         && ([v7 hasPrefix:@"dialogsheets"] & 1) == 0
         && ([v7 hasPrefix:@"macrosheets"] & 1) == 0
         && ([v7 hasPrefix:@"basics"] & 1) == 0
         && (![v7 hasSuffix:@".xml"]
          || [v7 rangeOfString:@"/"] != 0x7FFFFFFFFFFFFFFFLL))
  {
    goto LABEL_7;
  }
  v8 = objc_opt_class();
LABEL_19:

  return (Class)v8;
}

+ (void)readDelayedSheeWithLocation:(id)a3 sheetXmlType:(id)a4 state:(id)a5
{
  id v25 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x23EC9A170]();
  +[TCProgressContext createStageWithSteps:@"read sheet" takingSteps:3.0 name:1.0];
  [v9 resetForNewSheet];
  v22 = [v9 workbookPart];
  v11 = [v22 package];
  v23 = v11;
  if (!v11) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  id v12 = [v11 partForLocation:v25];
  id v24 = v12;
  if (!v12) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  v13 = [v12 location];
  uint64_t v14 = [v13 relativeString];

  v21 = (void *)v14;
  BOOL v15 = (void *)[a1 exSheetClassFromXmlSheetType:v8 location:v14];
  if (v15)
  {
    [v9 setCurrentPart:v24];
    [v15 readOtherSheetComponentsWithState:v9];
    v16 = (xmlTextReader *)[v24 xmlReader];
    if (!v16) {
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    +[TCProgressContext createStageWithSteps:@"read common sheet elements outer" takingSteps:1.0 name:1.0];
    id v17 = objc_alloc_init(OCXSStream);
    uint64_t v18 = xmlTextReaderDepth(v16);
    [(OCXSStream *)v17 pushLevel:v18 name:xmlTextReaderConstLocalName(v16)];
    int v19 = -1;
    while (+[OCXStreamUtility readStream:v16 streamState:v17])
    {
      +[TCProgressContext createStageWithSteps:@"read common sheet elements inner" takingSteps:2.0 name:(double)ldexp(1.0, v19)];
      if (([v15 readDistinctSheetElementsFrom:v16 state:v9] & 1) == 0) {
        [a1 readCommonSheetElementsFrom:v16 state:v9];
      }
      --v19;
      +[TCProgressContext endStage];
    }
    +[TCProgressContext endStage];
    [a1 readAllDrawablesWithState:v9];
    v20 = [v9 currentSheet];
    +[EXFormula applyArrayedFormulasToSheet:v20 state:v9];

    [v9 setCurrentPart:0];
    [v23 resetPartForLocation:v25];
    +[TCProgressContext endStage];
  }
  else
  {
    id v17 = 0;
    v16 = 0;
  }

  if (v16) {
    xmlFreeTextReader(v16);
  }
}

+ (void)readCommonSheetElementsFrom:(_xmlTextReader *)a3 state:(id)a4
{
  id v6 = a4;
  v7 = xmlTextReaderConstLocalName(a3);
  if (v7) {
    id v8 = xmlTextReaderExpand(a3);
  }
  else {
    id v8 = 0;
  }
  if (xmlStrEqual(v7, (const xmlChar *)"sheetProtection") && v8)
  {
    id v13 = 0;
    BOOL v9 = CXOptionalStringAttribute(v8, (void *)CXNoNamespace, (xmlChar *)"password", &v13);
    id v10 = v13;
    if (v9) {
      [v6 reportWarning:ECPasswordProtectedSheet];
    }
  }
  if (xmlStrEqual(v7, (const xmlChar *)"headerFooter"))
  {
    v11 = [v6 currentSheet];
    id v12 = +[EXHeaderFooter edHeaderFooterFromXmlHeaderFooterElement:v8 state:v6];
    [v11 setHeaderFooter:v12];
LABEL_15:

    goto LABEL_16;
  }
  if (xmlStrEqual(v7, (const xmlChar *)"pageMargins"))
  {
    v11 = [v6 currentSheet];
    id v12 = +[EXPageSetup edPageMarginsFrom:v8 state:v6];
    [v11 setPageSetup:v12];
    goto LABEL_15;
  }
  if (xmlStrEqual(v7, (const xmlChar *)"pageSetup"))
  {
    v11 = [v6 currentSheet];
    id v12 = +[EXPageSetup edPageSetupFrom:v8 state:v6];
    [v11 setPageSetup:v12];
    goto LABEL_15;
  }
  if (xmlStrEqual(v7, (const xmlChar *)"sheetPr"))
  {
    [a1 readSheetProperties:v8 state:v6];
  }
  else if (xmlStrEqual(v7, (const xmlChar *)"legacyDrawing"))
  {
    [a1 readLegacyDrawablesWithState:v6];
  }
LABEL_16:
}

+ (void)readAllDrawablesWithState:(id)a3
{
  id v11 = a3;
  v4 = [v11 legacyDrawables];
  [a1 readDrawablesWithState:v11];
  for (unsigned int i = 0; ; unsigned int i = v6 + 1)
  {
    unsigned int v6 = i;
    if ([v4 count] <= (unint64_t)i) {
      break;
    }
    v7 = [v4 objectAtIndex:i];
    id v8 = [v11 oavState];
    char v9 = [v8 isDualDrawable:v7];

    if ((v9 & 1) == 0)
    {
      id v10 = [v11 currentSheet];
      [v10 addDrawable:v7];
    }
  }
}

+ (void)readDrawablesWithState:(id)a3
{
  id v12 = (OCXState *)a3;
  v3 = [(OCXState *)v12 currentPart];
  v4 = OCXPartRelationshipsByTypeWithFallback(v3, v12, (objc_selector *)sel_OCXDrawingRelationshipType);
  id v5 = v4;
  if (v4 && [v4 count])
  {
    unsigned int v6 = [(OCPPackagePart *)v3 package];
    if (!v6 || [v5 count] != 1) {
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    v7 = [v5 objectAtIndex:0];
    id v8 = [v7 targetLocation];
    char v9 = [v6 partForLocation:v8];

    if (!v9) {
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    +[EXDrawing readFromPart:v9 state:v12];
    id v10 = [v5 objectAtIndex:0];
    id v11 = [v10 targetLocation];
    [v6 resetPartForLocation:v11];
  }
}

+ (void)readLegacyDrawablesWithState:(id)a3
{
  id v20 = a3;
  v3 = [v20 currentPart];
  v4 = [v3 relationshipsByType:@"http://schemas.openxmlformats.org/officeDocument/2006/relationships/vmlDrawing"];
  id v5 = v4;
  if (v4 && [v4 count])
  {
    unsigned int v6 = [v3 package];
    if (!v6) {
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    uint64_t v18 = v3;
    int v19 = [v20 legacyDrawables];
    for (unsigned int i = 0; [v5 count] > (unint64_t)i; ++i)
    {
      id v8 = [v5 objectAtIndex:i];
      char v9 = [v8 targetLocation];
      id v10 = [v6 partForLocation:v9];

      if (!v10) {
        +[TCMessageException raise:TCInvalidFileFormatMessage];
      }
      id v11 = +[OAVDrawable vmlDocumentFromPart:v10];
      if (!v11) {
        +[TCMessageException raise:TCInvalidFileFormatMessage];
      }
      xmlNodePtr v12 = OCXGetRootElement(v11);
      if (!v12) {
        +[TCMessageException raise:TCInvalidFileFormatMessage];
      }
      id v13 = [v20 oavState];
      [v13 setPackagePart:v10];
      uint64_t v14 = [v20 EXSpreadsheetDrawingNamespace];
      BOOL v15 = +[OAVDrawable readDrawablesFromParent:v12 inNamespace:v14 state:v13];
      [v19 addObjectsFromArray:v15];

      v16 = [v5 objectAtIndex:i];
      id v17 = [v16 targetLocation];
      [v6 resetPartForLocation:v17];

      xmlFreeDoc(v11);
    }

    v3 = v18;
  }
}

+ (void)readSheetProperties:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [v5 EXSpreadsheetMLNamespace];
  v7 = (_xmlNode *)OCXFindChild(a3, v6, "pageSetUpPr");

  if (v7)
  {
    BOOL v11 = 0;
    if (CXOptionalBoolAttribute(v7, (CXNamespace *)CXNoNamespace, (xmlChar *)"fitToPage", &v11))
    {
      uint64_t v8 = objc_opt_class();
      char v9 = [v5 currentSheet];
      id v10 = TSUDynamicCast(v8, (uint64_t)v9);

      [v10 setFitToPage:v11];
    }
  }
}

@end