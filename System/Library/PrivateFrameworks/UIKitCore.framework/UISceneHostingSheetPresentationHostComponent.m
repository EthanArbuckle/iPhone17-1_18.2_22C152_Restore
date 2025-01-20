@interface UISceneHostingSheetPresentationHostComponent
@end

@implementation UISceneHostingSheetPresentationHostComponent

void __123___UISceneHostingSheetPresentationHostComponent_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setRemoteClientConfiguration:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) containerView];
  v2 = [v3 window];
  [v2 layoutIfNeeded];
}

void __72___UISceneHostingSheetPresentationHostComponent__setSheetConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  [a2 setSheetConfiguration:*(void *)(a1 + 32)];
  if (+[UIView areAnimationsEnabled])
  {
    v5 = +[UIView _currentAnimationSettings];
    [v10 setAnimationSettings:v5];
  }
  else
  {
    [v10 setAnimationSettings:0];
  }
  v6 = [*(id *)(a1 + 40) hostScene];
  v7 = [v6 settings];
  v8 = [v7 sheetConfiguration];

  if ([v8 _shouldFenceChangeToConfiguration:*(void *)(a1 + 32)])
  {
    v9 = +[UIScene _synchronizedDrawingFence];
    [v10 setAnimationFence:v9];
  }
}

@end