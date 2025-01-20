@interface WXParagraphProperties
+ (id)dropCapEnumMap;
+ (id)heightRuleEnumMap;
+ (id)horizontalAnchorEnumMap;
+ (id)lineSpacingEnumMap;
+ (id)strictTabTypeEnumMap;
+ (id)tabLeaderEnumMap;
+ (id)tabTypeEnumMap;
+ (id)verticalAnchorEnumMap;
+ (id)wrapCodeEnumMap;
+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 readBaseStyle:(BOOL)a5 state:(id)a6;
@end

@implementation WXParagraphProperties

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 readBaseStyle:(BOOL)a5 state:(id)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  v10 = (WXReadState *)a6;
  v155 = a3;
  if (!a3) {
    goto LABEL_171;
  }
  v157 = v9;
  v11 = [v9 document];
  v154 = [v11 styleSheet];

  [v9 setResolveMode:0];
  v12 = [(WXReadState *)v10 WXMainNamespace];
  v13 = (_xmlNode *)OCXFindChild(a3, v12, "pPrChange");

  if (v13)
  {
    v14 = [(WXReadState *)v10 WXMainNamespace];
    uint64_t v15 = OCXFindChild(v13, v14, "pPr");

    if (v15)
    {
      +[WXParagraphProperties readFrom:v15 to:v9 readBaseStyle:v7 state:v10];
      if ([v9 isBaseStyleOverridden])
      {
        id v16 = [v9 baseStyle];
      }
      else
      {
        id v16 = 0;
      }
      [v9 setResolveMode:1];
      [v9 setFormattingChanged:1];
      if (v16) {
        [v9 setBaseStyle:v16];
      }
    }
  }
  if (v7)
  {
    v17 = [(WXReadState *)v10 WXMainNamespace];
    v18 = (_xmlNode *)OCXFindChild(v155, v17, "pStyle");

    if (v18)
    {
      v19 = [(WXReadState *)v10 WXMainNamespace];
      v20 = CXDefaultStringAttribute(v18, v19, (xmlChar *)"val", 0);

      v21 = [v154 styleWithId:v20];
      [v9 setBaseStyle:v21];
    }
  }
  unsigned int v172 = 0;
  v22 = [a1 heightRuleEnumMap];
  int v23 = readEnumProperty<WDHeightRule>(v155, "framePr", (const xmlChar *)"hRule", v22, &v172, v10);

  if (v23) {
    [v9 setHeightRule:v172];
  }
  unsigned int v171 = 0;
  v24 = [a1 horizontalAnchorEnumMap];
  int v25 = readEnumProperty<WDHorizontalAnchor>(v155, "framePr", (const xmlChar *)"hAnchor", v24, &v171, v10);

  if (v25) {
    [v9 setHorizontalAnchor:v171];
  }
  unsigned int v170 = 0;
  v26 = [a1 verticalAnchorEnumMap];
  int v27 = readEnumProperty<WDVerticalAnchor>(v155, "framePr", (const xmlChar *)"vAnchor", v26, &v170, v10);

  if (v27) {
    [v9 setVerticalAnchor:v170];
  }
  char v169 = 0;
  v28 = [a1 wrapCodeEnumMap];
  int v29 = readEnumProperty<char>(v155, "framePr", (const xmlChar *)"wrap", v28, &v169, v10);

  if (v29) {
    [v9 setWrapCode:v169];
  }
  unsigned int v168 = 0;
  v30 = [a1 lineSpacingEnumMap];
  int v31 = readEnumProperty<WDLineSpacingRule>(v155, "spacing", (const xmlChar *)"lineRule", v30, &v168, v10);

  if (v31) {
    [v9 setLineSpacingRule:v168];
  }
  unsigned int v167 = 0;
  v32 = +[WXCommon justifyEnumMap];
  if (readEnumProperty<WDJustification>(v155, "jc", (const xmlChar *)"val", v32, &v167, v10))
  {
  }
  else
  {
    v33 = +[WXCommon strictJustifyEnumMap];
    int v34 = readEnumProperty<WDJustification>(v155, "jc", (const xmlChar *)"val", v33, &v167, v10);

    if (!v34) {
      goto LABEL_27;
    }
  }
  [v9 setJustification:v167];
