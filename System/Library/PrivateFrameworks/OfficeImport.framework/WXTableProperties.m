@interface WXTableProperties
+ (id)tableHorizontalAnchorEnumMap;
+ (id)tableHorizontalPositionEnumMap;
+ (id)tableLookBitEnumMap;
+ (id)tableVerticalAnchorEnumMap;
+ (id)tableVerticalPositionEnumMap;
+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5;
@end

@implementation WXTableProperties

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7 = a4;
  v8 = (WXReadState *)a5;
  v9 = [(WXReadState *)v8 WXMainNamespace];
  v111 = v7;
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "tblLook");

  if (!v10)
  {
LABEL_12:
    unsigned __int16 v11 = 37;
    goto LABEL_13;
  }
  v110 = a3;
  unsigned __int16 v11 = 0;
  char v12 = 0;
  uint64_t v13 = 0;
  do
  {
    v14 = objc_msgSend(a1, "tableLookBitEnumMap", v110);
    v15 = [v14 stringForValue:v13];

    v115[0] = 0;
    v16 = [(WXReadState *)v8 WXMainNamespace];
    id v17 = v15;
    BOOL v18 = CXOptionalBoolAttribute(v10, v16, (xmlChar *)[v17 UTF8String], v115);

    if (v18)
    {
      char v12 = 1;
      if (v115[0]) {
        int v19 = 1 << v13;
      }
      else {
        LOWORD(v19) = 0;
      }
    }
    else
    {
      int v19 = 1 << v13;
    }
    v11 |= v19;

    uint64_t v13 = (v13 + 1);
  }
  while (v13 != 6);
  a3 = v110;
  if ((v12 & 1) == 0)
  {
    v20 = [(WXReadState *)v8 WXMainNamespace];
    v21 = CXDefaultStringAttribute(v10, v20, (xmlChar *)"val", 0);

    if (v21)
    {
      id v22 = v21;
      unsigned __int16 v11 = (unsigned __int16)strtoul((const char *)[v22 UTF8String], 0, 16) >> 5;

      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_13:
  [v111 setLook:v11];
  __int16 v120 = 0;
  unsigned int v119 = 0;
  v23 = [(WXReadState *)v8 WXMainNamespace];
  v24 = (xmlNode *)OCXFindChild(a3, v23, "tblW");

  v25 = [(WXReadState *)v8 WXMainNamespace];
  LODWORD(v24) = WXOptionalTableWidthAttribute(v24, v25, (xmlChar *)"w", &v120, &v119);

  if (v24)
  {
    [v111 setWidth:v120];
    [v111 setWidthType:v119];
  }
  v26 = [(WXReadState *)v8 WXMainNamespace];
  v27 = (xmlNode *)OCXFindChild(a3, v26, "tblInd");

  v28 = [(WXReadState *)v8 WXMainNamespace];
  LODWORD(v27) = WXOptionalTableWidthAttribute(v27, v28, (xmlChar *)"w", &v120, &v119);

  if (v27)
  {
    [v111 setIndent:v120];
    [v111 setIndentType:v119];
  }
  v29 = [(WXReadState *)v8 WXMainNamespace];
  v30 = (_xmlNode *)OCXFindChild(a3, v29, "tblCellMar");

  if (v30)
  {
    *(_DWORD *)v115 = 0;
    v31 = [(WXReadState *)v8 WXMainNamespace];
    v32 = (_xmlNode *)OCXFindChild(v30, v31, "top");

    if (v32)
    {
      v33 = [(WXReadState *)v8 WXMainNamespace];
      uint64_t v34 = CXDefaultLongAttribute(v32, v33, (xmlChar *)"w", 0);

      v35 = +[WXCommon tableWidthTypeEnumMap];
      readEnumProperty<WDTableWidthType>(v30, "top", (const xmlChar *)"type", v35, v115, v8);
    }
    else
    {
      uint64_t v34 = 0;
    }
    unsigned int v118 = 0;
    v36 = [(WXReadState *)v8 WXMainNamespace];
    v37 = (_xmlNode *)OCXFindChild(v30, v36, "bottom");

    if (v37)
    {
      v38 = [(WXReadState *)v8 WXMainNamespace];
      uint64_t v39 = CXDefaultLongAttribute(v37, v38, (xmlChar *)"w", 0);

      v40 = +[WXCommon tableWidthTypeEnumMap];
      readEnumProperty<WDTableWidthType>(v30, "bottom", (const xmlChar *)"type", v40, &v118, v8);
    }
    else
    {
      uint64_t v39 = 0;
    }
    unsigned int v117 = 0;
    v41 = [(WXReadState *)v8 WXMainNamespace];
    v42 = (_xmlNode *)OCXFindChild(v30, v41, "left");

    if (v42
      || ([(WXReadState *)v8 WXMainNamespace],
          v43 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
          v42 = (_xmlNode *)OCXFindChild(v30, v43, "start"),
          v43,
          v42))
    {
      v44 = [(WXReadState *)v8 WXMainNamespace];
      v42 = (_xmlNode *)CXDefaultLongAttribute(v42, v44, (xmlChar *)"w", 0);

      v45 = +[WXCommon tableWidthTypeEnumMap];
      readEnumProperty<WDTableWidthType>(v30, "left", (const xmlChar *)"type", v45, &v117, v8);
    }
    unsigned int v116 = 0;
    v46 = [(WXReadState *)v8 WXMainNamespace];
    v47 = (_xmlNode *)OCXFindChild(v30, v46, "right");

    if (v47
      || ([(WXReadState *)v8 WXMainNamespace],
          v48 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
          v47 = (_xmlNode *)OCXFindChild(v30, v48, "end"),
          v48,
          v47))
    {
      v49 = [(WXReadState *)v8 WXMainNamespace];
      v47 = (_xmlNode *)CXDefaultLongAttribute(v47, v49, (xmlChar *)"w", 0);

      v50 = +[WXCommon tableWidthTypeEnumMap];
      readEnumProperty<WDTableWidthType>(v30, "right", (const xmlChar *)"type", v50, &v116, v8);
    }
    if (v34 == v39
      && (_xmlNode *)v34 == v42
      && (_xmlNode *)v34 == v47
      && *(_DWORD *)v115 == v118
      && *(_DWORD *)v115 == v117
      && *(_DWORD *)v115 == v116)
    {
      [v111 setCellSpacing:(__int16)v34];
      [v111 setCellSpacingType:*(unsigned int *)v115];
    }
  }
  unsigned int v118 = 0;
  v51 = +[WXCommon justifyEnumMap];
  if (readEnumProperty<WDJustification>(a3, "jc", (const xmlChar *)"val", v51, &v118, v8))
  {
  }
  else
  {
    v52 = +[WXCommon strictJustifyEnumMap];
    int v53 = readEnumProperty<WDJustification>(a3, "jc", (const xmlChar *)"val", v52, &v118, v8);

    if (!v53) {
      goto LABEL_41;
    }
  }
  [v111 setAlignment:v118];
LABEL_41:
  v54 = [(WXReadState *)v8 WXMainNamespace];
  uint64_t v55 = OCXFindChild(a3, v54, "shd");

  if (v55)
  {
    v56 = [v111 mutableShading];
    +[WXShading readFrom:v55 to:v56 state:v8];
  }
  v57 = [(WXReadState *)v8 WXMainNamespace];
  v58 = (_xmlNode *)OCXFindChild(a3, v57, "tblBorders");

  if (v58)
  {
    v59 = [(WXReadState *)v8 WXMainNamespace];
    uint64_t v60 = OCXFindChild(v58, v59, "top");

    if (v60)
    {
      v61 = [v111 mutableTopBorder];
      +[WXBorder readFrom:v60 to:v61 state:v8];
    }
    v62 = [(WXReadState *)v8 WXMainNamespace];
    uint64_t v63 = OCXFindChild(v58, v62, "left");

    if (v63
      || ([(WXReadState *)v8 WXMainNamespace],
          v64 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
          uint64_t v63 = OCXFindChild(v58, v64, "start"),
          v64,
          v63))
    {
      v65 = [v111 mutableLeftBorder];
      +[WXBorder readFrom:v63 to:v65 state:v8];
    }
    v66 = [(WXReadState *)v8 WXMainNamespace];
    uint64_t v67 = OCXFindChild(v58, v66, "bottom");

    if (v67)
    {
      v68 = [v111 mutableBottomBorder];
      +[WXBorder readFrom:v67 to:v68 state:v8];
    }
    v69 = [(WXReadState *)v8 WXMainNamespace];
    uint64_t v70 = OCXFindChild(v58, v69, "right");

    if (v70
      || ([(WXReadState *)v8 WXMainNamespace],
          v71 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
          uint64_t v70 = OCXFindChild(v58, v71, "end"),
          v71,
          v70))
    {
      v72 = [v111 mutableRightBorder];
      +[WXBorder readFrom:v70 to:v72 state:v8];
    }
    v73 = [(WXReadState *)v8 WXMainNamespace];
    uint64_t v74 = OCXFindChild(v58, v73, "insideV");

    if (v74)
    {
      v75 = [v111 mutableInsideVerticalBorder];
      +[WXBorder readFrom:v74 to:v75 state:v8];
    }
    v76 = [(WXReadState *)v8 WXMainNamespace];
    uint64_t v77 = OCXFindChild(v58, v76, "insideH");

    if (v77)
    {
      v78 = [v111 mutableInsideHorizontalBorder];
      +[WXBorder readFrom:v77 to:v78 state:v8];
    }
  }
  [(WXReadState *)v8 setCurrentTableWraps:0];
  v79 = [(WXReadState *)v8 WXMainNamespace];
  v80 = (_xmlNode *)OCXFindChild(a3, v79, "tblpPr");

  if (v80)
  {
    unsigned int v117 = 0;
    v81 = [a1 tableVerticalAnchorEnumMap];
    int v82 = readEnumProperty<WDVerticalAnchor>(v80, (const xmlChar *)"vertAnchor", v81, &v117);

    if (v82) {
      [v111 setVerticalAnchor:v117];
    }
    unsigned int v116 = 0;
    v83 = [a1 tableHorizontalAnchorEnumMap];
    int v84 = readEnumProperty<WDHorizontalAnchor>(v80, (const xmlChar *)"horzAnchor", v83, &v116);

    if (v84) {
      [v111 setHorizontalAnchor:v116];
    }
    *(void *)v115 = 0;
    int v114 = -4;
    v85 = [a1 tableVerticalPositionEnumMap];
    int v86 = readEnumProperty<WDVerticalPosition>(v80, (const xmlChar *)"tblpYSpec", v85, &v114);

    if (v86)
    {
      uint64_t v87 = v114;
    }
    else
    {
      v88 = [(WXReadState *)v8 WXMainNamespace];
      BOOL v89 = CXOptionalLongAttribute(v80, v88, (xmlChar *)"tblpY", (uint64_t *)v115, 14);

      if (!v89) {
        goto LABEL_68;
      }
      uint64_t v87 = *(void *)v115;
    }
    [v111 setVerticalPosition:v87];
LABEL_68:
    int v113 = 0;
    v90 = [a1 tableHorizontalPositionEnumMap];
    int v91 = readEnumProperty<WDHorizontalPosition>(v80, (const xmlChar *)"tblpXSpec", v90, &v113);

    if (v91)
    {
      uint64_t v92 = v113;
    }
    else
    {
      v93 = [(WXReadState *)v8 WXMainNamespace];
      BOOL v94 = CXOptionalLongAttribute(v80, v93, (xmlChar *)"tblpX", (uint64_t *)v115, 14);

      if (!v94)
      {
LABEL_73:
        v95 = [(WXReadState *)v8 WXMainNamespace];
        BOOL v96 = CXOptionalLongAttribute(v80, v95, (xmlChar *)"leftFromText", (uint64_t *)v115, 14);

        if (v96)
        {
          [v111 setLeftDistanceFromText:*(void *)v115];
          [(WXReadState *)v8 setCurrentTableWraps:1];
        }
        v97 = [(WXReadState *)v8 WXMainNamespace];
        BOOL v98 = CXOptionalLongAttribute(v80, v97, (xmlChar *)"topFromText", (uint64_t *)v115, 14);

        if (v98)
        {
          [v111 setTopDistanceFromText:*(void *)v115];
          [(WXReadState *)v8 setCurrentTableWraps:1];
        }
        v99 = [(WXReadState *)v8 WXMainNamespace];
        BOOL v100 = CXOptionalLongAttribute(v80, v99, (xmlChar *)"rightFromText", (uint64_t *)v115, 14);

        if (v100)
        {
          [v111 setRightDistanceFromText:*(void *)v115];
          [(WXReadState *)v8 setCurrentTableWraps:1];
        }
        v101 = [(WXReadState *)v8 WXMainNamespace];
        BOOL v102 = CXOptionalLongAttribute(v80, v101, (xmlChar *)"bottomFromText", (uint64_t *)v115, 14);

        if (v102)
        {
          [v111 setBottomDistanceFromText:*(void *)v115];
          [(WXReadState *)v8 setCurrentTableWraps:1];
        }
        goto LABEL_81;
      }
      uint64_t v92 = *(void *)v115;
    }
    [v111 setHorizontalPosition:v92];
    goto LABEL_73;
  }
LABEL_81:
  v103 = [(WXReadState *)v8 WXMainNamespace];
  v104 = (_xmlNode *)OCXFindChild(a3, v103, "tblPrChange");

  if (v104)
  {
    if (![v111 resolveMode]) {
      [v111 moveOrignalToTracked];
    }
    [v111 setFormattingChanged:1];
    v105 = wmxmlGetDateProperty(v104);
    [v111 setFormattingChangeDate:v105];

    v106 = [(WXReadState *)v8 document];
    v107 = wmxmlGetAuthorProperty(v104);
    objc_msgSend(v111, "setIndexToAuthorIDOfFormattingChange:", (unsigned __int16)objc_msgSend(v106, "revisionAuthorAddLookup:", v107));

    v108 = [(WXReadState *)v8 WXMainNamespace];
    uint64_t v109 = OCXFindChild(v104, v108, "tblPr");

    if (v109) {
      [a1 readFrom:v109 to:v111 state:v8];
    }
    [v111 setResolveMode:1];
  }
  v115[0] = 0;
  if (wmxmlGetBoolOnlyProperty(a3, "bidiVisual", (const xmlChar *)"val", v115, v8)) {
    [v111 setBiDirectional:v115[0]];
  }
}

+ (id)tableVerticalAnchorEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_45, 0, &dword_238A75000);
  }
  if (+[WXTableProperties tableVerticalAnchorEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXTableProperties tableVerticalAnchorEnumMap]::onceToken, &__block_literal_global_95);
  }
  v2 = (void *)+[WXTableProperties tableVerticalAnchorEnumMap]::sTableVerticalAnchorEnumMap;
  return v2;
}

