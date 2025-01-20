@interface NSString(OAURLEncode)
- (__CFString)oauth_urlEncodedString;
@end

@implementation NSString(OAURLEncode)

- (__CFString)oauth_urlEncodedString
{
  v1 = (__CFString *)CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x263EFFB08], originalString, 0, @":/?#[]@!$&’()*+,;=%",
                       0x8000100u);
  return v1;
}

@end