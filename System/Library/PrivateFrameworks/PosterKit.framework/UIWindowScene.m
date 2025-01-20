@interface UIWindowScene
@end

@implementation UIWindowScene

void __62__UIWindowScene_PRScene__pr_updatePreferences_withTransition___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  [a1[4] applyToClientSettings:a2];
  v5 = [a1[5] animationSettings];
  [v8 setAnimationSettings:v5];

  v6 = [a1[5] animationSettings];

  if (v6)
  {
    [a1[6] _synchronizeDrawing];
    v7 = [a1[6] _synchronizedDrawingFence];
    [v8 setAnimationFence:v7];
  }
  objc_msgSend(v8, "pr_setUpdateSnapshot:", objc_msgSend(a1[5], "contentSignificantlyChanged"));
}

@end