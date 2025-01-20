@interface SFDialog
+ (id)_appLinkRedirectDialogWithMessage:(id)a3 completionHandler:(id)a4;
+ (id)_dialogWithTitle:(id)a3 message:(id)a4 acceptAction:(id)a5 secondaryAction:(id)a6 cancelAction:(id)a7 applicationModal:(BOOL)a8 completionHandler:(id)a9;
+ (id)_dialogWithTitle:(id)a3 message:(id)a4 primaryAction:(id)a5 secondaryAction:(id)a6 applicationModal:(BOOL)a7 completionHandler:(id)a8;
+ (id)authenticationDialogWithAuthenticationChallenge:(id)a3 committedURL:(id)a4 completionHandler:(id)a5;
+ (id)blockedPopupWindowDialogWithCompletionHandler:(id)a3;
+ (id)continuePrintingDialogWithTitle:(id)a3 message:(id)a4 applicationModal:(BOOL)a5 completionHandler:(id)a6;
+ (id)dialogWithWebUIAlert:(id)a3 completionHandler:(id)a4;
+ (id)formSubmissionDialogWithMessage:(id)a3 completionHandler:(id)a4;
+ (id)genericErrorDialogWithTitle:(id)a3 message:(id)a4 applicationModal:(BOOL)a5;
+ (id)increaseDatabaseQuotaDialogForOrigin:(id)a3 newQuota:(int64_t)a4 completionHandler:(id)a5;
+ (id)javaScriptAlertDialogWithMessage:(id)a3 completionHandler:(id)a4;
+ (id)javaScriptConfirmDialogWithMessage:(id)a3 completionHandler:(id)a4;
+ (id)javaScriptPromptDialogWithMessage:(id)a3 defaultText:(id)a4 completionHandler:(id)a5;
+ (id)noFeedAppDialogWithCompletionHandler:(id)a3;
+ (id)pageLoadErrorWithMessage:(id)a3;
+ (id)permanentlyAcceptCertificateDialogWithAcceptanceHandler:(id)a3;
+ (id)printBlockedDialogWithCompletionHandler:(id)a3;
+ (id)redirectDialogWithMessage:(id)a3 completionHandler:(id)a4;
+ (id)requestStorageAccessDialogForDomain:(id)a3 underCurrentDomain:(id)a4 extensionsController:(id)a5 completionHandler:(id)a6;
+ (id)telephonyNavigationDialogWithCompletionHandler:(id)a3;
+ (id)userMediaPermissionDialogWithHost:(id)a3 permissions:(unint64_t)a4 completionHandler:(id)a5;
+ (id)webExtensionAlwaysAllowDialogWithExtension:(id)a3 domains:(id)a4 includeDenyButton:(BOOL)a5 completionHandler:(id)a6;
+ (id)webExtensionDisabledBecauseItRequestsAdditionalPermissionsDialogForExtension:(id)a3 completionHandler:(id)a4;
+ (id)webExtensionPermissionDialogWithExtension:(id)a3 domains:(id)a4 showMoreOptionsForAlwaysAllow:(BOOL)a5 includeDenyButton:(BOOL)a6 completionHandler:(id)a7;
+ (id)websiteLocationDialogForURL:(id)a3 originUserVisibleName:(id)a4 preciseLocation:(BOOL)a5 browserPersona:(int64_t)a6 completionHandler:(id)a7;
- (BOOL)canceledOnApplicationBackground;
- (BOOL)canceledOnCommittedNavigation;
- (BOOL)canceledOnProvisionalNavigation;
- (BOOL)completionHandlerBlocksWebProcess;
- (BOOL)shouldIgnoreGlobalModalUIDisplayPolicy;
- (NSArray)additionalCancellationExemptions;
- (SFDialogController)dialogController;
- (id)newDialogViewRepresentation;
- (id)newViewControllerRepresentationWithCompletionHandler:(id)a3;
- (id)responseForSelectionIndex:(unint64_t)a3;
- (int64_t)presentationStyle;
- (void)completeWithResponse:(id)a3;
- (void)setDialogController:(id)a3;
@end

@implementation SFDialog

- (BOOL)canceledOnProvisionalNavigation
{
  return 1;
}

- (BOOL)canceledOnCommittedNavigation
{
  return 1;
}

- (BOOL)completionHandlerBlocksWebProcess
{
  return 0;
}

- (void)completeWithResponse:(id)a3
{
  if (self->_completed)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXTabDialogs();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[SFDialog completeWithResponse:](v3);
    }
  }
  else
  {
    self->_completed = 1;
    [(SFDialog *)self didCompleteWithResponse:a3];
  }
}

- (NSArray)additionalCancellationExemptions
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)canceledOnApplicationBackground
{
  return 0;
}

- (int64_t)presentationStyle
{
  return 0;
}

- (id)newDialogViewRepresentation
{
  return 0;
}

- (id)newViewControllerRepresentationWithCompletionHandler:(id)a3
{
  return 0;
}

