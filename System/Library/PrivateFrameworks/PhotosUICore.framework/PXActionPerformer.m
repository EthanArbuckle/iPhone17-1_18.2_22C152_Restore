@interface PXActionPerformer
+ (BOOL)isActionDestructive;
+ (id)createIndeterminateProgressToastForActionPerformer:(id)a3 title:(id)a4 description:(id)a5;
- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4;
- (BOOL)canPresentAlertInBackgroudState;
- (BOOL)dismissAlertWithToken:(id)a3 completionHandler:(id)a4;
- (BOOL)dismissViewController:(id)a3 completionHandler:(id)a4;
- (BOOL)isCancellable;
- (BOOL)keepMenuPresented;
- (BOOL)performerResetsAfterCompletion;
- (BOOL)prefersAssetInclusionAfterRemoval;
- (BOOL)presentAlertWithTitle:(id)a3 message:(id)a4 completionHandler:(id)a5;
- (BOOL)presentAlertWithTitle:(id)a3 message:(id)a4 radarConfiguration:(id)a5 completionHandler:(id)a6;
- (BOOL)presentViewController:(id)a3;
- (BOOL)presentViewController:(id)a3 completionHandler:(id)a4;
- (BOOL)presentsMenu;
- (BOOL)pushViewController:(id)a3;
- (BOOL)requiresUnlockedDevice;
- (BOOL)shouldPreventTargetedDismissalAnimation;
- (BOOL)success;
- (NSString)actionType;
- (NSString)activitySystemImageName;
- (NSString)activityType;
- (NSString)description;
- (NSUndoManager)undoManager;
- (PXActionPerformer)init;
- (PXActionPerformer)initWithActionType:(id)a3;
- (PXActionPerformerDelegate)delegate;
- (PXAnonymousViewController)hostViewController;
- (PXAnonymousViewController)presentedViewController;
- (PXPresentationEnvironment)presentationEnvironment;
- (id)activity;
- (id)barButtonItemWithTarget:(id)a3 action:(SEL)a4;
- (id)localizedSubtitleForUseCase:(unint64_t)a3;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (id)menuElement;
- (id)presentAlertWithConfigurationHandler:(id)a3;
- (id)sender;
- (int64_t)menuElementState;
- (unint64_t)state;
- (void)_completeStateWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_completeUnlockTaskWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_handleStepFinished:(unint64_t)a3 withSuccess:(BOOL)a4 error:(id)a5;
- (void)_performUnlockIfNeeded;
- (void)_transitionToState:(unint64_t)a3 withSuccess:(BOOL)a4 error:(id)a5;
- (void)cancelActionWithCompletionHandler:(id)a3;
- (void)completeBackgroundTaskWithSuccess:(BOOL)a3 error:(id)a4;
- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4;
- (void)performActionWithCompletionHandler:(id)a3;
- (void)performActivity:(id)a3;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
- (void)setDelegate:(id)a3;
- (void)setPresentationEnvironment:(id)a3;
- (void)setSender:(id)a3;
- (void)setUndoManager:(id)a3;
@end

@implementation PXActionPerformer

- (void)setDelegate:(id)a3
{
}

- (void)setSender:(id)a3
{
}

- (id)sender
{
  id WeakRetained = objc_loadWeakRetained(&self->_sender);
  return WeakRetained;
}

