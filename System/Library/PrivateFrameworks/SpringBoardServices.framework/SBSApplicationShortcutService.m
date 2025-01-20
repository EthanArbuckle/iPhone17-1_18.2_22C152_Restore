@interface SBSApplicationShortcutService
- (id)applicationShortcutItemsOfTypes:(unint64_t)a3 forBundleIdentifier:(id)a4;
- (void)fetchApplicationShortcutItemsOfTypes:(unint64_t)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)fetchDynamicApplicationShortcutItemsForBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)fetchDynamicApplicationShortcutItemsWithCompletionHandler:(id)a3;
- (void)updateDynamicApplicationShortcutItems:(id)a3;
- (void)updateDynamicApplicationShortcutItems:(id)a3 forBundleIdentifier:(id)a4;
@end

@implementation SBSApplicationShortcutService

- (void)updateDynamicApplicationShortcutItems:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBSAbstractApplicationService *)self client];
  [v8 updateDynamicApplicationShortcutItems:v7 bundleIdentifier:v6];
}

- (id)applicationShortcutItemsOfTypes:(unint64_t)a3 forBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(SBSAbstractApplicationService *)self client];
  id v8 = [v7 applicationShortcutItemsOfTypes:a3 forBundleIdentifier:v6];

  return v8;
}

- (void)fetchApplicationShortcutItemsOfTypes:(unint64_t)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    id v9 = a4;
    v10 = [(SBSAbstractFacilityService *)self callbackQueue];
    v11 = [(SBSAbstractApplicationService *)self client];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __112__SBSApplicationShortcutService_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletionHandler___block_invoke;
    v13[3] = &unk_1E566CC80;
    id v14 = v10;
    id v15 = v8;
    id v12 = v10;
    [v11 fetchApplicationShortcutItemsOfTypes:a3 forBundleIdentifier:v9 withCompletionHandler:v13];
  }
}

void __112__SBSApplicationShortcutService_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __112__SBSApplicationShortcutService_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E566B4B0;
  v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __112__SBSApplicationShortcutService_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)fetchDynamicApplicationShortcutItemsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __91__SBSApplicationShortcutService_fetchDynamicApplicationShortcutItemsWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E566CCA8;
  id v7 = v4;
  id v5 = v4;
  [(SBSApplicationShortcutService *)self fetchApplicationShortcutItemsOfTypes:2 forBundleIdentifier:0 withCompletionHandler:v6];
}

void __91__SBSApplicationShortcutService_fetchDynamicApplicationShortcutItemsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 dynamicApplicationShortcutItems];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)updateDynamicApplicationShortcutItems:(id)a3
{
}

- (void)fetchDynamicApplicationShortcutItemsForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __107__SBSApplicationShortcutService_fetchDynamicApplicationShortcutItemsForBundleIdentifier_completionHandler___block_invoke;
  v8[3] = &unk_1E566CCA8;
  id v9 = v6;
  id v7 = v6;
  [(SBSApplicationShortcutService *)self fetchApplicationShortcutItemsOfTypes:2 forBundleIdentifier:a3 withCompletionHandler:v8];
}

void __107__SBSApplicationShortcutService_fetchDynamicApplicationShortcutItemsForBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 dynamicApplicationShortcutItems];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

@end