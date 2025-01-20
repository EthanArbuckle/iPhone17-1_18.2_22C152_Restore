@interface PXCMMWorkflowCoordinator
- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4;
- (PXCMMWorkflowCoordinatorDelegate)delegate;
- (id)_createRootWorkflowViewControllerWithSession:(id)a3 willBeEmbeddedInNavigationController:(BOOL)a4 assetActionManager:(id)a5 assetCollectionActionManager:(id)a6 photosViewConfigurationBlock:(id)a7;
- (id)_performActionWithType:(id)a3 forSession:(id)a4;
- (id)_performDeleteActionForSession:(id)a3;
- (id)_performPublishActionForSession:(id)a3;
- (id)_performReceiveActionForSession:(id)a3;
- (id)_presentationEnvironment;
- (id)_presentingViewControllerForViewController:(id)a3;
- (id)completeMyMomentViewController:(id)a3 performActionForSession:(id)a4;
- (id)undoManagerForActionPerformer:(id)a3;
- (id)workflowViewControllerWithContext:(id)a3;
- (id)workflowViewControllerWithContext:(id)a3 embedInNavigationControllerOfClass:(Class)a4;
- (id)workflowViewControllerWithContext:(id)a3 embedInNavigationControllerOfClass:(Class)a4 photosViewConfigurationBlock:(id)a5;
- (id)workflowViewControllerWithSession:(id)a3 embedInNavigationControllerOfClass:(Class)a4 assetActionManager:(id)a5 assetCollectionActionManager:(id)a6 photosViewConfigurationBlock:(id)a7;
- (void)_completeActionForSession:(id)a3 withSuccess:(BOOL)a4 error:(id)a5;
- (void)_completeMessageComposeActionForSession:(id)a3 withSuccess:(BOOL)a4 error:(id)a5;
- (void)_completePhotosPickerActionForSession:(id)a3 withSuccess:(BOOL)a4 error:(id)a5;
- (void)_completePublishForSession:(id)a3 withURL:(id)a4 error:(id)a5;
- (void)_didFinishSession:(id)a3 withState:(unint64_t)a4;
- (void)_didFinishSession:(id)a3 withState:(unint64_t)a4 avoidDismissal:(BOOL)a5;
- (void)_performCleanupActionForSession:(id)a3;
- (void)_performMessageComposeActionForSession:(id)a3 shareURL:(id)a4;
- (void)_performNotifyIfNeededActionForSession:(id)a3;
- (void)_performPhotosPickerActionForSession:(id)a3 gridPresentation:(id)a4;
- (void)_presentFailureForSession:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)_session:(id)a3 finishedAccepting:(BOOL)a4 withError:(id)a5;
- (void)cancelWorkflow;
- (void)completeMyMomentViewController:(id)a3 showPhotoPickerForSession:(id)a4;
- (void)didCancelCompleteMyMomentViewController:(id)a3;
- (void)performQuickSaveForContext:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)startPreloadingTasksForCompleteMyMomentViewController:(id)a3;
@end

@implementation PXCMMWorkflowCoordinator

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rootWorkflowSession, 0);
  objc_storeStrong((id *)&self->_rootWorkflowViewController, 0);
  objc_storeStrong((id *)&self->_gridController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PXCMMWorkflowCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXCMMWorkflowCoordinatorDelegate *)WeakRetained;
}

- (id)_presentingViewControllerForViewController:(id)a3
{
  id v4 = a3;
  v5 = self->_rootWorkflowViewController;
  uint64_t v6 = [(UIViewController *)v5 presentedViewController];
  id v7 = (id)v6;
  if (v6) {
    BOOL v8 = v6 == (void)v4;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    do
    {
      v9 = v5;
      v5 = (UIViewController *)v7;

      id v7 = [(UIViewController *)v5 presentedViewController];
    }
    while (v7 && v7 != v4);
  }

  return v5;
}

