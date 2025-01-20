@interface UISceneHostingContentSizePreferenceHostComponent
@end

@implementation UISceneHostingContentSizePreferenceHostComponent

void __127___UISceneHostingContentSizePreferenceHostComponent_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) preferredContentSize];
  double v3 = v2;
  double v5 = v4;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "setPreferredContentSize:", v3, v5);
}

@end