@interface AutomationOverlayViewController
- (AutomationOverlayViewController)initWithDelegate:(id)a3;
- (BOOL)allowsUserInteraction;
- (void)_interceptUserInteraction;
- (void)_setAllowsUserInteraction:(BOOL)a3 completionHandler:(id)a4;
- (void)_toggleAllowsUserInteractionTemporarily:(BOOL)a3;
- (void)loadView;
@end

@implementation AutomationOverlayViewController

- (AutomationOverlayViewController)initWithDelegate:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AutomationOverlayViewController;
  v6 = [(AutomationOverlayViewController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    v7->_allowsUserInteraction = 0;
    v8 = v7;
  }

  return v7;
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)AutomationOverlayViewController;
  [(AutomationOverlayViewController *)&v6 loadView];
  v3 = [(AutomationOverlayViewController *)self view];
  if (SFDebugMenuEnabled())
  {
    v4 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.2];
    [v3 setBackgroundColor:v4];
  }
  id v5 = [v3 layer];
  [v5 setHitTestsAsOpaque:1];

  [v3 setAutoresizingMask:18];
}

- (BOOL)allowsUserInteraction
{
  return self->_allowsUserInteraction
      || (objc_opt_respondsToSelector() & 1) != 0
      && ([(AutomationOverlayViewControllerDelegate *)self->_delegate automationOverlayControllerShouldAllowUserInteraction:self] & 1) != 0;
}

- (void)_interceptUserInteraction
{
  v3 = [(AutomationOverlayViewController *)self presentedViewController];

  if (!v3 && ![(AutomationOverlayViewController *)self allowsUserInteraction])
  {
    v4 = (void *)MEMORY[0x1E4FB1418];
    id v5 = _WBSLocalizedString();
    objc_super v6 = _WBSLocalizedString();
    v7 = [v4 alertControllerWithTitle:v5 message:v6 preferredStyle:1];

    v8 = (void *)MEMORY[0x1E4FB1410];
    v9 = _WBSLocalizedString();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __60__AutomationOverlayViewController__interceptUserInteraction__block_invoke;
    v22[3] = &unk_1E6D7A560;
    v22[4] = self;
    objc_super v10 = [v8 actionWithTitle:v9 style:2 handler:v22];
    [v7 addAction:v10];

    v11 = (void *)MEMORY[0x1E4FB1410];
    v12 = _WBSLocalizedString();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __60__AutomationOverlayViewController__interceptUserInteraction__block_invoke_2;
    v21[3] = &unk_1E6D7A560;
    v21[4] = self;
    v13 = [v11 actionWithTitle:v12 style:0 handler:v21];
    [v7 addAction:v13];

    if (SFDebugMenuEnabled())
    {
      v14 = (void *)MEMORY[0x1E4FB1410];
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"Allow Interaction for %.f seconds", 0x4014000000000000);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __60__AutomationOverlayViewController__interceptUserInteraction__block_invoke_3;
      v20[3] = &unk_1E6D7A560;
      v20[4] = self;
      v16 = [v14 actionWithTitle:v15 style:0 handler:v20];
      [v7 addAction:v16];
    }
    v17 = (void *)MEMORY[0x1E4FB1410];
    v18 = _WBSLocalizedString();
    v19 = [v17 actionWithTitle:v18 style:1 handler:&__block_literal_global_12];
    [v7 addAction:v19];

    [(AutomationOverlayViewController *)self presentViewController:v7 animated:1 completion:0];
  }
}

uint64_t __60__AutomationOverlayViewController__interceptUserInteraction__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 976);
    return objc_msgSend(v3, "automationOverlayControllerDidDisableAutomation:");
  }
  return result;
}

uint64_t __60__AutomationOverlayViewController__interceptUserInteraction__block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 976);
    return objc_msgSend(v3, "automationOverlayControllerDidCancelAutomation:");
  }
  return result;
}

uint64_t __60__AutomationOverlayViewController__interceptUserInteraction__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _toggleAllowsUserInteractionTemporarily:1];
}

- (void)_toggleAllowsUserInteractionTemporarily:(BOOL)a3
{
  objc_initWeak(&location, self);
  BOOL allowsUserInteraction = self->_allowsUserInteraction;
  id resetTemporaryUserInteractionAllowedBlock = self->_resetTemporaryUserInteractionAllowedBlock;
  if (resetTemporaryUserInteractionAllowedBlock)
  {
    dispatch_block_cancel(resetTemporaryUserInteractionAllowedBlock);
    id v7 = self->_resetTemporaryUserInteractionAllowedBlock;
    self->_id resetTemporaryUserInteractionAllowedBlock = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__AutomationOverlayViewController__toggleAllowsUserInteractionTemporarily___block_invoke;
  v8[3] = &unk_1E6D7A5B0;
  BOOL v10 = a3;
  objc_copyWeak(&v9, &location);
  BOOL v11 = allowsUserInteraction;
  [(AutomationOverlayViewController *)self _setAllowsUserInteraction:!allowsUserInteraction completionHandler:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __75__AutomationOverlayViewController__toggleAllowsUserInteractionTemporarily___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    v2 = (id *)(a1 + 32);
    WeakRetained = (dispatch_block_t *)objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __75__AutomationOverlayViewController__toggleAllowsUserInteractionTemporarily___block_invoke_2;
      v7[3] = &unk_1E6D7A588;
      objc_copyWeak(&v8, v2);
      char v9 = *(unsigned char *)(a1 + 41);
      dispatch_block_t v4 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v7);
      dispatch_block_t v5 = WeakRetained[124];
      WeakRetained[124] = v4;

      dispatch_time_t v6 = dispatch_time(0, 5000000000);
      dispatch_after(v6, MEMORY[0x1E4F14428], WeakRetained[124]);
      objc_destroyWeak(&v8);
    }
  }
}

void __75__AutomationOverlayViewController__toggleAllowsUserInteractionTemporarily___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setAllowsUserInteraction:*(unsigned __int8 *)(a1 + 40) completionHandler:0];
}

- (void)_setAllowsUserInteraction:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4FB1EB0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__AutomationOverlayViewController__setAllowsUserInteraction_completionHandler___block_invoke;
  v12[3] = &unk_1E6D781E8;
  v12[4] = self;
  BOOL v13 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__AutomationOverlayViewController__setAllowsUserInteraction_completionHandler___block_invoke_2;
  v9[3] = &unk_1E6D7A5D8;
  BOOL v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 animateWithDuration:v12 animations:v9 completion:0.5];
}

void __79__AutomationOverlayViewController__setAllowsUserInteraction_completionHandler___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  else {
    double v1 = 1.0;
  }
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:v1];
}

uint64_t __79__AutomationOverlayViewController__setAllowsUserInteraction_completionHandler___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 984) = *(unsigned char *)(a1 + 48);
  if (objc_opt_respondsToSelector()) {
    [*(id *)(*(void *)(a1 + 32) + 976) automationOverlayController:*(void *)(a1 + 32) didChangeAllowsUserInteraction:*(unsigned __int8 *)(*(void *)(a1 + 32) + 984)];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resetTemporaryUserInteractionAllowedBlock, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end