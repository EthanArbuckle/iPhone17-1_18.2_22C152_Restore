@interface NSLocale(SCRCLocaleExtras)
+ (void)_nonRomanLanguages;
- (uint64_t)usesRomanTextProcessing;
@end

@implementation NSLocale(SCRCLocaleExtras)

+ (void)_nonRomanLanguages
{
  return &unk_26CC2D488;
}

- (uint64_t)usesRomanTextProcessing
{
  v1 = [a1 objectForKey:*MEMORY[0x263EFF508]];
  if (v1)
  {
    v2 = [MEMORY[0x263EFF960] _nonRomanLanguages];
    uint64_t v3 = [v2 containsObject:v1] ^ 1;
  }
  else
  {
    uint64_t v3 = 1;
  }

  return v3;
}

@end