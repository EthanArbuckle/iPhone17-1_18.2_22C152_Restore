@interface EXFont
+ (id)edFontFromXmlFontElement:(_xmlNode *)a3 inConditionalFormat:(BOOL)a4 returnDefaultIfEmpty:(BOOL)a5 state:(id)a6;
+ (id)underlineEnumMap;
+ (id)vertAlignEnumMap;
+ (int)edScriptFromXmlVertAlignElement:(_xmlNode *)a3;
+ (int)edUnderlineFromXmlUnderlineElement:(_xmlNode *)a3;
@end

@implementation EXFont

+ (int)edUnderlineFromXmlUnderlineElement:(_xmlNode *)a3
{
  if (!a3) {
    return 0;
  }
  id v11 = 0;
  BOOL v4 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"val", &v11);
  id v5 = v11;
  if (v5) {
    BOOL v6 = v4;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    v7 = [a1 underlineEnumMap];
    uint64_t v8 = [v7 valueForString:v5];

    if (v8 == -130883970) {
      int v9 = 1;
    }
    else {
      int v9 = v8;
    }
  }
  else
  {
    int v9 = 1;
  }

  return v9;
}

+ (int)edScriptFromXmlVertAlignElement:(_xmlNode *)a3
{
  if (!a3) {
    return 0;
  }
  id v11 = 0;
  BOOL v4 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"val", &v11);
  id v5 = v11;
  if (v5) {
    BOOL v6 = v4;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    v7 = [a1 vertAlignEnumMap];
    uint64_t v8 = [v7 valueForString:v5];

    if (v8 == -130883970) {
      int v9 = 0;
    }
    else {
      int v9 = v8;
    }
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

+ (id)underlineEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_25, 0, &dword_238A75000);
  }
  if (+[EXFont underlineEnumMap]::once != -1) {
    dispatch_once(&+[EXFont underlineEnumMap]::once, &__block_literal_global_75);
  }
  v2 = (void *)+[EXFont underlineEnumMap]::sUnderlineEnumMap;
  return v2;
}

void __26__EXFont_underlineEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[EXFont underlineEnumMap]::sUnderlineStructs count:5 caseSensitive:1];
  v1 = (void *)+[EXFont underlineEnumMap]::sUnderlineEnumMap;
  +[EXFont underlineEnumMap]::sUnderlineEnumMap = (uint64_t)v0;
}

+ (id)vertAlignEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_23_0, 0, &dword_238A75000);
  }
  if (+[EXFont vertAlignEnumMap]::once != -1) {
    dispatch_once(&+[EXFont vertAlignEnumMap]::once, &__block_literal_global_25_0);
  }
  v2 = (void *)+[EXFont vertAlignEnumMap]::sVertAlignEnumMap;
  return v2;
}

void __26__EXFont_vertAlignEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[EXFont vertAlignEnumMap]::sVertAlignStructs count:3 caseSensitive:1];
  v1 = (void *)+[EXFont vertAlignEnumMap]::sVertAlignEnumMap;
  +[EXFont vertAlignEnumMap]::sVertAlignEnumMap = (uint64_t)v0;
}

