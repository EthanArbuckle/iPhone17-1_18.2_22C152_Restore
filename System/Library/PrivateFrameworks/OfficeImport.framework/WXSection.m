@interface WXSection
+ (TCEnumerationMap)chapterNumberSeparatorEnumMap;
+ (TCEnumerationMap)lineNumberRestartEnumMap;
+ (TCEnumerationMap)pageBorderDepthEnumMap;
+ (TCEnumerationMap)pageBorderDisplayEnumMap;
+ (TCEnumerationMap)pageBorderOffsetEnumMap;
+ (TCEnumerationMap)pageOrientationEnumMap;
+ (TCEnumerationMap)sectionBreakEnumMap;
+ (TCEnumerationMap)verticalJustificationEnumMap;
+ (float)scaleFromPrinterSettings:(id)a3;
+ (void)mapFooter:(_xmlNode *)a3 toSection:(id)a4 state:(id)a5;
+ (void)mapHeader:(_xmlNode *)a3 toSection:(id)a4 state:(id)a5;
+ (void)mapPrinterSettings:(_xmlNode *)a3 toSection:(id)a4 state:(id)a5;
+ (void)mapProperties:(_xmlNode *)a3 toSection:(id)a4 state:(id)a5;
+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5;
@end

@implementation WXSection

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v24 = a4;
  id v8 = a5;
  [v24 setResolveMode:0];
  v9 = [v8 WXMainNamespace];
  Child = (_xmlNode *)OCXFindChild(a3, v9, "headerReference");

  while (Child)
  {
    [a1 mapHeader:Child toSection:v24 state:v8];
    v11 = [v8 WXMainNamespace];
    Child = OCXFindNextChild(Child, v11, (xmlChar *)"headerReference");
  }
  v12 = [v8 WXMainNamespace];
  v13 = (_xmlNode *)OCXFindChild(a3, v12, "footerReference");

  while (v13)
  {
    [a1 mapFooter:v13 toSection:v24 state:v8];
    v14 = [v8 WXMainNamespace];
    v13 = OCXFindNextChild(v13, v14, (xmlChar *)"footerReference");
  }
  v15 = [v8 WXMainNamespace];
  uint64_t v16 = OCXFindChild(a3, v15, "printerSettings");

  if (v16) {
    [a1 mapPrinterSettings:v16 toSection:v24 state:v8];
  }
  [a1 mapProperties:a3 toSection:v24 state:v8];
  v17 = [v8 WXMainNamespace];
  v18 = (_xmlNode *)OCXFindChild(a3, v17, "sectPrChange");

  if (v18)
  {
    v19 = [v8 WXMainNamespace];
    uint64_t v20 = OCXFindChild(v18, v19, "sectPr");

    if (v20)
    {
      [v24 setResolveMode:1];
      [a1 mapProperties:a3 toSection:v24 state:v8];
      [v24 setFormattingChanged:1];
      v21 = wmxmlGetDateProperty(v18);
      [v24 setFormattingChangeDate:v21];

      v22 = [v8 document];
      v23 = wmxmlGetAuthorProperty(v18);
      objc_msgSend(v24, "setIndexToAuthorIDOfFormattingChange:", (unsigned __int16)objc_msgSend(v22, "revisionAuthorAddLookup:", v23));

      [v24 setResolveMode:0];
      [a1 mapProperties:v20 toSection:v24 state:v8];
    }
  }
  [v24 setResolveMode:2];
}

