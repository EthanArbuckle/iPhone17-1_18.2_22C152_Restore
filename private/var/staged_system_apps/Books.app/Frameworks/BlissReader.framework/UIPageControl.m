@interface UIPageControl
- (BOOL)tsaxPageChangeCausesLayoutChange;
- (void)tsaxSetPageChangeCausesLayoutChange:(BOOL)a3;
@end

@implementation UIPageControl

- (BOOL)tsaxPageChangeCausesLayoutChange
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5739F7);
}

- (void)tsaxSetPageChangeCausesLayoutChange:(BOOL)a3
{
}

@end