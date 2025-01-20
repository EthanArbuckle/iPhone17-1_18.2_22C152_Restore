@interface OAXColorMap
+ (id)mapColorEnumMap;
+ (void)readFromXmlNode:(_xmlNode *)a3 toColorMap:(id)a4;
+ (void)writeColorMap:(id)a3 elementName:(id)a4 to:(id)a5 state:(id)a6;
@end

@implementation OAXColorMap

+ (void)readFromXmlNode:(_xmlNode *)a3 toColorMap:(id)a4
{
  id v6 = a4;
  [v6 addDefaultMappings:1];
  v7 = [a1 mapColorEnumMap];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__OAXColorMap_readFromXmlNode_toColorMap___block_invoke;
  v9[3] = &unk_264D62478;
  v11 = a3;
  id v8 = v6;
  id v10 = v8;
  [v7 enumerateValuesAndStringsUsingBlock:v9];
}

void __42__OAXColorMap_readFromXmlNode_toColorMap___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = (xmlChar *)objc_msgSend(a3, "tc_xmlString");
  id v6 = CXRequiredStringAttribute(*(_xmlNode **)(a1 + 40), (CXNamespace *)CXNoNamespace, v5);
  if (v6)
  {
    id v8 = v6;
    v7 = +[OAXColorScheme schemeColorEnumMap];
    objc_msgSend(*(id *)(a1 + 32), "addMapping:index:", objc_msgSend(v7, "valueForString:", v8), a2);

    id v6 = v8;
  }
}

+ (void)writeColorMap:(id)a3 elementName:(id)a4 to:(id)a5 state:(id)a6
{
  id v17 = a3;
  id v9 = a4;
  id v10 = a5;
  [v10 startElement:v9];
  uint64_t v11 = 0;
  do
  {
    uint64_t v12 = [v17 mappingForIndex:v11];
    v13 = [a1 mapColorEnumMap];
    v14 = [v13 stringForValue:v11];

    v15 = +[OAXColorScheme schemeColorEnumMap];
    v16 = [v15 stringForValue:v12];

    [v10 writeAttribute:v14 content:v16];
    uint64_t v11 = (v11 + 1);
  }
  while (v11 != 12);
  [v10 endElement];
}

+ (id)mapColorEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_3, 0, &dword_238A75000);
  }
  v2 = (void *)+[OAXColorMap mapColorEnumMap]::mapColorEnumMap;
  if (!+[OAXColorMap mapColorEnumMap]::mapColorEnumMap)
  {
    v3 = [[TCEnumerationMap alloc] initWithStructs:&+[OAXColorMap mapColorEnumMap]::mapColorEnumStructs count:12 caseSensitive:1];
    v4 = (void *)+[OAXColorMap mapColorEnumMap]::mapColorEnumMap;
    +[OAXColorMap mapColorEnumMap]::mapColorEnumMap = (uint64_t)v3;

    v2 = (void *)+[OAXColorMap mapColorEnumMap]::mapColorEnumMap;
  }
  return v2;
}

@end