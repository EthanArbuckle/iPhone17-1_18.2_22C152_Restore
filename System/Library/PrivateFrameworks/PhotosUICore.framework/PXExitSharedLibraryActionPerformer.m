@interface PXExitSharedLibraryActionPerformer
- (BOOL)shouldConfirmExit;
- (PXExitSharedLibraryActionPerformer)init;
- (PXSharedLibrary)sharedLibraryOrPreview;
- (int64_t)exitRetentionPolicy;
- (void)_beginExitWithExitAssistantViewController:(id)a3 dismissalHandler:(id)a4;
- (void)_handlePresentationErrorWithDismissalHandler:(id)a3;
- (void)_performExitWithExitAssistantViewController:(id)a3 dismissalHandler:(id)a4;
- (void)_presentFailureAlertForSharedLibraryOrPreview:(id)a3 error:(id)a4 dismissalHandler:(id)a5;
- (void)cancelExitAssistantViewController:(id)a3;
- (void)completeExitAssistantViewController:(id)a3 withExitRetentionPolicy:(int64_t)a4;
- (void)performActionWithSharedLibraryOrPreview:(id)a3 shouldConfirmExit:(BOOL)a4 exitRetentionPolicy:(int64_t)a5 presentationEnvironment:(id)a6 completionHandler:(id)a7;
- (void)performUserInteractionTask;
- (void)setExitRetentionPolicy:(int64_t)a3;
- (void)setSharedLibraryOrPreview:(id)a3;
- (void)setShouldConfirmExit:(BOOL)a3;
@end

@implementation PXExitSharedLibraryActionPerformer

- (void).cxx_destruct
{
}

- (void)setExitRetentionPolicy:(int64_t)a3
{
  self->_exitRetentionPolicy = a3;
}

- (int64_t)exitRetentionPolicy
{
  return self->_exitRetentionPolicy;
}

- (void)setShouldConfirmExit:(BOOL)a3
{
  self->_shouldConfirmExit = a3;
}

- (BOOL)shouldConfirmExit
{
  return self->_shouldConfirmExit;
}

- (void)setSharedLibraryOrPreview:(id)a3
{
}

- (PXSharedLibrary)sharedLibraryOrPreview
{
  return self->_sharedLibraryOrPreview;
}

- (void)completeExitAssistantViewController:(id)a3 withExitRetentionPolicy:(int64_t)a4
{
  id v6 = a3;
  [(PXExitSharedLibraryActionPerformer *)self setExitRetentionPolicy:a4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __98__PXExitSharedLibraryActionPerformer_completeExitAssistantViewController_withExitRetentionPolicy___block_invoke;
  v8[3] = &unk_1E5DD2570;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(PXExitSharedLibraryActionPerformer *)self _beginExitWithExitAssistantViewController:v7 dismissalHandler:v8];
}

void __98__PXExitSharedLibraryActionPerformer_completeExitAssistantViewController_withExitRetentionPolicy___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __98__PXExitSharedLibraryActionPerformer_completeExitAssistantViewController_withExitRetentionPolicy___block_invoke_2;
  v9[3] = &unk_1E5DD21E8;
  char v11 = a2;
  v9[4] = v7;
  id v10 = v5;
  id v8 = v5;
  [v7 dismissViewController:v6 completionHandler:v9];
}

uint64_t __98__PXExitSharedLibraryActionPerformer_completeExitAssistantViewController_withExitRetentionPolicy___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 40)];
}

- (void)cancelExitAssistantViewController:(id)a3
{
  id v4 = a3;
  id v5 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Exit assistant cancelled by the user", buf, 2u);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__PXExitSharedLibraryActionPerformer_cancelExitAssistantViewController___block_invoke;
  v6[3] = &unk_1E5DD36F8;
  v6[4] = self;
  [(PXActionPerformer *)self dismissViewController:v4 completionHandler:v6];
}

void __72__PXExitSharedLibraryActionPerformer_cancelExitAssistantViewController___block_invoke(uint64_t a1)
{
  PXSharedLibraryUserCanceledErrorWithDebugDescription(@"Exit Shared Library");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:v2];
}

