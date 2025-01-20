@interface MTSchemaMTLanguageIdentificationCompleted(LTTranslationAdditions)
+ (id)lt_initWithInputSource:()LTTranslationAdditions topLocale:lowConfidenceLocales:;
@end

@implementation MTSchemaMTLanguageIdentificationCompleted(LTTranslationAdditions)

+ (id)lt_initWithInputSource:()LTTranslationAdditions topLocale:lowConfidenceLocales:
{
  id v7 = a4;
  v8 = (objc_class *)MEMORY[0x263F6E3F8];
  id v9 = a5;
  id v10 = objc_alloc_init(v8);
  v11 = v10;
  if (a3 <= 4) {
    [v10 setInputSource:a3];
  }
  [v11 setTopLocale:convertFromNSLocale(v7)];
  [v11 setLidConfidences:v9];

  return v11;
}

@end