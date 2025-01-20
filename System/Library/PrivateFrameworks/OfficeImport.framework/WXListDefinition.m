@interface WXListDefinition
+ (id)listTypeEnumMap;
+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5;
@end

@implementation WXListDefinition

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unsigned int v22 = 1;
  v10 = [a1 listTypeEnumMap];
  readEnumProperty<WDListType>(a3, "multiLevelType", (const xmlChar *)"val", v10, &v22, v9);

  [v8 setType:v22];
  v11 = [v9 WXMainNamespace];
  Child = (_xmlNode *)OCXFindChild(a3, v11, "lvl");

  while (Child)
  {
    v13 = [v9 WXMainNamespace];
    v14 = CXRequiredLongAttribute(Child, v13, (xmlChar *)"ilvl");

    if ((int)v14 <= 8)
    {
      while ((int)[v8 levelCount] <= (int)v14)
        id v15 = (id)[v8 addLevel];
      v16 = [v8 levelAt:v14];
      +[WXListLevel readFrom:Child to:v16 state:v9];
      v17 = [v9 WXMainNamespace];
      Child = OCXFindNextChild(Child, v17, (xmlChar *)"lvl");
    }
  }
  v18 = [v9 WXMainNamespace];
  v19 = (_xmlNode *)OCXFindChild(a3, v18, "numStyleLink");

  if (v19)
  {
    v20 = [v9 WXMainNamespace];
    v21 = CXDefaultStringAttribute(v19, v20, (xmlChar *)"val", 0);

    [v8 setStyleRefId:v21];
  }
}

+ (id)listTypeEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_36, 0, &dword_238A75000);
  }
  if (+[WXListDefinition listTypeEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXListDefinition listTypeEnumMap]::onceToken, &__block_literal_global_86);
  }
  v2 = (void *)+[WXListDefinition listTypeEnumMap]::sListTypeEnumMap;
  return v2;
}

void __35__WXListDefinition_listTypeEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXListDefinition listTypeEnumMap]::sListTypeEnumStructs count:3 caseSensitive:1];
  v1 = (void *)+[WXListDefinition listTypeEnumMap]::sListTypeEnumMap;
  +[WXListDefinition listTypeEnumMap]::sListTypeEnumMap = (uint64_t)v0;
}

@end