@interface TICharacterSetDescription(JapaneseAdditions)
+ (id)kanaWordCharacters;
+ (id)romajiWordCharacters;
@end

@implementation TICharacterSetDescription(JapaneseAdditions)

+ (id)kanaWordCharacters
{
  v0 = (void *)kanaWordCharacters_wordCharacterSet;
  if (!kanaWordCharacters_wordCharacterSet)
  {
    v1 = (void *)[objc_alloc(MEMORY[0x263F7E520]) initWithBaseCharacterSet:3];
    uint64_t v2 = [v1 invertedSetDescription];
    v3 = (void *)kanaWordCharacters_wordCharacterSet;
    kanaWordCharacters_wordCharacterSet = v2;

    v0 = (void *)kanaWordCharacters_wordCharacterSet;
  }
  return v0;
}

+ (id)romajiWordCharacters
{
  v0 = (void *)romajiWordCharacters_wordCharacterSet;
  if (!romajiWordCharacters_wordCharacterSet)
  {
    v1 = (void *)[objc_alloc(MEMORY[0x263F7E6B0]) initWithBaseCharacterSet:3];
    [v1 removeCharactersInString:@" 　"];
    uint64_t v2 = [v1 invertedSetDescription];
    v3 = (void *)romajiWordCharacters_wordCharacterSet;
    romajiWordCharacters_wordCharacterSet = v2;

    v0 = (void *)romajiWordCharacters_wordCharacterSet;
  }
  return v0;
}

@end