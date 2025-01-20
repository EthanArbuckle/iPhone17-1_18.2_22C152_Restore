@interface WFP2PSignedShortcutFileProvider
- (WFP2PSignedShortcutFileProvider)initWithWorkflow:(id)a3 userInterface:(id)a4;
- (id)shareShortcutEventForActivityType:(id)a3;
- (void)generateItemURL;
@end

@implementation WFP2PSignedShortcutFileProvider

- (void)generateItemURL
{
  dispatch_assert_queue_not_V2(MEMORY[0x263EF83A0]);
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v4 = [(WFWorkflowItemProvider *)self shortcutExporter];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__WFP2PSignedShortcutFileProvider_generateItemURL__block_invoke;
  v6[3] = &unk_2649CBF70;
  v6[4] = self;
  dispatch_semaphore_t v7 = v3;
  v5 = v3;
  [v4 exportWorkflowWithCompletion:v6];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

void __50__WFP2PSignedShortcutFileProvider_generateItemURL__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v5 = (void *)MEMORY[0x263F336E8];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __50__WFP2PSignedShortcutFileProvider_generateItemURL__block_invoke_2;
    v13 = &unk_2649CC018;
    v6 = *(void **)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = v6;
    dispatch_semaphore_t v7 = [v5 alertWithError:a3 confirmationHandler:&v10];
    v8 = objc_msgSend(*(id *)(a1 + 32), "userInterface", v10, v11, v12, v13, v14);
    [v8 presentAlert:v7];
  }
  else
  {
    [*(id *)(a1 + 32) setWorkflowURL:a2];
    v9 = *(NSObject **)(a1 + 40);
    dispatch_semaphore_signal(v9);
  }
}

intptr_t __50__WFP2PSignedShortcutFileProvider_generateItemURL__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__WFP2PSignedShortcutFileProvider_generateItemURL__block_invoke_3;
  block[3] = &unk_2649CBF20;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __50__WFP2PSignedShortcutFileProvider_generateItemURL__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (id)shareShortcutEventForActivityType:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFP2PSignedShortcutFileProvider;
  dispatch_semaphore_t v3 = [(WFWorkflowItemProvider *)&v5 shareShortcutEventForActivityType:a3];
  [v3 setSharingMode:*MEMORY[0x263F87420]];
  return v3;
}

- (WFP2PSignedShortcutFileProvider)initWithWorkflow:(id)a3 userInterface:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFP2PSignedShortcutFileProvider;
  dispatch_semaphore_t v7 = [(WFSignedShortcutFileProvider *)&v13 initWithWorkflow:v6 userInterface:a4];
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x263F86D58]);
    v9 = objc_opt_new();
    uint64_t v10 = (void *)[v8 initWithWorkflow:v6 sharingOptions:v9];
    [(WFWorkflowItemProvider *)v7 setShortcutExporter:v10];

    uint64_t v11 = v7;
  }

  return v7;
}

@end