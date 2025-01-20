@interface PXSharedLibraryDeclineInvitationActionPerformer
- (PXSharedLibrary)invitation;
- (PXSharedLibraryDeclineInvitationActionPerformer)init;
- (void)performActionWithInvitation:(id)a3 presentationEnvironment:(id)a4 completionHandler:(id)a5;
- (void)performUserInteractionTask;
- (void)setInvitation:(id)a3;
@end

@implementation PXSharedLibraryDeclineInvitationActionPerformer

- (void).cxx_destruct
{
}

- (void)setInvitation:(id)a3
{
}

- (PXSharedLibrary)invitation
{
  return self->_invitation;
}

- (void)performUserInteractionTask
{
  v3 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "Will present the decline invitation confirmation alert", buf, 2u);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__PXSharedLibraryDeclineInvitationActionPerformer_performUserInteractionTask__block_invoke;
  v6[3] = &unk_1E5DC7038;
  v6[4] = self;
  v4 = [(PXActionPerformer *)self presentAlertWithConfigurationHandler:v6];
  if (!v4) {
    PXAssertGetLog();
  }
  v5 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Did present the decline invitation confirmation alert", buf, 2u);
  }
}

void __77__PXSharedLibraryDeclineInvitationActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PXLocalizedSharedLibraryString(@"PXSharedLibraryInvitationDeclineConfirmationAlertTitle_iOS");
  [v3 setTitle:v4];

  [v3 setStyle:0];
  v5 = PXLocalizedSharedLibraryString(@"PXSharedLibraryInvitationDeclineConfirmationAlertButtonTitle");
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__PXSharedLibraryDeclineInvitationActionPerformer_performUserInteractionTask__block_invoke_2;
  v8[3] = &unk_1E5DD36F8;
  v8[4] = *(void *)(a1 + 32);
  [v3 addActionWithTitle:v5 style:2 action:v8];
  v6 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__PXSharedLibraryDeclineInvitationActionPerformer_performUserInteractionTask__block_invoke_2_216;
  v7[3] = &unk_1E5DD36F8;
  v7[4] = *(void *)(a1 + 32);
  [v3 addActionWithTitle:v6 style:1 action:v7];
}

void __77__PXSharedLibraryDeclineInvitationActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  v2 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "User confirmed the decline invitation confirmation alert", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) invitation];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__PXSharedLibraryDeclineInvitationActionPerformer_performUserInteractionTask__block_invoke_210;
  v4[3] = &unk_1E5DD3158;
  v4[4] = *(void *)(a1 + 32);
  [v3 declineInvitationWithCompletion:v4];
}

void __77__PXSharedLibraryDeclineInvitationActionPerformer_performUserInteractionTask__block_invoke_2_216(uint64_t a1)
{
  v2 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "User canceled the decline invitation confirmation alert", v5, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  v4 = PXSharedLibraryUserCanceledErrorWithDebugDescription(@"Decline Assistant Confirmation");
  [v3 completeUserInteractionTaskWithSuccess:0 error:v4];
}

uint64_t __77__PXSharedLibraryDeclineInvitationActionPerformer_performUserInteractionTask__block_invoke_210(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:a2 error:a3];
}

- (void)performActionWithInvitation:(id)a3 presentationEnvironment:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXSharedLibraryDeclineInvitationActionPerformer.m", 33, @"Invalid parameter not satisfying: %@", @"invitation" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXSharedLibraryDeclineInvitationActionPerformer.m", 34, @"Invalid parameter not satisfying: %@", @"presentationEnvironment" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  [(PXSharedLibraryDeclineInvitationActionPerformer *)self setInvitation:v9];
  [(PXActionPerformer *)self setPresentationEnvironment:v10];
  v14.receiver = self;
  v14.super_class = (Class)PXSharedLibraryDeclineInvitationActionPerformer;
  [(PXActionPerformer *)&v14 performActionWithCompletionHandler:v11];
}

- (PXSharedLibraryDeclineInvitationActionPerformer)init
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v7.receiver = self;
  v7.super_class = (Class)PXSharedLibraryDeclineInvitationActionPerformer;
  v5 = [(PXActionPerformer *)&v7 initWithActionType:v4];

  return v5;
}

@end