LABEL_27:
  BOOL v166 = 0;
  if (wmxmlGetBoolOnlyProperty(v155, "pageBreakBefore", (const xmlChar *)"val", &v166, v10)) {
    [v9 setPageBreakBefore:v166];
  }
  if (wmxmlGetBoolOnlyProperty(v155, "wordWrap", (const xmlChar *)"val", &v166, v10)) {
    [v9 setWrap:v166];
  }
  if (wmxmlGetBoolProperty(v155, "framePr", (const xmlChar *)"anchorLock", &v166, v10)) {
    [v9 setAnchorLock:v166];
  }
  if (wmxmlGetBoolOnlyProperty(v155, "keepNext", (const xmlChar *)"val", &v166, v10)) {
    [v9 setKeepNextParagraphTogether:v166];
  }
  if (wmxmlGetBoolOnlyProperty(v155, "keepLines", (const xmlChar *)"val", &v166, v10)) {
    [v9 setKeepLinesTogether:v166];
  }
  if (wmxmlGetBoolOnlyProperty(v155, "suppressLineNumbers", (const xmlChar *)"val", &v166, v10)) {
    [v9 setSuppressLineNumbers:v166];
  }
  if (wmxmlGetBoolOnlyProperty(v155, "suppressAutoHyphens", (const xmlChar *)"val", &v166, v10)) {
    [v9 setSuppressAutoHyphens:v166];
  }
  if (wmxmlGetBoolOnlyProperty(v155, "widowControl", (const xmlChar *)"val", &v166, v10)) {
    [v9 setWidowControl:v166];
  }
  if (wmxmlGetBoolOnlyProperty(v155, "bidi", (const xmlChar *)"val", &v166, v10)) {
    [v9 setBiDi:v166];
  }
  if (wmxmlGetBoolOnlyProperty(v155, "kinsoku", (const xmlChar *)"val", &v166, v10)) {
    [v9 setKinsokuOff:!v166];
  }
  if (wmxmlGetBoolOnlyProperty(v155, "beforeAutospacing", (const xmlChar *)"val", &v166, v10)) {
    [v9 setSpaceBeforeAuto:v166];
  }
  if (wmxmlGetBoolOnlyProperty(v155, "afterAutospacing", (const xmlChar *)"val", &v166, v10)) {
    [v9 setSpaceAfterAuto:v166];
  }
  if (wmxmlGetBoolOnlyProperty(v155, "contextualSpacing", (const xmlChar *)"val", &v166, v10)) {
    [v9 setContextualSpacing:v166];
  }
  uint64_t v165 = 0;
  v35 = [(WXReadState *)v10 WXMainNamespace];
  v36 = (_xmlNode *)OCXFindChild(v155, v35, "framePr");

  v37 = [(WXReadState *)v10 WXMainNamespace];
  BOOL v38 = CXOptionalLongAttribute(v36, v37, (xmlChar *)"w", &v165, 14);

  if (v38) {
    [v9 setWidth:v165];
  }
  v39 = [(WXReadState *)v10 WXMainNamespace];
  BOOL v40 = CXOptionalLongAttribute(v36, v39, (xmlChar *)"h", &v165, 14);

  if (v40) {
    [v9 setHeight:v165];
  }
  v41 = [(WXReadState *)v10 WXMainNamespace];
  BOOL v42 = CXOptionalLongAttribute(v36, v41, (xmlChar *)"vSpace", &v165, 14);

  if (v42) {
    [v9 setVerticalSpace:v165];
  }
  v43 = [(WXReadState *)v10 WXMainNamespace];
  BOOL v44 = CXOptionalLongAttribute(v36, v43, (xmlChar *)"hSpace", &v165, 14);

  if (v44) {
    [v9 setHorizontalSpace:v165];
  }
  v45 = [(WXReadState *)v10 WXMainNamespace];
  BOOL v46 = CXOptionalLongAttribute(v36, v45, (xmlChar *)"x", &v165, 14);

  if (v46) {
    [v9 setHorizontalPosition:v165];
  }
  if (([v9 isHorizontalPositionOverridden] & 1) == 0)
  {
    v47 = [(WXReadState *)v10 WXMainNamespace];
    id v164 = 0;
    BOOL v48 = CXOptionalStringAttribute(v36, v47, (xmlChar *)"xAlign", &v164);
    id v49 = v164;

    if (v48)
    {
      if ([v49 isEqualToString:@"left"])
      {
        uint64_t v50 = 0;
LABEL_75:
        [v9 setHorizontalPosition:v50];
        goto LABEL_76;
      }
      if ([v49 isEqualToString:@"center"])
      {
        uint64_t v50 = -4;
        goto LABEL_75;
      }
      if ([v49 isEqualToString:@"right"])
      {
        uint64_t v50 = -8;
        goto LABEL_75;
      }
      if ([v49 isEqualToString:@"inside"])
      {
        uint64_t v50 = -12;
        goto LABEL_75;
      }
      if ([v49 isEqualToString:@"outside"])
      {
        uint64_t v50 = -16;
        goto LABEL_75;
      }
    }
LABEL_76:
  }
  v51 = [(WXReadState *)v10 WXMainNamespace];
  BOOL v52 = CXOptionalLongAttribute(v36, v51, (xmlChar *)"y", &v165, 14);

  if (v52) {
    [v9 setVerticalPosition:v165];
  }
  if (([v9 isVerticalPositionOverridden] & 1) == 0)
  {
    v53 = [(WXReadState *)v10 WXMainNamespace];
    id v163 = 0;
    BOOL v54 = CXOptionalStringAttribute(v36, v53, (xmlChar *)"yAlign", &v163);
    id v55 = v163;

    if (v54)
    {
      if ([v55 isEqualToString:@"top"])
      {
        uint64_t v56 = -4;
LABEL_91:
        [v9 setVerticalPosition:v56];
        goto LABEL_92;
      }
      if ([v55 isEqualToString:@"center"])
      {
        uint64_t v56 = -8;
        goto LABEL_91;
      }
      if ([v55 isEqualToString:@"bottom"])
      {
        uint64_t v56 = -12;
        goto LABEL_91;
      }
      if ([v55 isEqualToString:@"inside"])
      {
        uint64_t v56 = -16;
        goto LABEL_91;
      }
      if ([v55 isEqualToString:@"outside"])
      {
        uint64_t v56 = -20;
        goto LABEL_91;
      }
    }
LABEL_92:
  }
  v57 = [(WXReadState *)v10 WXMainNamespace];
  v58 = (_xmlNode *)OCXFindChild(v155, v57, "spacing");

  v59 = [(WXReadState *)v10 WXMainNamespace];
  BOOL v60 = CXOptionalLongAttribute(v58, v59, (xmlChar *)"line", &v165, 14);

  if (v60)
  {
    if ([v9 isLineSpacingRuleOverridden]
      && [v9 lineSpacingRule] == 1)
    {
      int v61 = -(unsigned __int16)v165;
    }
    else
    {
      LOWORD(v61) = v165;
    }
    [v9 setLineSpacing:(__int16)v61];
  }
  v62 = [(WXReadState *)v10 WXMainNamespace];
  BOOL v63 = CXOptionalLongAttribute(v58, v62, (xmlChar *)"before", &v165, 14);

  if (v63) {
    [v9 setSpaceBefore:(unsigned __int16)v165];
  }
  v64 = [(WXReadState *)v10 WXMainNamespace];
  BOOL v65 = CXOptionalLongAttribute(v58, v64, (xmlChar *)"after", &v165, 14);

  if (v65) {
    [v9 setSpaceAfter:(unsigned __int16)v165];
  }
  v66 = [(WXReadState *)v10 WXMainNamespace];
  v67 = (_xmlNode *)OCXFindChild(v155, v66, "outlineLvl");

  v68 = [(WXReadState *)v10 WXMainNamespace];
  LODWORD(v67) = CXOptionalLongAttribute(v67, v68, (xmlChar *)"val", &v165);

  if (v67) {
    [v9 setOutlineLevel:(unsigned __int16)v165];
  }
  v69 = [(WXReadState *)v10 WXMainNamespace];
  v70 = (_xmlNode *)OCXFindChild(v155, v69, "ind");

  v71 = [(WXReadState *)v10 WXMainNamespace];
  if (CXOptionalLongAttribute(v70, v71, (xmlChar *)"left", &v165, 14))
  {

LABEL_108:
    [v9 setLeadingIndent:(__int16)v165];
    goto LABEL_109;
  }
  v72 = [(WXReadState *)v10 WXMainNamespace];
  BOOL v73 = CXOptionalLongAttribute(v70, v72, (xmlChar *)"start", &v165, 14);

  if (v73) {
    goto LABEL_108;
  }
  v142 = [(WXReadState *)v10 WXMainNamespace];
  if (CXOptionalLongAttribute(v70, v142, (xmlChar *)"leftChars", &v165))
  {
  }
  else
  {
    v148 = [(WXReadState *)v10 WXMainNamespace];
    BOOL v149 = CXOptionalLongAttribute(v70, v148, (xmlChar *)"startChars", &v165);

    if (!v149) {
      goto LABEL_109;
    }
  }
  [v9 setLeftIndentChars:(__int16)v165];
