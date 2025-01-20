@interface NSCharacterSet(Hangul)
+ (uint64_t)hangulConsonantVariants;
+ (uint64_t)hangulHorizontalVowels;
+ (uint64_t)hangulLeadingConsonants;
+ (uint64_t)hangulMixedVowels;
+ (uint64_t)hangulTrailingConsonants;
+ (uint64_t)hangulVerticalVowels;
@end

@implementation NSCharacterSet(Hangul)

+ (uint64_t)hangulHorizontalVowels
{
  return [MEMORY[0x263F08708] characterSetWithCharactersInString:@"ㅗㅛㅜㅠㅡ"];
}

+ (uint64_t)hangulVerticalVowels
{
  return [MEMORY[0x263F08708] characterSetWithCharactersInString:@"ㅏㅐㅑㅒㅓㅔㅕㅖㅣ"];
}

+ (uint64_t)hangulMixedVowels
{
  return [MEMORY[0x263F08708] characterSetWithCharactersInString:@"ㅘㅙㅚㅝㅞㅟㅢ"];
}

+ (uint64_t)hangulLeadingConsonants
{
  return [MEMORY[0x263F08708] characterSetWithCharactersInString:@"ㄱㄲㄴㄷㄸㄹㅁㅂㅃㅅㅆㅇㅈㅉㅊㅋㅌㅍㅎ"];
}

+ (uint64_t)hangulTrailingConsonants
{
  return [MEMORY[0x263F08708] characterSetWithCharactersInString:@"ㄱㄲㄳㄴㄵㄶㄷㄹㄺㄻㄼㄽㄾㄿㅀㅁㅂㅄㅅㅆㅇㅈㅊㅋㅌㅍㅎ"];
}

+ (uint64_t)hangulConsonantVariants
{
  return [MEMORY[0x263F08708] characterSetWithCharactersInString:@"ㄱㄲㅋ"];
}

@end