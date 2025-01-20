@interface NSString
- (id)in_URLEncodedString;
@end

@implementation NSString

- (id)in_URLEncodedString
{
  v2 = (__CFString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, 0, @"!*'();:@&=+$,/?%#[]",
                       0x8000100u);
  return v2;
}

@end