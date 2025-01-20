@interface PXCMMPhotoKitPublishMomentShareActionPerformer
+ (void)budgetOverridePromptAlertKeysForConfiguration:(id)a3 messageKey:(id *)a4 actionKey:(id *)a5;
- (void)_acceptSuggestion:(id)a3 completionHandler:(id)a4;
- (void)_budgetOverridePromptForMomentShare:(id)a3 completedWithOutcome:(BOOL)a4 error:(id)a5;
- (void)_createMomentShare;
- (void)_createMomentShareWithCompletionHandler:(id)a3;
- (void)_creatingMomentShareDidCompleteWithMomentShare:(id)a3 error:(id)a4;
- (void)_finalizePublishWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_handleSharingProgressCancellation;
- (void)_performCleanupIfNeeded;
- (void)_presentAlertControllerForCurrentCPLStateIfNeededWithCompletionHandler:(id)a3;
- (void)_presentBudgetOverridePromptForMomentShare:(id)a3 completionHandler:(id)a4;
- (void)_presentInternalSharingAlert;
- (void)_presentSharingProgressAlertController;
- (void)_publishMomentShare:(id)a3;
- (void)_publishMomentShare:(id)a3 completionHandler:(id)a4;
- (void)_publishingMomentShare:(id)a3 didCompleteWithShareURL:(id)a4 error:(id)a5;
- (void)_requestPreviewImageForAsset:(id)a3 resultHandler:(id)a4;
- (void)performUserInteractionTask;
@end

@implementation PXCMMPhotoKitPublishMomentShareActionPerformer

+ (void)budgetOverridePromptAlertKeysForConfiguration:(id)a3 messageKey:(id *)a4 actionKey:(id *)a5
{
  id v23 = a3;
  if (a4)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"PXCMMPhotoKitPublishMomentShareActionPerformer.m", 473, @"Invalid parameter not satisfying: %@", @"outMessageKey" object file lineNumber description];

    if (a5) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, a1, @"PXCMMPhotoKitPublishMomentShareActionPerformer.m", 474, @"Invalid parameter not satisfying: %@", @"outActionKey" object file lineNumber description];

LABEL_3:
  uint64_t v9 = [v23 networkType];
  int v10 = [v23 useWLAN];
  unint64_t v11 = [v23 assetCount];
  if (v10) {
    v12 = @"WLAN";
  }
  else {
    v12 = @"WIFI";
  }
  v13 = @"Single";
  if (v11 > 1) {
    v13 = @"Multiple";
  }
  v14 = v13;
  v15 = v12;
  v16 = [v23 deviceModel];
  v17 = [NSString stringWithFormat:@"PXCMMBudgetOverridePromptMessage_%@_%@_%@", v15, v14, v16];

  if (v9 == 2)
  {
    uint64_t v18 = [v17 stringByAppendingString:@"_Connected"];

    v19 = @"PXCMMBudgetOverridePromptButtonTitle_OverrideOnWifi";
    v17 = (void *)v18;
  }
  else
  {
    v19 = @"PXCMMBudgetOverridePromptButtonTitle_Override";
  }
  id v20 = v17;
  *a4 = v20;
  *a5 = v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedDate, 0);
  objc_storeStrong((id *)&self->_publishStartDate, 0);
  objc_storeStrong((id *)&self->_creationRequestStartDate, 0);
  objc_storeStrong((id *)&self->_previewRequestStartDate, 0);
  objc_storeStrong((id *)&self->_initialStartDate, 0);
  objc_storeStrong((id *)&self->_momentShare, 0);
  objc_storeStrong((id *)&self->_progressAlertToken, 0);
}

- (void)_performCleanupIfNeeded
{
  momentShare = self->_momentShare;
  if (momentShare) {
    PXExpungeMomentShare(momentShare, 0);
  }
}

- (void)_handleSharingProgressCancellation
{
  v3 = [MEMORY[0x1E4F390D0] defaultManager];
  [v3 cancelImageRequest:self->_thumbnailRequestID];

  v4 = [MEMORY[0x1E4F390D0] defaultManager];
  [v4 cancelImageRequest:self->_previewRequestID];

  progressAlertToken = self->_progressAlertToken;
  self->_progressAlertToken = 0;

  objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1001, @"Action Performer was cancelled");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(PXCMMPhotoKitPublishMomentShareActionPerformer *)self _finalizePublishWithSuccess:0 error:v6];
}

- (void)_presentAlertControllerForCurrentCPLStateIfNeededWithCompletionHandler:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(void))a3;
  momentShare = self->_momentShare;
  id v6 = [MEMORY[0x1E4F8AA90] sharedBundleController];
  v7 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
  v8 = [v7 libraryURL];
  uint64_t v9 = [v6 openBundleAtLibraryURL:v8];

  int v10 = [v9 indicatorFileCoordinator];
  if ([v10 isUserPause])
  {
    char v11 = 0;
    if (!momentShare) {
      goto LABEL_11;
    }
  }
  else
  {
    v12 = +[PXCompleteMyMomentSettings sharedInstance];
    char v13 = [v12 simulateCPLAlertOnPublish];

    char v11 = v13 ^ 1;
    if (!momentShare)
    {
LABEL_11:
      v4[2](v4);
      goto LABEL_12;
    }
  }
  if (v11) {
    goto LABEL_11;
  }
  uint64_t v14 = PXLocalizedStringFromTable(@"PXCMMUploadingPausedAlertTitle", @"PhotosUICore");
  uint64_t v15 = PXLocalizedStringFromTable(@"PXCMMUploadingPausedUserInteractionMessage", @"PhotosUICore");
  PXLocalizedStringFromTable(@"PXCMMUploadingPausedResumeButtonTitle", @"PhotosUICore");
  v28 = self;
  uint64_t v17 = v16 = v9;
  uint64_t v18 = PXLocalizedStringFromTable(@"PXCMMUploadingPausedUploadLaterButtonTitle", @"PhotosUICore");
  v30 = (void *)v15;
  v31 = (void *)v14;
  v19 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v14 message:v15 preferredStyle:1];
  id v20 = (void *)MEMORY[0x1E4FB1410];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __121__PXCMMPhotoKitPublishMomentShareActionPerformer__presentAlertControllerForCurrentCPLStateIfNeededWithCompletionHandler___block_invoke;
  v34[3] = &unk_1E5DCE788;
  v21 = v4;
  id v35 = v21;
  v29 = (void *)v17;
  uint64_t v22 = v17;
  uint64_t v9 = v16;
  id v23 = [v20 actionWithTitle:v22 style:0 handler:v34];
  [v19 addAction:v23];

  v24 = (void *)MEMORY[0x1E4FB1410];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __121__PXCMMPhotoKitPublishMomentShareActionPerformer__presentAlertControllerForCurrentCPLStateIfNeededWithCompletionHandler___block_invoke_2;
  v32[3] = &unk_1E5DCE788;
  v25 = v21;
  id v33 = v25;
  v26 = [v24 actionWithTitle:v18 style:0 handler:v32];
  [v19 addAction:v26];

  if (![(PXActionPerformer *)v28 presentViewController:v19])
  {
    v27 = PLSharingGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = @"YES";
      _os_log_impl(&dword_1A9AE7000, v27, OS_LOG_TYPE_ERROR, "Failed to present CPL uploading status alert after publishing: isUserPaused:%@", buf, 0xCu);
    }

    v25[2](v25);
  }

