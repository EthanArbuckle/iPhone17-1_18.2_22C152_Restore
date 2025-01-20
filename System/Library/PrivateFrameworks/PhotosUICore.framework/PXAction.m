@interface PXAction
- (BOOL)executionStarted;
- (NSString)actionIdentifier;
- (NSString)actionNameLocalizationKey;
- (NSString)actionSystemImageName;
- (NSString)analyticsEventName;
- (NSString)localizedActionName;
- (NSString)redoMenuItemTitle;
- (NSString)undoMenuItemTitle;
- (int64_t)phase;
- (void)_didPerformActionWithUndoManager:(id)a3 success:(BOOL)a4 error:(id)a5 completionHandler:(id)a6;
- (void)_performRedoWithUndoManager:(id)a3;
- (void)_performUndoWithUndoManager:(id)a3;
- (void)_registerRedoWithUndoManager:(id)a3;
- (void)_registerUndoWithUndoManager:(id)a3;
- (void)_unregisterFromUndoManager:(id)a3;
- (void)_updateNameWithUndoManager:(id)a3;
- (void)executeWithUndoManager:(id)a3 completionHandler:(id)a4;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
- (void)registerWithUndoManager:(id)a3;
- (void)removeAllActionsFromUndoManager:(id)a3;
@end

@implementation PXAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEventName, 0);
  objc_storeStrong((id *)&self->_localizedActionName, 0);
  objc_storeStrong((id *)&self->_redoMenuItemTitle, 0);
  objc_storeStrong((id *)&self->_undoMenuItemTitle, 0);
  objc_storeStrong((id *)&self->_actionNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_actionSystemImageName, 0);
}

- (NSString)analyticsEventName
{
  return self->_analyticsEventName;
}

- (NSString)localizedActionName
{
  return self->_localizedActionName;
}

- (NSString)redoMenuItemTitle
{
  return self->_redoMenuItemTitle;
}

- (NSString)undoMenuItemTitle
{
  return self->_undoMenuItemTitle;
}

- (NSString)actionNameLocalizationKey
{
  return self->_actionNameLocalizationKey;
}

- (int64_t)phase
{
  return self->_phase;
}

- (BOOL)executionStarted
{
  return self->_executionStarted;
}

- (NSString)actionSystemImageName
{
  return self->_actionSystemImageName;
}

- (void)removeAllActionsFromUndoManager:(id)a3
{
}

- (void)registerWithUndoManager:(id)a3
{
  self->_executionStarted = 1;
}

- (void)_didPerformActionWithUndoManager:(id)a3 success:(BOOL)a4 error:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  id v12 = a3;
  id v10 = a5;
  v11 = (void (**)(id, BOOL, id))a6;
  if (!v8) {
    [(PXAction *)self _unregisterFromUndoManager:v12];
  }
  if (v11) {
    v11[2](v11, v8, v10);
  }
}

- (void)executeWithUndoManager:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PXAction *)self _registerUndoWithUndoManager:v6];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__PXAction_executeWithUndoManager_completionHandler___block_invoke;
  v10[3] = &unk_1E5DD1B00;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PXAction *)self performAction:v10];
  self->_executionStarted = 1;
}

void __53__PXAction_executeWithUndoManager_completionHandler___block_invoke(id *a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = [a1[4] analyticsEventName];
    if (v6) {
      [MEMORY[0x1E4F56658] sendEvent:v6 withPayload:MEMORY[0x1E4F1CC08]];
    }
  }
  else
  {
    id v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = a1[4];
      *(_DWORD *)buf = 138412546;
      id v10 = v7;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Unable perform action:%@ error:%@", buf, 0x16u);
    }
  }

  a1[5];
  a1[6];
  id v8 = v5;
  px_dispatch_on_main_queue();
}

uint64_t __53__PXAction_executeWithUndoManager_completionHandler___block_invoke_222(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didPerformActionWithUndoManager:*(void *)(a1 + 40) success:*(unsigned __int8 *)(a1 + 64) error:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)performUndo:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXAction.m", 128, @"Method %s is a responsibility of subclass %@", "-[PXAction performUndo:]", v8 object file lineNumber description];

  abort();
}

- (void)performAction:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXAction.m", 124, @"Method %s is a responsibility of subclass %@", "-[PXAction performAction:]", v8 object file lineNumber description];

  abort();
}

- (NSString)actionIdentifier
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXAction.m", 120, @"Method %s is a responsibility of subclass %@", "-[PXAction actionIdentifier]", v6 object file lineNumber description];

  abort();
}

