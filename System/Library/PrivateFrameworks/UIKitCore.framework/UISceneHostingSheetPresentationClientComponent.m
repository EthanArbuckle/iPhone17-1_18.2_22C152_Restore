@interface UISceneHostingSheetPresentationClientComponent
@end

@implementation UISceneHostingSheetPresentationClientComponent

uint64_t __125___UISceneHostingSheetPresentationClientComponent_applySheetConfigurationToLocalPresentationControllerWithTransitionContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void __108___UISceneHostingSheetPresentationClientComponent__sheetPresentationControllerClientConfigurationDidChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  [a2 setSheetClientConfiguration:v4];
  id v6 = +[UIView _currentAnimationSettings];
  [v5 setAnimationSettings:v6];
}

@end