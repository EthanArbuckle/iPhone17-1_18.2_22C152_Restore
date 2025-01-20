@interface WFDialogTransformer
- (BOOL)action:(id)a3 canProvideInputForParameter:(id)a4;
- (BOOL)allowsHandoff;
- (BOOL)hasPresentedFirstDialog;
- (BOOL)isRunningWithExternalUI;
- (BOOL)isRunningWithSiriUI;
- (BOOL)isRunningWithToolKitClient;
- (BOOL)performSiriRequest:(id)a3 completionHandler:(id)a4;
- (BOOL)shouldHandleAlertAsSiriDialog:(id)a3;
- (BOOL)shouldNotHandoff;
- (NSArray)airPlayRouteIDs;
- (NSArray)allowedParameterClasses;
- (NSDate)workflowStartTime;
- (NSString)runSource;
- (NSString)userInterfaceType;
- (WFAction)currentAction;
- (WFChooseFromListDataStore)chooseFromListDataStore;
- (WFDialogAttribution)attribution;
- (WFDialogTransformer)initWithWorkflow:(id)a3 userInterfacePresenter:(id)a4 runSource:(id)a5 runningContext:(id)a6;
- (WFDialogTransformerDelegate)delegate;
- (WFExternalUIPresenter)externalUIPresenter;
- (WFSequentialParameterInputProvider)parameterInputProvider;
- (WFSiriWorkflowRunnerClientOptions)siriOptions;
- (WFUIPresenter)userInterfacePresenter;
- (WFWorkflow)workflow;
- (WFWorkflowRunViewSource)runViewSource;
- (WFWorkflowRunningContext)runningContext;
- (id)attributionAllowingAction:(BOOL)a3;
- (id)attributionIcon;
- (id)attributionTitle;
- (id)parameterInputCompletionHandler;
- (id)privacyAttribution;
- (id)shortcutsAppAttribution;
- (id)workflowName;
- (int64_t)executionContext;
- (int64_t)numberOfDialogsPresented;
- (unint64_t)presentationMode;
- (void)action:(id)a3 provideInputForParameters:(id)a4 withDefaultStates:(id)a5 prompts:(id)a6 completionHandler:(id)a7;
- (void)cancel;
- (void)cleanupListDialogRequestIfNeeded:(id)a3;
- (void)configureIntent:(id)a3;
- (void)configureSmartPromptIntent:(id)a3 withConfiguration:(id)a4;
- (void)didFinishActionWithIdentifier:(id)a3;
- (void)didStartActionWithIdentifier:(id)a3;
- (void)dismissPresentedContentWithCompletionHandler:(id)a3;
- (void)executeSmartPromptIntentWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)getEnvironmentForLinkViewSnippetWithCompletion:(id)a3;
- (void)getPreferredSizeForLinkViewSnippetWithCompletion:(id)a3;
- (void)handleAlertAsSiriDialog:(id)a3;
- (void)handleAlertWithDatePicker:(id)a3;
- (void)handleAlertWithMultipleButtons:(id)a3;
- (void)handleAlertWithTextField:(id)a3;
- (void)handleAppProtectionRequestWithBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)handleDialogRequest:(id)a3 completionHandler:(id)a4;
- (void)handleSimpleAlert:(id)a3;
- (void)handleUIRequestResponse:(id)a3 error:(id)a4 forRequest:(id)a5 shouldFailoverToLocalUI:(BOOL)a6 completionHandler:(id)a7;
- (void)openAppWithBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)openURL:(id)a3 withBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)prepareListDialogRequestIfNeeded:(id)a3 completionHandler:(id)a4;
- (void)presentAlert:(id)a3;
- (void)presentAlertWithSmartPromptConfiguration:(id)a3 completionHandler:(id)a4;
- (void)requestActionInterfacePresentationForActionClassName:(id)a3 classNamesByType:(id)a4 completionHandler:(id)a5;
- (void)requestAuthorizationWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)requestFileAccessForURLs:(id)a3 workflowName:(id)a4 workflowID:(id)a5 completionHandler:(id)a6;
- (void)resolveDescriptor:(id)a3 completionHandler:(id)a4;
- (void)sequentialParameterInputProvider:(id)a3 didAdvanceToParameter:(id)a4 action:(id)a5 defaultState:(id)a6 prompt:(id)a7 linkDialog:(id)a8 completion:(id)a9;
- (void)sequentialParameterInputProvider:(id)a3 didFinishWithInputtedStates:(id)a4;
- (void)sequentialParameterInputProviderDidCancel:(id)a3;
- (void)setAllowedParameterClasses:(id)a3;
- (void)setAllowsHandoff:(BOOL)a3;
- (void)setChooseFromListDataStore:(id)a3;
- (void)setCurrentAction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExternalUIPresenter:(id)a3;
- (void)setHasPresentedFirstDialog:(BOOL)a3;
- (void)setNumberOfDialogsPresented:(int64_t)a3;
- (void)setParameterInputCompletionHandler:(id)a3;
- (void)setParameterInputProvider:(id)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setRunViewSource:(id)a3;
- (void)setSiriOptions:(id)a3;
- (void)setUserInterfacePresenter:(id)a3;
- (void)setWorkflow:(id)a3;
- (void)setWorkflowStartTime:(id)a3;
- (void)shouldRunFollowUpActionWithBundleIdentifier:(id)a3 actionIdentifier:(id)a4 parameterValues:(id)a5 encodedToolInvocation:(id)a6 showOutputActionOptions:(unint64_t)a7 completionHandler:(id)a8;
- (void)showAskParameterDialogForParameter:(id)a3 action:(id)a4 defaultState:(id)a5 prompt:(id)a6 completion:(id)a7;
- (void)showChronoControlOfType:(unint64_t)a3 identity:(id)a4 completionHandler:(id)a5;
- (void)showConfirmInteraction:(id)a3 prompt:(id)a4 requireAuthentication:(BOOL)a5 completionHandler:(id)a6;
- (void)showDialogRequest:(id)a3 completionHandler:(id)a4;
- (void)showHandleInteraction:(id)a3 prompt:(id)a4 completionHandler:(id)a5;
- (void)showLinkActionConfirmationWithActionMetadata:(id)a3 showPrompt:(BOOL)a4 dialog:(id)a5 dialogString:(id)a6 viewSnippet:(id)a7 confirmationActionName:(id)a8 isContinueInAppRequest:(BOOL)a9 systemStyle:(id)a10 completionHandler:(id)a11;
- (void)showLinkParameterConfirmationWithActionMetadata:(id)a3 dialog:(id)a4 dialogString:(id)a5 viewSnippet:(id)a6 parameterValue:(id)a7 completionHandler:(id)a8;
- (void)showLinkResult:(id)a3 dialog:(id)a4 completionHandler:(id)a5;
- (void)showPreviewForContentCollection:(id)a3 completionHandler:(id)a4;
- (void)stopWithError:(id)a3;
- (void)swapExternalUIPresenterWithPresenter:(id)a3;
- (void)updateSmartPromptsWithConfiguration:(id)a3 resultCode:(unint64_t)a4 error:(id *)a5;
- (void)willBeginExecutingShortcutStep:(id)a3;
- (void)workflowWillBegin;
@end

@implementation WFDialogTransformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriOptions, 0);
  objc_storeStrong((id *)&self->_chooseFromListDataStore, 0);
  objc_storeStrong((id *)&self->_workflowStartTime, 0);
  objc_storeStrong(&self->_parameterInputCompletionHandler, 0);
  objc_storeStrong((id *)&self->_parameterInputProvider, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_allowedParameterClasses, 0);
  objc_storeStrong((id *)&self->_externalUIPresenter, 0);
  objc_storeStrong((id *)&self->_userInterfacePresenter, 0);
  objc_storeStrong((id *)&self->_runViewSource, 0);
  objc_storeStrong((id *)&self->_runningContext, 0);
  objc_storeStrong((id *)&self->_runSource, 0);
  objc_storeStrong((id *)&self->_currentAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_airPlayRouteIDs, 0);
}

- (void)setHasPresentedFirstDialog:(BOOL)a3
{
  self->_hasPresentedFirstDialog = a3;
}

- (BOOL)hasPresentedFirstDialog
{
  return self->_hasPresentedFirstDialog;
}

- (WFSiriWorkflowRunnerClientOptions)siriOptions
{
  return self->_siriOptions;
}

- (void)setChooseFromListDataStore:(id)a3
{
}

- (WFChooseFromListDataStore)chooseFromListDataStore
{
  return self->_chooseFromListDataStore;
}

- (void)setWorkflowStartTime:(id)a3
{
}

- (NSDate)workflowStartTime
{
  return self->_workflowStartTime;
}

- (void)setParameterInputCompletionHandler:(id)a3
{
}

- (id)parameterInputCompletionHandler
{
  return self->_parameterInputCompletionHandler;
}

- (void)setParameterInputProvider:(id)a3
{
}

- (WFSequentialParameterInputProvider)parameterInputProvider
{
  return self->_parameterInputProvider;
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (void)setNumberOfDialogsPresented:(int64_t)a3
{
  self->_numberOfDialogsPresented = a3;
}

- (int64_t)numberOfDialogsPresented
{
  return self->_numberOfDialogsPresented;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setAllowsHandoff:(BOOL)a3
{
  self->_allowsHandoff = a3;
}

- (BOOL)allowsHandoff
{
  return self->_allowsHandoff;
}

- (void)setAllowedParameterClasses:(id)a3
{
}

- (NSArray)allowedParameterClasses
{
  return self->_allowedParameterClasses;
}

- (void)setExternalUIPresenter:(id)a3
{
}

- (WFExternalUIPresenter)externalUIPresenter
{
  return self->_externalUIPresenter;
}

- (void)setUserInterfacePresenter:(id)a3
{
}

- (WFUIPresenter)userInterfacePresenter
{
  return self->_userInterfacePresenter;
}

- (void)setRunViewSource:(id)a3
{
}

- (WFWorkflowRunViewSource)runViewSource
{
  return self->_runViewSource;
}

- (WFWorkflowRunningContext)runningContext
{
  return self->_runningContext;
}

- (NSString)runSource
{
  return self->_runSource;
}

- (void)setCurrentAction:(id)a3
{
}

- (WFAction)currentAction
{
  return self->_currentAction;
}

- (void)setDelegate:(id)a3
{
}

- (WFDialogTransformerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFDialogTransformerDelegate *)WeakRetained;
}

- (NSArray)airPlayRouteIDs
{
  return self->_airPlayRouteIDs;
}

- (int64_t)executionContext
{
  return self->_executionContext;
}

- (void)shouldRunFollowUpActionWithBundleIdentifier:(id)a3 actionIdentifier:(id)a4 parameterValues:(id)a5 encodedToolInvocation:(id)a6 showOutputActionOptions:(unint64_t)a7 completionHandler:(id)a8
{
  id v14 = a8;
  v15 = (objc_class *)MEMORY[0x1E4FB4728];
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = (void *)[[v15 alloc] initWithBundleIdentifier:v19 actionIdentifier:v18 parameterValues:v17 showOutputActionOptions:a7 encodedToolInvocation:v16];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __164__WFDialogTransformer_shouldRunFollowUpActionWithBundleIdentifier_actionIdentifier_parameterValues_encodedToolInvocation_showOutputActionOptions_completionHandler___block_invoke;
  v22[3] = &unk_1E65509D0;
  id v23 = v14;
  id v21 = v14;
  [(WFDialogTransformer *)self handleDialogRequest:v20 completionHandler:v22];
}

void __164__WFDialogTransformer_shouldRunFollowUpActionWithBundleIdentifier_actionIdentifier_parameterValues_encodedToolInvocation_showOutputActionOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v7 shouldRunFollowUpAction]);
  }
  else
  {

    v8 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 136315394;
      v10 = "-[WFDialogTransformer shouldRunFollowUpActionWithBundleIdentifier:actionIdentifier:parameterValues:encodedTo"
            "olInvocation:showOutputActionOptions:completionHandler:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_FAULT, "%s Error in presentation result action request: %@", (uint8_t *)&v9, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)handleAppProtectionRequestWithBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x1E4FB4570];
  id v8 = a3;
  int v9 = (void *)[[v7 alloc] initWithAppBundleIdentifier:v8];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__WFDialogTransformer_handleAppProtectionRequestWithBundleIdentifier_completionHandler___block_invoke;
  v11[3] = &unk_1E65509D0;
  id v12 = v6;
  id v10 = v6;
  [(WFDialogTransformer *)self handleDialogRequest:v9 completionHandler:v11];
}

void __88__WFDialogTransformer_handleAppProtectionRequestWithBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = [v7 requestResponseCode];
    if (!v8)
    {
      uint64_t v14 = *(void *)(a1 + 32);
      v15 = [MEMORY[0x1E4F28C58] wfCancelledStepError];
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);

LABEL_13:
      int v9 = v7;
      goto LABEL_14;
    }
    if (v8 == 2)
    {
      id v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
      goto LABEL_12;
    }
    int v9 = v7;
    if (v8 == 1)
    {
      id v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_12:
      v10();
      goto LABEL_13;
    }
  }
  else
  {

    __int16 v11 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int v16 = 136315394;
      id v17 = "-[WFDialogTransformer handleAppProtectionRequestWithBundleIdentifier:completionHandler:]_block_invoke";
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_FAULT, "%s Error in app protection request: %@", (uint8_t *)&v16, 0x16u);
    }

    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = [MEMORY[0x1E4F28C58] wfCancelledStepError];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);

    int v9 = 0;
  }
LABEL_14:
}

- (void)willBeginExecutingShortcutStep:(id)a3
{
  externalUIPresenter = self->_externalUIPresenter;
  if (externalUIPresenter) {
    [(WFExternalUIPresenter *)externalUIPresenter willBeginExecutingShortcutStep:a3];
  }
}

