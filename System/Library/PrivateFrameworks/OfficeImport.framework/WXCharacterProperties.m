@interface WXCharacterProperties
+ (BOOL)isBooleanCharacterPropertyTrue:(int)a3;
+ (BOOL)readBooleanCharacterMultipleProperty:(_xmlNode *)a3 propertyName:(const char *)a4 attributeName:(const char *)a5 outValue:(int *)a6 state:(id)a7;
+ (BOOL)readBooleanCharacterProperty:(_xmlNode *)a3 propertyName:(const char *)a4 attributeName:(const char *)a5 outValue:(int *)a6 state:(id)a7;
+ (TCEnumerationMap)emphasisMarkEnumMap;
+ (TCEnumerationMap)fontHintEnumMap;
+ (TCEnumerationMap)highlightEnumMap;
+ (TCEnumerationMap)ligaturesEnumMap;
+ (TCEnumerationMap)twoLineBracketsEnumMap;
+ (TCEnumerationMap)underlineEnumMap;
+ (TCEnumerationMap)verticalAlignEnumMap;
+ (id)readFillColor:(_xmlNode *)a3 forTarget:(id)a4 state:(id)a5;
+ (void)applyDeletionInsertionProperties:(id)a3 state:(id)a4;
+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5;
+ (void)readReflection:(id)a3 fromXmlNode:(_xmlNode *)a4 state:(id)a5;
+ (void)readShadowForTarget:(id)a3 fromXmlNode:(_xmlNode *)a4 state:(id)a5;
@end

@implementation WXCharacterProperties

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7 = a4;
  v8 = (WXReadState *)a5;
  [v7 setResolveMode:0];
  v9 = [(WXReadState *)v8 WXMainNamespace];
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "ins");

  if (v10)
  {
    [v7 setEdited:1];
    v11 = wmxmlGetDateProperty(v10);
    [v7 setEditDate:v11];

    v12 = [(WXReadState *)v8 document];
    v13 = wmxmlGetAuthorProperty(v10);
    objc_msgSend(v7, "setIndexToAuthorIDOfEdit:", (unsigned __int16)objc_msgSend(v12, "revisionAuthorAddLookup:", v13));
  }
  v14 = [(WXReadState *)v8 WXMainNamespace];
  v15 = (_xmlNode *)OCXFindChild(a3, v14, "del");

  if (v15)
  {
    [v7 setDeleted:1];
    v16 = wmxmlGetDateProperty(v15);
    [v7 setDeletionDate:v16];

    v17 = [(WXReadState *)v8 document];
    v18 = wmxmlGetAuthorProperty(v15);
    objc_msgSend(v7, "setIndexToAuthorIDOfDeletion:", (unsigned __int16)objc_msgSend(v17, "revisionAuthorAddLookup:", v18));
  }
  v19 = [(WXReadState *)v8 WXMainNamespace];
  v20 = (_xmlNode *)OCXFindChild(a3, v19, "rPrChange");

  if (v20)
  {
    v21 = [(WXReadState *)v8 WXMainNamespace];
    uint64_t v22 = OCXFindChild(v20, v21, "rPr");

    if (v22)
    {
      +[WXCharacterProperties readFrom:v22 to:v7 state:v8];
      [v7 setResolveMode:1];
      [v7 setFormattingChanged:1];
      v23 = [(WXReadState *)v8 document];
      v24 = wmxmlGetAuthorProperty(v20);
      objc_msgSend(v7, "setIndexToAuthorIDOfFormattingChange:", (unsigned __int16)objc_msgSend(v23, "revisionAuthorAddLookup:", v24));
    }
  }
  v178[0] = 0;
  if (+[WXCharacterProperties readBooleanCharacterProperty:a3 propertyName:"rtl" attributeName:"val" outValue:v178 state:v8])
  {
    [v7 setRightToLeft:v178[0]];
  }
  else if (!+[WXCharacterProperties readBooleanCharacterProperty:a3 propertyName:"cs" attributeName:"val" outValue:v178 state:v8])
  {
    goto LABEL_12;
  }
  [v7 setUseCsFont:v178[0]];
