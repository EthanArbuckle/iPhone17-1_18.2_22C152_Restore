@interface WXFieldMarker
+ (id)fieldMarkerTypeEnumMap;
+ (void)readFrom:(_xmlNode *)a3 to:(id)a4;
@end

@implementation WXFieldMarker

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4
{
  id v14 = a4;
  Prop = xmlGetProp(a3, (const xmlChar *)"fldCharType");
  v7 = [a1 fieldMarkerTypeEnumMap];
  v8 = objc_msgSend(NSString, "tc_stringWithXmlString:", Prop);
  uint64_t v9 = [v7 valueForString:v8];

  if (v9 != -130883970)
  {
    [v14 setFieldMarkerType:v9];
    if (v9 == 19)
    {
      v10 = OCXFirstChild(a3);
      v11 = v10;
      if (v10)
      {
        if (xmlStrEqual(v10->name, (const xmlChar *)"fldData"))
        {
          v12 = (NSString *)objc_msgSend([NSString alloc], "tc_initWithContentOfXmlNode:", v11);
          v13 = decodeBase64(v12);
          [v14 setData:v13];
        }
      }
    }
  }
  ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(Prop);
}

+ (id)fieldMarkerTypeEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_34, 0, &dword_238A75000);
  }
  if (+[WXFieldMarker fieldMarkerTypeEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXFieldMarker fieldMarkerTypeEnumMap]::onceToken, &__block_literal_global_84);
  }
  v2 = (void *)+[WXFieldMarker fieldMarkerTypeEnumMap]::sFieldMarkerTypeEnumMap;
  return v2;
}

void __39__WXFieldMarker_fieldMarkerTypeEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXFieldMarker fieldMarkerTypeEnumMap]::sFieldMarkerTypeStructs count:3 caseSensitive:1];
  v1 = (void *)+[WXFieldMarker fieldMarkerTypeEnumMap]::sFieldMarkerTypeEnumMap;
  +[WXFieldMarker fieldMarkerTypeEnumMap]::sFieldMarkerTypeEnumMap = (uint64_t)v0;
}

@end