@interface NSDate(NFTransportService)
- (uint64_t)encodeToCBOR;
@end

@implementation NSDate(NFTransportService)

- (uint64_t)encodeToCBOR
{
  id CBORClass = getCBORClass();
  return [CBORClass cborWithFullDate:a1];
}

@end