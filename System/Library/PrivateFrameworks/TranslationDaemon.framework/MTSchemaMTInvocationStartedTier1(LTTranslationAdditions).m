@interface MTSchemaMTInvocationStartedTier1(LTTranslationAdditions)
+ (id)lt_initWithLinkId:()LTTranslationAdditions appBundleId:;
@end

@implementation MTSchemaMTInvocationStartedTier1(LTTranslationAdditions)

+ (id)lt_initWithLinkId:()LTTranslationAdditions appBundleId:
{
  v5 = (objc_class *)MEMORY[0x263F6E3F0];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setLinkId:v7];

  [v8 setAppBundleId:v6];
  return v8;
}

@end