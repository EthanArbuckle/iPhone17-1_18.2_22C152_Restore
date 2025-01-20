@interface ICPasswordEntryAlertController
- (BOOL)isAuthenticating;
- (BOOL)isPasswordDiverged;
- (ICPasswordEntryAlertController)initWithDisplayWindow:(id)a3;
- (NSString)divergedAccountPassword;
- (NSString)wrongAccountName;
- (UIWindow)displayWindow;
- (id)passwordAlertControllerWithPrompt:(id)a3 passwordHandler:(id)a4 forgotHandler:(id)a5 cancelHandler:(id)a6;
- (unint64_t)numberOfFailedAttempts;
- (void)authenticateWithPrompt:(id)a3 completionHandler:(id)a4;
- (void)didAuthenticateWithPassword:(id)a3 prompt:(id)a4 completionHandler:(id)a5;
- (void)setAuthenticating:(BOOL)a3;
- (void)setDivergedAccountPassword:(id)a3;
- (void)setNumberOfFailedAttempts:(unint64_t)a3;
- (void)setPasswordDiverged:(BOOL)a3;
- (void)setWrongAccountName:(id)a3;
@end

@implementation ICPasswordEntryAlertController

- (ICPasswordEntryAlertController)initWithDisplayWindow:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICPasswordEntryAlertController;
  v6 = [(ICPasswordEntryAlertController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_displayWindow, a3);
  }

  return v7;
}

- (void)authenticateWithPrompt:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  if ([(ICPasswordEntryAlertController *)self isAuthenticating])
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICPasswordEntryAlertController authenticateWithPrompt:completionHandler:]" simulateCrash:1 showAlert:0 format:@"This is a one-shot object — you can only call the authentication method once"];
    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    [(ICPasswordEntryAlertController *)self setAuthenticating:1];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __75__ICPasswordEntryAlertController_authenticateWithPrompt_completionHandler___block_invoke;
    v21[3] = &unk_1E5FD9D50;
    v21[4] = self;
    id v22 = v6;
    v23 = v7;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __75__ICPasswordEntryAlertController_authenticateWithPrompt_completionHandler___block_invoke_2;
    v17[3] = &unk_1E5FD9DA0;
    id v18 = v22;
    v19 = self;
    v20 = v23;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __75__ICPasswordEntryAlertController_authenticateWithPrompt_completionHandler___block_invoke_5;
    v15[3] = &unk_1E5FD9320;
    v16 = v20;
    v8 = [(ICPasswordEntryAlertController *)self passwordAlertControllerWithPrompt:v18 passwordHandler:v21 forgotHandler:v17 cancelHandler:v15];
    objc_super v9 = [(ICPasswordEntryAlertController *)self displayWindow];
    v10 = [v9 rootViewController];
    v11 = [v10 presentedViewController];
    v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      v14 = [(ICPasswordEntryAlertController *)self displayWindow];
      id v13 = [v14 rootViewController];
    }
    [v13 presentViewController:v8 animated:1 completion:0];
  }
}

uint64_t __75__ICPasswordEntryAlertController_authenticateWithPrompt_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) didAuthenticateWithPassword:a2 prompt:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

void __75__ICPasswordEntryAlertController_authenticateWithPrompt_completionHandler___block_invoke_2(id *a1)
{
  if ([a1[4] intent] == 4)
  {
    id v2 = a1[6];
    if (v2)
    {
      v3 = (void (*)(void))*((void *)v2 + 2);
      v3();
    }
  }
  else if ([a1[4] intent] == 7)
  {
    v4 = +[ICAuthenticationAlert forgotCustomPasswordSwitchAnywayConfirmationAlert];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__ICPasswordEntryAlertController_authenticateWithPrompt_completionHandler___block_invoke_3;
    v11[3] = &unk_1E5FD9D78;
    id v12 = a1[6];
    [v4 setActionHandler:v11];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    v8 = __75__ICPasswordEntryAlertController_authenticateWithPrompt_completionHandler___block_invoke_4;
    objc_super v9 = &unk_1E5FD9D78;
    id v10 = a1[6];
    [v4 setDismissHandler:&v6];
    id v5 = objc_msgSend(a1[5], "displayWindow", v6, v7, v8, v9);
    [v4 presentInWindow:v5 completionHandler:0];
  }
}