- (id)responseForSelectionIndex:(unint64_t)a3
{
  return 0;
}

+ (id)authenticationDialogWithAuthenticationChallenge:(id)a3 committedURL:(id)a4 completionHandler:(id)a5
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [v9 failureResponse];
  v11 = [v10 URL];

  v12 = objc_alloc_init(SFBasicDialog);
  v13 = NSString;
  v14 = _WBSLocalizedString();
  v15 = objc_msgSend(v11, "safari_userVisibleHost");
  v16 = objc_msgSend(v13, "stringWithFormat:", v14, v15);
  [(SFBasicDialog *)v12 setTitle:v16];

  v17 = [v9 protectionSpace];

  v18 = [v17 protocol];
  [v18 isEqualToString:*MEMORY[0x1E4F289E8]];
  v19 = _WBSLocalizedString();
  [(SFBasicDialog *)v12 setMessage:v19];

  v20 = _WBSLocalizedString();
  [(SFBasicDialog *)v12 setTextPlaceholder:v20];

  v21 = _WBSLocalizedString();
  [(SFBasicDialog *)v12 setPasswordPlaceholder:v21];

  v22 = _WBSLocalizedString();
  v23 = +[SFDialogAction actionWithTitle:v22 activatingKeyboardShortcut:2 type:0];
  v32[0] = v23;
  v24 = _WBSLocalizedString();
  v25 = +[SFDialogAction actionWithTitle:v24 activatingKeyboardShortcut:1 type:1];
  v32[1] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  [(SFBasicDialog *)v12 setActions:v26];

  if (v7) {
    uint64_t v27 = objc_msgSend(v7, "safari_hasSameOriginAsURL:", v11) ^ 1;
  }
  else {
    uint64_t v27 = 0;
  }
  [(SFBasicDialog *)v12 setShouldHideWebContent:v27];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __91__SFDialog_authenticationDialogWithAuthenticationChallenge_committedURL_completionHandler___block_invoke;
  v30[3] = &unk_1E54EBC30;
  id v31 = v8;
  id v28 = v8;
  [(SFBasicDialog *)v12 setCompletionHandler:v30];

  return v12;
}

void __91__SFDialog_authenticationDialogWithAuthenticationChallenge_committedURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v11 = a3;
  id v7 = a4;
  if (a2 == 0x7FFFFFFFFFFFFFFFLL || a2 == 1)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (v11) {
      id v8 = v11;
    }
    else {
      id v8 = &stru_1EDA07C28;
    }
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = &stru_1EDA07C28;
    }
    v10 = objc_msgSend(MEMORY[0x1E4F29098], "safari_credentialWithUser:password:persistence:", v8, v9, 1);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (id)javaScriptAlertDialogWithMessage:(id)a3 completionHandler:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(SFBasicDialog);
  id v8 = v5;
  if ((unint64_t)[v8 length] > 0x7D0)
  {
    uint64_t v9 = [v8 substringToIndex:2000];
  }
  else
  {
    uint64_t v9 = [v8 copy];
  }
  v10 = (void *)v9;

  [(SFBasicDialog *)v7 setMessage:v10];
  v11 = _WBSLocalizedString();
  v12 = +[SFDialogAction actionWithTitle:v11 activatingKeyboardShortcut:1 type:1];
  v18[0] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [(SFBasicDialog *)v7 setActions:v13];

  [(SFBasicDialog *)v7 setCompletionHandlerBlocksWebProcess:1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__SFDialog_javaScriptAlertDialogWithMessage_completionHandler___block_invoke;
  v16[3] = &unk_1E54EBC30;
  id v17 = v6;
  id v14 = v6;
  [(SFBasicDialog *)v7 setCompletionHandler:v16];

  return v7;
}

uint64_t __63__SFDialog_javaScriptAlertDialogWithMessage_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)javaScriptConfirmDialogWithMessage:(id)a3 completionHandler:(id)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(SFBasicDialog);
  id v8 = v5;
  if ((unint64_t)[v8 length] > 0x7D0)
  {
    uint64_t v9 = [v8 substringToIndex:2000];
  }
  else
  {
    uint64_t v9 = [v8 copy];
  }
  v10 = (void *)v9;

  [(SFBasicDialog *)v7 setMessage:v10];
  v11 = _WBSLocalizedString();
  v12 = +[SFDialogAction actionWithTitle:v11 activatingKeyboardShortcut:2 type:0];
  v20[0] = v12;
  v13 = _WBSLocalizedString();
  id v14 = +[SFDialogAction actionWithTitle:v13 activatingKeyboardShortcut:1 type:1];
  v20[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  [(SFBasicDialog *)v7 setActions:v15];

  [(SFBasicDialog *)v7 setCompletionHandlerBlocksWebProcess:1];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __65__SFDialog_javaScriptConfirmDialogWithMessage_completionHandler___block_invoke;
  v18[3] = &unk_1E54EBC30;
  id v19 = v6;
  id v16 = v6;
  [(SFBasicDialog *)v7 setCompletionHandler:v18];

  return v7;
}