- (BOOL)isRunningWithSiriUI
{
  BOOL v3 = [(WFDialogTransformer *)self isRunningWithExternalUI];
  if (v3)
  {
    v4 = [(WFDialogTransformer *)self runningContext];
    char v5 = [v4 shouldForwardSiriActionRequests];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isRunningWithToolKitClient
{
  BOOL v3 = [(WFDialogTransformer *)self isRunningWithExternalUI];
  if (v3)
  {
    v4 = [(WFDialogTransformer *)self runningContext];
    char v5 = [v4 isStepwise];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isRunningWithExternalUI
{
  v2 = [(WFDialogTransformer *)self externalUIPresenter];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)didFinishActionWithIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = getWFWorkflowExecutionLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "-[WFDialogTransformer didFinishActionWithIdentifier:]";
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s Sending action identifier to Siri", (uint8_t *)&v8, 0xCu);
  }

  externalUIPresenter = self->_externalUIPresenter;
  if (externalUIPresenter)
  {
    [(WFExternalUIPresenter *)externalUIPresenter didFinishActionWithIdentifier:v4];
  }
  else
  {
    id v7 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315138;
      int v9 = "-[WFDialogTransformer didFinishActionWithIdentifier:]";
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_FAULT, "%s Siri UI presenter not set", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)didStartActionWithIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = getWFWorkflowExecutionLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "-[WFDialogTransformer didStartActionWithIdentifier:]";
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s Sending action identifier to Siri", (uint8_t *)&v8, 0xCu);
  }

  externalUIPresenter = self->_externalUIPresenter;
  if (externalUIPresenter)
  {
    [(WFExternalUIPresenter *)externalUIPresenter didStartActionWithIdentifier:v4];
  }
  else
  {
    id v7 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315138;
      int v9 = "-[WFDialogTransformer didStartActionWithIdentifier:]";
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_FAULT, "%s Siri UI presenter not set", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (BOOL)performSiriRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = getWFWorkflowExecutionLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    uint64_t v14 = "-[WFDialogTransformer performSiriRequest:completionHandler:]";
    __int16 v15 = 2112;
    id v16 = (id)objc_opt_class();
    id v9 = v16;
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_DEFAULT, "%s Sending interaction of type %@ to Siri", (uint8_t *)&v13, 0x16u);
  }
  externalUIPresenter = self->_externalUIPresenter;
  if (externalUIPresenter)
  {
    [(WFExternalUIPresenter *)externalUIPresenter performSiriRequest:v6 completionHandler:v7];
  }
  else
  {
    __int16 v11 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int v13 = 136315138;
      uint64_t v14 = "-[WFDialogTransformer performSiriRequest:completionHandler:]";
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_FAULT, "%s Siri UI presenter not set", (uint8_t *)&v13, 0xCu);
    }
  }
  return externalUIPresenter != 0;
}

- (void)configureIntent:(id)a3
{
  id v14 = a3;
  id v4 = [(WFDialogTransformer *)self siriOptions];
  char v5 = v4;
  if (v4)
  {
    objc_msgSend(v14, "_setExecutionContext:", objc_msgSend(v4, "executionContext"));
    objc_msgSend(v14, "wf_updateIdiomIfNeeded:", objc_msgSend(v5, "currentDeviceIdiom"));
    id v6 = [v5 originatingDeviceIDSIdentifier];
    [v14 _setOriginatingDeviceIdsIdentifier:v6];

    id v7 = [v5 originatingDeviceRapportEffectiveIdentifier];
    [v14 _setOriginatingDeviceRapportEffectiveIdentifier:v7];

    int v8 = [v5 originatingDeviceRapportMediaSystemIdentifier];
    [v14 _setOriginatingDeviceRapportMediaSystemIdentifier:v8];

    id v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isOwnedByCurrentUser"));
    [v14 _setIsOwnedByCurrentUser:v9];

    uint64_t v10 = [(WFDialogTransformer *)self airPlayRouteIDs];
    if (![v10 count])
    {
LABEL_8:

      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
    __int16 v11 = [v14 launchId];
    if ([v11 hasPrefix:@"com.apple."])
    {

LABEL_6:
LABEL_7:
      uint64_t v10 = [(WFDialogTransformer *)self airPlayRouteIDs];
      [v14 _setAirPlayRouteIds:v10];
      goto LABEL_8;
    }
    uint64_t v12 = [v14 extensionBundleId];
    char v13 = [v12 hasPrefix:@"com.apple."];

    if (v13) {
      goto LABEL_7;
    }
  }
LABEL_9:
}

- (void)openURL:(id)a3 withBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(WFDialogTransformer *)self isRunningWithSiriUI])
  {
    if (v9)
    {
      char v13 = getWFDialogLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v20 = "-[WFDialogTransformer openURL:withBundleIdentifier:completionHandler:]";
        __int16 v21 = 2112;
        id v22 = v8;
        __int16 v23 = 2112;
        id v24 = v9;
        id v14 = "%s Dialog transformer only supports showing web pages -- but it was asked to open a URL (%@) with an app (bundle ID %@)";
        __int16 v15 = v13;
        uint32_t v16 = 32;
LABEL_11:
        _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
    else
    {
      if (WFURLIsWebPage())
      {
LABEL_13:
        (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
        goto LABEL_14;
      }
      char v13 = getWFDialogLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v20 = "-[WFDialogTransformer openURL:withBundleIdentifier:completionHandler:]";
        __int16 v21 = 2112;
        id v22 = v8;
        id v14 = "%s Dialog transformer only supports opening web pages -- but it was asked to open a non-webpage URL %@";
        __int16 v15 = v13;
        uint32_t v16 = 22;
        goto LABEL_11;
      }
    }

    goto LABEL_13;
  }
  __int16 v11 = getWFDialogLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v20 = "-[WFDialogTransformer openURL:withBundleIdentifier:completionHandler:]";
    _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_DEFAULT, "%s Sending open URL interaction to Siri", buf, 0xCu);
  }

  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4FB4918]) initWithURL:v8 andBundleIdentifier:v9];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__WFDialogTransformer_openURL_withBundleIdentifier_completionHandler___block_invoke;
  v17[3] = &unk_1E6550A98;
  id v18 = v10;
  [(WFDialogTransformer *)self performSiriRequest:v12 completionHandler:v17];

LABEL_14:
}

void __70__WFDialogTransformer_openURL_withBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = [v3 error];

    if (v4)
    {
      char v5 = getWFDialogLogObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = [v3 error];
        int v13 = 136315394;
        id v14 = "-[WFDialogTransformer openURL:withBundleIdentifier:completionHandler:]_block_invoke";
        __int16 v15 = 2112;
        id v16 = v6;
        _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_ERROR, "%s Error handling open URL interaction in Siri: %@", (uint8_t *)&v13, 0x16u);
      }
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = [v3 error];
      (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, 1, v8);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    uint64_t v12 = v3;
  }
  else
  {

    id v9 = getWFDialogLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v13 = 136315394;
      id v14 = "-[WFDialogTransformer openURL:withBundleIdentifier:completionHandler:]_block_invoke";
      __int16 v15 = 2112;
      id v16 = (id)objc_opt_class();
      id v10 = v16;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_FAULT, "%s Received unexpected interaction response of type %@", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:-1 userInfo:0];
    (*(void (**)(uint64_t, uint64_t, void *))(v11 + 16))(v11, 1, v12);
  }
}

- (void)openAppWithBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    id v6 = (id)*MEMORY[0x1E4FB4BB8];
  }
  id v8 = [(WFDialogTransformer *)self currentAction];
  id v9 = [v8 userInterface];
  [v9 applicationWillLaunchInForeground];

  id v10 = objc_opt_new();
  [v10 setObject:&unk_1F2316920 forKey:*MEMORY[0x1E4F62650]];
  uint64_t v11 = [(WFDialogTransformer *)self currentAction];
  uint64_t v12 = [v11 userInterface];
  int v13 = [v12 progressIsPersistentInSystemAperture];

  if (v13) {
    [v10 setObject:*MEMORY[0x1E4FA7078] forKey:*MEMORY[0x1E4F62658]];
  }
  if (+[WFAssistantServicesWrapper deviceSupportsSystemAssistantExperience])
  {
    uint64_t v14 = _os_feature_enabled_impl();
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F5A798]);
  id v16 = (void *)[v10 copy];
  uint64_t v17 = (void *)[v15 initWithBundleIdentifier:v6 options:v16 URL:0 userActivity:0 retainsSiri:v14];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__WFDialogTransformer_openAppWithBundleIdentifier_completionHandler___block_invoke;
  v19[3] = &unk_1E6558110;
  id v20 = v7;
  id v18 = v7;
  [v17 performWithCompletionHandler:v19];
}

uint64_t __69__WFDialogTransformer_openAppWithBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)shouldNotHandoff
{
  return 1;
}

- (void)resolveDescriptor:(id)a3 completionHandler:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [WFAppPickerParameter alloc];
  id v7 = [WFParameterDefinition alloc];
  id v18 = @"AppSearchType";
  v19[0] = @"OpenApp";
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  id v9 = [(WFParameterDefinition *)v7 initWithDictionary:v8];
  id v10 = [(WFAppPickerParameter *)v6 initWithDefinition:v9];

  uint64_t v11 = [(WFDialogTransformer *)self attribution];
  uint64_t v12 = [(WFParameter *)v10 localizedPrompt];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__WFDialogTransformer_resolveDescriptor_completionHandler___block_invoke;
  v15[3] = &unk_1E6550A70;
  v15[4] = self;
  id v16 = v10;
  id v17 = v5;
  id v13 = v5;
  uint64_t v14 = v10;
  [(WFDynamicEnumerationParameter *)v14 createDialogRequestWithAttribution:v11 defaultState:0 prompt:v12 completionHandler:v15];
}

void __59__WFDialogTransformer_resolveDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__WFDialogTransformer_resolveDescriptor_completionHandler___block_invoke_2;
  v5[3] = &unk_1E6550900;
  id v4 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  [v4 handleDialogRequest:a2 completionHandler:v5];
}

void __59__WFDialogTransformer_resolveDescriptor_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(a1 + 32) parameterStateFromDialogResponse:a2];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = v7;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [v4 value];

  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

- (void)dismissPresentedContentWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = [(WFDialogTransformer *)self userInterfacePresenter];

  if (v5)
  {
    id v6 = [(WFDialogTransformer *)self userInterfacePresenter];
    id v7 = [(WFDialogTransformer *)self runningContext];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__WFDialogTransformer_dismissPresentedContentWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E6555300;
    id v9 = v4;
    [v6 dismissPresentedContentForRunningContext:v7 completionHandler:v8];
  }
  else
  {
    v4[2](v4);
  }
}

uint64_t __68__WFDialogTransformer_dismissPresentedContentWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestActionInterfacePresentationForActionClassName:(id)a3 classNamesByType:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [WFShowActionInterfaceDialogRequest alloc];
  uint64_t v12 = [(WFDialogTransformer *)self attribution];
  id v13 = [(WFShowActionInterfaceDialogRequest *)v11 initWithActionClassName:v8 classNamesByType:v10 attribution:v12];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __111__WFDialogTransformer_requestActionInterfacePresentationForActionClassName_classNamesByType_completionHandler___block_invoke;
  v16[3] = &unk_1E6550888;
  id v18 = self;
  id v19 = v9;
  id v17 = v8;
  id v14 = v8;
  id v15 = v9;
  [(WFDialogTransformer *)self handleDialogRequest:v13 completionHandler:v16];
}

void __111__WFDialogTransformer_requestActionInterfacePresentationForActionClassName_classNamesByType_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v5;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;
  if ([v5 isCancelled])
  {
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = [MEMORY[0x1E4F28C58] userCancelledError];
LABEL_10:
    uint64_t v11 = (void *)v10;
    (*(void (**)(uint64_t, void, uint64_t))(v9 + 16))(v9, 0, v10);
    goto LABEL_11;
  }
  if ([v5 responseCode])
  {
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
    goto LABEL_10;
  }
  if ([v8 isUnsupported])
  {
    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = (void *)MEMORY[0x1E4F28C58];
    id v14 = [MEMORY[0x1E4FB46B8] currentDevice];
    id v15 = objc_msgSend(v13, "wf_unsupportedActionErrorWithType:platformIdiom:", @"NotAvailableOnSpecifiedPlatform", objc_msgSend(v14, "idiom"));
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v15);

    goto LABEL_12;
  }
  if (v6 && !v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_12;
  }
  uint64_t v11 = [v8 listenerEndpoint];
  id v16 = [v8 userInterfaceType];
  id v17 = [NSClassFromString(*(NSString **)(a1 + 32)) userInterfaceXPCInterface];
  id v18 = [[WFRemoteActionUserInterface alloc] initWithUserInterfaceType:v16 listenerEndpoint:v11 interface:v17];
  id v19 = [*(id *)(a1 + 40) currentAction];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __111__WFDialogTransformer_requestActionInterfacePresentationForActionClassName_classNamesByType_completionHandler___block_invoke_2;
  v21[3] = &unk_1E6558B28;
  id v22 = v19;
  id v20 = v19;
  [(WFRemoteActionUserInterface *)v18 setOnInterfaceInterruption:v21];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_11:
LABEL_12:
}

void __111__WFDialogTransformer_requestActionInterfacePresentationForActionClassName_classNamesByType_completionHandler___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isRunning])
  {
    v2 = [*(id *)(a1 + 32) workQueue];

    if (v2)
    {
      id v3 = [*(id *)(a1 + 32) workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __111__WFDialogTransformer_requestActionInterfacePresentationForActionClassName_classNamesByType_completionHandler___block_invoke_3;
      block[3] = &unk_1E6558B28;
      id v5 = *(id *)(a1 + 32);
      dispatch_async(v3, block);
    }
  }
}

