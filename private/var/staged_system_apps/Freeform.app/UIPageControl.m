@interface UIPageControl
- (BOOL)crlaxPageChangeCausesLayoutChange;
- (void)crlaxSetPageChangeCausesLayoutChange:(BOOL)a3;
@end

@implementation UIPageControl

- (BOOL)crlaxPageChangeCausesLayoutChange
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A8FF8);
}

- (void)crlaxSetPageChangeCausesLayoutChange:(BOOL)a3
{
}

@end