+ (void)mapHeader:(_xmlNode *)a3 toSection:(id)a4 state:(id)a5
{
  id v31 = a4;
  id v7 = a5;
  context = (void *)MEMORY[0x23EC9A170]();
  id v8 = [v7 wxoavState];
  v9 = [v8 packagePart];
  v10 = [v7 OCXReadRequiredRelationshipForNode:a3 packagePart:v9];

  v30 = v10;
  v29 = [v10 identifier];
  v11 = [v7 packagePart];
  v12 = [v11 package];

  v13 = [v7 packagePart];
  v14 = [v13 relationshipForIdentifier:v29];

  v15 = [v14 targetLocation];
  uint64_t v16 = [v12 partForLocation:v15];

  v32 = [v7 packagePart];
  [v7 setPackagePart:v16];
  v17 = [v7 wxoavState];
  v18 = [v17 packagePart];
  [v17 setPackagePart:v16];
  v19 = [v7 drawingState];
  uint64_t v20 = [v19 packagePart];
  [v19 setPackagePart:v16];
  v21 = (xmlTextReader *)[v16 xmlReader];
  v22 = v21;
  if (v21 && xmlTextReaderRead(v21) == 1 && xmlTextReaderNodeType(v22) == 1)
  {
    Prop = xmlGetProp(a3, (const xmlChar *)"type");
    if (xmlStrcmp(Prop, (const xmlChar *)"even"))
    {
      if (xmlStrcmp(Prop, (const xmlChar *)"default"))
      {
        if (!xmlStrcmp(Prop, (const xmlChar *)"first"))
        {
          v25 = [v31 firstPageHeader];
          +[WXText readFromStream:v22 baseStyle:0 to:v25 state:v7];
        }
      }
      else
      {
        v27 = [v31 oddPageHeader];
        +[WXText readFromStream:v22 baseStyle:0 to:v27 state:v7];
      }
    }
    else
    {
      v26 = [v31 evenPageHeader];
      +[WXText readFromStream:v22 baseStyle:0 to:v26 state:v7];
    }
    ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(Prop);
  }
  [v17 setPackagePart:v18];
  [v19 setPackagePart:v20];
  [v7 setPackagePart:v32];
  id v24 = [v14 targetLocation];
  [v12 resetPartForLocation:v24];

  xmlFreeTextReader(v22);
}