LABEL_109:
  v74 = [(WXReadState *)v10 WXMainNamespace];
  if (CXOptionalLongAttribute(v70, v74, (xmlChar *)"right", &v165, 14))
  {

LABEL_112:
    [v9 setFollowingIndent:(__int16)v165];
    goto LABEL_113;
  }
  v75 = [(WXReadState *)v10 WXMainNamespace];
  BOOL v76 = CXOptionalLongAttribute(v70, v75, (xmlChar *)"end", &v165, 14);

  if (v76) {
    goto LABEL_112;
  }
  v143 = [(WXReadState *)v10 WXMainNamespace];
  if (CXOptionalLongAttribute(v70, v143, (xmlChar *)"rightChars", &v165))
  {
  }
  else
  {
    v150 = [(WXReadState *)v10 WXMainNamespace];
    BOOL v151 = CXOptionalLongAttribute(v70, v150, (xmlChar *)"endChars", &v165);

    if (!v151) {
      goto LABEL_113;
    }
  }
  [v9 setRightIndentChars:(__int16)v165];
LABEL_113:
  uint64_t v161 = 0;
  uint64_t v162 = 0;
  v77 = [(WXReadState *)v10 WXMainNamespace];
  BOOL v78 = CXOptionalLongAttribute(v70, v77, (xmlChar *)"firstLine", &v162, 14);

  if (!v78)
  {
    v80 = [(WXReadState *)v10 WXMainNamespace];
    BOOL v81 = CXOptionalLongAttribute(v70, v80, (xmlChar *)"firstLineChars", &v162);

    if (v81)
    {
      LOWORD(v82) = v162;
    }
    else
    {
      v144 = [(WXReadState *)v10 WXMainNamespace];
      BOOL v145 = CXOptionalLongAttribute(v70, v144, (xmlChar *)"hanging", &v161, 14);

      if (v145)
      {
        int v79 = -(unsigned __int16)v161;
        goto LABEL_115;
      }
      v152 = [(WXReadState *)v10 WXMainNamespace];
      BOOL v153 = CXOptionalLongAttribute(v70, v152, (xmlChar *)"hangingChars", &v161);

      if (!v153) {
        goto LABEL_119;
      }
      int v82 = -(unsigned __int16)v161;
    }
    [v9 setFirstLineIndentChars:(__int16)v82];
    goto LABEL_119;
  }
  LOWORD(v79) = v162;
