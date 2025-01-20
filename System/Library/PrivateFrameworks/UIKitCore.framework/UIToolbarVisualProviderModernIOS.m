@interface UIToolbarVisualProviderModernIOS
@end

@implementation UIToolbarVisualProviderModernIOS

BOOL __44___UIToolbarVisualProviderModernIOS_prepare__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!+[_UIBarBackgroundLayoutPrototyping prototypingEnabled])
    {
      v2 = (void *)WeakRetained[5];
      WeakRetained[5] = 0;
    }
    [WeakRetained updateBarBackground];
  }

  return WeakRetained != 0;
}

void __81___UIToolbarVisualProviderModernIOS_traitCollectionForChild_baseTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(v3, "setUserInterfaceStyle:");
    id v3 = v4;
  }
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(v4, "setPreferredContentSizeCategory:");
    id v3 = v4;
  }
}

@end