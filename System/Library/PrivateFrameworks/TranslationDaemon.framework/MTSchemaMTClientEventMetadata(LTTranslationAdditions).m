@interface MTSchemaMTClientEventMetadata(LTTranslationAdditions)
+ (id)lt_initWithMtId:()LTTranslationAdditions sessionId:;
@end

@implementation MTSchemaMTClientEventMetadata(LTTranslationAdditions)

+ (id)lt_initWithMtId:()LTTranslationAdditions sessionId:
{
  v5 = (objc_class *)MEMORY[0x263F6E3A0];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setMtId:v7];

  [v8 setSessionId:v6];
  return v8;
}

@end