@interface WXBorder
+ (id)borderStylesEnumMap;
+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5;
@end

@implementation WXBorder

+ (id)borderStylesEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_30, 0, &dword_238A75000);
  }
  if (+[WXBorder borderStylesEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXBorder borderStylesEnumMap]::onceToken, &__block_literal_global_80);
  }
  v2 = (void *)+[WXBorder borderStylesEnumMap]::sBorderStylesEnumMap;
  return v2;
}

void __31__WXBorder_borderStylesEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXBorder borderStylesEnumMap]::sBorderStyleEnumStructs count:200 caseSensitive:1];
  v1 = (void *)+[WXBorder borderStylesEnumMap]::sBorderStylesEnumMap;
  +[WXBorder borderStylesEnumMap]::sBorderStylesEnumMap = (uint64_t)v0;
}

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unsigned int v24 = 0;
  v10 = [a1 borderStylesEnumMap];
  readEnumProperty<WDBorderStyle>(a3, (const xmlChar *)"val", v10, &v24);

  [v8 setStyle:v24];
  if ([v8 style] != 253)
  {
    v11 = [v9 WXMainNamespace];
    v12 = CXDefaultStringAttribute(a3, v11, (xmlChar *)"color", 0);

    v13 = +[WXShading getColorFromString:v12];
    if (!v13)
    {
      v13 = +[OITSUColor blackColor];
    }
    [v8 setColor:v13];
    uint64_t v23 = 0;
    v14 = [v9 WXMainNamespace];
    BOOL v15 = CXOptionalLongAttribute(a3, v14, (xmlChar *)"sz", &v23);

    if (v15) {
      [v8 setWidth:v23];
    }
    v16 = [v9 WXMainNamespace];
    BOOL v17 = CXOptionalLongAttribute(a3, v16, (xmlChar *)"space", &v23);

    if (v17) {
      [v8 setSpace:v23];
    }
    BOOL v22 = 0;
    v18 = [v9 WXMainNamespace];
    BOOL v19 = CXOptionalBoolAttribute(a3, v18, (xmlChar *)"shadow", &v22);

    if (v19) {
      [v8 setShadow:v22];
    }
    v20 = [v9 WXMainNamespace];
    BOOL v21 = CXOptionalBoolAttribute(a3, v20, (xmlChar *)"frame", &v22);

    if (v21) {
      [v8 setFrame:v22];
    }
  }
}

@end