LABEL_12:
  if (+[WXCharacterProperties readBooleanCharacterProperty:a3 propertyName:"b" attributeName:"val" outValue:v178 state:v8])
  {
    [v7 setBold:v178[0]];
  }
  if (+[WXCharacterProperties readBooleanCharacterProperty:a3 propertyName:"bCs" attributeName:"val" outValue:v178 state:v8])
  {
    [v7 setBoldForBiText:v178[0]];
  }
  if (+[WXCharacterProperties readBooleanCharacterProperty:a3 propertyName:"i" attributeName:"val" outValue:v178 state:v8])
  {
    [v7 setItalic:v178[0]];
  }
  if (+[WXCharacterProperties readBooleanCharacterProperty:a3 propertyName:"iCs" attributeName:"val" outValue:v178 state:v8])
  {
    [v7 setItalicForBiText:v178[0]];
  }
  if (+[WXCharacterProperties readBooleanCharacterProperty:a3 propertyName:"smallCaps" attributeName:"val" outValue:v178 state:v8])
  {
    [v7 setSmallCaps:v178[0]];
  }
  if (+[WXCharacterProperties readBooleanCharacterProperty:a3 propertyName:"outline" attributeName:"val" outValue:v178 state:v8])
  {
    [v7 setOutline:v178[0]];
  }
  if (+[WXCharacterProperties readBooleanCharacterProperty:a3 propertyName:"shadow" attributeName:"val" outValue:v178 state:v8])
  {
    [v7 setShadow:v178[0]];
  }
  if (+[WXCharacterProperties readBooleanCharacterProperty:a3 propertyName:"emboss" attributeName:"val" outValue:v178 state:v8])
  {
    [v7 setEmbossed:v178[0]];
  }
  if (+[WXCharacterProperties readBooleanCharacterProperty:a3 propertyName:"imprint" attributeName:"val" outValue:v178 state:v8])
  {
    [v7 setImprint:v178[0]];
  }
  if (+[WXCharacterProperties readBooleanCharacterProperty:a3 propertyName:"strike" attributeName:"val" outValue:v178 state:v8])
  {
    [v7 setStrikeThrough:v178[0]];
  }
  if (+[WXCharacterProperties readBooleanCharacterProperty:a3 propertyName:"dstrike" attributeName:"val" outValue:v178 state:v8])
  {
    [v7 setDoubleStrikeThrough:v178[0]];
  }
  if (+[WXCharacterProperties readBooleanCharacterProperty:a3 propertyName:"caps" attributeName:"val" outValue:v178 state:v8])
  {
    [v7 setCaps:v178[0]];
  }
  if (+[WXCharacterProperties readBooleanCharacterProperty:a3 propertyName:"vanish" attributeName:"val" outValue:v178 state:v8])
  {
    [v7 setHidden:v178[0]];
  }
  uint64_t v177 = 0;
  v25 = [(WXReadState *)v8 WXMainNamespace];
  v26 = (_xmlNode *)OCXFindChild(a3, v25, "spacing");

  v27 = [(WXReadState *)v8 WXMainNamespace];
  LODWORD(v26) = CXOptionalLongAttribute(v26, v27, (xmlChar *)"val", &v177, 14);

  if (v26) {
    [v7 setSpacing:(__int16)v177];
  }
  v28 = [(WXReadState *)v8 WXMainNamespace];
  v29 = (_xmlNode *)OCXFindChild(a3, v28, "sz");

  v30 = [(WXReadState *)v8 WXMainNamespace];
  LODWORD(v29) = CXOptionalLongAttribute(v29, v30, (xmlChar *)"val", &v177, 15);

  if (v29) {
    [v7 setFontSize:(unsigned __int16)v177];
  }
  v31 = [(WXReadState *)v8 WXMainNamespace];
  v32 = (_xmlNode *)OCXFindChild(a3, v31, "szCs");

  v33 = [(WXReadState *)v8 WXMainNamespace];
  LODWORD(v32) = CXOptionalLongAttribute(v32, v33, (xmlChar *)"val", &v177, 15);

  if (v32) {
    [v7 setFontSizeForBiText:(unsigned __int16)v177];
  }
  v34 = [(WXReadState *)v8 WXMainNamespace];
  v35 = (_xmlNode *)OCXFindChild(a3, v34, "position");

  v36 = [(WXReadState *)v8 WXMainNamespace];
  LODWORD(v35) = CXOptionalLongAttribute(v35, v36, (xmlChar *)"val", &v177, 15);

  if (v35) {
    [v7 setPosition:(__int16)v177];
  }
  v37 = [(WXReadState *)v8 WXMainNamespace];
  v38 = (_xmlNode *)OCXFindChild(a3, v37, "kern");

  v39 = [(WXReadState *)v8 WXMainNamespace];
  LODWORD(v38) = CXOptionalLongAttribute(v38, v39, (xmlChar *)"val", &v177, 15);

  if (v38) {
    [v7 setKerning:(unsigned __int16)v177];
  }
  v40 = (_xmlNode *)OCXFindChild(a3, (CXNamespace *)WXWord2010Namespace, "reflection");
  if (CXOptionalLongAttribute(v40, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"dist", &v177))
  {
    v41 = objc_alloc_init(OADReflectionEffect);
    [a1 readReflection:v41 fromXmlNode:v40 state:v8];
    [v7 setReflection:v41];
  }
  uint64_t v42 = OCXFindChild(a3, (CXNamespace *)WXWord2010Namespace, "shadow");
  if (v42) {
    [a1 readShadowForTarget:v7 fromXmlNode:v42 state:v8];
  }
  v43 = [(WXReadState *)v8 WXMainNamespace];
  v44 = (_xmlNode *)OCXFindChild(a3, v43, "w");

  v45 = [(WXReadState *)v8 WXMainNamespace];
  LODWORD(v44) = CXOptionalLongAttribute(v44, v45, (xmlChar *)"val", &v177);

  if (v44) {
    [v7 setTextScale:(unsigned __int16)v177];
  }
  unsigned int v176 = 0;
  v46 = (const xmlNode *)OCXFindChild(a3, (CXNamespace *)WXWord2010Namespace, "ligatures");
  v47 = [a1 ligaturesEnumMap];
  LODWORD(v46) = readEnumProperty<WDLigatures>(v46, (const xmlChar *)"val", v47, &v176);

  if (v46) {
    [v7 setLigature:v176];
  }
  unsigned int v175 = 0;
  v48 = [a1 highlightEnumMap];
  int v49 = readEnumProperty<WDHighlightColor>(a3, "highlight", (const xmlChar *)"val", v48, &v175, v8);

  if (v49)
  {
    [v7 setHighlight:1];
    [v7 setHighlightColor:v175];
  }
  unsigned int v174 = 0;
  v50 = [a1 verticalAlignEnumMap];
  int v51 = readEnumProperty<WDCharacterVerticalAlign>(a3, "vertAlign", (const xmlChar *)"val", v50, &v174, v8);

  if (v51) {
    [v7 setVerticalAlign:v174];
  }
  unsigned int v173 = 0;
  v52 = [a1 emphasisMarkEnumMap];
  int v53 = readEnumProperty<WDCharacterEmphasisMark>(a3, "em", (const xmlChar *)"val", v52, &v173, v8);

  if (v53) {
    [v7 setEmphasisMark:v173];
  }
  v54 = [(WXReadState *)v8 WXMainNamespace];
  v55 = (_xmlNode *)OCXFindChild(a3, v54, "u");

  if (v55)
  {
    v56 = [(WXReadState *)v8 WXMainNamespace];
    id v172 = 0;
    BOOL v57 = CXOptionalStringAttribute(v55, v56, (xmlChar *)"val", &v172);
    id v58 = v172;

    if (v57)
    {
      v59 = [a1 underlineEnumMap];
      objc_msgSend(v7, "setUnderline:", objc_msgSend(v59, "valueForString:", v58));

      if ([v7 underline] == -130883970) {
        [v7 setUnderline:0];
      }
    }
    v60 = [(WXReadState *)v8 WXMainNamespace];
    id v171 = 0;
    BOOL v61 = CXOptionalStringAttribute(v55, v60, (xmlChar *)"color", &v171);
    id v62 = v171;

    if (v61)
    {
      v63 = +[WXShading getColorFromString:v62];
      [v7 setUnderlineColor:v63];
    }
  }
  v64 = [(WXReadState *)v8 WXMainNamespace];
  v65 = (_xmlNode *)OCXFindChild(a3, v64, "color");

  if (v65)
  {
    v66 = [(WXReadState *)v8 WXMainNamespace];
    id v170 = 0;
    BOOL v67 = CXOptionalStringAttribute(v65, v66, (xmlChar *)"val", &v170);
    id v68 = v170;

    if (v67)
    {
      v69 = +[WXShading getColorFromString:v68];
      [v7 setColor:v69];

      v70 = [v7 color];
      [v70 alphaComponent];
      BOOL v72 = v71 == 0.0;

      [v7 setColorAuto:v72];
    }
  }
  v73 = [(WXReadState *)v8 WXMainNamespace];
  v74 = (_xmlNode *)OCXFindChild(a3, v73, "rFonts");

  if (v74)
  {
    v75 = [v7 document];
    v155 = [v75 fontTable];

    v150 = [(WXReadState *)v8 document];
    v149 = [v150 theme];
    v148 = [v149 baseStyles];
    v154 = [v148 fontScheme];
    v76 = [(WXReadState *)v8 WXMainNamespace];
    id v169 = 0;
    LODWORD(v75) = CXOptionalStringAttribute(v74, v76, (xmlChar *)"asciiTheme", &v169);
    id v77 = v169;

    v153 = v77;
    if (v75)
    {
      if ([v77 rangeOfString:@"major"] == 0x7FFFFFFFFFFFFFFFLL) {
        [v154 minorFont];
      }
      else {
      v78 = [v154 majorFont];
      }
      v79 = [v78 latinFont];
    }
    else
    {
      v79 = 0;
    }
    v80 = [(WXReadState *)v8 WXMainNamespace];
    id v168 = v79;
    CXOptionalStringAttribute(v74, v80, (xmlChar *)"ascii", &v168);
    id v81 = v168;

    if (v81 && [v81 length])
    {
      v82 = [v155 fontWithName:v81 create:1];
      [v7 setFont:v82];
    }
    v83 = [(WXReadState *)v8 WXMainNamespace];
    id v167 = 0;
    BOOL v84 = CXOptionalStringAttribute(v74, v83, (xmlChar *)"cs", &v167);
    id v152 = v167;

    if (v84)
    {
      v85 = [v155 fontWithName:v152 create:1];
      [v7 setExtendedFont:v85];
    }
    v86 = [(WXReadState *)v8 WXMainNamespace];
    id v166 = 0;
    BOOL v87 = CXOptionalStringAttribute(v74, v86, (xmlChar *)"hAnsi", &v166);
    id v151 = v166;

    if (v87)
    {
      v88 = [v155 fontWithName:v151 create:1];
      [v7 setSymbolFont:v88];
    }
    v89 = [(WXReadState *)v8 WXMainNamespace];
    id v165 = 0;
    BOOL v90 = CXOptionalStringAttribute(v74, v89, (xmlChar *)"hint", &v165);
    id v91 = v165;

    if (v90)
    {
      v92 = [a1 fontHintEnumMap];
      objc_msgSend(v7, "setFontHint:", objc_msgSend(v92, "valueForString:", v91));
    }
    v93 = [(WXReadState *)v8 WXMainNamespace];
    id v164 = 0;
    BOOL v94 = CXOptionalStringAttribute(v74, v93, (xmlChar *)"eastAsiaTheme", &v164);
    id v95 = v164;

    if (!v94)
    {
      v100 = 0;
      goto LABEL_98;
    }
    if ([v95 rangeOfString:@"major"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v96 = [v154 minorFont];
      v97 = [v96 eastAsianFont];

      if (![v97 length])
      {
        v98 = [v154 minorFont];
        uint64_t v99 = [v98 latinFont];
LABEL_97:
        v100 = (void *)v99;

LABEL_98:
        v102 = [(WXReadState *)v8 WXMainNamespace];
        id v163 = v100;
        CXOptionalStringAttribute(v74, v102, (xmlChar *)"eastAsia", &v163);
        id v103 = v163;

        if (v103 && [v103 length])
        {
          v104 = [v155 fontWithName:v103 create:1];
          [v7 setFarEastFont:v104];
        }
        goto LABEL_102;
      }
    }
    else
    {
      v101 = [v154 majorFont];
      v97 = [v101 eastAsianFont];

      if (![v97 length])
      {
        v98 = [v154 majorFont];
        uint64_t v99 = [v98 latinFont];
        goto LABEL_97;
      }
    }
    v100 = v97;
    goto LABEL_98;
  }
LABEL_102:
  v105 = [(WXReadState *)v8 WXMainNamespace];
  v106 = (_xmlNode *)OCXFindChild(a3, v105, "lang");

  if (v106)
  {
    v107 = [(WXReadState *)v8 WXMainNamespace];
    id v162 = 0;
    CXOptionalStringAttribute(v106, v107, (xmlChar *)"val", &v162);
    v108 = (NSString *)v162;

    if (v108 && [(NSString *)v108 length]) {
      [v7 setLanguageForDefaultText:OCDLanguageFromOfficeString(v108)];
    }
    v109 = [(WXReadState *)v8 WXMainNamespace];
    v161 = v108;
    CXOptionalStringAttribute(v106, v109, (xmlChar *)"eastAsia", &v161);
    v110 = v161;

    if (v110 && [(NSString *)v110 length]) {
      [v7 setLanguageForFarEast:OCDLanguageFromOfficeString(v110)];
    }
    v111 = [(WXReadState *)v8 WXMainNamespace];
    v160 = v110;
    CXOptionalStringAttribute(v106, v111, (xmlChar *)"bidi", &v160);
    v112 = v160;

    if (v112 && [(NSString *)v112 length]) {
      [v7 setLanguageForBiText:OCDLanguageFromOfficeString(v112)];
    }
  }
  if (+[WXCharacterProperties readBooleanCharacterMultipleProperty:a3 propertyName:"eastAsianLayout" attributeName:"vert" outValue:v178 state:v8])
  {
    [v7 setHorizontalInVertical:v178[0] != 0];
    if (v178[0])
    {
      LODWORD(v158) = 0;
      if (+[WXCharacterProperties readBooleanCharacterMultipleProperty:a3 propertyName:"eastAsianLayout" attributeName:"vertCompress" outValue:&v158 state:v8])
      {
        [v7 setCompressHorizontalInVertical:v158 != 0];
      }
    }
  }
  if (+[WXCharacterProperties readBooleanCharacterMultipleProperty:a3 propertyName:"eastAsianLayout" attributeName:"combine" outValue:v178 state:v8])
  {
    [v7 setTwoLinesInOne:v178[0] != 0];
    if (v178[0])
    {
      LODWORD(v158) = 0;
      v113 = [a1 twoLineBracketsEnumMap];
      int v114 = readEnumProperty<WDTwoLineBrackets>(a3, "eastAsianLayout", (const xmlChar *)"combineBrackets", v113, &v158, v8);

      if (v114) {
        [v7 setBracketTwoLinesInOne:v158];
      }
    }
  }
  BOOL v159 = 0;
  BOOL BoolOnlyProperty = wmxmlGetBoolOnlyProperty(a3, "noProof", (const xmlChar *)"val", &v159, v8);
  if (v159 && BoolOnlyProperty) {
    [v7 setLanguageForDefaultText:1024];
  }
  v117 = [(WXReadState *)v8 WXMainNamespace];
  uint64_t v118 = OCXFindChild(a3, v117, "bdr");

  if (v118)
  {
    v119 = [v7 mutableBorder];
    +[WXBorder readFrom:v118 to:v119 state:v8];
  }
  v120 = [(WXReadState *)v8 WXMainNamespace];
  uint64_t v121 = OCXFindChild(a3, v120, "shd");

  if (v121)
  {
    v122 = [v7 mutableShading];
    +[WXShading readFrom:v121 to:v122 state:v8];
  }
  v123 = (_xmlNode *)OCXFindChild(a3, (CXNamespace *)WXWord2010Namespace, "textOutline");
  v124 = v123;
  if (v123)
  {
    uint64_t v158 = 9525;
    CXOptionalLongAttribute(v123, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"w", &v158);
    double v125 = (double)v158 / 12700.0;
    *(float *)&double v125 = v125;
    [v7 setOutline2010Width:v125];
    uint64_t v126 = OCXFindChild(v124, (CXNamespace *)WXWord2010Namespace, "solidFill");
    if (v126)
    {
      v127 = [a1 readFillColor:v126 forTarget:v7 state:v8];
      if (v127) {
        [v7 setOutlineColor:v127];
      }
    }
  }
  v128 = (_xmlNode *)OCXFindChild(a3, (CXNamespace *)WXWord2010Namespace, "textFill");
  v130 = v128;
  if (v128)
  {
    if (!OCXFindChild(v128, (CXNamespace *)WXWord2010Namespace, "noFill"))
    {
      uint64_t v129 = OCXFindChild(v130, (CXNamespace *)WXWord2010Namespace, "solidFill");
      if (v129)
      {
        v131 = [a1 readFillColor:v129 forTarget:v7 state:v8];
        v132 = v131;
        if (v131)
        {
          [v131 alphaComponent];
          if (v133 > 0.0)
          {
            [v7 setColor:v132];
            if ([v7 isOutline2010WidthOverridden])
            {
              [v7 outline2010Width];
              if (v134 > 0.0)
              {
                [v7 outline2010Width];
                *(float *)&double v136 = -v135;
                [v7 setOutline2010Width:v136];
              }
            }
          }
        }
      }
    }
  }
  v137 = [(WXReadState *)v8 WXMainNamespace];
  v138 = (_xmlNode *)OCXFindChild(a3, v137, "rStyle");

  v139 = [(WXReadState *)v8 WXMainNamespace];
  id v157 = 0;
  LODWORD(v138) = CXOptionalStringAttribute(v138, v139, (xmlChar *)"val", &v157);
  id v140 = v157;

  if (v138)
  {
    v141 = [(WXReadState *)v8 document];
    v142 = [v141 styleSheet];
    v143 = [v142 styleWithId:v140];

    if (v143) {
      [v7 setBaseStyle:v143];
    }
  }
  v144 = [(WXReadState *)v8 document];
  v145 = [v144 styleSheet];
  v146 = [v145 defaultParagraphStyle];
  v147 = [v146 characterProperties];
  [v7 negateFormattingChangesWithDefaults:v147];

  [v7 setResolveMode:2];
}

