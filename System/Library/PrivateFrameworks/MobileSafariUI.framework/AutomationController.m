@interface AutomationController
- (AutomationController)init;
- (BOOL)_automationSession:(id)a3 isShowingJavaScriptDialogForWebView:(id)a4;
- (BOOL)_uninstallAutomationSession;
- (BOOL)canCreateNewAutomationTabs;
- (_WKAutomationSession)automationSession;
- (id)_automationSession:(id)a3 messageOfCurrentJavaScriptDialogForWebView:(id)a4;
- (id)_browserControllerForAutomation;
- (id)processPool;
- (int64_t)_automationSession:(id)a3 currentPresentationForWebView:(id)a4;
- (int64_t)_automationSession:(id)a3 typeOfCurrentJavaScriptDialogForWebView:(id)a4;
- (void)_automationSession:(id)a3 acceptCurrentJavaScriptDialogForWebView:(id)a4;
- (void)_automationSession:(id)a3 dismissCurrentJavaScriptDialogForWebView:(id)a4;
- (void)_automationSession:(id)a3 requestNewWebViewWithOptions:(unint64_t)a4 completionHandler:(id)a5;
- (void)_automationSession:(id)a3 requestSwitchToWebView:(id)a4 completionHandler:(id)a5;
- (void)_automationSession:(id)a3 setUserInput:(id)a4 forCurrentJavaScriptDialogForWebView:(id)a5;
- (void)_developerPreferencesChanged;
- (void)_processPool:(id)a3 didRequestAutomationSessionWithIdentifier:(id)a4 configuration:(id)a5;
- (void)_processPoolDidRequestInspectorDebuggablesToWakeUp:(id)a3;
- (void)_uninstallGuidedAccessSession;
- (void)createAutomationSessionWithIdentifier:(id)a3;
- (void)createAutomationSessionWithIdentifier:(id)a3 configuration:(id)a4 retryBehavior:(int64_t)a5;
- (void)dealloc;
- (void)tabDocument:(id)a3 runJavaScriptAlertPanelWithMessage:(id)a4 completionHandler:(id)a5;
- (void)tabDocument:(id)a3 runJavaScriptConfirmPanelWithMessage:(id)a4 completionHandler:(id)a5;
- (void)tabDocument:(id)a3 runJavaScriptTextInputPanelWithPrompt:(id)a4 defaultText:(id)a5 completionHandler:(id)a6;
- (void)terminateSession;
- (void)updatePreferencesForAutomation:(id)a3;
@end

@implementation AutomationController

- (AutomationController)init
{
  v10.receiver = self;
  v10.super_class = (Class)AutomationController;
  v2 = [(AutomationController *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    activeDialogs = v2->_activeDialogs;
    v2->_activeDialogs = (NSMapTable *)v3;

    v5 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v5 addObserver:v2 selector:sel__developerPreferencesChanged name:*MEMORY[0x1E4F3B130] object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel__applicationDidEnterBackground name:*MEMORY[0x1E4FB2640] object:0];

    v7 = [(AutomationController *)v2 processPool];
    [v7 _setAutomationDelegate:v2];

    v8 = v2;
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5 = [(AutomationController *)self processPool];
  [v5 _setAutomationDelegate:0];

  v6.receiver = self;
  v6.super_class = (Class)AutomationController;
  [(AutomationController *)&v6 dealloc];
}

- (id)processPool
{
  v2 = +[Application sharedApplication];
  uint64_t v3 = [v2 defaultProcessPool];

  return v3;
}

- (id)_browserControllerForAutomation
{
  v2 = +[Application sharedApplication];
  uint64_t v3 = [v2 browserControllers];
  v4 = objc_msgSend(v3, "safari_firstObjectPassingTest:", &__block_literal_global_10);

  return v4;
}

uint64_t __55__AutomationController__browserControllerForAutomation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isControlledByAutomation];
}