void __111__WFDialogTransformer_requestActionInterfacePresentationForActionClassName_classNamesByType_completionHandler___block_invoke_3(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4FB4D90];
  uint64_t v8 = *MEMORY[0x1E4F28568];
  id v4 = [v1 localizedName];
  id v5 = WFRunnerFailureErrorMessage(v4);
  v9[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v7 = [v2 errorWithDomain:v3 code:4 userInfo:v6];
  [v1 finishRunningWithError:v7];
}

- (void)getPreferredSizeForLinkViewSnippetWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [WFLinkSnippetEnvironmentDialogRequest alloc];
  id v6 = [(WFDialogTransformer *)self attribution];
  id v7 = [(WFLinkSnippetEnvironmentDialogRequest *)v5 initWithAttribution:v6 prompt:0];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __72__WFDialogTransformer_getPreferredSizeForLinkViewSnippetWithCompletion___block_invoke;
  v9[3] = &unk_1E6550A48;
  id v10 = v4;
  id v8 = v4;
  [(WFDialogTransformer *)self handleDialogRequest:v7 completionHandler:v9];
}

void __72__WFDialogTransformer_getPreferredSizeForLinkViewSnippetWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v11;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  id v8 = [v7 environment];

  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    [v8 size];
    id v10 = objc_msgSend(v9, "wf_valueWithCGSize:");
  }
  else
  {
    id v10 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getEnvironmentForLinkViewSnippetWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [WFLinkSnippetEnvironmentDialogRequest alloc];
  id v6 = [(WFDialogTransformer *)self attribution];
  id v7 = [(WFLinkSnippetEnvironmentDialogRequest *)v5 initWithAttribution:v6 prompt:0];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __70__WFDialogTransformer_getEnvironmentForLinkViewSnippetWithCompletion___block_invoke;
  v9[3] = &unk_1E6550A48;
  id v10 = v4;
  id v8 = v4;
  [(WFDialogTransformer *)self handleDialogRequest:v7 completionHandler:v9];
}

void __70__WFDialogTransformer_getEnvironmentForLinkViewSnippetWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v8;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;
  id v7 = [v6 environment];

  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v7);
}

- (void)presentAlertWithSmartPromptConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFDialogTransformer *)self privacyAttribution];
  uint64_t v9 = [v7 authorizationDialogRequestWithAttribution:v8];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__WFDialogTransformer_presentAlertWithSmartPromptConfiguration_completionHandler___block_invoke;
  v11[3] = &unk_1E65509D0;
  id v12 = v6;
  id v10 = v6;
  [(WFDialogTransformer *)self handleDialogRequest:v9 completionHandler:v11];
}

void __82__WFDialogTransformer_presentAlertWithSmartPromptConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = v7;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [v4 result];

  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v6);
}

- (void)showChronoControlOfType:(unint64_t)a3 identity:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  uint64_t v9 = (objc_class *)MEMORY[0x1E4FB45D8];
  id v10 = a4;
  id v11 = [v9 alloc];
  id v12 = [(WFDialogTransformer *)self attribution];
  id v13 = (void *)[v11 initWithControlType:a3 identity:v10 attribution:v12];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__WFDialogTransformer_showChronoControlOfType_identity_completionHandler___block_invoke;
  v15[3] = &unk_1E65509D0;
  id v16 = v8;
  id v14 = v8;
  [(WFDialogTransformer *)self handleDialogRequest:v13 completionHandler:v15];
}

uint64_t __74__WFDialogTransformer_showChronoControlOfType_identity_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showLinkResult:(id)a3 dialog:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [WFLinkResultDialogRequest alloc];
  id v12 = [(WFDialogTransformer *)self attribution];
  id v13 = [(WFLinkResultDialogRequest *)v11 initWithSuccessResult:v10 attribution:v12];

  [(WFDialogRequest *)v13 setLinkDialog:v9];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__WFDialogTransformer_showLinkResult_dialog_completionHandler___block_invoke;
  v15[3] = &unk_1E65509D0;
  id v16 = v8;
  id v14 = v8;
  [(WFDialogTransformer *)self handleDialogRequest:v13 completionHandler:v15];
}

void __63__WFDialogTransformer_showLinkResult_dialog_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = v7;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [v4 snippetResponseCode];

  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v6);
}

- (void)showLinkParameterConfirmationWithActionMetadata:(id)a3 dialog:(id)a4 dialogString:(id)a5 viewSnippet:(id)a6 parameterValue:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __136__WFDialogTransformer_showLinkParameterConfirmationWithActionMetadata_dialog_dialogString_viewSnippet_parameterValue_completionHandler___block_invoke;
  block[3] = &unk_1E6550A20;
  id v27 = v18;
  id v28 = v14;
  id v29 = v16;
  id v30 = v17;
  v31 = self;
  id v32 = v15;
  id v33 = v19;
  id v20 = v19;
  id v21 = v15;
  id v22 = v17;
  id v23 = v16;
  id v24 = v14;
  id v25 = v18;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __136__WFDialogTransformer_showLinkParameterConfirmationWithActionMetadata_dialog_dialogString_viewSnippet_parameterValue_completionHandler___block_invoke(uint64_t a1)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __136__WFDialogTransformer_showLinkParameterConfirmationWithActionMetadata_dialog_dialogString_viewSnippet_parameterValue_completionHandler___block_invoke_2;
  v6[3] = &unk_1E65509F8;
  v2 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void **)(a1 + 72);
  id v9 = v3;
  uint64_t v10 = v4;
  id v11 = v5;
  id v12 = *(id *)(a1 + 80);
  [v2 encodedTypedValueWithCompletion:v6];
}

void __136__WFDialogTransformer_showLinkParameterConfirmationWithActionMetadata_dialog_dialogString_viewSnippet_parameterValue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4FB4828];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = [*(id *)(a1 + 32) name];
  id v7 = (void *)[v5 initWithParameterKey:v6 parameterValue:v4];

  id v8 = objc_alloc(MEMORY[0x1E4FB47C0]);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  id v12 = [*(id *)(a1 + 56) attribution];
  id v13 = (void *)[v8 initWithActionParameterMetadata:v9 dialogString:v10 viewSnippet:v11 attribution:v12 parameterInfo:v7];

  [v13 setLinkDialog:*(void *)(a1 + 64)];
  id v14 = *(void **)(a1 + 56);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __136__WFDialogTransformer_showLinkParameterConfirmationWithActionMetadata_dialog_dialogString_viewSnippet_parameterValue_completionHandler___block_invoke_3;
  v15[3] = &unk_1E65509D0;
  id v16 = *(id *)(a1 + 72);
  [v14 handleDialogRequest:v13 completionHandler:v15];
}

void __136__WFDialogTransformer_showLinkParameterConfirmationWithActionMetadata_dialog_dialogString_viewSnippet_parameterValue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = v7;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [v4 requestResponseCode];

  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v6);
}

- (void)showLinkActionConfirmationWithActionMetadata:(id)a3 showPrompt:(BOOL)a4 dialog:(id)a5 dialogString:(id)a6 viewSnippet:(id)a7 confirmationActionName:(id)a8 isContinueInAppRequest:(BOOL)a9 systemStyle:(id)a10 completionHandler:(id)a11
{
  BOOL v33 = a4;
  id v34 = a11;
  id v17 = a10;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a3;
  id v23 = [v18 acceptLabel];
  id v24 = [v23 localizedStringForLocaleIdentifier:0];

  id v25 = [v18 denyLabel];

  v26 = [v25 localizedStringForLocaleIdentifier:0];

  id v27 = objc_alloc(MEMORY[0x1E4FB47C0]);
  id v28 = [(WFDialogTransformer *)self attribution];
  LOBYTE(v31) = a9;
  id v29 = (void *)[v27 initWithActionMetadata:v22 showPrompt:v33 dialogString:v20 viewSnippet:v19 yesText:v24 noText:v26 attribution:v28 parameterInfo:0 isContinueInAppRequest:v31 systemStyle:v17];

  [v29 setLinkDialog:v21];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __187__WFDialogTransformer_showLinkActionConfirmationWithActionMetadata_showPrompt_dialog_dialogString_viewSnippet_confirmationActionName_isContinueInAppRequest_systemStyle_completionHandler___block_invoke;
  v35[3] = &unk_1E65509D0;
  id v36 = v34;
  id v30 = v34;
  [(WFDialogTransformer *)self handleDialogRequest:v29 completionHandler:v35];
}

void __187__WFDialogTransformer_showLinkActionConfirmationWithActionMetadata_showPrompt_dialog_dialogString_viewSnippet_confirmationActionName_isContinueInAppRequest_systemStyle_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = v7;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [v4 requestResponseCode];

  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v6);
}

- (void)showPreviewForContentCollection:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [WFShowContentDialogRequest alloc];
  uint64_t v9 = [(WFDialogTransformer *)self attribution];
  uint64_t v10 = [(WFShowContentDialogRequest *)v8 initWithContentCollection:v7 attribution:v9 prompt:0];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__WFDialogTransformer_showPreviewForContentCollection_completionHandler___block_invoke;
  v12[3] = &unk_1E65509D0;
  id v13 = v6;
  id v11 = v6;
  [(WFDialogTransformer *)self handleDialogRequest:v10 completionHandler:v12];
}

uint64_t __73__WFDialogTransformer_showPreviewForContentCollection_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 isCancelled];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

- (void)showHandleInteraction:(id)a3 prompt:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  uint64_t v9 = (objc_class *)MEMORY[0x1E4FB4740];
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)[[v9 alloc] initWithInteraction:v11 prompt:v10];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__WFDialogTransformer_showHandleInteraction_prompt_completionHandler___block_invoke;
  v14[3] = &unk_1E65509D0;
  id v15 = v8;
  id v13 = v8;
  [(WFDialogTransformer *)self handleDialogRequest:v12 completionHandler:v14];
}

void __70__WFDialogTransformer_showHandleInteraction_prompt_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v7 interactionResponseCode]);
  }
  else
  {

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)showConfirmInteraction:(id)a3 prompt:(id)a4 requireAuthentication:(BOOL)a5 completionHandler:(id)a6
{
  id v9 = a6;
  id v10 = (objc_class *)MEMORY[0x1E4FB4628];
  id v11 = a4;
  id v12 = a3;
  id v13 = (void *)[[v10 alloc] initWithInteraction:v12 prompt:v11];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__WFDialogTransformer_showConfirmInteraction_prompt_requireAuthentication_completionHandler___block_invoke;
  v15[3] = &unk_1E65509D0;
  id v16 = v9;
  id v14 = v9;
  [(WFDialogTransformer *)self handleDialogRequest:v13 completionHandler:v15];
}

void __93__WFDialogTransformer_showConfirmInteraction_prompt_requireAuthentication_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v7 interactionResponseCode]);
  }
  else
  {

    [v7 responseCode];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)sequentialParameterInputProviderDidCancel:(id)a3
{
  id v4 = [(WFDialogTransformer *)self parameterInputCompletionHandler];

  if (v4)
  {
    id v5 = [(WFDialogTransformer *)self parameterInputCompletionHandler];
    id v6 = [MEMORY[0x1E4F28C58] userCancelledError];
    ((void (**)(void, void, void *))v5)[2](v5, 0, v6);

    parameterInputProvider = self->_parameterInputProvider;
    self->_parameterInputProvider = 0;

    id parameterInputCompletionHandler = self->_parameterInputCompletionHandler;
    self->_id parameterInputCompletionHandler = 0;
  }
}

- (void)sequentialParameterInputProvider:(id)a3 didFinishWithInputtedStates:(id)a4
{
  id v9 = a4;
  id v5 = [(WFDialogTransformer *)self parameterInputCompletionHandler];

  if (v5)
  {
    id v6 = [(WFDialogTransformer *)self parameterInputCompletionHandler];
    ((void (**)(void, id, void))v6)[2](v6, v9, 0);

    parameterInputProvider = self->_parameterInputProvider;
    self->_parameterInputProvider = 0;

    id parameterInputCompletionHandler = self->_parameterInputCompletionHandler;
    self->_id parameterInputCompletionHandler = 0;
  }
}

