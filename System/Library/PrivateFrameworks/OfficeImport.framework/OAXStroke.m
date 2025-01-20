@interface OAXStroke
+ (id)compoundLineEnumMap;
+ (id)lineCapEnumMap;
+ (id)lineEndLengthEnumMap;
+ (id)lineEndTypeEnumMap;
+ (id)lineEndWidthEnumMap;
+ (id)penAlignmentEnumMap;
+ (id)presetDashEnumMap;
+ (id)readCustomDashFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)readLineEndFromXmlNode:(_xmlNode *)a3;
+ (id)readPresetDashFromXmlNode:(_xmlNode *)a3;
+ (id)readStrokeFromXmlNode:(_xmlNode *)a3 packagePart:(id)a4 drawingState:(id)a5;
@end

@implementation OAXStroke

+ (id)readStrokeFromXmlNode:(_xmlNode *)a3 packagePart:(id)a4 drawingState:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init(OADStroke);
  uint64_t v28 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"w", &v28))
  {
    double v11 = (double)v28 / 12700.0;
    *(float *)&double v11 = v11;
    [(OADStroke *)v10 setWidth:v11];
  }
  uint64_t v12 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"cap", 0);
  v25 = (void *)v12;
  if (v12)
  {
    v13 = objc_msgSend(a1, "lineCapEnumMap", v12);
    unsigned __int8 v14 = [v13 valueForString:v12];

    [(OADStroke *)v10 setCap:v14];
  }
  v26 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"cmpd", 0);
  if (v26)
  {
    v15 = [a1 compoundLineEnumMap];
    unsigned __int8 v16 = [v15 valueForString:v26];

    [(OADStroke *)v10 setCompoundType:v16];
  }
  v17 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"algn", 0);
  if (v17)
  {
    v18 = [a1 penAlignmentEnumMap];
    uint64_t v19 = [v18 valueForString:v17];

    [(OADStroke *)v10 setPenAlignment:v19];
  }
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (i->type != XML_ELEMENT_NODE) {
      continue;
    }
    v21 = +[OAXFill readFillFromXmlNode:i packagePart:v8 drawingState:v9];
    if (v21)
    {
      [(OADStroke *)v10 setFill:v21];
    }
    else
    {
      if (xmlStrEqual(i->name, (const xmlChar *)"prstDash"))
      {
        v22 = [a1 readPresetDashFromXmlNode:i];
        [(OADStroke *)v10 setDash:v22];
LABEL_30:

        goto LABEL_31;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"custDash"))
      {
        v22 = [a1 readCustomDashFromXmlNode:i drawingState:v9];
        [(OADStroke *)v10 setDash:v22];
        goto LABEL_30;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"round"))
      {
        v22 = objc_alloc_init(OADRoundLineJoin);
        [(OADStroke *)v10 setJoin:v22];
        goto LABEL_30;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"bevel"))
      {
        v22 = objc_alloc_init(OADBevelLineJoin);
        [(OADStroke *)v10 setJoin:v22];
        goto LABEL_30;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"miter"))
      {
        v22 = objc_alloc_init(OADMiterLineJoin);
        double v27 = 0.0;
        if (CXOptionalFractionAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"lim", &v27))
        {
          HIDWORD(v23) = HIDWORD(v27);
          *(float *)&double v23 = v27;
          [(OADRoundLineJoin *)v22 setLimit:v23];
        }
        -[OADStroke setJoin:](v10, "setJoin:", v22, v25);
        goto LABEL_30;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"headEnd"))
      {
        v22 = [a1 readLineEndFromXmlNode:i];
        [(OADStroke *)v10 setTail:v22];
        goto LABEL_30;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"tailEnd"))
      {
        v22 = [a1 readLineEndFromXmlNode:i];
        [(OADStroke *)v10 setHead:v22];
        goto LABEL_30;
      }
    }
LABEL_31:
  }
  return v10;
}