- (BOOL)canCreateNewAutomationTabs
{
  uint64_t v3 = [(AutomationController *)self automationSession];
  if (v3) {
    BOOL v4 = !self->_closingAutomationTabsForSessionTeardown;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)updatePreferencesForAutomation:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setFraudulentWebsiteWarningEnabled:0];
  [v4 _setFullScreenEnabled:1];
  [v4 _setVideoQualityIncludesDisplayCompositingEnabled:1];
  [v4 _setMockCaptureDevicesEnabled:1];
  [v4 _setMockCaptureDevicesPromptEnabled:0];
  if (self->_provisionalSessionConfiguration)
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXWebDriver();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[AutomationController updatePreferencesForAutomation:]([(_WKAutomationSessionConfiguration *)self->_provisionalSessionConfiguration allowsInsecureMediaCapture], (uint64_t)v8);
    }

    objc_msgSend(v4, "_setMediaCaptureRequiresSecureConnection:", -[_WKAutomationSessionConfiguration allowsInsecureMediaCapture](self->_provisionalSessionConfiguration, "allowsInsecureMediaCapture") ^ 1);
    objc_super v6 = (id)WBS_LOG_CHANNEL_PREFIXWebDriver();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[AutomationController updatePreferencesForAutomation:]([(_WKAutomationSessionConfiguration *)self->_provisionalSessionConfiguration suppressesICECandidateFiltering], (uint64_t)&v7);
    }

    objc_msgSend(v4, "_setICECandidateFilteringEnabled:", -[_WKAutomationSessionConfiguration suppressesICECandidateFiltering](self->_provisionalSessionConfiguration, "suppressesICECandidateFiltering") ^ 1);
  }
}

- (void)createAutomationSessionWithIdentifier:(id)a3
{
  id v5 = a3;
  id v4 = objc_opt_new();
  [(AutomationController *)self createAutomationSessionWithIdentifier:v5 configuration:v4 retryBehavior:0];
}

- (void)createAutomationSessionWithIdentifier:(id)a3 configuration:(id)a4 retryBehavior:(int64_t)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(_SFAutomationController *)self allowsRemoteAutomation])
  {
    objc_super v10 = WBS_LOG_CHANNEL_PREFIXWebDriver();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v34 = (uint64_t)v8;
      _os_log_impl(&dword_1E102C000, v10, OS_LOG_TYPE_DEFAULT, "Checking if a new session (%{public}@) can be created.", buf, 0xCu);
    }
    v11 = (void *)MEMORY[0x1E4F989A0];
    v12 = [(AutomationController *)self automationSession];
    uint64_t v13 = [v11 canCreateSessionWithExistingSession:v12 retryBehavior:a5];

    switch(v13)
    {
      case 1:
        v14 = (id)WBS_LOG_CHANNEL_PREFIXWebDriver();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = [(AutomationController *)self automationSession];
          v16 = [v15 sessionIdentifier];
          *(_DWORD *)buf = 138543618;
          uint64_t v34 = (uint64_t)v16;
          __int16 v35 = 2114;
          id v36 = v8;
          _os_log_impl(&dword_1E102C000, v14, OS_LOG_TYPE_DEFAULT, "Terminating unpaired session (%{public}@) so new session request (%{public}@) can be fulfilled.", buf, 0x16u);
        }
        [(AutomationController *)self terminateSession];
        break;
      case 2:
        v23 = WBS_LOG_CHANNEL_PREFIXWebDriver();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349056;
          uint64_t v34 = 1;
          _os_log_impl(&dword_1E102C000, v23, OS_LOG_TYPE_DEFAULT, "Waiting %{public}lld seconds and trying session creation again.", buf, 0xCu);
        }
        dispatch_time_t v24 = dispatch_time(0, 1000000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __90__AutomationController_createAutomationSessionWithIdentifier_configuration_retryBehavior___block_invoke;
        block[3] = &unk_1E6D79970;
        block[4] = self;
        v21 = &v31;
        id v31 = v8;
        v22 = &v32;
        id v32 = v9;
        dispatch_after(v24, MEMORY[0x1E4F14428], block);
        goto LABEL_15;
      case 3:
        goto LABEL_16;
    }
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __90__AutomationController_createAutomationSessionWithIdentifier_configuration_retryBehavior___block_invoke_2;
    v27[3] = &unk_1E6D79970;
    v27[4] = self;
    id v28 = v9;
    id v29 = v8;
    v17 = (void *)MEMORY[0x1E4E42950](v27);
    v18 = [MEMORY[0x1E4FB1480] defaultConfigurationForStyle:3];
    [v18 setAllowsAutoLock:0];
    [v18 setAllowsLockButton:1];
    [v18 setAutomaticallyRelaunchesAfterAppCrash:0];
    v19 = (void *)MEMORY[0x1E4FB1488];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __90__AutomationController_createAutomationSessionWithIdentifier_configuration_retryBehavior___block_invoke_51;
    v25[3] = &unk_1E6D7A260;
    v25[4] = self;
    id v20 = v17;
    id v26 = v20;
    [v19 requestSessionWithConfiguration:v18 completion:v25];

    v21 = &v28;
    v22 = &v29;
