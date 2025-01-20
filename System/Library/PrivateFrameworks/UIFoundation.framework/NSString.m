@interface NSString
@end

@implementation NSString

id __81__NSString_UIFontPrivate__stringByStrippingLeadingAndTrailingWhitespaceAndQuotes__block_invoke()
{
  v0 = (void *)[MEMORY[0x1E4F28E58] whitespaceCharacterSet];
  [v0 addCharactersInString:@"\""];
  id result = (id)[v0 invertedSet];
  stringByStrippingLeadingAndTrailingWhitespaceAndQuotes_nonWhitespaceCharacterSet = (uint64_t)result;
  return result;
}

@end