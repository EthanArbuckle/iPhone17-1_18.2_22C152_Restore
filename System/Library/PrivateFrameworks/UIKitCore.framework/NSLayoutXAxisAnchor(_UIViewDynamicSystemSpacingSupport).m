@interface NSLayoutXAxisAnchor(_UIViewDynamicSystemSpacingSupport)
- (uint64_t)constraintEqualToSystemSpacingAfterAnchor:()_UIViewDynamicSystemSpacingSupport;
- (uint64_t)constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:()_UIViewDynamicSystemSpacingSupport;
- (uint64_t)constraintLessThanOrEqualToSystemSpacingAfterAnchor:()_UIViewDynamicSystemSpacingSupport;
@end

@implementation NSLayoutXAxisAnchor(_UIViewDynamicSystemSpacingSupport)

- (uint64_t)constraintEqualToSystemSpacingAfterAnchor:()_UIViewDynamicSystemSpacingSupport
{
  return objc_msgSend(a1, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", 1.0);
}

- (uint64_t)constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:()_UIViewDynamicSystemSpacingSupport
{
  return objc_msgSend(a1, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", 1.0);
}

- (uint64_t)constraintLessThanOrEqualToSystemSpacingAfterAnchor:()_UIViewDynamicSystemSpacingSupport
{
  return objc_msgSend(a1, "constraintLessThanOrEqualToSystemSpacingAfterAnchor:multiplier:", 1.0);
}

@end