- (void)_performExitWithExitAssistantViewController:(id)a3 dismissalHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Exit assistant confirmation alert confirmed by the user", buf, 2u);
  }

  id v9 = [(PXExitSharedLibraryActionPerformer *)self sharedLibraryOrPreview];
  int v10 = [v9 isInPreview];
  [v6 setDisableControlsWithBusyIndicator:1];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__PXExitSharedLibraryActionPerformer__performExitWithExitAssistantViewController_dismissalHandler___block_invoke;
  aBlock[3] = &unk_1E5DC3808;
  id v11 = v6;
  id v22 = v11;
  char v26 = v10;
  id v12 = v9;
  id v23 = v12;
  id v13 = v7;
  v24 = self;
  id v25 = v13;
  v14 = _Block_copy(aBlock);
  v15 = [(PXActionPerformer *)self presentationEnvironment];
  if (v10)
  {
    v16 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v12;
      _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEFAULT, "Exit assistant will exit shared library preview: %@", buf, 0xCu);
    }

    [v12 exitPreviewWithPresentationEnvironment:v15 completion:v14];
  }
  else
  {
    unint64_t v17 = [(PXExitSharedLibraryActionPerformer *)self exitRetentionPolicy];
    v18 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = PXSharedLibraryExitRetentionPolicyDescription(v17);
      *(_DWORD *)buf = 138412546;
      id v28 = v12;
      __int16 v29 = 2114;
      v30 = v19;
      _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEFAULT, "Exit assistant will exit shared library: %@ with policy: %{public}@", buf, 0x16u);
    }
    v20 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
    [v12 exitWithRetentionPolicy:v17 presentationEnvironment:v15 progress:v20 completion:v14];
  }
}

void __99__PXExitSharedLibraryActionPerformer__performExitWithExitAssistantViewController_dismissalHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [*(id *)(a1 + 32) setDisableControlsWithBusyIndicator:0];
  if (*(unsigned char *)(a1 + 64)) {
    id v6 = @" preview";
  }
  else {
    id v6 = &stru_1F00B0030;
  }
  id v7 = v6;
  if (a2)
  {
    id v8 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v16 = 138412546;
      unint64_t v17 = v7;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Exit assistant successfully exited shared library%@: %@", (uint8_t *)&v16, 0x16u);
    }

    if (!*(unsigned char *)(a1 + 64)) {
      PXPreferencesResetCameraSharingPreferences();
    }
    int v10 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_14:
    v10();
    goto LABEL_18;
  }
  int IsUserCanceledError = PXSharedLibraryIsUserCanceledError(v5);
  id v12 = PLSharedLibraryGetLog();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (IsUserCanceledError)
  {
    if (v13)
    {
      uint64_t v14 = *(void *)(a1 + 40);
      int v16 = 138412802;
      unint64_t v17 = v7;
      __int16 v18 = 2112;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "User canceled exit assistant for shared library%@: %@, error: %@", (uint8_t *)&v16, 0x20u);
    }

    int v10 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_14;
  }
  if (v13)
  {
    uint64_t v15 = *(void *)(a1 + 40);
    int v16 = 138412802;
    unint64_t v17 = v7;
    __int16 v18 = 2112;
    uint64_t v19 = v15;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "Exit assistant failed to exit shared library%@: %@, error: %@", (uint8_t *)&v16, 0x20u);
  }

  [*(id *)(a1 + 48) _presentFailureAlertForSharedLibraryOrPreview:*(void *)(a1 + 40) error:v5 dismissalHandler:*(void *)(a1 + 56)];
LABEL_18:
}