- (id)_createRootWorkflowViewControllerWithSession:(id)a3 willBeEmbeddedInNavigationController:(BOOL)a4 assetActionManager:(id)a5 assetCollectionActionManager:(id)a6 photosViewConfigurationBlock:(id)a7
{
  BOOL v10 = a4;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [v13 actionManager];
  [v17 setPerformerDelegate:self];

  objc_storeStrong((id *)&self->_rootWorkflowSession, a3);
  BOOL v18 = +[PXCMMGridController useGridZeroForCMMSession:v13];
  if (v16 || v18)
  {
    v20 = [[PXCMMGridController alloc] initWithCMMSession:v13 enableDismissAction:v10 assetActionManager:v14 assetCollectionActionManager:v15 performerDelegate:self photosViewConfigurationBlock:v16];
    gridController = self->_gridController;
    self->_gridController = v20;

    v19 = [(PXCMMGridController *)self->_gridController gridViewController];
  }
  else
  {
    v19 = [[PXCMMViewController alloc] initWithSession:v13];
    [(PXCMMViewController *)v19 setDelegate:self];
    [(PXCMMViewController *)v19 setActionDelegate:self];
  }

  return v19;
}

- (void)_presentFailureForSession:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [a3 activityType];
  BOOL v12 = v10 == 1 || v10 == 4;
  id v14 = [(PXCMMWorkflowCoordinator *)self _presentationEnvironment];
  id v13 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  PXMomentSharePresentFailureForAction(v13, v12, v9, v14, v8);
}

- (id)_presentationEnvironment
{
  v2 = [(PXCMMWorkflowCoordinator *)self _presentingViewControllerForViewController:0];
  v3 = +[PXViewControllerPresenter defaultPresenterWithViewController:v2];

  return v3;
}

- (void)completeMyMomentViewController:(id)a3 showPhotoPickerForSession:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a3, "px_gridPresentation");
  if (v7)
  {
    [(PXCMMWorkflowCoordinator *)self _performPhotosPickerActionForSession:v6 gridPresentation:v7];
  }
  else
  {
    id v8 = PLSharingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "Unable to find grid presentation for CMM workflow", v10, 2u);
    }

    id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1003, @"A grid presentation object is required to display the photos picker");
    [(PXCMMWorkflowCoordinator *)self _completePhotosPickerActionForSession:v6 withSuccess:0 error:v9];
  }
}

- (void)didCancelCompleteMyMomentViewController:(id)a3
{
  id v4 = [a3 session];
  [(PXCMMWorkflowCoordinator *)self _didFinishSession:v4 withState:2];
}

- (void)startPreloadingTasksForCompleteMyMomentViewController:(id)a3
{
  id v4 = a3;
  v5 = [v4 session];
  id v6 = [v5 actionManager];
  id v7 = [v6 actionPerformerForActionType:@"PXCMMActionTypeAccept"];

  if ([v7 canPerformActionWithSession:v5])
  {
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __82__PXCMMWorkflowCoordinator_startPreloadingTasksForCompleteMyMomentViewController___block_invoke;
    v14[3] = &unk_1E5DD2120;
    objc_copyWeak(&v16, &location);
    id v15 = v5;
    id v8 = (id)[v7 performActionWithSession:v15 completionHandler:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  id v9 = [v5 actionManager];
  uint64_t v10 = [v9 actionPerformerForActionType:@"PXCMMActionTypeForceSync"];

  if ([v10 canPerformActionWithSession:v5])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __82__PXCMMWorkflowCoordinator_startPreloadingTasksForCompleteMyMomentViewController___block_invoke_2;
    v12[3] = &unk_1E5DD3158;
    id v13 = v5;
    id v11 = (id)[v10 performActionWithSession:v13 completionHandler:v12];
  }
}

void __82__PXCMMWorkflowCoordinator_startPreloadingTasksForCompleteMyMomentViewController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = (id *)(a1 + 40);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _session:*(void *)(a1 + 32) finishedAccepting:a2 withError:v6];
}

void __82__PXCMMWorkflowCoordinator_startPreloadingTasksForCompleteMyMomentViewController___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PLSharingGetLog();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      id v8 = "Successfully forced sync on moment share";
      id v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      uint32_t v11 = 2;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v9, v10, v8, (uint8_t *)&v13, v11);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = 138412546;
    uint64_t v14 = v12;
    __int16 v15 = 2112;
    id v16 = v5;
    id v8 = "Failed to force sync on moment share from session %@ with error: %@";
    id v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    uint32_t v11 = 22;
    goto LABEL_6;
  }
}

