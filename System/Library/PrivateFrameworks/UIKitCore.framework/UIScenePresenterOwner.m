@interface UIScenePresenterOwner
@end

@implementation UIScenePresenterOwner

uint64_t __56___UIScenePresenterOwner_enumeratePresentersUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74___UIScenePresenterOwner__updateHostingStateForScenePresentersIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 identifier];
  v4 = [*(id *)(*(void *)(a1 + 32) + 48) identifier];
  char v5 = [v3 isEqual:v4];

  if ((v5 & 1) == 0) {
    [v6 updateHostingStateIfNecessary];
  }
}

uint64_t __56___UIScenePresenterOwner_enumeratePresentersUsingBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

uint64_t __45___UIScenePresenterOwner__activatePresenter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __36___UIScenePresenterOwner_invalidate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

uint64_t __36___UIScenePresenterOwner_invalidate__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

void __64___UIScenePresenterOwner_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"prioritizedPresenter"];
  v3 = *(void **)(a1 + 32);
  v4 = [*(id *)(*(void *)(a1 + 40) + 32) array];
  [v3 appendArraySection:v4 withName:@"activePresenters" skipIfEmpty:0];

  char v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(*(void *)(a1 + 40) + 40) allObjects];
  [v5 appendArraySection:v6 withName:@"inactivePresenters" skipIfEmpty:0];
}

@end