uint64_t __75__ICPasswordEntryAlertController_authenticateWithPrompt_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  }
  return result;
}

uint64_t __75__ICPasswordEntryAlertController_authenticateWithPrompt_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __75__ICPasswordEntryAlertController_authenticateWithPrompt_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)didAuthenticateWithPassword:(id)a3 prompt:(id)a4 completionHandler:(id)a5
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 account];
  uint64_t v12 = [v11 isPassphraseCorrect:v8];

  id v13 = [v9 authenticationObject];
  uint64_t v14 = [v13 isPassphraseCorrect:v8];

  v15 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v54 = [NSNumber numberWithBool:v12];
    v52 = [NSNumber numberWithBool:v14];
    v50 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ICPasswordEntryAlertController numberOfFailedAttempts](self, "numberOfFailedAttempts"));
    objc_msgSend(NSNumber, "numberWithBool:", -[ICPasswordEntryAlertController isPasswordDiverged](self, "isPasswordDiverged"));
    *(_DWORD *)buf = 138413570;
    v69 = v54;
    __int16 v70 = 2112;
    v71 = v52;
    __int16 v72 = 2112;
    v73 = v50;
    __int16 v74 = 2112;
    uint64_t v75 = v76 = 2080;
    v51 = (void *)v75;
    v77 = "-[ICPasswordEntryAlertController didAuthenticateWithPassword:prompt:completionHandler:]";
    __int16 v78 = 1024;
    int v79 = 88;
    _os_log_debug_impl(&dword_1B08EB000, v15, OS_LOG_TYPE_DEBUG, "Authenticated with custom password {isCorrectForAccount: %@, isCorrectForObject: %@, #failedAttempts: %@, isPasswordDiverged: %@}%s:%d", buf, 0x3Au);
  }
  if (v14
    && ([MEMORY[0x1E4F832F8] sharedState],
        v16 = objc_claimAutoreleasedReturnValue(),
        [v9 authenticationObject],
        v17 = objc_claimAutoreleasedReturnValue(),
        int v18 = [v16 authenticateObject:v17 withPassphrase:v8],
        v17,
        v16,
        v18))
  {
    if ([(ICPasswordEntryAlertController *)self isPasswordDiverged])
    {
      v19 = +[ICPasswordUtilities sharedInstance];
      v20 = [(ICPasswordEntryAlertController *)self divergedAccountPassword];
      v21 = [v9 account];
      id v22 = [(ICPasswordEntryAlertController *)self displayWindow];
      [v19 showUpdateDivergedPasswordForAccountPassword:v20 oldPassword:v8 account:v21 displayWindow:v22];
    }
    if ([v9 intent] == 7)
    {
      v23 = [ICLongRunningTaskController alloc];
      v24 = [(ICPasswordEntryAlertController *)self displayWindow];
      v25 = [(ICLongRunningTaskController *)v23 initWithWindow:v24 intervalBeforeOpeningProgressDialog:1.0];

      [(ICLongRunningTaskController *)v25 setIndeterminate:1];
      [(ICLongRunningTaskController *)v25 setShouldShowCircularProgress:1];
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke;
      v65[3] = &unk_1E5FD9398;
      id v66 = v9;
      id v67 = v8;
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke_3;
      v63[3] = &unk_1E5FD9DC8;
      id v64 = v10;
      [(ICLongRunningTaskController *)v25 startTask:v65 completionBlock:v63];
    }
    else if ([v9 intent] == 1 {
           && ([v9 note], v46 = objc_claimAutoreleasedReturnValue(), v46, v46))
    }
    {
      v47 = +[ICAuthenticationAlert updateDivergedCustomPasswordAttachmentsActionAlert];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke_4;
      v59[3] = &unk_1E5FD9E18;
      id v60 = v9;
      id v61 = v8;
      id v48 = v10;
      id v62 = v48;
      [v47 setActionHandler:v59];
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke_6;
      v57[3] = &unk_1E5FD9D78;
      id v58 = v48;
      [v47 setDismissHandler:v57];
      v49 = [(ICPasswordEntryAlertController *)self displayWindow];
      [v47 presentInWindow:v49 completionHandler:0];
    }
    else if (v10)
    {
      (*((void (**)(id, uint64_t))v10 + 2))(v10, 2);
    }
  }
  else
  {
    [(ICPasswordEntryAlertController *)self setNumberOfFailedAttempts:[(ICPasswordEntryAlertController *)self numberOfFailedAttempts] + 1];
    v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v26 postNotificationName:@"ICPasswordEntryAlertControllerAttemptDidFailNotification" object:self];

    if (![v9 intent])
    {
      if (v12) {
        [(ICPasswordEntryAlertController *)self setDivergedAccountPassword:v8];
      }
      [(ICPasswordEntryAlertController *)self setPasswordDiverged:v12 | [(ICPasswordEntryAlertController *)self isPasswordDiverged]];
      v27 = (void *)MEMORY[0x1E4F83278];
      v28 = [MEMORY[0x1E4F83428] sharedContext];
      v29 = [v28 managedObjectContext];
      v30 = [v27 allActiveAccountsInContext:v29];
      if ((unint64_t)[v30 count] < 2) {
        LOBYTE(v12) = 1;
      }

      if ((v12 & 1) == 0)
      {
        v31 = [v9 account];
        v32 = [v31 accountName];
        v53 = objc_msgSend(v32, "ic_trimmedString");

        v33 = (void *)MEMORY[0x1E4F83278];
        v34 = [MEMORY[0x1E4F83428] sharedContext];
        v35 = [v34 managedObjectContext];
        v36 = [v33 allActiveAccountsInContext:v35];
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke_7;
        v55[3] = &unk_1E5FD9E40;
        id v56 = v8;
        v37 = objc_msgSend(v36, "ic_objectPassingTest:", v55);

        v38 = [v37 accountName];
        v39 = objc_msgSend(v38, "ic_trimmedString");

        v40 = [v9 account];
        v41 = [v40 cryptoStrategy];
        v42 = [v9 object];
        int v43 = [v41 hasSameKeyAsObject:v42];

        if (!v37 || !v43 || ![v53 length] || (uint64_t v44 = objc_msgSend(v39, "length"), v45 = v39, !v44)) {
          v45 = 0;
        }
        [(ICPasswordEntryAlertController *)self setWrongAccountName:v45];
      }
    }
    [(ICPasswordEntryAlertController *)self setAuthenticating:0];
    [(ICPasswordEntryAlertController *)self authenticateWithPrompt:v9 completionHandler:v10];
  }
}