+ (id)lineCapEnumMap
{
  if (+[OAXStroke(Private) lineCapEnumMap]::once != -1) {
    dispatch_once(&+[OAXStroke(Private) lineCapEnumMap]::once, &__block_literal_global_33_0);
  }
  v2 = (void *)+[OAXStroke(Private) lineCapEnumMap]::lineCapEnumMap;
  return v2;
}

+ (id)compoundLineEnumMap
{
  if (+[OAXStroke(Private) compoundLineEnumMap]::once != -1) {
    dispatch_once(&+[OAXStroke(Private) compoundLineEnumMap]::once, &__block_literal_global_51);
  }
  v2 = (void *)+[OAXStroke(Private) compoundLineEnumMap]::compoundLineEnumMap;
  return v2;
}

+ (id)penAlignmentEnumMap
{
  if (+[OAXStroke(Private) penAlignmentEnumMap]::once != -1) {
    dispatch_once(&+[OAXStroke(Private) penAlignmentEnumMap]::once, &__block_literal_global_45);
  }
  v2 = (void *)+[OAXStroke(Private) penAlignmentEnumMap]::penAlignmentEnumMap;
  return v2;
}

+ (id)readPresetDashFromXmlNode:(_xmlNode *)a3
{
  v5 = objc_alloc_init(OADPresetDash);
  v6 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", 0);
  if (v6)
  {
    v7 = [a1 presetDashEnumMap];
    char v8 = [v7 valueForString:v6];

    [(OADPresetDash *)v5 setType:v8];
  }

  return v5;
}

+ (id)presetDashEnumMap
{
  if (+[OAXStroke(Private) presetDashEnumMap]::once != -1) {
    dispatch_once(&+[OAXStroke(Private) presetDashEnumMap]::once, &__block_literal_global_90_1);
  }
  v2 = (void *)+[OAXStroke(Private) presetDashEnumMap]::presetDashEnumMap;
  return v2;
}

+ (id)lineEndTypeEnumMap
{
  if (+[OAXStroke(Private) lineEndTypeEnumMap]::once != -1) {
    dispatch_once(&+[OAXStroke(Private) lineEndTypeEnumMap]::once, &__block_literal_global_54);
  }
  v2 = (void *)+[OAXStroke(Private) lineEndTypeEnumMap]::lineEndTypeEnumMap;
  return v2;
}

+ (id)lineEndWidthEnumMap
{
  if (+[OAXStroke(Private) lineEndWidthEnumMap]::once != -1) {
    dispatch_once(&+[OAXStroke(Private) lineEndWidthEnumMap]::once, &__block_literal_global_75);
  }
  v2 = (void *)+[OAXStroke(Private) lineEndWidthEnumMap]::lineEndWidthEnumMap;
  return v2;
}

+ (id)lineEndLengthEnumMap
{
  if (+[OAXStroke(Private) lineEndLengthEnumMap]::once != -1) {
    dispatch_once(&+[OAXStroke(Private) lineEndLengthEnumMap]::once, &__block_literal_global_87_1);
  }
  v2 = (void *)+[OAXStroke(Private) lineEndLengthEnumMap]::lineEndLengthEnumMap;
  return v2;
}

void __41__OAXStroke_Private__compoundLineEnumMap__block_invoke()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZ41__OAXStroke_Private__compoundLineEnumMap_EUb_E23compoundLineEnumStructs, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZZ41__OAXStroke_Private__compoundLineEnumMap_EUb_E23compoundLineEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_12, 0, &dword_238A75000);
    __cxa_guard_release(&_ZGVZZ41__OAXStroke_Private__compoundLineEnumMap_EUb_E23compoundLineEnumStructs);
  }
  v0 = [[TCEnumerationMap alloc] initWithStructs:&_ZZZ41__OAXStroke_Private__compoundLineEnumMap_EUb_E23compoundLineEnumStructs count:5 caseSensitive:1];
  v1 = (void *)+[OAXStroke(Private) compoundLineEnumMap]::compoundLineEnumMap;
  +[OAXStroke(Private) compoundLineEnumMap]::compoundLineEnumMap = (uint64_t)v0;
}

