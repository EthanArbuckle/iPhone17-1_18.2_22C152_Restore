@interface _UIViewServiceDummyPopoverView
- (void)setUseToolbarShine:(BOOL)a3;
@end

@implementation _UIViewServiceDummyPopoverView

- (void)setUseToolbarShine:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_UIPopoverView *)self popoverController];
  [v5 _popoverView:self didSetUseToolbarShine:v3];
}

@end