@interface MTSchemaMTInvocationEnded(LTTranslationAdditions)
+ (id)lt_initWithExists:()LTTranslationAdditions qssSessionId:;
@end

@implementation MTSchemaMTInvocationEnded(LTTranslationAdditions)

+ (id)lt_initWithExists:()LTTranslationAdditions qssSessionId:
{
  v5 = (objc_class *)MEMORY[0x263F6E3D8];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  [v7 setExists:a3];
  [v7 setQssSessionId:v6];

  return v7;
}

@end