- (void)_performUndoWithUndoManager:(id)a3
{
  id v4 = a3;
  self->_phase = 1;
  [(PXAction *)self _registerRedoWithUndoManager:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__PXAction__performUndoWithUndoManager___block_invoke;
  v6[3] = &unk_1E5DD2570;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXAction *)self performUndo:v6];
}

void __40__PXAction__performUndoWithUndoManager___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Unable perform undo:%@ error:%@", buf, 0x16u);
    }
  }
  *(id *)(a1 + 40);
  px_dispatch_on_main_queue();
}

uint64_t __40__PXAction__performUndoWithUndoManager___block_invoke_217(uint64_t result)
{
  if (!*(unsigned char *)(result + 48)) {
    return [*(id *)(result + 32) _unregisterFromUndoManager:*(void *)(result + 40)];
  }
  return result;
}

- (void)_performRedoWithUndoManager:(id)a3
{
  id v4 = a3;
  self->_phase = 2;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __40__PXAction__performRedoWithUndoManager___block_invoke;
  __int16 v9 = &unk_1E5DD2570;
  id v10 = self;
  id v11 = v4;
  id v5 = v4;
  [(PXAction *)self performRedo:&v6];
  -[PXAction _registerUndoWithUndoManager:](self, "_registerUndoWithUndoManager:", v5, v6, v7, v8, v9, v10);
}

void __40__PXAction__performRedoWithUndoManager___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Unable perform redo:%@ error:%@", buf, 0x16u);
    }
  }
  *(id *)(a1 + 40);
  px_dispatch_on_main_queue();
}

uint64_t __40__PXAction__performRedoWithUndoManager___block_invoke_214(uint64_t result)
{
  if (!*(unsigned char *)(result + 48)) {
    return [*(id *)(result + 32) _unregisterFromUndoManager:*(void *)(result + 40)];
  }
  return result;
}

- (void)_unregisterFromUndoManager:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v7 = v5;
    if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAction.m", 83, @"%s must be called on the main thread", "-[PXAction _unregisterFromUndoManager:]");
    }
    [v7 removeAllActionsWithTarget:self];
    id v5 = v7;
  }
}

- (void)_registerRedoWithUndoManager:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAction.m", 66, @"%s must be called on the main thread", "-[PXAction _registerRedoWithUndoManager:]");
    }
    objc_initWeak(&location, v5);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__PXAction__registerRedoWithUndoManager___block_invoke;
    v9[3] = &unk_1E5DC0290;
    objc_copyWeak(&v10, &location);
    v9[4] = self;
    [v5 registerUndoWithTarget:self handler:v9];
    [(PXAction *)self _updateNameWithUndoManager:v5];
    uint64_t v6 = [v5 redoMenuItemTitle];
    redoMenuItemTitle = self->_redoMenuItemTitle;
    self->_redoMenuItemTitle = v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __41__PXAction__registerRedoWithUndoManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [*(id *)(a1 + 32) _performRedoWithUndoManager:WeakRetained];
    id WeakRetained = v3;
  }
}

- (void)_registerUndoWithUndoManager:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAction.m", 49, @"%s must be called on the main thread", "-[PXAction _registerUndoWithUndoManager:]");
    }
    objc_initWeak(&location, v5);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__PXAction__registerUndoWithUndoManager___block_invoke;
    v9[3] = &unk_1E5DC0290;
    objc_copyWeak(&v10, &location);
    v9[4] = self;
    [v5 registerUndoWithTarget:self handler:v9];
    [(PXAction *)self _updateNameWithUndoManager:v5];
    uint64_t v6 = [v5 undoMenuItemTitle];
    undoMenuItemTitle = self->_undoMenuItemTitle;
    self->_undoMenuItemTitle = v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __41__PXAction__registerUndoWithUndoManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [*(id *)(a1 + 32) _performUndoWithUndoManager:WeakRetained];
    id WeakRetained = v3;
  }
}

- (void)_updateNameWithUndoManager:(id)a3
{
  id v4 = a3;
  id v5 = [(PXAction *)self actionNameLocalizationKey];
  uint64_t v6 = v5;
  if (v5) {
    PXLocalizedStringFromTable(v5, @"PhotosUICore");
  }
  else {
  uint64_t v7 = [(PXAction *)self localizedActionName];
  }
  id v9 = (id)v7;
  if (v7) {
    uint64_t v8 = (__CFString *)v7;
  }
  else {
    uint64_t v8 = &stru_1F00B0030;
  }
  [v4 setActionName:v8];
}

@end