uint64_t __65__SFDialog_javaScriptConfirmDialogWithMessage_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0);
}

+ (id)javaScriptPromptDialogWithMessage:(id)a3 defaultText:(id)a4 completionHandler:(id)a5
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init(SFBasicDialog);
  id v11 = v7;
  if ((unint64_t)[v11 length] > 0x7D0)
  {
    uint64_t v12 = [v11 substringToIndex:2000];
  }
  else
  {
    uint64_t v12 = [v11 copy];
  }
  v13 = (void *)v12;

  [(SFBasicDialog *)v10 setMessage:v13];
  id v14 = v8;
  if ((unint64_t)[v14 length] > 0x3E8)
  {
    uint64_t v15 = [v14 substringToIndex:1000];
  }
  else
  {
    uint64_t v15 = [v14 copy];
  }
  id v16 = (void *)v15;

  [(SFBasicDialog *)v10 setDefaultText:v16];
  id v17 = _WBSLocalizedString();
  v18 = +[SFDialogAction actionWithTitle:v17 activatingKeyboardShortcut:2 type:0];
  v26[0] = v18;
  id v19 = _WBSLocalizedString();
  v20 = +[SFDialogAction actionWithTitle:v19 activatingKeyboardShortcut:1 type:1];
  v26[1] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  [(SFBasicDialog *)v10 setActions:v21];

  [(SFBasicDialog *)v10 setCompletionHandlerBlocksWebProcess:1];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __76__SFDialog_javaScriptPromptDialogWithMessage_defaultText_completionHandler___block_invoke;
  v24[3] = &unk_1E54EBC30;
  id v25 = v9;
  id v22 = v9;
  [(SFBasicDialog *)v10 setCompletionHandler:v24];

  return v10;
}

uint64_t __76__SFDialog_javaScriptPromptDialogWithMessage_defaultText_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2) {
    a3 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a3);
}

+ (id)telephonyNavigationDialogWithCompletionHandler:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_alloc_init(SFBasicDialog);
  id v5 = _WBSLocalizedString();
  [(SFBasicDialog *)v4 setMessage:v5];

  id v6 = _WBSLocalizedString();
  id v7 = +[SFDialogAction actionWithTitle:v6 activatingKeyboardShortcut:2 type:0];
  v15[0] = v7;
  id v8 = _WBSLocalizedString();
  id v9 = +[SFDialogAction actionWithTitle:v8 activatingKeyboardShortcut:1 type:1];
  v15[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [(SFBasicDialog *)v4 setActions:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__SFDialog_telephonyNavigationDialogWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E54EBC30;
  id v14 = v3;
  id v11 = v3;
  [(SFBasicDialog *)v4 setCompletionHandler:v13];

  return v4;
}

uint64_t __59__SFDialog_telephonyNavigationDialogWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0);
}

+ (id)dialogWithWebUIAlert:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SFWebUIDialog alloc] initWithAlert:v6 completionHandler:v5];

  return v7;
}

+ (id)_dialogWithTitle:(id)a3 message:(id)a4 primaryAction:(id)a5 secondaryAction:(id)a6 applicationModal:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = v18;
  if (v18)
  {
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    id v25 = __102__SFDialog__dialogWithTitle_message_primaryAction_secondaryAction_applicationModal_completionHandler___block_invoke;
    v26 = &unk_1E54EBC58;
    id v27 = v18;
    v20 = _Block_copy(&aBlock);
  }
  else
  {
    v20 = 0;
  }
  v21 = objc_msgSend(a1, "_dialogWithTitle:message:acceptAction:secondaryAction:cancelAction:applicationModal:completionHandler:", v14, v15, v16, 0, v17, v9, v20, aBlock, v24, v25, v26);

  return v21;
}

uint64_t __102__SFDialog__dialogWithTitle_message_primaryAction_secondaryAction_applicationModal_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0);
}