LABEL_15:
  }
LABEL_16:
}

uint64_t __90__AutomationController_createAutomationSessionWithIdentifier_configuration_retryBehavior___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) createAutomationSessionWithIdentifier:*(void *)(a1 + 40) configuration:*(void *)(a1 + 48) retryBehavior:1];
}

void __90__AutomationController_createAutomationSessionWithIdentifier_configuration_retryBehavior___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  v2 = +[Application sharedApplication];
  uint64_t v3 = [v2 browserWindowController];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __90__AutomationController_createAutomationSessionWithIdentifier_configuration_retryBehavior___block_invoke_3;
  v5[3] = &unk_1E6D7A238;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 setUpAutomationWindowWithCompletionHandler:v5];
}

void __90__AutomationController_createAutomationSessionWithIdentifier_configuration_retryBehavior___block_invoke_3(uint64_t a1, void *a2)
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  if (v3)
  {
    id v6 = (id)WBS_LOG_CHANNEL_PREFIXWebDriver();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = objc_msgSend(v3, "safari_privacyPreservingDescription");
      __90__AutomationController_createAutomationSessionWithIdentifier_configuration_retryBehavior___block_invoke_3_cold_1(v7, (uint64_t)v13, v6);
    }

    [*(id *)(a1 + 32) _uninstallGuidedAccessSession];
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F9F688]);
    uint64_t v9 = *(void *)(a1 + 32);
    objc_super v10 = *(void **)(v9 + 24);
    *(void *)(v9 + 24) = v8;

    [*(id *)(*(void *)(a1 + 32) + 24) activateAssertionWithIdentifier:@"com.apple.sharing.PreventProxCards"];
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F46760]) initWithConfiguration:*(void *)(a1 + 40)];
    [v11 setDelegate:*(void *)(a1 + 32)];
    [v11 setSessionIdentifier:*(void *)(a1 + 48)];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), v11);
    v12 = [*(id *)(a1 + 32) processPool];
    [v12 _setAutomationSession:v11];
  }
}

void __90__AutomationController_createAutomationSessionWithIdentifier_configuration_retryBehavior___block_invoke_51(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 || !v6)
  {
    uint64_t v9 = (id)WBS_LOG_CHANNEL_PREFIXWebDriver();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_super v10 = objc_msgSend(v5, "safari_privacyPreservingDescription");
      __90__AutomationController_createAutomationSessionWithIdentifier_configuration_retryBehavior___block_invoke_51_cold_1(v10, (uint64_t)v11, v9);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a3);
    id v8 = WBS_LOG_CHANNEL_PREFIXWebDriver();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1E102C000, v8, OS_LOG_TYPE_DEFAULT, "Successfully started Guided Access session used for WebDriver.", v11, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)terminateSession
{
  id v2 = [(AutomationController *)self automationSession];
  [v2 terminate];
}

- (void)_uninstallGuidedAccessSession
{
  guidedAccessSession = self->_guidedAccessSession;
  if (guidedAccessSession)
  {
    uint64_t v4 = guidedAccessSession;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4FB1488] currentlyActiveSession];
  }
  id v6 = v4;
  id v5 = self->_guidedAccessSession;
  self->_guidedAccessSession = 0;

  if ([(UIAutonomousSingleAppModeSession *)v6 isActive]) {
    [(UIAutonomousSingleAppModeSession *)v6 endWithCompletion:&__block_literal_global_54];
  }
}