+ (void)applyDeletionInsertionProperties:(id)a3 state:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  [v13 setResolveMode:0];
  v6 = [v5 currentDeleteAuthor];
  uint64_t v7 = [v5 currentDeleteDate];
  v8 = (void *)v7;
  if (v6 && v7)
  {
    [v13 setDeleted:1];
    [v13 setDeletionDate:v8];
    v9 = [v5 document];
    objc_msgSend(v13, "setIndexToAuthorIDOfDeletion:", (unsigned __int16)objc_msgSend(v9, "revisionAuthorAddLookup:", v6));
  }
  v10 = [v5 currentEditAuthor];

  v11 = [v5 currentEditDate];

  if (v10 && v11)
  {
    [v13 setEdited:1];
    [v13 setEditDate:v11];
    v12 = [v5 document];
    objc_msgSend(v13, "setIndexToAuthorIDOfEdit:", (unsigned __int16)objc_msgSend(v12, "revisionAuthorAddLookup:", v10));
  }
  [v13 setResolveMode:2];
}

+ (TCEnumerationMap)underlineEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_31, 0, &dword_238A75000);
  }
  if (+[WXCharacterProperties underlineEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXCharacterProperties underlineEnumMap]::onceToken, &__block_literal_global_81);
  }
  v2 = (void *)+[WXCharacterProperties underlineEnumMap]::sUnderlineEnumMap;
  return (TCEnumerationMap *)v2;
}