- (void)showAskParameterDialogForParameter:(id)a3 action:(id)a4 defaultState:(id)a5 prompt:(id)a6 completion:(id)a7
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, uint64_t, void))a7;
  id v17 = [(WFDialogTransformer *)self allowedParameterClasses];
  if ([v17 count])
  {
    id v18 = [(WFDialogTransformer *)self allowedParameterClasses];
    char v19 = [v18 containsObject:objc_opt_class()];

    if ((v19 & 1) == 0)
    {
      id v20 = [(WFDialogTransformer *)self parameterInputCompletionHandler];
      [(WFDialogTransformer *)self setParameterInputCompletionHandler:0];
      if (v20)
      {
        id v21 = v15;
        id v22 = v13;
        id v23 = (void *)MEMORY[0x1E4F28C58];
        id v24 = [v12 localizedLabel];
        id v25 = [MEMORY[0x1E4FB46B8] currentDevice];
        v26 = objc_msgSend(v23, "wf_unsupportedParameterErrorWithParameterName:errorType:platformIdiom:", v24, @"NotAvailableOnSpecifiedPlatform", objc_msgSend(v25, "idiom"));
        ((void (**)(void, void, void *))v20)[2](v20, 0, v26);

        id v13 = v22;
        id v15 = v21;
      }
      v16[2](v16, 1, 0);

      goto LABEL_23;
    }
  }
  else
  {
  }
  v59 = self;
  v56 = v16;
  id v57 = v15;
  id v27 = objc_opt_new();
  id v58 = v14;
  id v28 = [v14 serializedRepresentation];
  id v29 = [v12 key];
  v60 = v27;
  objc_msgSend(v27, "if_setObjectIfNonNil:forKey:", v28, v29);

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v30 = v13;
  uint64_t v31 = [v13 parameters];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v65 objects:v75 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v66 != v34) {
          objc_enumerationMutation(v31);
        }
        id v36 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        v37 = [v36 key];
        v38 = [v12 key];
        char v39 = [v37 isEqualToString:v38];

        if ((v39 & 1) == 0)
        {
          v40 = [v36 key];
          v41 = [v30 parameterStateForKey:v40 fallingBackToDefaultValue:0];

          v42 = [v41 serializedRepresentation];
          v43 = [v36 key];
          objc_msgSend(v60, "if_setObjectIfNonNil:forKey:", v42, v43);
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v65 objects:v75 count:16];
    }
    while (v33);
  }

  uint64_t v44 = [MEMORY[0x1E4FB4598] dialogComponentStyleForParameter:v12];
  v45 = [MEMORY[0x1E4FB46C8] doneButton];
  id v13 = v30;
  v46 = [v30 identifier];
  if (![v46 isEqualToString:@"is.workflow.actions.timer.start"]) {
    goto LABEL_19;
  }
  v47 = [(WFDialogTransformer *)v59 runningContext];
  v48 = [v47 workflowIdentifier];

  if (!v48)
  {
    [MEMORY[0x1E4FB46C8] startButton];
    v45 = v46 = v45;
LABEL_19:
  }
  id v49 = objc_alloc(MEMORY[0x1E4FB4598]);
  v50 = [v30 identifier];
  v51 = [v12 key];
  v52 = [(WFDialogTransformer *)v59 attribution];
  LOBYTE(v55) = 1;
  id v15 = v57;
  v53 = (void *)[v49 initWithActionIdentifier:v50 parameterKey:v51 serializedParameterStates:v60 style:v44 attribution:v52 prompt:v57 doneButton:v45 focusImmediatelyWhenPresented:v55];

  v54 = getWFDialogLogObject();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v70 = "-[WFDialogTransformer showAskParameterDialogForParameter:action:defaultState:prompt:completion:]";
    __int16 v71 = 2112;
    id v72 = v12;
    __int16 v73 = 2112;
    v74 = v53;
    _os_log_impl(&dword_1C7F0A000, v54, OS_LOG_TYPE_DEFAULT, "%s %@ created %@", buf, 0x20u);
  }

  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __96__WFDialogTransformer_showAskParameterDialogForParameter_action_defaultState_prompt_completion___block_invoke;
  v61[3] = &unk_1E65509A8;
  id v16 = v56;
  v64 = v56;
  id v62 = v30;
  id v63 = v12;
  [(WFDialogTransformer *)v59 handleDialogRequest:v53 completionHandler:v61];

  id v14 = v58;
LABEL_23:
}

void __96__WFDialogTransformer_showAskParameterDialogForParameter_action_defaultState_prompt_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isCancelled])
  {
    id v4 = *(void (**)(void))(a1[6] + 16);
LABEL_8:
    v4();
    goto LABEL_9;
  }
  id v5 = [v3 serializedParameterState];

  if (!v5)
  {
    id v4 = *(void (**)(void))(a1[6] + 16);
    goto LABEL_8;
  }
  id v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  id v8 = [v3 serializedParameterState];
  id v9 = [v6 createStateForParameter:v7 fromSerializedRepresentation:v8];

  id v10 = getWFDialogLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    id v12 = "-[WFDialogTransformer showAskParameterDialogForParameter:action:defaultState:prompt:completion:]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEFAULT, "%s %@ created %@", (uint8_t *)&v11, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
LABEL_9:
}

- (void)sequentialParameterInputProvider:(id)a3 didAdvanceToParameter:(id)a4 action:(id)a5 defaultState:(id)a6 prompt:(id)a7 linkDialog:(id)a8 completion:(id)a9
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v44 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = self;
  id v19 = a9;
  id v20 = [(WFDialogTransformer *)v18 runningContext];
  id v21 = [v20 workflowIdentifier];
  if (v21)
  {
    int v22 = 0;
  }
  else
  {
    id v23 = [v15 identifier];
    if ([v23 isEqualToString:@"com.apple.mobiletimer-framework.MobileTimerIntents.MTCreateAlarmIntent"])
    {
      int v22 = 1;
    }
    else
    {
      [v15 identifier];
      v42 = v18;
      v25 = id v24 = v16;
      int v22 = [v25 isEqualToString:@"is.workflow.actions.timer.start"];

      id v16 = v24;
      id v18 = v42;
    }
  }
  v45 = v16;
  if ([MEMORY[0x1E4F1CB18] universalPreviewsEnabled])
  {
    if (v22) {
      v26 = 0;
    }
    else {
      v26 = v16;
    }
    goto LABEL_14;
  }
  if (v22)
  {
    v26 = 0;
LABEL_14:
    id v27 = v26;
    goto LABEL_15;
  }
  v26 = v16;
  if (v16) {
    goto LABEL_14;
  }
  id v27 = [v14 localizedPrompt];
LABEL_15:
  id v28 = v27;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __127__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_linkDialog_completion___block_invoke;
  aBlock[3] = &unk_1E6550A20;
  aBlock[4] = v18;
  id v29 = v14;
  id v53 = v29;
  id v30 = v28;
  id v54 = v30;
  id v31 = v17;
  id v55 = v31;
  id v32 = v19;
  id v58 = v32;
  id v33 = v15;
  id v56 = v33;
  id v34 = v44;
  id v57 = v34;
  v35 = (void (**)(void))_Block_copy(aBlock);
  id v36 = [v29 key];
  int v37 = [v33 canOfferSuggestionsForParameterWithKey:v36];

  if (v37)
  {
    v43 = v18;
    v38 = getWFDialogLogObject();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      char v39 = [v33 identifier];
      v40 = [v29 key];
      *(_DWORD *)buf = 136315650;
      v60 = "-[WFDialogTransformer sequentialParameterInputProvider:didAdvanceToParameter:action:defaultState:prompt:link"
            "Dialog:completion:]";
      __int16 v61 = 2112;
      id v62 = v39;
      __int16 v63 = 2112;
      v64 = v40;
      _os_log_impl(&dword_1C7F0A000, v38, OS_LOG_TYPE_DEFAULT, "%s Consulting top hits for entity items for action: %@, parameter: %@", buf, 0x20u);
    }
    v41 = [v29 key];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __127__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_linkDialog_completion___block_invoke_376;
    v46[3] = &unk_1E6550978;
    id v47 = v33;
    id v48 = v29;
    id v49 = v43;
    v50 = v35;
    id v51 = v32;
    [v47 fetchSuggestedEntititiesForParameterWithKey:v41 completionHandler:v46];
  }
  else
  {
    v35[2](v35);
  }
}

void __127__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_linkDialog_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isRunningWithToolKitClient])
  {
    id v2 = objc_alloc(MEMORY[0x1E4FB4A08]);
    id v3 = [*(id *)(a1 + 40) key];
    id v4 = [*(id *)(a1 + 32) attribution];
    id v5 = (void *)[v2 initWithParameterKey:v3 attribution:v4 prompt:*(void *)(a1 + 48)];

    [v5 setLinkDialog:*(void *)(a1 + 56)];
    id v6 = *(void **)(a1 + 32);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __127__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_linkDialog_completion___block_invoke_2;
    v27[3] = &unk_1E6550888;
    id v30 = *(id *)(a1 + 80);
    id v28 = *(id *)(a1 + 64);
    id v29 = *(id *)(a1 + 40);
    [v6 handleDialogRequest:v5 completionHandler:v27];
  }
  else if ([*(id *)(a1 + 40) conformsToProtocol:&unk_1F231A338])
  {
    id v7 = *(id *)(a1 + 40);
    id v8 = [*(id *)(a1 + 32) attribution];
    uint64_t v9 = *(void *)(a1 + 72);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __127__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_linkDialog_completion___block_invoke_4;
    v20[3] = &unk_1E6550928;
    id v10 = *(void **)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    v20[4] = *(void *)(a1 + 32);
    id v21 = v10;
    id v22 = *(id *)(a1 + 64);
    id v23 = *(id *)(a1 + 72);
    id v24 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 80);
    id v25 = v7;
    id v26 = v12;
    id v13 = v7;
    [v13 createDialogRequestWithAttribution:v8 defaultState:v9 prompt:v11 completionHandler:v20];
  }
  else
  {
    id v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 64);
    uint64_t v17 = *(void *)(a1 + 72);
    uint64_t v18 = *(void *)(a1 + 48);
    uint64_t v19 = *(void *)(a1 + 80);
    [v14 showAskParameterDialogForParameter:v15 action:v16 defaultState:v17 prompt:v18 completion:v19];
  }
}

void __127__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_linkDialog_completion___block_invoke_376(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [WFEntityPickerDialogRequest alloc];
  id v5 = [a1[4] identifier];
  id v6 = [a1[5] key];
  id v7 = [a1[6] attribution];
  id v8 = [(WFEntityPickerDialogRequest *)v4 initWithActionIdentifier:v5 parameterKey:v6 items:v3 attribution:v7 prompt:0];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __127__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_linkDialog_completion___block_invoke_2_378;
  v12[3] = &unk_1E6550950;
  id v9 = a1[6];
  id v10 = a1[7];
  id v11 = a1[6];
  id v15 = v10;
  void v12[4] = v11;
  id v16 = a1[8];
  id v13 = a1[4];
  id v14 = a1[5];
  [v9 handleDialogRequest:v8 completionHandler:v12];
}

void __127__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_linkDialog_completion___block_invoke_2_378(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 userRequestedAllOptions])
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else if ([v3 userRequestedOpenApp])
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v4 attribution];
    id v6 = [v5 appBundleIdentifier];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __127__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_linkDialog_completion___block_invoke_3_379;
    v16[3] = &unk_1E6558110;
    id v17 = *(id *)(a1 + 64);
    [v4 openAppWithBundleIdentifier:v6 completionHandler:v16];
  }
  else
  {
    id v7 = getWFDialogLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v3 selectedEntry];
      id v9 = [*(id *)(a1 + 40) identifier];
      id v10 = [*(id *)(a1 + 48) key];
      *(_DWORD *)buf = 136315906;
      uint64_t v19 = "-[WFDialogTransformer sequentialParameterInputProvider:didAdvanceToParameter:action:defaultState:prompt:link"
            "Dialog:completion:]_block_invoke_2";
      __int16 v20 = 2112;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v9;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s User selected entry: %@ for action: %@, parameter: %@; going through default ask path",
        buf,
        0x2Au);
    }
    id v11 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = [v3 selectedEntry];
    id v14 = [v13 serializedParameterState];
    id v15 = [v11 createStateForParameter:v12 fromSerializedRepresentation:v14];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t __127__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_linkDialog_completion___block_invoke_3_379(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __127__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_linkDialog_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v5;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;
  if (![v5 isCancelled] || v8)
  {
    id v9 = *(void **)(a1 + 32);
    id v10 = [v8 encodedTypedValue];
    id v11 = [*(id *)(a1 + 32) toolInvocation];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __127__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_linkDialog_completion___block_invoke_3;
    v13[3] = &unk_1E6550860;
    uint64_t v12 = *(void *)(a1 + 40);
    id v14 = *(id *)(a1 + 48);
    [v9 processEncodedValue:v10 withToolKitInvocation:v11 forParameter:v12 completionHandler:v13];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __127__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_linkDialog_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    [*(id *)(a1 + 32) showAskParameterDialogForParameter:*(void *)(a1 + 40) action:*(void *)(a1 + 48) defaultState:*(void *)(a1 + 56) prompt:*(void *)(a1 + 64) completion:*(void *)(a1 + 80)];
    goto LABEL_14;
  }
  id v4 = [*(id *)(a1 + 48) identifier];
  if (![v4 isEqualToString:@"com.apple.mobiletimer-framework.MobileTimerIntents.MTCreateAlarmIntent"])goto LABEL_9; {
  id v5 = [*(id *)(a1 + 32) runningContext];
  }
  id v6 = [v5 workflowIdentifier];

  if (!v6)
  {
    id v7 = v3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      id v9 = v7;
    }
    else {
      id v9 = 0;
    }
    id v4 = v9;

    if (isKindOfClass)
    {
      id v10 = WFLocalizedString(@"Add");
      [v7 overrideDoneButtonTitle:v10];
    }
LABEL_9:
  }
  id v11 = getWFDialogLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 72);
    *(_DWORD *)buf = 136315650;
    uint64_t v18 = "-[WFDialogTransformer sequentialParameterInputProvider:didAdvanceToParameter:action:defaultState:prompt:linkDi"
          "alog:completion:]_block_invoke_4";
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    __int16 v21 = 2112;
    id v22 = v3;
    _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_DEFAULT, "%s %@ created %@", buf, 0x20u);
  }

  id v13 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __127__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_linkDialog_completion___block_invoke_370;
  v14[3] = &unk_1E6550900;
  id v16 = *(id *)(a1 + 80);
  id v15 = *(id *)(a1 + 72);
  [v13 handleDialogRequest:v3 completionHandler:v14];

LABEL_14:
}

void __127__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_linkDialog_completion___block_invoke_370(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isCancelled])
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __127__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_linkDialog_completion___block_invoke_2_371;
    aBlock[3] = &unk_1E65508B0;
    id v12 = *(id *)(a1 + 32);
    id v4 = v3;
    id v13 = v4;
    id v14 = *(id *)(a1 + 40);
    id v5 = _Block_copy(aBlock);
    char v6 = objc_opt_respondsToSelector();
    id v7 = *(void **)(a1 + 32);
    if (v6)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      void v9[2] = __127__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_linkDialog_completion___block_invoke_375;
      v9[3] = &unk_1E65508D8;
      id v10 = v5;
      [v7 createParameterStateFromDialogResponse:v4 completionHandler:v9];
      id v8 = v10;
    }
    else
    {
      id v8 = [v7 parameterStateFromDialogResponse:v4];
      (*((void (**)(void *, void *))v5 + 2))(v5, v8);
    }
  }
}

