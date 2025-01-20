@interface NSLayoutYAxisAnchor(_UIViewDynamicSystemSpacingSupport)
- (uint64_t)constraintEqualToSystemSpacingBelowAnchor:()_UIViewDynamicSystemSpacingSupport;
- (uint64_t)constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:()_UIViewDynamicSystemSpacingSupport;
- (uint64_t)constraintLessThanOrEqualToSystemSpacingBelowAnchor:()_UIViewDynamicSystemSpacingSupport;
@end

@implementation NSLayoutYAxisAnchor(_UIViewDynamicSystemSpacingSupport)

- (uint64_t)constraintEqualToSystemSpacingBelowAnchor:()_UIViewDynamicSystemSpacingSupport
{
  return objc_msgSend(a1, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", 1.0);
}

- (uint64_t)constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:()_UIViewDynamicSystemSpacingSupport
{
  return objc_msgSend(a1, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", 1.0);
}

- (uint64_t)constraintLessThanOrEqualToSystemSpacingBelowAnchor:()_UIViewDynamicSystemSpacingSupport
{
  return objc_msgSend(a1, "constraintLessThanOrEqualToSystemSpacingBelowAnchor:multiplier:", 1.0);
}

@end