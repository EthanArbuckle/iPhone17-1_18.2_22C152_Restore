@interface UISceneSessionDescriptionWithMultilinePrefix
@end

@implementation UISceneSessionDescriptionWithMultilinePrefix

void ___UISceneSessionDescriptionWithMultilinePrefix_block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 activeMultilinePrefix];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___UISceneSessionDescriptionWithMultilinePrefix_block_invoke_2;
  v4[3] = &unk_1E52D9F98;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v4];
}

void ___UISceneSessionDescriptionWithMultilinePrefix_block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) configuration];
  v2 = [v4 succinctDescription];
  id v3 = (id)[v1 appendObject:v2 withName:@"configuration"];
}

@end