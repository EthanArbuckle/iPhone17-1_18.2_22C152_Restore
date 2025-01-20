@interface MTSchemaMTInvocationFailed(LTTranslationAdditions)
+ (id)lt_initWithWithError:()LTTranslationAdditions qssSessionId:;
@end

@implementation MTSchemaMTInvocationFailed(LTTranslationAdditions)

+ (id)lt_initWithWithError:()LTTranslationAdditions qssSessionId:
{
  v5 = (objc_class *)MEMORY[0x263F6E3B0];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  v9 = [v7 domain];
  [v8 setErrorDomain:v9];

  uint64_t v10 = [v7 code];
  [v8 setErrorCode:v10];
  id v11 = objc_alloc_init(MEMORY[0x263F6E3E0]);
  [v11 setError:v8];
  [v11 setQssSessionId:v6];

  return v11;
}

@end