LABEL_115:
  [v9 setFirstLineIndent:(__int16)v79];
LABEL_119:
  int v160 = 0;
  v83 = [a1 dropCapEnumMap];
  int v84 = readEnumProperty<WDDropCapStyle>(v155, "framePr", (const xmlChar *)"dropCap", v83, &v160, v10);

  if (v84)
  {
    v85 = [(WXReadState *)v10 WXMainNamespace];
    unsigned __int8 v86 = CXDefaultLongAttribute(v36, v85, (xmlChar *)"lines", 0);

    [v9 setDropCap:v160 | ((unint64_t)v86 << 8)];
  }
  v87 = [(WXReadState *)v10 WXMainNamespace];
  v88 = (_xmlNode *)OCXFindChild(v155, v87, "pBdr");

  if (v88)
  {
    v89 = [(WXReadState *)v10 WXMainNamespace];
    uint64_t v90 = OCXFindChild(v88, v89, "top");

    if (v90)
    {
      v91 = [v9 mutableTopBorder];
      +[WXBorder readFrom:v90 to:v91 state:v10];
    }
    v92 = [(WXReadState *)v10 WXMainNamespace];
    uint64_t v93 = OCXFindChild(v88, v92, "left");

    if (v93)
    {
      v94 = [v9 mutableLeftBorder];
      +[WXBorder readFrom:v93 to:v94 state:v10];
    }
    v95 = [(WXReadState *)v10 WXMainNamespace];
    uint64_t v96 = OCXFindChild(v88, v95, "bottom");

    if (v96)
    {
      v97 = [v9 mutableBottomBorder];
      +[WXBorder readFrom:v96 to:v97 state:v10];
    }
    v98 = [(WXReadState *)v10 WXMainNamespace];
    uint64_t v99 = OCXFindChild(v88, v98, "right");

    if (v99)
    {
      v100 = [v9 mutableRightBorder];
      +[WXBorder readFrom:v99 to:v100 state:v10];
    }
    v101 = [(WXReadState *)v10 WXMainNamespace];
    uint64_t v102 = OCXFindChild(v88, v101, "between");

    if (v102)
    {
      v103 = [v9 mutableBetweenBorder];
      +[WXBorder readFrom:v102 to:v103 state:v10];
    }
    v104 = [(WXReadState *)v10 WXMainNamespace];
    uint64_t v105 = OCXFindChild(v88, v104, "bar");

    if (v105)
    {
      v106 = [v9 mutableBarBorder];
      +[WXBorder readFrom:v105 to:v106 state:v10];
    }
  }
  v107 = [(WXReadState *)v10 WXMainNamespace];
  uint64_t v108 = OCXFindChild(v155, v107, "shd");

  if (v108)
  {
    v109 = [v9 mutableShading];
    +[WXShading readFrom:v108 to:v109 state:v10];
  }
  v110 = [(WXReadState *)v10 WXMainNamespace];
  v111 = (_xmlNode *)OCXFindChild(v155, v110, "tabs");

  if (v111)
  {
    v112 = [(WXReadState *)v10 WXMainNamespace];
    Child = (_xmlNode *)OCXFindChild(v111, v112, "tab");

    while (Child)
    {
      v114 = [(WXReadState *)v10 WXMainNamespace];
      uint64_t v165 = (uint64_t)CXRequiredLongAttribute(Child, v114, (xmlChar *)"pos", 14);

      LOWORD(v159) = v165;
      v115 = [a1 tabTypeEnumMap];
      char Enum = readEnumProperty<unsigned char>(Child, (const xmlChar *)"val", v115, (unsigned char *)&v159 + 2);

      if (Enum)
      {
        int v117 = 1;
      }
      else
      {
        v118 = [a1 strictTabTypeEnumMap];
        int v117 = readEnumProperty<unsigned char>(Child, (const xmlChar *)"val", v118, (unsigned char *)&v159 + 2);
      }
      v119 = [a1 tabLeaderEnumMap];
      char v120 = readEnumProperty<unsigned char>(Child, (const xmlChar *)"leader", v119, (unsigned char *)&v159 + 3);

      if ((v120 & 1) == 0) {
        BYTE3(v159) = 0;
      }
      if (BYTE2(v159) == 100) {
        int v121 = v117;
      }
      else {
        int v121 = 0;
      }
      if (v121 == 1) {
        [v157 addTabStopDeletedPosition:(__int16)v159];
      }
      else {
        [v157 addTabStopAdded:&v159];
      }
      v122 = [(WXReadState *)v10 WXMainNamespace];
      Child = OCXFindNextChild(Child, v122, (xmlChar *)"tab");
    }
  }
  v123 = [(WXReadState *)v10 WXMainNamespace];
  v124 = (_xmlNode *)OCXFindChild(v155, v123, "numPr");

  if (v124)
  {
    uint64_t v159 = 0;
    v125 = [(WXReadState *)v10 WXMainNamespace];
    v126 = (_xmlNode *)OCXFindChild(v124, v125, "ilvl");

    v127 = [(WXReadState *)v10 WXMainNamespace];
    BOOL v128 = CXOptionalLongAttribute(v126, v127, (xmlChar *)"val", &v159);

    if (v128) {
      [v157 setListLevel:v159];
    }
    uint64_t v158 = 0;
    v129 = [(WXReadState *)v10 WXMainNamespace];
    v130 = (_xmlNode *)OCXFindChild(v124, v129, "numId");

    v131 = [(WXReadState *)v10 WXMainNamespace];
    BOOL v132 = CXOptionalLongAttribute(v130, v131, (xmlChar *)"val", &v158);

    if (v132) {
      [v157 setListIndex:v158];
    }
  }
  v133 = [(WXReadState *)v10 WXMainNamespace];
  uint64_t v134 = OCXFindChild(v155, v133, "rPr");

  if (v134)
  {
    v135 = [v157 mutableCharacterProperties];
    +[WXCharacterProperties readFrom:v134 to:v135 state:v10];
  }
  v136 = [(WXReadState *)v10 WXMainNamespace];
  uint64_t v137 = OCXFindChild(v155, v136, "sectPr");

  if (v137)
  {
    v138 = [(WXReadState *)v10 document];
    v139 = [v138 lastSection];
    +[WXSection readFrom:v137 to:v139 state:v10];

    [(WXReadState *)v10 setNewSectionRequested:1];
  }
  if ([v157 resolveMode] == 1)
  {
    [v157 setResolveMode:2];
    if ([v157 isBaseStyleOverridden])
    {
      v140 = [v157 baseStyle];
      v141 = [v140 paragraphProperties];
    }
    else
    {
      v140 = [(WXReadState *)v10 document];
      v146 = [v140 styleSheet];
      v147 = [v146 defaultParagraphStyle];
      v141 = [v147 paragraphProperties];
    }
    [v157 negateFormattingChangesWithDefaults:v141];
  }
  id v9 = v157;