void __36__OAXStroke_Private__lineCapEnumMap__block_invoke()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZ36__OAXStroke_Private__lineCapEnumMap_EUb0_E18lineCapEnumStructs, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZZ36__OAXStroke_Private__lineCapEnumMap_EUb0_E18lineCapEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_43, 0, &dword_238A75000);
    __cxa_guard_release(&_ZGVZZ36__OAXStroke_Private__lineCapEnumMap_EUb0_E18lineCapEnumStructs);
  }
  v0 = [[TCEnumerationMap alloc] initWithStructs:&_ZZZ36__OAXStroke_Private__lineCapEnumMap_EUb0_E18lineCapEnumStructs count:3 caseSensitive:1];
  v1 = (void *)+[OAXStroke(Private) lineCapEnumMap]::lineCapEnumMap;
  +[OAXStroke(Private) lineCapEnumMap]::lineCapEnumMap = (uint64_t)v0;
}

void __41__OAXStroke_Private__penAlignmentEnumMap__block_invoke()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZ41__OAXStroke_Private__penAlignmentEnumMap_EUb1_E23penAlignmentEnumStructs, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZZ41__OAXStroke_Private__penAlignmentEnumMap_EUb1_E23penAlignmentEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_52, 0, &dword_238A75000);
    __cxa_guard_release(&_ZGVZZ41__OAXStroke_Private__penAlignmentEnumMap_EUb1_E23penAlignmentEnumStructs);
  }
  v0 = [[TCEnumerationMap alloc] initWithStructs:&_ZZZ41__OAXStroke_Private__penAlignmentEnumMap_EUb1_E23penAlignmentEnumStructs count:2 caseSensitive:1];
  v1 = (void *)+[OAXStroke(Private) penAlignmentEnumMap]::penAlignmentEnumMap;
  +[OAXStroke(Private) penAlignmentEnumMap]::penAlignmentEnumMap = (uint64_t)v0;
}

void __40__OAXStroke_Private__lineEndTypeEnumMap__block_invoke()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZ40__OAXStroke_Private__lineEndTypeEnumMap_EUb2_E22lineEndTypeEnumStructs, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZZ40__OAXStroke_Private__lineEndTypeEnumMap_EUb2_E22lineEndTypeEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_73, 0, &dword_238A75000);
    __cxa_guard_release(&_ZGVZZ40__OAXStroke_Private__lineEndTypeEnumMap_EUb2_E22lineEndTypeEnumStructs);
  }
  v0 = [[TCEnumerationMap alloc] initWithStructs:&_ZZZ40__OAXStroke_Private__lineEndTypeEnumMap_EUb2_E22lineEndTypeEnumStructs count:6 caseSensitive:1];
  v1 = (void *)+[OAXStroke(Private) lineEndTypeEnumMap]::lineEndTypeEnumMap;
  +[OAXStroke(Private) lineEndTypeEnumMap]::lineEndTypeEnumMap = (uint64_t)v0;
}

void __41__OAXStroke_Private__lineEndWidthEnumMap__block_invoke()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZ41__OAXStroke_Private__lineEndWidthEnumMap_EUb3_E23lineEndWidthEnumStructs, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZZ41__OAXStroke_Private__lineEndWidthEnumMap_EUb3_E23lineEndWidthEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_85, 0, &dword_238A75000);
    __cxa_guard_release(&_ZGVZZ41__OAXStroke_Private__lineEndWidthEnumMap_EUb3_E23lineEndWidthEnumStructs);
  }
  v0 = [[TCEnumerationMap alloc] initWithStructs:&_ZZZ41__OAXStroke_Private__lineEndWidthEnumMap_EUb3_E23lineEndWidthEnumStructs count:3 caseSensitive:1];
  v1 = (void *)+[OAXStroke(Private) lineEndWidthEnumMap]::lineEndWidthEnumMap;
  +[OAXStroke(Private) lineEndWidthEnumMap]::lineEndWidthEnumMap = (uint64_t)v0;
}

