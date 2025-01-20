@interface NSString(Crypto)
- (uint64_t)getDataUsingOfficeCryptographicEncoding;
@end

@implementation NSString(Crypto)

- (uint64_t)getDataUsingOfficeCryptographicEncoding
{
  return [a1 dataUsingEncoding:2483028224];
}

@end