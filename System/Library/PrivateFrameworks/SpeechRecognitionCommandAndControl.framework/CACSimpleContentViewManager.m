@interface CACSimpleContentViewManager
- (BOOL)isOutOfProcess;
- (BOOL)isOverlay;
- (BOOL)isPhysiciallyInteractiveOverlay;
- (BOOL)isShowing;
- (CACSimpleContentViewManagerDelegate)contentViewManagerDelegate;
- (CACViewController)viewController;
- (int64_t)activeDimmingTransactionID;
- (int64_t)pendingDimmingTransactionID;
- (void)_hideAnimated:(BOOL)a3;
- (void)hide;
- (void)hideAnimated:(BOOL)a3 completion:(id)a4;
- (void)hideWithoutAnimation;
- (void)setActiveDimmingTransactionID:(int64_t)a3;
- (void)setContentViewManagerDelegate:(id)a3;
- (void)setPendingDimmingTransactionID:(int64_t)a3;
- (void)setViewController:(id)a3;
- (void)showViewControllerWithCreationHandler:(id)a3 updateHandler:(id)a4;
@end

@implementation CACSimpleContentViewManager

- (void)showViewControllerWithCreationHandler:(id)a3 updateHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__CACSimpleContentViewManager_showViewControllerWithCreationHandler_updateHandler___block_invoke;
  block[3] = &unk_264D11B50;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __83__CACSimpleContentViewManager_showViewControllerWithCreationHandler_updateHandler___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = [*(id *)(a1 + 32) viewController];

  if (!v3)
  {
    v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) setViewController:v4];
  }
  id v6 = [*(id *)(a1 + 32) viewController];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  objc_sync_exit(v2);

  if (!v3)
  {
    v5 = [*(id *)(a1 + 32) contentViewManagerDelegate];
    [v5 contentViewManager:*(void *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
  }
  if ([*(id *)(a1 + 32) isOverlay]) {
    [*(id *)(a1 + 32) startDelayedDimmingOfNumbers];
  }
}

- (void)_hideAnimated:(BOOL)a3
{
}

- (void)hideAnimated:(BOOL)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  if ([(CACSimpleContentViewManager *)self isOverlay])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__CACSimpleContentViewManager_hideAnimated_completion___block_invoke;
    block[3] = &unk_264D115D0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  id v7 = self;
  objc_sync_enter(v7);
  viewController = v7->_viewController;
  if (viewController)
  {
    id v9 = viewController;
    v10 = v7->_viewController;
    v7->_viewController = 0;

    objc_sync_exit(v7);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __55__CACSimpleContentViewManager_hideAnimated_completion___block_invoke_2;
    v11[3] = &unk_264D11B78;
    v11[4] = v7;
    id v12 = v9;
    BOOL v14 = a3;
    v13 = v6;
    dispatch_async(MEMORY[0x263EF83A0], v11);
  }
  else
  {
    objc_sync_exit(v7);

    if (v6) {
      v6[2](v6);
    }
  }
}

uint64_t __55__CACSimpleContentViewManager_hideAnimated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopDelayedDimmingOfNumbers];
}

void __55__CACSimpleContentViewManager_hideAnimated_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contentViewManagerDelegate];
  [v2 contentViewManager:*(void *)(a1 + 32) dismissViewController:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (BOOL)isShowing
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_viewController != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)hide
{
}

- (void)hideWithoutAnimation
{
}

- (BOOL)isOutOfProcess
{
  return 0;
}

- (BOOL)isPhysiciallyInteractiveOverlay
{
  return 0;
}

- (CACSimpleContentViewManagerDelegate)contentViewManagerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentViewManagerDelegate);
  return (CACSimpleContentViewManagerDelegate *)WeakRetained;
}

- (void)setContentViewManagerDelegate:(id)a3
{
}

- (CACViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (int64_t)pendingDimmingTransactionID
{
  return self->_pendingDimmingTransactionID;
}

- (void)setPendingDimmingTransactionID:(int64_t)a3
{
  self->_pendingDimmingTransactionID = a3;
}

- (int64_t)activeDimmingTransactionID
{
  return self->_activeDimmingTransactionID;
}

- (void)setActiveDimmingTransactionID:(int64_t)a3
{
  self->_activeDimmingTransactionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_destroyWeak((id *)&self->_contentViewManagerDelegate);
}

- (BOOL)isOverlay
{
  return 0;
}

@end