LABEL_12:
}

void __121__PXCMMPhotoKitPublishMomentShareActionPerformer__presentAlertControllerForCurrentCPLStateIfNeededWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F39228] systemPhotoLibraryURL];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F39228]) initWithPhotoLibraryURL:v5];
  v3 = [v2 assetsdClient];
  v4 = [v3 cloudInternalClient];
  [v4 setCloudPhotoLibraryPauseState:0 reason:3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __121__PXCMMPhotoKitPublishMomentShareActionPerformer__presentAlertControllerForCurrentCPLStateIfNeededWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_finalizePublishWithSuccess:(BOOL)a3 error:(id)a4
{
  id v6 = a4;
  if (self->_didFinalize) {
    PXAssertGetLog();
  }
  self->_didFinalize = 1;
  if (!a3) {
    [(PXCMMPhotoKitPublishMomentShareActionPerformer *)self _performCleanupIfNeeded];
  }
  if (self->_progressAlertToken)
  {
    v7 = [(PXActionPerformer *)self presentationEnvironment];
    progressAlertToken = self->_progressAlertToken;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __84__PXCMMPhotoKitPublishMomentShareActionPerformer__finalizePublishWithSuccess_error___block_invoke;
    v12[3] = &unk_1E5DD21E8;
    v12[4] = self;
    BOOL v14 = a3;
    id v13 = v6;
    PXSharedLibraryDismissProgressAlertWithPresentationEnvironment(progressAlertToken, v7, v12);
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __84__PXCMMPhotoKitPublishMomentShareActionPerformer__finalizePublishWithSuccess_error___block_invoke_3;
    v9[3] = &unk_1E5DD21E8;
    v9[4] = self;
    BOOL v11 = a3;
    id v10 = v6;
    [(PXCMMPhotoKitPublishMomentShareActionPerformer *)self _presentAlertControllerForCurrentCPLStateIfNeededWithCompletionHandler:v9];
  }
}

void __84__PXCMMPhotoKitPublishMomentShareActionPerformer__finalizePublishWithSuccess_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  *(void *)(v2 + 104) = 0;

  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__PXCMMPhotoKitPublishMomentShareActionPerformer__finalizePublishWithSuccess_error___block_invoke_2;
  v5[3] = &unk_1E5DD21E8;
  v5[4] = v4;
  char v7 = *(unsigned char *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  [v4 _presentAlertControllerForCurrentCPLStateIfNeededWithCompletionHandler:v5];
}

uint64_t __84__PXCMMPhotoKitPublishMomentShareActionPerformer__finalizePublishWithSuccess_error___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 40)];
}

uint64_t __84__PXCMMPhotoKitPublishMomentShareActionPerformer__finalizePublishWithSuccess_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 40)];
}

- (void)_acceptSuggestion:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  char v7 = PLSharingGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v5;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "Publishing performer: Will mark suggestion as accepted: %@", buf, 0xCu);
  }

  v8 = [v5 photoLibrary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__PXCMMPhotoKitPublishMomentShareActionPerformer__acceptSuggestion_completionHandler___block_invoke;
  v14[3] = &unk_1E5DD36F8;
  id v15 = v5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__PXCMMPhotoKitPublishMomentShareActionPerformer__acceptSuggestion_completionHandler___block_invoke_2;
  v11[3] = &unk_1E5DD2B90;
  id v12 = v15;
  id v13 = v6;
  id v9 = v6;
  id v10 = v15;
  [v8 performChanges:v14 completionHandler:v11];
}

void __86__PXCMMPhotoKitPublishMomentShareActionPerformer__acceptSuggestion_completionHandler___block_invoke(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F39318] changeRequestForSuggestion:*(void *)(a1 + 32)];
  [v1 markAccepted];
}

void __86__PXCMMPhotoKitPublishMomentShareActionPerformer__acceptSuggestion_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PLSharingGetLog();
  char v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v15 = 138412290;
      uint64_t v16 = v8;
      id v9 = "Publishing performer: Did mark suggestion as accepted: %@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v10, v11, v9, (uint8_t *)&v15, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v15 = 138412546;
    uint64_t v16 = v13;
    __int16 v17 = 2112;
    id v18 = v5;
    id v9 = "Publishing performer: Failed to mark suggestion as accepted: %@, error: %@";
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_6;
  }

  (*(void (**)(void, uint64_t, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, v5, v14);
}

- (void)_publishingMomentShare:(id)a3 didCompleteWithShareURL:(id)a4 error:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint32_t v12 = [(PXCMMActionPerformer *)self progress];
  int v13 = [v12 isCancelled];

  if (v13)
  {
    [(PXCMMPhotoKitPublishMomentShareActionPerformer *)self _performCleanupIfNeeded];
    goto LABEL_13;
  }
  if (!v10)
  {
    [(PXCMMPhotoKitPublishMomentShareActionPerformer *)self _finalizePublishWithSuccess:0 error:v11];
    goto LABEL_13;
  }
  uint64_t v14 = PLSharingGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = objc_msgSend(v10, "pl_redactedShareURL");
    *(_DWORD *)buf = 138543618;
    v30 = v15;
    __int16 v31 = 2112;
    id v32 = v11;
    _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEFAULT, "Publishing performer: Publish Moment Share succeeded with URL: %{public}@ error: %@", buf, 0x16u);
  }
  [(PXCMMPublishActionPerformer *)self setPublishedURL:v10];
  uint64_t v16 = [(PXCMMActionPerformer *)self session];
  __int16 v17 = [v16 viewModel];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __103__PXCMMPhotoKitPublishMomentShareActionPerformer__publishingMomentShare_didCompleteWithShareURL_error___block_invoke;
  v26[3] = &unk_1E5DB7C08;
  id v27 = v10;
  id v28 = v9;
  [v17 performChanges:v26];

  id v18 = [(PXCMMActionPerformer *)self session];
  if (!v18)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = (objc_class *)objc_opt_class();
    uint64_t v22 = NSStringFromClass(v21);
    [v20 handleFailureInMethod:a2, self, @"PXCMMPhotoKitPublishMomentShareActionPerformer.m", 695, @"%@ should be an instance inheriting from %@, but it is nil", @"self.session", v22 object file lineNumber description];