void __41__WXCharacterProperties_underlineEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXCharacterProperties underlineEnumMap]::sUnderlineEnumStructs count:18 caseSensitive:1];
  v1 = (void *)+[WXCharacterProperties underlineEnumMap]::sUnderlineEnumMap;
  +[WXCharacterProperties underlineEnumMap]::sUnderlineEnumMap = (uint64_t)v0;
}

+ (TCEnumerationMap)highlightEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_101_0, 0, &dword_238A75000);
  }
  if (+[WXCharacterProperties highlightEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXCharacterProperties highlightEnumMap]::onceToken, &__block_literal_global_103);
  }
  v2 = (void *)+[WXCharacterProperties highlightEnumMap]::sHighlightEnumMap;
  return (TCEnumerationMap *)v2;
}

void __41__WXCharacterProperties_highlightEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXCharacterProperties highlightEnumMap]::sHighlightEnumStructs count:17 caseSensitive:1];
  v1 = (void *)+[WXCharacterProperties highlightEnumMap]::sHighlightEnumMap;
  +[WXCharacterProperties highlightEnumMap]::sHighlightEnumMap = (uint64_t)v0;
}

+ (TCEnumerationMap)ligaturesEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_113_0, 0, &dword_238A75000);
  }
  if (+[WXCharacterProperties ligaturesEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXCharacterProperties ligaturesEnumMap]::onceToken, &__block_literal_global_115);
  }
  v2 = (void *)+[WXCharacterProperties ligaturesEnumMap]::sLigaturesEnumMap;
  return (TCEnumerationMap *)v2;
}

