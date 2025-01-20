@interface PUAssetActionPerformer
- (BOOL)_requiresUnlockedDevice;
- (BOOL)dismissViewController:(id)a3 completionHandler:(id)a4;
- (BOOL)presentViewController:(id)a3;
- (NSArray)assets;
- (NSDictionary)assetsByAssetCollection;
- (NSUndoManager)undoManager;
- (OS_os_log)actionPerformerLog;
- (PUAssetActionPerformer)init;
- (PUAssetActionPerformer)initWithActionType:(unint64_t)a3 assets:(id)a4 orAssetsByAssetCollection:(id)a5;
- (PUAssetActionPerformerDelegate)delegate;
- (UIViewController)presentedViewController;
- (unint64_t)_unlockActionTypeForAssetActionType:(unint64_t)a3;
- (unint64_t)actionType;
- (unint64_t)state;
- (void)_completeStateWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_completeUnlockTaskWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_handleStepFinished:(unint64_t)a3 withSuccess:(BOOL)a4 error:(id)a5;
- (void)_performUnlockIfNeeded;
- (void)_transitionToState:(unint64_t)a3 withSuccess:(BOOL)a4 error:(id)a5;
- (void)completeBackgroundTaskWithSuccess:(BOOL)a3 error:(id)a4;
- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
- (void)performWithCompletionHandler:(id)a3;
- (void)setActionPerformerLog:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PUAssetActionPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsByAssetCollection, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_destroyWeak((id *)&self->_actionPerformerLog);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (NSDictionary)assetsByAssetCollection
{
  return self->_assetsByAssetCollection;
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setActionPerformerLog:(id)a3
{
}

- (OS_os_log)actionPerformerLog
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionPerformerLog);
  return (OS_os_log *)WeakRetained;
}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (void)setDelegate:(id)a3
{
}

- (PUAssetActionPerformerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUAssetActionPerformerDelegate *)WeakRetained;
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (void)_completeStateWithSuccess:(BOOL)a3 error:(id)a4
{
  (*((void (**)(void))self->_completionHandler + 2))();
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  presentedViewController = self->_presentedViewController;
  self->_presentedViewController = 0;
}

- (void)_transitionToState:(unint64_t)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v14 = a5;
  if (self->_state >= a3)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUAssetActionManager.m", 740, @"Tried transitioning from %lu to the same or earlier step %lu", self->_state, a3);
  }
  self->_state = a3;
  v9 = [(PUAssetActionPerformer *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(PUAssetActionPerformer *)self delegate];
    [v11 assetActionPerformer:self didChangeState:a3];
  }
  if ((uint64_t)a3 > 19)
  {
    if (a3 == 20)
    {
      [(PUAssetActionPerformer *)self performBackgroundTask];
      goto LABEL_15;
    }
    if (a3 == 30)
    {
      [(PUAssetActionPerformer *)self _completeStateWithSuccess:v5 error:v14];
      goto LABEL_15;
    }
  }
  else
  {
    if (a3 == 5)
    {
      [(PUAssetActionPerformer *)self _performUnlockIfNeeded];
      goto LABEL_15;
    }
    if (a3 == 10)
    {
      [(PUAssetActionPerformer *)self performUserInteractionTask];
      goto LABEL_15;
    }
  }
  v12 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUAssetActionManager.m", 767, @"Not allowed to transition to state:%ld", a3);

LABEL_15:
}

