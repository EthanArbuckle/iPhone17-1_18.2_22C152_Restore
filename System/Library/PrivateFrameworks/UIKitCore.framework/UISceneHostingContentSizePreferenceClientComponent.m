@interface UISceneHostingContentSizePreferenceClientComponent
@end

@implementation UISceneHostingContentSizePreferenceClientComponent

id __80___UISceneHostingContentSizePreferenceClientComponent__setPreferredContentSize___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setPreferredContentSize:", *(double *)(a1 + 32), *(double *)(a1 + 40));
  v2 = +[FBSSceneTransitionContext transitionContext];
  v3 = +[UIScene _synchronizedDrawingFence];
  [v2 setAnimationFence:v3];

  return v2;
}

@end