- (id)menuElement
{
  v3 = [(PXActionPerformer *)self localizedTitleForUseCase:1];
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4FB1818];
    v5 = [(PXActionPerformer *)self activitySystemImageName];
    v6 = [v4 systemImageNamed:v5];

    v7 = (void *)MEMORY[0x1E4FB13F0];
    v8 = [(PXActionPerformer *)self actionType];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __39__PXActionPerformer_UIKit__menuElement__block_invoke;
    v12[3] = &unk_1E5DC9A58;
    v12[4] = self;
    v9 = [v7 actionWithTitle:v3 image:v6 identifier:v8 handler:v12];

    v10 = [(PXActionPerformer *)self localizedSubtitleForUseCase:1];
    [v9 setSubtitle:v10];

    objc_msgSend(v9, "setState:", -[PXActionPerformer menuElementState](self, "menuElementState"));
    if ([(PXActionPerformer *)self keepMenuPresented]) {
      objc_msgSend(v9, "setAttributes:", objc_msgSend(v9, "attributes") | 8);
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (id)localizedSubtitleForUseCase:(unint64_t)a3
{
  return 0;
}

- (int64_t)menuElementState
{
  return 0;
}

- (PXActionPerformer)initWithActionType:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXActionManager.m", 174, @"Invalid parameter not satisfying: %@", @"nil != actionType" object file lineNumber description];
  }
  if (![v5 length])
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXActionManager.m", 175, @"Invalid parameter not satisfying: %@", @"[actionType length] > 0" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)PXActionPerformer;
  v6 = [(PXActionPerformer *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    actionType = v6->_actionType;
    v6->_actionType = (NSString *)v7;

    v6->_state = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_presentationEnvironment, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak(&self->_sender);
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)setUndoManager:(id)a3
{
}

- (BOOL)canPresentAlertInBackgroudState
{
  return self->_canPresentAlertInBackgroudState;
}

- (void)setPresentationEnvironment:(id)a3
{
}

- (PXAnonymousViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (PXActionPerformerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXActionPerformerDelegate *)WeakRetained;
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)isCancellable
{
  return self->_cancellable;
}

- (BOOL)success
{
  return self->_success;
}

- (BOOL)presentsMenu
{
  return 0;
}

- (BOOL)presentAlertWithTitle:(id)a3 message:(id)a4 radarConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  objc_super v12 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  if (v10)
  {
    v13 = (void *)MEMORY[0x1E4FB1410];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __88__PXActionPerformer_presentAlertWithTitle_message_radarConfiguration_completionHandler___block_invoke;
    v23[3] = &unk_1E5DC7010;
    id v24 = v10;
    id v25 = v11;
    v14 = [v13 actionWithTitle:@"File Radar" style:0 handler:v23];
    [v12 addAction:v14];
  }
  v15 = (void *)MEMORY[0x1E4FB1410];
  v16 = PXLocalizedStringFromTable(@"PXOK", @"PhotosUICore");
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __88__PXActionPerformer_presentAlertWithTitle_message_radarConfiguration_completionHandler___block_invoke_3;
  v21[3] = &unk_1E5DCE788;
  id v22 = v11;
  id v17 = v11;
  v18 = [v15 actionWithTitle:v16 style:0 handler:v21];
  [v12 addAction:v18];

  BOOL v19 = [(PXActionPerformer *)self presentViewController:v12];
  return v19;
}

void __88__PXActionPerformer_presentAlertWithTitle_message_radarConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __88__PXActionPerformer_presentAlertWithTitle_message_radarConfiguration_completionHandler___block_invoke_2;
  v2[3] = &unk_1E5DCDD58;
  id v3 = *(id *)(a1 + 40);
  [*(id *)(a1 + 32) setCompletionHandler:v2];
  PXFileRadarWithConfiguration(*(void **)(a1 + 32));
}

uint64_t __88__PXActionPerformer_presentAlertWithTitle_message_radarConfiguration_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __88__PXActionPerformer_presentAlertWithTitle_message_radarConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)presentAlertWithTitle:(id)a3 message:(id)a4 completionHandler:(id)a5
{
  return [(PXActionPerformer *)self presentAlertWithTitle:a3 message:a4 radarConfiguration:0 completionHandler:a5];
}

- (BOOL)dismissAlertWithToken:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(PXActionPerformer *)self presentationEnvironment];
  id v10 = v9;
  if (!v9)
  {
    id v11 = v7;
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_5:
        [v11 dismissWithCompletionHandler:v8];

        goto LABEL_6;
      }
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      v16 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v16);
      id v17 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
      [v13 handleFailureInMethod:a2, self, @"PXActionManager.m", 506, @"%@ should be an instance inheriting from %@, but it is %@", @"token", v15, v17 object file lineNumber description];
    }
    else
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      [v13 handleFailureInMethod:a2, self, @"PXActionManager.m", 506, @"%@ should be an instance inheriting from %@, but it is nil", @"token", v15 object file lineNumber description];
    }

    goto LABEL_5;
  }
  [v9 dismissAlertWithToken:v7 completionHandler:v8];
