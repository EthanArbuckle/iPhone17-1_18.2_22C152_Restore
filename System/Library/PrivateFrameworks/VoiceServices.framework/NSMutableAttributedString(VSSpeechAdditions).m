@interface NSMutableAttributedString(VSSpeechAdditions)
- (uint64_t)appendString:()VSSpeechAdditions withAttributes:;
@end

@implementation NSMutableAttributedString(VSSpeechAdditions)

- (uint64_t)appendString:()VSSpeechAdditions withAttributes:
{
  uint64_t v7 = [a3 length];
  uint64_t v8 = [a1 length];
  objc_msgSend(a1, "replaceCharactersInRange:withString:", v8, 0, a3);
  return objc_msgSend(a1, "setAttributes:range:", a4, v8, v7);
}

@end