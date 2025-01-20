@interface NSData(Base64)
- (uint64_t)base64;
@end

@implementation NSData(Base64)

- (uint64_t)base64
{
  return [a1 base64EncodedStringWithOptions:0];
}

@end