LABEL_6:

  return 1;
}

- (id)presentAlertWithConfigurationHandler:(id)a3
{
  v4 = (void (**)(id, PXAlertConfiguration *))a3;
  id v5 = [(PXActionPerformer *)self presentationEnvironment];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 presentAlertWithConfigurationHandler:v4];
  }
  else
  {
    id v8 = objc_alloc_init(PXAlertConfiguration);
    v4[2](v4, v8);
    v9 = [[PXAlert alloc] initWithConfiguration:v8];
    id v10 = [(PXAlert *)v9 alertController];
    BOOL v11 = [(PXActionPerformer *)self presentViewController:v10];

    if (v11) {
      objc_super v12 = v9;
    }
    else {
      objc_super v12 = 0;
    }
    id v7 = v12;
  }
  return v7;
}

- (void)_completeStateWithSuccess:(BOOL)a3 error:(id)a4
{
  (*((void (**)(void))self->_completionHandler + 2))();
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  presentedViewController = self->_presentedViewController;
  self->_presentedViewController = 0;

  if ([(PXActionPerformer *)self performerResetsAfterCompletion]) {
    self->_state = 0;
  }
}

- (void)_transitionToState:(unint64_t)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if (self->_state >= a3)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = v15;
    id v17 = 0;
    int64_t state = self->_state;
    if (state <= 9)
    {
      if (state)
      {
        if (state == 5) {
          id v17 = @"unlockIfNeeded";
        }
      }
      else
      {
        id v17 = @"ready";
      }
    }
    else
    {
      switch(state)
      {
        case 10:
          id v17 = @"userInteractive";
          break;
        case 20:
          id v17 = @"backgroundTask";
          break;
        case 30:
          id v17 = @"finished";
          break;
      }
    }
    BOOL v19 = 0;
    if ((uint64_t)a3 <= 9)
    {
      if (a3)
      {
        if (a3 == 5) {
          BOOL v19 = @"unlockIfNeeded";
        }
      }
      else
      {
        BOOL v19 = @"ready";
      }
    }
    else
    {
      switch(a3)
      {
        case 0xAuLL:
          BOOL v19 = @"userInteractive";
          break;
        case 0x14uLL:
          BOOL v19 = @"backgroundTask";
          break;
        case 0x1EuLL:
          BOOL v19 = @"finished";
          break;
      }
    }
    [v15 handleFailureInMethod:a2, self, @"PXActionManager.m", 432, @"Tried transitioning from %@ to the same or earlier step %@", v17, v19 object file lineNumber description];
  }
  self->_int64_t state = a3;
  if (a3 == 30) {
    self->_success = v5;
  }
  id v10 = PLUIGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    BOOL v11 = 0;
    if ((uint64_t)a3 <= 9)
    {
      if (a3)
      {
        if (a3 == 5) {
          BOOL v11 = @"unlockIfNeeded";
        }
      }
      else
      {
        BOOL v11 = @"ready";
      }
    }
    else
    {
      switch(a3)
      {
        case 0xAuLL:
          BOOL v11 = @"userInteractive";
          break;
        case 0x14uLL:
          BOOL v11 = @"backgroundTask";
          break;
        case 0x1EuLL:
          BOOL v11 = @"finished";
          break;
      }
    }
    *(_DWORD *)buf = 138412802;
    v23 = v11;
    __int16 v24 = 1024;
    BOOL v25 = v5;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEBUG, "Transition to state: %@, success: %d, error: %@", buf, 0x1Cu);
  }

  objc_super v12 = [(PXActionPerformer *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    v14 = [(PXActionPerformer *)self delegate];
    [v14 actionPerformer:self didChangeState:a3];
  }
  if ((uint64_t)a3 > 19)
  {
    if (a3 == 20)
    {
      [(PXActionPerformer *)self performBackgroundTask];
      goto LABEL_28;
    }
    if (a3 == 30)
    {
      [(PXActionPerformer *)self _completeStateWithSuccess:v5 error:v9];
      goto LABEL_28;
    }
LABEL_52:
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = PXActionPerformerStateDescription(a3);
    [v20 handleFailureInMethod:a2, self, @"PXActionManager.m", 464, @"Not allowed to transition to state:%@", v21 object file lineNumber description];

    abort();
  }
  if (a3 == 5)
  {
    [(PXActionPerformer *)self _performUnlockIfNeeded];
    goto LABEL_28;
  }
  if (a3 != 10) {
    goto LABEL_52;
  }
  [(PXActionPerformer *)self performUserInteractionTask];
LABEL_28:
}

