@interface TabLimitCleanupGroup
- (NSString)message;
- (TabLimitCleanupGroup)initWithAlertMesssage:(id)a3 actionTitle:(id)a4 tabs:(id)a5 browserController:(id)a6 resultHandler:(id)a7;
- (UIAlertAction)action;
@end

@implementation TabLimitCleanupGroup

- (TabLimitCleanupGroup)initWithAlertMesssage:(id)a3 actionTitle:(id)a4 tabs:(id)a5 browserController:(id)a6 resultHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([v14 count])
  {
    v28.receiver = self;
    v28.super_class = (Class)TabLimitCleanupGroup;
    v17 = [(TabLimitCleanupGroup *)&v28 init];
    if (v17)
    {
      v18 = (void *)MEMORY[0x1E4FB1410];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __95__TabLimitCleanupGroup_initWithAlertMesssage_actionTitle_tabs_browserController_resultHandler___block_invoke;
      v24[3] = &unk_1E6D7DE90;
      id v25 = v15;
      id v26 = v14;
      id v27 = v16;
      uint64_t v19 = [v18 actionWithTitle:v13 style:2 handler:v24];
      action = v17->_action;
      v17->_action = (UIAlertAction *)v19;

      uint64_t v21 = [v12 copy];
      message = v17->_message;
      v17->_message = (NSString *)v21;

      self = v17;
      v17 = self;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __95__TabLimitCleanupGroup_initWithAlertMesssage_actionTitle_tabs_browserController_resultHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tabController];
  char v3 = [*(id *)(a1 + 32) isSuspendedOrSuspending] ^ 1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __95__TabLimitCleanupGroup_initWithAlertMesssage_actionTitle_tabs_browserController_resultHandler___block_invoke_2;
  v5[3] = &unk_1E6D793C0;
  id v4 = v2;
  id v6 = v4;
  id v7 = *(id *)(a1 + 40);
  char v8 = v3;
  [v4 registerUndoWithType:2 actions:v5];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __95__TabLimitCleanupGroup_initWithAlertMesssage_actionTitle_tabs_browserController_resultHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeTabs:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

- (UIAlertAction)action
{
  return self->_action;
}

- (NSString)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end