void __41__WXCharacterProperties_ligaturesEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXCharacterProperties ligaturesEnumMap]::sLigaturesEnumStructs count:4 caseSensitive:1];
  v1 = (void *)+[WXCharacterProperties ligaturesEnumMap]::sLigaturesEnumMap;
  +[WXCharacterProperties ligaturesEnumMap]::sLigaturesEnumMap = (uint64_t)v0;
}

+ (TCEnumerationMap)verticalAlignEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_125_0, 0, &dword_238A75000);
  }
  if (+[WXCharacterProperties verticalAlignEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXCharacterProperties verticalAlignEnumMap]::onceToken, &__block_literal_global_127);
  }
  v2 = (void *)+[WXCharacterProperties verticalAlignEnumMap]::sVerticalAlignEnumMap;
  return (TCEnumerationMap *)v2;
}

void __45__WXCharacterProperties_verticalAlignEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXCharacterProperties verticalAlignEnumMap]::sVerticalAlignEnumStructs count:3 caseSensitive:1];
  v1 = (void *)+[WXCharacterProperties verticalAlignEnumMap]::sVerticalAlignEnumMap;
  +[WXCharacterProperties verticalAlignEnumMap]::sVerticalAlignEnumMap = (uint64_t)v0;
}

+ (TCEnumerationMap)emphasisMarkEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_140_0, 0, &dword_238A75000);
  }
  if (+[WXCharacterProperties emphasisMarkEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXCharacterProperties emphasisMarkEnumMap]::onceToken, &__block_literal_global_142);
  }
  v2 = (void *)+[WXCharacterProperties emphasisMarkEnumMap]::sEmphasisMarkEnumMap;
  return (TCEnumerationMap *)v2;
}

