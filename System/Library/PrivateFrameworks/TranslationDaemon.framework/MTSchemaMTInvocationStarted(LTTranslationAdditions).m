@interface MTSchemaMTInvocationStarted(LTTranslationAdditions)
+ (id)lt_initWithTask:()LTTranslationAdditions inputMode:invocationType:explicitLanguageFilterEnabled:onDevice:translateAppContext:;
@end

@implementation MTSchemaMTInvocationStarted(LTTranslationAdditions)

+ (id)lt_initWithTask:()LTTranslationAdditions inputMode:invocationType:explicitLanguageFilterEnabled:onDevice:translateAppContext:
{
  id v13 = a8;
  id v14 = objc_alloc_init(MEMORY[0x263F6E3E8]);
  [v14 setIsExplicitLanguageFilterEnabled:a6];
  [v14 setIsOnDeviceTranslation:a7];
  if (a3 <= 3) {
    [v14 setTask:a3];
  }
  if (a4 <= 4) {
    [v14 setInputSource:a4];
  }
  if (a5 <= 0xE) {
    [v14 setInvocationType:a5];
  }
  if (v13)
  {
    v15 = objc_msgSend(MEMORY[0x263F6E380], "lt_initWithTranslateAppContext:", v13);
    [v14 setAppInvocationMetadata:v15];

    objc_msgSend(v14, "setIsLanguageIdentificationEnabled:", objc_msgSend(v13, "languageIdentificationEnabled"));
  }

  return v14;
}

@end