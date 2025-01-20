@interface UISceneHostingTraitCollectionPropagationClientComponent
@end

@implementation UISceneHostingTraitCollectionPropagationClientComponent

void __106___UISceneHostingTraitCollectionPropagationClientComponent_modifiedTraitCollectionForHostTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  int v2 = dyld_program_sdk_at_least();
  uint64_t v3 = -1;
  if (v2 && UIApp) {
    uint64_t v3 = objc_msgSend((id)UIApp, "userInterfaceLayoutDirection", -1);
  }
  [v6 setLayoutDirection:v3];
  uint64_t v4 = [(id)UIApp _effectiveUserInterfaceStyle];
  if (v4) {
    [v6 setUserInterfaceStyle:v4];
  }
  v5 = [v6 _tintColor];

  if (v5) {
    [v6 _setTintColor:0];
  }
}

@end