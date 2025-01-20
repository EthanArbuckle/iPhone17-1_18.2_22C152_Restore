@interface ICPasswordUtilities
+ (BOOL)deviceHasPasscode;
+ (ICPasswordUtilities)sharedInstance;
+ (id)imageForCurrentDecryptedStatusForNote:(id)a3;
- (BOOL)isShowingDivergedDialogue;
- (NSString)divergedAccountPassword;
- (id)displayedSheet;
- (void)accessibilityAnnounceAuthSuccessForIntent:(unint64_t)a3 withNote:(id)a4;
- (void)setDisplayedSheet:(id)a3;
- (void)setDivergedAccountPassword:(id)a3;
- (void)setIsShowingDivergedDialogue:(BOOL)a3;
- (void)showChangePasswordDialogueFromDisplayWindow:(id)a3 account:(id)a4 completionHandler:(id)a5;
- (void)showPasswordSetUpSheetForAccount:(id)a3 displayWindow:(id)a4 completionHandler:(id)a5;
- (void)showUpdateDivergedPasswordForAccountPassword:(id)a3 oldPassword:(id)a4 account:(id)a5 displayWindow:(id)a6;
@end

@implementation ICPasswordUtilities

+ (ICPasswordUtilities)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_92);
  }
  v2 = (void *)sharedInstance_instance_0;
  return (ICPasswordUtilities *)v2;
}

uint64_t __37__ICPasswordUtilities_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(ICPasswordUtilities);
  sharedInstance_instance_0 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0);
}

+ (id)imageForCurrentDecryptedStatusForNote:(id)a3
{
  if ([a3 isAuthenticated]) {
    v3 = @"lock.open.fill";
  }
  else {
    v3 = @"lock.fill";
  }
  v4 = [MEMORY[0x1E4FB1818] systemImageNamed:v3];
  return v4;
}

+ (BOOL)deviceHasPasscode
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F30B50]);
  uint64_t v5 = 0;
  char v3 = [v2 canEvaluatePolicy:2 error:&v5];

  return v3;
}

- (void)showChangePasswordDialogueFromDisplayWindow:(id)a3 account:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 hasPassphraseSet])
  {
    v11 = [(ICPasswordUtilities *)self displayedSheet];

    if (!v11)
    {
      v12 = [ICPasswordChangeViewController alloc];
      v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v14 = [(ICPasswordChangeViewController *)v12 initWithNibName:0 bundle:v13];

      id v15 = (id)[(ICPasswordChangeViewController *)v14 view];
      [(ICPasswordChangeViewController *)v14 setUpForChangePasswordWithAccount:v9 didAuthenticateWithBiometrics:0];
      v16 = [(UIViewController *)v14 ic_embedInNavigationControllerForModalPresentation];
      v17 = [v8 rootViewController];
      v18 = objc_msgSend(v17, "ic_topViewController");
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __93__ICPasswordUtilities_showChangePasswordDialogueFromDisplayWindow_account_completionHandler___block_invoke;
      v19[3] = &unk_1E5FDB0C8;
      id v22 = v10;
      id v20 = v9;
      v21 = self;
      [v18 presentViewController:v16 animated:1 completion:v19];
    }
  }
  else
  {
    [(ICPasswordUtilities *)self showPasswordSetUpSheetForAccount:v9 displayWindow:v8 completionHandler:v10];
  }
}

uint64_t __93__ICPasswordUtilities_showChangePasswordDialogueFromDisplayWindow_account_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    if ([*(id *)(a1 + 32) isAuthenticated]) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = 1;
    }
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
  }
  v4 = *(void **)(a1 + 40);
  return [v4 setDisplayedSheet:0];
}

- (void)showPasswordSetUpSheetForAccount:(id)a3 displayWindow:(id)a4 completionHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(ICPasswordUtilities *)self displayedSheet];

  if (!v11)
  {
    v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ICPasswordUtilities showPasswordSetUpSheetForAccount:displayWindow:completionHandler:](v8);
    }

    v13 = [ICPasswordChangeViewController alloc];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __88__ICPasswordUtilities_showPasswordSetUpSheetForAccount_displayWindow_completionHandler___block_invoke;
    v22[3] = &unk_1E5FDE4D8;
    id v14 = v8;
    id v23 = v14;
    v24 = self;
    id v25 = v10;
    id v15 = [(ICPasswordChangeViewController *)v13 initWithCompletionHandler:v22];
    id v16 = (id)[(ICPasswordChangeViewController *)v15 view];
    [(ICPasswordChangeViewController *)v15 setUpForAddingPasswordWithAccount:v14];
    v17 = [(UIViewController *)v15 ic_embedInNavigationControllerForModalPresentation];
    [v17 setModalPresentationCapturesStatusBarAppearance:1];
    v18 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v21 = [v14 shortLoggingDescription];
      *(_DWORD *)buf = 138412802;
      v27 = v15;
      __int16 v28 = 2112;
      v29 = v21;
      __int16 v30 = 2112;
      v31 = v17;
      _os_log_debug_impl(&dword_1B08EB000, v18, OS_LOG_TYPE_DEBUG, "Presenting passwordSetupViewController %@ for account %@ through navigation controller %@", buf, 0x20u);
    }
    v19 = [v9 rootViewController];
    id v20 = objc_msgSend(v19, "ic_topViewController");
    [v20 presentViewController:v17 animated:1 completion:0];
  }
}