void __44__WXCharacterProperties_emphasisMarkEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXCharacterProperties emphasisMarkEnumMap]::sEmphasisMarkEnumStructs count:4 caseSensitive:1];
  v1 = (void *)+[WXCharacterProperties emphasisMarkEnumMap]::sEmphasisMarkEnumMap;
  +[WXCharacterProperties emphasisMarkEnumMap]::sEmphasisMarkEnumMap = (uint64_t)v0;
}

+ (TCEnumerationMap)twoLineBracketsEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_155_0, 0, &dword_238A75000);
  }
  if (+[WXCharacterProperties twoLineBracketsEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXCharacterProperties twoLineBracketsEnumMap]::onceToken, &__block_literal_global_157);
  }
  v2 = (void *)+[WXCharacterProperties twoLineBracketsEnumMap]::sTwoLineBracketsEnumMap;
  return (TCEnumerationMap *)v2;
}

void __47__WXCharacterProperties_twoLineBracketsEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXCharacterProperties twoLineBracketsEnumMap]::sTwoLineBracketsEnumStructs count:5 caseSensitive:1];
  v1 = (void *)+[WXCharacterProperties twoLineBracketsEnumMap]::sTwoLineBracketsEnumMap;
  +[WXCharacterProperties twoLineBracketsEnumMap]::sTwoLineBracketsEnumMap = (uint64_t)v0;
}

+ (TCEnumerationMap)fontHintEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_167_0, 0, &dword_238A75000);
  }
  if (+[WXCharacterProperties fontHintEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXCharacterProperties fontHintEnumMap]::onceToken, &__block_literal_global_169);
  }
  v2 = (void *)+[WXCharacterProperties fontHintEnumMap]::sFontHintEnumMap;
  return (TCEnumerationMap *)v2;
}

void __40__WXCharacterProperties_fontHintEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXCharacterProperties fontHintEnumMap]::sFontHintEnumStructs count:3 caseSensitive:1];
  v1 = (void *)+[WXCharacterProperties fontHintEnumMap]::sFontHintEnumMap;
  +[WXCharacterProperties fontHintEnumMap]::sFontHintEnumMap = (uint64_t)v0;
}