- (void)_handleStepFinished:(unint64_t)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if (v9)
  {
    id v10 = PLUIGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = 0;
      objc_super v12 = @"NO";
      if (v5) {
        objc_super v12 = @"YES";
      }
      if ((uint64_t)a3 <= 9)
      {
        if (a3)
        {
          if (a3 == 5) {
            BOOL v11 = @"unlockIfNeeded";
          }
        }
        else
        {
          BOOL v11 = @"ready";
        }
      }
      else
      {
        switch(a3)
        {
          case 0xAuLL:
            BOOL v11 = @"userInteractive";
            break;
          case 0x14uLL:
            BOOL v11 = @"backgroundTask";
            break;
          case 0x1EuLL:
            BOOL v11 = @"finished";
            break;
        }
      }
      *(_DWORD *)buf = 138413058;
      v21 = self;
      __int16 v22 = 2112;
      v23 = v12;
      __int16 v24 = 2112;
      BOOL v25 = v11;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "%@ success:%@ step:%@ encountered error:%@", buf, 0x2Au);
    }
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXActionManager.m", 399, @"Invalid parameter not satisfying: %@", @"[NSThread isMainThread]" object file lineNumber description];
  }
  if ([(PXActionPerformer *)self state] == a3)
  {
    if (!v5) {
      goto LABEL_28;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = v15;
    id v17 = 0;
    if ((uint64_t)a3 <= 9)
    {
      if (a3)
      {
        if (a3 == 5) {
          id v17 = @"unlockIfNeeded";
        }
      }
      else
      {
        id v17 = @"ready";
      }
    }
    else
    {
      switch(a3)
      {
        case 0xAuLL:
          id v17 = @"userInteractive";
          break;
        case 0x14uLL:
          id v17 = @"backgroundTask";
          break;
        case 0x1EuLL:
          id v17 = @"finished";
          break;
      }
    }
    [v15 handleFailureInMethod:a2, self, @"PXActionManager.m", 400, @"%@: Invalid transition fromState: %@", self, v17 object file lineNumber description];

    if (!v5) {
      goto LABEL_28;
    }
  }
  if ((uint64_t)a3 > 9)
  {
    if (a3 == 10)
    {
      uint64_t v13 = 20;
      goto LABEL_29;
    }
    if (a3 != 20) {
      goto LABEL_45;
    }
LABEL_28:
    uint64_t v13 = 30;
    goto LABEL_29;
  }
  if (!a3)
  {
    uint64_t v13 = 5;
    goto LABEL_29;
  }
  if (a3 != 5)
  {
LABEL_45:
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v19 = PXActionPerformerStateDescription(a3);
    [v18 handleFailureInMethod:a2, self, @"PXActionManager.m", 423, @"Not allowed to transition from state:%@", v19 object file lineNumber description];

    abort();
  }
  uint64_t v13 = 10;
LABEL_29:
  [(PXActionPerformer *)self _transitionToState:v13 withSuccess:v5 error:v9];
}

- (void)completeBackgroundTaskWithSuccess:(BOOL)a3 error:(id)a4
{
}

- (void)performBackgroundTask
{
  uint64_t v4 = [(id)objc_opt_class() methodForSelector:a2];
  if (v4 == [(id)objc_opt_class() methodForSelector:a2])
  {
    [(PXActionPerformer *)self completeBackgroundTaskWithSuccess:1 error:0];
  }
}

- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4
{
}

- (BOOL)dismissViewController:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(void))a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXActionManager.m", 356, @"Invalid parameter not satisfying: %@", @"[NSThread isMainThread]" object file lineNumber description];
  }
  if ([(PXActionPerformer *)self state] != 10)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXActionManager.m", 357, @"Invalid parameter not satisfying: %@", @"[self state] == PXActionPerformerStateUserInteractive" object file lineNumber description];
  }
  if (!v8) {
    id v8 = (void (**)(void))&__block_literal_global_92435;
  }
  id v9 = [(PXActionPerformer *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    BOOL v11 = [(PXActionPerformer *)self delegate];
    char v12 = [v11 actionPerformer:self dismissViewController:v7 completionHandler:v8];
  }
  else
  {
    uint64_t v13 = [(PXActionPerformer *)self presentationEnvironment];

    if (!v13)
    {
      v8[2](v8);
      char v12 = 0;
      goto LABEL_12;
    }
    BOOL v11 = [(PXActionPerformer *)self presentationEnvironment];
    char v12 = 1;
    [v11 dismissViewController:v7 animated:1 completionHandler:v8];
  }

LABEL_12:
  return v12;
}

- (BOOL)pushViewController:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    char v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXActionManager.m", 341, @"Invalid parameter not satisfying: %@", @"[NSThread isMainThread]" object file lineNumber description];
  }
  if ([(PXActionPerformer *)self state] != 10)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXActionManager.m", 342, @"Invalid parameter not satisfying: %@", @"[self state] == PXActionPerformerStateUserInteractive" object file lineNumber description];
  }
  v6 = [(PXActionPerformer *)self presentationEnvironment];
  id v7 = [(PXActionPerformer *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(PXActionPerformer *)self delegate];
    char v10 = [v9 actionPerformer:self transitionToViewController:v5 transitionType:1];
  }
  else if (v6)
  {
    char v10 = [v6 pushViewController:v5 animated:1];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (PXPresentationEnvironment)presentationEnvironment
{
  id v3 = self->_presentationEnvironment;
  if (!v3)
  {
    uint64_t v4 = [(PXActionPerformer *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      v6 = [(PXActionPerformer *)self delegate];
      id v3 = [v6 presentationEnvironmentForActionPerformer:self];
    }
    else
    {
      id v3 = 0;
    }
  }
  return v3;
}

- (BOOL)prefersAssetInclusionAfterRemoval
{
  id v3 = [(PXActionPerformer *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  char v5 = [(PXActionPerformer *)self delegate];
  char v6 = [v5 prefersAssetInclusionAfterRemovalForActionPerformer:self];

  return v6;
}

- (NSUndoManager)undoManager
{
  id v3 = self->_undoManager;
  if (!v3)
  {
    char v4 = [(PXActionPerformer *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      char v6 = [(PXActionPerformer *)self delegate];
      id v3 = [v6 undoManagerForActionPerformer:self];
    }
    else
    {
      id v3 = 0;
    }
  }
  return v3;
}

- (PXAnonymousViewController)hostViewController
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXActionManager.m", 306, @"Invalid parameter not satisfying: %@", @"[NSThread isMainThread]" object file lineNumber description];
  }
  if ([(PXActionPerformer *)self state] != 10)
  {
    char v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXActionManager.m", 307, @"Invalid parameter not satisfying: %@", @"[self state] == PXActionPerformerStateUserInteractive" object file lineNumber description];
  }
  char v4 = [(PXActionPerformer *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(PXActionPerformer *)self delegate];
    id v7 = [v6 hostViewControllerForActionPerformer:self];
  }
  else
  {
    id v7 = 0;
  }
  return (PXAnonymousViewController *)v7;
}

- (BOOL)presentViewController:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXActionManager.m", 278, @"Invalid parameter not satisfying: %@", @"[NSThread isMainThread]" object file lineNumber description];
  }
  if ([(PXActionPerformer *)self state] != 10
    && ([(PXActionPerformer *)self state] != 20
     || ![(PXActionPerformer *)self canPresentAlertInBackgroudState]))
  {
    char v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXActionManager.m", 279, @"Invalid parameter not satisfying: %@", @"[self state] == PXActionPerformerStateUserInteractive || ([self state] == PXActionPerformerStateBackgroundTask && self.canPresentAlertInBackgroudState)" object file lineNumber description];
  }
  BOOL v11 = [(PXActionPerformer *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    if (([v11 actionPerformer:self transitionToViewController:v8 transitionType:2] & 1) == 0) {
      goto LABEL_16;
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    if (![v11 actionPerformer:self presentViewController:v8]) {
      goto LABEL_16;
    }
  }
  else
  {
    char v12 = [(PXActionPerformer *)self presentationEnvironment];

    if (!v12)
    {
LABEL_16:
      BOOL v15 = 0;
      goto LABEL_17;
    }
    id v13 = v8;
    v14 = [(PXActionPerformer *)self presentationEnvironment];
    [v14 presentViewController:v13 animated:1 completionHandler:v9];
  }
  objc_storeStrong((id *)&self->_presentedViewController, a3);
  BOOL v15 = 1;
LABEL_17:

  return v15;
}

- (BOOL)presentViewController:(id)a3
{
  return [(PXActionPerformer *)self presentViewController:a3 completionHandler:0];
}

- (void)performUserInteractionTask
{
  uint64_t v4 = [(id)objc_opt_class() methodForSelector:a2];
  if (v4 == [(id)objc_opt_class() methodForSelector:a2])
  {
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
}

- (void)_completeUnlockTaskWithSuccess:(BOOL)a3 error:(id)a4
{
}

- (void)_performUnlockIfNeeded
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__PXActionPerformer__performUnlockIfNeeded__block_invoke;
  aBlock[3] = &unk_1E5DD2188;
  aBlock[4] = self;
  id v3 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if ([(PXActionPerformer *)self requiresUnlockedDevice]
    && (+[PXActionManager _unlockDeviceHandlerWithActionType], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    char v5 = (void *)v4;
    (*(void (**)(uint64_t, void (**)(void *, uint64_t), void))(v4 + 16))(v4, v3, 0);
  }
  else
  {
    v3[2](v3, 1);
  }
}

uint64_t __43__PXActionPerformer__performUnlockIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _completeUnlockTaskWithSuccess:a2 error:0];
}

- (BOOL)requiresUnlockedDevice
{
  return 0;
}

- (NSString)description
{
  uint64_t v3 = [(PXActionPerformer *)self state];
  uint64_t v4 = @"userInteractive";
  char v5 = @"backgroundTask";
  char v6 = @"finished";
  if (v3 != 30) {
    char v6 = 0;
  }
  if (v3 != 20) {
    char v5 = v6;
  }
  if (v3 != 10) {
    uint64_t v4 = v5;
  }
  id v7 = @"ready";
  id v8 = @"unlockIfNeeded";
  if (v3 != 5) {
    id v8 = 0;
  }
  if (v3) {
    id v7 = v8;
  }
  if (v3 <= 9) {
    id v9 = v7;
  }
  else {
    id v9 = v4;
  }
  char v10 = NSString;
  uint64_t v11 = objc_opt_class();
  char v12 = [(PXActionPerformer *)self actionType];
  id v13 = [v10 stringWithFormat:@"<%@: %p type = %@, state = %@>", v11, self, v12, v9];;

  return (NSString *)v13;
}

- (BOOL)performerResetsAfterCompletion
{
  return 0;
}

- (void)cancelActionWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXActionManager.m", 216, @"Invalid parameter not satisfying: %@", @"[NSThread isMainThread]" object file lineNumber description];
  }
  if (![(PXActionPerformer *)self isCancellable])
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXActionManager.m", 217, @"Invalid parameter not satisfying: %@", @"[self isCancellable]" object file lineNumber description];
  }
  presentedViewController = self->_presentedViewController;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__PXActionPerformer_cancelActionWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E5DD3280;
  v10[4] = self;
  id v11 = v5;
  id v7 = v5;
  [(PXActionPerformer *)self dismissViewController:presentedViewController completionHandler:v10];
}

