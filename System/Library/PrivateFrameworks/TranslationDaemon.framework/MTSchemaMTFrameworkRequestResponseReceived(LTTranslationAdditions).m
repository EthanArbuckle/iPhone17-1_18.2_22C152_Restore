@interface MTSchemaMTFrameworkRequestResponseReceived(LTTranslationAdditions)
+ (id)lt_initWithFrameworkRequestId:()LTTranslationAdditions requestRoute:numberOfSentences:;
@end

@implementation MTSchemaMTFrameworkRequestResponseReceived(LTTranslationAdditions)

+ (id)lt_initWithFrameworkRequestId:()LTTranslationAdditions requestRoute:numberOfSentences:
{
  v7 = (objc_class *)MEMORY[0x263F6E3B8];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  [v9 setFrameworkRequestId:v8];

  [v9 setNumSentences:a5];
  if (a4 <= 2) {
    [v9 setRequestRoute:a4];
  }
  return v9;
}

@end