void __47__WXTableProperties_tableVerticalAnchorEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXTableProperties tableVerticalAnchorEnumMap]::sTableVerticalAnchorEnumStructs count:3 caseSensitive:1];
  v1 = (void *)+[WXTableProperties tableVerticalAnchorEnumMap]::sTableVerticalAnchorEnumMap;
  +[WXTableProperties tableVerticalAnchorEnumMap]::sTableVerticalAnchorEnumMap = (uint64_t)v0;
}

+ (id)tableHorizontalAnchorEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_8_0, 0, &dword_238A75000);
  }
  if (+[WXTableProperties tableHorizontalAnchorEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXTableProperties tableHorizontalAnchorEnumMap]::onceToken, &__block_literal_global_10_0);
  }
  v2 = (void *)+[WXTableProperties tableHorizontalAnchorEnumMap]::sTableHorizontalAnchorEnumMap;
  return v2;
}

void __49__WXTableProperties_tableHorizontalAnchorEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXTableProperties tableHorizontalAnchorEnumMap]::sTableHorizontalAnchorEnumStructs count:3 caseSensitive:1];
  v1 = (void *)+[WXTableProperties tableHorizontalAnchorEnumMap]::sTableHorizontalAnchorEnumMap;
  +[WXTableProperties tableHorizontalAnchorEnumMap]::sTableHorizontalAnchorEnumMap = (uint64_t)v0;
}

