@interface UIChildRemoteContentRegistry
@end

@implementation UIChildRemoteContentRegistry

uint64_t __57___UIChildRemoteContentRegistry_scene_didUpdateSettings___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __71___UIChildRemoteContentRegistry_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71___UIChildRemoteContentRegistry_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 appendBodySectionWithName:@"children" multilinePrefix:v3 block:v6];
}

void __71___UIChildRemoteContentRegistry_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(*(void *)(a1 + 40) + 16) allObjects];
  id v4 = [*(id *)(a1 + 32) activeMultilinePrefix];
  [v2 appendArraySection:v3 withName:@"childScenes" multilinePrefix:v4 skipIfEmpty:1 objectTransformer:&__block_literal_global_32_4];

  uint64_t v5 = *(void **)(a1 + 32);
  id v7 = [*(id *)(*(void *)(a1 + 40) + 24) allObjects];
  v6 = [*(id *)(a1 + 32) activeMultilinePrefix];
  [v5 appendArraySection:v7 withName:@"childViewServices" multilinePrefix:v6 skipIfEmpty:1];
}

uint64_t __71___UIChildRemoteContentRegistry_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 succinctDescription];
}

@end