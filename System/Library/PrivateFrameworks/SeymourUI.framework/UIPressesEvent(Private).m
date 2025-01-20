@interface UIPressesEvent(Private)
- (uint64_t)smu_triggeringPhysicalButtonPressType;
@end

@implementation UIPressesEvent(Private)

- (uint64_t)smu_triggeringPhysicalButtonPressType
{
  v1 = [a1 _triggeringPhysicalButton];
  uint64_t v2 = [v1 type];

  return v2;
}

@end