+ (id)_dialogWithTitle:(id)a3 message:(id)a4 acceptAction:(id)a5 secondaryAction:(id)a6 cancelAction:(id)a7 applicationModal:(BOOL)a8 completionHandler:(id)a9
{
  BOOL v9 = a8;
  id v14 = a6;
  id v15 = a7;
  id v16 = a9;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = objc_alloc_init(SFBasicDialog);
  v21 = v20;
  if (v9) {
    id v22 = v19;
  }
  else {
    id v22 = 0;
  }
  [(SFBasicDialog *)v20 setTitle:v22];

  [(SFBasicDialog *)v21 setMessage:v18];
  v23 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v24 = +[SFDialogAction actionWithTitle:v17 activatingKeyboardShortcut:2 type:0];

  id v25 = [v23 arrayWithObject:v24];

  if (v14)
  {
    v26 = +[SFDialogAction actionWithTitle:v14 activatingKeyboardShortcut:3 type:1];
    [v25 addObject:v26];
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __114__SFDialog__dialogWithTitle_message_acceptAction_secondaryAction_cancelAction_applicationModal_completionHandler___block_invoke;
  v30[3] = &unk_1E54EBC30;
  id v27 = v16;
  id v31 = v27;
  [(SFBasicDialog *)v21 setCompletionHandler:v30];
  if (v15)
  {
    id v28 = +[SFDialogAction actionWithTitle:v15 activatingKeyboardShortcut:1 type:1];
    [v25 addObject:v28];
  }
  [(SFBasicDialog *)v21 setActions:v25];
  [(SFBasicDialog *)v21 setPresentationStyle:v9];

  return v21;
}

uint64_t __114__SFDialog__dialogWithTitle_message_acceptAction_secondaryAction_cancelAction_applicationModal_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)formSubmissionDialogWithMessage:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = _WBSLocalizedString();
  id v8 = _WBSLocalizedString();
  BOOL v9 = +[SFDialog _dialogWithTitle:v6 message:0 primaryAction:v7 secondaryAction:v8 applicationModal:1 completionHandler:v5];

  return v9;
}

+ (id)noFeedAppDialogWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v4 = _WBSLocalizedString();
  id v5 = _WBSLocalizedString();
  id v6 = _WBSLocalizedString();
  id v7 = _WBSLocalizedString();
  id v8 = +[SFDialog _dialogWithTitle:v5 message:v4 primaryAction:v6 secondaryAction:v7 applicationModal:1 completionHandler:v3];

  return v8;
}

+ (id)redirectDialogWithMessage:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = _WBSLocalizedString();
  id v8 = _WBSLocalizedString();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__SFDialog_redirectDialogWithMessage_completionHandler___block_invoke;
  v12[3] = &unk_1E54E9D78;
  id v13 = v5;
  id v9 = v5;
  v10 = +[SFDialog _dialogWithTitle:0 message:v6 primaryAction:v7 secondaryAction:v8 applicationModal:0 completionHandler:v12];

  return v10;
}

uint64_t __56__SFDialog_redirectDialogWithMessage_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

+ (id)_appLinkRedirectDialogWithMessage:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = _WBSLocalizedString();
  id v8 = _WBSLocalizedString();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__SFDialog__appLinkRedirectDialogWithMessage_completionHandler___block_invoke;
  v12[3] = &unk_1E54EBC58;
  id v13 = v5;
  id v9 = v5;
  v10 = +[SFDialog _dialogWithTitle:0 message:v6 acceptAction:v7 secondaryAction:0 cancelAction:v8 applicationModal:0 completionHandler:v12];

  return v10;
}

uint64_t __64__SFDialog__appLinkRedirectDialogWithMessage_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)continuePrintingDialogWithTitle:(id)a3 message:(id)a4 applicationModal:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = _WBSLocalizedString();
  id v13 = _WBSLocalizedString();
  id v14 = +[SFDialog _dialogWithTitle:v11 message:v10 primaryAction:v12 secondaryAction:v13 applicationModal:v6 completionHandler:v9];

  return v14;
}

+ (id)printBlockedDialogWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v4 = _WBSLocalizedString();
  id v5 = _WBSLocalizedString();
  BOOL v6 = _WBSLocalizedString();
  id v7 = +[SFDialog _dialogWithTitle:0 message:v4 primaryAction:v5 secondaryAction:v6 applicationModal:0 completionHandler:v3];

  return v7;
}

+ (id)genericErrorDialogWithTitle:(id)a3 message:(id)a4 applicationModal:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = _WBSLocalizedString();
  id v10 = +[SFDialog _dialogWithTitle:v8 message:v7 primaryAction:v9 secondaryAction:0 applicationModal:v5 completionHandler:0];

  return v10;
}

+ (id)pageLoadErrorWithMessage:(id)a3
{
  id v3 = a3;
  v4 = _WBSLocalizedString();
  BOOL v5 = _WBSLocalizedString();
  BOOL v6 = +[SFDialog _dialogWithTitle:v4 message:v3 primaryAction:v5 secondaryAction:0 applicationModal:0 completionHandler:0];

  return v6;
}

+ (id)userMediaPermissionDialogWithHost:(id)a3 permissions:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  switch(a4)
  {
    case 1uLL:
      id v10 = NSString;
      goto LABEL_7;
    case 2uLL:
      id v10 = NSString;
      goto LABEL_7;
    case 3uLL:
      id v10 = NSString;
LABEL_7:
      id v11 = _WBSLocalizedString();
      uint64_t v12 = objc_msgSend(v10, "stringWithFormat:", v11, v8);

      goto LABEL_9;
  }
  uint64_t v12 = 0;