void __127__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_linkDialog_completion___block_invoke_2_371(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) stateClass];
  if (v4 != objc_opt_class())
  {
    id v5 = getWFDialogLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      char v6 = objc_opt_class();
      id v7 = *(void **)(a1 + 32);
      id v8 = v6;
      id v9 = (void *)[v7 stateClass];
      id v10 = v9;
      int v14 = 136315906;
      id v15 = "-[WFDialogTransformer sequentialParameterInputProvider:didAdvanceToParameter:action:defaultState:prompt:link"
            "Dialog:completion:]_block_invoke_2";
      __int16 v16 = 2112;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = (id)objc_opt_class();
      id v11 = v21;
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_FAULT, "%s %@ expected a parameter state of class: %@, but received a different parameter state class: %@", (uint8_t *)&v14, 0x2Au);
    }
  }
  id v12 = getWFDialogLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = *(void **)(a1 + 40);
    int v14 = 136315650;
    id v15 = "-[WFDialogTransformer sequentialParameterInputProvider:didAdvanceToParameter:action:defaultState:prompt:linkDi"
          "alog:completion:]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v13;
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_DEFAULT, "%s %@ created %@", (uint8_t *)&v14, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __127__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_linkDialog_completion___block_invoke_375(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __127__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_linkDialog_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [[WFToolKitProcessedValueParameterState alloc] initWithProcessedValue:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)action:(id)a3 provideInputForParameters:(id)a4 withDefaultStates:(id)a5 prompts:(id)a6 completionHandler:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  __int16 v16 = (void (**)(id, id, void))a7;
  if (![(WFDialogTransformer *)self isRunningWithSiriUI]) {
    goto LABEL_15;
  }
  id v17 = v12;
  if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v17 = 0;
    goto LABEL_14;
  }
  if (![v17 isHandledBySiri])
  {
LABEL_14:

LABEL_15:
    [(WFDialogTransformer *)self setParameterInputCompletionHandler:v16];
    id v27 = [[WFSequentialParameterInputProvider alloc] initWithDelegate:self];
    [(WFSequentialParameterInputProvider *)v27 startWithAction:v12 parameters:v13 defaultStates:v14 prompts:v15];
    parameterInputProvider = self->_parameterInputProvider;
    self->_parameterInputProvider = v27;

    goto LABEL_16;
  }
  id v29 = v14;
  id v31 = v12;
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v30 = v13;
  id v19 = v13;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        __int16 v24 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v25 = objc_alloc_init(WFSiriAskEachTimeParameterState);
        uint64_t v26 = [v24 key];
        [v18 setObject:v25 forKeyedSubscript:v26];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v21);
  }

  v16[2](v16, v18, 0);
  id v13 = v30;
  id v12 = v31;
  id v14 = v29;
LABEL_16:
}

- (BOOL)action:(id)a3 canProvideInputForParameter:(id)a4
{
  return 1;
}

- (void)handleAlertAsSiriDialog:(id)a3
{
  id v5 = a3;
  char v6 = [v5 title];
  id v7 = [v5 message];
  if ([v6 length] && objc_msgSend(v7, "length"))
  {
    id v8 = [NSString stringWithFormat:@"%@\n\n%@", v6, v7];
LABEL_8:
    id v9 = v8;
    goto LABEL_9;
  }
  if ([v6 length])
  {
    id v8 = v6;
    goto LABEL_8;
  }
  if ([v7 length])
  {
    id v8 = v7;
    goto LABEL_8;
  }
  id v9 = 0;
LABEL_9:
  if (!self->_externalUIPresenter)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"WFDialogTransformer.m" lineNumber:875 description:@"Siri UI presenter must be non-nil"];
  }
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4FB4938]) initWithUtterance:v9];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__WFDialogTransformer_handleAlertAsSiriDialog___block_invoke;
  v13[3] = &unk_1E6550838;
  id v14 = v5;
  id v11 = v5;
  [(WFDialogTransformer *)self performSiriRequest:v10 completionHandler:v13];
}

void __47__WFDialogTransformer_handleAlertAsSiriDialog___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) buttons];
  id v4 = [v1 firstObject];

  id v2 = [v4 handler];

  if (v2)
  {
    id v3 = [v4 handler];
    v3[2]();
  }
}

- (BOOL)shouldHandleAlertAsSiriDialog:(id)a3
{
  id v4 = a3;
  if ([(WFDialogTransformer *)self isRunningWithSiriUI])
  {
    id v5 = [v4 buttons];
    if ([v5 count] == 1)
    {
      objc_opt_class();
      char v6 = objc_opt_isKindOfClass() ^ 1;
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6 & 1;
}

- (void)handleAlertWithMultipleButtons:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = (void *)MEMORY[0x1E4F5A818];
  v45 = v3;
  char v6 = [v3 buttons];
  [v5 processContentAlertButtonSubtitles:v6];

  uint64_t v71 = 0;
  id v72 = &v71;
  uint64_t v73 = 0x2020000000;
  char v74 = 0;
  uint64_t v65 = 0;
  long long v66 = &v65;
  uint64_t v67 = 0x3032000000;
  long long v68 = __Block_byref_object_copy__24209;
  v69 = __Block_byref_object_dispose__24210;
  id v70 = 0;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  id v62 = __Block_byref_object_copy__24209;
  __int16 v63 = __Block_byref_object_dispose__24210;
  id v64 = 0;
  group = dispatch_group_create();
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v7 = [v3 buttons];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v55 objects:v75 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v56 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        if ([v11 style] == 1)
        {
          id v12 = v66;
          id v13 = v11;
          id v14 = (id)v12[5];
          void v12[5] = (uint64_t)v13;
        }
        else
        {
          id v15 = v11;
          if (v15)
          {
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            id v17 = v15;
            id v14 = v17;
            if (isKindOfClass)
            {
              id v18 = [v17 contentItem];
              if ([v14 stickySelection]) {
                *((unsigned char *)v72 + 24) = 1;
              }
              id v19 = [WFDialogContentListItem alloc];
              uint64_t v20 = [v18 blockingEncodedTypedValue];
              uint64_t v21 = -[WFDialogContentListItem initWithContentItem:encodedTypedValue:selected:hideSubtitle:](v19, "initWithContentItem:encodedTypedValue:selected:hideSubtitle:", v18, v20, [v14 isSelected], objc_msgSend(v14, "hideSubtitle"));

              [v4 addObject:v21];
              [v46 setObject:v14 forKey:v21];

              goto LABEL_22;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {

              id v14 = v14;
              if ([v14 stickySelection]) {
                *((unsigned char *)v72 + 24) = 1;
              }
              id v22 = objc_alloc(MEMORY[0x1E4F5A958]);
              uint64_t v23 = [v14 title];
              __int16 v24 = [v14 subtitle];
              id v25 = [v14 image];
              uint64_t v26 = (void *)[v22 initWithTitle:v23 subtitle:v24 image:v25];

              id v27 = [MEMORY[0x1E4F5A950] itemWithObject:v26];
              id v28 = [WFDialogContentListItem alloc];
              id v29 = [v27 blockingEncodedTypedValue];
              id v30 = -[WFDialogContentListItem initWithContentItem:encodedTypedValue:selected:serializedPossibleState:](v28, "initWithContentItem:encodedTypedValue:selected:serializedPossibleState:", v27, v29, [v14 isSelected], 0);

              [v4 addObject:v30];
              [v46 setObject:v14 forKey:v30];

              goto LABEL_22;
            }
          }

          if ([v15 style]) {
            continue;
          }
          if ([v15 isPreferred])
          {
            id v31 = v60;
            id v32 = v15;
            id v14 = (id)v31[5];
            v31[5] = (uint64_t)v32;
          }
          else
          {
            id v33 = objc_alloc(MEMORY[0x1E4F5A958]);
            long long v34 = [v15 title];
            id v14 = (id)[v33 initWithTitle:v34 subtitle:0 image:0];

            long long v35 = [MEMORY[0x1E4F5A950] itemWithObject:v14];
            id v36 = [WFDialogContentListItem alloc];
            uint64_t v37 = [v35 blockingEncodedTypedValue];
            v38 = [(WFDialogContentListItem *)v36 initWithContentItem:v35 encodedTypedValue:v37 selected:0 hideSubtitle:0];

            [v4 addObject:v38];
            [v46 setObject:v15 forKey:v38];
          }
        }
LABEL_22:
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v55 objects:v75 count:16];
    }
    while (v8);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__WFDialogTransformer_handleAlertWithMultipleButtons___block_invoke;
  block[3] = &unk_1E6550810;
  char v39 = v4;
  id v48 = v4;
  id v49 = v45;
  v52 = &v71;
  id v53 = &v65;
  v50 = self;
  id v51 = v46;
  id v54 = &v59;
  id v40 = v46;
  id v41 = v45;
  id v42 = v39;
  dispatch_group_notify(group, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  _Block_object_dispose(&v71, 8);
}

void __54__WFDialogTransformer_handleAlertWithMultipleButtons___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FB45C8]);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) message];
  char v6 = [*(id *)(a1 + 48) attribution];
  id v7 = [*(id *)(a1 + 40) title];
  uint64_t v8 = [*(id *)(a1 + 40) associatedParameterKey];
  uint64_t v9 = (void *)[v2 initWithItems:v4 allowsMultipleSelection:v3 message:v5 attribution:v6 prompt:v7 parameterKey:v8];

  id v10 = [*(id *)(a1 + 40) linkDialog];
  [v9 setLinkDialog:v10];

  id v11 = *(void **)(a1 + 48);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__WFDialogTransformer_handleAlertWithMultipleButtons___block_invoke_2;
  v16[3] = &unk_1E65507E8;
  uint64_t v12 = *(void *)(a1 + 72);
  void v16[4] = v11;
  uint64_t v18 = v12;
  id v13 = *(id *)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 64);
  id v17 = v13;
  uint64_t v15 = *(void *)(a1 + 80);
  uint64_t v19 = v14;
  uint64_t v20 = v15;
  [v11 handleDialogRequest:v9 completionHandler:v16];
}

void __54__WFDialogTransformer_handleAlertWithMultipleButtons___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ([v7 isCancelled])
    {
      uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) handler];

      if (!v8)
      {
        [*(id *)(a1 + 32) cancel];
        goto LABEL_30;
      }
      uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
LABEL_28:
      id v30 = [v9 handler];
      v30[2]();

LABEL_30:
      uint64_t v12 = v7;
      goto LABEL_31;
    }
    id v31 = v6;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v13 = [v7 selectedItems];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v37 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = [*(id *)(a1 + 40) objectForKey:*(void *)(*((void *)&v36 + 1) + 8 * i)];
          uint64_t v19 = [v18 handler];

          if (v19)
          {
            uint64_t v20 = [v18 handler];
            v20[2]();
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v15);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v21 = [*(id *)(a1 + 40) allKeys];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v33 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v32 + 1) + 8 * j);
          id v27 = [*(id *)(a1 + 40) objectForKey:v26];
          if (v27)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v28 = [v7 selectedItems];
              uint64_t v29 = [v28 containsObject:v26];

              [v27 setSelected:v29];
            }
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v23);
    }

    uint64_t v12 = v7;
    id v6 = v31;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v12 = v7;
      if (v9) {
        goto LABEL_28;
      }
    }
  }
  else
  {

    id v10 = *(void **)(a1 + 32);
    id v11 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
    [v10 stopWithError:v11];

    uint64_t v12 = 0;
  }
LABEL_31:
}

- (void)handleAlertWithDatePicker:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v4 = [v3 buttons];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v31;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v4);
        }
        id v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([v11 style] == 1)
        {
          uint64_t v12 = v11;
          id v13 = v8;
          if (v7) {
            continue;
          }
        }
        else
        {
          uint64_t v12 = v7;
          id v13 = v11;
          if (v8) {
            continue;
          }
        }
        id v14 = v11;
        id v7 = v12;
        uint64_t v8 = v13;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (!v6) {
        goto LABEL_15;
      }
    }
  }
  id v7 = 0;
  uint64_t v8 = 0;
LABEL_15:

  id v15 = objc_alloc(MEMORY[0x1E4FB4788]);
  uint64_t v16 = [v3 datePickerConfiguration];
  id v17 = [v3 message];
  uint64_t v18 = [(WFDialogTransformer *)self attribution];
  uint64_t v19 = [v3 title];
  uint64_t v20 = (void *)[v15 initWithDatePickerConfiguration:v16 message:v17 attribution:v18 prompt:v19];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __49__WFDialogTransformer_handleAlertWithDatePicker___block_invoke;
  v25[3] = &unk_1E65507C0;
  id v26 = v7;
  id v27 = self;
  id v28 = v3;
  id v29 = v8;
  id v21 = v8;
  id v22 = v3;
  id v23 = v7;
  [(WFDialogTransformer *)self handleDialogRequest:v20 completionHandler:v25];
}

void __49__WFDialogTransformer_handleAlertWithDatePicker___block_invoke(id *a1, void *a2)
{
  id v9 = a2;
  if ([v9 isCancelled])
  {
    id v3 = [a1[4] handler];

    if (v3)
    {
      id v4 = a1[4];
LABEL_8:
      uint64_t v8 = [v4 handler];
      v8[2]();

      goto LABEL_10;
    }
    [a1[5] cancel];
  }
  else
  {
    uint64_t v5 = [v9 inputtedDate];

    if (v5)
    {
      uint64_t v6 = [v9 inputtedDate];
      [a1[6] setDatePickerResult:v6];
    }
    id v7 = [a1[7] handler];

    if (v7)
    {
      id v4 = a1[7];
      goto LABEL_8;
    }
  }
LABEL_10:
}

- (void)handleAlertWithTextField:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v4 = [v3 buttons];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v32;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v4);
        }
        id v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ([v11 style] == 1)
        {
          uint64_t v12 = v11;
          id v13 = v8;
          if (v7) {
            continue;
          }
        }
        else
        {
          uint64_t v12 = v7;
          id v13 = v11;
          if (v8) {
            continue;
          }
        }
        id v14 = v11;
        id v7 = v12;
        uint64_t v8 = v13;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (!v6) {
        goto LABEL_15;
      }
    }
  }
  id v7 = 0;
  uint64_t v8 = 0;
