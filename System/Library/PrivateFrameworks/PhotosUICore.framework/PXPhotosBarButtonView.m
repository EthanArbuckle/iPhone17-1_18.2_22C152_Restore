@interface PXPhotosBarButtonView
@end

@implementation PXPhotosBarButtonView

uint64_t __57___PXPhotosBarButtonView__resumeChangeDeliveryIfPossible__block_invoke(uint64_t a1, void *a2)
{
  return [a2 resumeChangeDeliveryAndBackgroundLoading:*(void *)(a1 + 32)];
}

void __46___PXPhotosBarButtonView__pauseChangeDelivery__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 pauseChangeDeliveryWithTimeout:@"PauseChangeDeliveryForContextMenu" identifier:10.0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __52___PXPhotosBarButtonView__createButtonConfiguration__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleAction];
}

void __52___PXPhotosBarButtonView__createButtonConfiguration__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleMenuAction];
}

void __52___PXPhotosBarButtonView__createButtonConfiguration__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleWillDisplayMenu];
}

void __52___PXPhotosBarButtonView__createButtonConfiguration__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleWillDismissMenu];
}

Class __40___PXPhotosBarButtonView_layoutSubviews__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Uitamicadaptor.isa);
  layoutSubviews_adaptorClass = (uint64_t)result;
  if (!result) {
    PXAssertGetLog();
  }
  return result;
}

@end