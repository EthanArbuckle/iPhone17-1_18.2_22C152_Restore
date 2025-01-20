@interface WXTableCellProperties
+ (id)verticalAlignmentEnumMap;
+ (unint64_t)bitfieldForCnfStyleFrom:(_xmlNode *)a3 state:(id)a4;
+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5;
+ (void)writeForDocument:(id)a3 state:(id)a4;
+ (void)writeForStyle:(id)a3 state:(id)a4;
@end

@implementation WXTableCellProperties

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [v9 WXMainNamespace];
  v11 = (_xmlNode *)OCXFindChild(a3, v10, "tcPrChange");

  if (v11)
  {
    v12 = [v9 WXMainNamespace];
    uint64_t v13 = OCXFindChild(v11, v12, "tcPr");

    if (v13) {
      [a1 readFrom:v13 to:v8 state:v9];
    }
    [v8 setResolveMode:1];
    [v8 setFormattingChanged:1];
    v14 = wmxmlGetDateProperty(v11);
    [v8 setFormattingChangeDate:v14];

    v15 = [v9 document];
    v16 = wmxmlGetAuthorProperty(v11);
    objc_msgSend(v8, "setIndexToAuthorIDOfFormattingChange:", (unsigned __int16)objc_msgSend(v15, "revisionAuthorAddLookup:", v16));
  }
  __int16 v85 = 0;
  unsigned int v84 = 0;
  v17 = [v9 WXMainNamespace];
  v18 = (xmlNode *)OCXFindChild(a3, v17, "tcW");

  v19 = [v9 WXMainNamespace];
  LODWORD(v18) = WXOptionalTableWidthAttribute(v18, v19, (xmlChar *)"w", &v85, &v84);

  if (v18)
  {
    [v8 setWidth:v85];
    [v8 setWidthType:v84];
  }
  v20 = [v9 WXMainNamespace];
  v21 = (_xmlNode *)OCXFindChild(a3, v20, "tcMar");

  if (v21)
  {
    v22 = [v9 WXMainNamespace];
    v23 = (xmlNode *)OCXFindChild(v21, v22, "top");

    v24 = [v9 WXMainNamespace];
    LODWORD(v23) = WXOptionalTableWidthAttribute(v23, v24, (xmlChar *)"w", &v85, &v84);

    if (v23)
    {
      [v8 setTopMargin:v85];
      [v8 setTopMarginType:v84];
    }
    v25 = [v9 WXMainNamespace];
    v26 = (xmlNode *)OCXFindChild(v21, v25, "bottom");

    v27 = [v9 WXMainNamespace];
    LODWORD(v26) = WXOptionalTableWidthAttribute(v26, v27, (xmlChar *)"w", &v85, &v84);

    if (v26)
    {
      [v8 setBottomMargin:v85];
      [v8 setBottomMarginType:v84];
    }
    v28 = [v9 WXMainNamespace];
    v29 = (xmlNode *)OCXFindChild(v21, v28, "left");

    if (!v29)
    {
      v30 = [v9 WXMainNamespace];
      v29 = (xmlNode *)OCXFindChild(v21, v30, "start");
    }
    v31 = [v9 WXMainNamespace];
    int v32 = WXOptionalTableWidthAttribute(v29, v31, (xmlChar *)"w", &v85, &v84);

    if (v32)
    {
      [v8 setLeftMargin:v85];
      [v8 setLeftMarginType:v84];
    }
    v33 = [v9 WXMainNamespace];
    v34 = (xmlNode *)OCXFindChild(v21, v33, "right");

    if (!v34)
    {
      v35 = [v9 WXMainNamespace];
      v34 = (xmlNode *)OCXFindChild(0, v35, "end");
    }
    v36 = [v9 WXMainNamespace];
    int v37 = WXOptionalTableWidthAttribute(v34, v36, (xmlChar *)"w", &v85, &v84);

    if (v37)
    {
      [v8 setRightMargin:v85];
      [v8 setRightMarginType:v84];
    }
  }
  BOOL v83 = 0;
  v38 = [v9 WXMainNamespace];
  v39 = (_xmlNode *)OCXFindChild(a3, v38, "noWrap");

  v40 = [v9 WXMainNamespace];
  LODWORD(v39) = CXOptionalBoolAttribute(v39, v40, (xmlChar *)"val", &v83);

  if (v39) {
    [v8 setNoWrap:v83];
  }
  v41 = [v9 WXMainNamespace];
  v42 = (const xmlNode *)OCXFindChild(a3, v41, "vMerge");

  if (v42)
  {
    [v8 setVerticallyMergedCell:1];
    Prop = xmlGetProp(v42, (const xmlChar *)"val");
    v44 = Prop;
    if (Prop)
    {
      objc_msgSend(v8, "setFirstInSetOfVerticallyMergedCells:", xmlStrcmp(Prop, (const xmlChar *)"restart") == 0);
      ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v44);
    }
    else
    {
      [v8 setFirstInSetOfVerticallyMergedCells:0];
    }
  }
  unsigned int v82 = 0;
  v45 = [a1 verticalAlignmentEnumMap];
  int v46 = readEnumProperty<WDVerticalAlignment>(a3, "vAlign", (const xmlChar *)"val", v45, &v82, v9);

  if (v46) {
    [v8 setVerticalAlignment:v82];
  }
  unsigned int v81 = 0;
  v47 = +[WXCommon textDirectionEnumMap];
  if (readEnumProperty<WDTextDirection>(a3, "textDirection", (const xmlChar *)"val", v47, &v81, v9))
  {
  }
  else
  {
    v48 = +[WXCommon strictTextDirectionEnumMap];
    int v49 = readEnumProperty<WDTextDirection>(a3, "textDirection", (const xmlChar *)"val", v48, &v81, v9);

    if (!v49) {
      goto LABEL_32;
    }
  }
  [v8 setTextDirection:v81];