LABEL_15:

  id v15 = objc_alloc(MEMORY[0x1E4FB4798]);
  uint64_t v16 = [v3 textFieldConfiguration];
  id v17 = [v3 message];
  uint64_t v18 = [(WFDialogTransformer *)self attribution];
  uint64_t v19 = [v3 title];
  uint64_t v20 = [v3 associatedParameterKey];
  id v21 = (void *)[v15 initWithTextFieldConfiguration:v16 message:v17 attribution:v18 prompt:v19 parameterKey:v20];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __48__WFDialogTransformer_handleAlertWithTextField___block_invoke;
  v26[3] = &unk_1E6550798;
  id v27 = v7;
  id v28 = self;
  id v29 = v3;
  id v30 = v8;
  id v22 = v8;
  id v23 = v3;
  id v24 = v7;
  [(WFDialogTransformer *)self handleDialogRequest:v21 completionHandler:v26];
}

void __48__WFDialogTransformer_handleAlertWithTextField___block_invoke(id *a1, void *a2, void *a3)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v5;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;
  if ([v5 isCancelled])
  {
    uint64_t v9 = [a1[4] handler];

    if (!v9)
    {
      [a1[5] cancel];
      goto LABEL_15;
    }
    id v10 = a1[4];
    goto LABEL_13;
  }
  id v11 = [v8 inputtedText];

  if (v11)
  {
    uint64_t v12 = [v8 inputtedText];
    v16[0] = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [a1[6] setTextFieldResults:v13];
  }
  id v14 = [a1[7] handler];

  if (v14)
  {
    id v10 = a1[7];
LABEL_13:
    id v15 = [v10 handler];
    v15[2]();
  }
LABEL_15:
}

- (void)handleSimpleAlert:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v5 = [v4 buttons];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v43 objects:v47 count:16];
  unint64_t v7 = 0x1E4FB4000;
  if (!v6)
  {
    long long v38 = 0;
    id v10 = 0;
    id v11 = 0;
LABEL_16:

    goto LABEL_18;
  }
  uint64_t v8 = v6;
  id v36 = v4;
  uint64_t v9 = self;
  id v10 = 0;
  id v11 = 0;
  uint64_t v12 = *(void *)v44;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v44 != v12) {
        objc_enumerationMutation(v5);
      }
      id v14 = *(void **)(*((void *)&v43 + 1) + 8 * i);
      if ([v14 style] == 1)
      {
        id v15 = v14;
        uint64_t v16 = v11;
        if (v10) {
          continue;
        }
      }
      else
      {
        id v15 = v10;
        uint64_t v16 = v14;
        if (v11) {
          continue;
        }
      }
      id v17 = v14;
      id v10 = v15;
      id v11 = v16;
    }
    uint64_t v8 = [v5 countByEnumeratingWithState:&v43 objects:v47 count:16];
  }
  while (v8);

  if (v10)
  {
    unint64_t v7 = 0x1E4FB4000uLL;
    id v18 = objc_alloc(MEMORY[0x1E4FB46C8]);
    id v5 = [v10 title];
    long long v38 = (void *)[v18 initWithTitle:v5 style:1];
    self = v9;
    id v4 = v36;
    goto LABEL_16;
  }
  long long v38 = 0;
  self = v9;
  id v4 = v36;
  unint64_t v7 = 0x1E4FB4000uLL;
LABEL_18:
  uint64_t v19 = *(objc_class **)(v7 + 1736);
  if (v11)
  {
    id v20 = [v19 alloc];
    [v11 title];
    v22 = id v21 = self;
    id v23 = objc_msgSend(v20, "initWithTitle:style:", v22, 2 * (objc_msgSend(v11, "style") != 0));

    self = v21;
  }
  else
  {
    id v23 = [(objc_class *)v19 okButton];
  }
  objc_opt_class();
  objc_opt_isKindOfClass();
  id v24 = (objc_class *)objc_opt_class();
  id v25 = v4;
  if (!v25 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v27 = 0;
    goto LABEL_26;
  }
  uint64_t v26 = [v25 attribution];
  id v27 = v25;
  if (!v26)
  {
LABEL_26:
    long long v37 = v27;
    id v29 = [(WFDialogTransformer *)self attribution];
    goto LABEL_27;
  }
  id v28 = (void *)v26;
  id v29 = [v25 attribution];

  long long v37 = v25;
LABEL_27:
  id v30 = [v24 alloc];
  long long v31 = [v25 title];
  long long v32 = [v25 message];
  long long v33 = (void *)[v30 initWithPrompt:v31 message:v32 okButton:v23 cancelButton:v38 attribution:v29];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __41__WFDialogTransformer_handleSimpleAlert___block_invoke;
  v39[3] = &unk_1E6550770;
  id v40 = v10;
  id v41 = self;
  id v42 = v11;
  id v34 = v11;
  id v35 = v10;
  [(WFDialogTransformer *)self handleDialogRequest:v33 completionHandler:v39];
}

void __41__WFDialogTransformer_handleSimpleAlert___block_invoke(uint64_t a1, void *a2)
{
  if (![a2 isCancelled])
  {
    id v5 = [*(id *)(a1 + 48) handler];

    if (!v5) {
      return;
    }
    id v4 = *(void **)(a1 + 48);
    goto LABEL_6;
  }
  id v3 = [*(id *)(a1 + 32) handler];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
LABEL_6:
    unint64_t v7 = [v4 handler];
    v7[2]();

    return;
  }
  uint64_t v6 = *(void **)(a1 + 40);
  [v6 cancel];
}

- (void)presentAlert:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFDialogLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    id v13 = "-[WFDialogTransformer presentAlert:]";
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s Transforming alert %@ into WFDialogRequest", (uint8_t *)&v12, 0x16u);
  }

  uint64_t v6 = [v4 textFieldConfiguration];

  if (v6)
  {
    [(WFDialogTransformer *)self handleAlertWithTextField:v4];
    goto LABEL_12;
  }
  unint64_t v7 = [v4 datePickerConfiguration];

  if (v7)
  {
    [(WFDialogTransformer *)self handleAlertWithDatePicker:v4];
    goto LABEL_12;
  }
  uint64_t v8 = [v4 buttons];
  if ((unint64_t)[v8 count] > 2) {
    goto LABEL_10;
  }
  uint64_t v9 = [v4 buttons];
  id v10 = objc_msgSend(v9, "if_objectsOfClass:", objc_opt_class());
  if ([v10 count])
  {

LABEL_10:
LABEL_11:
    [(WFDialogTransformer *)self handleAlertWithMultipleButtons:v4];
    goto LABEL_12;
  }
  BOOL v11 = [(WFDialogTransformer *)self isRunningWithToolKitClient];

  if (v11) {
    goto LABEL_11;
  }
  if ([(WFDialogTransformer *)self shouldHandleAlertAsSiriDialog:v4]) {
    [(WFDialogTransformer *)self handleAlertAsSiriDialog:v4];
  }
  else {
    [(WFDialogTransformer *)self handleSimpleAlert:v4];
  }
LABEL_12:
}

- (void)swapExternalUIPresenterWithPresenter:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(WFDialogTransformer *)self isRunningWithSiriUI])
  {
    uint64_t v6 = [(WFDialogTransformer *)self parameterInputProvider];

    if (v6)
    {
      unint64_t v7 = [(WFDialogTransformer *)self parameterInputProvider];
      [v7 persistInFlightParameters];
    }
    externalUIPresenter = self->_externalUIPresenter;
    self->_externalUIPresenter = 0;

    objc_storeStrong((id *)&self->_userInterfacePresenter, a3);
  }
  else
  {
    uint64_t v9 = getWFRunningLifecycleLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v10 = 136315138;
      BOOL v11 = "-[WFDialogTransformer swapExternalUIPresenterWithPresenter:]";
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_FAULT, "%s Attempted to perform handoff when not running in Siri", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)setSiriOptions:(id)a3
{
}

- (void)setWorkflow:(id)a3
{
  objc_storeStrong((id *)&self->_workflow, a3);
  id v6 = [(WFDialogTransformer *)self userInterfacePresenter];
  id v4 = [(WFDialogTransformer *)self attribution];
  id v5 = [(WFDialogTransformer *)self runningContext];
  [v6 updateAttribution:v4 runningContext:v5];
}

- (void)requestFileAccessForURLs:(id)a3 workflowName:(id)a4 workflowID:(id)a5 completionHandler:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v29 = a6;
  id v11 = a5;
  uint64_t v12 = getWFFilesLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v34 = "-[WFDialogTransformer requestFileAccessForURLs:workflowName:workflowID:completionHandler:]";
    __int16 v35 = 2112;
    id v36 = v9;
    _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_DEBUG, "%s Requesting File access for urls: %@", buf, 0x16u);
  }

  id v13 = objc_msgSend(v9, "if_map:", &__block_literal_global_24226);
  if ([v9 count] == 1)
  {
    __int16 v14 = [v9 firstObject];
    int v15 = [v14 hasDirectoryPath];

    uint64_t v16 = NSString;
    if (v15) {
      id v17 = @"Allow “%1$@” to access your “%2$@” folder?";
    }
    else {
      id v17 = @"Allow “%1$@” to access your file “%2$@”?";
    }
    id v18 = WFLocalizedString(v17);
    uint64_t v19 = [v13 firstObject];
    id v22 = objc_msgSend(v16, "stringWithFormat:", v18, v10, v19);
  }
  else
  {
    id v18 = objc_msgSend(v13, "if_map:", &__block_literal_global_264);
    uint64_t v19 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:v18];
    id v20 = NSString;
    id v21 = WFLocalizedString(@"Allow “%1$@” to access %2$@?");
    id v22 = objc_msgSend(v20, "stringWithFormat:", v21, v10, v19);
  }
  id v23 = [WFFileAccessDialogRequest alloc];
  id v24 = [MEMORY[0x1E4FB46C8] okButton];
  id v25 = [MEMORY[0x1E4FB46C8] cancelButton];
  uint64_t v26 = [(WFDialogTransformer *)self privacyAttribution];
  id v27 = [(WFFileAccessDialogRequest *)v23 initWithPrompt:v22 message:0 okButton:v24 cancelButton:v25 attribution:v26 workflowID:v11 URLs:v9];

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __90__WFDialogTransformer_requestFileAccessForURLs_workflowName_workflowID_completionHandler___block_invoke_3;
  v31[3] = &unk_1E6550748;
  id v32 = v29;
  id v28 = v29;
  [(WFDialogTransformer *)self handleDialogRequest:v27 completionHandler:v31];
}

void __90__WFDialogTransformer_requestFileAccessForURLs_workflowName_workflowID_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (!v10)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_5;
  }
  if ([v10 fileResponseCode] == 1)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_5:
    v6();
    goto LABEL_11;
  }
  if (([v10 isCancelled] & 1) != 0 || !objc_msgSend(v10, "fileResponseCode"))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = [MEMORY[0x1E4F28C58] userCancelledError];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = [v10 error];
  }
  id v9 = (void *)v8;
  (*(void (**)(uint64_t, void, uint64_t))(v7 + 16))(v7, 0, v8);

LABEL_11:
}

id __90__WFDialogTransformer_requestFileAccessForURLs_workflowName_workflowID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = NSString;
  id v3 = a2;
  id v4 = WFLocalizedString(@"“%@”");
  id v5 = objc_msgSend(v2, "stringWithFormat:", v4, v3);

  return v5;
}

id __90__WFDialogTransformer_requestFileAccessForURLs_workflowName_workflowID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(v2, "wf_localizedDisplayName");
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v2 lastPathComponent];
  }
  id v6 = v5;

  return v6;
}

- (void)configureSmartPromptIntent:(id)a3 withConfiguration:(id)a4
{
  id v31 = a3;
  uint64_t v5 = *MEMORY[0x1E4FB4B78];
  id v6 = a4;
  [v31 _setLaunchId:v5];
  [v31 _setExtensionBundleId:v5];
  uint64_t v7 = [WFSmartPromptDialogRequest alloc];
  uint64_t v8 = [MEMORY[0x1E4FB46C0] attributionWithAppBundleIdentifier:*MEMORY[0x1E4FB4BE8]];
  id v9 = [(WFSmartPromptDialogRequest *)v7 initWithConfiguration:v6 attribution:v8];

  id v10 = [v6 localizedPrompt];

  [v31 setPromptMessage:v10];
  id v11 = WFLocalizedString(@"Privacy");
  [v31 setPrivacyTitle:v11];

  uint64_t v12 = (void *)MEMORY[0x1E4FB4770];
  id v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  __int16 v14 = [v12 imageNamed:@"Privacy" inBundle:v13];

  int v15 = (void *)MEMORY[0x1E4F30420];
  uint64_t v16 = [v14 PNGRepresentation];
  id v17 = [v15 fileWithData:v16 filename:@"PrivacyIcon" typeIdentifier:@"public.png"];

  [v31 setPrivacyIcon:v17];
  id v18 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v19 = [(WFSmartPromptDialogRequest *)v9 previewButton];

  if (v19)
  {
    id v20 = [(WFSmartPromptDialogRequest *)v9 previewButton];
    id v21 = [v20 smartPromptIntentButton];
    [v18 addObject:v21];
  }
  id v22 = [(WFSmartPromptDialogRequest *)v9 allowOnceButton];

  if (v22)
  {
    id v23 = [(WFSmartPromptDialogRequest *)v9 allowOnceButton];
    id v24 = [v23 smartPromptIntentButton];
    [v18 addObject:v24];
  }
  id v25 = [(WFSmartPromptDialogRequest *)v9 allowAlwaysButton];

  if (v25)
  {
    uint64_t v26 = [(WFSmartPromptDialogRequest *)v9 allowAlwaysButton];
    id v27 = [v26 smartPromptIntentButton];
    [v18 addObject:v27];
  }
  id v28 = [(WFSmartPromptDialogRequest *)v9 denyButton];

  if (v28)
  {
    id v29 = [(WFSmartPromptDialogRequest *)v9 denyButton];
    id v30 = [v29 smartPromptIntentButton];
    [v18 addObject:v30];
  }
  [v31 setButtons:v18];
}

