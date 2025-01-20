@interface UIAccessibilityCustomRotorItemResult(AXPrivate)
- (uint64_t)setTargetTextMarkerRange:()AXPrivate;
- (uint64_t)targetTextMarkerRange;
- (void)initWithTargetElement:()AXPrivate targetRange:targetTextMarkerRange:;
@end

@implementation UIAccessibilityCustomRotorItemResult(AXPrivate)

- (uint64_t)setTargetTextMarkerRange:()AXPrivate
{
  return [a1 _accessibilitySetRetainedValue:a3 forKey:@"targetTextMarkerRange"];
}

- (uint64_t)targetTextMarkerRange
{
  return [a1 _accessibilityValueForKey:@"targetTextMarkerRange"];
}

- (void)initWithTargetElement:()AXPrivate targetRange:targetTextMarkerRange:
{
  id v8 = a5;
  v9 = (void *)[a1 initWithTargetElement:a3 targetRange:a4];
  [v9 setTargetTextMarkerRange:v8];

  return v9;
}

@end