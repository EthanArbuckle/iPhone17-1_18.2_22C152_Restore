@interface TVLoadingViewController
@end

@implementation TVLoadingViewController

void __43___TVLoadingViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) loadingTitleLabel];
  [v2 setAlpha:1.0];

  v3 = [*(id *)(a1 + 32) loadingTitleLabel];
  long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v5[0] = *MEMORY[0x263F000D0];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v3 setTransform:v5];
}

void __46___TVLoadingViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) loadingTitleLabel];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) spinnerView];
  [v3 setAlpha:0.0];
}

@end