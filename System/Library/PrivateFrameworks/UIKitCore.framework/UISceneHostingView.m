@interface UISceneHostingView
@end

@implementation UISceneHostingView

void __41___UISceneHostingView_setPresentedScene___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setClippingDisabled:1];
  [v2 setPresentedLayerTypes:26];
  [v2 setAppearanceStyle:2];
}

@end