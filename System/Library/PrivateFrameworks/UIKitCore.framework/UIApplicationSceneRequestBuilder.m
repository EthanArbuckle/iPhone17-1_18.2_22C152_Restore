@interface UIApplicationSceneRequestBuilder
@end

@implementation UIApplicationSceneRequestBuilder

void __93___UIApplicationSceneRequestBuilder_buildWorkspaceRequestOptionsForRequest_withContinuation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  if (v8)
  {
    v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) actions];
    v7 = (void *)[v6 mutableCopy];

    [v7 addObject:v8];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setActions:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end