LABEL_16:

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    id v23 = (objc_class *)objc_opt_class();
    uint64_t v22 = NSStringFromClass(v23);
    v24 = objc_msgSend(v18, "px_descriptionForAssertionMessage");
    [v20 handleFailureInMethod:a2, self, @"PXCMMPhotoKitPublishMomentShareActionPerformer.m", 695, @"%@ should be an instance inheriting from %@, but it is %@", @"self.session", v22, v24 object file lineNumber description];

    goto LABEL_16;
  }
LABEL_8:
  uint64_t v19 = [v18 suggestion];
  if (v19)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __103__PXCMMPhotoKitPublishMomentShareActionPerformer__publishingMomentShare_didCompleteWithShareURL_error___block_invoke_2;
    v25[3] = &unk_1E5DD3158;
    v25[4] = self;
    [(PXCMMPhotoKitPublishMomentShareActionPerformer *)self _acceptSuggestion:v19 completionHandler:v25];
  }
  else
  {
    [(PXCMMPhotoKitPublishMomentShareActionPerformer *)self _finalizePublishWithSuccess:1 error:0];
  }

LABEL_13:
}

void __103__PXCMMPhotoKitPublishMomentShareActionPerformer__publishingMomentShare_didCompleteWithShareURL_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setShareURL:v3];
  id v5 = [*(id *)(a1 + 40) uuid];
  [v4 setShareUUID:v5];
}

void __103__PXCMMPhotoKitPublishMomentShareActionPerformer__publishingMomentShare_didCompleteWithShareURL_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  px_dispatch_on_main_queue();
}

uint64_t __103__PXCMMPhotoKitPublishMomentShareActionPerformer__publishingMomentShare_didCompleteWithShareURL_error___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finalizePublishWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 40)];
}

- (void)_publishMomentShare:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = (void (**)(id, void *, void))a4;
  uint64_t v8 = +[PXCompleteMyMomentSettings sharedInstance];
  int v9 = [v8 simulateMomentShareCreationError];

  id v10 = +[PXSharingSettings sharedInstance];
  int v11 = [v10 simulateError];

  uint32_t v12 = +[PXCompleteMyMomentSettings sharedInstance];
  int v13 = [v12 fakeMomentShareURL];

  if (v13)
  {
    uint64_t v14 = [v6 localIdentifier];
    int v15 = PXURLForCMMShare(0, v14);

    v7[2](v7, v15, 0);
    goto LABEL_21;
  }
  if ((v9 | v11) == 1)
  {
    uint64_t v16 = +[PXSharingSettings sharedInstance];
    int v17 = [v16 simulateUserCloudNotAuthenticated];

    if (v17)
    {
      id v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = @"CloudPhotoLibraryErrorDomain";
      id v20 = @"Simulated \"user needs to verify iCloud Terms and Conditions\" error, for debugging.";
      uint64_t v21 = 1006;
    }
    else
    {
      if (v11)
      {
        id v18 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v19 = @"PXSharingSettingsErrorDomain";
        id v20 = @"Simulated error, because PXSharingSettings.simulateError is YES";
      }
      else
      {
        if (!v9)
        {
          id v27 = 0;
          goto LABEL_18;
        }
        id v18 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v19 = @"PXCompleteMyMomentSettingsErrorDomain";
        id v20 = @"Simulated error, because PXCompleteMyMomentSettings.simulateMomentShareCreationError is YES";
      }
      uint64_t v21 = 0;
    }
    id v27 = objc_msgSend(v18, "px_errorWithDomain:code:debugDescription:", v19, v21, v20);
LABEL_18:
    id v28 = PLSharingGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = v27;
      _os_log_impl(&dword_1A9AE7000, v28, OS_LOG_TYPE_DEFAULT, "Publishing performer: Simulating an error due to internal settings: %{public}@", buf, 0xCu);
    }

    ((void (**)(id, void *, void *))v7)[2](v7, 0, v27);
    goto LABEL_21;
  }
  PLSharingGetLog();
  uint64_t v22 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v23 = os_signpost_id_make_with_pointer(v22, self);
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v24 = v23;
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v24, "ActionPerformerMomentSharePublishPublishing", " enableTelemetry=YES ", buf, 2u);
    }
  }

  v25 = PLSharingGetLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = [v6 localIdentifier];
    *(_DWORD *)buf = 138412290;
    uint64_t v33 = v26;
    _os_log_impl(&dword_1A9AE7000, v25, OS_LOG_TYPE_DEFAULT, "Publishing performer: Will publish moment share %@", buf, 0xCu);
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __88__PXCMMPhotoKitPublishMomentShareActionPerformer__publishMomentShare_completionHandler___block_invoke;
  v29[3] = &unk_1E5DB7BE0;
  v29[4] = self;
  id v30 = v6;
  __int16 v31 = v7;
  [v30 publishMomentShareWithCompletionHandler:v29];

LABEL_21:
}

