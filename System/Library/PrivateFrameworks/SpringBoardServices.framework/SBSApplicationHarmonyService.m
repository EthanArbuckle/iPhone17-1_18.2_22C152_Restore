@interface SBSApplicationHarmonyService
- (void)fetchWhitePointAdaptivityStyleForDisplayId:(unsigned int)a3 withCompletionHandler:(id)a4;
@end

@implementation SBSApplicationHarmonyService

- (void)fetchWhitePointAdaptivityStyleForDisplayId:(unsigned int)a3 withCompletionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (v6)
  {
    v7 = [(SBSAbstractFacilityService *)self callbackQueue];
    v8 = [(SBSAbstractApplicationService *)self client];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __97__SBSApplicationHarmonyService_fetchWhitePointAdaptivityStyleForDisplayId_withCompletionHandler___block_invoke;
    v10[3] = &unk_1E566BBA8;
    id v11 = v7;
    id v12 = v6;
    id v9 = v7;
    [v8 fetchWhitePointAdaptivityStyleForDisplayId:v4 withCompletionHandler:v10];
  }
}

void __97__SBSApplicationHarmonyService_fetchWhitePointAdaptivityStyleForDisplayId_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __97__SBSApplicationHarmonyService_fetchWhitePointAdaptivityStyleForDisplayId_withCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E566BB80;
  v3 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = a2;
  dispatch_async(v3, v4);
}

uint64_t __97__SBSApplicationHarmonyService_fetchWhitePointAdaptivityStyleForDisplayId_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

@end