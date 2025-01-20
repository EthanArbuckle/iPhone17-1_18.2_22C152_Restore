@interface UIWindowSceneOrderedPlacement
@end

@implementation UIWindowSceneOrderedPlacement

void __72___UIWindowSceneOrderedPlacement_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) config];
  v4 = [v3 relativeScenePersistenceIdentifier];
  [v2 appendString:v4 withName:@"relativeScenePersistenceIdentifier"];

  v5 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) config];
  id v6 = (id)objc_msgSend(v5, "appendInt:withName:", objc_msgSend(v7, "order"), @"order");
}

@end