@interface SFSiteIconView
@end

@implementation SFSiteIconView

void __60___SFSiteIconView__updateSiteIconViewWithTouchIconResponse___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 512));
  [WeakRetained siteIconViewDidUpdate:*(void *)(a1 + 32)];
}

void __37___SFSiteIconView_updateBookmarkData__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = [*(id *)(a1 + 32) url];
    v5 = [v4 host];

    if (WeakRetained[61] == *(void *)(a1 + 40))
    {
      if (!v5
        || ([v9 url],
            v6 = objc_claimAutoreleasedReturnValue(),
            [v6 host],
            v7 = objc_claimAutoreleasedReturnValue(),
            int v8 = [v5 isEqualToString:v7],
            v7,
            v6,
            v8))
      {
        [WeakRetained _updateSiteIconViewWithTouchIconResponse:v9];
      }
    }
  }
}

void __85___SFSiteIconView_updateSiteIconViewWithLinkMetadata_requiredImageSize_fallbackIcon___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 512));
  [WeakRetained siteIconViewDidUpdate:*(void *)(a1 + 32)];
}

@end