uint64_t __55__PXActionPerformer_cancelActionWithCompletionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == 10) {
    [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:0];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)performActionWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXActionManager.m", 200, @"Invalid parameter not satisfying: %@", @"[NSThread isMainThread]" object file lineNumber description];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__PXActionPerformer_performActionWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E5DD2B90;
  v10[4] = self;
  id v11 = v5;
  id v6 = v5;
  id v7 = (void *)[v10 copy];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v7;

  [(PXActionPerformer *)self _handleStepFinished:0 withSuccess:1 error:0];
}

void __56__PXActionPerformer_performActionWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 32))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      id v7 = v5;
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
      id v5 = v7;
    }
  }
}

- (BOOL)shouldPreventTargetedDismissalAnimation
{
  return 0;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return 0;
}

- (PXActionPerformer)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXActionManager.m" lineNumber:170 description:@"Use the designated initializer: \"-initWithActionType:\"."];

  abort();
}

+ (id)createIndeterminateProgressToastForActionPerformer:(id)a3 title:(id)a4 description:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = [v7 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F28F90]);
    [v11 setTotalUnitCount:-1];
    [v11 setLocalizedDescription:v8];
    [v11 setLocalizedAdditionalDescription:v9];
    char v12 = [v10 actionPerformerHostViewControllerForPresentingToast:v7];
    id v13 = [PXActionProgressToast alloc];
    v14 = objc_msgSend(v12, "px_navigationDestination");
    BOOL v15 = [(PXActionProgressToast *)v13 initWithTargetDestination:v14 progress:v11];

    if (objc_opt_respondsToSelector())
    {
      [v10 actionPerformerBottomPaddingForPresentingToast:v7];
      -[PXActionProgressToast setBottomSpacing:](v15, "setBottomSpacing:");
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

+ (BOOL)isActionDestructive
{
  return 0;
}

- (void)performActivity:(id)a3
{
}

- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4
{
  return 0;
}

- (NSString)activitySystemImageName
{
  return 0;
}

- (NSString)activityType
{
  return 0;
}

- (id)barButtonItemWithTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  id v7 = [(PXActionPerformer *)self activitySystemImageName];
  uint64_t v8 = [(PXActionPerformer *)self localizedTitleForUseCase:1];
  id v9 = (void *)v8;
  if (v7)
  {
    char v10 = [MEMORY[0x1E4FB1818] systemImageNamed:v7];
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithImage:v10 style:0 target:v6 action:a4];
  }
  else
  {
    if (!v8) {
      PXAssertGetLog();
    }
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v8 style:0 target:v6 action:a4];
  }

  return v11;
}