void __53__AutomationController__uninstallGuidedAccessSession__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (id)WBS_LOG_CHANNEL_PREFIXWebDriver();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = objc_msgSend(v2, "safari_privacyPreservingDescription");
      __53__AutomationController__uninstallGuidedAccessSession__block_invoke_cold_1(v4, (uint64_t)v6, v3);
    }
  }
  else
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXWebDriver();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully ended Guided Access session used for WebDriver.", v6, 2u);
    }
  }
}

- (BOOL)_uninstallAutomationSession
{
  id v3 = [(AutomationController *)self automationSession];

  if (v3)
  {
    self->_closingAutomationTabsForSessionTeardown = 1;
    uint64_t v4 = [(AutomationController *)self _browserControllerForAutomation];
    id v5 = [v4 tabController];
    [v5 closeAllOpenTabsAnimated:0];

    self->_closingAutomationTabsForSessionTeardown = 0;
    [(_WKAutomationSession *)self->_automationSession setDelegate:0];
    automationSession = self->_automationSession;
    self->_automationSession = 0;

    self->_automationSessionRequestedFirstWebView = 0;
    uint64_t v7 = [(AutomationController *)self processPool];
    [v7 _setAutomationSession:0];

    id v8 = +[Application sharedApplication];
    uint64_t v9 = [v8 browserWindowController];
    [v9 tearDownAutomationWindow];

    [(SFClient *)self->_sharingClient invalidate];
    sharingClient = self->_sharingClient;
    self->_sharingClient = 0;

    [(AutomationController *)self _uninstallGuidedAccessSession];
  }
  return v3 != 0;
}

- (void)_developerPreferencesChanged
{
  id v4 = [(AutomationController *)self automationSession];
  if (v4)
  {
    BOOL v3 = [(_SFAutomationController *)self allowsRemoteAutomation];

    if (!v3) {
      [(AutomationController *)self terminateSession];
    }
  }
  id v5 = [(AutomationController *)self processPool];
  [v5 _automationCapabilitiesDidChange];
}

- (void)_processPool:(id)a3 didRequestAutomationSessionWithIdentifier:(id)a4 configuration:(id)a5
{
}

- (void)_processPoolDidRequestInspectorDebuggablesToWakeUp:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  BOOL v3 = +[Application sharedApplication];
  id v4 = [v3 allWebExtensionsControllers];

  id obj = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v19 + 1) + 8 * v7);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        uint64_t v9 = [v8 enabledExtensions];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v16;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v16 != v11) {
                objc_enumerationMutation(v9);
              }
              uint64_t v13 = [v8 webExtensionForExtension:*(void *)(*((void *)&v15 + 1) + 8 * v12)];
              [v13 loadBackgroundPageIfNecessaryWithCompletionHandler:&__block_literal_global_56];

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v10);
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }
}

- (void)_automationSession:(id)a3 requestNewWebViewWithOptions:(unint64_t)a4 completionHandler:(id)a5
{
  long long v15 = (void (**)(id, void *))a5;
  uint64_t v6 = [(AutomationController *)self _browserControllerForAutomation];
  uint64_t v7 = v6;
  if (!self->_automationSessionRequestedFirstWebView)
  {
    self->_automationSessionRequestedFirstWebView = 1;
    uint64_t v10 = [v6 tabController];
    uint64_t v9 = [v10 activeTabDocument];

    if (([v9 isControlledByAutomation] & 1) == 0)
    {
      uint64_t v11 = [v7 tabController];
      [v11 closeAllOpenTabsAnimated:0];

      uint64_t v12 = [v7 tabController];
      uint64_t v13 = [v12 activeTabDocument];

      uint64_t v9 = (void *)v13;
    }
    goto LABEL_6;
  }
  id v8 = [MEMORY[0x1E4F1CB10] URLWithString:@"about:blank"];
  uint64_t v9 = [v7 loadURLInNewTab:v8 inBackground:0 animated:0];

  if (v9)
  {
LABEL_6:
    v14 = [v9 webView];
    v15[2](v15, v14);

    goto LABEL_8;
  }
  v15[2](v15, 0);
LABEL_8:
}

