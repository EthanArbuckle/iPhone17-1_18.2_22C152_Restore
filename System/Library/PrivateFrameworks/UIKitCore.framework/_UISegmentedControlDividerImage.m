@interface _UISegmentedControlDividerImage
+ (BOOL)supportsSecureCoding;
- (BOOL)_suppressesAccessibilityHairlineThickening;
@end

@implementation _UISegmentedControlDividerImage

- (BOOL)_suppressesAccessibilityHairlineThickening
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end