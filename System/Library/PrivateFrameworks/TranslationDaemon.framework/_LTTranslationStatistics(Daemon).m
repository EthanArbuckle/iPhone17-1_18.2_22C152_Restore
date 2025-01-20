@interface _LTTranslationStatistics(Daemon)
+ (id)statisticsWithEngineMeta:()Daemon locale:;
+ (uint64_t)_countWithTokenString:()Daemon countCharacters:;
- (void)copyWithZone:()Daemon;
@end

@implementation _LTTranslationStatistics(Daemon)

+ (uint64_t)_countWithTokenString:()Daemon countCharacters:
{
  if (a4)
  {
    v4 = [a3 _ltRemoveAllWhitespaces];
    uint64_t v5 = [v4 length];
  }
  else
  {
    v4 = [a3 _ltTrimWhitespaces];
    v6 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    v7 = [v4 componentsSeparatedByCharactersInSet:v6];
    uint64_t v5 = [v7 count];
  }
  return v5;
}

+ (id)statisticsWithEngineMeta:()Daemon locale:
{
  id v6 = a3;
  v7 = (objc_class *)MEMORY[0x263F1C1A8];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  uint64_t IsCharacterBasedLocale = _LTPreferencesIsCharacterBasedLocale(v8);

  v11 = [v6 objectForKeyedSubscript:@"firstleg sentencepiece encoder input"];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [v6 objectForKeyedSubscript:@"sentencepiece encoder input"];
  }
  v14 = v13;

  if ([v14 length]) {
    objc_msgSend(v9, "setInputTokenCount:", objc_msgSend(a1, "_countWithTokenString:countCharacters:", v14, IsCharacterBasedLocale));
  }
  v15 = [v6 objectForKeyedSubscript:@"firstleg sentencepiece decoder output"];
  v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = [v6 objectForKeyedSubscript:@"sentencepiece decoder output"];
  }
  v18 = v17;

  if ([v18 length]) {
    objc_msgSend(v9, "setInputSubtokenCount:", objc_msgSend(a1, "_countWithTokenString:countCharacters:", v18, IsCharacterBasedLocale));
  }

  return v9;
}

- (void)copyWithZone:()Daemon
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setInputTokenCount:", objc_msgSend(a1, "inputTokenCount"));
  objc_msgSend(v4, "setInputSubtokenCount:", objc_msgSend(a1, "inputSubtokenCount"));
  return v4;
}

@end