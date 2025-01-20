@interface UIScenePresentationView
@end

@implementation UIScenePresentationView

void __62___UIScenePresentationView_scene_didPrepareUpdateWithContext___block_invoke(uint64_t a1, unsigned char *a2)
{
  *a2 = 1;
}

void __62___UIScenePresentationView_scene_didPrepareUpdateWithContext___block_invoke_2(uint64_t a1, unsigned char *a2)
{
  *a2 = 1;
}

void __62___UIScenePresentationView_scene_didPrepareUpdateWithContext___block_invoke_3(uint64_t a1, unsigned char *a2)
{
  *a2 = 1;
}

void __66___UIScenePresentationView_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 448))
  {
    v1 = *(void **)(a1 + 40);
    id v3 = [*(id *)(*(void *)(a1 + 32) + 448) hostedLayers];
    v2 = [v3 allObjects];
    [v1 appendArraySection:v2 withName:@"hostedLayers" skipIfEmpty:1];
  }
}

uint64_t __68___UIScenePresentationView__geometryDidUpdateWithTransitionContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFrameAndTransform];
}

@end