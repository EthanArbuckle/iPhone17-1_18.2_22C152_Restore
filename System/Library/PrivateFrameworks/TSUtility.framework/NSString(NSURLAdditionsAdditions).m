@interface NSString(NSURLAdditionsAdditions)
- (BOOL)containsPercentEscapes;
@end

@implementation NSString(NSURLAdditionsAdditions)

- (BOOL)containsPercentEscapes
{
  unint64_t v2 = [a1 length];
  {
    -[NSString(NSURLAdditionsAdditions) containsPercentEscapes]::hexSet = (uint64_t)(id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"0123456789abcdefABCDEF"];
  }
  uint64_t v3 = objc_msgSend(a1, "rangeOfString:options:range:", @"%", 0, 0, v2);
  for (BOOL i = v3 != 0x7FFFFFFFFFFFFFFFLL; v3 != 0x7FFFFFFFFFFFFFFFLL; BOOL i = v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v3 + v4;
    unint64_t v7 = v3 + v4 + 1;
    if (v7 < v2
      && objc_msgSend((id)-[NSString(NSURLAdditionsAdditions) containsPercentEscapes]::hexSet, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v6))&& (objc_msgSend((id)-[NSString(NSURLAdditionsAdditions) containsPercentEscapes]::hexSet, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v7)) & 1) != 0)
    {
      break;
    }
    uint64_t v3 = objc_msgSend(a1, "rangeOfString:options:range:", @"%", 0, v6, v2 - v6);
  }
  return i;
}

@end