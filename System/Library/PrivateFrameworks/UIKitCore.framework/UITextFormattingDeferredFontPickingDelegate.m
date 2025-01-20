@interface UITextFormattingDeferredFontPickingDelegate
@end

@implementation UITextFormattingDeferredFontPickingDelegate

void __84___UITextFormattingDeferredFontPickingDelegate_fontPickerViewControllerDidPickFont___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained dismissViewControllerAnimated:1 completion:0];
    id WeakRetained = v2;
  }
}

@end