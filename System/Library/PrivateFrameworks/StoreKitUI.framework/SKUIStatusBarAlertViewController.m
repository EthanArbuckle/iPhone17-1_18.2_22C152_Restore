@interface SKUIStatusBarAlertViewController
@end

@implementation SKUIStatusBarAlertViewController

uint64_t __88___SKUIStatusBarAlertViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateLabelFrame];
  v2 = *(void **)(*(void *)(a1 + 32) + 976);

  return [v2 setHidden:0];
}

@end