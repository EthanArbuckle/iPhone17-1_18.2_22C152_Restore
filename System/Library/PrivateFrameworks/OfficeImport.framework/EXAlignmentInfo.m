@interface EXAlignmentInfo
+ (id)edAlignmentInfoFromVmlAlignmentInfoElement:(_xmlNode *)a3 state:(id)a4;
+ (id)edAlignmentInfoFromXmlAlignmentInfoElement:(_xmlNode *)a3 state:(id)a4;
+ (id)horizontalAlignmentEnumMap;
+ (id)verticalAlignmentEnumMap;
+ (int)edHorizontalAlignFromHorizontalAlignString:(id)a3;
+ (int)edVerticalAlignFromVerticalAlignString:(id)a3;
@end

@implementation EXAlignmentInfo

+ (id)edAlignmentInfoFromXmlAlignmentInfoElement:(_xmlNode *)a3 state:(id)a4
{
  v6 = +[EDAlignmentInfo alignmentInfo];
  if (a3)
  {
    id v16 = 0;
    BOOL v7 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"horizontal", &v16);
    id v8 = v16;
    if (v7) {
      objc_msgSend(v6, "setHorizontalAlignment:", objc_msgSend(a1, "edHorizontalAlignFromHorizontalAlignString:", v8));
    }
    id v15 = 0;
    BOOL v9 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"vertical", &v15);
    id v10 = v15;
    if (v9) {
      objc_msgSend(v6, "setVerticalAlignment:", objc_msgSend(a1, "edVerticalAlignFromVerticalAlignString:", v10));
    }
    unint64_t v14 = 0;
    if (CXOptionalUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"indent", &v14)) {
      [v6 setIndent:v14];
    }
    BOOL v13 = 0;
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"wrapText", &v13)) {
      [v6 setTextWrapped:v13];
    }
    unint64_t v12 = 0;
    if (CXOptionalUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"textRotation", &v12)) {
      [v6 setTextRotation:v12];
    }
  }
  return v6;
}

+ (int)edVerticalAlignFromVerticalAlignString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 caseInsensitiveCompare:@"top"])
  {
    if (![v4 caseInsensitiveCompare:@"center"])
    {
      int v5 = 1;
      goto LABEL_8;
    }
    if (![v4 caseInsensitiveCompare:@"bottom"])
    {
      int v5 = 2;
      goto LABEL_8;
    }
    if (![v4 caseInsensitiveCompare:@"justify"])
    {
      int v5 = 3;
      goto LABEL_8;
    }
    if (![v4 caseInsensitiveCompare:@"distributed"])
    {
      int v5 = 4;
      goto LABEL_8;
    }
  }
  int v5 = 0;
LABEL_8:

  return v5;
}

+ (int)edHorizontalAlignFromHorizontalAlignString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 caseInsensitiveCompare:@"general"])
  {
    if (![v4 caseInsensitiveCompare:@"left"])
    {
      int v5 = 1;
      goto LABEL_10;
    }
    if (![v4 caseInsensitiveCompare:@"center"])
    {
      int v5 = 2;
      goto LABEL_10;
    }
    if (![v4 caseInsensitiveCompare:@"centerContinuous"])
    {
      int v5 = 6;
      goto LABEL_10;
    }
    if (![v4 caseInsensitiveCompare:@"right"])
    {
      int v5 = 3;
      goto LABEL_10;
    }
    if (![v4 caseInsensitiveCompare:@"justify"])
    {
      int v5 = 5;
      goto LABEL_10;
    }
    if (![v4 caseInsensitiveCompare:@"distributed"])
    {
      int v5 = 7;
      goto LABEL_10;
    }
  }
  int v5 = 0;
LABEL_10:

  return v5;
}

+ (id)edAlignmentInfoFromVmlAlignmentInfoElement:(_xmlNode *)a3 state:(id)a4
{
  v6 = +[EDAlignmentInfo alignmentInfo];
  if (a3)
  {
    uint64_t v7 = OCXFindChild(a3, (CXNamespace *)EXVmlNamespace, "TextHAlign");
    if (v7)
    {
      id v8 = objc_msgSend([NSString alloc], "tc_initWithContentOfXmlNode:", v7);
      objc_msgSend(v6, "setHorizontalAlignment:", objc_msgSend(a1, "edHorizontalAlignFromHorizontalAlignString:", v8));
    }
    uint64_t v9 = OCXFindChild(a3, (CXNamespace *)EXVmlNamespace, "TextVAlign");
    if (v9)
    {
      id v10 = objc_msgSend([NSString alloc], "tc_initWithContentOfXmlNode:", v9);
      objc_msgSend(v6, "setVerticalAlignment:", objc_msgSend(a1, "edVerticalAlignFromVerticalAlignString:", v10));
    }
  }
  return v6;
}

+ (id)horizontalAlignmentEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_20, 0, &dword_238A75000);
  }
  if (+[EXAlignmentInfo horizontalAlignmentEnumMap]::once != -1) {
    dispatch_once(&+[EXAlignmentInfo horizontalAlignmentEnumMap]::once, &__block_literal_global_70);
  }
  v2 = (void *)+[EXAlignmentInfo horizontalAlignmentEnumMap]::sHorizontalAlignmentEnumMap;
  return v2;
}

void __45__EXAlignmentInfo_horizontalAlignmentEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[EXAlignmentInfo horizontalAlignmentEnumMap]::sHorizontalAlignmentStructs count:7 caseSensitive:1];
  v1 = (void *)+[EXAlignmentInfo horizontalAlignmentEnumMap]::sHorizontalAlignmentEnumMap;
  +[EXAlignmentInfo horizontalAlignmentEnumMap]::sHorizontalAlignmentEnumMap = (uint64_t)v0;
}

+ (id)verticalAlignmentEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_26_0, 0, &dword_238A75000);
  }
  if (+[EXAlignmentInfo verticalAlignmentEnumMap]::once != -1) {
    dispatch_once(&+[EXAlignmentInfo verticalAlignmentEnumMap]::once, &__block_literal_global_28_0);
  }
  v2 = (void *)+[EXAlignmentInfo verticalAlignmentEnumMap]::sVerticalAlignmentEnumMap;
  return v2;
}

void __43__EXAlignmentInfo_verticalAlignmentEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[EXAlignmentInfo verticalAlignmentEnumMap]::sVerticalAlignmentStructs count:5 caseSensitive:1];
  v1 = (void *)+[EXAlignmentInfo verticalAlignmentEnumMap]::sVerticalAlignmentEnumMap;
  +[EXAlignmentInfo verticalAlignmentEnumMap]::sVerticalAlignmentEnumMap = (uint64_t)v0;
}

@end