- (void)_automationSession:(id)a3 requestSwitchToWebView:(id)a4 completionHandler:(id)a5
{
  uint64_t v10 = (void (**)(void))a5;
  uint64_t v7 = +[TabDocument tabDocumentForWKWebView:a4];
  if (v7)
  {
    id v8 = [(AutomationController *)self _browserControllerForAutomation];
    uint64_t v9 = [v8 tabController];
    [v9 setActiveTabDocument:v7 animated:0];

    v10[2]();
  }
  else
  {
    v10[2]();
  }
}

- (BOOL)_automationSession:(id)a3 isShowingJavaScriptDialogForWebView:(id)a4
{
  uint64_t v5 = +[TabDocument tabDocumentForWKWebView:a4];
  if (v5)
  {
    uint64_t v6 = [(NSMapTable *)self->_activeDialogs objectForKey:v5];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_automationSession:(id)a3 dismissCurrentJavaScriptDialogForWebView:(id)a4
{
  id v8 = a4;
  uint64_t v5 = +[TabDocument tabDocumentForWKWebView:](TabDocument, "tabDocumentForWKWebView:");
  if (v5)
  {
    uint64_t v6 = [(NSMapTable *)self->_activeDialogs objectForKey:v5];
    if (v6)
    {
      [(NSMapTable *)self->_activeDialogs removeObjectForKey:v5];
      BOOL v7 = [v6 completionHandler];
      v7[2](v7, 0, 0);
    }
  }
}

- (void)_automationSession:(id)a3 acceptCurrentJavaScriptDialogForWebView:(id)a4
{
  id v9 = a4;
  uint64_t v5 = +[TabDocument tabDocumentForWKWebView:](TabDocument, "tabDocumentForWKWebView:");
  if (v5)
  {
    uint64_t v6 = [(NSMapTable *)self->_activeDialogs objectForKey:v5];
    if (v6)
    {
      [(NSMapTable *)self->_activeDialogs removeObjectForKey:v5];
      BOOL v7 = [v6 completionHandler];
      id v8 = [v6 currentInput];
      ((void (**)(void, uint64_t, void *))v7)[2](v7, 1, v8);
    }
  }
}

- (id)_automationSession:(id)a3 messageOfCurrentJavaScriptDialogForWebView:(id)a4
{
  uint64_t v5 = +[TabDocument tabDocumentForWKWebView:a4];
  if (v5)
  {
    uint64_t v6 = [(NSMapTable *)self->_activeDialogs objectForKey:v5];
    BOOL v7 = v6;
    if (v6)
    {
      id v8 = [v6 message];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (int64_t)_automationSession:(id)a3 typeOfCurrentJavaScriptDialogForWebView:(id)a4
{
  uint64_t v5 = +[TabDocument tabDocumentForWKWebView:a4];
  if (v5)
  {
    uint64_t v6 = [(NSMapTable *)self->_activeDialogs objectForKey:v5];
    BOOL v7 = v6;
    if (v6) {
      int64_t v8 = [v6 type];
    }
    else {
      int64_t v8 = 1;
    }
  }
  else
  {
    int64_t v8 = 1;
  }

  return v8;
}

- (void)_automationSession:(id)a3 setUserInput:(id)a4 forCurrentJavaScriptDialogForWebView:(id)a5
{
  id v10 = a4;
  BOOL v7 = +[TabDocument tabDocumentForWKWebView:a5];
  if (v7)
  {
    int64_t v8 = [(NSMapTable *)self->_activeDialogs objectForKey:v7];
    id v9 = v8;
    if (v8) {
      [v8 setCurrentInput:v10];
    }
  }
}

- (int64_t)_automationSession:(id)a3 currentPresentationForWebView:(id)a4
{
  id v4 = +[TabDocument tabDocumentForWKWebView:a4];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 browserController];
    if ([v6 usesTabBar])
    {
      BOOL v7 = [v6 tabController];
      int64_t v8 = (unint64_t)[v7 numberOfCurrentNonHiddenTabs] < 2;
    }
    else
    {
      int64_t v8 = 1;
    }
  }
  else
  {
    int64_t v8 = 1;
  }

  return v8;
}

- (void)tabDocument:(id)a3 runJavaScriptAlertPanelWithMessage:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [JavaScriptDialogState alloc];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__AutomationController_tabDocument_runJavaScriptAlertPanelWithMessage_completionHandler___block_invoke;
  v14[3] = &unk_1E6D7A288;
  id v12 = v10;
  id v15 = v12;
  uint64_t v13 = [(JavaScriptDialogState *)v11 initWithMessage:v9 type:2 completionHandler:v14];
  [(NSMapTable *)self->_activeDialogs setObject:v13 forKey:v8];
}

uint64_t __89__AutomationController_tabDocument_runJavaScriptAlertPanelWithMessage_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)tabDocument:(id)a3 runJavaScriptConfirmPanelWithMessage:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [JavaScriptDialogState alloc];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__AutomationController_tabDocument_runJavaScriptConfirmPanelWithMessage_completionHandler___block_invoke;
  v14[3] = &unk_1E6D7A288;
  id v12 = v10;
  id v15 = v12;
  uint64_t v13 = [(JavaScriptDialogState *)v11 initWithMessage:v9 type:3 completionHandler:v14];
  [(NSMapTable *)self->_activeDialogs setObject:v13 forKey:v8];
}