LABEL_32:
  v50 = [v9 WXMainNamespace];
  uint64_t v51 = OCXFindChild(a3, v50, "shd");

  if (v51)
  {
    v52 = [v8 mutableShading];
    +[WXShading readFrom:v51 to:v52 state:v9];
  }
  v53 = [v9 WXMainNamespace];
  v54 = (_xmlNode *)OCXFindChild(a3, v53, "tcBorders");

  if (v54)
  {
    v55 = [v9 WXMainNamespace];
    uint64_t v56 = OCXFindChild(v54, v55, "top");

    if (v56)
    {
      v57 = [v8 mutableTopBorder];
      +[WXBorder readFrom:v56 to:v57 state:v9];
    }
    v58 = [v9 WXMainNamespace];
    uint64_t v59 = OCXFindChild(v54, v58, "left");

    if (v59
      || ([v9 WXMainNamespace],
          v60 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
          uint64_t v59 = OCXFindChild(v54, v60, "start"),
          v60,
          v59))
    {
      v61 = [v8 mutableLeftBorder];
      +[WXBorder readFrom:v59 to:v61 state:v9];
    }
    v62 = [v9 WXMainNamespace];
    uint64_t v63 = OCXFindChild(v54, v62, "bottom");

    if (v63)
    {
      v64 = [v8 mutableBottomBorder];
      +[WXBorder readFrom:v63 to:v64 state:v9];
    }
    v65 = [v9 WXMainNamespace];
    uint64_t v66 = OCXFindChild(v54, v65, "right");

    if (v66
      || ([v9 WXMainNamespace],
          v67 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
          uint64_t v66 = OCXFindChild(v54, v67, "end"),
          v67,
          v66))
    {
      v68 = [v8 mutableRightBorder];
      +[WXBorder readFrom:v66 to:v68 state:v9];
    }
    v69 = [v9 WXMainNamespace];
    uint64_t v70 = OCXFindChild(v54, v69, "insideH");

    if (v70)
    {
      v71 = [v8 mutableInsideHorizontalBorder];
      +[WXBorder readFrom:v70 to:v71 state:v9];
    }
    v72 = [v9 WXMainNamespace];
    uint64_t v73 = OCXFindChild(v54, v72, "insideV");

    if (v73)
    {
      v74 = [v8 mutableInsideVerticalBorder];
      +[WXBorder readFrom:v73 to:v74 state:v9];
    }
    v75 = [v9 WXMainNamespace];
    uint64_t v76 = OCXFindChild(v54, v75, "tl2br");

    if (v76)
    {
      v77 = [v8 mutableDiagonalDownBorder];
      +[WXBorder readFrom:v76 to:v77 state:v9];
    }
    v78 = [v9 WXMainNamespace];
    uint64_t v79 = OCXFindChild(v54, v78, "tr2bl");

    if (v79)
    {
      v80 = [v8 mutableDiagonalUpBorder];
      +[WXBorder readFrom:v79 to:v80 state:v9];
    }
  }
  objc_msgSend(v9, "setCurrentCellCNFStyle:", objc_msgSend(a1, "bitfieldForCnfStyleFrom:state:", a3, v9));
}

+ (id)verticalAlignmentEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_44, 0, &dword_238A75000);
  }
  if (+[WXTableCellProperties verticalAlignmentEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXTableCellProperties verticalAlignmentEnumMap]::onceToken, &__block_literal_global_94);
  }
  v2 = (void *)+[WXTableCellProperties verticalAlignmentEnumMap]::sVerticalAlignmentEnumMap;
  return v2;
}

void __49__WXTableCellProperties_verticalAlignmentEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXTableCellProperties verticalAlignmentEnumMap]::sVerticalAlignmentStructs count:3];
  v1 = (void *)+[WXTableCellProperties verticalAlignmentEnumMap]::sVerticalAlignmentEnumMap;
  +[WXTableCellProperties verticalAlignmentEnumMap]::sVerticalAlignmentEnumMap = (uint64_t)v0;
}