void __88__PXCMMPhotoKitPublishMomentShareActionPerformer__publishMomentShare_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  PLSharingGetLog();
  char v7 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, *(const void **)(a1 + 32));
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = v8;
    if (os_signpost_enabled(v7))
    {
      LOWORD(v33) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_END, v9, "ActionPerformerMomentSharePublishPublishing", " enableTelemetry=YES ", (uint8_t *)&v33, 2u);
    }
  }

  id v10 = PLSharingGetLog();
  int v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = *(void **)(v14 + 168);
      *(void *)(v14 + 168) = v13;

      [v13 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 160)];
      int v33 = 138412546;
      uint64_t v34 = v12;
      __int16 v35 = 2048;
      uint64_t v36 = v16;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "Publishing performer: %@ Did publish moment share in %f seconds.", (uint8_t *)&v33, 0x16u);
    }

    int v17 = PLSharingGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [*(id *)(a1 + 40) localIdentifier];
      int v33 = 138412290;
      uint64_t v34 = (uint64_t)v18;
      _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_DEFAULT, "=== Publishing summary of moment share: %@ ===", (uint8_t *)&v33, 0xCu);
    }
    uint64_t v19 = PLSharingGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [*(id *)(a1 + 40) assetCount];
      int v33 = 134217984;
      uint64_t v34 = v20;
      _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_DEFAULT, "> Number of assets: %lu", (uint8_t *)&v33, 0xCu);
    }

    uint64_t v21 = PLSharingGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(*(void *)(a1 + 32) + 144) timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 136)];
      int v33 = 134217984;
      uint64_t v34 = v22;
      _os_log_impl(&dword_1A9AE7000, v21, OS_LOG_TYPE_DEFAULT, "> 1. Preparing selection: %f", (uint8_t *)&v33, 0xCu);
    }

    os_signpost_id_t v23 = PLSharingGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(*(void *)(a1 + 32) + 152) timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 144)];
      int v33 = 134217984;
      uint64_t v34 = v24;
      _os_log_impl(&dword_1A9AE7000, v23, OS_LOG_TYPE_DEFAULT, "> 2. Previews: %f", (uint8_t *)&v33, 0xCu);
    }

    v25 = PLSharingGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(*(void *)(a1 + 32) + 160) timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 152)];
      int v33 = 134217984;
      uint64_t v34 = v26;
      _os_log_impl(&dword_1A9AE7000, v25, OS_LOG_TYPE_DEFAULT, "> 3. Creation: %f", (uint8_t *)&v33, 0xCu);
    }

    id v27 = PLSharingGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(*(void *)(a1 + 32) + 168) timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 160)];
      int v33 = 134217984;
      uint64_t v34 = v28;
      _os_log_impl(&dword_1A9AE7000, v27, OS_LOG_TYPE_DEFAULT, "> 4. Publishing: %f", (uint8_t *)&v33, 0xCu);
    }

    v29 = PLSharingGetLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = *(void *)(a1 + 40);
      int v33 = 138412290;
      uint64_t v34 = v30;
      _os_log_impl(&dword_1A9AE7000, v29, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v33, 0xCu);
    }

    int v11 = PLSharingGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v31 = [*(id *)(a1 + 40) localIdentifier];
      int v33 = 138412290;
      uint64_t v34 = (uint64_t)v31;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "=== Publishing summary of moment share: %@ ===", (uint8_t *)&v33, 0xCu);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v32 = *(void *)(a1 + 40);
    int v33 = 138412546;
    uint64_t v34 = (uint64_t)v5;
    __int16 v35 = 2112;
    uint64_t v36 = v32;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "Publish completed without a share URL (error: %@). Cleaning up moment share %@", (uint8_t *)&v33, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_publishMomentShare:(id)a3
{
  id v4 = a3;
  id v5 = [(PXCMMActionPerformer *)self progress];
  int v6 = [v5 isCancelled];

  if (v6)
  {
    [(PXCMMPhotoKitPublishMomentShareActionPerformer *)self _performCleanupIfNeeded];
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__PXCMMPhotoKitPublishMomentShareActionPerformer__publishMomentShare___block_invoke;
    v7[3] = &unk_1E5DCC458;
    v7[4] = self;
    id v8 = v4;
    [(PXCMMPhotoKitPublishMomentShareActionPerformer *)self _publishMomentShare:v8 completionHandler:v7];
  }
}

void __70__PXCMMPhotoKitPublishMomentShareActionPerformer__publishMomentShare___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  *(id *)(a1 + 40);
  id v7 = v6;
  id v8 = v5;
  px_dispatch_on_main_queue();
}

uint64_t __70__PXCMMPhotoKitPublishMomentShareActionPerformer__publishMomentShare___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _publishingMomentShare:*(void *)(a1 + 40) didCompleteWithShareURL:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)_presentSharingProgressAlertController
{
  id v3 = [(PXCMMActionPerformer *)self progress];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__PXCMMPhotoKitPublishMomentShareActionPerformer__presentSharingProgressAlertController__block_invoke;
  v14[3] = &unk_1E5DD36F8;
  void v14[4] = self;
  [v3 setCancellationHandler:v14];
  id v4 = PXLocalizedStringFromTable(@"PXCMMSharingProgressTitle", @"PhotosUICore");
  id v5 = [(PXActionPerformer *)self presentationEnvironment];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = [(PXActionPerformer *)self delegate];
    id v7 = [v8 presentationEnvironmentForActionPerformer:self];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__PXCMMPhotoKitPublishMomentShareActionPerformer__presentSharingProgressAlertController__block_invoke_3;
  v12[3] = &unk_1E5DD36F8;
  id v13 = v3;
  id v9 = v3;
  id v10 = PXSharedLibraryPresentProgressAlertWithPresentationEnvironment(v4, v7, v12);
  progressAlertToken = self->_progressAlertToken;
  self->_progressAlertToken = v10;
}

void __88__PXCMMPhotoKitPublishMomentShareActionPerformer__presentSharingProgressAlertController__block_invoke()
{
}

uint64_t __88__PXCMMPhotoKitPublishMomentShareActionPerformer__presentSharingProgressAlertController__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

uint64_t __88__PXCMMPhotoKitPublishMomentShareActionPerformer__presentSharingProgressAlertController__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSharingProgressCancellation];
}

- (void)_budgetOverridePromptForMomentShare:(id)a3 completedWithOutcome:(BOOL)a4 error:(id)a5
{
  int v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = v8;
  if (a5)
  {
    [(PXCMMPhotoKitPublishMomentShareActionPerformer *)self _finalizePublishWithSuccess:0 error:a5];
  }
  else if ([v8 shouldIgnoreBudgets] == v6)
  {
    [(PXCMMPhotoKitPublishMomentShareActionPerformer *)self _publishMomentShare:v9];
  }
  else
  {
    id v10 = PLSharingGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (v6) {
        int v11 = @"YES";
      }
      else {
        int v11 = @"NO";
      }
      uint64_t v12 = [v9 localIdentifier];
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      os_signpost_id_t v23 = v12;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "Publishing performer: Will change moment share shouldIgnoreBudget to %@: %@", buf, 0x16u);
    }
    id v13 = [MEMORY[0x1E4F39228] sharedMomentSharePhotoLibrary];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __113__PXCMMPhotoKitPublishMomentShareActionPerformer__budgetOverridePromptForMomentShare_completedWithOutcome_error___block_invoke;
    v17[3] = &unk_1E5DCFE98;
    id v18 = v9;
    char v19 = v6;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __113__PXCMMPhotoKitPublishMomentShareActionPerformer__budgetOverridePromptForMomentShare_completedWithOutcome_error___block_invoke_2;
    v14[3] = &unk_1E5DD2570;
    id v15 = v18;
    uint64_t v16 = self;
    [v13 performChanges:v17 completionHandler:v14];
  }
}

void __113__PXCMMPhotoKitPublishMomentShareActionPerformer__budgetOverridePromptForMomentShare_completedWithOutcome_error___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F391B8] changeRequestForMomentShare:*(void *)(a1 + 32)];
  [v2 setShouldIgnoreBudgets:*(unsigned __int8 *)(a1 + 40)];
}

void __113__PXCMMPhotoKitPublishMomentShareActionPerformer__budgetOverridePromptForMomentShare_completedWithOutcome_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  *(id *)(a1 + 32);
  id v5 = v4;
  px_dispatch_on_main_queue();
}

uint64_t __113__PXCMMPhotoKitPublishMomentShareActionPerformer__budgetOverridePromptForMomentShare_completedWithOutcome_error___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 56);
  id v3 = PLSharingGetLog();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 32) localIdentifier];
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "Publishing performer: Did change moment share shouldIgnoreBudget: %@", (uint8_t *)&v9, 0xCu);
    }
    return [*(id *)(a1 + 40) _publishMomentShare:*(void *)(a1 + 32)];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v7 = [*(id *)(a1 + 32) localIdentifier];
      uint64_t v8 = *(void *)(a1 + 48);
      int v9 = 138412546;
      id v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_ERROR, "Publishing performer: Failed to change moment share shouldIgnoreBudget: %@ with error %@", (uint8_t *)&v9, 0x16u);
    }
    return [*(id *)(a1 + 40) _finalizePublishWithSuccess:0 error:*(void *)(a1 + 48)];
  }
}

