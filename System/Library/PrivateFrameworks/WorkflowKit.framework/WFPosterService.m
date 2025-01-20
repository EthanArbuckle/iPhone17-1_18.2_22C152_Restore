@interface WFPosterService
- (void)fetchEligiblePostersWithCompletionHandler:(id)a3;
- (void)findPosterMatchingRepresentation:(id)a3 completionHandler:(id)a4;
- (void)getPostersWithCompletionHandler:(id)a3;
@end

@implementation WFPosterService

- (void)findPosterMatchingRepresentation:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__WFPosterService_findPosterMatchingRepresentation_completionHandler___block_invoke;
  v10[3] = &unk_1E6558040;
  id v11 = v6;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  [(WFPosterService *)self getPostersWithCompletionHandler:v10];
}

void __70__WFPosterService_findPosterMatchingRepresentation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__WFPosterService_findPosterMatchingRepresentation_completionHandler___block_invoke_2;
    v8[3] = &unk_1E6550438;
    id v9 = *(id *)(a1 + 32);
    id v7 = objc_msgSend(v5, "if_firstObjectPassingTest:", v8);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __70__WFPosterService_findPosterMatchingRepresentation_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 UUID];
  id v5 = [v3 UUID];

  uint64_t v6 = [v4 isEqual:v5];
  return v6;
}

- (void)getPostersWithCompletionHandler:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v4 = (void *)getPRSServiceClass_softClass;
  uint64_t v14 = getPRSServiceClass_softClass;
  if (!getPRSServiceClass_softClass)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getPRSServiceClass_block_invoke;
    v10[3] = &unk_1E6558B78;
    void v10[4] = &v11;
    __getPRSServiceClass_block_invoke((uint64_t)v10);
    v4 = (void *)v12[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v11, 8);
  id v6 = objc_alloc_init(v5);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__WFPosterService_getPostersWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E65586C8;
  id v9 = v3;
  id v7 = v3;
  [v6 fetchPosterConfigurations:v8];
}

void __51__WFPosterService_getPostersWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = objc_opt_new();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__WFPosterService_getPostersWithCompletionHandler___block_invoke_2;
    v6[3] = &unk_1E6550410;
    id v7 = v4;
    id v5 = v4;
    [v3 enumerateObjectsUsingBlock:v6];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __51__WFPosterService_getPostersWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = NSString;
  id v6 = a2;
  id v7 = WFLocalizedString(@"Wallpaper %ld");
  objc_msgSend(v5, "localizedStringWithFormat:", v7, a3 + 1);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = [WFPosterRepresentation alloc];
  id v9 = [v6 serverUUID];
  v10 = [v6 providerBundleIdentifier];

  uint64_t v11 = [(WFPosterRepresentation *)v8 initWithUUID:v9 name:v12 providerBundleIdentifier:v10];
  [*(id *)(a1 + 32) addObject:v11];
}

- (void)fetchEligiblePostersWithCompletionHandler:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v4 = (void *)getPRSExternalSystemServiceClass_softClass;
  uint64_t v11 = getPRSExternalSystemServiceClass_softClass;
  if (!getPRSExternalSystemServiceClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getPRSExternalSystemServiceClass_block_invoke;
    v7[3] = &unk_1E6558B78;
    v7[4] = &v8;
    __getPRSExternalSystemServiceClass_block_invoke((uint64_t)v7);
    v4 = (void *)v9[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);
  id v6 = objc_alloc_init(v5);
  [v6 fetchEligibleConfigurationsWithCompletion:v3];
}

@end