- (void)updateSmartPromptsWithConfiguration:(id)a3 resultCode:(unint64_t)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  unint64_t v23 = a4;
  obuint64_t j = +[WFSmartPromptDialogResponse prepareSmartPromptsDatabaseDataFromConfiguration:v7 resultCode:a4 error:a5];
  if (obj)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * v11);
          id v13 = +[WFDatabaseProxy defaultDatabase];
          __int16 v14 = [v7 actionUUID];
          int v15 = [(WFDialogTransformer *)self workflow];
          uint64_t v16 = [v15 reference];
          [v13 saveSmartPromptStateData:v12 actionUUID:v14 reference:v16 error:a5];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v9);
    }
  }
  id v17 = +[WFSmartPromptDialogResponse prepareDeletionAuthorizationDatabaseDataFromConfiguration:v7 resultCode:v23 error:a5];
  if (v17)
  {
    id v18 = +[WFDatabaseProxy defaultDatabase];
    [v7 actionUUID];
    v20 = uint64_t v19 = a5;
    id v21 = [(WFDialogTransformer *)self workflow];
    id v22 = [v21 reference];
    [v18 saveSmartPromptStateData:v17 actionUUID:v20 reference:v22 error:v19];
  }
}

- (void)executeSmartPromptIntentWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4FB4968]);
  [(WFDialogTransformer *)self configureSmartPromptIntent:v8 withConfiguration:v6];
  [(WFDialogTransformer *)self configureIntent:v8];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FB48E0]) initWithIntent:v8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__WFDialogTransformer_executeSmartPromptIntentWithConfiguration_completionHandler___block_invoke;
  v12[3] = &unk_1E6550700;
  id v13 = v6;
  id v14 = v7;
  void v12[4] = self;
  id v10 = v6;
  id v11 = v7;
  [(WFDialogTransformer *)self performSiriRequest:v9 completionHandler:v12];
}

void __83__WFDialogTransformer_executeSmartPromptIntentWithConfiguration_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v3 error];

      if (!v4)
      {
        uint64_t v5 = [v3 interaction];
        id v6 = [v5 intentResponse];
        id v7 = INTypedIntentResponseWithIntentResponse();

        if (v7)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v8 = [v7 authorizationResult];
            uint64_t v9 = [v8 unsignedIntegerValue];

            if (v9 == 3)
            {
              id v10 = getWFSecurityLogObject();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315138;
                id v20 = "-[WFDialogTransformer executeSmartPromptIntentWithConfiguration:completionHandler:]_block_invoke";
                _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEBUG, "%s User selected Preview in Siri, handing off to Shortcuts", buf, 0xCu);
              }

              (*(void (**)(void))(a1[6] + 16))();
            }
            else
            {
              id v13 = (void *)a1[4];
              uint64_t v14 = a1[5];
              id v18 = 0;
              [v13 updateSmartPromptsWithConfiguration:v14 resultCode:v9 error:&v18];
              id v15 = v18;
              if (v15)
              {
                uint64_t v16 = getWFSecurityLogObject();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  id v20 = "-[WFDialogTransformer executeSmartPromptIntentWithConfiguration:completionHandler:]_block_invoke";
                  __int16 v21 = 2112;
                  id v22 = v15;
                  _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_ERROR, "%s Failed to update smart prompts state in Siri: %@", buf, 0x16u);
                }

                id v17 = *(void (**)(void))(a1[6] + 16);
              }
              else
              {
                id v17 = *(void (**)(void))(a1[6] + 16);
              }
              v17();
            }
            goto LABEL_15;
          }
        }
      }
      (*(void (**)(void))(a1[6] + 16))();
LABEL_15:

      goto LABEL_16;
    }
  }

  id v11 = getWFDialogLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v20 = "-[WFDialogTransformer executeSmartPromptIntentWithConfiguration:completionHandler:]_block_invoke";
    __int16 v21 = 2112;
    id v22 = (id)objc_opt_class();
    id v12 = v22;
    _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_FAULT, "%s Received unexpected interaction response of type %@", buf, 0x16u);
  }
  (*(void (**)(void))(a1[6] + 16))();
LABEL_16:
}

- (void)requestAuthorizationWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(WFDialogTransformer *)self isRunningWithSiriUI]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = v6;
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    id v11 = v9;

    [(WFDialogTransformer *)self executeSmartPromptIntentWithConfiguration:v11 completionHandler:v7];
  }
  else
  {
    id v10 = [(WFDialogTransformer *)self privacyAttribution];
    id v11 = [v6 authorizationDialogRequestWithAttribution:v10];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __79__WFDialogTransformer_requestAuthorizationWithConfiguration_completionHandler___block_invoke;
    v12[3] = &unk_1E6550900;
    void v12[4] = self;
    id v13 = v7;
    [(WFDialogTransformer *)self handleDialogRequest:v11 completionHandler:v12];
  }
}

void __79__WFDialogTransformer_requestAuthorizationWithConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v11;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  if ([v7 isCancelled])
  {
    [*(id *)(a1 + 32) cancel];
  }
  else
  {
    id v8 = v11;
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    id v10 = v9;

    if ([v10 result] == 5) {
      [*(id *)(a1 + 32) cancel];
    }
    else {
      (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [v7 result]);
    }
  }
}

- (void)cleanupListDialogRequestIfNeeded:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v5 = [(WFDialogTransformer *)self isRunningWithSiriUI];
    id v6 = v4;
    if (v5)
    {
      id v7 = [v4 items];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __56__WFDialogTransformer_cleanupListDialogRequestIfNeeded___block_invoke;
      v8[3] = &unk_1E65506D8;
      void v8[4] = self;
      [v7 enumerateObjectsUsingBlock:v8];

      id v6 = v4;
    }
  }
  else
  {

    id v6 = 0;
  }
}

void __56__WFDialogTransformer_cleanupListDialogRequestIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 chooseFromListDataStore];
  id v4 = [v3 identifier];

  [v5 removeContentItemWithIdentifier:v4];
}

- (void)prepareListDialogRequestIfNeeded:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = v6;
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v11 = 0;
LABEL_7:
    v7[2](v7, v8);
    goto LABEL_8;
  }
  if (![(WFDialogTransformer *)self isRunningWithSiriUI])
  {
    uint64_t v9 = [(WFDialogTransformer *)self runningContext];
    char v10 = [v9 shouldForwardDialogRequests];

    id v11 = v8;
    if ((v10 & 1) == 0) {
      goto LABEL_7;
    }
  }
  id v12 = [v8 items];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__WFDialogTransformer_prepareListDialogRequestIfNeeded_completionHandler___block_invoke;
  v17[3] = &unk_1E65506B0;
  void v17[4] = self;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__WFDialogTransformer_prepareListDialogRequestIfNeeded_completionHandler___block_invoke_3;
  v13[3] = &unk_1E6557A18;
  id v11 = v8;
  id v14 = v11;
  id v15 = self;
  uint64_t v16 = v7;
  objc_msgSend(v12, "if_mapAsynchronously:completionHandler:", v17, v13);

LABEL_8:
}

void __74__WFDialogTransformer_prepareListDialogRequestIfNeeded_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = v6;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v9 = [v8 contentItem];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__WFDialogTransformer_prepareListDialogRequestIfNeeded_completionHandler___block_invoke_2;
    v10[3] = &unk_1E6550688;
    v10[4] = *(void *)(a1 + 32);
    id v11 = v8;
    id v12 = v11;
    id v13 = v7;
    [v9 encodedTypedValueWithCompletion:v10];
  }
  else
  {

    (*((void (**)(id, id, void))v7 + 2))(v7, v8, 0);
  }
}

void __74__WFDialogTransformer_prepareListDialogRequestIfNeeded_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4FB45C8];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = [*(id *)(a1 + 32) allowsMultipleSelection];
  id v7 = [*(id *)(a1 + 32) message];
  id v8 = [*(id *)(a1 + 32) attribution];
  uint64_t v9 = [*(id *)(a1 + 32) prompt];
  char v10 = [*(id *)(a1 + 32) parameterKey];
  id v14 = (id)[v5 initWithItems:v4 allowsMultipleSelection:v6 message:v7 attribution:v8 prompt:v9 parameterKey:v10];

  id v11 = [*(id *)(a1 + 32) linkDialog];
  [v14 setLinkDialog:v11];

  id v12 = [*(id *)(a1 + 40) chooseFromListDataStore];
  id v13 = [v12 endpoint];
  [v14 setDataStoreEndpoint:v13];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __74__WFDialogTransformer_prepareListDialogRequestIfNeeded_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 chooseFromListDataStore];
  uint64_t v6 = [*(id *)(a1 + 40) contentItem];
  id v7 = [*(id *)(a1 + 48) identifier];
  [v5 addContentItem:v6 withIdentifier:v7];

  id v8 = objc_alloc(MEMORY[0x1E4FB46D0]);
  uint64_t v9 = [*(id *)(a1 + 40) title];
  char v10 = [*(id *)(a1 + 40) subtitle];
  id v11 = [*(id *)(a1 + 40) identifier];
  id v12 = [*(id *)(a1 + 40) image];
  uint64_t v13 = [*(id *)(a1 + 40) selected];
  uint64_t v14 = [*(id *)(a1 + 40) hideSubtitle];
  id v15 = [*(id *)(a1 + 40) serializedPossibleState];
  id v16 = (id)[v8 initWithTitle:v9 subtitle:v10 identifier:v11 image:v12 selected:v13 hideSubtitle:v14 encodedTypedValue:v4 serializedPossibleState:v15];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)handleUIRequestResponse:(id)a3 error:(id)a4 forRequest:(id)a5 shouldFailoverToLocalUI:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  id v21 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = (void (**)(id, void, id))a7;
  if (!v21)
  {
    v14[2](v14, 0, v12);
    goto LABEL_18;
  }
  uint64_t v15 = [v21 responseCode];
  if (v15 == 4)
  {
    if (v8)
    {
      [(WFDialogTransformer *)self showDialogRequest:v13 completionHandler:v14];
      goto LABEL_18;
    }
    uint64_t v16 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
  }
  else
  {
    if (v15 != 2)
    {
      if (v15 == 1)
      {
        if (v12)
        {
          [(WFDialogTransformer *)self stopWithError:v12];
          goto LABEL_18;
        }
        id v17 = [(WFDialogTransformer *)self currentAction];
        id v18 = [v17 localizedName];
        uint64_t v19 = v18;
        if (!v18)
        {
          uint64_t v19 = [(WFDialogTransformer *)self workflowName];
        }
        id v20 = WFRunnerFailureErrorMessage(v19);
        [(WFDialogTransformer *)self stopWithError:v20];

        if (!v18) {
      }
        }
      else
      {
        ((void (**)(id, id, id))v14)[2](v14, v21, 0);
        id v17 = [(WFDialogTransformer *)self delegate];
        [v17 dialogTransformerDidDisplayDialog:self];
      }
      goto LABEL_17;
    }
    if ([(WFDialogTransformer *)self isRunningWithToolKitClient]) {
      [MEMORY[0x1E4F28C58] wfCancelledStepError];
    }
    else {
    uint64_t v16 = [MEMORY[0x1E4F28C58] userCancelledError];
    }
  }
  id v17 = (void *)v16;
  [(WFDialogTransformer *)self stopWithError:v16];
LABEL_17:

LABEL_18:
}

- (void)showDialogRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(WFDialogTransformer *)self userInterfacePresenter];

  if (v8)
  {
    uint64_t v9 = [(WFDialogTransformer *)self runViewSource];
    [v6 setRunViewSource:v9];

    char v10 = [(WFDialogTransformer *)self currentAction];
    objc_msgSend(v6, "setIsLastAction:", objc_msgSend(v10, "isLastAction"));

    id v11 = [(WFDialogTransformer *)self userInterfacePresenter];
    id v12 = [(WFDialogTransformer *)self runningContext];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__WFDialogTransformer_showDialogRequest_completionHandler___block_invoke;
    v15[3] = &unk_1E6550888;
    void v15[4] = self;
    id v16 = v6;
    id v17 = v7;
    [v11 showDialogRequest:v16 runningContext:v12 completionHandler:v15];
  }
  else
  {
    if ([(WFDialogTransformer *)self allowsHandoff]
      || [(WFDialogTransformer *)self presentationMode] != 3)
    {
      uint64_t v13 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F28C58] userCancelledError];
    }
    uint64_t v14 = (void *)v13;
    [(WFDialogTransformer *)self stopWithError:v13];
  }
}

uint64_t __59__WFDialogTransformer_showDialogRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleUIRequestResponse:a2 error:a3 forRequest:*(void *)(a1 + 40) shouldFailoverToLocalUI:0 completionHandler:*(void *)(a1 + 48)];
}

- (void)handleDialogRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(WFDialogTransformer *)self setNumberOfDialogsPresented:[(WFDialogTransformer *)self numberOfDialogsPresented] + 1];
  if (![(WFDialogTransformer *)self hasPresentedFirstDialog])
  {
    [(WFDialogTransformer *)self setHasPresentedFirstDialog:1];
    BOOL v8 = [(WFDialogTransformer *)self workflowStartTime];
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    if (v10 < -15.0)
    {
      id v6 = v6;
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = [v6 textFieldConfiguration];
          id v12 = (void *)[v11 copy];

          [v12 setFocusImmediatelyWhenPresented:0];
          id v13 = objc_alloc(MEMORY[0x1E4FB4798]);
          uint64_t v14 = [v6 message];
          uint64_t v15 = [v6 attribution];
          id v16 = [v6 prompt];
          id v17 = [v6 parameterKey];
          id v18 = (void *)[v13 initWithTextFieldConfiguration:v12 message:v14 attribution:v15 prompt:v16 parameterKey:v17];

          id v19 = v18;
          id v20 = v19;
          id v21 = v20;
          if (!v20)
          {
            id v6 = 0;
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {

          id v20 = v6;
          id v21 = 0;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v6 = [v20 requestBySettingFocusImmediatelyWhenPresented:0];
        }
        else
        {
          id v6 = v20;
        }
        goto LABEL_12;
      }
      id v20 = 0;
      id v21 = 0;
      goto LABEL_12;
    }
  }