LABEL_171:
}

+ (id)heightRuleEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_39, 0, &dword_238A75000);
  }
  if (+[WXParagraphProperties heightRuleEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXParagraphProperties heightRuleEnumMap]::onceToken, &__block_literal_global_89);
  }
  v2 = (void *)+[WXParagraphProperties heightRuleEnumMap]::sHeightRuleEnumMap;
  return v2;
}

void __42__WXParagraphProperties_heightRuleEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXParagraphProperties heightRuleEnumMap]::sHeightRuleEnumStructs count:2 caseSensitive:1];
  v1 = (void *)+[WXParagraphProperties heightRuleEnumMap]::sHeightRuleEnumMap;
  +[WXParagraphProperties heightRuleEnumMap]::sHeightRuleEnumMap = (uint64_t)v0;
}

+ (id)verticalAnchorEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_14_1, 0, &dword_238A75000);
  }
  if (+[WXParagraphProperties verticalAnchorEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXParagraphProperties verticalAnchorEnumMap]::onceToken, &__block_literal_global_16_0);
  }
  v2 = (void *)+[WXParagraphProperties verticalAnchorEnumMap]::sVerticalAnchorEnumMap;
  return v2;
}

void __46__WXParagraphProperties_verticalAnchorEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXParagraphProperties verticalAnchorEnumMap]::sVerticalAnchorEnumStructs count:3 caseSensitive:1];
  v1 = (void *)+[WXParagraphProperties verticalAnchorEnumMap]::sVerticalAnchorEnumMap;
  +[WXParagraphProperties verticalAnchorEnumMap]::sVerticalAnchorEnumMap = (uint64_t)v0;
}

