@interface SAUIPortalView
@end

@implementation SAUIPortalView

void __47___SAUIPortalView__configurePortalViewIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained sourceView];
  id v4 = [v3 layer];

  if (v4 == v2)
  {
    v5 = [WeakRetained portalLayer];
    [v5 setSourceLayer:v2];
  }
}

@end