- (void)_session:(id)a3 finishedAccepting:(BOOL)a4 withError:(id)a5
{
  BOOL v6 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    int v13 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMWorkflowCoordinator.m", 430, @"%s must be called on the main thread", "-[PXCMMWorkflowCoordinator _session:finishedAccepting:withError:]");
  }
  uint32_t v11 = PLSharingGetLog();
  uint64_t v12 = v11;
  if (v6)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "CMM workflow finished accepting moment share.", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v10;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "CMM workflow failed to accept moment share: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__PXCMMWorkflowCoordinator__session_finishedAccepting_withError___block_invoke;
    v14[3] = &unk_1E5DD21B0;
    objc_copyWeak(&v16, (id *)buf);
    id v15 = v9;
    [(PXCMMWorkflowCoordinator *)self _presentFailureForSession:v15 error:v10 completionHandler:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

void __65__PXCMMWorkflowCoordinator__session_finishedAccepting_withError___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didFinishSession:*(void *)(a1 + 32) withState:3 avoidDismissal:a2];
}

- (id)completeMyMomentViewController:(id)a3 performActionForSession:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  switch([v8 activityType])
  {
    case 0:
    case 4:
      int v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"PXCMMWorkflowCoordinator.m" lineNumber:421 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1:
      uint64_t v9 = [(PXCMMWorkflowCoordinator *)self _performPublishActionForSession:v8];
      goto LABEL_7;
    case 2:
      uint64_t v9 = [(PXCMMWorkflowCoordinator *)self _performReceiveActionForSession:v8];
      goto LABEL_7;
    case 3:
      uint64_t v10 = [v8 sourceType];
      if (v10 == 1)
      {
        [(PXCMMWorkflowCoordinator *)self _didFinishSession:v8 withState:1];
        goto LABEL_9;
      }
      if (v10)
      {
LABEL_9:
        uint32_t v11 = 0;
        goto LABEL_10;
      }
      uint64_t v9 = [(PXCMMWorkflowCoordinator *)self _performDeleteActionForSession:v8];
LABEL_7:
      uint32_t v11 = (void *)v9;
LABEL_10:

      return v11;
    default:
      goto LABEL_9;
  }
}

- (id)undoManagerForActionPerformer:(id)a3
{
  return (id)[(UIViewController *)self->_rootWorkflowViewController undoManager];
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = v7;
  uint64_t v10 = [(PXCMMWorkflowCoordinator *)self _presentingViewControllerForViewController:v9];
  id v11 = [v10 presentedViewController];
  if (v11 == v9)
  {
    [v10 dismissViewControllerAnimated:1 completion:v8];
  }
  else
  {
    uint64_t v12 = PLSharingGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412802;
      id v15 = v10;
      __int16 v16 = 2112;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "Unexpected view controller presented from %@: %@ (expected: %@)", (uint8_t *)&v14, 0x20u);
    }
  }
  return v11 == v9;
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXCMMWorkflowCoordinator *)self _presentingViewControllerForViewController:v7];
  id v9 = PLSharingGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "Performer: %@ Presenting Action Performer View Controller", buf, 0xCu);
  }

  PLSharingGetLog();
  uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v12 = v11;
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "ActionPerformerPresentation", " enableTelemetry=YES ", buf, 2u);
    }
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__PXCMMWorkflowCoordinator_actionPerformer_presentViewController___block_invoke;
  v15[3] = &unk_1E5DD32A8;
  v15[4] = self;
  id v16 = v6;
  id v13 = v6;
  [v8 presentViewController:v7 animated:1 completion:v15];

  return 1;
}