+ (void)mapProperties:(_xmlNode *)a3 toSection:(id)a4 state:(id)a5
{
  id v7 = a4;
  id v8 = (WXReadState *)a5;
  v9 = [(WXReadState *)v8 WXMainNamespace];
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "pgBorders");

  if (v10)
  {
    v11 = [(WXReadState *)v8 WXMainNamespace];
    v12 = (_xmlNode *)OCXFindChild(v10, v11, "top");

    if (v12)
    {
      v13 = [v7 mutableTopBorder];
      +[WXBorder readFrom:v12 to:v13 state:v8];

      v14 = [(OCXState *)v8 OCXRelationshipsNamespace];
      id v133 = 0;
      CXOptionalStringAttribute(v12, v14, (xmlChar *)"id", &v133);
      id v15 = v133;

      uint64_t v16 = [(OCXState *)v8 OCXRelationshipsNamespace];
      id v132 = 0;
      CXOptionalStringAttribute(v12, v16, (xmlChar *)"topLeft", &v132);
      id v17 = v132;

      v18 = [(OCXState *)v8 OCXRelationshipsNamespace];
      uint64_t v131 = 0;
      CXOptionalStringAttribute(v12, v18, (xmlChar *)"topRight", &v131);
    }
    v19 = [(WXReadState *)v8 WXMainNamespace];
    uint64_t v20 = (_xmlNode *)OCXFindChild(v10, v19, "left");

    if (v20)
    {
      v21 = [v7 mutableLeftBorder];
      +[WXBorder readFrom:v20 to:v21 state:v8];

      v22 = [(OCXState *)v8 OCXRelationshipsNamespace];
      uint64_t v130 = 0;
      CXOptionalStringAttribute(v20, v22, (xmlChar *)"id", &v130);
    }
    v23 = [(WXReadState *)v8 WXMainNamespace];
    id v24 = (_xmlNode *)OCXFindChild(v10, v23, "bottom");

    if (v24)
    {
      v25 = [v7 mutableBottomBorder];
      +[WXBorder readFrom:v24 to:v25 state:v8];

      v26 = [(OCXState *)v8 OCXRelationshipsNamespace];
      id v129 = 0;
      CXOptionalStringAttribute(v24, v26, (xmlChar *)"id", &v129);
      id v27 = v129;

      v28 = [(OCXState *)v8 OCXRelationshipsNamespace];
      id v128 = 0;
      CXOptionalStringAttribute(v24, v28, (xmlChar *)"bottomLeft", &v128);
      id v29 = v128;

      v30 = [(OCXState *)v8 OCXRelationshipsNamespace];
      uint64_t v127 = 0;
      CXOptionalStringAttribute(v24, v30, (xmlChar *)"bottomRight", &v127);
    }
    id v31 = [(WXReadState *)v8 WXMainNamespace];
    v32 = (_xmlNode *)OCXFindChild(v10, v31, "right");

    if (v32)
    {
      v33 = [v7 mutableRightBorder];
      +[WXBorder readFrom:v32 to:v33 state:v8];

      v34 = [(OCXState *)v8 OCXRelationshipsNamespace];
      uint64_t v126 = 0;
      CXOptionalStringAttribute(v32, v34, (xmlChar *)"id", &v126);
    }
  }
  v35 = [(WXReadState *)v8 WXMainNamespace];
  v36 = (_xmlNode *)OCXFindChild(a3, v35, "cols");

  if (v36)
  {
    uint64_t v134 = 0;
    v37 = [(WXReadState *)v8 WXMainNamespace];
    v38 = (_xmlNode *)OCXFindChild(a3, v37, "cols");

    v39 = [(WXReadState *)v8 WXMainNamespace];
    BOOL v40 = CXOptionalLongAttribute(v38, v39, (xmlChar *)"num", &v134);

    if (v40) {
      [v7 setColumnCount:(unsigned __int16)v134];
    }
    [v7 isColumnCountOverridden];
    uint64_t v125 = 0;
    v41 = [(WXReadState *)v8 WXMainNamespace];
    BOOL v42 = CXOptionalLongAttribute(v38, v41, (xmlChar *)"space", &v125, 14);

    if (v42) {
      [v7 setColumnSpace:v125];
    }
    v43 = [(WXReadState *)v8 WXMainNamespace];
    id v124 = 0;
    BOOL v44 = CXOptionalStringAttribute(v36, v43, (xmlChar *)"equalWidth", &v124);
    id v45 = v124;

    if (v44) {
      objc_msgSend(v7, "setColumnsEqualWidth:", objc_msgSend(v45, "isEqualToString:", @"0") ^ 1);
    }
    if ([v7 isColumnsEqualWidthOverridden])
    {
      if (([v7 columnsEqualWidth] & 1) == 0)
      {
        v46 = [(WXReadState *)v8 WXMainNamespace];
        Child = (_xmlNode *)OCXFindChild(v36, v46, "col");

        while (Child)
        {
          v48 = [(WXReadState *)v8 WXMainNamespace];
          unsigned int v49 = CXDefaultLongAttribute(Child, v48, (xmlChar *)"w", 0, 14);

          [v7 appendColumnWidth:v49];
          v50 = [(WXReadState *)v8 WXMainNamespace];
          unsigned int v51 = CXDefaultLongAttribute(Child, v50, (xmlChar *)"space", 0, 14);

          [v7 appendColumnSpace:v51];
          v52 = [(WXReadState *)v8 WXMainNamespace];
          Child = OCXFindNextChild(Child, v52, (xmlChar *)"col");
        }
      }
    }
  }
  BOOL v123 = 0;
  if (wmxmlGetBoolOnlyProperty(a3, "titlePg", (const xmlChar *)"val", &v123, v8)) {
    [v7 setTitlePage:v123];
  }
  v53 = [(WXReadState *)v8 WXMainNamespace];
  v54 = (_xmlNode *)OCXFindChild(a3, v53, "bidi");

  if (v54)
  {
    v55 = [(WXReadState *)v8 WXMainNamespace];
    uint64_t v56 = CXDefaultLongAttribute(v54, v55, (xmlChar *)"val", 1);

    [v7 setBidi:v56 == 1];
  }
  v57 = [(WXReadState *)v8 WXMainNamespace];
  uint64_t v58 = OCXFindChild(a3, v57, "rtlGutter");

  if (v58) {
    [v7 setRtlGutter:1];
  }
  v59 = [(WXReadState *)v8 WXMainNamespace];
  v60 = (_xmlNode *)OCXFindChild(a3, v59, "pgSz");

  if (v60)
  {
    v61 = [(WXReadState *)v8 WXMainNamespace];
    v62 = CXRequiredLongAttribute(v60, v61, (xmlChar *)"w", 14);

    if ((uint64_t)v62 >= 0) {
      uint64_t v63 = (uint64_t)v62;
    }
    else {
      uint64_t v63 = 12240;
    }
    [v7 setPageWidth:v63];
    v64 = [(WXReadState *)v8 WXMainNamespace];
    v65 = CXRequiredLongAttribute(v60, v64, (xmlChar *)"h", 14);

    if ((uint64_t)v65 >= 0) {
      uint64_t v66 = (uint64_t)v65;
    }
    else {
      uint64_t v66 = 15840;
    }
    [v7 setPageHeight:v66];
  }
  uint64_t v125 = 0;
  v67 = [(WXReadState *)v8 WXMainNamespace];
  v68 = (_xmlNode *)OCXFindChild(a3, v67, "pgMar");

  if (v68)
  {
    v69 = [(WXReadState *)v8 WXMainNamespace];
    uint64_t v125 = (uint64_t)CXRequiredLongAttribute(v68, v69, (xmlChar *)"left", 14);

    [v7 setLeftMargin:v125];
    v70 = [(WXReadState *)v8 WXMainNamespace];
    uint64_t v125 = (uint64_t)CXRequiredLongAttribute(v68, v70, (xmlChar *)"right", 14);

    [v7 setRightMargin:v125];
    v71 = [(WXReadState *)v8 WXMainNamespace];
    uint64_t v125 = (uint64_t)CXRequiredLongAttribute(v68, v71, (xmlChar *)"top", 14);

    [v7 setTopMargin:v125];
    v72 = [(WXReadState *)v8 WXMainNamespace];
    uint64_t v125 = (uint64_t)CXRequiredLongAttribute(v68, v72, (xmlChar *)"bottom", 14);

    [v7 setBottomMargin:v125];
    v73 = [(WXReadState *)v8 WXMainNamespace];
    uint64_t v74 = CXDefaultLongAttribute(v68, v73, (xmlChar *)"header", 720, 14);

    [v7 setHeaderMargin:v74];
    v75 = [(WXReadState *)v8 WXMainNamespace];
    uint64_t v76 = CXDefaultLongAttribute(v68, v75, (xmlChar *)"footer", 720, 14);

    [v7 setFooterMargin:v76];
    v77 = [(WXReadState *)v8 WXMainNamespace];
    v78 = CXRequiredLongAttribute(v68, v77, (xmlChar *)"gutter", 14);

    [v7 setGutterMargin:v78];
  }
  v79 = [(WXReadState *)v8 WXMainNamespace];
  v80 = (_xmlNode *)OCXFindChild(a3, v79, "lnNumType");

  v81 = [(WXReadState *)v8 WXMainNamespace];
  BOOL v82 = CXOptionalLongAttribute(v80, v81, (xmlChar *)"start", &v125);

  if (v82) {
    [v7 setLineNumberStart:(__int16)v125];
  }
  v83 = [(WXReadState *)v8 WXMainNamespace];
  BOOL v84 = CXOptionalLongAttribute(v80, v83, (xmlChar *)"countBy", &v125);

  if (v84) {
    [v7 setLineNumberIncrement:(unsigned __int16)v125];
  }
  v85 = [(WXReadState *)v8 WXMainNamespace];
  BOOL v86 = CXOptionalLongAttribute(v80, v85, (xmlChar *)"distance", &v125, 14);

  if (v86) {
    [v7 setLineNumberDistance:(__int16)v125];
  }
  v87 = [(WXReadState *)v8 WXMainNamespace];
  v88 = (xmlNode *)OCXFindChild(a3, v87, "pgNumType");

  v89 = [(WXReadState *)v8 WXMainNamespace];
  BOOL v90 = CXOptionalLongAttribute(v88, v89, (xmlChar *)"start", &v125);

  if (v90)
  {
    [v7 setPageNumberStart:(unsigned __int16)v125];
    [v7 setPageNumberRestart:1];
  }
  id v91 = +[WXCommon numberFormatEnumMap];
  uint64_t v134 = 0;
  BOOL NSStringAnyNsProp = sfaxmlGetNSStringAnyNsProp(v88, (const xmlChar *)"fmt", &v134);
  id v93 = (id)v134;
  if (NSStringAnyNsProp) {
    uint64_t v94 = (int)[v91 valueForString:v93];
  }
  else {
    uint64_t v94 = -130883970;
  }

  if (v94 != -130883970) {
    [v7 setPageNumberFormat:v94];
  }
  LODWORD(v134) = 0;
  v95 = +[WXCommon textDirectionEnumMap];
  if (readEnumProperty<WDTextDirection>(a3, "textDirection", (const xmlChar *)"val", v95, &v134, v8))
  {
  }
  else
  {
    v96 = +[WXCommon strictTextDirectionEnumMap];
    int v97 = readEnumProperty<WDTextDirection>(a3, "textDirection", (const xmlChar *)"val", v96, &v134, v8);

    if (!v97) {
      goto LABEL_55;
    }
  }
  [v7 setTextDirection:v134];