- (void)_presentBudgetOverridePromptForMomentShare:(id)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PLSharingGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v6 localIdentifier];
    *(_DWORD *)buf = 138412290;
    v25 = v9;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Publishing performer: confirming whether or not to override budgets for moment share %@", buf, 0xCu);
  }
  progressAlertToken = self->_progressAlertToken;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __111__PXCMMPhotoKitPublishMomentShareActionPerformer__presentBudgetOverridePromptForMomentShare_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5DCFDB8;
  id v11 = v6;
  id v20 = v11;
  uint64_t v21 = self;
  BOOL v23 = progressAlertToken != 0;
  id v12 = v7;
  id v22 = v12;
  uint64_t v13 = _Block_copy(aBlock);
  uint64_t v14 = v13;
  if (progressAlertToken)
  {
    id v15 = [(PXActionPerformer *)self presentationEnvironment];
    uint64_t v16 = self->_progressAlertToken;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __111__PXCMMPhotoKitPublishMomentShareActionPerformer__presentBudgetOverridePromptForMomentShare_completionHandler___block_invoke_334;
    v17[3] = &unk_1E5DD3280;
    void v17[4] = self;
    id v18 = v14;
    PXSharedLibraryDismissProgressAlertWithPresentationEnvironment(v16, v15, v17);
  }
  else
  {
    (*((void (**)(void *))v13 + 2))(v13);
  }
}

void __111__PXCMMPhotoKitPublishMomentShareActionPerformer__presentBudgetOverridePromptForMomentShare_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = +[PXNetworkStatusMonitor sharedInstance];
  uint64_t v3 = [v2 bestAvailableNetworkType];

  uint64_t v4 = MGGetBoolAnswer();
  char v19 = +[PXLocalization currentDeviceCanonicalModel];
  id v5 = -[PXPublishMomentShareBudgetOverridePromptConfiguration initWithUseWLAN:networkType:assetCount:deviceModel:]([PXPublishMomentShareBudgetOverridePromptConfiguration alloc], "initWithUseWLAN:networkType:assetCount:deviceModel:", v4, v3, [*(id *)(a1 + 32) assetCount], v19);
  v27[0] = 0;
  id v26 = 0;
  [(id)objc_opt_class() budgetOverridePromptAlertKeysForConfiguration:v5 messageKey:v27 actionKey:&v26];
  id v6 = v27[0];
  id v7 = v26;
  uint64_t v8 = PXLocalizedStringFromTable(v6, @"PhotosUICore");
  int v9 = PXLocalizedStringFromTable(v7, @"PhotosUICore");
  id v10 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:v8 preferredStyle:0];
  id v11 = (void *)MEMORY[0x1E4FB1410];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __111__PXCMMPhotoKitPublishMomentShareActionPerformer__presentBudgetOverridePromptForMomentShare_completionHandler___block_invoke_2;
  v23[3] = &unk_1E5DB7BB8;
  char v25 = *(unsigned char *)(a1 + 56);
  id v12 = *(void **)(a1 + 48);
  v23[4] = *(void *)(a1 + 40);
  id v24 = v12;
  uint64_t v13 = [v11 actionWithTitle:v9 style:0 handler:v23];
  [v10 addAction:v13];

  uint64_t v14 = (void *)MEMORY[0x1E4FB1410];
  id v15 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __111__PXCMMPhotoKitPublishMomentShareActionPerformer__presentBudgetOverridePromptForMomentShare_completionHandler___block_invoke_327;
  v21[3] = &unk_1E5DCE788;
  id v22 = *(id *)(a1 + 48);
  uint64_t v16 = [v14 actionWithTitle:v15 style:1 handler:v21];
  [v10 addAction:v16];

  LODWORD(v16) = [*(id *)(a1 + 40) presentViewController:v10];
  int v17 = PLSharingGetLog();
  id v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEFAULT, "Presenting budget override prompt...", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_ERROR, "Publishing performer: Failed to present budget override prompt", buf, 2u);
    }

    id v18 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1002, @"Failed to present budget override prompt");
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __111__PXCMMPhotoKitPublishMomentShareActionPerformer__presentBudgetOverridePromptForMomentShare_completionHandler___block_invoke_334(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 104);
  *(void *)(v2 + 104) = 0;

  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

void __111__PXCMMPhotoKitPublishMomentShareActionPerformer__presentBudgetOverridePromptForMomentShare_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = PLSharingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "Budget override prompt outcome: SHOULD ignore budgets", buf, 2u);
  }

  if (*(unsigned char *)(a1 + 48)
    && ([*(id *)(a1 + 32) _presentSharingProgressAlertController],
        !*(void *)(*(void *)(a1 + 32) + 104)))
  {
    uint64_t v3 = PLSharingGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_ERROR, "Publishing performer: Failed to re-present progress alert", v5, 2u);
    }

    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1002, @"Failed to re-present progress alert");
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __111__PXCMMPhotoKitPublishMomentShareActionPerformer__presentBudgetOverridePromptForMomentShare_completionHandler___block_invoke_327(uint64_t a1)
{
  uint64_t v2 = PLSharingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "Budget override prompt outcome: Upload canceled", v4, 2u);
  }

  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1001, @"Cancelled upload at budget override prompt");
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_creatingMomentShareDidCompleteWithMomentShare:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_momentShare, a3);
  int v9 = [(PXCMMActionPerformer *)self progress];
  int v10 = [v9 isCancelled];

  if (v10)
  {
    [(PXCMMPhotoKitPublishMomentShareActionPerformer *)self _performCleanupIfNeeded];
  }
  else if (v7)
  {
    if (([v7 shouldPromptUserToIgnoreBudgets] & 1) != 0
      || (+[PXCompleteMyMomentSettings sharedInstance],
          id v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = [v11 simulateShouldPromptUserToIgnoreBudgets],
          v11,
          v12))
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __103__PXCMMPhotoKitPublishMomentShareActionPerformer__creatingMomentShareDidCompleteWithMomentShare_error___block_invoke;
      v13[3] = &unk_1E5DD2570;
      v13[4] = self;
      id v14 = v7;
      [(PXCMMPhotoKitPublishMomentShareActionPerformer *)self _presentBudgetOverridePromptForMomentShare:v14 completionHandler:v13];
    }
    else
    {
      [(PXCMMPhotoKitPublishMomentShareActionPerformer *)self _publishMomentShare:v7];
    }
  }
  else
  {
    [(PXCMMPhotoKitPublishMomentShareActionPerformer *)self _finalizePublishWithSuccess:0 error:v8];
  }
}