uint64_t __91__AutomationController_tabDocument_runJavaScriptConfirmPanelWithMessage_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)tabDocument:(id)a3 runJavaScriptTextInputPanelWithPrompt:(id)a4 defaultText:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [JavaScriptDialogState alloc];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __104__AutomationController_tabDocument_runJavaScriptTextInputPanelWithPrompt_defaultText_completionHandler___block_invoke;
  v15[3] = &unk_1E6D7A288;
  id v13 = v11;
  id v16 = v13;
  v14 = [(JavaScriptDialogState *)v12 initWithMessage:v10 type:4 completionHandler:v15];
  [(NSMapTable *)self->_activeDialogs setObject:v14 forKey:v9];
}

uint64_t __104__AutomationController_tabDocument_runJavaScriptTextInputPanelWithPrompt_defaultText_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (_WKAutomationSession)automationSession
{
  return self->_automationSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automationSession, 0);
  objc_storeStrong((id *)&self->_provisionalSessionConfiguration, 0);
  objc_storeStrong((id *)&self->_guidedAccessSession, 0);
  objc_storeStrong((id *)&self->_sharingClient, 0);
  objc_storeStrong((id *)&self->_activeDialogs, 0);
}

- (void)updatePreferencesForAutomation:(char)a1 .cold.1(char a1, uint64_t a2)
{
  BOOL v3 = @"NO";
  if (a1) {
    BOOL v3 = @"YES";
  }
  id v4 = v3;
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = v4;
  OUTLINED_FUNCTION_1_2(&dword_1E102C000, v5, v6, "Applying session configuration: suppressesICECandidateFiltering = %{public}@");
}

- (void)updatePreferencesForAutomation:(char)a1 .cold.2(char a1, uint64_t a2)
{
  BOOL v3 = @"NO";
  if (a1) {
    BOOL v3 = @"YES";
  }
  id v4 = v3;
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = v4;
  OUTLINED_FUNCTION_1_2(&dword_1E102C000, v5, v6, "Applying session configuration: allowsInsecureMediaCapture = %{public}@");
}

void __90__AutomationController_createAutomationSessionWithIdentifier_configuration_retryBehavior___block_invoke_3_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_1E102C000, a2, a3, "Unable to set up a window for WebDriver: %{public}@", (uint8_t *)a2);
}

void __90__AutomationController_createAutomationSessionWithIdentifier_configuration_retryBehavior___block_invoke_51_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_1E102C000, a2, a3, "Unable to start Guided Access session used for WebDriver: %{public}@", (uint8_t *)a2);
}

void __53__AutomationController__uninstallGuidedAccessSession__block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_1E102C000, a2, a3, "Unable to end Guided Access session used for WebDriver: %{public}@", (uint8_t *)a2);
}

@end