+ (void)readShadowForTarget:(id)a3 fromXmlNode:(_xmlNode *)a4 state:(id)a5
{
  id v6 = a3;
  uint64_t v7 = +[OAXBaseTypes readRectAlignmentFromXmlNode:a4 name:"algn"];
  uint64_t v56 = 0;
  CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"sx", &v56);
  BOOL v45 = v7 == 0 && v56 == 0;
  v8 = off_264D60518;
  if (!v45) {
    v8 = off_264D60530;
  }
  id v9 = objc_alloc_init(*v8);
  uint64_t v55 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"blurRad", &v55))
  {
    double v10 = (double)(uint64_t)(float)v55 / 25400.0;
    *(float *)&double v10 = v10;
    [v9 setBlurRadius:v10];
  }
  uint64_t v54 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"dist", &v54))
  {
    double v11 = (double)(uint64_t)(float)v54 / 19050.0;
    *(float *)&double v11 = v11;
    [v9 setDistance:v11];
  }
  uint64_t v53 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"dir", &v53))
  {
    double v12 = (double)v53 / 60000.0;
    *(float *)&double v12 = v12;
    [v9 setAngle:v12];
  }
  id v13 = (_xmlNode *)OCXFindChild(a4, (CXNamespace *)WXWord2010Namespace, "srgbClr");
  v14 = v13;
  if (!v13)
  {
    v14 = (_xmlNode *)OCXFindChild(a4, (CXNamespace *)WXWord2010Namespace, "schemeClr");
    id v51 = 0;
    BOOL v27 = CXOptionalStringAttribute(v14, (void *)WXWord2010Namespace, (xmlChar *)"val", &v51);
    id v16 = v51;
    if (v27)
    {
      id v44 = v6;
      v17 = [v6 document];
      unsigned int v42 = v7;
      v43 = [v17 theme];
      v28 = [v43 baseStyles];
      v29 = [v28 colorScheme];
      v30 = [v17 colorMap];
      v26 = +[OAXColorScheme colorForScheme:v29 colorMap:v30 value:v16];

      id v6 = v44;
      uint64_t v7 = v42;
      goto LABEL_14;
    }
LABEL_15:
    v26 = 0;
    goto LABEL_16;
  }
  id v52 = 0;
  BOOL v15 = CXOptionalStringAttribute(v13, (void *)WXWord2010Namespace, (xmlChar *)"val", &v52);
  id v16 = v52;
  if (!v15) {
    goto LABEL_15;
  }
  v17 = +[WXShading getColorFromString:v16];
  [v17 redComponent];
  double v19 = v18;
  [v17 greenComponent];
  double v21 = v20;
  [v17 blueComponent];
  float v22 = v19;
  *(float *)&double v23 = v21;
  *(float *)&double v25 = v24;
  *(float *)&double v24 = v22;
  v26 = +[OADRgbColor rgbColorWithRed:v24 green:v23 blue:v25];
LABEL_14:

LABEL_16:
  if (v14 && v26)
  {
    [v9 setColor:v26];
    v31 = (_xmlNode *)OCXFindChild(v14, (CXNamespace *)WXWord2010Namespace, "alpha");
    id v50 = 0;
    BOOL v32 = CXOptionalStringAttribute(v31, (void *)WXWord2010Namespace, (xmlChar *)"val", &v50);
    id v33 = v50;
    v34 = v33;
    LODWORD(v35) = 0.5;
    if (v32)
    {
      double v35 = (double)(int)objc_msgSend(v33, "intValue", v35) / -100000.0 + 1.0;
      *(float *)&double v35 = v35;
    }
    [v6 setShadow2010Opacity:v35];
  }
  if (!v45)
  {
    id v36 = v9;
    v37 = v36;
    if (v7) {
      [v36 setAlignment:v7];
    }
    if (v56)
    {
      double v38 = (double)v56 / 100000.0;
      *(float *)&double v38 = v38;
      [v37 setXScale:v38];
    }
    uint64_t v49 = 0;
    if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"sy", &v49))
    {
      double v39 = (double)v49 / 100000.0;
      *(float *)&double v39 = v39;
      [v37 setYScale:v39];
    }
    uint64_t v48 = 0;
    if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"kx", &v48))
    {
      double v40 = (double)v48 / 60000.0;
      *(float *)&double v40 = v40;
      [v37 setXSkew:v40];
    }
    uint64_t v47 = 0;
    if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"ky", &v47))
    {
      double v41 = (double)v47 / 60000.0;
      *(float *)&double v41 = v41;
      [v37 setYSkew:v41];
    }
    BOOL v46 = 0;
    if (CXOptionalBoolAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"rotWithShape", &v46)) {
      [v37 setRotateWithShape:v46];
    }
  }
  [v6 setShadow2010:v9];
}

+ (BOOL)readBooleanCharacterMultipleProperty:(_xmlNode *)a3 propertyName:(const char *)a4 attributeName:(const char *)a5 outValue:(int *)a6 state:(id)a7
{
  BOOL v10 = 0;
  int BoolProperty = wmxmlGetBoolProperty(a3, a4, (const xmlChar *)a5, &v10, (WXReadState *)a7);
  if (BoolProperty) {
    *a6 = v10;
  }
  return BoolProperty;
}

