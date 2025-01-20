@interface OAXColor
+ (id)presetColorEnumMap;
+ (id)presetColorRGBEnumMap;
+ (id)readColorFromNode:(_xmlNode *)a3;
+ (id)readColorFromParentXmlNode:(_xmlNode *)a3;
+ (id)readHslColorFromXmlNode:(_xmlNode *)a3;
+ (id)readPresetColorFromAttribute:(id)a3;
+ (id)readPresetColorFromXmlNode:(_xmlNode *)a3;
+ (id)readSRgbColorFromXmlNode:(_xmlNode *)a3 attribute:(const char *)a4;
+ (id)readScRgbColorFromXmlNode:(_xmlNode *)a3;
+ (id)readSchemeColorFromAttribute:(id)a3;
+ (id)readSchemeColorFromXmlNode:(_xmlNode *)a3;
+ (id)readSystemColorFromAttribute:(id)a3;
+ (id)readSystemColorFromXmlNode:(_xmlNode *)a3;
+ (id)schemeColorEnumMap;
+ (id)stringSRgbColor:(id)a3;
+ (id)systemColorEnumMap;
+ (void)writeColor:(id)a3 to:(id)a4;
+ (void)writePlaceholderColor:(id)a3 to:(id)a4;
+ (void)writePresetColor:(id)a3 to:(id)a4;
+ (void)writeRgbColor:(id)a3 to:(id)a4;
+ (void)writeSchemeColor:(id)a3 to:(id)a4;
+ (void)writeSystemColor:(id)a3 to:(id)a4;
@end

@implementation OAXColor

+ (id)readColorFromParentXmlNode:(_xmlNode *)a3
{
  v4 = OCXFirstChild(a3);
  v5 = 0;
  while (!v5 && v4)
  {
    if (v4->type == XML_ELEMENT_NODE)
    {
      v5 = [a1 readColorFromNode:v4];
    }
    else
    {
      v5 = 0;
    }
    v4 = OCXNextSibling(v4);
  }
  return v5;
}