LABEL_9:
  id v13 = _WBSLocalizedString();
  id v14 = _WBSLocalizedString();
  id v15 = [a1 _dialogWithTitle:v12 message:0 primaryAction:v13 secondaryAction:v14 applicationModal:1 completionHandler:v9];

  return v15;
}

+ (id)blockedPopupWindowDialogWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = _WBSLocalizedString();
  BOOL v6 = _WBSLocalizedString();
  id v7 = _WBSLocalizedString();
  id v8 = [a1 _dialogWithTitle:0 message:v5 primaryAction:v6 secondaryAction:v7 applicationModal:0 completionHandler:v4];

  [v8 setCompletionHandlerBlocksWebProcess:1];

  return v8;
}

+ (id)permanentlyAcceptCertificateDialogWithAcceptanceHandler:(id)a3
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(SFBasicDialog);
  BOOL v5 = [MEMORY[0x1E4F982C0] permanentAcceptanceConfirmationTitle];
  [(SFBasicDialog *)v4 setTitle:v5];

  BOOL v6 = [MEMORY[0x1E4F982C0] permanentAcceptanceConfirmationButtonTitle];
  id v7 = +[SFDialogAction actionWithTitle:v6 activatingKeyboardShortcut:0 type:2];
  v18[0] = v7;
  id v8 = _WBSLocalizedString();
  id v9 = +[SFDialogAction actionWithTitle:v8 activatingKeyboardShortcut:1 type:1];
  v18[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  [(SFBasicDialog *)v4 setActions:v10];

  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __68__SFDialog_permanentlyAcceptCertificateDialogWithAcceptanceHandler___block_invoke;
  id v16 = &unk_1E54EBC30;
  id v17 = v3;
  id v11 = v3;
  [(SFBasicDialog *)v4 setCompletionHandler:&v13];
  -[SFBasicDialog setPresentationStyle:](v4, "setPresentationStyle:", 1, v13, v14, v15, v16);
  [(SFBasicDialog *)v4 setAlertControllerPresentsAsActionSheet:_SFDeviceIsPad() ^ 1];

  return v4;
}

uint64_t __68__SFDialog_permanentlyAcceptCertificateDialogWithAcceptanceHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

+ (id)requestStorageAccessDialogForDomain:(id)a3 underCurrentDomain:(id)a4 extensionsController:(id)a5 completionHandler:(id)a6
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v31 = a6;
  uint64_t v12 = objc_alloc_init(SFBasicDialog);
  uint64_t v13 = [v11 webExtensionForBaseURIHost:v9];
  v32 = v13;
  if (v13)
  {
    uint64_t v14 = [v13 displayName];

    id v9 = (id)v14;
  }
  id v15 = [v11 webExtensionForBaseURIHost:v10];
  id v16 = v15;
  if (v15)
  {
    uint64_t v17 = [v15 displayName];

    id v10 = (id)v17;
  }
  id v18 = NSString;
  id v19 = _WBSLocalizedString();
  v20 = objc_msgSend(v18, "stringWithFormat:", v19, v9, v10);
  [(SFBasicDialog *)v12 setTitle:v20];

  v21 = NSString;
  id v22 = _WBSLocalizedString();
  v23 = objc_msgSend(v21, "stringWithFormat:", v22, v9);
  [(SFBasicDialog *)v12 setMessage:v23];

  uint64_t v24 = _WBSLocalizedString();
  id v25 = +[SFDialogAction actionWithTitle:v24 activatingKeyboardShortcut:1 type:1];
  v35[0] = v25;
  v26 = _WBSLocalizedString();
  id v27 = +[SFDialogAction actionWithTitle:v26 activatingKeyboardShortcut:2 type:0];
  v35[1] = v27;
  id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  [(SFBasicDialog *)v12 setActions:v28];

  [(SFBasicDialog *)v12 setPresentationStyle:1];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __106__SFDialog_requestStorageAccessDialogForDomain_underCurrentDomain_extensionsController_completionHandler___block_invoke;
  v33[3] = &unk_1E54EBC30;
  id v34 = v31;
  id v29 = v31;
  [(SFBasicDialog *)v12 setCompletionHandler:v33];

  return v12;
}

uint64_t __106__SFDialog_requestStorageAccessDialogForDomain_underCurrentDomain_extensionsController_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 1);
  }
  return result;
}

+ (id)increaseDatabaseQuotaDialogForOrigin:(id)a3 newQuota:(int64_t)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x1E4F1CB10];
  id v9 = a5;
  id v10 = [v8 URLWithString:v7];
  if (objc_msgSend(v10, "safari_isSafariWebExtensionURL"))
  {
    uint64_t v11 = objc_msgSend(v10, "safari_userVisibleHostOrExtensionDisplayName");

    id v7 = (id)v11;
  }
  uint64_t v12 = [MEMORY[0x1E4F28B68] stringFromByteCount:a4 countStyle:3];
  uint64_t v13 = NSString;
  uint64_t v14 = _WBSLocalizedString();
  id v15 = [MEMORY[0x1E4FB16C8] currentDevice];
  id v16 = [v15 localizedModel];
  uint64_t v17 = objc_msgSend(v13, "stringWithFormat:", v14, v7, v12, v16);

  id v18 = _WBSLocalizedString();
  id v19 = _WBSLocalizedString();
  v20 = _WBSLocalizedString();
  v21 = +[SFDialog _dialogWithTitle:v18 message:v17 primaryAction:v20 secondaryAction:v19 applicationModal:1 completionHandler:v9];

  return v21;
}

