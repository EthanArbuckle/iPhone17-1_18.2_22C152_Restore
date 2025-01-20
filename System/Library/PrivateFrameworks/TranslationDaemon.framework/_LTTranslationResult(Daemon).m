@interface _LTTranslationResult(Daemon)
+ (id)passthroughResultWithString:()Daemon sanitizedString:locale:;
+ (id)resultWithLocale:()Daemon translations:;
@end

@implementation _LTTranslationResult(Daemon)

+ (id)passthroughResultWithString:()Daemon sanitizedString:locale:
{
  v15[1] = *MEMORY[0x263EF8340];
  v7 = (objc_class *)MEMORY[0x263F1C190];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v7);
  [v11 setLocale:v8];

  v12 = (void *)[objc_alloc(MEMORY[0x263F1C170]) initWithFormattedString:v10 sanitizedFormattedString:v9 confidence:0 lowConfidence:0 romanization:0 tokens:0 preToPostITN:1000.0];
  v15[0] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  [v11 setTranslations:v13];

  return v11;
}

+ (id)resultWithLocale:()Daemon translations:
{
  v5 = (objc_class *)MEMORY[0x263F1C190];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setLocale:v7];

  [v8 setTranslations:v6];
  [v8 setIdentifier:@"NO_IDENTIFIER"];
  return v8;
}

@end