@interface UISceneOpenURLBSActionsHandler
@end

@implementation UISceneOpenURLBSActionsHandler

void __106___UISceneOpenURLBSActionsHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (v6)
    {
      [v6 setObject:v10 forKey:v5];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v10 forKey:v5];
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
  }
}

@end