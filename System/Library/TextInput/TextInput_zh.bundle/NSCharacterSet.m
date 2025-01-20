@interface NSCharacterSet
@end

@implementation NSCharacterSet

uint64_t __61__NSCharacterSet_ZhuyinAddition__zhuyinConsonantCharacterSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"ㄅㄆㄇㄈㄉㄊㄋㄌㄍㄎㄏㄐㄑㄒㄓㄔㄕㄖㄗㄘㄙ"];
  uint64_t v1 = zhuyinConsonantCharacterSet___zhuyinConsonantCharacterSet;
  zhuyinConsonantCharacterSet___zhuyinConsonantCharacterSet = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __58__NSCharacterSet_ZhuyinAddition__zhuyinMedialCharacterSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"ㄧㄨㄩ"];
  uint64_t v1 = zhuyinMedialCharacterSet___zhuyinMedialCharacterSet;
  zhuyinMedialCharacterSet___zhuyinMedialCharacterSet = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __57__NSCharacterSet_ZhuyinAddition__zhuyinVowelCharacterSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"ㄚㄛㄜㄝㄞㄟㄠㄡㄢㄣㄤㄥㄦ"];
  uint64_t v1 = zhuyinVowelCharacterSet___zhuyinVowelCharacterSet;
  zhuyinVowelCharacterSet___zhuyinVowelCharacterSet = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __59__NSCharacterSet_ZhuyinAddition__zhuyinPhonemeCharacterSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"ㄅㄆㄇㄈㄉㄊㄋㄌㄍㄎㄏㄐㄑㄒㄓㄔㄕㄖㄗㄘㄙㄧㄨㄩㄚㄛㄜㄝㄞㄟㄠㄡㄢㄣㄤㄥㄦ"];
  uint64_t v1 = zhuyinPhonemeCharacterSet___zhuyinPhonemeCharacterSet;
  zhuyinPhonemeCharacterSet___zhuyinPhonemeCharacterSet = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __56__NSCharacterSet_ZhuyinAddition__zhuyinToneCharacterSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"ˉˊˇˋ˙"];
  uint64_t v1 = zhuyinToneCharacterSet___zhuyinToneCharacterSet;
  zhuyinToneCharacterSet___zhuyinToneCharacterSet = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __52__NSCharacterSet_ZhuyinAddition__zhuyinCharacterSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"ㄅㄆㄇㄈㄉㄊㄋㄌㄍㄎㄏㄐㄑㄒㄓㄔㄕㄖㄗㄘㄙㄧㄨㄩㄚㄛㄜㄝㄞㄟㄠㄡㄢㄣㄤㄥㄦˉˊˇˋ˙"];
  uint64_t v1 = zhuyinCharacterSet___zhuyinCharacterSet;
  zhuyinCharacterSet___zhuyinCharacterSet = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void __66__NSCharacterSet_ZhuyinAddition__punctuationAndSymbolCharacterSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08708] punctuationCharacterSet];
  uint64_t v1 = (void *)[v0 mutableCopy];

  v2 = [MEMORY[0x263F08708] symbolCharacterSet];
  [v1 formUnionWithCharacterSet:v2];

  v3 = (void *)punctuationAndSymbolCharacterSet___punctuationAndSymbolCharacterSet;
  punctuationAndSymbolCharacterSet___punctuationAndSymbolCharacterSet = (uint64_t)v1;
}

@end