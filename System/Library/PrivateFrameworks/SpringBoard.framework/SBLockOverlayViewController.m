@interface SBLockOverlayViewController
- (BOOL)shouldBeHidden;
- (SBLockOverlayViewControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation SBLockOverlayViewController

- (BOOL)shouldBeHidden
{
  return 0;
}

- (SBLockOverlayViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBLockOverlayViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end