uint64_t __103__PXCMMPhotoKitPublishMomentShareActionPerformer__creatingMomentShareDidCompleteWithMomentShare_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _budgetOverridePromptForMomentShare:*(void *)(a1 + 40) completedWithOutcome:a2 error:a3];
}

- (void)_createMomentShareWithCompletionHandler:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(PXCMMActionPerformer *)self session];
  v57 = v5;
  if (!v6)
  {
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    v48 = (objc_class *)objc_opt_class();
    v49 = NSStringFromClass(v48);
    [v47 handleFailureInMethod:a2, self, @"PXCMMPhotoKitPublishMomentShareActionPerformer.m", 333, @"%@ should be an instance inheriting from %@, but it is nil", @"self.session", v49 object file lineNumber description];
LABEL_28:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    v50 = (objc_class *)objc_opt_class();
    v49 = NSStringFromClass(v50);
    v51 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v47 handleFailureInMethod:a2, self, @"PXCMMPhotoKitPublishMomentShareActionPerformer.m", 333, @"%@ should be an instance inheriting from %@, but it is %@", @"self.session", v49, v51 object file lineNumber description];

    goto LABEL_28;
  }
LABEL_3:
  id v7 = [v6 viewModel];
  id v8 = [v7 selectionManager];
  int v9 = [v8 selectionSnapshot];

  int v10 = [v9 selectedIndexPaths];
  PLSharingGetLog();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, self);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "ActionPerformerMomentSharePublishSelection", " enableTelemetry=YES ", buf, 2u);
    }
  }

  id v14 = [MEMORY[0x1E4F1C9C8] date];
  initialStartDate = self->_initialStartDate;
  self->_initialStartDate = v14;

  uint64_t v16 = [v9 dataSource];
  v56 = v9;
  if ([v10 count])
  {
    int v17 = v10;
  }
  else
  {
    int v17 = [v16 allItemIndexPaths];

    if ([v17 count] <= 0)
    {
      v52 = [MEMORY[0x1E4F28B00] currentHandler];
      [v52 handleFailureInMethod:a2, self, @"PXCMMPhotoKitPublishMomentShareActionPerformer.m", 347, @"Invalid parameter not satisfying: %@", @"selectedIndexPaths.count > 0" object file lineNumber description];
    }
  }
  v55 = v16;
  v53 = [v16 photosDataSource];
  v54 = v17;
  id v18 = [v53 assetsAtIndexPaths:v17];
  v58 = v7;
  char v19 = [v7 originalTitle];
  if (!v19)
  {
    id v20 = +[PXCompleteMyMomentSettings sharedInstance];
    int v21 = [v20 preventNilTitles];

    if (v21) {
      char v19 = &stru_1F00B0030;
    }
    else {
      char v19 = 0;
    }
  }
  id v22 = [v6 originatingMomentShare];
  BOOL v23 = [MEMORY[0x1E4F38EB8] fetchPreviewAssetsForMomentShareCreationWithAssets:v18 options:0];
  id v24 = [v23 firstObject];
  char v25 = v24;
  if (v24)
  {
    id v26 = v24;
  }
  else
  {
    id v26 = [v18 firstObject];
  }
  id v27 = v26;

  uint64_t v28 = [(PXCMMActionPerformer *)self progress];
  PLSharingGetLog();
  v29 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v30 = os_signpost_id_make_with_pointer(v29, self);
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v31 = v30;
    if (os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v29, OS_SIGNPOST_INTERVAL_END, v31, "ActionPerformerMomentSharePublishSelection", " enableTelemetry=YES ", buf, 2u);
    }
  }

  PLSharingGetLog();
  uint64_t v32 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v33 = os_signpost_id_make_with_pointer(v32, self);
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v34 = v33;
    if (os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v34, "ActionPerformerMomentSharePublishPreview", " enableTelemetry=YES ", buf, 2u);
    }
  }

  __int16 v35 = PLSharingGetLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v36 = [MEMORY[0x1E4F1C9C8] date];
    previewRequestStartDate = self->_previewRequestStartDate;
    self->_previewRequestStartDate = v36;

    [(NSDate *)v36 timeIntervalSinceDate:self->_initialStartDate];
    *(_DWORD *)buf = 138412546;
    v69 = self;
    __int16 v70 = 2048;
    uint64_t v71 = v38;
    _os_log_impl(&dword_1A9AE7000, v35, OS_LOG_TYPE_DEFAULT, "Publishing performer: %@ Did get assets to publish in %f seconds.", buf, 0x16u);
  }

  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __90__PXCMMPhotoKitPublishMomentShareActionPerformer__createMomentShareWithCompletionHandler___block_invoke;
  v59[3] = &unk_1E5DB7B90;
  v59[4] = self;
  id v60 = v27;
  id v61 = v23;
  id v62 = v28;
  id v63 = v6;
  id v64 = v18;
  v65 = v19;
  id v66 = v22;
  id v67 = v57;
  id v39 = v57;
  id v40 = v22;
  v41 = v19;
  id v42 = v18;
  id v43 = v6;
  id v44 = v28;
  id v45 = v23;
  id v46 = v27;
  [(PXCMMPhotoKitPublishMomentShareActionPerformer *)self _requestPreviewImageForAsset:v46 resultHandler:v59];
}