void __66__PXCMMWorkflowCoordinator_actionPerformer_presentViewController___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  PLSharingGetLog();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v4 = v3;
    if (os_signpost_enabled(v2))
    {
      LOWORD(v7) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v2, OS_SIGNPOST_INTERVAL_END, v4, "ActionPerformerPresentation", " enableTelemetry=YES ", (uint8_t *)&v7, 2u);
    }
  }

  id v5 = PLSharingGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Performer: %@ Presented Action Performer View Controller", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_completeActionForSession:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v6)
  {
    [(PXCMMWorkflowCoordinator *)self _didFinishSession:v8 withState:1];
  }
  else
  {
    uint64_t v10 = PLSharingGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "Action failed with error: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__PXCMMWorkflowCoordinator__completeActionForSession_withSuccess_error___block_invoke;
    v11[3] = &unk_1E5DD21B0;
    objc_copyWeak(&v13, (id *)buf);
    id v12 = v8;
    [(PXCMMWorkflowCoordinator *)self _presentFailureForSession:v12 error:v9 completionHandler:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

void __72__PXCMMWorkflowCoordinator__completeActionForSession_withSuccess_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didFinishSession:*(void *)(a1 + 32) withState:3];
}

- (void)_completeMessageComposeActionForSession:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  if (!v5)
  {
    uint64_t v10 = [v8 domain];
    if ([v10 isEqualToString:@"PXCMMErrorDomain"])
    {
      uint64_t v11 = [v8 code];

      if (v11 == -1007)
      {
        id v12 = PLSharingGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "User cancelled message composition", buf, 2u);
        }
LABEL_11:

        [(PXCMMWorkflowCoordinator *)self _performCleanupActionForSession:v9];
        goto LABEL_12;
      }
    }
    else
    {
    }
    id v13 = PLSharingGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "Message compose failed with error: %@", buf, 0xCu);
    }

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __86__PXCMMWorkflowCoordinator__completeMessageComposeActionForSession_withSuccess_error___block_invoke;
    v14[3] = &unk_1E5DD2188;
    id v15 = v8;
    [(PXCMMWorkflowCoordinator *)self _presentFailureForSession:v9 error:v15 completionHandler:v14];
    id v12 = v15;
    goto LABEL_11;
  }
  [(PXCMMWorkflowCoordinator *)self _completeActionForSession:v9 withSuccess:1 error:v8];
LABEL_12:
}

void __86__PXCMMWorkflowCoordinator__completeMessageComposeActionForSession_withSuccess_error___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = PLSharingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "User confirmed Message compose error alert for error %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_completePhotosPickerActionForSession:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if (!a4)
  {
    int v7 = PLSharingGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Photos Picker action failed with error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_completePublishForSession:(id)a3 withURL:(id)a4 error:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = [(PXCMMWorkflowCoordinator *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      [v9 workflowCoordinator:self didPublishToURL:v8];
      [(PXCMMWorkflowCoordinator *)self _completeActionForSession:v10 withSuccess:1 error:0];
    }
    if ([v10 activityType] == 1 && !objc_msgSend(v10, "sourceType")) {
      [(PXCMMWorkflowCoordinator *)self _performMessageComposeActionForSession:v10 shareURL:v8];
    }
  }
  else
  {
    [(PXCMMWorkflowCoordinator *)self _completeActionForSession:v10 withSuccess:0 error:a5];
  }
}

- (void)_didFinishSession:(id)a3 withState:(unint64_t)a4 avoidDismissal:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  uint64_t v10 = [v9 activityType];
  if (a4 != 2 && v5 && v10 == 2)
  {
    uint64_t v11 = PLSharingGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "Staying in receiving VC after session finished.", buf, 2u);
    }
  }
  else
  {
    if (a4 == 1 || v10 != 1)
    {
      if (v10 == 2) {
        [(PXCMMWorkflowCoordinator *)self _performNotifyIfNeededActionForSession:v9];
      }
    }
    else
    {
      [(PXCMMWorkflowCoordinator *)self _performCleanupActionForSession:v9];
    }
    unint64_t v12 = self->_navigationController;
    navigationController = self->_navigationController;
    self->_navigationController = 0;

    unint64_t v14 = self->_rootWorkflowViewController;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = (UIViewController *)(id)v14;
      [(UIViewController *)v15 setDelegate:0];
      [(UIViewController *)v15 setActionDelegate:0];
    }
    rootWorkflowViewController = self->_rootWorkflowViewController;
    self->_rootWorkflowViewController = 0;

    rootWorkflowSession = self->_rootWorkflowSession;
    self->_rootWorkflowSession = 0;

    gridController = self->_gridController;
    self->_gridController = 0;

    uint64_t v19 = [(PXCMMWorkflowCoordinator *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      if (!(v12 | v14))
      {
        v21 = [MEMORY[0x1E4F28B00] currentHandler];
        [v21 handleFailureInMethod:a2, self, @"PXCMMWorkflowCoordinator.m", 295, @"Invalid parameter not satisfying: %@", @"navigationController || workflowViewController" object file lineNumber description];
      }
      if (v12) {
        unint64_t v20 = v12;
      }
      else {
        unint64_t v20 = v14;
      }
      [v19 workflowCoordinator:self workflowViewController:v20 didFinishSession:v9 withActivityState:a4];
    }
  }
}

