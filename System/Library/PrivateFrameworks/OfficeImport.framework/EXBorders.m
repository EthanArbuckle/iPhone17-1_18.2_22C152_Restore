@interface EXBorders
+ (id)borderStyleEnumMap;
+ (id)edBorderFromXmlElement:(_xmlNode *)a3 diagonalType:(int)a4 state:(id)a5;
+ (id)edBordersFromXmlBordersElement:(_xmlNode *)a3 state:(id)a4;
+ (int)edBorderStyleFromXmlBorderStyleString:(id)a3;
+ (int)edDiagStyleFromXmlElement:(_xmlNode *)a3;
@end

@implementation EXBorders

+ (id)edBordersFromXmlBordersElement:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (a3)
  {
    v8 = [v6 EXSpreadsheetMLNamespace];
    uint64_t v9 = OCXFindChild(a3, v8, "left");

    if (!v9)
    {
      v10 = [v7 EXSpreadsheetMLNamespace];
      uint64_t v9 = OCXFindChild(a3, v10, "start");
    }
    v34 = [a1 edBorderFromXmlElement:v9 diagonalType:0 state:v7];
    v11 = [v7 EXSpreadsheetMLNamespace];
    uint64_t v12 = OCXFindChild(a3, v11, "right");

    if (!v12)
    {
      v13 = [v7 EXSpreadsheetMLNamespace];
      uint64_t v12 = OCXFindChild(a3, v13, "end");
    }
    v14 = [a1 edBorderFromXmlElement:v12 diagonalType:0 state:v7];
    v15 = [v7 EXSpreadsheetMLNamespace];
    uint64_t v16 = OCXFindChild(a3, v15, "top");

    v17 = [a1 edBorderFromXmlElement:v16 diagonalType:0 state:v7];
    v18 = [v7 EXSpreadsheetMLNamespace];
    uint64_t v19 = OCXFindChild(a3, v18, "bottom");

    v20 = [a1 edBorderFromXmlElement:v19 diagonalType:0 state:v7];
    v21 = [v7 EXSpreadsheetMLNamespace];
    uint64_t v22 = OCXFindChild(a3, v21, "vertical");

    v23 = [a1 edBorderFromXmlElement:v22 diagonalType:0 state:v7];
    v24 = [v7 EXSpreadsheetMLNamespace];
    uint64_t v25 = OCXFindChild(a3, v24, "horizontal");

    v26 = [a1 edBorderFromXmlElement:v25 diagonalType:0 state:v7];
    v27 = [v7 EXSpreadsheetMLNamespace];
    uint64_t v28 = OCXFindChild(a3, v27, "diagonal");

    if (!v28)
    {
      v29 = [v7 EXSpreadsheetMLNamespace];
      uint64_t v28 = OCXFindChild(a3, v29, "diag");
    }
    v30 = objc_msgSend(a1, "edBorderFromXmlElement:diagonalType:state:", v28, objc_msgSend(a1, "edDiagStyleFromXmlElement:", a3), v7);
    v31 = [v7 resources];
    v32 = +[EDBorders bordersWithLeft:v34 right:v14 top:v17 bottom:v20 diagonal:v30 vertical:v23 horizontal:v26 resources:v31];
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

+ (id)edBorderFromXmlElement:(_xmlNode *)a3 diagonalType:(int)a4 state:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  if (a3)
  {
    id v17 = 0;
    CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"style", &v17);
    id v9 = v17;
    uint64_t v10 = [a1 edBorderStyleFromXmlBorderStyleString:v9];
    v11 = [v8 EXSpreadsheetMLNamespace];
    uint64_t v12 = OCXFindChild(a3, v11, "color");

    v13 = +[EXColorReference edColorReferenceFromXmlColorElement:v12 callerClass:objc_opt_class() state:v8];
    v14 = [v8 resources];
    v15 = +[EDBorder borderWithType:v10 colorReference:v13 diagonalType:v5 resources:v14];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (int)edBorderStyleFromXmlBorderStyleString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [a1 borderStyleEnumMap];
    uint64_t v6 = [v5 valueForString:v4];

    if (v6 == -130883970) {
      int v7 = 0;
    }
    else {
      int v7 = v6;
    }
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

+ (int)edDiagStyleFromXmlElement:(_xmlNode *)a3
{
  if (!a3) {
    return 0;
  }
  BOOL v7 = 0;
  if (!CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"diagonalUp", &v7)) {
    CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"diagUp", &v7);
  }
  BOOL v6 = 0;
  if (!CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"diagonalDown", &v6)) {
    CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"diagDown", &v6);
  }
  if (v6) {
    int v4 = 3;
  }
  else {
    int v4 = 2;
  }
  if (v7) {
    return v4;
  }
  else {
    return v6;
  }
}

+ (id)borderStyleEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_21, 0, &dword_238A75000);
  }
  if (+[EXBorders borderStyleEnumMap]::onceToken != -1) {
    dispatch_once(&+[EXBorders borderStyleEnumMap]::onceToken, &__block_literal_global_71);
  }
  v2 = (void *)+[EXBorders borderStyleEnumMap]::sBorderStyleEnumMap;
  return v2;
}

void __31__EXBorders_borderStyleEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[EXBorders borderStyleEnumMap]::sBorderStyleStructs count:14 caseSensitive:1];
  v1 = (void *)+[EXBorders borderStyleEnumMap]::sBorderStyleEnumMap;
  +[EXBorders borderStyleEnumMap]::sBorderStyleEnumMap = (uint64_t)v0;
}

@end