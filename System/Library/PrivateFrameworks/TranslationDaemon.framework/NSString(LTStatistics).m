@interface NSString(LTStatistics)
- (id)_ltTrimWhitespaces;
- (uint64_t)_ltRemoveAllWhitespaces;
@end

@implementation NSString(LTStatistics)

- (uint64_t)_ltRemoveAllWhitespaces
{
  uint64_t v2 = [a1 length];
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:options:range:", @"\\s", &stru_270C008E8, 1024, 0, v2);
}

- (id)_ltTrimWhitespaces
{
  uint64_t v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v3 = [a1 stringByTrimmingCharactersInSet:v2];

  return v3;
}

@end