+ (id)readColorFromNode:(_xmlNode *)a3
{
  if (xmlStrEqual(a3->name, (const xmlChar *)"scrgbClr"))
  {
    uint64_t v5 = [a1 readScRgbColorFromXmlNode:a3];
    goto LABEL_7;
  }
  if (xmlStrEqual(a3->name, (const xmlChar *)"srgbClr"))
  {
    uint64_t v5 = [a1 readSRgbColorFromXmlNode:a3 attribute:"val"];
    goto LABEL_7;
  }
  if (xmlStrEqual(a3->name, (const xmlChar *)"hslClr"))
  {
    uint64_t v5 = [a1 readHslColorFromXmlNode:a3];
LABEL_7:
    v6 = (void *)v5;
    if (!v5) {
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  if (!xmlStrEqual(a3->name, (const xmlChar *)"sysClr"))
  {
    if (xmlStrEqual(a3->name, (const xmlChar *)"schemeClr"))
    {
      uint64_t v5 = [a1 readSchemeColorFromXmlNode:a3];
    }
    else
    {
      if (!xmlStrEqual(a3->name, (const xmlChar *)"prstClr"))
      {
        v6 = 0;
        goto LABEL_12;
      }
      uint64_t v5 = [a1 readPresetColorFromXmlNode:a3];
    }
    goto LABEL_7;
  }
  v6 = [a1 readSystemColorFromXmlNode:a3];
  v10 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"lastClr", 0);
  if ([v10 length])
  {
    uint64_t v11 = [a1 readSRgbColorFromXmlNode:a3 attribute:"lastClr"];

    v6 = (void *)v11;
  }

  if (v6)
  {
LABEL_8:
    v7 = +[OAXColorTransform readColorTransformsFromXmlNode:a3];
    v8 = v7;
    if (v7 && [v7 count]) {
      [v6 setTransforms:v8];
    }
  }
LABEL_12:
  return v6;
}

+ (id)readSchemeColorFromXmlNode:(_xmlNode *)a3
{
  v4 = CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
  if (v4)
  {
    uint64_t v5 = [a1 readSchemeColorFromAttribute:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)schemeColorEnumMap
{
  if (+[OAXColor(Private) schemeColorEnumMap]::once != -1) {
    dispatch_once(&+[OAXColor(Private) schemeColorEnumMap]::once, &__block_literal_global_722);
  }
  v2 = (void *)+[OAXColor(Private) schemeColorEnumMap]::schemeColorEnumMap;
  return v2;
}

+ (id)readSRgbColorFromXmlNode:(_xmlNode *)a3 attribute:(const char *)a4
{
  v4 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)a4, 0);
  if ([v4 length] != 6) {
    +[TCMessageException raise:OABadFormat];
  }
  int v13 = 0;
  id v5 = v4;
  if (sscanf((const char *)[v5 UTF8String], "%x", &v13) != 1) {
    +[TCMessageException raise:OABadFormat];
  }
  int v6 = v13;
  v7 = [OADRgbColor alloc];
  *(float *)&double v8 = (float)BYTE2(v6);
  *(float *)&double v9 = (float)BYTE1(v6);
  *(float *)&double v10 = (float)v6;
  uint64_t v11 = [(OADRgbColor *)v7 initWithRedByte:v8 greenByte:v9 blueByte:v10];

  return v11;
}

+ (id)readSystemColorFromXmlNode:(_xmlNode *)a3
{
  v4 = CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
  if (v4)
  {
    id v5 = [a1 readSystemColorFromAttribute:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)readSystemColorFromAttribute:(id)a3
{
  v4 = [a3 componentsSeparatedByString:@" "];
  id v5 = [v4 firstObject];
  if (v5
    && ([a1 systemColorEnumMap],
        int v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 valueForString:v5],
        v6,
        v7 != -130883970))
  {
    double v8 = [[OADSystemColor alloc] initWithSystemColorID:v7];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

+ (id)systemColorEnumMap
{
  if (+[OAXColor(Private) systemColorEnumMap]::once != -1) {
    dispatch_once(&+[OAXColor(Private) systemColorEnumMap]::once, &__block_literal_global_629);
  }
  v2 = (void *)+[OAXColor(Private) systemColorEnumMap]::systemColorEnumMap;
  return v2;
}

+ (id)readPresetColorFromAttribute:(id)a3
{
  v4 = [a3 componentsSeparatedByString:@" "];
  id v5 = [v4 firstObject];
  if (v5
    && ([a1 presetColorEnumMap],
        int v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 valueForString:v5],
        v6,
        v7 != -130883970))
  {
    double v9 = [a1 presetColorRGBEnumMap];
    double v10 = [v9 stringForValue:v7];

    uint64_t v18 = 0;
    uint64_t v11 = [MEMORY[0x263F08B08] scannerWithString:v10];
    [v11 scanHexLongLong:&v18];

    int v12 = v18;
    int v13 = [OADRgbColor alloc];
    *(float *)&double v14 = (float)BYTE2(v12);
    *(float *)&double v15 = (float)BYTE1(v12);
    *(float *)&double v16 = (float)v12;
    double v8 = [(OADRgbColor *)v13 initWithRedByte:v14 greenByte:v15 blueByte:v16];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

+ (id)presetColorEnumMap
{
  if (+[OAXColor(Private) presetColorEnumMap]::once != -1) {
    dispatch_once(&+[OAXColor(Private) presetColorEnumMap]::once, &__block_literal_global_44);
  }
  v2 = (void *)+[OAXColor(Private) presetColorEnumMap]::presetColorEnumMap;
  return v2;
}

+ (id)readPresetColorFromXmlNode:(_xmlNode *)a3
{
  v4 = CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
  if (v4)
  {
    id v5 = [a1 readPresetColorFromAttribute:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)readScRgbColorFromXmlNode:(_xmlNode *)a3
{
  +[OAXBaseTypes readRequiredFractionFromXmlNode:a3 name:"r"];
  int v5 = v4;
  +[OAXBaseTypes readRequiredFractionFromXmlNode:a3 name:"g"];
  int v7 = v6;
  +[OAXBaseTypes readRequiredFractionFromXmlNode:a3 name:"b"];
  int v9 = v8;
  double v10 = [OADRgbColor alloc];
  LODWORD(v11) = v5;
  LODWORD(v12) = v7;
  LODWORD(v13) = v9;
  double v14 = [(OADRgbColor *)v10 initWithRed:v11 green:v12 blue:v13];
  return v14;
}

+ (id)readSchemeColorFromAttribute:(id)a3
{
  id v4 = a3;
  int v5 = [a1 schemeColorEnumMap];
  uint64_t v6 = [v5 valueForString:v4];

  if (v6 == -130883970)
  {
    int v8 = [OADSchemeColor alloc];
    uint64_t v6 = 0;
  }
  else
  {
    if (v6 == 17)
    {
      int v7 = objc_alloc_init(OADPlaceholderColor);
      goto LABEL_7;
    }
    int v8 = [OADSchemeColor alloc];
  }
  int v7 = [(OADSchemeColor *)v8 initWithSchemeColorIndex:v6];
LABEL_7:
  int v9 = v7;

  return v9;
}

+ (void)writePresetColor:(id)a3 to:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  [v6 startOAElement:@"prstClr"];
  int v7 = [a1 stringSRgbColor:v13];
  int v8 = [a1 presetColorRGBEnumMap];
  uint64_t v9 = [v8 valueForString:v7];

  double v10 = [a1 presetColorEnumMap];
  double v11 = [v10 stringForValue:v9];

  [v6 writeOAAttribute:@"val" content:v11];
  double v12 = [v13 transforms];
  +[OAXColorTransform write:v12 to:v6];

  [v6 endElement];
}

+ (void)writeRgbColor:(id)a3 to:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  [v6 startOAElement:@"srgbClr"];
  int v7 = [a1 stringSRgbColor:v9];
  [v6 writeOAAttribute:@"val" content:v7];
  int v8 = [v9 transforms];
  +[OAXColorTransform write:v8 to:v6];

  [v6 endElement];
}

+ (void)writeSchemeColor:(id)a3 to:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [v6 startOAElement:@"schemeClr"];
  int v7 = [a1 schemeColorEnumMap];
  int v8 = objc_msgSend(v7, "stringForValue:", objc_msgSend(v10, "schemeColorIndex"));

  [v6 writeOAAttribute:@"val" content:v8];
  id v9 = [v10 transforms];
  +[OAXColorTransform write:v9 to:v6];

  [v6 endElement];
}

+ (void)writeSystemColor:(id)a3 to:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [v6 startOAElement:@"sysClr"];
  int v7 = [a1 systemColorEnumMap];
  int v8 = objc_msgSend(v7, "stringForValue:", objc_msgSend(v10, "systemColorID"));

  [v6 writeOAAttribute:@"val" content:v8];
  id v9 = [v10 transforms];
  +[OAXColorTransform write:v9 to:v6];

  [v6 endElement];
}

+ (void)writePlaceholderColor:(id)a3 to:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  [v5 startOAElement:@"schemeClr"];
  [v5 writeOAAttribute:@"val" content:@"phClr"];
  id v6 = [v7 transforms];
  +[OAXColorTransform write:v6 to:v5];

  [v5 endElement];
}

+ (void)writeColor:(id)a3 to:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  int v8 = TSUDynamicCast(v7, (uint64_t)v18);
  if (v8)
  {
    [a1 writeRgbColor:v8 to:v6];
  }
  else
  {
    uint64_t v9 = objc_opt_class();
    id v10 = TSUDynamicCast(v9, (uint64_t)v18);
    if (v10)
    {
      [a1 writeSchemeColor:v10 to:v6];
    }
    else
    {
      uint64_t v11 = objc_opt_class();
      double v12 = TSUDynamicCast(v11, (uint64_t)v18);
      if (v12)
      {
        [a1 writeSystemColor:v12 to:v6];
      }
      else
      {
        uint64_t v13 = objc_opt_class();
        double v14 = TSUDynamicCast(v13, (uint64_t)v18);
        if (v14)
        {
          [a1 writePlaceholderColor:v14 to:v6];
        }
        else
        {
          uint64_t v15 = objc_opt_class();
          double v16 = TSUDynamicCast(v15, (uint64_t)v18);

          if (!v16)
          {
            uint64_t v17 = objc_opt_class();
            TSUDynamicCast(v17, (uint64_t)v18);
          }
        }
      }
    }
  }
}

+ (id)readHslColorFromXmlNode:(_xmlNode *)a3
{
  v3 = [[OADRgbColor alloc] initWithRed:0.0 green:0.0 blue:0.0];
  return v3;
}

void __39__OAXColor_Private__presetColorEnumMap__block_invoke()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZ39__OAXColor_Private__presetColorEnumMap_EUb_E22presetColorEnumStructs, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZZ39__OAXColor_Private__presetColorEnumMap_EUb_E22presetColorEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_2, 0, &dword_238A75000);
    __cxa_guard_release(&_ZGVZZ39__OAXColor_Private__presetColorEnumMap_EUb_E22presetColorEnumStructs);
  }
  v0 = [[TCEnumerationMap alloc] initWithStructs:&_ZZZ39__OAXColor_Private__presetColorEnumMap_EUb_E22presetColorEnumStructs count:191 caseSensitive:1];
  v1 = (void *)+[OAXColor(Private) presetColorEnumMap]::presetColorEnumMap;
  +[OAXColor(Private) presetColorEnumMap]::presetColorEnumMap = (uint64_t)v0;
}

