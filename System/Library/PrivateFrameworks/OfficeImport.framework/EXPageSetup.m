@interface EXPageSetup
+ (id)edPageMarginsFrom:(_xmlNode *)a3 state:(id)a4;
+ (id)edPageSetupFrom:(_xmlNode *)a3 state:(id)a4;
+ (id)pageOrderEnumMap;
+ (id)pageOrientationEnumMap;
+ (int)edPageOrderFromPageOrderString:(id)a3;
+ (int)edPageOrientationFromPageOrientationString:(id)a3;
@end

@implementation EXPageSetup

+ (id)edPageMarginsFrom:(_xmlNode *)a3 state:(id)a4
{
  v5 = [a4 currentSheet];
  v6 = [v5 pageSetup];

  if (v6)
  {
    if (!a3) {
      goto LABEL_17;
    }
  }
  else
  {
    v6 = +[EDPageSetup pageSetup];
    if (!a3) {
      goto LABEL_17;
    }
  }
  double v14 = 0.0;
  if (CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"left", &v14))
  {
    HIDWORD(v7) = HIDWORD(v14);
    *(float *)&double v7 = v14;
    [v6 setLeftMargin:v7];
  }
  if (CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"right", &v14))
  {
    HIDWORD(v8) = HIDWORD(v14);
    *(float *)&double v8 = v14;
    [v6 setRightMargin:v8];
  }
  if (CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"top", &v14))
  {
    HIDWORD(v9) = HIDWORD(v14);
    *(float *)&double v9 = v14;
    [v6 setTopMargin:v9];
  }
  if (CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"bottom", &v14))
  {
    HIDWORD(v10) = HIDWORD(v14);
    *(float *)&double v10 = v14;
    [v6 setBottomMargin:v10];
  }
  if (CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"header", &v14))
  {
    HIDWORD(v11) = HIDWORD(v14);
    *(float *)&double v11 = v14;
    [v6 setHeaderMargin:v11];
  }
  if (CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"footer", &v14))
  {
    HIDWORD(v12) = HIDWORD(v14);
    *(float *)&double v12 = v14;
    [v6 setFooterMargin:v12];
  }
LABEL_17:
  return v6;
}

+ (id)edPageSetupFrom:(_xmlNode *)a3 state:(id)a4
{
  v6 = [a4 currentSheet];
  double v7 = [v6 pageSetup];

  if (v7)
  {
    if (!a3) {
      goto LABEL_20;
    }
  }
  else
  {
    double v7 = +[EDPageSetup pageSetup];
    if (!a3) {
      goto LABEL_20;
    }
  }
  uint64_t v19 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"firstPageNumber", &v19)) {
    [v7 setFirstPageNumber:v19];
  }
  uint64_t v18 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"fitToHeight", &v18)) {
    [v7 setFitToHeight:v18];
  }
  uint64_t v17 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"fitToWidth", &v17)) {
    [v7 setFitToWidth:v17];
  }
  uint64_t v16 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"scale", &v16)) {
    [v7 setScale:v16];
  }
  BOOL v15 = 0;
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"useFirstPageNumber", &v15)) {
    [v7 setCustomFirstPageNumber:v15];
  }
  id v14 = 0;
  BOOL v8 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"orientation", &v14);
  id v9 = v14;
  if (v8) {
    objc_msgSend(v7, "setOrientation:", objc_msgSend(a1, "edPageOrientationFromPageOrientationString:", v9));
  }
  id v13 = 0;
  BOOL v10 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"pageOrder", &v13);
  id v11 = v13;
  if (v10) {
    objc_msgSend(v7, "setOrder:", objc_msgSend(a1, "edPageOrderFromPageOrderString:", v11));
  }

LABEL_20:
  return v7;
}

+ (int)edPageOrientationFromPageOrientationString:(id)a3
{
  return [a3 isEqualToString:@"portrait"];
}

+ (id)pageOrderEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_26, 0, &dword_238A75000);
  }
  if (+[EXPageSetup pageOrderEnumMap]::onceToken != -1) {
    dispatch_once(&+[EXPageSetup pageOrderEnumMap]::onceToken, &__block_literal_global_76);
  }
  v2 = (void *)+[EXPageSetup pageOrderEnumMap]::sPageOrderEnumMap;
  return v2;
}

void __31__EXPageSetup_pageOrderEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[EXPageSetup pageOrderEnumMap]::sPageOrderStructs count:2 caseSensitive:1];
  v1 = (void *)+[EXPageSetup pageOrderEnumMap]::sPageOrderEnumMap;
  +[EXPageSetup pageOrderEnumMap]::sPageOrderEnumMap = (uint64_t)v0;
}

+ (id)pageOrientationEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_11_0, 0, &dword_238A75000);
  }
  if (+[EXPageSetup pageOrientationEnumMap]::onceToken != -1) {
    dispatch_once(&+[EXPageSetup pageOrientationEnumMap]::onceToken, &__block_literal_global_13);
  }
  v2 = (void *)+[EXPageSetup pageOrientationEnumMap]::sPageOrientationEnumMap;
  return v2;
}

void __37__EXPageSetup_pageOrientationEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[EXPageSetup pageOrientationEnumMap]::sPageOrientationStructs count:2 caseSensitive:1];
  v1 = (void *)+[EXPageSetup pageOrientationEnumMap]::sPageOrientationEnumMap;
  +[EXPageSetup pageOrientationEnumMap]::sPageOrientationEnumMap = (uint64_t)v0;
}

+ (int)edPageOrderFromPageOrderString:(id)a3
{
  return [a3 isEqualToString:@"overThenDown"];
}

@end