+ (id)edFontFromXmlFontElement:(_xmlNode *)a3 inConditionalFormat:(BOOL)a4 returnDefaultIfEmpty:(BOOL)a5 state:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  if (!a3)
  {
    v21 = 0;
    goto LABEL_56;
  }
  id v11 = [EDFont alloc];
  v12 = [v10 resources];
  v13 = [(EDFont *)v11 initWithResources:v12];

  v14 = [v10 EXSpreadsheetMLNamespace];
  v15 = (_xmlNode *)OCXFindChild(a3, v14, "name");

  BOOL v57 = v6;
  if (v15) {
    goto LABEL_5;
  }
  v16 = [v10 EXSpreadsheetMLNamespace];
  v15 = (_xmlNode *)OCXFindChild(a3, v16, "font");

  if (v15
    || ([v10 EXSpreadsheetMLNamespace],
        v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
        v15 = (_xmlNode *)OCXFindChild(a3, v17, "rFont"),
        v17,
        v15))
  {
LABEL_5:
    id v66 = 0;
    BOOL v18 = CXOptionalStringAttribute(v15, (void *)CXNoNamespace, (xmlChar *)"val", &v66);
    id v19 = v66;
    if (v18)
    {
      [(EDFont *)v13 setName:v19];
      int v20 = 1;
    }
    else
    {
      int v20 = 0;
    }
  }
  else
  {
    int v20 = 0;
    id v19 = 0;
  }
  uint64_t v65 = 0;
  v22 = [v10 EXSpreadsheetMLNamespace];
  v23 = (_xmlNode *)OCXFindChild(a3, v22, "charset");

  if (v23 && CXOptionalLongAttribute(v23, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v65))
  {
    [(EDFont *)v13 setCharSet:v65];
    int v20 = 1;
  }
  uint64_t v64 = 0;
  v24 = [v10 EXSpreadsheetMLNamespace];
  v25 = (_xmlNode *)OCXFindChild(a3, v24, "family");

  if (v25 && CXOptionalLongAttribute(v25, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v64))
  {
    [(EDFont *)v13 setFamily:v64];
    int v20 = 1;
  }
  BOOL v63 = 0;
  v26 = [v10 EXSpreadsheetMLNamespace];
  v27 = (_xmlNode *)OCXFindChild(a3, v26, "b");

  if (v27)
  {
    BOOL v28 = !CXOptionalBoolAttribute(v27, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v63);
    uint64_t v29 = v63 || v28;
    [(EDFont *)v13 setBold:v29];
    int v20 = 1;
  }
  if ([(EDFont *)v13 isBold])
  {
    [(EDFont *)v13 setWeight:700];
    int v20 = 1;
  }
  uint64_t v62 = 0;
  v30 = [v10 EXSpreadsheetMLNamespace];
  v31 = (_xmlNode *)OCXFindChild(a3, v30, "i");

  if (v31)
  {
    BOOL v32 = !CXOptionalLongAttribute(v31, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v62);
    if (v62) {
      uint64_t v33 = 1;
    }
    else {
      uint64_t v33 = v32;
    }
    [(EDFont *)v13 setItalic:v33];
    int v20 = 1;
  }
  uint64_t v61 = 0;
  v34 = [v10 EXSpreadsheetMLNamespace];
  v35 = (_xmlNode *)OCXFindChild(a3, v34, "strike");

  if (v35)
  {
    BOOL v36 = !CXOptionalLongAttribute(v35, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v61);
    if (v61) {
      uint64_t v37 = 1;
    }
    else {
      uint64_t v37 = v36;
    }
    [(EDFont *)v13 setStrike:v37];
    int v20 = 1;
  }
  uint64_t v60 = 0;
  v38 = [v10 EXSpreadsheetMLNamespace];
  v39 = (_xmlNode *)OCXFindChild(a3, v38, "shadow");

  if (v39)
  {
    BOOL v40 = !CXOptionalLongAttribute(v39, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v60);
    if (v60) {
      uint64_t v41 = 1;
    }
    else {
      uint64_t v41 = v40;
    }
    [(EDFont *)v13 setShadow:v41];
    int v20 = 1;
  }
  uint64_t v59 = 0;
  v42 = [v10 EXSpreadsheetMLNamespace];
  v43 = (_xmlNode *)OCXFindChild(a3, v42, "outline");

  if (v43)
  {
    BOOL v44 = !CXOptionalLongAttribute(v43, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v59);
    if (v59) {
      uint64_t v45 = 1;
    }
    else {
      uint64_t v45 = v44;
    }
    [(EDFont *)v13 setOutline:v45];
    int v20 = 1;
  }
  v46 = [v10 EXSpreadsheetMLNamespace];
  uint64_t v47 = OCXFindChild(a3, v46, "color");

  if (!v7 || v47)
  {
    v48 = +[EXColorReference edColorReferenceFromXmlColorElement:v47 callerClass:objc_opt_class() state:v10];
    [(EDFont *)v13 setColorReference:v48];

    if (v47) {
      int v20 = 1;
    }
  }
  double v58 = 0.0;
  v49 = [v10 EXSpreadsheetMLNamespace];
  v50 = (_xmlNode *)OCXFindChild(a3, v49, "sz");

  if (v50 && CXOptionalDoubleAttribute(v50, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v58))
  {
    [(EDFont *)v13 setHeight:(double)(int)(v58 * 20.0)];
    int v20 = 1;
  }
  v51 = [v10 EXSpreadsheetMLNamespace];
  uint64_t v52 = OCXFindChild(a3, v51, "u");

  uint64_t v53 = [a1 edUnderlineFromXmlUnderlineElement:v52];
  if (v53)
  {
    [(EDFont *)v13 setUnderline:v53];
    int v20 = 1;
  }
  objc_msgSend(v10, "EXSpreadsheetMLNamespace", v53);
  v54 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  uint64_t v55 = OCXFindChild(a3, v54, "vertAlign");

  if (v55)
  {
    -[EDFont setScript:](v13, "setScript:", [a1 edScriptFromXmlVertAlignElement:v55]);
  }
  else if ((v20 | v57) != 1)
  {
    v21 = 0;
    goto LABEL_55;
  }
  v21 = v13;
LABEL_55:

LABEL_56:
  return v21;
}

@end