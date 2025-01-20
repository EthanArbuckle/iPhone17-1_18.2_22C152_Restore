@interface NSString(PrefsFormatting)
- (id)ICCIDString;
- (id)IMEIString;
@end

@implementation NSString(PrefsFormatting)

- (id)ICCIDString
{
  v2 = (void *)[a1 mutableCopy];
  if ((unint64_t)[a1 length] >= 4 && (unint64_t)objc_msgSend(a1, "length") >= 5)
  {
    int v3 = 0;
    unint64_t v4 = 4;
    do
    {
      if ([a1 length] > v4) {
        [v2 insertString:@" " atIndex:(int)v4 + v3++];
      }
      v4 += 4;
    }
    while ([a1 length] > v4);
  }
  return v2;
}

- (id)IMEIString
{
  v1 = (void *)[a1 mutableCopy];
  if ((unint64_t)[v1 length] >= 3) {
    [v1 insertString:@" " atIndex:2];
  }
  if ((unint64_t)[v1 length] >= 0xA) {
    [v1 insertString:@" " atIndex:9];
  }
  if ((unint64_t)[v1 length] >= 0x11) {
    [v1 insertString:@" " atIndex:16];
  }
  return v1;
}

@end