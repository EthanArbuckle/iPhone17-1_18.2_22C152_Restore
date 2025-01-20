@interface WXStyle
+ (id)styleTypeEnumMap;
+ (id)tableStyleOverrideTypeEnumMap;
+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 defaults:(_xmlNode *)a5 state:(id)a6;
@end

@implementation WXStyle

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 defaults:(_xmlNode *)a5 state:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v12 = [v10 styleSheet];
  BOOL v68 = 0;
  v13 = [v11 WXMainNamespace];
  BOOL v14 = CXOptionalBoolAttribute(a3, v13, (xmlChar *)"default", &v68);
  BOOL v15 = v68 && v14;

  if (v15)
  {
    unsigned int v67 = 1;
    v16 = [a1 styleTypeEnumMap];
    int v17 = readEnumProperty<WDStyleType>(a3, (const xmlChar *)"type", v16, &v67);

    if (v17)
    {
      switch(v67)
      {
        case 1u:
          [v12 setDefaultParagraphStyle:v10];
          break;
        case 2u:
          [v12 setDefaultCharacterStyle:v10];
          break;
        case 3u:
          [v12 setDefaultTableStyle:v10];
          break;
        case 4u:
          [v12 setDefaultListStyle:v10];
          break;
        default:
          break;
      }
    }
  }
  v18 = [v11 WXMainNamespace];
  v19 = (_xmlNode *)OCXFindChild(a3, v18, "uiName");

  if (v19
    || ([v11 WXMainNamespace],
        v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
        v19 = (_xmlNode *)OCXFindChild(a3, v20, "name"),
        v20,
        v19))
  {
    v21 = [v11 WXMainNamespace];
    id v66 = 0;
    BOOL v22 = CXOptionalStringAttribute(v19, v21, (xmlChar *)"val", &v66);
    id v23 = v66;

    if (v22) {
      [v10 setName:v23];
    }
  }
  else
  {
    id v23 = 0;
  }
  v24 = [v11 WXMainNamespace];
  v25 = (_xmlNode *)OCXFindChild(a3, v24, "aliases");

  if (!v25)
  {
    id v63 = v23;
    if (!a5) {
      goto LABEL_34;
    }
    goto LABEL_27;
  }
  v26 = [v11 WXMainNamespace];
  id v65 = v23;
  BOOL v27 = CXOptionalStringAttribute(v25, v26, (xmlChar *)"val", &v65);
  id v28 = v65;

  id v63 = v28;
  if (v27)
  {
    v29 = objc_msgSend(v28, "componentsSeparatedByString:", @",", v28);
    uint64_t v30 = [v29 count];
    if (v30)
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        v32 = [v29 objectAtIndex:i];
        if ([v32 length]) {
          [v12 addStyle:v10 name:v32];
        }
      }
    }
  }
  if (a5)
  {
LABEL_27:
    if (v68)
    {
      v33 = [v11 WXMainNamespace];
      v34 = (_xmlNode *)OCXFindChild(a5, v33, "rPrDefault");

      if (v34)
      {
        v35 = [v11 WXMainNamespace];
        uint64_t v36 = OCXFindChild(v34, v35, "rPr");

        if (v36)
        {
          v37 = [v12 defaultCharacterProperties];
          +[WXCharacterProperties readFrom:v36 to:v37 state:v11];
        }
      }
      objc_msgSend(v11, "WXMainNamespace", v63);
      v38 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v39 = (_xmlNode *)OCXFindChild(a5, v38, "pPrDefault");

      if (v39)
      {
        v40 = [v11 WXMainNamespace];
        uint64_t v41 = OCXFindChild(v39, v40, "pPr");

        if (v41)
        {
          v42 = [v12 defaultParagraphProperties];
          +[WXParagraphProperties readFrom:v41 to:v42 readBaseStyle:0 state:v11];
        }
      }
    }
  }
LABEL_34:
  objc_msgSend(v11, "WXMainNamespace", v63);
  v43 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  uint64_t v44 = OCXFindChild(a3, v43, "rPr");

  if (v44)
  {
    v45 = [v10 characterProperties];
    +[WXCharacterProperties readFrom:v44 to:v45 state:v11];
  }
  v46 = [v11 WXMainNamespace];
  uint64_t v47 = OCXFindChild(a3, v46, "pPr");

  if (v47)
  {
    v48 = [v10 paragraphProperties];
    +[WXParagraphProperties readFrom:v47 to:v48 readBaseStyle:0 state:v11];
  }
  if ([v10 type] == 3)
  {
    v49 = [v11 WXMainNamespace];
    uint64_t v50 = OCXFindChild(a3, v49, "tblPr");

    if (v50)
    {
      v51 = [v10 tableProperties];
      +[WXTableProperties readFrom:v50 to:v51 state:v11];
    }
    v52 = [v11 WXMainNamespace];
    uint64_t v53 = OCXFindChild(a3, v52, "trPr");

    if (v53)
    {
      v54 = [v10 tableRowProperties];
      +[WXTableRowProperties readFrom:v53 to:v54 state:v11];
    }
    v55 = [v11 WXMainNamespace];
    uint64_t v56 = OCXFindChild(a3, v55, "tcPr");

    if (v56)
    {
      v57 = [v10 tableCellProperties];
      +[WXTableCellProperties readFrom:v56 to:v57 state:v11];
    }
    v58 = [v11 WXMainNamespace];
    Child = (_xmlNode *)OCXFindChild(a3, v58, "tblStylePr");

    while (Child)
    {
      unsigned int v67 = 0;
      v60 = [a1 tableStyleOverrideTypeEnumMap];
      readEnumProperty<WDTableStylePart>(Child, (const xmlChar *)"type", v60, &v67);

      v61 = [v10 tableStyleOverrideForPart:v67];
      +[WXTableStyleOverride readFrom:Child to:v61 state:v11];
      v62 = [v11 WXMainNamespace];
      Child = OCXFindNextChild(Child, v62, (xmlChar *)"tblStylePr");
    }
  }
}

+ (id)styleTypeEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_42, 0, &dword_238A75000);
  }
  if (+[WXStyle styleTypeEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXStyle styleTypeEnumMap]::onceToken, &__block_literal_global_92);
  }
  v2 = (void *)+[WXStyle styleTypeEnumMap]::sStyleTypeEnumMap;
  return v2;
}

void __27__WXStyle_styleTypeEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXStyle styleTypeEnumMap]::sStyleTypeEnumStructs count:4];
  v1 = (void *)+[WXStyle styleTypeEnumMap]::sStyleTypeEnumMap;
  +[WXStyle styleTypeEnumMap]::sStyleTypeEnumMap = (uint64_t)v0;
}

+ (id)tableStyleOverrideTypeEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_47_1, 0, &dword_238A75000);
  }
  if (+[WXStyle tableStyleOverrideTypeEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXStyle tableStyleOverrideTypeEnumMap]::onceToken, &__block_literal_global_49_0);
  }
  v2 = (void *)+[WXStyle tableStyleOverrideTypeEnumMap]::sTableStyleOverrideTypeEnumMap;
  return v2;
}

void __40__WXStyle_tableStyleOverrideTypeEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXStyle tableStyleOverrideTypeEnumMap]::sTableStyleOverrideTypeEnumStructs count:12 caseSensitive:1];
  v1 = (void *)+[WXStyle tableStyleOverrideTypeEnumMap]::sTableStyleOverrideTypeEnumMap;
  +[WXStyle tableStyleOverrideTypeEnumMap]::sTableStyleOverrideTypeEnumMap = (uint64_t)v0;
}

@end