LABEL_55:
  unsigned int v122 = 0;
  v98 = [a1 sectionBreakEnumMap];
  int v99 = readEnumProperty<WDSectionBreakType>(a3, "type", (const xmlChar *)"val", v98, &v122, v8);

  if (v99) {
    [v7 setBreakType:v122];
  }
  unsigned int v121 = 0;
  v100 = [a1 pageOrientationEnumMap];
  int v101 = readEnumProperty<WDPageOrientation>(a3, "pgSz", (const xmlChar *)"orient", v100, &v121, v8);

  if (v101) {
    [v7 setPageOrientation:v121];
  }
  unsigned int v120 = 0;
  v102 = [a1 pageBorderDepthEnumMap];
  int v103 = readEnumProperty<WDPageBorderDepth>(a3, "pgBorders", (const xmlChar *)"zOrder", v102, &v120, v8);

  if (v103) {
    [v7 setBorderDepth:v120];
  }
  unsigned int v119 = 0;
  v104 = [a1 pageBorderDisplayEnumMap];
  int v105 = readEnumProperty<WDPageBorderDisplay>(a3, "pgBorders", (const xmlChar *)"display", v104, &v119, v8);

  if (v105) {
    [v7 setBorderDisplay:v119];
  }
  unsigned int v118 = 0;
  v106 = [a1 pageBorderOffsetEnumMap];
  int v107 = readEnumProperty<WDPageBorderOffset>(a3, "pgBorders", (const xmlChar *)"offsetFrom", v106, &v118, v8);

  if (v107) {
    [v7 setBorderOffset:v118];
  }
  unsigned int v117 = 0;
  v108 = [a1 lineNumberRestartEnumMap];
  int v109 = readEnumProperty<WDLineNumberRestart>(a3, "lnNumType", (const xmlChar *)"restart", v108, &v117, v8);

  if (v109) {
    [v7 setLineNumberRestart:v117];
  }
  unsigned int v116 = 0;
  v110 = [a1 verticalJustificationEnumMap];
  int v111 = readEnumProperty<WDVerticalJustification>(a3, "vAlign", (const xmlChar *)"val", v110, &v116, v8);

  if (v111) {
    [v7 setVerticalJustification:v116];
  }
  unsigned int v115 = 0;
  v112 = [a1 chapterNumberSeparatorEnumMap];
  int v113 = readEnumProperty<WDChapterNumberSeparator>(a3, "pgNumType", (const xmlChar *)"chapSep", v112, &v115, v8);

  if (v113) {
    [v7 setChapterNumberSeparator:v115];
  }
}