- (id)activity
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PXActionPerformer *)self localizedTitleForUseCase:2];
  uint64_t v4 = [(PXActionPerformer *)self actionType];
  id v5 = [(PXActionPerformer *)self activityType];
  id v6 = [(PXActionPerformer *)self activitySystemImageName];
  if (!v3 || !v4 || !v5) {
    PXAssertGetLog();
  }
  id v7 = +[PXActivity activityWithActionTitle:v3 actionType:v4 activityType:v5 systemImageName:v6];
  if (!v7) {
    PXAssertGetLog();
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__PXActionPerformer_UIKit__activity__block_invoke;
  v10[3] = &unk_1E5DB8B10;
  v10[4] = self;
  [v7 setPerformActivityActionHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__PXActionPerformer_UIKit__activity__block_invoke_2;
  v9[3] = &unk_1E5DB8B38;
  v9[4] = self;
  [v7 setCanPerformActivityActionHandler:v9];

  return v7;
}

uint64_t __36__PXActionPerformer_UIKit__activity__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performActivity:a2];
}

uint64_t __36__PXActionPerformer_UIKit__activity__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) canPerformWithActivityItems:a2 forActivity:a3];
}

- (BOOL)keepMenuPresented
{
  return 0;
}

uint64_t __39__PXActionPerformer_UIKit__menuElement__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performActionWithCompletionHandler:0];
}

@end