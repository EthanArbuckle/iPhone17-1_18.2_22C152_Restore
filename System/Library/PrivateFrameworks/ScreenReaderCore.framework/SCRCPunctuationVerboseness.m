@interface SCRCPunctuationVerboseness
+ (id)punctuationDictionaryForLevel:(int64_t)a3;
+ (id)punctuationKeyForString:(id)a3;
+ (id)userExposedPunctuationCharacters;
+ (id)verbosenessDictionaryForLevel:(int64_t)a3;
@end

@implementation SCRCPunctuationVerboseness

+ (id)punctuationKeyForString:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    v4 = objc_msgSend(NSString, "stringWithFormat:", @"%04hx", objc_msgSend(v3, "characterAtIndex:", 0));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)punctuationDictionaryForLevel:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    id v3 = 0;
  }
  else {
    id v3 = off_2643D7180[a3];
  }
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = NSDictionary;
  v6 = [v4 URLForResource:v3 withExtension:@"scrconfig"];
  v7 = [v5 dictionaryWithContentsOfURL:v6];

  return v7;
}

+ (id)userExposedPunctuationCharacters
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__SCRCPunctuationVerboseness_userExposedPunctuationCharacters__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (userExposedPunctuationCharacters_onceToken != -1) {
    dispatch_once(&userExposedPunctuationCharacters_onceToken, block);
  }
  v2 = (void *)userExposedPunctuationCharacters_Keys;
  return v2;
}

void __62__SCRCPunctuationVerboseness_userExposedPunctuationCharacters__block_invoke()
{
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v0 = NSDictionary;
  v1 = [v5 URLForResource:@"SCRCPunctuation_UserExposed" withExtension:@"scrconfig"];
  v2 = [v0 dictionaryWithContentsOfURL:v1];
  uint64_t v3 = [v2 allKeys];
  v4 = (void *)userExposedPunctuationCharacters_Keys;
  userExposedPunctuationCharacters_Keys = v3;
}

+ (id)verbosenessDictionaryForLevel:(int64_t)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__SCRCPunctuationVerboseness_verbosenessDictionaryForLevel___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (verbosenessDictionaryForLevel__once != -1) {
    dispatch_once(&verbosenessDictionaryForLevel__once, block);
  }
  v4 = (void *)verbosenessDictionaryForLevel__verbosenessDictionariesForLevels;
  id v5 = [NSNumber numberWithInteger:a3];
  v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

void __60__SCRCPunctuationVerboseness_verbosenessDictionaryForLevel___block_invoke(uint64_t a1)
{
  id v11 = [MEMORY[0x263EFF9A0] dictionary];
  v2 = [*(id *)(a1 + 32) punctuationDictionaryForLevel:2];
  uint64_t v3 = [*(id *)(a1 + 32) punctuationDictionaryForLevel:1];
  v4 = [*(id *)(a1 + 32) punctuationDictionaryForLevel:0];
  [v11 setObject:v2 forKeyedSubscript:&unk_26CC2D550];
  id v5 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v2];
  [v5 addEntriesFromDictionary:v3];
  v6 = [NSDictionary dictionaryWithDictionary:v5];
  [v11 setObject:v6 forKeyedSubscript:&unk_26CC2D568];

  v7 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v5];
  [v7 addEntriesFromDictionary:v4];
  v8 = [NSDictionary dictionaryWithDictionary:v7];
  [v11 setObject:v8 forKeyedSubscript:&unk_26CC2D580];

  uint64_t v9 = [NSDictionary dictionaryWithDictionary:v11];
  v10 = (void *)verbosenessDictionaryForLevel__verbosenessDictionariesForLevels;
  verbosenessDictionaryForLevel__verbosenessDictionariesForLevels = v9;
}

@end