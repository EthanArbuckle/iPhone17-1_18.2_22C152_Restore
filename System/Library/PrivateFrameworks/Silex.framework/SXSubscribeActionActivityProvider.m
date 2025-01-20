@interface SXSubscribeActionActivityProvider
- (SXActionManager)actionManager;
- (SXSubscribeActionActivityProvider)initWithHandler:(id)a3 viewControllerPresenting:(id)a4 actionManager:(id)a5;
- (SXSubscribeActionHandler)handler;
- (SXViewControllerPresenting)viewControllerPresenting;
- (id)activityGroupForAction:(id)a3;
@end

@implementation SXSubscribeActionActivityProvider

- (SXSubscribeActionActivityProvider)initWithHandler:(id)a3 viewControllerPresenting:(id)a4 actionManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXSubscribeActionActivityProvider;
  v12 = [(SXSubscribeActionActivityProvider *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_handler, a3);
    objc_storeStrong((id *)&v13->_viewControllerPresenting, a4);
    objc_storeWeak((id *)&v13->_actionManager, v11);
  }

  return v13;
}

- (id)activityGroupForAction:(id)a3
{
  v4 = [[SXActionActivityGroup alloc] initWithTitle:0];
  v5 = [SXBlockActionActivity alloc];
  v6 = SXBundle();
  v7 = [v6 localizedStringForKey:@"Subscribe" value:&stru_26D5311C0 table:0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__SXSubscribeActionActivityProvider_activityGroupForAction___block_invoke;
  v10[3] = &unk_264651B28;
  v10[4] = self;
  v8 = [(SXBlockActionActivity *)v5 initWithLabel:v7 type:0 block:v10];
  [(SXActionActivityGroup *)v4 addActivity:v8];

  return v4;
}

void __60__SXSubscribeActionActivityProvider_activityGroupForAction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 inAppPurchaseIdKey];

  v5 = [*(id *)(a1 + 32) handler];
  v6 = [*(id *)(a1 + 32) viewControllerPresenting];
  if (v4)
  {
    v7 = [v3 inAppPurchaseIdKey];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __60__SXSubscribeActionActivityProvider_activityGroupForAction___block_invoke_2;
    v15[3] = &unk_2646530C8;
    v8 = (id *)v16;
    id v9 = v3;
    uint64_t v10 = *(void *)(a1 + 32);
    v16[0] = v9;
    v16[1] = v10;
    [v5 handleSubscribeActionOnPresenter:v6 inAppPurchaseIdKey:v7 completionBlock:v15];
  }
  else
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __60__SXSubscribeActionActivityProvider_activityGroupForAction___block_invoke_3;
    v13[3] = &unk_2646530C8;
    v8 = (id *)v14;
    id v11 = v3;
    uint64_t v12 = *(void *)(a1 + 32);
    v14[0] = v11;
    v14[1] = v12;
    [v5 handleSubscribeActionOnPresenter:v6 completionBlock:v13];
  }
}

uint64_t __60__SXSubscribeActionActivityProvider_activityGroupForAction___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) postPurchaseAction];
  v5 = (void *)v4;
  uint64_t v6 = 1;
  if (a2 && v4)
  {
    v7 = [*(id *)(a1 + 40) actionManager];
    [v7 performAction:v5 postActionHandlers:MEMORY[0x263EFFA68]];

    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __60__SXSubscribeActionActivityProvider_activityGroupForAction___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) postPurchaseAction];
  v5 = (void *)v4;
  uint64_t v6 = 1;
  if (a2 && v4)
  {
    v7 = [*(id *)(a1 + 40) actionManager];
    [v7 performAction:v5 postActionHandlers:MEMORY[0x263EFFA68]];

    uint64_t v6 = 0;
  }

  return v6;
}

- (SXSubscribeActionHandler)handler
{
  return self->_handler;
}

- (SXViewControllerPresenting)viewControllerPresenting
{
  return self->_viewControllerPresenting;
}

- (SXActionManager)actionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionManager);
  return (SXActionManager *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionManager);
  objc_storeStrong((id *)&self->_viewControllerPresenting, 0);
  objc_storeStrong((id *)&self->_handler, 0);
}

@end