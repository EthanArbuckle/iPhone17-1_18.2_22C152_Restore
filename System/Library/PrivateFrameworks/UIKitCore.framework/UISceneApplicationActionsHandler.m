@interface UISceneApplicationActionsHandler
@end

@implementation UISceneApplicationActionsHandler

uint64_t __99___UISceneApplicationActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke(void *a1)
{
  return [(id)UIApp _handleNonLaunchSpecificActions:a1[4] forScene:a1[5] withTransitionContext:a1[6] completion:0];
}

@end