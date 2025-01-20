@interface EXFill
+ (id)edFillFromXmlFillElement:(_xmlNode *)a3 differentialFill:(BOOL)a4 state:(id)a5;
+ (id)edFillFromXmlFillElement:(_xmlNode *)a3 state:(id)a4;
+ (id)edGradientFillFromXmlElement:(_xmlNode *)a3 state:(id)a4;
+ (id)edPatternFillFromXmlElement:(_xmlNode *)a3 differentialFill:(BOOL)a4 state:(id)a5;
+ (id)edStopFromXmlGradientElement:(_xmlNode *)a3 state:(id)a4;
+ (id)gradientFillTypeEnumMap;
+ (id)patternFillTypeEnumMap;
+ (int)edGradientTypeFromXmlGradientTypeString:(id)a3 state:(id)a4;
+ (int)edPatternTypeFromXmlPatternTypeString:(id)a3;
@end

@implementation EXFill

+ (id)edFillFromXmlFillElement:(_xmlNode *)a3 state:(id)a4
{
  v4 = [a1 edFillFromXmlFillElement:a3 differentialFill:0 state:a4];
  return v4;
}

+ (id)edFillFromXmlFillElement:(_xmlNode *)a3 differentialFill:(BOOL)a4 state:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v9 = v8;
  if (a3)
  {
    v10 = [v8 EXSpreadsheetMLNamespace];
    uint64_t v11 = OCXFindChild(a3, v10, "patternFill");

    if (v11)
    {
      v12 = [a1 edPatternFillFromXmlElement:v11 differentialFill:v5 state:v9];
LABEL_6:
      a3 = v12;
      goto LABEL_7;
    }
    v13 = [v9 EXSpreadsheetMLNamespace];
    uint64_t v14 = OCXFindChild(a3, v13, "gradientFill");

    if (v14)
    {
      v12 = [a1 edGradientFillFromXmlElement:v14 state:v9];
      goto LABEL_6;
    }
    v16 = [v9 EXSpreadsheetMLNamespace];
    a3 = (_xmlNode *)OCXFindChild(a3, v16, "imageFill");

    if (a3)
    {
      v17 = [EDFill alloc];
      v18 = [v9 resources];
      a3 = [(EDFill *)v17 initWithResources:v18];
    }
  }
LABEL_7:

  return a3;
}

+ (id)edPatternFillFromXmlElement:(_xmlNode *)a3 differentialFill:(BOOL)a4 state:(id)a5
{
  id v8 = a5;
  if (a3)
  {
    id v23 = 0;
    CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"patternType", &v23);
    id v9 = v23;
    uint64_t v10 = [a1 edPatternTypeFromXmlPatternTypeString:v9];
    uint64_t v11 = [v8 EXSpreadsheetMLNamespace];
    uint64_t v12 = OCXFindChild(a3, v11, "fgColor");

    if (v12)
    {
      v13 = +[EXColorReference edColorReferenceFromXmlColorElement:v12 callerClass:objc_opt_class() state:v8];
    }
    else if (a4)
    {
      v13 = 0;
    }
    else
    {
      v15 = [v8 resources];
      v13 = +[EDColorReference colorReferenceWithSystemColorID:11 resources:v15];
    }
    v16 = [v8 EXSpreadsheetMLNamespace];
    uint64_t v17 = OCXFindChild(a3, v16, "bgColor");

    if (v17)
    {
      uint64_t v18 = +[EXColorReference edColorReferenceFromXmlColorElement:v17 callerClass:objc_opt_class() state:v8];
      if (a4 && v9 == 0) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = v10;
      }
      v19 = (void *)v18;
    }
    else if (a4)
    {
      v19 = 0;
    }
    else
    {
      v20 = [v8 resources];
      v19 = +[EDColorReference colorReferenceWithSystemColorID:7 resources:v20];
    }
    v21 = [v8 resources];
    uint64_t v14 = +[EDPatternFill patternFillWithType:v10 foreColorReference:v13 backColorReference:v19 resources:v21];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