void __88__ICPasswordUtilities_showPasswordSetUpSheetForAccount_displayWindow_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __88__ICPasswordUtilities_showPasswordSetUpSheetForAccount_displayWindow_completionHandler___block_invoke_cold_1(a1);
  }

  [*(id *)(a1 + 40) setDisplayedSheet:0];
  id v3 = *(id *)(a1 + 48);
  dispatchMainAfterDelay();
}

uint64_t __88__ICPasswordUtilities_showPasswordSetUpSheetForAccount_displayWindow_completionHandler___block_invoke_20(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 40));
  }
  return result;
}

- (void)showUpdateDivergedPasswordForAccountPassword:(id)a3 oldPassword:(id)a4 account:(id)a5 displayWindow:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![(ICPasswordUtilities *)self isShowingDivergedDialogue])
  {
    id v14 = [MEMORY[0x1E4F832F8] sharedState];
    int v15 = [v14 authenticateObject:v12 withPassphrase:v10];

    if (v15)
    {
      objc_initWeak(&location, self);
      id v16 = +[ICAuthenticationAlert updateDivergedCustomPasswordNotesActionAlert];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __102__ICPasswordUtilities_showUpdateDivergedPasswordForAccountPassword_oldPassword_account_displayWindow___block_invoke;
      v22[3] = &unk_1E5FDE500;
      id v23 = v12;
      id v24 = v11;
      id v25 = v10;
      objc_copyWeak(&v26, &location);
      [v16 setActionHandler:v22];
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      v19 = __102__ICPasswordUtilities_showUpdateDivergedPasswordForAccountPassword_oldPassword_account_displayWindow___block_invoke_3;
      id v20 = &unk_1E5FDE528;
      objc_copyWeak(&v21, &location);
      [v16 setDismissHandler:&v17];
      objc_msgSend(v16, "presentInWindow:completionHandler:", v13, 0, v17, v18, v19, v20);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&v26);

      objc_destroyWeak(&location);
    }
  }
}

void __102__ICPasswordUtilities_showUpdateDivergedPasswordForAccountPassword_oldPassword_account_displayWindow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[ICAccountPassphraseManager alloc] initWithAccount:*(void *)(a1 + 32)];
  [(ICAccountPassphraseManager *)v4 setWindow:v3];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __102__ICPasswordUtilities_showUpdateDivergedPasswordForAccountPassword_oldPassword_account_displayWindow___block_invoke_2;
  v7[3] = &unk_1E5FDDFF8;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  [(ICAccountPassphraseManager *)v4 updateDivergedNotesFromPassphrase:v5 toAccountPassphrase:v6 completion:v7];
  objc_destroyWeak(&v8);
}

void __102__ICPasswordUtilities_showUpdateDivergedPasswordForAccountPassword_oldPassword_account_displayWindow___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsShowingDivergedDialogue:0];
}

void __102__ICPasswordUtilities_showUpdateDivergedPasswordForAccountPassword_oldPassword_account_displayWindow___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsShowingDivergedDialogue:0];
}

- (void)accessibilityAnnounceAuthSuccessForIntent:(unint64_t)a3 withNote:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Notes Unlocked" value:@"Notes Unlocked" table:0 allowSiri:1];
  }
  if ([v6 length])
  {
    dispatch_time_t v7 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__ICPasswordUtilities_accessibilityAnnounceAuthSuccessForIntent_withNote___block_invoke;
    block[3] = &unk_1E5FD8DF0;
    id v9 = v6;
    dispatch_after(v7, MEMORY[0x1E4F14428], block);
  }
}

void __74__ICPasswordUtilities_accessibilityAnnounceAuthSuccessForIntent_withNote___block_invoke(uint64_t a1)
{
}

- (id)displayedSheet
{
  return self->_displayedSheet;
}

- (void)setDisplayedSheet:(id)a3
{
}

- (BOOL)isShowingDivergedDialogue
{
  return self->_isShowingDivergedDialogue;
}

- (void)setIsShowingDivergedDialogue:(BOOL)a3
{
  self->_isShowingDivergedDialogue = a3;
}

- (NSString)divergedAccountPassword
{
  return self->_divergedAccountPassword;
}

- (void)setDivergedAccountPassword:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_divergedAccountPassword, 0);
  objc_storeStrong(&self->_displayedSheet, 0);
}

- (void)showPasswordSetUpSheetForAccount:(void *)a1 displayWindow:completionHandler:.cold.1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Sheet hasn't displayed, displaying it for account %@", v4, v5, v6, v7, 2u);
}

void __88__ICPasswordUtilities_showPasswordSetUpSheetForAccount_displayWindow_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) shortLoggingDescription];
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Completion handler for passwordSetupViewController is triggered for account %@", v4, v5, v6, v7, 2u);
}

@end