+ (id)websiteLocationDialogForURL:(id)a3 originUserVisibleName:(id)a4 preciseLocation:(BOOL)a5 browserPersona:(int64_t)a6 completionHandler:(id)a7
{
  BOOL v41 = a5;
  v45[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a7;
  uint64_t v12 = objc_msgSend(v9, "safari_userVisibleHostWithoutWWWSubdomain");
  v42 = v10;
  if (![v12 length])
  {
    id v13 = v10;

    uint64_t v12 = v13;
  }
  uint64_t v14 = NSString;
  id v15 = _WBSLocalizedString();
  id v16 = objc_msgSend(v14, "stringWithFormat:", v15, v12);

  uint64_t v17 = NSString;
  id v18 = _WBSLocalizedString();
  id v19 = objc_msgSend(v17, "stringWithFormat:", v18, v12);

  v40 = v9;
  if (objc_msgSend(v9, "safari_isSafariWebExtensionURL"))
  {
    uint64_t v20 = objc_msgSend(v9, "safari_userVisibleHostOrExtensionDisplayName");

    v21 = NSString;
    id v22 = _WBSLocalizedString();
    uint64_t v23 = [v21 stringWithFormat:v22];

    uint64_t v24 = NSString;
    id v25 = _WBSLocalizedString();
    uint64_t v26 = [v24 stringWithFormat:v25];

    id v19 = (void *)v26;
    id v16 = (void *)v23;
    uint64_t v12 = (void *)v20;
  }
  id v27 = NSString;
  id v28 = _WBSLocalizedString();
  v39 = objc_msgSend(v27, "stringWithFormat:", v28, v12);

  id v29 = _WBSLocalizedString();
  v30 = _WBSLocalizedString();
  id v31 = objc_alloc_init(SFBasicDialog);
  [(SFBasicDialog *)v31 setTitle:v39];
  if (v41) {
    v32 = v16;
  }
  else {
    v32 = v19;
  }
  [(SFBasicDialog *)v31 setMessage:v32];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __111__SFDialog_websiteLocationDialogForURL_originUserVisibleName_preciseLocation_browserPersona_completionHandler___block_invoke;
  v43[3] = &unk_1E54EBC30;
  id v44 = v11;
  id v33 = v11;
  [(SFBasicDialog *)v31 setCompletionHandler:v43];
  id v34 = +[SFDialogAction actionWithTitle:v30 activatingKeyboardShortcut:1 type:0];
  v45[0] = v34;
  v35 = +[SFDialogAction actionWithTitle:v29 activatingKeyboardShortcut:2 type:0];
  v45[1] = v35;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  v37 = v36 = v16;
  [(SFBasicDialog *)v31 setActions:v37];

  [(SFBasicDialog *)v31 setPresentationStyle:1];

  return v31;
}

uint64_t __111__SFDialog_websiteLocationDialogForURL_originUserVisibleName_preciseLocation_browserPersona_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 1);
  }
  return result;
}

+ (id)webExtensionPermissionDialogWithExtension:(id)a3 domains:(id)a4 showMoreOptionsForAlwaysAllow:(BOOL)a5 includeDenyButton:(BOOL)a6 completionHandler:(id)a7
{
  v40[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a7;
  id v13 = [v10 displayShortName];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __128__SFDialog_webExtensionPermissionDialogWithExtension_domains_showMoreOptionsForAlwaysAllow_includeDenyButton_completionHandler___block_invoke;
  v37[3] = &unk_1E54EBC80;
  id v14 = v11;
  id v38 = v14;
  id v30 = v13;
  id v39 = v30;
  uint64_t v15 = __128__SFDialog_webExtensionPermissionDialogWithExtension_domains_showMoreOptionsForAlwaysAllow_includeDenyButton_completionHandler___block_invoke((uint64_t)v37);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __128__SFDialog_webExtensionPermissionDialogWithExtension_domains_showMoreOptionsForAlwaysAllow_includeDenyButton_completionHandler___block_invoke_2;
  v34[3] = &unk_1E54EBC80;
  id v28 = v14;
  id v35 = v28;
  id v27 = v10;
  id v36 = v27;
  id v16 = __128__SFDialog_webExtensionPermissionDialogWithExtension_domains_showMoreOptionsForAlwaysAllow_includeDenyButton_completionHandler___block_invoke_2((uint64_t)v34);
  uint64_t v17 = objc_alloc_init(SFBasicDialog);
  [(SFBasicDialog *)v17 setPresentationStyle:1];
  id v29 = (void *)v15;
  [(SFBasicDialog *)v17 setTitle:v15];
  [(SFBasicDialog *)v17 setMessage:v16];
  LOBYTE(v10) = a6;
  id v18 = _WBSLocalizedString();
  id v19 = +[SFDialogAction actionWithTitle:v18 activatingKeyboardShortcut:1 type:1];

  uint64_t v20 = _WBSLocalizedString();
  v21 = _WBSLocalizedString();
  id v22 = +[SFDialogAction actionWithTitle:v21 activatingKeyboardShortcut:2 type:0 isPreferredAction:1];
  v40[0] = v22;
  uint64_t v23 = +[SFDialogAction actionWithTitle:v20 activatingKeyboardShortcut:3 type:0];
  v40[1] = v23;
  v40[2] = v19;
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];
  [(SFBasicDialog *)v17 setActions:v24];

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __128__SFDialog_webExtensionPermissionDialogWithExtension_domains_showMoreOptionsForAlwaysAllow_includeDenyButton_completionHandler___block_invoke_3;
  v31[3] = &unk_1E54EBCA8;
  char v33 = (char)v10;
  id v32 = v12;
  id v25 = v12;
  [(SFBasicDialog *)v17 setCompletionHandler:v31];
  [(SFBasicDialog *)v17 setCompletionHandlerBlocksWebProcess:1];

  return v17;
}

