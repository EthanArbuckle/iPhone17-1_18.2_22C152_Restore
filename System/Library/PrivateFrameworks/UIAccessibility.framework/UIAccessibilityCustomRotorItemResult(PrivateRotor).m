@interface UIAccessibilityCustomRotorItemResult(PrivateRotor)
- (uint64_t)targetNSRange;
- (void)setTargetNSRange:()PrivateRotor;
@end

@implementation UIAccessibilityCustomRotorItemResult(PrivateRotor)

- (void)setTargetNSRange:()PrivateRotor
{
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _accessibilitySetRetainedValue:v2 forKey:@"targetNSRange"];
}

- (uint64_t)targetNSRange
{
  v1 = [a1 _accessibilityValueForKey:@"targetNSRange"];
  id v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 rangeValue];
  }
  else {
    uint64_t v3 = 0x7FFFFFFFLL;
  }

  return v3;
}

@end