void __90__PXCMMPhotoKitPublishMomentShareActionPerformer__createMomentShareWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v40 = a3;
  v41 = v4;
  id v5 = PLSharingGetLog();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      LODWORD(buf[0]) = 138412546;
      *(void *)((char *)buf + 4) = v7;
      WORD2(buf[1]) = 2112;
      *(void *)((char *)&buf[1] + 6) = v4;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "Publishing performer: %@ Received preview image %@", (uint8_t *)buf, 0x16u);
    }

    id v8 = *(void **)(a1 + 48);
    id v9 = *(id *)(a1 + 40);
    id v10 = v41;
    id v11 = v8;
    id v42 = objc_alloc_init(MEMORY[0x1E4F391C0]);
    uint64_t v45 = 0x408C200000000000;
    id v12 = v10;
    os_signpost_id_t v13 = (CGImage *)[v12 CGImage];
    if (v13)
    {
      long long v51 = 0u;
      memset(buf, 0, sizeof(buf));
      long long v48 = 0u;
      long long v49 = 0u;
      *(_OWORD *)values = 0u;
      DCIM_scaleFromPLImage();
      uint64_t v15 = 0;
      if (v14 != 1.0 && v14 > 0.001)
      {
        double valuePtr = v14 * 72.0;
        CFNumberRef v16 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
        uint64_t v17 = *MEMORY[0x1E4F2F6B0];
        values[0] = v16;
        uint64_t v18 = *MEMORY[0x1E4F2F6A8];
        buf[0] = v17;
        buf[1] = v18;
        values[1] = (void *)CFRetain(v16);
        uint64_t v15 = 2;
      }
      uint64_t v46 = 0x3FE6666666666666;
      buf[v15] = *MEMORY[0x1E4F2F430];
      values[v15] = CFNumberCreate(0, kCFNumberDoubleType, &v46);
      buf[v15 | 1] = *MEMORY[0x1E4F2F450];
      values[v15 | 1] = (void *)CFRetain((CFTypeRef)*MEMORY[0x1E4F1CFD0]);
      buf[v15 + 2] = *MEMORY[0x1E4F2F428];
      values[v15 + 2] = CFNumberCreate(0, kCFNumberDoubleType, &v45);
      LODWORD(valuePtr) = 0;
      uint64_t v19 = v15 + 3;
      switch([v12 imageOrientation])
      {
        case 0:
          int v20 = 1;
          goto LABEL_21;
        case 1:
          int v20 = 3;
          goto LABEL_21;
        case 2:
          int v20 = 8;
          goto LABEL_21;
        case 3:
          int v20 = 6;
          goto LABEL_21;
        case 4:
          int v20 = 2;
          goto LABEL_21;
        case 5:
          int v20 = 4;
          goto LABEL_21;
        case 6:
          int v20 = 5;
          goto LABEL_21;
        case 7:
          int v20 = 7;
LABEL_21:
          LODWORD(valuePtr) = v20;
          break;
        default:
          break;
      }
      buf[v19] = *MEMORY[0x1E4F2FCA0];
      values[v19] = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
      CFDictionaryRef v22 = CFDictionaryCreate(0, (const void **)buf, (const void **)values, v15 | 4, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      uint64_t v23 = v15 + 3;
      do
      {
        CFRelease(values[v23]);
        unint64_t v24 = v23-- + 1;
      }
      while (v24 > 1);
      char v25 = [MEMORY[0x1E4F1CA58] data];
      id v26 = v25;
      if (v25 && (id v27 = CGImageDestinationCreateWithData(v25, @"public.jpeg", 1uLL, 0), (v28 = v27) != 0))
      {
        CGImageDestinationAddImage(v27, v13, v22);
        BOOL v29 = CGImageDestinationFinalize(v28);
        CFRelease(v28);
        CFRelease(v22);
        if (v29) {
          os_signpost_id_t v30 = v26;
        }
        else {
          os_signpost_id_t v30 = 0;
        }
      }
      else
      {
        CFRelease(v22);
        os_signpost_id_t v30 = 0;
      }
      int v21 = v30;

      if (v21 && [(__CFData *)v21 length] && (unint64_t)[(__CFData *)v21 length] >> 12 <= 0x7C)
      {
        buf[0] = v21;
        os_signpost_id_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
        [v42 setPreviewImageData:v31];
        goto LABEL_36;
      }
    }
    else
    {

      int v21 = 0;
    }
    os_signpost_id_t v31 = PLSharingGetLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf[0]) = 138412290;
      *(void *)((char *)buf + 4) = v21;
      _os_log_impl(&dword_1A9AE7000, v31, OS_LOG_TYPE_ERROR, "Publishing performer: previewImageData missing or too big: %@", (uint8_t *)buf, 0xCu);
    }
LABEL_36:

    [v42 setKeyAsset:v9];
    [v9 originalFaceAreaRect];
    double x = v53.origin.x;
    double y = v53.origin.y;
    double width = v53.size.width;
    double height = v53.size.height;
    if (CGRectIsEmpty(v53))
    {
      [v9 preferredCropRect];
      double x = v36;
      double y = v37;
      double width = v38;
      double height = v39;
    }
    objc_msgSend(v42, "setCropRect:", x, y, width, height, v40);
    PXMap();
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf[0]) = 138412290;
    *(void *)((char *)buf + 4) = v40;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Preview image data request failed with error: %@", (uint8_t *)buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
}

void __90__PXCMMPhotoKitPublishMomentShareActionPerformer__createMomentShareWithCompletionHandler___block_invoke_281(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F391B8];
  uint64_t v3 = a1[4];
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  id v9 = [v2 creationRequestForMomentShareWithTitle:v3 publicPermission:2 creationDate:v4 createMomentShareAssetsFromAssets:a1[5] creationOptionsPerAsset:a1[6] preview:a1[7] originatingMomentShare:a1[8]];

  id v5 = [v9 placeholderForCreatedMomentShare];
  uint64_t v6 = [v5 localIdentifier];
  uint64_t v7 = *(void *)(a1[9] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __90__PXCMMPhotoKitPublishMomentShareActionPerformer__createMomentShareWithCompletionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [*(id *)(a1 + 32) librarySpecificFetchOptions];
    uint64_t v7 = (void *)MEMORY[0x1E4F38EE8];
    v27[0] = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    id v9 = [v7 fetchAssetCollectionsWithLocalIdentifiers:v8 options:v6];
    id v10 = [v9 firstObject];

    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", (uint64_t)(float)((float)objc_msgSend(*(id *)(a1 + 40), "completedUnitCount")+ (float)((float)objc_msgSend(*(id *)(a1 + 40), "totalUnitCount") * 0.24)));
    id v11 = PLSharingGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 48);
      os_signpost_id_t v13 = [v10 localIdentifier];
      double v14 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v15 = *(void *)(a1 + 48);
      CFNumberRef v16 = *(void **)(v15 + 160);
      *(void *)(v15 + 160) = v14;

      [v14 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 48) + 152)];
      int v21 = 138412802;
      uint64_t v22 = v12;
      __int16 v23 = 2112;
      unint64_t v24 = v13;
      __int16 v25 = 2048;
      uint64_t v26 = v17;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "Publishing performer: %@ Did create moment share %@ in %f seconds.", (uint8_t *)&v21, 0x20u);
    }
  }
  else
  {
    id v10 = 0;
  }
  PLSharingGetLog();
  uint64_t v18 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v18, *(const void **)(a1 + 48));
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v20 = v19;
    if (os_signpost_enabled(v18))
    {
      LOWORD(v21) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v18, OS_SIGNPOST_INTERVAL_END, v20, "ActionPerformerMomentSharePublishCreation", " enableTelemetry=YES ", (uint8_t *)&v21, 2u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_createMomentShare
{
  [(PXCMMPhotoKitPublishMomentShareActionPerformer *)self _presentSharingProgressAlertController];
  if (self->_progressAlertToken)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __68__PXCMMPhotoKitPublishMomentShareActionPerformer__createMomentShare__block_invoke;
    v5[3] = &unk_1E5DB7B18;
    v5[4] = self;
    [(PXCMMPhotoKitPublishMomentShareActionPerformer *)self _createMomentShareWithCompletionHandler:v5];
  }
  else
  {
    uint64_t v3 = PLSharingGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_ERROR, "Publishing performer: Failed to present progress alert", v4, 2u);
    }

    [(PXCMMPhotoKitPublishMomentShareActionPerformer *)self _finalizePublishWithSuccess:0 error:0];
  }
}

