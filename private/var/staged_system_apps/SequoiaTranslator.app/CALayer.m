@interface CALayer
- (void)swizzled_setNeedsLayout;
@end

@implementation CALayer

- (void)swizzled_setNeedsLayout
{
  v2 = self;
  sub_1001D2E50();
}

@end