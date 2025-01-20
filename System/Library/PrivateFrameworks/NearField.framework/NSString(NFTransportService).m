@interface NSString(NFTransportService)
- (uint64_t)encodeToCBOR;
@end

@implementation NSString(NFTransportService)

- (uint64_t)encodeToCBOR
{
  id CBORClass = getCBORClass();
  return [CBORClass cborWithUTF8String:a1];
}

@end