+ (void)mapFooter:(_xmlNode *)a3 toSection:(id)a4 state:(id)a5
{
  id v31 = a4;
  id v7 = a5;
  context = (void *)MEMORY[0x23EC9A170]();
  id v8 = [v7 wxoavState];
  v9 = [v8 packagePart];
  v10 = [v7 OCXReadRequiredRelationshipForNode:a3 packagePart:v9];

  v30 = v10;
  id v29 = [v10 identifier];
  v11 = [v7 packagePart];
  v12 = [v11 package];

  v13 = [v7 packagePart];
  v14 = [v13 relationshipForIdentifier:v29];

  id v15 = [v14 targetLocation];
  uint64_t v16 = [v12 partForLocation:v15];

  v32 = [v7 packagePart];
  [v7 setPackagePart:v16];
  id v17 = [v7 wxoavState];
  v18 = [v17 packagePart];
  [v17 setPackagePart:v16];
  v19 = [v7 drawingState];
  uint64_t v20 = [v19 packagePart];
  [v19 setPackagePart:v16];
  v21 = (xmlTextReader *)[v16 xmlReader];
  v22 = v21;
  if (v21 && xmlTextReaderRead(v21) == 1 && xmlTextReaderNodeType(v22) == 1)
  {
    Prop = xmlGetProp(a3, (const xmlChar *)"type");
    if (xmlStrcmp(Prop, (const xmlChar *)"even"))
    {
      if (xmlStrcmp(Prop, (const xmlChar *)"default"))
      {
        if (!xmlStrcmp(Prop, (const xmlChar *)"first"))
        {
          v25 = [v31 firstPageFooter];
          +[WXText readFromStream:v22 baseStyle:0 to:v25 state:v7];
        }
      }
      else
      {
        id v27 = [v31 oddPageFooter];
        +[WXText readFromStream:v22 baseStyle:0 to:v27 state:v7];
      }
    }
    else
    {
      v26 = [v31 evenPageFooter];
      +[WXText readFromStream:v22 baseStyle:0 to:v26 state:v7];
    }
    ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(Prop);
  }
  [v17 setPackagePart:v18];
  [v19 setPackagePart:v20];
  [v7 setPackagePart:v32];
  id v24 = [v14 targetLocation];
  [v12 resetPartForLocation:v24];

  xmlFreeTextReader(v22);
}

