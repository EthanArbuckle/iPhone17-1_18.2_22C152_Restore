@interface CACEditingOverlayPopoverPresentingViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isOverlay;
- (int64_t)zOrder;
@end

@implementation CACEditingOverlayPopoverPresentingViewController

- (int64_t)zOrder
{
  return 10;
}

- (BOOL)isOverlay
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end