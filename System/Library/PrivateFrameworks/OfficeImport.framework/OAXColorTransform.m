@interface OAXColorTransform
+ (id)colorTransformTypeEnumMap;
+ (id)readColorTransformsFromXmlNode:(_xmlNode *)a3;
+ (void)write:(id)a3 to:(id)a4;
@end

@implementation OAXColorTransform

+ (id)readColorTransformsFromXmlNode:(_xmlNode *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (i->type == XML_ELEMENT_NODE && i->name)
    {
      v7 = objc_msgSend(NSString, "tc_stringWithXmlString:");
      v8 = [a1 colorTransformTypeEnumMap];
      uint64_t v9 = [v8 valueForString:v7];

      p_super = 0;
      if (v9 <= 0x1C)
      {
        int v11 = 1 << v9;
        if (((1 << v9) & 0x7FFF9F0) != 0)
        {
          v12 = [(OADColorTransform *)[OADValueColorTransform alloc] initWithType:v9];
          +[OAXBaseTypes readRequiredFractionFromXmlNode:i name:"val"];
          -[OADValueColorTransform setValue:](v12, "setValue:");
          goto LABEL_8;
        }
        if ((v11 & 0x1800000E) != 0)
        {
          p_super = [[OADColorTransform alloc] initWithType:v9];
          if (!p_super) {
            goto LABEL_10;
          }
LABEL_9:
          [v5 addObject:p_super];
        }
        else if ((v11 & 0x600) != 0)
        {
          v12 = [(OADColorTransform *)[OADValueColorTransform alloc] initWithType:v9];
          +[OAXBaseTypes readRequiredAngleFromXmlNode:i name:"val"];
          *(float *)&double v13 = v13;
          [(OADValueColorTransform *)v12 setValue:v13];
LABEL_8:
          p_super = &v12->super;
          if (v12) {
            goto LABEL_9;
          }
        }
      }
LABEL_10:

      continue;
    }
  }
  return v5;
}

+ (id)colorTransformTypeEnumMap
{
  if (+[OAXColorTransform(Private) colorTransformTypeEnumMap]::once != -1) {
    dispatch_once(&+[OAXColorTransform(Private) colorTransformTypeEnumMap]::once, &__block_literal_global_46);
  }
  v2 = (void *)+[OAXColorTransform(Private) colorTransformTypeEnumMap]::colorTransformTypeEnumMap;
  return v2;
}

+ (void)write:(id)a3 to:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        int v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v12 = [v11 type];
        double v13 = [a1 colorTransformTypeEnumMap];
        v14 = [v13 stringForValue:v12];

        [v7 startOAElement:v14];
        objc_opt_class();
        float v15 = 0.0;
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          id v16 = v11;
          [v16 value];
          float v15 = v17;
        }
        double v18 = 0.0;
        if ((v12 - 4) <= 0x16) {
          double v18 = dbl_238EDBF28[(int)v12 - 4];
        }
        double v19 = v18 * v15;
        *(float *)&double v19 = v19;
        v20 = [NSNumber numberWithFloat:v19];
        uint64_t v21 = [v20 longValue];

        v22 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v21);
        [v7 writeOAAttribute:@"val" content:v22];

        [v7 endElement];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }
}

void __55__OAXColorTransform_Private__colorTransformTypeEnumMap__block_invoke()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZ55__OAXColorTransform_Private__colorTransformTypeEnumMap_EUb_E29colorTransformTypeEnumStructs, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZZ55__OAXColorTransform_Private__colorTransformTypeEnumMap_EUb_E29colorTransformTypeEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_5, 0, &dword_238A75000);
    __cxa_guard_release(&_ZGVZZ55__OAXColorTransform_Private__colorTransformTypeEnumMap_EUb_E29colorTransformTypeEnumStructs);
  }
  v0 = [[TCEnumerationMap alloc] initWithStructs:&_ZZZ55__OAXColorTransform_Private__colorTransformTypeEnumMap_EUb_E29colorTransformTypeEnumStructs count:28 caseSensitive:1];
  v1 = (void *)+[OAXColorTransform(Private) colorTransformTypeEnumMap]::colorTransformTypeEnumMap;
  +[OAXColorTransform(Private) colorTransformTypeEnumMap]::colorTransformTypeEnumMap = (uint64_t)v0;
}

@end