@interface MTSchemaMTInvocationCancelled(LTTranslationAdditions)
+ (id)lt_initWithExists:()LTTranslationAdditions reason:qssSessionId:;
@end

@implementation MTSchemaMTInvocationCancelled(LTTranslationAdditions)

+ (id)lt_initWithExists:()LTTranslationAdditions reason:qssSessionId:
{
  v6 = (objc_class *)MEMORY[0x263F6E3C8];
  id v7 = a5;
  id v8 = objc_alloc_init(v6);
  [v8 setExists:a3];
  [v8 setQssSessionId:v7];

  return v8;
}

@end