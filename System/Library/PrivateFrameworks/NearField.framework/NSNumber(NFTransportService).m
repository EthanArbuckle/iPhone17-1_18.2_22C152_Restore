@interface NSNumber(NFTransportService)
- (uint64_t)encodeToCBOR;
@end

@implementation NSNumber(NFTransportService)

- (uint64_t)encodeToCBOR
{
  id CBORClass = getCBORClass();
  uint64_t v3 = [a1 integerValue];
  return [CBORClass cborWithInteger:v3];
}

@end