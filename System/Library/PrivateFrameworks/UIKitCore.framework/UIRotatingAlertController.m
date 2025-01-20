@interface UIRotatingAlertController
@end

@implementation UIRotatingAlertController

uint64_t __41___UIRotatingAlertController_willRotate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSheetPositionAfterRotation];
}

@end