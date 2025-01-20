@interface NSObject(LargeTextAuditSupport)
- (uint64_t)_accessibilitySupportsContentSizeCategory:()LargeTextAuditSupport;
@end

@implementation NSObject(LargeTextAuditSupport)

- (uint64_t)_accessibilitySupportsContentSizeCategory:()LargeTextAuditSupport
{
  return 1;
}

@end