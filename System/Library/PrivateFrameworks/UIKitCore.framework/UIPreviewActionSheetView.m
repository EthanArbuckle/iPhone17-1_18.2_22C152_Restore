@interface UIPreviewActionSheetView
@end

@implementation UIPreviewActionSheetView

void __48___UIPreviewActionSheetView__setupViewHierarchy__block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _performActionForPreviewAction:*(void *)(a1 + 32) interfaceAction:v4];
}

@end