- (void)_didFinishSession:(id)a3 withState:(unint64_t)a4
{
}

- (void)_performNotifyIfNeededActionForSession:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = [v3 actionManager];
  BOOL v5 = [v4 actionPerformerForActionType:@"PXCMMActionTypeNotifyWhenReadyIfNeeded"];

  if ([v5 canPerformActionWithSession:v3])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__PXCMMWorkflowCoordinator__performNotifyIfNeededActionForSession___block_invoke;
    v8[3] = &unk_1E5DD3158;
    id v9 = v3;
    id v6 = (id)[v5 performActionWithSession:v9 completionHandler:v8];
    int v7 = v9;
  }
  else
  {
    int v7 = PLSharingGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "Unable to perform notify if needed action. Skipping for session: %@", buf, 0xCu);
    }
  }
}

void __67__PXCMMWorkflowCoordinator__performNotifyIfNeededActionForSession___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PLSharingGetLog();
  int v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v14 = 138412290;
      uint64_t v15 = v8;
      id v9 = "Successfully completed notify if needed action for session: %@";
      uint64_t v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = 138412546;
    uint64_t v15 = v13;
    __int16 v16 = 2112;
    id v17 = v5;
    id v9 = "Failed to mark moment share as needing notification when ready for session %@ - error: %@";
    uint64_t v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_6;
  }
}

- (void)_performCleanupActionForSession:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = [v3 actionManager];
  id v5 = [v4 actionPerformerForActionType:@"PXCMMActionTypeCleanup"];

  if ([v5 canPerformActionWithSession:v3])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__PXCMMWorkflowCoordinator__performCleanupActionForSession___block_invoke;
    v8[3] = &unk_1E5DD3158;
    id v9 = v3;
    id v6 = (id)[v5 performActionWithSession:v9 completionHandler:v8];
    int v7 = v9;
  }
  else
  {
    int v7 = PLSharingGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "Unable to perform cleanup action. Skipping for session: %@", buf, 0xCu);
    }
  }
}

void __60__PXCMMWorkflowCoordinator__performCleanupActionForSession___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PLSharingGetLog();
  int v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v14 = 138412290;
      uint64_t v15 = v8;
      id v9 = "Successfully cleaned up CMM share for session: %@";
      uint64_t v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = 138412546;
    uint64_t v15 = v13;
    __int16 v16 = 2112;
    id v17 = v5;
    id v9 = "Failed to clean up for session %@ - error: %@";
    uint64_t v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_6;
  }
}

- (id)_performReceiveActionForSession:(id)a3
{
  return [(PXCMMWorkflowCoordinator *)self _performActionWithType:@"PXCMMActionTypeSaveToLibrary" forSession:a3];
}

- (void)_performPhotosPickerActionForSession:(id)a3 gridPresentation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 actionManager];
  id v9 = [v8 photosPickerActionPerformer];

  if (v9)
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __82__PXCMMWorkflowCoordinator__performPhotosPickerActionForSession_gridPresentation___block_invoke;
    v11[3] = &unk_1E5DD2120;
    objc_copyWeak(&v13, &location);
    id v12 = v6;
    [v9 performPhotosPickerActionWithSession:v12 gridPresentation:v7 completionHandler:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:underlyingError:debugDescription:", @"PXCMMErrorDomain", -1000, 0, @"No performer for photos picker action, session: %@", v6);
    [(PXCMMWorkflowCoordinator *)self _completePhotosPickerActionForSession:v6 withSuccess:0 error:v10];
  }
}