+ (unint64_t)bitfieldForCnfStyleFrom:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  v6 = [v5 WXMainNamespace];
  uint64_t v7 = OCXFindChild(a3, v6, "cnfStyle");

  if (v7)
  {
    id v8 = [v5 WXMainNamespace];
    id v51 = 0;
    BOOL v9 = CXOptionalStringAttribute((_xmlNode *)v7, v8, (xmlChar *)"val", &v51);
    id v10 = v51;

    if (v9)
    {
      if ([v10 length] == 12)
      {
        uint64_t v7 = 0;
        for (uint64_t i = 11; i != -1; --i)
          uint64_t v7 = ([v10 characterAtIndex:i] == 49) | (unint64_t)(2 * v7);
      }
      else
      {
        uint64_t v7 = 0;
      }
    }
    else
    {
      BOOL v50 = 0;
      v12 = [v5 WXMainNamespace];
      BOOL v13 = CXOptionalBoolAttribute((_xmlNode *)v7, v12, (xmlChar *)"firstRow", &v50);
      uint64_t v14 = v50 && v13;

      v15 = [v5 WXMainNamespace];
      BOOL v16 = CXOptionalBoolAttribute((_xmlNode *)v7, v15, (xmlChar *)"lastRow", &v50);
      BOOL v17 = v50;

      if (v16 && v17) {
        v14 |= 2uLL;
      }
      v18 = [v5 WXMainNamespace];
      BOOL v19 = CXOptionalBoolAttribute((_xmlNode *)v7, v18, (xmlChar *)"firstColumn", &v50);
      BOOL v20 = v50;

      if (v19 && v20) {
        v14 |= 4uLL;
      }
      v21 = [v5 WXMainNamespace];
      BOOL v22 = CXOptionalBoolAttribute((_xmlNode *)v7, v21, (xmlChar *)"lastColumn", &v50);
      BOOL v23 = v50;

      if (v22 && v23) {
        v14 |= 8uLL;
      }
      v24 = [v5 WXMainNamespace];
      BOOL v25 = CXOptionalBoolAttribute((_xmlNode *)v7, v24, (xmlChar *)"oddVBand", &v50);
      BOOL v26 = v50;

      if (v25 && v26) {
        v14 |= 0x10uLL;
      }
      v27 = [v5 WXMainNamespace];
      BOOL v28 = CXOptionalBoolAttribute((_xmlNode *)v7, v27, (xmlChar *)"evenVBand", &v50);
      BOOL v29 = v50;

      if (v28 && v29) {
        v14 |= 0x20uLL;
      }
      v30 = [v5 WXMainNamespace];
      BOOL v31 = CXOptionalBoolAttribute((_xmlNode *)v7, v30, (xmlChar *)"oddHBand", &v50);
      BOOL v32 = v50;

      if (v31 && v32) {
        v14 |= 0x40uLL;
      }
      v33 = [v5 WXMainNamespace];
      BOOL v34 = CXOptionalBoolAttribute((_xmlNode *)v7, v33, (xmlChar *)"evenHBand", &v50);
      BOOL v35 = v50;

      if (v34 && v35) {
        v14 |= 0x80uLL;
      }
      v36 = [v5 WXMainNamespace];
      BOOL v37 = CXOptionalBoolAttribute((_xmlNode *)v7, v36, (xmlChar *)"firstRowFirstColumn", &v50);
      BOOL v38 = v50;

      if (v37 && v38) {
        v14 |= 0x200uLL;
      }
      v39 = [v5 WXMainNamespace];
      BOOL v40 = CXOptionalBoolAttribute((_xmlNode *)v7, v39, (xmlChar *)"firstRowLastColumn", &v50);
      BOOL v41 = v50;

      if (v40 && v41) {
        v14 |= 0x100uLL;
      }
      v42 = [v5 WXMainNamespace];
      BOOL v43 = CXOptionalBoolAttribute((_xmlNode *)v7, v42, (xmlChar *)"lastRowFirstColumn", &v50);
      BOOL v44 = v50;

      if (v43 && v44) {
        uint64_t v45 = v14 | 0x800;
      }
      else {
        uint64_t v45 = v14;
      }
      int v46 = [v5 WXMainNamespace];
      BOOL v47 = CXOptionalBoolAttribute((_xmlNode *)v7, v46, (xmlChar *)"lastRowLastColumn", &v50);
      BOOL v48 = v50;

      if (v47 && v48) {
        uint64_t v7 = v45 | 0x400;
      }
      else {
        uint64_t v7 = v45;
      }
    }
  }
  return v7;
}

+ (void)writeForDocument:(id)a3 state:(id)a4
{
}

+ (void)writeForStyle:(id)a3 state:(id)a4
{
}

@end