+ (float)scaleFromPrinterSettings:(id)a3
{
  id v16 = 0;
  v3 = [MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:&v16];
  id v4 = v16;
  float v5 = 1.0;
  if (v3)
  {
    v6 = [v3 valueForKey:@"com.apple.print.PageFormat.PMScaling"];
    id v7 = v6;
    if (v6)
    {
      id v8 = [v6 valueForKey:@"com.apple.print.ticket.itemArray"];
      v9 = v8;
      if (v8
        && [v8 count] == 1
        && ([v9 objectAtIndex:0],
            v10 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char isKindOfClass = objc_opt_isKindOfClass(),
            v10,
            (isKindOfClass & 1) != 0))
      {
        v12 = [v9 objectAtIndex:0];

        v13 = [v12 valueForKey:@"com.apple.print.PageFormat.PMScaling"];
        [v13 floatValue];
        float v5 = v14;
      }
      else
      {
        v12 = v7;
      }
    }
  }

  return v5;
}

+ (TCEnumerationMap)sectionBreakEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_40, 0, &dword_238A75000);
  }
  if (+[WXSection sectionBreakEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXSection sectionBreakEnumMap]::onceToken, &__block_literal_global_90);
  }
  v2 = (void *)+[WXSection sectionBreakEnumMap]::sSectionBreakEnumMap;
  return (TCEnumerationMap *)v2;
}