id __128__SFDialog_webExtensionPermissionDialogWithExtension_domains_showMoreOptionsForAlwaysAllow_includeDenyButton_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) count];
  if (v2 == 3)
  {
    id v8 = NSString;
    id v4 = _WBSLocalizedString();
    uint64_t v9 = *(void *)(a1 + 40);
    BOOL v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    id v10 = [*(id *)(a1 + 32) objectAtIndexedSubscript:1];
    id v11 = [*(id *)(a1 + 32) objectAtIndexedSubscript:2];
    id v7 = objc_msgSend(v8, "localizedStringWithFormat:", v4, v9, v6, v10, v11);
  }
  else
  {
    if (v2 == 2)
    {
      id v12 = NSString;
      id v4 = _WBSLocalizedString();
      uint64_t v13 = *(void *)(a1 + 40);
      BOOL v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
      id v10 = [*(id *)(a1 + 32) objectAtIndexedSubscript:1];
      uint64_t v14 = objc_msgSend(v12, "stringWithFormat:", v4, v13, v6, v10);
    }
    else
    {
      if (v2 == 1)
      {
        id v3 = NSString;
        id v4 = _WBSLocalizedString();
        uint64_t v5 = *(void *)(a1 + 40);
        BOOL v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
        id v7 = objc_msgSend(v3, "stringWithFormat:", v4, v5, v6);
        goto LABEL_10;
      }
      uint64_t v15 = [*(id *)(a1 + 32) count] - 2;
      id v16 = NSString;
      id v4 = _WBSLocalizedString();
      uint64_t v17 = *(void *)(a1 + 40);
      BOOL v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
      id v10 = [*(id *)(a1 + 32) objectAtIndexedSubscript:1];
      uint64_t v14 = objc_msgSend(v16, "localizedStringWithFormat:", v4, v17, v6, v10, v15);
    }
    id v7 = (void *)v14;
  }

LABEL_10:

  return v7;
}

id __128__SFDialog_webExtensionPermissionDialogWithExtension_domains_showMoreOptionsForAlwaysAllow_includeDenyButton_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) count];
  if ((unint64_t)(v2 - 2) < 2)
  {
    if ([*(id *)(a1 + 40) hasAbilityToInjectContentIntoWebpages]) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  if (v2 == 1)
  {
    if ([*(id *)(a1 + 40) hasAbilityToInjectContentIntoWebpages]) {
      goto LABEL_12;
    }
LABEL_7:
    [*(id *)(a1 + 40) hasDeclarativeNetRequestHostAccessPermission];
LABEL_12:
    id v4 = _WBSLocalizedString();
    goto LABEL_14;
  }
  if (![*(id *)(a1 + 40) hasAbilityToInjectContentIntoWebpages]) {
    [*(id *)(a1 + 40) hasDeclarativeNetRequestHostAccessPermission];
  }
  id v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v5 = _WBSLocalizedString();
  id v4 = [v3 stringWithString:v5];

  [v4 appendString:@"\n"];
  BOOL v6 = [*(id *)(a1 + 32) componentsJoinedByString:@"\n"];
  [v4 appendString:v6];

LABEL_14:

  return v4;
}

