@interface OAXColorScheme
+ (id)colorForScheme:(id)a3 colorMap:(id)a4 value:(id)a5;
+ (id)colorForScheme:(id)a3 value:(id)a4;
+ (id)schemeColorEnumMap;
+ (void)readFromXmlNode:(_xmlNode *)a3 toColorScheme:(id)a4;
+ (void)writeColorScheme:(id)a3 to:(id)a4 state:(id)a5;
@end

@implementation OAXColorScheme

+ (void)readFromXmlNode:(_xmlNode *)a3 toColorScheme:(id)a4
{
  id v12 = a4;
  v6 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"name", 0);
  [v12 setName:v6];

  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (i->type == XML_ELEMENT_NODE && i->name)
    {
      v8 = objc_msgSend(NSString, "tc_stringWithXmlString:");
      v9 = [a1 schemeColorEnumMap];
      uint64_t v10 = [v9 valueForString:v8];

      if (v10 == -130883970) {
        +[TCMessageException raise:OABadFormat];
      }
      v11 = +[OAXColor readColorFromParentXmlNode:i];
      [v12 addColor:v11 index:v10];
    }
  }
}

+ (id)schemeColorEnumMap
{
  if (+[OAXColorScheme schemeColorEnumMap]::once != -1) {
    dispatch_once(&+[OAXColorScheme schemeColorEnumMap]::once, &__block_literal_global_45);
  }
  v2 = (void *)+[OAXColorScheme schemeColorEnumMap]::schemeColorEnumMap;
  return v2;
}

void __36__OAXColorScheme_schemeColorEnumMap__block_invoke()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZ36__OAXColorScheme_schemeColorEnumMap_EUb_E22schemeColorEnumStructs, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZZ36__OAXColorScheme_schemeColorEnumMap_EUb_E22schemeColorEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_4, 0, &dword_238A75000);
    __cxa_guard_release(&_ZGVZZ36__OAXColorScheme_schemeColorEnumMap_EUb_E22schemeColorEnumStructs);
  }
  v0 = [[TCEnumerationMap alloc] initWithStructs:&_ZZZ36__OAXColorScheme_schemeColorEnumMap_EUb_E22schemeColorEnumStructs count:12 caseSensitive:1];
  v1 = (void *)+[OAXColorScheme schemeColorEnumMap]::schemeColorEnumMap;
  +[OAXColorScheme schemeColorEnumMap]::schemeColorEnumMap = (uint64_t)v0;
}

+ (id)colorForScheme:(id)a3 value:(id)a4
{
  v4 = [a1 colorForScheme:a3 colorMap:0 value:a4];
  return v4;
}

+ (id)colorForScheme:(id)a3 colorMap:(id)a4 value:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10) {
    +[TCMessageException raise:OABadFormat];
  }
  v11 = [a1 schemeColorEnumMap];
  uint64_t v12 = [v11 valueForString:v10];

  if (v12 == -130883970)
  {
    if (!v9
      || (+[OAXColorMap mapColorEnumMap],
          v13 = objc_claimAutoreleasedReturnValue(),
          uint64_t v14 = [v13 valueForString:v10],
          v13,
          uint64_t v12 = [v9 mappingForIndex:v14],
          v12 == -130883970))
    {
      +[TCMessageException raise:OABadFormat];
      uint64_t v12 = 4164083326;
    }
  }
  v15 = [v8 colorForIndex:v12];

  return v15;
}

+ (void)writeColorScheme:(id)a3 to:(id)a4 state:(id)a5
{
  id v15 = a3;
  id v7 = a4;
  [v7 startElement:@"clrScheme"];
  id v8 = [v15 name];
  [v7 writeAttribute:@"name" content:v8];

  uint64_t v9 = [v15 colorCount];
  if (v9)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      v11 = [a1 schemeColorEnumMap];
      uint64_t v12 = [v11 stringForValue:i];

      uint64_t v13 = [v15 colorForIndex:i];
      uint64_t v14 = (void *)v13;
      if (v12 && v13)
      {
        [v7 startElement:v12];
        +[OAXColor writeColor:v14 to:v7];
        [v7 endElement];
      }
    }
  }
  [v7 endElement];
}

@end