void __32__WXSection_sectionBreakEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXSection sectionBreakEnumMap]::sSectionBreakEnumStructs count:5 caseSensitive:1];
  v1 = (void *)+[WXSection sectionBreakEnumMap]::sSectionBreakEnumMap;
  +[WXSection sectionBreakEnumMap]::sSectionBreakEnumMap = (uint64_t)v0;
}

+ (TCEnumerationMap)pageOrientationEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_20_2, 0, &dword_238A75000);
  }
  if (+[WXSection pageOrientationEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXSection pageOrientationEnumMap]::onceToken, &__block_literal_global_22_3);
  }
  v2 = (void *)+[WXSection pageOrientationEnumMap]::sPageOrientationEnumMap;
  return (TCEnumerationMap *)v2;
}

void __35__WXSection_pageOrientationEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXSection pageOrientationEnumMap]::sPageOrientationEnumStructs count:2 caseSensitive:1];
  v1 = (void *)+[WXSection pageOrientationEnumMap]::sPageOrientationEnumMap;
  +[WXSection pageOrientationEnumMap]::sPageOrientationEnumMap = (uint64_t)v0;
}

+ (TCEnumerationMap)pageBorderDepthEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_29_0, 0, &dword_238A75000);
  }
  if (+[WXSection pageBorderDepthEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXSection pageBorderDepthEnumMap]::onceToken, &__block_literal_global_31_0);
  }
  v2 = (void *)+[WXSection pageBorderDepthEnumMap]::sPageBorderDepthEnumMap;
  return (TCEnumerationMap *)v2;
}

void __35__WXSection_pageBorderDepthEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXSection pageBorderDepthEnumMap]::sPageBorderDepthEnumStructs count:2 caseSensitive:1];
  v1 = (void *)+[WXSection pageBorderDepthEnumMap]::sPageBorderDepthEnumMap;
  +[WXSection pageBorderDepthEnumMap]::sPageBorderDepthEnumMap = (uint64_t)v0;
}

+ (TCEnumerationMap)pageBorderDisplayEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_41_0, 0, &dword_238A75000);
  }
  if (+[WXSection pageBorderDisplayEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXSection pageBorderDisplayEnumMap]::onceToken, &__block_literal_global_43_0);
  }
  v2 = (void *)+[WXSection pageBorderDisplayEnumMap]::sPageBorderDisplayEnumMap;
  return (TCEnumerationMap *)v2;
}

void __37__WXSection_pageBorderDisplayEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXSection pageBorderDisplayEnumMap]::sPageBorderDisplayEnumStructs count:3 caseSensitive:1];
  v1 = (void *)+[WXSection pageBorderDisplayEnumMap]::sPageBorderDisplayEnumMap;
  +[WXSection pageBorderDisplayEnumMap]::sPageBorderDisplayEnumMap = (uint64_t)v0;
}

+ (TCEnumerationMap)pageBorderOffsetEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_50_0, 0, &dword_238A75000);
  }
  if (+[WXSection pageBorderOffsetEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXSection pageBorderOffsetEnumMap]::onceToken, &__block_literal_global_52);
  }
  return (TCEnumerationMap *)[a1 pageBorderDisplayEnumMap];
}

