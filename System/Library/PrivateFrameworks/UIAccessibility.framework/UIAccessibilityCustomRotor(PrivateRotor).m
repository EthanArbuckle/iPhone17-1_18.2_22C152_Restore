@interface UIAccessibilityCustomRotor(PrivateRotor)
- (uint64_t)linkCount;
- (uint64_t)setLinkCount:()PrivateRotor;
- (uint64_t)setVisibleInTouchRotor:()PrivateRotor;
- (uint64_t)visibleInTouchRotor;
@end

@implementation UIAccessibilityCustomRotor(PrivateRotor)

- (uint64_t)setLinkCount:()PrivateRotor
{
  return [a1 _accessibilitySetIntegerValue:a3 forKey:@"linkCount"];
}

- (uint64_t)linkCount
{
  return [a1 _accessibilityIntegerValueForKey:@"linkCount"];
}

- (uint64_t)setVisibleInTouchRotor:()PrivateRotor
{
  return [a1 _accessibilitySetBoolValue:a3 forKey:@"visibleInTouchRotor"];
}

- (uint64_t)visibleInTouchRotor
{
  return [a1 _accessibilityBoolValueForKey:@"visibleInTouchRotor"];
}

@end