- (void)_handleStepFinished:(unint64_t)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v13 = a5;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PUAssetActionManager.m", 707, @"Invalid parameter not satisfying: %@", @"[NSThread isMainThread]" object file lineNumber description];
  }
  if ([(PUAssetActionPerformer *)self state] == a3)
  {
    if (!v5) {
      goto LABEL_12;
    }
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PUAssetActionManager.m", 708, @"Invalid parameter not satisfying: %@", @"fromState == [self state]" object file lineNumber description];

    if (!v5) {
      goto LABEL_12;
    }
  }
  if ((uint64_t)a3 > 9)
  {
    if (a3 == 10)
    {
      uint64_t v9 = 20;
      goto LABEL_13;
    }
    if (a3 != 20)
    {
LABEL_11:
      char v10 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUAssetActionManager.m", 731, @"Not allowed to transition from state:%ld", a3);
    }
LABEL_12:
    uint64_t v9 = 30;
    goto LABEL_13;
  }
  if (a3)
  {
    if (a3 == 5)
    {
      uint64_t v9 = 10;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  uint64_t v9 = 5;
LABEL_13:
  [(PUAssetActionPerformer *)self _transitionToState:v9 withSuccess:v5 error:v13];
}

- (void)completeBackgroundTaskWithSuccess:(BOOL)a3 error:(id)a4
{
}

- (void)performBackgroundTask
{
  uint64_t v4 = [(id)objc_opt_class() methodForSelector:a2];
  if (v4 == [(id)objc_opt_class() methodForSelector:a2])
  {
    [(PUAssetActionPerformer *)self completeBackgroundTaskWithSuccess:1 error:0];
  }
}

- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4
{
}

- (BOOL)dismissViewController:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(PUAssetActionPerformer *)self state] != 10)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PUAssetActionManager.m", 677, @"Invalid parameter not satisfying: %@", @"[self state] == PUAssetActionPerformerStateUserInteraction" object file lineNumber description];
  }
  uint64_t v9 = [(PUAssetActionPerformer *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(PUAssetActionPerformer *)self delegate];
    char v12 = [v11 assetActionPerformer:self dismissViewController:v7 completionHandler:v8];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)presentViewController:(id)a3
{
  id v6 = a3;
  if ([(PUAssetActionPerformer *)self state] != 10)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PUAssetActionManager.m", 664, @"Invalid parameter not satisfying: %@", @"[self state] == PUAssetActionPerformerStateUserInteraction" object file lineNumber description];
  }
  id v7 = [(PUAssetActionPerformer *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0
    && ([(PUAssetActionPerformer *)self delegate],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 assetActionPerformer:self presentViewController:v6],
        v9,
        v10))
  {
    objc_storeStrong((id *)&self->_presentedViewController, a3);
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)performUserInteractionTask
{
  uint64_t v4 = [(id)objc_opt_class() methodForSelector:a2];
  if (v4 == [(id)objc_opt_class() methodForSelector:a2])
  {
    [(PUAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
}

- (unint64_t)_unlockActionTypeForAssetActionType:(unint64_t)a3
{
  unint64_t v3 = 4;
  uint64_t v4 = 2;
  if (a3 != 63) {
    uint64_t v4 = 0;
  }
  if (a3 != 40) {
    unint64_t v3 = v4;
  }
  unint64_t v5 = 1;
  uint64_t v6 = 3;
  if (a3 != 32) {
    uint64_t v6 = 0;
  }
  if (a3 != 15) {
    unint64_t v5 = v6;
  }
  if ((uint64_t)a3 <= 39) {
    return v5;
  }
  else {
    return v3;
  }
}

- (void)_completeUnlockTaskWithSuccess:(BOOL)a3 error:(id)a4
{
}

- (void)_performUnlockIfNeeded
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__PUAssetActionPerformer__performUnlockIfNeeded__block_invoke;
  aBlock[3] = &unk_1E5F2CEE8;
  aBlock[4] = self;
  unint64_t v3 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if ([(PUAssetActionPerformer *)self _requiresUnlockedDevice])
  {
    uint64_t v4 = +[PUAssetActionManager _unlockDeviceHandlerWithActionType];
    if (v4) {
      ((void (**)(void, void (**)(void *, uint64_t), unint64_t))v4)[2](v4, v3, [(PUAssetActionPerformer *)self _unlockActionTypeForAssetActionType:[(PUAssetActionPerformer *)self actionType]]);
    }
    else {
      v3[2](v3, 1);
    }
  }
  else
  {
    v3[2](v3, 1);
  }
}

uint64_t __48__PUAssetActionPerformer__performUnlockIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _completeUnlockTaskWithSuccess:a2 error:0];
}

- (BOOL)_requiresUnlockedDevice
{
  unint64_t v2 = [(PUAssetActionPerformer *)self actionType];
  return (v2 > 0x3C) | (0x3C400F3FFFF8000uLL >> v2) & 1;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PUAssetActionManager.m", 436, @"Invalid parameter not satisfying: %@", @"[NSThread isMainThread]" object file lineNumber description];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__PUAssetActionPerformer_performWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E5F2D848;
  v10[4] = self;
  id v11 = v5;
  id v6 = v5;
  id v7 = (void *)[v10 copy];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v7;

  [(PUAssetActionPerformer *)self _handleStepFinished:0 withSuccess:1 error:0];
}

uint64_t __55__PUAssetActionPerformer_performWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  a3;
  if (*(void *)(a1 + 32))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
    }
  }
  return MEMORY[0x1F4181820]();
}

- (NSUndoManager)undoManager
{
  unint64_t v3 = [(PUAssetActionPerformer *)self delegate];
  uint64_t v4 = [v3 undoManagerForAssetActionPerformer:self];

  return (NSUndoManager *)v4;
}

- (PUAssetActionPerformer)initWithActionType:(unint64_t)a3 assets:(id)a4 orAssetsByAssetCollection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PUAssetActionPerformer;
  int v10 = [(PUAssetActionPerformer *)&v24 init];
  id v11 = v10;
  if (v10)
  {
    v10->_actionType = a3;
    v10->_state = 0;
    uint64_t v12 = [v8 copy];
    assets = v11->_assets;
    v11->_assets = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    assetsByAssetCollection = v11->_assetsByAssetCollection;
    v11->_assetsByAssetCollection = (NSDictionary *)v14;

    if (!v11->_assets)
    {
      v16 = [MEMORY[0x1E4F1CA48] array];
      v17 = v11->_assetsByAssetCollection;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __78__PUAssetActionPerformer_initWithActionType_assets_orAssetsByAssetCollection___block_invoke;
      v22[3] = &unk_1E5F235E0;
      v18 = v16;
      v23 = v18;
      [(NSDictionary *)v17 enumerateKeysAndObjectsUsingBlock:v22];
      v19 = v11->_assets;
      v11->_assets = v18;
      v20 = v18;
    }
  }

  return v11;
}

uint64_t __78__PUAssetActionPerformer_initWithActionType_assets_orAssetsByAssetCollection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

- (PUAssetActionPerformer)init
{
  return [(PUAssetActionPerformer *)self initWithActionType:0 assets:0 orAssetsByAssetCollection:0];
}

@end