+ (void)readReflection:(id)a3 fromXmlNode:(_xmlNode *)a4 state:(id)a5
{
  id v6 = a3;
  uint64_t v32 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"blurRad", &v32))
  {
    double v7 = (double)v32 / 12700.0;
    *(float *)&double v7 = v7;
    [v6 setBlurRadius:v7];
  }
  uint64_t v31 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"stA", &v31))
  {
    double v8 = (double)v31 / 100000.0;
    *(float *)&double v8 = v8;
    [v6 setStartOpacity:v8];
  }
  uint64_t v30 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"stPos", &v30))
  {
    double v9 = (double)v30 / 100000.0;
    *(float *)&double v9 = v9;
    [v6 setStartPosition:v9];
  }
  uint64_t v29 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"endA", &v29))
  {
    double v10 = (double)v29 / 100000.0;
    *(float *)&double v10 = v10;
    [v6 setEndOpacity:v10];
  }
  uint64_t v28 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"endPos", &v28))
  {
    double v11 = (double)v28 / 100000.0;
    *(float *)&double v11 = v11;
    [v6 setEndPosition:v11];
  }
  uint64_t v27 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"dist", &v27))
  {
    double v12 = (double)v27 / 12700.0;
    *(float *)&double v12 = v12;
    [v6 setDistance:v12];
  }
  uint64_t v26 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"dir", &v26))
  {
    double v13 = (double)v26 / 60000.0;
    *(float *)&double v13 = v13;
    [v6 setDirection:v13];
  }
  uint64_t v25 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"fadeDir", &v25))
  {
    double v14 = (double)v25 / 60000.0;
    *(float *)&double v14 = v14;
    [v6 setFadeDirection:v14];
  }
  uint64_t v24 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"sx", &v24))
  {
    double v15 = (double)v24 / 100000.0;
    *(float *)&double v15 = v15;
    [v6 setXScale:v15];
  }
  uint64_t v23 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"sy", &v23))
  {
    double v16 = (double)v23 / 100000.0;
    *(float *)&double v16 = v16;
    [v6 setYScale:v16];
  }
  uint64_t v22 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"kx", &v22))
  {
    double v17 = (double)v22 / 60000.0;
    *(float *)&double v17 = v17;
    [v6 setXSkew:v17];
  }
  uint64_t v21 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"ky", &v21))
  {
    double v18 = (double)v21 / 60000.0;
    *(float *)&double v18 = v18;
    [v6 setYSkew:v18];
  }
  uint64_t v19 = +[OAXBaseTypes readRectAlignmentFromXmlNode:a4 name:"algn"];
  if (v19) {
    [v6 setAlignment:v19];
  }
  BOOL v20 = 0;
  if (CXOptionalBoolAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"rotWithShape", &v20)) {
    [v6 setRotateWithShape:v20];
  }
}

+ (id)readFillColor:(_xmlNode *)a3 forTarget:(id)a4 state:(id)a5
{
  id v6 = a5;
  double v7 = (_xmlNode *)OCXFindChild(a3, (CXNamespace *)WXWord2010Namespace, "srgbClr");
  if (v7)
  {
    id v19 = 0;
    BOOL v8 = CXOptionalStringAttribute(v7, (void *)WXWord2010Namespace, (xmlChar *)"val", &v19);
    id v9 = v19;
    if (v8)
    {
      double v10 = +[WXShading getColorFromString:v9];
    }
    else
    {
      double v10 = 0;
    }
  }
  else
  {
    double v11 = (_xmlNode *)OCXFindChild(a3, (CXNamespace *)WXWord2010Namespace, "schemeClr");
    if (!v11)
    {
      double v10 = 0;
      goto LABEL_14;
    }
    id v9 = [v6 drawingState];
    id v18 = 0;
    BOOL v12 = CXOptionalStringAttribute(v11, (void *)WXWord2010Namespace, (xmlChar *)"val", &v18);
    id v13 = v18;
    if (v12)
    {
      double v14 = +[OAXColor readPresetColorFromAttribute:v13];
      if (v14
        || (+[OAXColor readSchemeColorFromAttribute:v13],
            (double v14 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        double v15 = [v9 colorMap];
        double v16 = [v9 colorScheme];
        double v10 = +[OADColor tsuColorWithColor:v14 colorMap:v15 colorScheme:v16 colorPalette:0];
      }
      else
      {
        double v10 = +[OITSUColor blackColor];
      }
    }
    else
    {
      double v10 = 0;
    }
  }
LABEL_14:

  return v10;
}

+ (BOOL)readBooleanCharacterProperty:(_xmlNode *)a3 propertyName:(const char *)a4 attributeName:(const char *)a5 outValue:(int *)a6 state:(id)a7
{
  BOOL v10 = 0;
  BOOL BoolOnlyProperty = wmxmlGetBoolOnlyProperty(a3, a4, (const xmlChar *)a5, &v10, (WXReadState *)a7);
  if (BoolOnlyProperty) {
    *a6 = v10;
  }
  return BoolOnlyProperty;
}

+ (BOOL)isBooleanCharacterPropertyTrue:(int)a3
{
  return a3 == 1;
}

@end