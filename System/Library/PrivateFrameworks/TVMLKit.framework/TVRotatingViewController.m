@interface TVRotatingViewController
@end

@implementation TVRotatingViewController

void __80___TVRotatingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setNeedsLayout];
}

@end