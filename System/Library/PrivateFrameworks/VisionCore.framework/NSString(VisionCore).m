@interface NSString(VisionCore)
- (id)VisionCore_stringAppendedWithPaddingCharacter:()VisionCore toMinimumLength:;
- (id)VisionCore_stringPrependedWithPaddingCharacter:()VisionCore toMinimumLength:;
@end

@implementation NSString(VisionCore)

- (id)VisionCore_stringPrependedWithPaddingCharacter:()VisionCore toMinimumLength:
{
  unint64_t v7 = [a1 length];
  if (a4 <= v7)
  {
    id v9 = a1;
  }
  else
  {
    v8 = _repeatedCharacterString(a3, a4 - v7);
    id v9 = [v8 stringByAppendingString:a1];
  }
  return v9;
}

- (id)VisionCore_stringAppendedWithPaddingCharacter:()VisionCore toMinimumLength:
{
  unint64_t v7 = [a1 length];
  if (a4 <= v7)
  {
    id v9 = a1;
  }
  else
  {
    v8 = _repeatedCharacterString(a3, a4 - v7);
    id v9 = [a1 stringByAppendingString:v8];
  }
  return v9;
}

@end