void __128__SFDialog_webExtensionPermissionDialogWithExtension_domains_showMoreOptionsForAlwaysAllow_includeDenyButton_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8 = a3;
  id v7 = a4;
  if (a2 <= 1)
  {
    if (!a2 || a2 == 1) {
      goto LABEL_9;
    }
LABEL_12:
    __break(0xC471u);
    return;
  }
  if (a2 != 2 && a2 != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_12;
  }
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)webExtensionAlwaysAllowDialogWithExtension:(id)a3 domains:(id)a4 includeDenyButton:(BOOL)a5 completionHandler:(id)a6
{
  v31[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  id v11 = a4;
  id v12 = objc_alloc_init(SFBasicDialog);
  uint64_t v13 = [v9 displayShortName];
  [(SFBasicDialog *)v12 setPresentationStyle:1];
  uint64_t v14 = NSString;
  uint64_t v15 = _WBSLocalizedString();
  id v27 = (void *)v13;
  id v16 = objc_msgSend(v14, "stringWithFormat:", v15, v13);
  [(SFBasicDialog *)v12 setTitle:v16];

  if (![v9 hasAbilityToInjectContentIntoWebpages]) {
    [v9 hasDeclarativeNetRequestHostAccessPermission];
  }
  uint64_t v17 = _WBSLocalizedString();
  [(SFBasicDialog *)v12 setMessage:v17];

  id v18 = _WBSLocalizedString();
  id v19 = +[SFDialogAction actionWithTitle:v18 activatingKeyboardShortcut:1 type:0];

  [v11 count];
  uint64_t v20 = _WBSLocalizedString();
  v21 = +[SFDialogAction actionWithTitle:v20 activatingKeyboardShortcut:2 type:0];
  v31[0] = v21;
  id v22 = _WBSLocalizedString();
  uint64_t v23 = +[SFDialogAction actionWithTitle:v22 activatingKeyboardShortcut:3 type:0];
  v31[1] = v23;
  v31[2] = v19;
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];
  [(SFBasicDialog *)v12 setActions:v24];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __99__SFDialog_webExtensionAlwaysAllowDialogWithExtension_domains_includeDenyButton_completionHandler___block_invoke;
  v28[3] = &unk_1E54EBCA8;
  id v29 = v10;
  BOOL v30 = a5;
  id v25 = v10;
  [(SFBasicDialog *)v12 setCompletionHandler:v28];
  [(SFBasicDialog *)v12 setCompletionHandlerBlocksWebProcess:1];

  return v12;
}

void __99__SFDialog_webExtensionAlwaysAllowDialogWithExtension_domains_includeDenyButton_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a3;
  id v7 = a4;
  if (a2 > 1)
  {
    if (a2 == 2)
    {
      id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
      goto LABEL_10;
    }
    if (a2 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
      goto LABEL_10;
    }
LABEL_13:
    __break(0xC471u);
    return;
  }
  if (a2)
  {
    if (a2 == 1)
    {
      id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
      goto LABEL_10;
    }
    goto LABEL_13;
  }
  id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_10:
  v8();
}

+ (id)webExtensionDisabledBecauseItRequestsAdditionalPermissionsDialogForExtension:(id)a3 completionHandler:(id)a4
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(SFBasicDialog);
  [(SFBasicDialog *)v7 setPresentationStyle:1];
  id v8 = NSString;
  id v9 = _WBSLocalizedString();
  id v10 = objc_msgSend(v8, "stringWithFormat:", v9, v6);

  [(SFBasicDialog *)v7 setTitle:v10];
  id v11 = _WBSLocalizedString();
  [(SFBasicDialog *)v7 setMessage:v11];

  id v12 = _WBSLocalizedString();
  uint64_t v13 = +[SFDialogAction actionWithTitle:v12 activatingKeyboardShortcut:3 type:0];
  v21[0] = v13;
  uint64_t v14 = _WBSLocalizedString();
  uint64_t v15 = +[SFDialogAction actionWithTitle:v14 activatingKeyboardShortcut:2 type:0];
  v21[1] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  [(SFBasicDialog *)v7 setActions:v16];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __107__SFDialog_webExtensionDisabledBecauseItRequestsAdditionalPermissionsDialogForExtension_completionHandler___block_invoke;
  v19[3] = &unk_1E54EBC30;
  id v20 = v5;
  id v17 = v5;
  [(SFBasicDialog *)v7 setCompletionHandler:v19];

  return v7;
}

void __107__SFDialog_webExtensionDisabledBecauseItRequestsAdditionalPermissionsDialogForExtension_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a3;
  id v7 = a4;
  if (a2 == 0x7FFFFFFFFFFFFFFFLL || a2 == 1)
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (a2)
    {
      __break(0xC471u);
      return;
    }
    id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v8();
}

- (BOOL)shouldIgnoreGlobalModalUIDisplayPolicy
{
  return self->_shouldIgnoreGlobalModalUIDisplayPolicy;
}

- (SFDialogController)dialogController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dialogController);

  return (SFDialogController *)WeakRetained;
}

- (void)setDialogController:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)completeWithResponse:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18C354000, log, OS_LOG_TYPE_ERROR, "Dialog completion handler called multiple times", v1, 2u);
}

@end