- (void)_beginExitWithExitAssistantViewController:(id)a3 dismissalHandler:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = PXSharedLibraryExitRetentionPolicyDescription([(PXExitSharedLibraryActionPerformer *)self exitRetentionPolicy]);
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v9;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Exit assistant completed successfully with exitRetentionPolicy: %{public}@", buf, 0xCu);
  }
  if (!self->_shouldConfirmExit)
  {
    [(PXExitSharedLibraryActionPerformer *)self _performExitWithExitAssistantViewController:v6 dismissalHandler:v7];
    goto LABEL_29;
  }
  int v10 = [(PXExitSharedLibraryActionPerformer *)self sharedLibraryOrPreview];
  if (![v10 isInPreview])
  {
    uint64_t v38 = 0;
    *(void *)buf = 0;
    uint64_t v14 = [v10 sourceLibraryInfo];
    objc_msgSend(v14, "fetchEstimatedAssetsCountsForExit:imageCount:videoCount:audioCount:itemCount:", -[PXExitSharedLibraryActionPerformer exitRetentionPolicy](self, "exitRetentionPolicy") == 1, buf, &v38, 0, 0);

    uint64_t v15 = [v10 owner];
    int v16 = [v15 isCurrentUser];

    if (v16) {
      unint64_t v17 = @"PXSharedLibraryExit_Confirmation_Owner_Title";
    }
    else {
      unint64_t v17 = @"PXSharedLibraryExit_Confirmation_Participant_Title";
    }
    BOOL v13 = PXLocalizedSharedLibraryString(v17);
    if (*(void *)buf && v38)
    {
      __int16 v18 = PXLocalizedSharedLibraryString(@"PXSharedLibraryExit_Confirmation_Message_%lu_Photos_%lu_Videos");
      uint64_t v19 = v18;
      __int16 v20 = @"%lu %lu";
    }
    else
    {
      if (*(void *)buf)
      {
        __int16 v18 = PXLocalizedSharedLibraryString(@"PXSharedLibraryExit_Confirmation_Message_%lu_Photos");
        uint64_t v19 = v18;
      }
      else
      {
        if (!v38)
        {
          id v11 = 0;
          goto LABEL_19;
        }
        __int16 v18 = PXLocalizedSharedLibraryString(@"PXSharedLibraryExit_Confirmation_Message_%lu_Videos");
        uint64_t v19 = v18;
      }
      __int16 v20 = @"%lu";
    }
    id v11 = PXLocalizedStringWithValidatedFormat(v18, v20);

LABEL_19:
    if (v16) {
      id v21 = @"PXSharedLibraryExit_Confirmation_Owner_Button_Title";
    }
    else {
      id v21 = @"PXSharedLibraryExit_Confirmation_Participant_Button_Title";
    }
    id v12 = PXLocalizedSharedLibraryString(v21);
    goto LABEL_23;
  }
  id v11 = PXLocalizedSharedLibraryString(@"PXSharedLibraryExit_Confirmation_Preview_Message_iOS");
  id v12 = PXLocalizedSharedLibraryString(@"PXSharedLibraryExit_Confirmation_Preview_Button_Title");
  BOOL v13 = 0;
LABEL_23:
  uint64_t v22 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __97__PXExitSharedLibraryActionPerformer__beginExitWithExitAssistantViewController_dismissalHandler___block_invoke;
  v30[3] = &unk_1E5DC37E0;
  id v31 = v13;
  id v32 = v11;
  id v33 = v6;
  id v34 = v22;
  id v35 = v12;
  v36 = self;
  id v23 = v7;
  id v37 = v23;
  id v24 = v12;
  id v25 = v22;
  id v26 = v11;
  id v27 = v13;
  id v28 = [(PXActionPerformer *)self presentAlertWithConfigurationHandler:v30];

  if (v28)
  {
    __int16 v29 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v29, OS_LOG_TYPE_DEFAULT, "Did present the exit assistant confirmation alert", buf, 2u);
    }
  }
  else
  {
    [(PXExitSharedLibraryActionPerformer *)self _handlePresentationErrorWithDismissalHandler:v23];
  }

LABEL_29:
}