+ (id)horizontalAnchorEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_20_1, 0, &dword_238A75000);
  }
  if (+[WXParagraphProperties horizontalAnchorEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXParagraphProperties horizontalAnchorEnumMap]::onceToken, &__block_literal_global_22_2);
  }
  v2 = (void *)+[WXParagraphProperties horizontalAnchorEnumMap]::sHorizontalAnchorEnumMap;
  return v2;
}

void __48__WXParagraphProperties_horizontalAnchorEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXParagraphProperties horizontalAnchorEnumMap]::sHorizontalAnchorEnumStructs count:3 caseSensitive:1];
  v1 = (void *)+[WXParagraphProperties horizontalAnchorEnumMap]::sHorizontalAnchorEnumMap;
  +[WXParagraphProperties horizontalAnchorEnumMap]::sHorizontalAnchorEnumMap = (uint64_t)v0;
}

+ (id)lineSpacingEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_26_1, 0, &dword_238A75000);
  }
  if (+[WXParagraphProperties lineSpacingEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXParagraphProperties lineSpacingEnumMap]::onceToken, &__block_literal_global_28_1);
  }
  v2 = (void *)+[WXParagraphProperties lineSpacingEnumMap]::sLineSpacingEnumMap;
  return v2;
}

void __43__WXParagraphProperties_lineSpacingEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXParagraphProperties lineSpacingEnumMap]::sLineSpacingEnumStructs count:3 caseSensitive:1];
  v1 = (void *)+[WXParagraphProperties lineSpacingEnumMap]::sLineSpacingEnumMap;
  +[WXParagraphProperties lineSpacingEnumMap]::sLineSpacingEnumMap = (uint64_t)v0;
}

