@interface PXStatusBarHiddenViewController
- (BOOL)prefersStatusBarHidden;
@end

@implementation PXStatusBarHiddenViewController

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

@end