void __97__PXExitSharedLibraryActionPerformer__beginExitWithExitAssistantViewController_dismissalHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setTitle:v3];
  [v4 setMessage:*(void *)(a1 + 40)];
  [v4 setStyle:0];
  id v5 = [*(id *)(a1 + 48) exitButtonSourceItem];
  [v4 setSourceItem:v5];

  [v4 addActionWithTitle:*(void *)(a1 + 56) style:1 action:&__block_literal_global_192241];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __97__PXExitSharedLibraryActionPerformer__beginExitWithExitAssistantViewController_dismissalHandler___block_invoke_255;
  v7[3] = &unk_1E5DD0E78;
  uint64_t v6 = *(void *)(a1 + 64);
  v7[4] = *(void *)(a1 + 72);
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 80);
  [v4 addActionWithTitle:v6 style:2 action:v7];
}

uint64_t __97__PXExitSharedLibraryActionPerformer__beginExitWithExitAssistantViewController_dismissalHandler___block_invoke_255(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performExitWithExitAssistantViewController:*(void *)(a1 + 40) dismissalHandler:*(void *)(a1 + 48)];
}

void __97__PXExitSharedLibraryActionPerformer__beginExitWithExitAssistantViewController_dismissalHandler___block_invoke_2()
{
  v0 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A9AE7000, v0, OS_LOG_TYPE_DEFAULT, "Exit assistant confirmation alert cancelled by the user", v1, 2u);
  }
}

- (void)_presentFailureAlertForSharedLibraryOrPreview:(id)a3 error:(id)a4 dismissalHandler:(id)a5
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PXLocalizedSharedLibraryString(@"PXSharedLibraryGenericFailureAlertMessage");
  id v12 = "TTRWorkflowBuilder";
  if ([v8 isInPreview])
  {
    BOOL v13 = PXLocalizedSharedLibraryString(@"PXSharedLibraryExit_Error_Preview_Title");
    uint64_t v14 = 0;
  }
  else
  {
    __int16 v29 = self;
    uint64_t v15 = [v8 owner];
    int v16 = [v15 isCurrentUser];

    if (v16) {
      unint64_t v17 = @"PXSharedLibraryExit_Error_Owner_Title";
    }
    else {
      unint64_t v17 = @"PXSharedLibraryExit_Error_Participant_Title";
    }
    BOOL v13 = PXLocalizedSharedLibraryString(v17);
    __int16 v18 = [v8 sourceLibraryInfo];
    id v36 = 0;
    id v35 = 0;
    int v19 = [v18 presentServerGeneratedMessageForError:v9 customMessage:&v36 learnMoreURL:&v35];
    id v20 = v36;
    id v21 = v35;
    if (v19)
    {
      id v28 = v20;

      if (v21)
      {
        uint64_t v22 = PXLocalizedSharedLibraryString(@"PXSharedLibraryExitFailureLearnMoreActionTitle");
        id v23 = [PXAlertAction alloc];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __107__PXExitSharedLibraryActionPerformer__presentFailureAlertForSharedLibraryOrPreview_error_dismissalHandler___block_invoke;
        v33[3] = &unk_1E5DD36F8;
        id v34 = v21;
        id v24 = [(PXAlertAction *)v23 initWithTitle:v22 style:0 action:v33];
        v37[0] = v24;
        uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
      }
      else
      {
        uint64_t v14 = 0;
      }
      id v11 = v28;
      self = v29;
    }
    else
    {
      uint64_t v14 = 0;
      self = v29;
    }

    id v12 = "TTRWorkflowBuilder";
  }
  id v25 = [(PXActionPerformer *)self presentationEnvironment];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = *((void *)v12 + 415);
  v30[2] = __107__PXExitSharedLibraryActionPerformer__presentFailureAlertForSharedLibraryOrPreview_error_dismissalHandler___block_invoke_2;
  v30[3] = &unk_1E5DD3280;
  id v31 = v9;
  id v32 = v10;
  id v26 = v10;
  id v27 = v9;
  PXPresentFailureWithLocalizedTitle(v13, v11, v14, v27, v25, v30);
}

void __107__PXExitSharedLibraryActionPerformer__presentFailureAlertForSharedLibraryOrPreview_error_dismissalHandler___block_invoke(uint64_t a1)
{
}