void __39__OAXColor_Private__systemColorEnumMap__block_invoke()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZ39__OAXColor_Private__systemColorEnumMap_EUb0_E22systemColorEnumStructs, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZZ39__OAXColor_Private__systemColorEnumMap_EUb0_E22systemColorEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_720, 0, &dword_238A75000);
    __cxa_guard_release(&_ZGVZZ39__OAXColor_Private__systemColorEnumMap_EUb0_E22systemColorEnumStructs);
  }
  v0 = [[TCEnumerationMap alloc] initWithStructs:&_ZZZ39__OAXColor_Private__systemColorEnumMap_EUb0_E22systemColorEnumStructs count:30 caseSensitive:1];
  v1 = (void *)+[OAXColor(Private) systemColorEnumMap]::systemColorEnumMap;
  +[OAXColor(Private) systemColorEnumMap]::systemColorEnumMap = (uint64_t)v0;
}

void __39__OAXColor_Private__schemeColorEnumMap__block_invoke()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZ39__OAXColor_Private__schemeColorEnumMap_EUb1_E22schemeColorEnumStructs, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZZ39__OAXColor_Private__schemeColorEnumMap_EUb1_E22schemeColorEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_771, 0, &dword_238A75000);
    __cxa_guard_release(&_ZGVZZ39__OAXColor_Private__schemeColorEnumMap_EUb1_E22schemeColorEnumStructs);
  }
  v0 = [[TCEnumerationMap alloc] initWithStructs:&_ZZZ39__OAXColor_Private__schemeColorEnumMap_EUb1_E22schemeColorEnumStructs count:17 caseSensitive:1];
  v1 = (void *)+[OAXColor(Private) schemeColorEnumMap]::schemeColorEnumMap;
  +[OAXColor(Private) schemeColorEnumMap]::schemeColorEnumMap = (uint64_t)v0;
}

