@interface SWContentRuleManager
- (OS_dispatch_group)dispatchGroup;
- (SWContentRuleManager)initWithUserContentController:(id)a3;
- (WKUserContentController)userContentController;
- (id)configureContentRules;
- (void)addContentRuleList:(id)a3 identifier:(id)a4;
- (void)removeContentListForIdentifier:(id)a3;
@end

@implementation SWContentRuleManager

- (SWContentRuleManager)initWithUserContentController:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SWContentRuleManager;
  v6 = [(SWContentRuleManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userContentController, a3);
    dispatch_group_t v8 = dispatch_group_create();
    dispatchGroup = v7->_dispatchGroup;
    v7->_dispatchGroup = (OS_dispatch_group *)v8;
  }
  return v7;
}

- (void)addContentRuleList:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_group_t v8 = [(SWContentRuleManager *)self dispatchGroup];
  dispatch_group_enter(v8);

  v9 = [MEMORY[0x263F1FA08] defaultStore];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__SWContentRuleManager_addContentRuleList_identifier___block_invoke;
  v10[3] = &unk_2646FFB18;
  v10[4] = self;
  [v9 compileContentRuleListForIdentifier:v6 encodedContentRuleList:v7 completionHandler:v10];
}

void __54__SWContentRuleManager_addContentRuleList_identifier___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v5 = [v3 userContentController];
    [v5 addContentRuleList:v4];
  }
  id v6 = [*(id *)(a1 + 32) dispatchGroup];
  dispatch_group_leave(v6);
}

- (void)removeContentListForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SWContentRuleManager *)self dispatchGroup];
  dispatch_group_enter(v5);

  id v6 = [MEMORY[0x263F1FA08] defaultStore];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__SWContentRuleManager_removeContentListForIdentifier___block_invoke;
  v7[3] = &unk_2646FFB18;
  v7[4] = self;
  [v6 lookUpContentRuleListForIdentifier:v4 completionHandler:v7];
}

void __55__SWContentRuleManager_removeContentListForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v5 = [v3 userContentController];
    [v5 removeContentRuleList:v4];
  }
  id v6 = [*(id *)(a1 + 32) dispatchGroup];
  dispatch_group_leave(v6);
}

- (id)configureContentRules
{
  id v3 = objc_alloc(MEMORY[0x263F59E70]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__SWContentRuleManager_configureContentRules__block_invoke;
  v6[3] = &unk_2646FFB40;
  v6[4] = self;
  id v4 = (void *)[v3 initWithResolver:v6];
  return v4;
}

void __45__SWContentRuleManager_configureContentRules__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) dispatchGroup];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SWContentRuleManager_configureContentRules__block_invoke_2;
  block[3] = &unk_2646FFAE8;
  id v7 = v3;
  id v5 = v3;
  dispatch_group_notify(v4, MEMORY[0x263EF83A0], block);
}

uint64_t __45__SWContentRuleManager_configureContentRules__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (WKUserContentController)userContentController
{
  return self->_userContentController;
}

- (OS_dispatch_group)dispatchGroup
{
  return self->_dispatchGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong((id *)&self->_userContentController, 0);
}

@end