void __107__PXExitSharedLibraryActionPerformer__presentFailureAlertForSharedLibraryOrPreview_error_dismissalHandler___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 description];
  id v5 = (void *)v4;
  uint64_t v6 = &stru_1F00B0030;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  objc_msgSend(v2, "px_errorWithDomain:code:underlyingError:debugDescription:", @"PXSharedLibraryErrorDomain", -1000, v3, @"%@", v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_handlePresentationErrorWithDismissalHandler:(id)a3
{
  id v3 = a3;
  PXAssertGetLog();
}

- (void)performUserInteractionTask
{
  id v3 = [(PXExitSharedLibraryActionPerformer *)self sharedLibraryOrPreview];
  int64_t v4 = [(PXExitSharedLibraryActionPerformer *)self exitRetentionPolicy];
  if (([v3 isInPreview] & 1) != 0 || v4)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__PXExitSharedLibraryActionPerformer_performUserInteractionTask__block_invoke;
    v12[3] = &unk_1E5DD3158;
    v12[4] = self;
    [(PXExitSharedLibraryActionPerformer *)self _beginExitWithExitAssistantViewController:0 dismissalHandler:v12];
  }
  else
  {
    id v5 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Present exit assistant", buf, 2u);
    }

    uint64_t v6 = [v3 sourceLibraryInfo];
    uint64_t v15 = 0;
    *(void *)buf = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    [v6 fetchEstimatedAssetsCountsForExit:0 imageCount:buf videoCount:&v15 audioCount:&v14 itemCount:&v13];
    id v7 = PLLocalizedCountDescription();
    [v6 fetchEstimatedAssetsCountsForExit:1 imageCount:buf videoCount:&v15 audioCount:&v14 itemCount:&v13];
    id v8 = PLLocalizedCountDescription();
    id v9 = [PXSharedLibraryExitAssistantViewController alloc];
    id v10 = [v3 owner];
    id v11 = -[PXSharedLibraryExitAssistantViewController initWithOwnerAsCurrentUser:keepAllCountsString:contributedOnlyCountsString:](v9, "initWithOwnerAsCurrentUser:keepAllCountsString:contributedOnlyCountsString:", [v10 isCurrentUser], v7, v8);

    [(PXSharedLibraryExitAssistantViewController *)v11 setDelegate:self];
    if (![(PXActionPerformer *)self presentViewController:v11]) {
      PXAssertGetLog();
    }
  }
}

uint64_t __64__PXExitSharedLibraryActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:a2 error:a3];
}

- (void)performActionWithSharedLibraryOrPreview:(id)a3 shouldConfirmExit:(BOOL)a4 exitRetentionPolicy:(int64_t)a5 presentationEnvironment:(id)a6 completionHandler:(id)a7
{
  BOOL v10 = a4;
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  if (!v13)
  {
    int v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXExitSharedLibraryActionPerformer.m", 63, @"Invalid parameter not satisfying: %@", @"sharedLibraryOrPreview" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXExitSharedLibraryActionPerformer.m", 64, @"Invalid parameter not satisfying: %@", @"presentationEnvironment" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v14) {
    goto LABEL_5;
  }
LABEL_3:
  [(PXExitSharedLibraryActionPerformer *)self setSharedLibraryOrPreview:v13];
  [(PXExitSharedLibraryActionPerformer *)self setShouldConfirmExit:v10];
  [(PXExitSharedLibraryActionPerformer *)self setExitRetentionPolicy:a5];
  [(PXActionPerformer *)self setPresentationEnvironment:v14];
  v18.receiver = self;
  v18.super_class = (Class)PXExitSharedLibraryActionPerformer;
  [(PXActionPerformer *)&v18 performActionWithCompletionHandler:v15];
}

- (PXExitSharedLibraryActionPerformer)init
{
  id v3 = (objc_class *)objc_opt_class();
  int64_t v4 = NSStringFromClass(v3);
  v7.receiver = self;
  v7.super_class = (Class)PXExitSharedLibraryActionPerformer;
  id v5 = [(PXActionPerformer *)&v7 initWithActionType:v4];

  return v5;
}

@end