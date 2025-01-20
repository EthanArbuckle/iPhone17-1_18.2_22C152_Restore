@interface NSCharacterSet(SafariCoreExtras)
+ (id)safari_asciiDigitCharacterSet;
+ (id)safari_lockRelatedEmojiCharacterSet;
+ (id)safari_obscuredPasswordCharacterSets;
+ (id)safari_whitespaceAndNewlineCharacterSet;
@end

@implementation NSCharacterSet(SafariCoreExtras)

+ (id)safari_lockRelatedEmojiCharacterSet
{
  if (safari_lockRelatedEmojiCharacterSet_onceToken != -1) {
    dispatch_once(&safari_lockRelatedEmojiCharacterSet_onceToken, &__block_literal_global_18);
  }
  v0 = (void *)safari_lockRelatedEmojiCharacterSet_emojiRelatedToLocks;
  return v0;
}

+ (id)safari_asciiDigitCharacterSet
{
  if (safari_asciiDigitCharacterSet_onceToken != -1) {
    dispatch_once(&safari_asciiDigitCharacterSet_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)safari_asciiDigitCharacterSet_asciiDigitCharacterSet;
  return v0;
}

+ (id)safari_obscuredPasswordCharacterSets
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"*"];
  v1 = objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithCharactersInString:", @".", v0);
  v5[1] = v1;
  v2 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"•"];
  v5[2] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];

  return v3;
}

+ (id)safari_whitespaceAndNewlineCharacterSet
{
  if (safari_whitespaceAndNewlineCharacterSet_onceToken != -1) {
    dispatch_once(&safari_whitespaceAndNewlineCharacterSet_onceToken, &__block_literal_global_16_1);
  }
  v0 = (void *)safari_whitespaceAndNewlineCharacterSet_whitespaceAndNewlineCharacterSet;
  return v0;
}

@end