void __82__PXCMMWorkflowCoordinator__performPhotosPickerActionForSession_gridPresentation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _completePhotosPickerActionForSession:*(void *)(a1 + 32) withSuccess:a2 error:v6];
}

- (void)_performMessageComposeActionForSession:(id)a3 shareURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 actionManager];
  id v9 = [v8 messageComposeActionPerformer];

  if (v9)
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76__PXCMMWorkflowCoordinator__performMessageComposeActionForSession_shareURL___block_invoke;
    v11[3] = &unk_1E5DD2120;
    objc_copyWeak(&v13, &location);
    id v12 = v6;
    [v9 performMessageComposeActionWithSession:v12 shareURL:v7 completionHandler:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:underlyingError:debugDescription:", @"PXCMMErrorDomain", -1000, 0, @"No performer for message compose action, session: %@", v6);
    [(PXCMMWorkflowCoordinator *)self _completeActionForSession:v6 withSuccess:0 error:v10];
  }
}

void __76__PXCMMWorkflowCoordinator__performMessageComposeActionForSession_shareURL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _completeMessageComposeActionForSession:*(void *)(a1 + 32) withSuccess:a2 error:v6];
}

- (id)_performDeleteActionForSession:(id)a3
{
  return [(PXCMMWorkflowCoordinator *)self _performActionWithType:@"PXCMMActionTypeDelete" forSession:a3];
}

- (id)_performPublishActionForSession:(id)a3
{
  id v4 = a3;
  id v5 = [v4 actionManager];
  id v6 = [v5 publishActionPerformer];

  if (v6)
  {
    id v7 = [(PXCMMWorkflowCoordinator *)self delegate];
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = [v7 shareOriginForSession:v4 workflowCoordinator:self];
    }
    else {
      uint64_t v8 = 0;
    }
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__PXCMMWorkflowCoordinator__performPublishActionForSession___block_invoke;
    v12[3] = &unk_1E5DD2148;
    objc_copyWeak(&v14, &location);
    id v13 = v4;
    uint64_t v10 = [v6 performPublishActionWithSession:v13 shareOrigin:v8 completionHandler:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:underlyingError:debugDescription:", @"PXCMMErrorDomain", -1000, 0, @"No performer for publish action, session: %@", v4);
    [(PXCMMWorkflowCoordinator *)self _completeActionForSession:v4 withSuccess:0 error:v9];

    uint64_t v10 = 0;
  }

  return v10;
}

void __60__PXCMMWorkflowCoordinator__performPublishActionForSession___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _completePublishForSession:*(void *)(a1 + 32) withURL:v7 error:v6];
}

- (id)_performActionWithType:(id)a3 forSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 actionManager];
  id v9 = [v8 actionPerformerForActionType:v6];

  if (v9)
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__PXCMMWorkflowCoordinator__performActionWithType_forSession___block_invoke;
    v13[3] = &unk_1E5DD2120;
    objc_copyWeak(&v15, &location);
    id v14 = v7;
    uint64_t v10 = [v9 performActionWithSession:v14 completionHandler:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    os_log_type_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:underlyingError:debugDescription:", @"PXCMMErrorDomain", -1000, 0, @"No performer for action type: \"%@\", session: %@", v6, v7);
    [(PXCMMWorkflowCoordinator *)self _completeActionForSession:v7 withSuccess:0 error:v11];

    uint64_t v10 = 0;
  }

  return v10;
}

void __62__PXCMMWorkflowCoordinator__performActionWithType_forSession___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _completeActionForSession:*(void *)(a1 + 32) withSuccess:a2 error:v6];
}

- (void)performQuickSaveForContext:(id)a3 completion:(id)a4
{
  id v11 = a4;
  id v5 = [a3 createSession];
  id v6 = [v5 actionManager];
  id v7 = [v6 actionPerformerForActionType:@"PXCMMActionTypeSaveToLibrary"];

  uint64_t v8 = [v5 viewModel];
  id v9 = [v8 selectionManager];
  [v9 performChanges:&__block_literal_global_295267];

  id v10 = (id)[v7 performActionWithSession:v5 completionHandler:v11];
}

uint64_t __66__PXCMMWorkflowCoordinator_performQuickSaveForContext_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 selectAllItems];
}