+ (id)dropCapEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_35_0, 0, &dword_238A75000);
  }
  if (+[WXParagraphProperties dropCapEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXParagraphProperties dropCapEnumMap]::onceToken, &__block_literal_global_37);
  }
  v2 = (void *)+[WXParagraphProperties dropCapEnumMap]::sDropCapEnumMap;
  return v2;
}

void __39__WXParagraphProperties_dropCapEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXParagraphProperties dropCapEnumMap]::sDropCapEnumStructs count:3 caseSensitive:1];
  v1 = (void *)+[WXParagraphProperties dropCapEnumMap]::sDropCapEnumMap;
  +[WXParagraphProperties dropCapEnumMap]::sDropCapEnumMap = (uint64_t)v0;
}

+ (id)tabTypeEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_59_0, 0, &dword_238A75000);
  }
  if (+[WXParagraphProperties tabTypeEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXParagraphProperties tabTypeEnumMap]::onceToken, &__block_literal_global_61);
  }
  v2 = (void *)+[WXParagraphProperties tabTypeEnumMap]::sTabTypeEnumMap;
  return v2;
}

void __39__WXParagraphProperties_tabTypeEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXParagraphProperties tabTypeEnumMap]::sTabTypeEnumStructs count:7 caseSensitive:1];
  v1 = (void *)+[WXParagraphProperties tabTypeEnumMap]::sTabTypeEnumMap;
  +[WXParagraphProperties tabTypeEnumMap]::sTabTypeEnumMap = (uint64_t)v0;
}

+ (id)strictTabTypeEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_68_1, 0, &dword_238A75000);
  }
  if (+[WXParagraphProperties strictTabTypeEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXParagraphProperties strictTabTypeEnumMap]::onceToken, &__block_literal_global_70_0);
  }
  v2 = (void *)+[WXParagraphProperties strictTabTypeEnumMap]::sStrictTabTypeEnumMap;
  return v2;
}

void __45__WXParagraphProperties_strictTabTypeEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXParagraphProperties strictTabTypeEnumMap]::sStrictTabTypeEnumStructs count:7 caseSensitive:1];
  v1 = (void *)+[WXParagraphProperties strictTabTypeEnumMap]::sStrictTabTypeEnumMap;
  +[WXParagraphProperties strictTabTypeEnumMap]::sStrictTabTypeEnumMap = (uint64_t)v0;
}

+ (id)tabLeaderEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_92_0, 0, &dword_238A75000);
  }
  if (+[WXParagraphProperties tabLeaderEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXParagraphProperties tabLeaderEnumMap]::onceToken, &__block_literal_global_94);
  }
  v2 = (void *)+[WXParagraphProperties tabLeaderEnumMap]::sTabLeaderEnumMap;
  return v2;
}

void __41__WXParagraphProperties_tabLeaderEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXParagraphProperties tabLeaderEnumMap]::sTabLeaderEnumStructs count:8 caseSensitive:1];
  v1 = (void *)+[WXParagraphProperties tabLeaderEnumMap]::sTabLeaderEnumMap;
  +[WXParagraphProperties tabLeaderEnumMap]::sTabLeaderEnumMap = (uint64_t)v0;
}

+ (id)wrapCodeEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_101_1, 0, &dword_238A75000);
  }
  if (+[WXParagraphProperties wrapCodeEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXParagraphProperties wrapCodeEnumMap]::onceToken, &__block_literal_global_103_0);
  }
  v2 = (void *)+[WXParagraphProperties wrapCodeEnumMap]::sWrapCodeEnumMap;
  return v2;
}

void __40__WXParagraphProperties_wrapCodeEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXParagraphProperties wrapCodeEnumMap]::sWrapCodeEnumStructs count:2 caseSensitive:1];
  v1 = (void *)+[WXParagraphProperties wrapCodeEnumMap]::sWrapCodeEnumMap;
  +[WXParagraphProperties wrapCodeEnumMap]::sWrapCodeEnumMap = (uint64_t)v0;
}

@end