void __42__OAXStroke_Private__lineEndLengthEnumMap__block_invoke()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZ42__OAXStroke_Private__lineEndLengthEnumMap_EUb4_E24lineEndLengthEnumStructs, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZZ42__OAXStroke_Private__lineEndLengthEnumMap_EUb4_E24lineEndLengthEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_88, 0, &dword_238A75000);
    __cxa_guard_release(&_ZGVZZ42__OAXStroke_Private__lineEndLengthEnumMap_EUb4_E24lineEndLengthEnumStructs);
  }
  v0 = [[TCEnumerationMap alloc] initWithStructs:&_ZZZ42__OAXStroke_Private__lineEndLengthEnumMap_EUb4_E24lineEndLengthEnumStructs count:3 caseSensitive:1];
  v1 = (void *)+[OAXStroke(Private) lineEndLengthEnumMap]::lineEndLengthEnumMap;
  +[OAXStroke(Private) lineEndLengthEnumMap]::lineEndLengthEnumMap = (uint64_t)v0;
}

void __39__OAXStroke_Private__presetDashEnumMap__block_invoke()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZ39__OAXStroke_Private__presetDashEnumMap_EUb5_E21presetDashEnumStructs, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZZ39__OAXStroke_Private__presetDashEnumMap_EUb5_E21presetDashEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_124, 0, &dword_238A75000);
    __cxa_guard_release(&_ZGVZZ39__OAXStroke_Private__presetDashEnumMap_EUb5_E21presetDashEnumStructs);
  }
  v0 = [[TCEnumerationMap alloc] initWithStructs:&_ZZZ39__OAXStroke_Private__presetDashEnumMap_EUb5_E21presetDashEnumStructs count:11 caseSensitive:1];
  v1 = (void *)+[OAXStroke(Private) presetDashEnumMap]::presetDashEnumMap;
  +[OAXStroke(Private) presetDashEnumMap]::presetDashEnumMap = (uint64_t)v0;
}

+ (id)readLineEndFromXmlNode:(_xmlNode *)a3
{
  v5 = objc_alloc_init(OADLineEnd);
  v6 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"type", 0);
  if (v6)
  {
    v7 = [a1 lineEndTypeEnumMap];
    unint64_t v8 = [v7 valueForString:v6];

    unsigned __int8 v9 = 0;
    if (v8 < 0x100) {
      unsigned __int8 v9 = v8;
    }
    [(OADLineEnd *)v5 setType:v9];
  }
  v10 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"w", 0);
  if (v10)
  {
    double v11 = [a1 lineEndWidthEnumMap];
    unint64_t v12 = [v11 valueForString:v10];

    unsigned __int8 v13 = 0;
    if (v12 < 0x100) {
      unsigned __int8 v13 = v12;
    }
    [(OADLineEnd *)v5 setWidth:v13];
  }
  unsigned __int8 v14 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"len", 0);
  if (v14)
  {
    v15 = [a1 lineEndLengthEnumMap];
    unint64_t v16 = [v15 valueForString:v14];

    unsigned __int8 v17 = 0;
    if (v16 < 0x100) {
      unsigned __int8 v17 = v16;
    }
    [(OADLineEnd *)v5 setLength:v17];
  }

  return v5;
}

+ (id)readCustomDashFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v5 = a4;
  v6 = objc_alloc_init(OADCustomDash);
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  unint64_t v8 = [v5 OAXMainNamespace];
  Child = (_xmlNode *)OCXFindChild(a3, v8, "ds");

  while (Child)
  {
    +[OAXBaseTypes readRequiredFractionFromXmlNode:Child name:"d"];
    int v11 = v10;
    +[OAXBaseTypes readRequiredFractionFromXmlNode:Child name:"sp"];
    LODWORD(v13) = v12;
    LODWORD(v14) = v11;
    +[OADDashStop addStopWithDash:v7 space:v14 toArray:v13];
    v15 = [v5 OAXMainNamespace];
    Child = OCXFindNextChild(Child, v15, (xmlChar *)"ds");
  }
  [(OADCustomDash *)v6 setStops:v7];

  return v6;
}

@end