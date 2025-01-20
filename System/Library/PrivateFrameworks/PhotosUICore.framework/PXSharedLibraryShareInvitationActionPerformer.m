@interface PXSharedLibraryShareInvitationActionPerformer
- (PXSharedLibraryShareInvitationActionPerformer)initWithPresentationEnvironment:(id)a3;
- (void)performActionWithInvitationURL:(id)a3 completionHandler:(id)a4;
- (void)performUserInteractionTask;
@end

@implementation PXSharedLibraryShareInvitationActionPerformer

- (void).cxx_destruct
{
}

- (void)performUserInteractionTask
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v4 = +[PXSharedLibrarySettings sharedInstance];
  uint64_t v5 = [v4 simulateErrorType];

  if (v5 == 7)
  {
    v6 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Simulated Error: Share Invitation Failed", buf, 2u);
    }

    v7 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXSharedLibraryErrorDomain", -1000, @"Simulated Error: Share Invitation Failed");
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v7];
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F9F2E8]);
    v14[0] = self->_invitationURL;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    v7 = (void *)[v8 initWithActivityItems:v9 applicationActivities:0];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __75__PXSharedLibraryShareInvitationActionPerformer_performUserInteractionTask__block_invoke;
    v12[3] = &unk_1E5DC34A8;
    v12[4] = self;
    [v7 setCompletionWithItemsHandler:v12];
    v10 = [(PXActionPerformer *)self presentationEnvironment];
    if (!v10)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"PXSharedLibraryShareInvitationActionPerformer.m", 72, @"Invalid parameter not satisfying: %@", @"presentationEnvironment" object file lineNumber description];
    }
    [v10 presentViewController:v7 animated:1 completionHandler:0];
  }
}

void __75__PXSharedLibraryShareInvitationActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v11 = a2;
  id v9 = a4;
  id v10 = a5;
  if (!v11 || a3)
  {
    if (!v10 && (a3 & 1) == 0)
    {
      PXSharedLibraryUserCanceledErrorWithDebugDescription(@"Share Invitation");
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:a3 error:v10];
  }
}

- (void)performActionWithInvitationURL:(id)a3 completionHandler:(id)a4
{
  v7 = (NSURL *)a3;
  id v10 = a4;
  if (!v7)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXSharedLibraryShareInvitationActionPerformer.m", 36, @"Invalid parameter not satisfying: %@", @"invitationURL" object file lineNumber description];
  }
  invitationURL = self->_invitationURL;
  self->_invitationURL = v7;

  [(PXActionPerformer *)self performActionWithCompletionHandler:v10];
}

- (PXSharedLibraryShareInvitationActionPerformer)initWithPresentationEnvironment:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXSharedLibraryShareInvitationActionPerformer.m", 26, @"Invalid parameter not satisfying: %@", @"presentationEnvironment" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)PXSharedLibraryShareInvitationActionPerformer;
  v6 = [(PXActionPerformer *)&v10 initWithActionType:@"PXActionSharedLibraryShareInvitation"];
  v7 = v6;
  if (v6) {
    [(PXActionPerformer *)v6 setPresentationEnvironment:v5];
  }

  return v7;
}

@end