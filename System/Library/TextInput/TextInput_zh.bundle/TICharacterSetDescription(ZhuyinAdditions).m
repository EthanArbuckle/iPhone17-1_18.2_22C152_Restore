@interface TICharacterSetDescription(ZhuyinAdditions)
+ (id)zhuyinWordCharacters;
@end

@implementation TICharacterSetDescription(ZhuyinAdditions)

+ (id)zhuyinWordCharacters
{
  v0 = (void *)zhuyinWordCharacters__wordCharacterSet;
  if (!zhuyinWordCharacters__wordCharacterSet)
  {
    v1 = (void *)[objc_alloc(MEMORY[0x263F7E6B0]) initWithBaseCharacterSet:3];
    [v1 removeCharactersInString:@" "];
    uint64_t v2 = [v1 invertedSetDescription];
    v3 = (void *)zhuyinWordCharacters__wordCharacterSet;
    zhuyinWordCharacters__wordCharacterSet = v2;

    v0 = (void *)zhuyinWordCharacters__wordCharacterSet;
  }
  return v0;
}

@end