void __68__PXCMMPhotoKitPublishMomentShareActionPerformer__createMomentShare__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  px_dispatch_on_main_queue();
}

uint64_t __68__PXCMMPhotoKitPublishMomentShareActionPerformer__createMomentShare__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _creatingMomentShareDidCompleteWithMomentShare:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)_presentInternalSharingAlert
{
  id v4 = [(PXCMMActionPerformer *)self session];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    int v21 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v24 = (objc_class *)objc_opt_class();
    __int16 v23 = NSStringFromClass(v24);
    __int16 v25 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
    [v21 handleFailureInMethod:a2, self, @"PXCMMPhotoKitPublishMomentShareActionPerformer.m", 246, @"%@ should be an instance inheriting from %@, but it is %@", @"self.session", v23, v25 object file lineNumber description];
  }
  else
  {
    int v21 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v22 = (objc_class *)objc_opt_class();
    __int16 v23 = NSStringFromClass(v22);
    [v21 handleFailureInMethod:a2, self, @"PXCMMPhotoKitPublishMomentShareActionPerformer.m", 246, @"%@ should be an instance inheriting from %@, but it is nil", @"self.session", v23 object file lineNumber description];
  }

LABEL_3:
  id v5 = [v4 viewModel];
  id v6 = [v5 selectionManager];
  uint64_t v7 = [v6 selectionSnapshot];

  if (+[PXSharingConfidentialityController confidentialWarningRequiredForShareableSelection:v7])
  {
    id v8 = PLSharingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Presenting internal sharing alert", (uint8_t *)buf, 2u);
    }

    uint64_t v9 = +[PXSharingConfidentialityController confidentialityWarningTitle];
    uint64_t v10 = +[PXSharingConfidentialityController confidentialFeatureWarningMessage];
    BOOL v29 = PXLocalizedStringFromTable(@"PXOK", @"PhotosUICore");
    uint64_t v28 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
    objc_initWeak(buf, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __78__PXCMMPhotoKitPublishMomentShareActionPerformer__presentInternalSharingAlert__block_invoke;
    aBlock[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v38, buf);
    id v11 = _Block_copy(aBlock);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __78__PXCMMPhotoKitPublishMomentShareActionPerformer__presentInternalSharingAlert__block_invoke_253;
    v35[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v36, buf);
    uint64_t v12 = _Block_copy(v35);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __78__PXCMMPhotoKitPublishMomentShareActionPerformer__presentInternalSharingAlert__block_invoke_258;
    v34[3] = &unk_1E5DD36F8;
    void v34[4] = self;
    os_signpost_id_t v13 = (void (**)(void))_Block_copy(v34);
    uint64_t v26 = (void *)v10;
    id v27 = (void *)v9;
    double v14 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:v10 preferredStyle:1];
    uint64_t v15 = (void *)MEMORY[0x1E4FB1410];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __78__PXCMMPhotoKitPublishMomentShareActionPerformer__presentInternalSharingAlert__block_invoke_2;
    v32[3] = &unk_1E5DCE788;
    id v16 = v11;
    id v33 = v16;
    uint64_t v17 = [v15 actionWithTitle:v29 style:0 handler:v32];
    [v14 addAction:v17];

    uint64_t v18 = (void *)MEMORY[0x1E4FB1410];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __78__PXCMMPhotoKitPublishMomentShareActionPerformer__presentInternalSharingAlert__block_invoke_3;
    v30[3] = &unk_1E5DCE788;
    id v19 = v12;
    id v31 = v19;
    os_signpost_id_t v20 = [v18 actionWithTitle:v28 style:0 handler:v30];
    [v14 addAction:v20];

    if (![(PXActionPerformer *)self presentViewController:v14]) {
      v13[2](v13);
    }

    objc_destroyWeak(&v36);
    objc_destroyWeak(&v38);
    objc_destroyWeak(buf);
  }
  else
  {
    [(PXCMMPhotoKitPublishMomentShareActionPerformer *)self _createMomentShare];
  }
}

void __78__PXCMMPhotoKitPublishMomentShareActionPerformer__presentInternalSharingAlert__block_invoke(uint64_t a1)
{
  uint64_t v2 = PLSharingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "Accepted internal sharing alert", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _createMomentShare];
}

void __78__PXCMMPhotoKitPublishMomentShareActionPerformer__presentInternalSharingAlert__block_invoke_253(uint64_t a1)
{
  uint64_t v2 = PLSharingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "Cancelled internal sharing alert", v5, 2u);
  }

  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1001, @"Cancelled internal sharing alert");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _finalizePublishWithSuccess:0 error:v3];
}

void __78__PXCMMPhotoKitPublishMomentShareActionPerformer__presentInternalSharingAlert__block_invoke_258(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1002, @"Failed to present internal sharing alert");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) _finalizePublishWithSuccess:0 error:v2];
}

uint64_t __78__PXCMMPhotoKitPublishMomentShareActionPerformer__presentInternalSharingAlert__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__PXCMMPhotoKitPublishMomentShareActionPerformer__presentInternalSharingAlert__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performUserInteractionTask
{
  if (+[PXSharingConfidentialityController confidentialityCheckRequired])
  {
    [(PXCMMPhotoKitPublishMomentShareActionPerformer *)self _presentInternalSharingAlert];
  }
  else
  {
    [(PXCMMPhotoKitPublishMomentShareActionPerformer *)self _createMomentShare];
  }
}

- (void)_requestPreviewImageForAsset:(id)a3 resultHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PXCMMPhotoKitPublishMomentShareActionPerformer.m", 215, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  [v9 setVersion:0];
  [v9 setSynchronous:0];
  [v9 setDeliveryMode:1];
  [v9 setResizeMode:1];
  [v9 setNetworkAccessAllowed:1];
  double v10 = (double)(unint64_t)[v7 pixelWidth];
  unint64_t v11 = [v7 pixelHeight];
  float v12 = v10 * (double)v11;
  double v13 = fminf(sqrtf(607500.0 / v12), 1.0);
  double v14 = (double)v11 * v13;
  double v15 = v10 * v13;
  id v16 = [MEMORY[0x1E4F390D0] defaultManager];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __93__PXCMMPhotoKitPublishMomentShareActionPerformer__requestPreviewImageForAsset_resultHandler___block_invoke;
  v19[3] = &unk_1E5DD24E8;
  id v20 = v8;
  id v17 = v8;
  self->_previewRequestID = objc_msgSend(v16, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v7, 0, v9, v19, v15, v14);
}

void __93__PXCMMPhotoKitPublishMomentShareActionPerformer__requestPreviewImageForAsset_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *MEMORY[0x1E4F39698];
  id v6 = a2;
  id v7 = [a3 objectForKeyedSubscript:v5];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);
}

@end