void __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F83428] sharedContext];
  v3 = [v2 workerManagedObjectContext];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5FD8FE8;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  [v4 performBlockAndWait:v5];
}

void __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  id v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) account];
  id v4 = [v3 objectID];
  id v5 = [v2 objectWithID:v4];
  ICCheckedDynamicCast();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [MEMORY[0x1E4F832F8] sharedState];
  [v6 authenticateAllNotesInAccount:v7 withPassphrase:*(void *)(a1 + 48)];
}

uint64_t __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  }
  return result;
}

void __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [ICNoteLockManager alloc];
  id v5 = [*(id *)(a1 + 32) note];
  id v6 = [(ICNoteLockManager *)v4 initWithNote:v5];

  [(ICNoteLockManager *)v6 setWindow:v3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke_5;
  v8[3] = &unk_1E5FD9DF0;
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  [(ICNoteLockManager *)v6 updateDivergedAttachmentsWithPassphrase:v7 completion:v8];
}

uint64_t __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke_5(uint64_t a1, int a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a2) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = 1;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

uint64_t __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 isPassphraseCorrect:*(void *)(a1 + 32)];
}

- (id)passwordAlertControllerWithPrompt:(id)a3 passwordHandler:(id)a4 forgotHandler:(id)a5 cancelHandler:(id)a6
{
  id v10 = a3;
  id v46 = a4;
  id v47 = a5;
  id v11 = a6;
  uint64_t v12 = [v10 account];
  id v13 = [v12 accountName];
  id v48 = objc_msgSend(v13, "ic_trimmedString");

  v49 = [v10 title];
  uint64_t v14 = [v10 reason];
  if ([v10 intent] == 7) {
    unint64_t v15 = 1;
  }
  else {
    unint64_t v15 = 2;
  }
  if (![v10 intent])
  {
    v39 = [(ICPasswordEntryAlertController *)self wrongAccountName];
    if ([v39 length])
    {
      uint64_t v40 = [v48 length];

      if (v40)
      {
        uint64_t v41 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Wrong Password" value:@"Wrong Password" table:0 allowSiri:1];

        [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"You’ve entered your “%@” password. Enter your “%@” password." value:@"You’ve entered your “%@” password. Enter your “%@” password." table:0 allowSiri:1];
        uint64_t v43 = v42 = v11;
        uint64_t v44 = NSString;
        v45 = [(ICPasswordEntryAlertController *)self wrongAccountName];
        uint64_t v18 = objc_msgSend(v44, "localizedStringWithFormat:", v43, v45, v48, v46, v47);

        uint64_t v14 = (void *)v43;
        id v11 = v42;
        v49 = (void *)v41;
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  if ([(ICPasswordEntryAlertController *)self isPasswordDiverged])
  {
    v16 = (void *)MEMORY[0x1E4F83770];
    v17 = @"That’s not the correct password for this note. Try a different password.";
LABEL_9:
    uint64_t v18 = [v16 localizedFrameworkStringForKey:v17 value:v17 table:0 allowSiri:1];
LABEL_10:

    uint64_t v14 = (void *)v18;
    goto LABEL_11;
  }
  if ([(ICPasswordEntryAlertController *)self numberOfFailedAttempts])
  {
    v16 = (void *)MEMORY[0x1E4F83770];
    v17 = @"That’s not the correct password. Please try again.";
    goto LABEL_9;
  }
LABEL_11:
  if ([(ICPasswordEntryAlertController *)self isPasswordDiverged]
    || [(ICPasswordEntryAlertController *)self numberOfFailedAttempts] >= v15)
  {
    v19 = [v10 authenticationObject];
    v20 = [v19 passwordHint];

    if ([v20 length])
    {
      v21 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Hint: %@" value:@"Hint: %@" table:0 allowSiri:1];
      id v22 = objc_msgSend(NSString, "localizedStringWithFormat:", v21, v20);
      [v14 stringByAppendingFormat:@"\n\n%@", v22];
      v24 = id v23 = v11;

      uint64_t v14 = (void *)v24;
      id v11 = v23;
    }
  }
  v25 = +[ICAlertController alertControllerWithTitle:v49 message:v14 preferredStyle:1];
  [v25 setCanAppearAbovePasswordEntryView:1];
  [v25 setDismissWithoutActionBlock:v11];
  objc_initWeak(location, v25);
  [v25 addTextFieldWithConfigurationHandler:&__block_literal_global_14];
  if ([(ICPasswordEntryAlertController *)self numberOfFailedAttempts] >= v15
    && [v10 intent] == 7)
  {
    id v26 = v11;
    v27 = (void *)MEMORY[0x1E4FB1410];
    v28 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Forgot Password" value:@"Forgot Password" table:0 allowSiri:1];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __112__ICPasswordEntryAlertController_passwordAlertControllerWithPrompt_passwordHandler_forgotHandler_cancelHandler___block_invoke_2;
    v56[3] = &unk_1E5FD9E88;
    objc_copyWeak(&v58, location);
    id v57 = v47;
    v29 = [v27 actionWithTitle:v28 style:0 handler:v56];

    [v25 addAction:v29];
    objc_destroyWeak(&v58);
    id v11 = v26;
  }
  v30 = (void *)MEMORY[0x1E4FB1410];
  v31 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Cancel" value:@"Cancel" table:0 allowSiri:1];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __112__ICPasswordEntryAlertController_passwordAlertControllerWithPrompt_passwordHandler_forgotHandler_cancelHandler___block_invoke_3;
  v53[3] = &unk_1E5FD9E88;
  objc_copyWeak(&v55, location);
  id v32 = v11;
  id v54 = v32;
  v33 = [v30 actionWithTitle:v31 style:1 handler:v53];

  [v25 addAction:v33];
  v34 = (void *)MEMORY[0x1E4FB1410];
  v35 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"OK" value:@"OK" table:0 allowSiri:1];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __112__ICPasswordEntryAlertController_passwordAlertControllerWithPrompt_passwordHandler_forgotHandler_cancelHandler___block_invoke_4;
  v50[3] = &unk_1E5FD9E88;
  objc_copyWeak(&v52, location);
  id v36 = v46;
  id v51 = v36;
  v37 = [v34 actionWithTitle:v35 style:0 handler:v50];

  [v25 addAction:v37];
  objc_destroyWeak(&v52);

  objc_destroyWeak(&v55);
  objc_destroyWeak(location);

  return v25;
}

void __112__ICPasswordEntryAlertController_passwordAlertControllerWithPrompt_passwordHandler_forgotHandler_cancelHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F83770];
  id v4 = a2;
  uint64_t v3 = [v2 localizedFrameworkStringForKey:@"Password" value:@"Password" table:0 allowSiri:1];
  [v4 setPlaceholder:v3];

  [v4 setTextContentType:*MEMORY[0x1E4FB2FB0]];
  [v4 setSecureTextEntry:1];
}

