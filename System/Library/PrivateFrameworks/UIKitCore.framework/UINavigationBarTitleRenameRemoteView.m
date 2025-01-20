@interface UINavigationBarTitleRenameRemoteView
@end

@implementation UINavigationBarTitleRenameRemoteView

void __54___UINavigationBarTitleRenameRemoteView_updateMetrics__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained portalView];
    if (v10 && v5)
    {
      [v10 bounds];
      objc_msgSend(v5, "setFrame:");
      uint64_t v6 = [v10 sourceContextId];
      v7 = [v5 portalLayer];
      [v7 setSourceContextId:v6];

      uint64_t v8 = [v10 sourceLayerRenderId];
      v9 = [v5 portalLayer];
      [v9 setSourceLayerRenderId:v8];

      [v10 intrinsicContentSize];
      objc_msgSend(v4, "setIntrinsicContentSize:");
      [v10 horizontalTextInset];
      objc_msgSend(v4, "setHorizontalTextInset:");
    }
    else
    {
      [v4 _disconnect];
    }
  }
}

@end