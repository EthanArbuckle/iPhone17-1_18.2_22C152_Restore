@interface VSSpeechSynthesizerPreference
+ (id)availableLanguages;
+ (id)fallbackLanguageForLanguage:(id)a3;
@end

@implementation VSSpeechSynthesizerPreference

+ (id)fallbackLanguageForLanguage:(id)a3
{
  v4 = [a3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  v5 = [a1 availableLanguages];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    v7 = v4;
LABEL_7:
    v9 = v7;
    goto LABEL_8;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__VSSpeechSynthesizerPreference_fallbackLanguageForLanguage___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (fallbackLanguageForLanguage__onceToken != -1) {
    dispatch_once(&fallbackLanguageForLanguage__onceToken, block);
  }
  v8 = [(id)fallbackLanguageForLanguage__fallbacks objectForKeyedSubscript:v4];

  if (v8)
  {
    v7 = [(id)fallbackLanguageForLanguage__fallbacks objectForKeyedSubscript:v4];
    goto LABEL_7;
  }
  uint64_t v11 = [v4 rangeOfString:@"-"];
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = objc_msgSend(v4, "substringWithRange:", 0, v11);
    if (v12)
    {
      v13 = [(id)fallbackLanguageForLanguage__fallbacks objectForKeyedSubscript:v12];

      if (v13)
      {
        v9 = [(id)fallbackLanguageForLanguage__fallbacks objectForKeyedSubscript:v12];

        goto LABEL_8;
      }
    }
  }
  v9 = @"en-US";
LABEL_8:

  return v9;
}

void __61__VSSpeechSynthesizerPreference_fallbackLanguageForLanguage___block_invoke()
{
  v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v0 pathForResource:@"tts_language_fallbacks" ofType:@"plist"];

  uint64_t v1 = [NSDictionary dictionaryWithContentsOfFile:v3];
  v2 = (void *)fallbackLanguageForLanguage__fallbacks;
  fallbackLanguageForLanguage__fallbacks = v1;
}

+ (id)availableLanguages
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__VSSpeechSynthesizerPreference_availableLanguages__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (availableLanguages_onceToken != -1) {
    dispatch_once(&availableLanguages_onceToken, block);
  }
  v2 = (void *)availableLanguages__availableLanguages;
  return v2;
}

void __51__VSSpeechSynthesizerPreference_availableLanguages__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v0 pathForResource:@"tts_languages" ofType:@"plist"];

  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithContentsOfFile:v4];
  uint64_t v2 = [MEMORY[0x263EFFA08] setWithArray:v1];
  id v3 = (void *)availableLanguages__availableLanguages;
  availableLanguages__availableLanguages = v2;
}

@end