void __36__WXSection_pageBorderOffsetEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXSection pageBorderOffsetEnumMap]::sPageBorderOffsetEnumStructs count:2 caseSensitive:1];
  v1 = (void *)+[WXSection pageBorderOffsetEnumMap]::sPageBorderOffsetEnumMap;
  +[WXSection pageBorderOffsetEnumMap]::sPageBorderOffsetEnumMap = (uint64_t)v0;
}

+ (TCEnumerationMap)lineNumberRestartEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_59_1, 0, &dword_238A75000);
  }
  if (+[WXSection lineNumberRestartEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXSection lineNumberRestartEnumMap]::onceToken, &__block_literal_global_61_0);
  }
  v2 = (void *)+[WXSection lineNumberRestartEnumMap]::sLineNumberRestartEnumMap;
  return (TCEnumerationMap *)v2;
}

void __37__WXSection_lineNumberRestartEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXSection lineNumberRestartEnumMap]::sLineNumberRestartEnumStructs count:3 caseSensitive:1];
  v1 = (void *)+[WXSection lineNumberRestartEnumMap]::sLineNumberRestartEnumMap;
  +[WXSection lineNumberRestartEnumMap]::sLineNumberRestartEnumMap = (uint64_t)v0;
}

+ (TCEnumerationMap)verticalJustificationEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_74_0, 0, &dword_238A75000);
  }
  if (+[WXSection verticalJustificationEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXSection verticalJustificationEnumMap]::onceToken, &__block_literal_global_76);
  }
  v2 = (void *)+[WXSection verticalJustificationEnumMap]::sVerticalJustificationEnumMap;
  return (TCEnumerationMap *)v2;
}

void __41__WXSection_verticalJustificationEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXSection verticalJustificationEnumMap]::sVerticalJustificationEnumStructs count:4 caseSensitive:1];
  v1 = (void *)+[WXSection verticalJustificationEnumMap]::sVerticalJustificationEnumMap;
  +[WXSection verticalJustificationEnumMap]::sVerticalJustificationEnumMap = (uint64_t)v0;
}

+ (TCEnumerationMap)chapterNumberSeparatorEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_92_1, 0, &dword_238A75000);
  }
  if (+[WXSection chapterNumberSeparatorEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXSection chapterNumberSeparatorEnumMap]::onceToken, &__block_literal_global_94_0);
  }
  v2 = (void *)+[WXSection chapterNumberSeparatorEnumMap]::sChapterNumberSeparatorEnumMap;
  return (TCEnumerationMap *)v2;
}

void __42__WXSection_chapterNumberSeparatorEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXSection chapterNumberSeparatorEnumMap]::sChapterNumberSeparatorEnumStructs count:5 caseSensitive:1];
  v1 = (void *)+[WXSection chapterNumberSeparatorEnumMap]::sChapterNumberSeparatorEnumMap;
  +[WXSection chapterNumberSeparatorEnumMap]::sChapterNumberSeparatorEnumMap = (uint64_t)v0;
}

+ (void)mapPrinterSettings:(_xmlNode *)a3 toSection:(id)a4 state:(id)a5
{
  id v23 = a4;
  id v8 = a5;
  v9 = [v8 wxoavState];
  v10 = [v9 packagePart];
  v11 = [v8 OCXReadRequiredRelationshipForNode:a3 packagePart:v10];

  v12 = [v11 identifier];
  v13 = [v8 packagePart];
  float v14 = [v13 package];

  id v15 = [v8 packagePart];
  id v16 = [v15 relationshipForIdentifier:v12];

  id v17 = [v16 targetLocation];
  v18 = [v14 partForLocation:v17];

  if (v18)
  {
    v19 = [v18 data];
    [a1 scaleFromPrinterSettings:v19];
    float v21 = v20;

    if (v21 != 1.0) {
      [v23 setPageScale:(float)(v21 * 100.0)];
    }
  }
  v22 = [v16 targetLocation];
  [v14 resetPartForLocation:v22];
}

@end