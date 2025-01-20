@interface SingleMemoryDebugViewController
@end

@implementation SingleMemoryDebugViewController

void __58___SingleMemoryDebugViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setSpecSet:v3];
  [v4 setVariant:*(void *)(a1 + 40)];
  objc_msgSend(v4, "setLayoutMargins:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

void __47___SingleMemoryDebugViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 localizedDateText];
  [v4 setLocalizedDateText:v5];

  v6 = [*(id *)(a1 + 32) localizedTitle];
  [v4 setLocalizedTitle:v6];

  id v8 = [*(id *)(a1 + 32) keyAssetFetchResult];
  v7 = [v8 firstObject];
  [v4 setKeyAsset:v7];
}

@end