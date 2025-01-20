@interface MTSchemaMTLocalePair(LTTranslationAdditions)
+ (id)lt_initWithLocalePair:()LTTranslationAdditions;
@end

@implementation MTSchemaMTLocalePair(LTTranslationAdditions)

+ (id)lt_initWithLocalePair:()LTTranslationAdditions
{
  v3 = (objc_class *)MEMORY[0x263F6E408];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [v4 sourceLocale];
  [v5 setSourceLocale:convertFromNSLocale(v6)];

  v7 = [v4 targetLocale];

  [v5 setTargetLocale:convertFromNSLocale(v7)];
  return v5;
}

@end