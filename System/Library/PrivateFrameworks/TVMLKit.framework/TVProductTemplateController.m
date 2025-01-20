@interface TVProductTemplateController
@end

@implementation TVProductTemplateController

void __46___TVProductTemplateController_viewDidAppear___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x263F15760] animationWithKeyPath:@"filters.blurFilter.inputRadius"];
  [v3 setToValue:&unk_26E59EC38];
  [v3 setDuration:0.4];
  [v3 setFillMode:*MEMORY[0x263F15AB0]];
  [v3 setRemovedOnCompletion:0];
  [v3 setDelegate:*(void *)(a1 + 32)];
  v2 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
  [v3 setTimingFunction:v2];

  [*(id *)(*(void *)(a1 + 32) + 1064) addAnimation:v3 forKey:@"blurRadiusAnimation"];
}

void __61___TVProductTemplateController_configureAppearanceTransition__block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = [WeakRetained navigationController];
    v5 = [v4 navigationBar];
  }
  else
  {
    v5 = 0;
  }
  if (*(unsigned char *)(a1 + 49)) {
    double v6 = 0.0;
  }
  else {
    double v6 = 1.0;
  }
  [v5 _setBackgroundOpacity:v6];
  if (*(unsigned char *)(a1 + 49)) {
    double v7 = 0.0;
  }
  else {
    double v7 = 1.0;
  }
  [v5 _setTitleOpacity:v7];
  v8 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 49))
  {
    [*(id *)(a1 + 32) setTitle:0];
  }
  else
  {
    id v9 = objc_loadWeakRetained((id *)(a1 + 40));
    v10 = [v9 navigationItem];
    v11 = [v10 title];
    [v8 setTitle:v11];
  }
  if (*(unsigned char *)(a1 + 49)) {
    [MEMORY[0x263F1C550] whiteColor];
  }
  else {
  v12 = objc_msgSend(MEMORY[0x263F1C550], "tvmlkit_keyColor");
  }
  [v5 setTintColor:v12];
}

void __61___TVProductTemplateController_configureAppearanceTransition__block_invoke_2(uint64_t a1, void *a2)
{
  id v14 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = [WeakRetained navigationController];
    v5 = [v4 navigationBar];
  }
  else
  {
    v5 = 0;
  }
  if (*(unsigned char *)(a1 + 49)) {
    double v6 = 0.0;
  }
  else {
    double v6 = 1.0;
  }
  [v5 _setBackgroundOpacity:v6];
  if (*(unsigned char *)(a1 + 49)) {
    double v7 = 0.0;
  }
  else {
    double v7 = 1.0;
  }
  [v5 _setTitleOpacity:v7];
  v8 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 49))
  {
    [*(id *)(a1 + 32) setTitle:0];
  }
  else
  {
    id v9 = objc_loadWeakRetained((id *)(a1 + 40));
    v10 = [v9 navigationItem];
    v11 = [v10 title];
    [v8 setTitle:v11];
  }
  if (*(unsigned char *)(a1 + 49)) {
    [MEMORY[0x263F1C550] whiteColor];
  }
  else {
  v12 = objc_msgSend(MEMORY[0x263F1C550], "tvmlkit_keyColor");
  }
  [v5 setTintColor:v12];

  id v13 = objc_loadWeakRetained((id *)(a1 + 40));
  [v13 setNeedsStatusBarAppearanceUpdate];
}

uint64_t __83___TVProductTemplateController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 1152) collectionViewLayout];
  [v2 invalidateLayout];

  id v3 = *(void **)(a1 + 32);
  return [v3 configureAppearanceTransition];
}

void __52___TVProductTemplateController_scrollViewDidScroll___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 performSelector:sel__cancelImpressionsUpdate];
  }
}

uint64_t __62___TVProductTemplateController__updateTopHeroImageVisibility___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setTitleOpacity:1.0];
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 setTitle:v3];
}

uint64_t __62___TVProductTemplateController__updateTopHeroImageVisibility___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setTitleOpacity:0.0];
  id v2 = *(void **)(a1 + 40);
  return [v2 setTitle:0];
}

void __78___TVProductTemplateController__spacingMetricsForViewControllers_contentSize___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 view];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  if ([v3 conformsToProtocol:&unk_26E5D45B8])
  {
    v4 = [v3 rowMetricsForExpectedWidth:0 firstItemRowIndex:*(double *)(a1 + 48)];
    TVRowMetricsMakeWithList(v4, &v10);
    double v6 = *((double *)&v10 + 1);
    uint64_t v5 = v10;
    long long v15 = v11;
    long long v16 = v12;
    long long v17 = v13;
    long long v18 = v14;
  }
  else
  {
    objc_msgSend(v3, "tv_sizeThatFits:", *(double *)(a1 + 48), 0.0);
    double v6 = v7;
    uint64_t v5 = 0;
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v6
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 40);
  v8 = *(void **)(a1 + 32);
  *(void *)&long long v10 = v5;
  *((double *)&v10 + 1) = v6;
  long long v11 = v15;
  long long v12 = v16;
  long long v13 = v17;
  long long v14 = v18;
  id v9 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithRowMetrics:", &v10);
  [v8 addObject:v9];
}

@end