- (void)cancelWorkflow
{
  if (!self->_rootWorkflowViewController)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"PXCMMWorkflowCoordinator.m", 133, @"Invalid parameter not satisfying: %@", @"_rootWorkflowViewController" object file lineNumber description];
  }
  rootWorkflowSession = self->_rootWorkflowSession;
  [(PXCMMWorkflowCoordinator *)self _didFinishSession:rootWorkflowSession withState:2];
}

- (id)workflowViewControllerWithSession:(id)a3 embedInNavigationControllerOfClass:(Class)a4 assetActionManager:(id)a5 assetCollectionActionManager:(id)a6 photosViewConfigurationBlock:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    if (!a4) {
      goto LABEL_5;
    }
  }
  else
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"PXCMMWorkflowCoordinator.m", 96, @"Invalid parameter not satisfying: %@", @"session" object file lineNumber description];

    if (!a4) {
      goto LABEL_5;
    }
  }
  if (([(objc_class *)a4 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"PXCMMWorkflowCoordinator.m", 98, @"Invalid parameter not satisfying: %@", @"!navigationControllerClass || [navigationControllerClass isSubclassOfClass:[UINavigationController class]]" object file lineNumber description];
  }
LABEL_5:
  if (self->_rootWorkflowViewController)
  {
    navigationController = self->_navigationController;
    self->_navigationController = 0;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = self->_rootWorkflowViewController;
      [(UIViewController *)v18 setDelegate:0];
      [(UIViewController *)v18 setActionDelegate:0];
    }
    gridController = self->_gridController;
    self->_gridController = 0;

    rootWorkflowViewController = self->_rootWorkflowViewController;
    self->_rootWorkflowViewController = 0;

    rootWorkflowSession = self->_rootWorkflowSession;
    self->_rootWorkflowSession = 0;
  }
  [(PXCMMWorkflowCoordinator *)self _createRootWorkflowViewControllerWithSession:v13 willBeEmbeddedInNavigationController:a4 != 0 assetActionManager:v14 assetCollectionActionManager:v15 photosViewConfigurationBlock:v16];
  v22 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  v23 = self->_rootWorkflowViewController;
  self->_rootWorkflowViewController = v22;

  if (a4)
  {
    v24 = [(UIViewController *)self->_rootWorkflowViewController navigationItem];
    v25 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_cancelWorkflow];
    [v24 setLeftBarButtonItem:v25];
    v26 = (UINavigationController *)[[a4 alloc] initWithRootViewController:self->_rootWorkflowViewController];
    v27 = self->_navigationController;
    self->_navigationController = v26;

    [(UINavigationController *)self->_navigationController setModalPresentationStyle:0];
  }
  v28 = self->_navigationController;
  if (!v28) {
    v28 = (UINavigationController *)self->_rootWorkflowViewController;
  }
  v29 = v28;

  return v29;
}

- (id)workflowViewControllerWithContext:(id)a3 embedInNavigationControllerOfClass:(Class)a4 photosViewConfigurationBlock:(id)a5
{
  id v8 = a5;
  id v9 = [a3 createSession];
  id v10 = [(PXCMMWorkflowCoordinator *)self workflowViewControllerWithSession:v9 embedInNavigationControllerOfClass:a4 assetActionManager:0 assetCollectionActionManager:0 photosViewConfigurationBlock:v8];

  return v10;
}

- (id)workflowViewControllerWithContext:(id)a3 embedInNavigationControllerOfClass:(Class)a4
{
  id v6 = [a3 createSession];
  id v7 = [(PXCMMWorkflowCoordinator *)self workflowViewControllerWithSession:v6 embedInNavigationControllerOfClass:a4 assetActionManager:0 assetCollectionActionManager:0 photosViewConfigurationBlock:0];

  return v7;
}

- (id)workflowViewControllerWithContext:(id)a3
{
  id v4 = [a3 createSession];
  id v5 = [(PXCMMWorkflowCoordinator *)self workflowViewControllerWithSession:v4 embedInNavigationControllerOfClass:0 assetActionManager:0 assetCollectionActionManager:0 photosViewConfigurationBlock:0];

  return v5;
}

@end