+ (id)tableHorizontalPositionEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_26_2, 0, &dword_238A75000);
  }
  if (+[WXTableProperties tableHorizontalPositionEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXTableProperties tableHorizontalPositionEnumMap]::onceToken, &__block_literal_global_28_2);
  }
  v2 = (void *)+[WXTableProperties tableHorizontalPositionEnumMap]::sTableHorizontalPositionEnumMap;
  return v2;
}

void __51__WXTableProperties_tableHorizontalPositionEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXTableProperties tableHorizontalPositionEnumMap]::sTableHorizontalPositionEnumStructs count:5 caseSensitive:1];
  v1 = (void *)+[WXTableProperties tableHorizontalPositionEnumMap]::sTableHorizontalPositionEnumMap;
  +[WXTableProperties tableHorizontalPositionEnumMap]::sTableHorizontalPositionEnumMap = (uint64_t)v0;
}

+ (id)tableVerticalPositionEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_35_1, 0, &dword_238A75000);
  }
  if (+[WXTableProperties tableVerticalPositionEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXTableProperties tableVerticalPositionEnumMap]::onceToken, &__block_literal_global_37_0);
  }
  v2 = (void *)+[WXTableProperties tableVerticalPositionEnumMap]::sTableVerticalPositionEnumMap;
  return v2;
}

void __49__WXTableProperties_tableVerticalPositionEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXTableProperties tableVerticalPositionEnumMap]::sTableVerticalPositionEnumStructs count:5 caseSensitive:1];
  v1 = (void *)+[WXTableProperties tableVerticalPositionEnumMap]::sTableVerticalPositionEnumMap;
  +[WXTableProperties tableVerticalPositionEnumMap]::sTableVerticalPositionEnumMap = (uint64_t)v0;
}

+ (id)tableLookBitEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_56_1, 0, &dword_238A75000);
  }
  if (+[WXTableProperties tableLookBitEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXTableProperties tableLookBitEnumMap]::onceToken, &__block_literal_global_58);
  }
  v2 = (void *)+[WXTableProperties tableLookBitEnumMap]::sTableLookBitEnumMap;
  return v2;
}

void __40__WXTableProperties_tableLookBitEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXTableProperties tableLookBitEnumMap]::sTableLookBitEnumStructs count:6 caseSensitive:1];
  v1 = (void *)+[WXTableProperties tableLookBitEnumMap]::sTableLookBitEnumMap;
  +[WXTableProperties tableLookBitEnumMap]::sTableLookBitEnumMap = (uint64_t)v0;
}

@end