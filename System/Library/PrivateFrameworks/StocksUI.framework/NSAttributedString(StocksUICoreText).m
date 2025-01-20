@interface NSAttributedString(StocksUICoreText)
- (BOOL)su_containsExcessiveLineHeightCharacter;
- (double)su_languageAwareOutsetsAtScale:()StocksUICoreText;
@end

@implementation NSAttributedString(StocksUICoreText)

- (BOOL)su_containsExcessiveLineHeightCharacter
{
  v1 = [a1 string];
  v2 = su_excessiveLineHeightCharacters();
  BOOL v3 = [v1 rangeOfCharacterFromSet:v2] != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (double)su_languageAwareOutsetsAtScale:()StocksUICoreText
{
  uint64_t v10 = 0;
  v11 = (double *)&v10;
  uint64_t v12 = 0x4010000000;
  v13 = &unk_20A969F9A;
  long long v4 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
  long long v14 = *MEMORY[0x263F834E8];
  long long v15 = v4;
  uint64_t v5 = [a1 length];
  uint64_t v6 = *MEMORY[0x263F814F0];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __71__NSAttributedString_StocksUICoreText__su_languageAwareOutsetsAtScale___block_invoke;
  v9[3] = &unk_263FDD150;
  *(double *)&v9[5] = a2;
  v9[4] = &v10;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v5, 0, v9);
  double v7 = v11[4];
  _Block_object_dispose(&v10, 8);
  return v7;
}

@end