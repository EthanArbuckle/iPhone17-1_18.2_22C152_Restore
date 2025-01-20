@interface NSMutableString(TSWPStorage_conversion)
- (uint64_t)replaceBreaksWithPlainTextVersions;
@end

@implementation NSMutableString(TSWPStorage_conversion)

- (uint64_t)replaceBreaksWithPlainTextVersions
{
  uint64_t result = [a1 length];
  if (result)
  {
    uint64_t v3 = 0;
    __int16 v6 = 8233;
    int v5 = 720906;
    do
    {
      v4 = (void *)[[NSString alloc] initWithCharactersNoCopy:(char *)&v5 + v3 length:1 freeWhenDone:0];
      objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", v4, @"\n", 2, 0, objc_msgSend(a1, "length"));

      v3 += 2;
    }
    while (v3 != 6);
    objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", @"\x04", @"\f", 2, 0, objc_msgSend(a1, "length"));
    return objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", @"\x05", @"\f", 2, 0, objc_msgSend(a1, "length"));
  }
  return result;
}

@end