+ (id)presetColorRGBEnumMap
{
  if (+[OAXColor(Private) presetColorRGBEnumMap]::once != -1) {
    dispatch_once(&+[OAXColor(Private) presetColorRGBEnumMap]::once, &__block_literal_global_773);
  }
  v2 = (void *)+[OAXColor(Private) presetColorRGBEnumMap]::presetColorRGBEnumMap;
  return v2;
}

void __42__OAXColor_Private__presetColorRGBEnumMap__block_invoke()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZ42__OAXColor_Private__presetColorRGBEnumMap_EUb2_E25presetColorRGBEnumStructs, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZZ42__OAXColor_Private__presetColorRGBEnumMap_EUb2_E25presetColorRGBEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_1194, 0, &dword_238A75000);
    __cxa_guard_release(&_ZGVZZ42__OAXColor_Private__presetColorRGBEnumMap_EUb2_E25presetColorRGBEnumStructs);
  }
  v0 = [[TCEnumerationMultiMap alloc] initWithStructs:&_ZZZ42__OAXColor_Private__presetColorRGBEnumMap_EUb2_E25presetColorRGBEnumStructs count:191 caseSensitive:1];
  v1 = (void *)+[OAXColor(Private) presetColorRGBEnumMap]::presetColorRGBEnumMap;
  +[OAXColor(Private) presetColorRGBEnumMap]::presetColorRGBEnumMap = (uint64_t)v0;
}

+ (id)stringSRgbColor:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    uint64_t v5 = [v4 redByte];
    uint64_t v6 = [v4 greenByte];
    uint64_t v7 = [v4 blueByte];
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v5 = 0;
  }
  int v8 = objc_msgSend(NSString, "stringWithFormat:", @"%02X%02X%02X", v5, v6, v7);

  return v8;
}

@end