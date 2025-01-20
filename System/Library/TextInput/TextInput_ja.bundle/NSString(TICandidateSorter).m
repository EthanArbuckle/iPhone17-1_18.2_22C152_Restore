@interface NSString(TICandidateSorter)
- (__CFString)stringByConvertingKatakanaToHiragana;
@end

@implementation NSString(TICandidateSorter)

- (__CFString)stringByConvertingKatakanaToHiragana
{
  v1 = (__CFString *)[a1 mutableCopy];
  CFStringTransform(v1, 0, (CFStringRef)*MEMORY[0x263EFFEF8], 1u);
  return v1;
}

@end