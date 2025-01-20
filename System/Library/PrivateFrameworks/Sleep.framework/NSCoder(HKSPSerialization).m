@interface NSCoder(HKSPSerialization)
- (uint64_t)hksp_serializationOptions;
@end

@implementation NSCoder(HKSPSerialization)

- (uint64_t)hksp_serializationOptions
{
  return 0;
}

@end