+ (int)edPatternTypeFromXmlPatternTypeString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [a1 patternFillTypeEnumMap];
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

+ (id)patternFillTypeEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_24, 0, &dword_238A75000);
  }
  if (+[EXFill patternFillTypeEnumMap]::once != -1) {
    dispatch_once(&+[EXFill patternFillTypeEnumMap]::once, &__block_literal_global_74);
  }
  v2 = (void *)+[EXFill patternFillTypeEnumMap]::sPatternFillTypeEnumMap;
  return v2;
}

void __32__EXFill_patternFillTypeEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[EXFill patternFillTypeEnumMap]::sPatternFillTypeStructs count:19 caseSensitive:1];
  v1 = (void *)+[EXFill patternFillTypeEnumMap]::sPatternFillTypeEnumMap;
  +[EXFill patternFillTypeEnumMap]::sPatternFillTypeEnumMap = (uint64_t)v0;
}

+ (id)gradientFillTypeEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_62_0, 0, &dword_238A75000);
  }
  if (+[EXFill gradientFillTypeEnumMap]::once != -1) {
    dispatch_once(&+[EXFill gradientFillTypeEnumMap]::once, &__block_literal_global_64);
  }
  v2 = (void *)+[EXFill gradientFillTypeEnumMap]::sGradientFillTypeEnumMap;
  return v2;
}

void __33__EXFill_gradientFillTypeEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[EXFill gradientFillTypeEnumMap]::sGradientFillTypeStructs count:2 caseSensitive:1];
  v1 = (void *)+[EXFill gradientFillTypeEnumMap]::sGradientFillTypeEnumMap;
  +[EXFill gradientFillTypeEnumMap]::sGradientFillTypeEnumMap = (uint64_t)v0;
}

+ (id)edGradientFillFromXmlElement:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v23 = 0;
    CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"type", &v23);
    id v7 = v23;
    uint64_t v8 = [a1 edGradientTypeFromXmlGradientTypeString:v7 state:v6];
    double v22 = 0.0;
    CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"top", &v22);
    double v21 = 0.0;
    CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"bottom", &v21);
    double v20 = 0.0;
    CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"right", &v20);
    double v19 = 0.0;
    CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"left", &v19);
    double v18 = 0.0;
    CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"degree", &v18);
    id v9 = [a1 edStopFromXmlGradientElement:a3 state:v6];
    double v10 = v18;
    double v11 = v19;
    double v13 = v21;
    double v12 = v22;
    double v14 = v20;
    v15 = [v6 resources];
    v16 = +[EDGradientFill gradientWithType:v8 degree:v9 top:v15 bottom:v10 right:v12 left:v13 stops:v14 resources:v11];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (int)edGradientTypeFromXmlGradientTypeString:(id)a3 state:(id)a4
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [a1 gradientFillTypeEnumMap];
    uint64_t v7 = [v6 valueForString:v5];

    if (v7 == -130883970) {
      int v8 = 0;
    }
    else {
      int v8 = v7;
    }
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

+ (id)edStopFromXmlGradientElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v7 = [v5 EXSpreadsheetMLNamespace];
  Child = (_xmlNode *)OCXFindChild(a3, v7, "stop");

  while (Child)
  {
    double v16 = 0.0;
    CXOptionalDoubleAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"position", &v16);
    id v9 = [NSNumber numberWithDouble:v16];
    double v10 = [v5 EXSpreadsheetMLNamespace];
    uint64_t v11 = OCXFindChild(Child, v10, "color");

    double v12 = +[EXColorReference edColorReferenceFromXmlColorElement:v11 callerClass:objc_opt_class() state:v5];
    double v13 = [v12 color];

    [v6 setObject:v13 forKey:v9];
    double v14 = [v5 EXSpreadsheetMLNamespace];
    Child = OCXFindNextChild(Child, v14, (xmlChar *)"stop");
  }
  return v6;
}

@end