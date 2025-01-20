@interface NSString(UIFontPrivate)
- (uint64_t)stringByStrippingLeadingAndTrailingWhitespaceAndQuotes;
@end

@implementation NSString(UIFontPrivate)

- (uint64_t)stringByStrippingLeadingAndTrailingWhitespaceAndQuotes
{
  if (stringByStrippingLeadingAndTrailingWhitespaceAndQuotes_onceToken != -1) {
    dispatch_once(&stringByStrippingLeadingAndTrailingWhitespaceAndQuotes_onceToken, &__block_literal_global_38);
  }
  unint64_t v2 = [a1 rangeOfCharacterFromSet:stringByStrippingLeadingAndTrailingWhitespaceAndQuotes_nonWhitespaceCharacterSet options:0];
  uint64_t v3 = [a1 rangeOfCharacterFromSet:stringByStrippingLeadingAndTrailingWhitespaceAndQuotes_nonWhitespaceCharacterSet options:4];
  unint64_t v5 = v3 + v4;
  uint64_t result = (uint64_t)a1;
  if (v5 >= v2)
  {
    return objc_msgSend(a1, "substringWithRange:", v2, v5 - v2);
  }
  return result;
}

@end