LABEL_13:
  id v22 = [(WFDialogTransformer *)self delegate];
  [v22 dialogTransformerWillDisplayDialog:self];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v24 = [(WFDialogTransformer *)self runningContext];
  if ([v24 shouldForwardDialogRequests])
  {

LABEL_16:
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __61__WFDialogTransformer_handleDialogRequest_completionHandler___block_invoke;
    v40[3] = &unk_1E6550638;
    v40[4] = self;
    id v41 = v7;
    [(WFDialogTransformer *)self prepareListDialogRequestIfNeeded:v6 completionHandler:v40];
    long long v26 = v41;
LABEL_17:

    goto LABEL_18;
  }
  BOOL v25 = [(WFDialogTransformer *)self isRunningWithToolKitClient];

  if (v25) {
    goto LABEL_16;
  }
  if (isKindOfClass)
  {
    long long v27 = (void *)[objc_alloc(MEMORY[0x1E4FB46E0]) initWithCancelled:0];
    (*((void (**)(id, void *, void))v7 + 2))(v7, v27, 0);

    goto LABEL_18;
  }
  if (![(WFDialogTransformer *)self isRunningWithSiriUI])
  {
    [(WFDialogTransformer *)self showDialogRequest:v6 completionHandler:v7];
    goto LABEL_18;
  }
  long long v28 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v29 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  id v34 = objc_msgSend(v28, "setWithObjects:", v29, v30, v31, v32, v33, objc_opt_class(), 0);
  LOBYTE(v29) = [v34 containsObject:objc_opt_class()];

  if (v29)
  {
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __61__WFDialogTransformer_handleDialogRequest_completionHandler___block_invoke_219;
    v38[3] = &unk_1E6550638;
    v38[4] = self;
    id v39 = v7;
    [(WFDialogTransformer *)self prepareListDialogRequestIfNeeded:v6 completionHandler:v38];
    long long v26 = v39;
    goto LABEL_17;
  }
  __int16 v35 = getWFDialogLogObject();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    long long v43 = "-[WFDialogTransformer handleDialogRequest:completionHandler:]";
    __int16 v44 = 2112;
    id v45 = (id)objc_opt_class();
    id v36 = v45;
    _os_log_impl(&dword_1C7F0A000, v35, OS_LOG_TYPE_ERROR, "%s Unsupported dialog request of type %@ sent to Siri, punching to Shortcuts Jr", buf, 0x16u);
  }
  uint64_t v37 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
  [(WFDialogTransformer *)self stopWithError:v37];

LABEL_18:
}

void __61__WFDialogTransformer_handleDialogRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) externalUIPresenter];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__WFDialogTransformer_handleDialogRequest_completionHandler___block_invoke_2;
  v7[3] = &unk_1E6550610;
  id v5 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 performDialogRequest:v6 completionHandler:v7];
}

void __61__WFDialogTransformer_handleDialogRequest_completionHandler___block_invoke_219(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB48C8]) initWithDialogRequest:v3];
  id v5 = [*(id *)(a1 + 32) externalUIPresenter];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __61__WFDialogTransformer_handleDialogRequest_completionHandler___block_invoke_2_221;
  v9[3] = &unk_1E6550660;
  id v6 = *(void **)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v3;
  id v11 = v4;
  id v12 = v6;
  id v7 = v4;
  id v8 = v3;
  [v5 performSiriRequest:v7 completionHandler:v9];
}

void __61__WFDialogTransformer_handleDialogRequest_completionHandler___block_invoke_2_221(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) cleanupListDialogRequestIfNeeded:*(void *)(a1 + 40)];
  id v4 = v3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v4 dialogResponse];
    id v7 = [*(id *)(a1 + 48) dialogRequest];
    [v5 handleUIRequestResponse:v6 error:0 forRequest:v7 shouldFailoverToLocalUI:1 completionHandler:*(void *)(a1 + 56)];

    id v8 = v4;
  }
  else
  {

    id v9 = getWFDialogLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v12 = 136315394;
      id v13 = "-[WFDialogTransformer handleDialogRequest:completionHandler:]_block_invoke_2";
      __int16 v14 = 2112;
      id v15 = (id)objc_opt_class();
      id v10 = v15;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_FAULT, "%s Received unexpected interaction response of type %@", (uint8_t *)&v12, 0x16u);
    }
    id v11 = *(void **)(a1 + 32);
    id v8 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
    [v11 stopWithError:v8];
  }
}

uint64_t __61__WFDialogTransformer_handleDialogRequest_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleUIRequestResponse:a2 error:0 forRequest:*(void *)(a1 + 40) shouldFailoverToLocalUI:1 completionHandler:*(void *)(a1 + 48)];
}

- (id)attributionIcon
{
  id v2 = [(WFDialogTransformer *)self workflow];
  id v3 = [v2 attributionIcon];

  return v3;
}

- (id)attributionTitle
{
  id v2 = [(WFDialogTransformer *)self workflow];
  id v3 = [v2 attributionTitle];

  return v3;
}

- (id)workflowName
{
  id v2 = [(WFDialogTransformer *)self workflow];
  id v3 = [v2 name];

  return v3;
}

- (id)privacyAttribution
{
  id v2 = WFLocalizedString(@"Privacy");
  id v3 = (void *)MEMORY[0x1E4FB4770];
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v3 imageNamed:@"Privacy" inBundle:v4];

  id v6 = (void *)MEMORY[0x1E4FB46C0];
  if (v5)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB4778]) initWithImage:v5];
    id v8 = [v6 attributionWithTitle:v2 icon:v7];
  }
  else
  {
    id v8 = [MEMORY[0x1E4FB46C0] attributionWithTitle:v2 icon:0];
  }

  return v8;
}

- (id)shortcutsAppAttribution
{
  id v2 = [MEMORY[0x1E4FB46C0] attributionWithAppBundleIdentifier:*MEMORY[0x1E4FB4BE8]];
  if (!v2)
  {
    id v3 = (void *)MEMORY[0x1E4FB4770];
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = [v3 imageNamed:@"Shortcuts" inBundle:v4];

    id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB4778]) initWithImage:v5];
    id v7 = objc_alloc(MEMORY[0x1E4FB46C0]);
    id v8 = WFLocalizedString(@"Shortcuts");
    id v2 = (void *)[v7 initWithTitle:v8 icon:v6];
  }
  return v2;
}

- (id)attributionAllowingAction:(BOOL)a3
{
  BOOL v4 = a3;
  id v6 = [(WFDialogTransformer *)self workflow];
  id v7 = [v6 icon];
  id v8 = (id)*MEMORY[0x1E4FB4BE8];
  id v9 = [(WFDialogTransformer *)self currentAction];
  id v10 = v9;
  if (v4 && v9 && [v9 prefersActionAttribution])
  {
    id v11 = [v10 localizedAttribution];
    int v12 = [v10 icon];
    uint64_t v13 = [v10 appBundleIdentifier];
LABEL_7:
    id v52 = (id)v13;

    goto LABEL_9;
  }
  if (v6)
  {
    id v11 = [v6 attributionTitle];
    int v12 = [v6 attributionIcon];
    uint64_t v13 = [v6 resolvedAssociatedAppBundleIdentifier];
    goto LABEL_7;
  }
  int v12 = 0;
  id v11 = 0;
  id v52 = v8;
LABEL_9:
  __int16 v14 = [v6 name];
  id v51 = v10;
  if ([v14 length]) {
    goto LABEL_15;
  }
  id v15 = [v6 actions];
  if ([v15 count] != 1)
  {
LABEL_14:

    goto LABEL_15;
  }
  id v3 = [v6 associatedAppBundleIdentifier];
  uint64_t v16 = [v3 length];

  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F223C8]);
    id v18 = [v6 associatedAppBundleIdentifier];
    __int16 v14 = (void *)[v17 initWithBundleIdentifier:v18 allowPlaceholder:0 error:0];

    if (v14)
    {
      [v14 localizedName];
      id v11 = v15 = v11;
      goto LABEL_14;
    }
LABEL_15:
  }
  id v19 = [(WFDialogTransformer *)self runSource];
  int v20 = [v19 isEqualToString:*MEMORY[0x1E4FB4F20]];

  if (v20)
  {
    id v21 = [MEMORY[0x1E4FB46B8] currentDevice];
    char v22 = [v21 hasSystemAperture];

    if ((v22 & 1) == 0)
    {
      uint64_t v23 = NSString;
      id v24 = WFLocalizedString(@"%@ │ Shortcuts");
      uint64_t v25 = objc_msgSend(v23, "localizedStringWithFormat:", v24, v11);

      id v11 = (void *)v25;
    }
  }
  if ([v6 hiddenFromLibraryAndSync])
  {
    uint64_t v26 = WFLocalizedString(@"Shortcuts");

    id v11 = (void *)v26;
  }
  if (!v52) {
    id v52 = v8;
  }
  long long v27 = [v6 workflowID];
  if (v27
    || ([v6 actions], id v3 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v3, "count") != 1))
  {
    uint64_t v31 = [(WFDialogTransformer *)self currentAction];
    uint64_t v30 = [v31 identifier];

    if (v27) {
      goto LABEL_28;
    }
  }
  else
  {
    long long v28 = [v6 actions];
    uint64_t v29 = [v28 firstObject];
    uint64_t v30 = [v29 identifier];
  }
LABEL_28:

  uint64_t v32 = [MEMORY[0x1E4FB49C8] symbolIconForActionIdentifier:v30 bundleIdentifier:v52];
  uint64_t v33 = v32;
  if (v32)
  {
    id v34 = v32;

    int v12 = v34;
  }
  __int16 v35 = [(WFDialogTransformer *)self runningContext];
  id v36 = [v35 runSource];
  if ([v36 isEqualToString:*MEMORY[0x1E4FB4EF8]])
  {
    v50 = v7;
    uint64_t v37 = [v6 icon];
    long long v38 = [v37 symbolOverride];

    if (!v38)
    {
      id v7 = v50;
      id v42 = v51;
      if (v12) {
        goto LABEL_39;
      }
LABEL_43:
      uint64_t v48 = [(WFDialogTransformer *)self shortcutsAppAttribution];
      int v12 = [v48 icon];

      if (v11) {
        goto LABEL_40;
      }
      goto LABEL_44;
    }
    id v39 = [MEMORY[0x1E4FB45E0] tintColorForBundleIdentifier:v52];
    id v40 = v39;
    if (v39)
    {
      id v41 = v39;
    }
    else
    {
      id v41 = [MEMORY[0x1E4FB45E0] whiteColor];
    }
    __int16 v35 = v41;

    id v43 = objc_alloc(MEMORY[0x1E4FB49C8]);
    id v36 = [v6 icon];
    __int16 v44 = [v36 symbolOverride];
    uint64_t v45 = [v43 initWithSymbolName:v44 symbolColor:v35];

    int v12 = (void *)v45;
    id v7 = v50;
  }
  id v42 = v51;

  if (!v12) {
    goto LABEL_43;
  }
LABEL_39:
  if (v11) {
    goto LABEL_40;
  }
LABEL_44:
  id v49 = [(WFDialogTransformer *)self shortcutsAppAttribution];
  id v11 = [v49 title];

LABEL_40:
  uint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4FB46C0]) initWithTitle:v11 icon:v12 workflowIcon:v7 appBundleIdentifier:v52];

  return v46;
}

- (WFDialogAttribution)attribution
{
  return (WFDialogAttribution *)[(WFDialogTransformer *)self attributionAllowingAction:1];
}

- (void)stopWithError:(id)a3
{
  id v7 = a3;
  if (objc_msgSend(v7, "wf_isUnsupportedUserInterfaceError")
    && ([(WFDialogTransformer *)self currentAction],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isRunning],
        v4,
        v5))
  {
    id v6 = [(WFDialogTransformer *)self currentAction];
    [v6 finishRunningWithError:v7];
  }
  else
  {
    id v6 = [(WFDialogTransformer *)self delegate];
    [v6 dialogTransformer:self stopRunningWithError:v7];
  }
}

- (void)cancel
{
}

- (void)workflowWillBegin
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(WFDialogTransformer *)self setWorkflowStartTime:v3];

  if ([(WFDialogTransformer *)self isRunningWithExternalUI])
  {
    id v7 = [(WFDialogTransformer *)self externalUIPresenter];
    BOOL v4 = NSNumber;
    int v5 = [(WFWorkflow *)self->_workflow actions];
    id v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    [v7 willBeginExecutingShortcutWithActionCount:v6];
  }
}

- (NSString)userInterfaceType
{
  return (NSString *)(id)*MEMORY[0x1E4F5ABF0];
}

- (WFDialogTransformer)initWithWorkflow:(id)a3 userInterfacePresenter:(id)a4 runSource:(id)a5 runningContext:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)WFDialogTransformer;
  id v15 = [(WFDialogTransformer *)&v21 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workflow, a3);
    objc_storeStrong((id *)&v16->_userInterfacePresenter, a4);
    objc_storeStrong((id *)&v16->_runSource, a5);
    objc_storeStrong((id *)&v16->_runningContext, a6);
    v16->_allowsHandoff = 0;
    v16->_presentationMode = 0;
    v16->_numberOfDialogsPresented = 0;
    id v17 = objc_alloc_init(WFChooseFromListDataStore);
    chooseFromListDataStore = v16->_chooseFromListDataStore;
    v16->_chooseFromListDataStore = v17;

    v16->_hasPresentedFirstDialog = 0;
    id v19 = v16;
  }

  return v16;
}

@end