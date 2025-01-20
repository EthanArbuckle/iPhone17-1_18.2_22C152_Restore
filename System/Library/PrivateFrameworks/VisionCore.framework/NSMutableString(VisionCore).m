@interface NSMutableString(VisionCore)
- (void)VisionCore_appendPaddingCharacter:()VisionCore toMinimumLength:;
- (void)VisionCore_prependPaddingCharacter:()VisionCore toMinimumLength:;
@end

@implementation NSMutableString(VisionCore)

- (void)VisionCore_prependPaddingCharacter:()VisionCore toMinimumLength:
{
  unint64_t v7 = [a1 length];
  if (a4 > v7)
  {
    _repeatedCharacterString(a3, a4 - v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [a1 insertString:v8 atIndex:0];
  }
}

- (void)VisionCore_appendPaddingCharacter:()VisionCore toMinimumLength:
{
  unint64_t v7 = [a1 length];
  if (a4 > v7)
  {
    _repeatedCharacterString(a3, a4 - v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [a1 appendString:v8];
  }
}

@end