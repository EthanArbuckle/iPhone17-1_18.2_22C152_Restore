@interface NSNumber(HKSPSyncAnchor)
- (uint64_t)hksp_increment;
@end

@implementation NSNumber(HKSPSyncAnchor)

- (uint64_t)hksp_increment
{
  v1 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v2 = [a1 unsignedIntegerValue] + 1;
  return [v1 numberWithUnsignedInteger:v2];
}

@end