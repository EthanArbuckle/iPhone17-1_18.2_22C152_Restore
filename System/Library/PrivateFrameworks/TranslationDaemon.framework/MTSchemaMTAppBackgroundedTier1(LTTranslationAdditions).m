@interface MTSchemaMTAppBackgroundedTier1(LTTranslationAdditions)
+ (id)lt_initWithPayload:()LTTranslationAdditions localePair:;
@end

@implementation MTSchemaMTAppBackgroundedTier1(LTTranslationAdditions)

+ (id)lt_initWithPayload:()LTTranslationAdditions localePair:
{
  v5 = (objc_class *)MEMORY[0x263F6E378];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setTranslationPayload:v7];

  v9 = objc_msgSend(MEMORY[0x263F6E408], "lt_initWithLocalePair:", v6);

  [v8 setLocalePair:v9];
  return v8;
}

@end