uint64_t __112__ICPasswordEntryAlertController_passwordAlertControllerWithPrompt_passwordHandler_forgotHandler_cancelHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setDidPerformAction:1];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __112__ICPasswordEntryAlertController_passwordAlertControllerWithPrompt_passwordHandler_forgotHandler_cancelHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setDidPerformAction:1];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __112__ICPasswordEntryAlertController_passwordAlertControllerWithPrompt_passwordHandler_forgotHandler_cancelHandler___block_invoke_4(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setDidPerformAction:1];

  id v4 = objc_loadWeakRetained(v2);
  id v5 = [v4 textFields];
  id v6 = [v5 firstObject];
  id v8 = [v6 text];

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
}

- (UIWindow)displayWindow
{
  return self->_displayWindow;
}

- (BOOL)isAuthenticating
{
  return self->_authenticating;
}

- (void)setAuthenticating:(BOOL)a3
{
  self->_authenticating = a3;
}

- (unint64_t)numberOfFailedAttempts
{
  return self->_numberOfFailedAttempts;
}

- (void)setNumberOfFailedAttempts:(unint64_t)a3
{
  self->_numberOfFailedAttempts = a3;
}

- (BOOL)isPasswordDiverged
{
  return self->_passwordDiverged;
}

- (void)setPasswordDiverged:(BOOL)a3
{
  self->_passwordDiverged = a3;
}

- (NSString)wrongAccountName
{
  return self->_wrongAccountName;
}

- (void)setWrongAccountName:(id)a3
{
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
  objc_storeStrong((id *)&self->_wrongAccountName, 0);
  objc_storeStrong((id *)&self->_displayWindow, 0);
}

@end