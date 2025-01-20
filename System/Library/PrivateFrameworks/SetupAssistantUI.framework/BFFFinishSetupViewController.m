@interface BFFFinishSetupViewController
+ (id)_keyValueDictionaryForURL:(id)a3;
+ (id)_orderedFlowIdentifiersFromFlowIdentifiers:(id)a3;
- (BFFFinishSetupViewController)init;
- (BOOL)_presentPreconditionViewControllerIfNecessaryForFlowController:(id)a3;
- (BOOL)didCompleteFlowInFinishSetup:(id)a3;
- (BOOL)didSkipFlowInFinishSetup:(id)a3;
- (BYAnalyticsManager)analyticsManager;
- (BYCapabilities)capabilities;
- (BYFlowSkipController)flowSkipController;
- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager;
- (id)_flowControllerForFlowIdentifier:(id)a3;
- (id)_flowControllerForNextFlowIdentifier;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_complete;
- (void)_didSatisfyInitializationForFlowController:(id)a3;
- (void)_didSatisfyPreconditionsForFlowController:(id)a3;
- (void)_ensureNavigationControllerWithViewController:(id)a3 pushCompletion:(id)a4;
- (void)_flowDidFinishForIdentifiers:(id)a3 result:(unint64_t)a4;
- (void)_performExtendedInitializationForFlowController:(id)a3;
- (void)_pushViewControllerOntoNavigationController:(id)a3 completion:(id)a4;
- (void)_startNextFlowIdentifier;
- (void)loadView;
- (void)processURL:(id)a3 completion:(id)a4;
- (void)setAnalyticsManager:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setFlowSkipController:(id)a3;
- (void)setOverrideFlowControllerGenerator:(id)a3;
- (void)setPaneFeatureAnalyticsManager:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation BFFFinishSetupViewController

- (BFFFinishSetupViewController)init
{
  v17.receiver = self;
  v17.super_class = (Class)BFFFinishSetupViewController;
  v2 = [(BFFFinishSetupViewController *)&v17 init];
  if (v2)
  {
    v3 = (BYCapabilities *)objc_alloc_init(MEMORY[0x263F67FE8]);
    capabilities = v2->_capabilities;
    v2->_capabilities = v3;

    v5 = (BYFlowSkipController *)objc_alloc_init(MEMORY[0x263F67FF8]);
    flowSkipController = v2->_flowSkipController;
    v2->_flowSkipController = v5;

    v7 = (BYAnalyticsManager *)objc_alloc_init(MEMORY[0x263F67FD0]);
    analyticsManager = v2->_analyticsManager;
    v2->_analyticsManager = v7;

    id v9 = objc_alloc(MEMORY[0x263F68000]);
    v10 = v2->_analyticsManager;
    v11 = objc_alloc_init(BFFFinishSetupRunState);
    uint64_t v12 = *MEMORY[0x263F67FB0];
    v13 = objc_alloc_init(BFFFinishSetupFlowItemDispositionProvider);
    uint64_t v14 = [v9 initWithAnalyticsManager:v10 runState:v11 host:v12 flowItemDispositionProvider:v13];
    paneFeatureAnalyticsManager = v2->_paneFeatureAnalyticsManager;
    v2->_paneFeatureAnalyticsManager = (BYPaneFeatureAnalyticsManager *)v14;
  }
  return v2;
}

- (void)processURL:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _BYLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    id v23 = v6;
    _os_log_impl(&dword_21FF9E000, v8, OS_LOG_TYPE_DEFAULT, "Finish setup processURL: %@", (uint8_t *)&v22, 0xCu);
  }

  id v9 = (void *)MEMORY[0x223C63B60](v7);
  id completion = self->_completion;
  self->_id completion = v9;

  [(BFFFinishSetupViewController *)self setModalPresentationStyle:17];
  v11 = +[BFFFinishSetupViewController _keyValueDictionaryForURL:v6];
  uint64_t v12 = _BYLoggingFacility();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    id v23 = v11;
    _os_log_impl(&dword_21FF9E000, v12, OS_LOG_TYPE_DEFAULT, "processURL: params %@", (uint8_t *)&v22, 0xCu);
  }

  v13 = [v11 objectForKeyedSubscript:@"flow"];
  uint64_t v14 = _BYLoggingFacility();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    id v23 = v13;
    _os_log_impl(&dword_21FF9E000, v14, OS_LOG_TYPE_DEFAULT, "processURL: flowParameter %@", (uint8_t *)&v22, 0xCu);
  }

  v15 = [v13 componentsSeparatedByString:@","];
  v16 = +[BFFFinishSetupViewController _orderedFlowIdentifiersFromFlowIdentifiers:v15];
  flowIdentifiers = self->_flowIdentifiers;
  self->_flowIdentifiers = v16;

  v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  completedFlowIdentifiers = self->_completedFlowIdentifiers;
  self->_completedFlowIdentifiers = v18;

  v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  skippedFlowIdentifiers = self->_skippedFlowIdentifiers;
  self->_skippedFlowIdentifiers = v20;
}

+ (id)_keyValueDictionaryForURL:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  v5 = [v3 resourceSpecifier];
  id v6 = [v5 componentsSeparatedByString:@"&"];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "componentsSeparatedByString:", @"=", (void)v17);
        if ([v12 count] == 2)
        {
          v13 = [v12 objectAtIndex:1];
          uint64_t v14 = [v13 stringByRemovingPercentEncoding];

          v15 = [v12 objectAtIndex:0];
          [v4 setObject:v14 forKey:v15];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v4;
}

+ (id)_orderedFlowIdentifiersFromFlowIdentifiers:(id)a3
{
  v21[6] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x263F67F90];
  v21[0] = *MEMORY[0x263F67FA8];
  v21[1] = v4;
  uint64_t v5 = *MEMORY[0x263F67F80];
  v21[2] = *MEMORY[0x263F67F98];
  v21[3] = v5;
  uint64_t v6 = *MEMORY[0x263F67FA0];
  v21[4] = *MEMORY[0x263F67F88];
  v21[5] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:6];
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v3, "containsObject:", v14, (void)v16)) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (void)setOverrideFlowControllerGenerator:(id)a3
{
  self->_overrideFlowControllerGenerator = (id)MEMORY[0x223C63B60](a3, a2);
  MEMORY[0x270F9A758]();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)BFFFinishSetupViewController;
  [(BFFFinishSetupViewController *)&v8 loadView];
  uint64_t v3 = [(BFFFinishSetupViewController *)self view];
  [v3 setOpaque:0];

  uint64_t v4 = [MEMORY[0x263F825C8] clearColor];
  uint64_t v5 = [(BFFFinishSetupViewController *)self view];
  [v5 setBackgroundColor:v4];

  uint64_t v6 = +[BFFStyle sharedStyle];
  id v7 = [(BFFFinishSetupViewController *)self navigationItem];
  [v6 applyAutomaticScrollToEdgeBehaviorOnNavigationItem:v7];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BFFFinishSetupViewController;
  [(BFFFinishSetupViewController *)&v5 viewDidAppear:a3];
  if (!self->_setupInProgress)
  {
    self->_setupInProgress = 1;
    uint64_t v4 = [MEMORY[0x263F67FF8] sharedInstance];
    [v4 setBasicFunctionalityEnabled:0];

    [(BFFFinishSetupViewController *)self _startNextFlowIdentifier];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v5 = [(BFFFinishSetupViewController *)self isBeingDismissed];
  uint64_t v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v12 = v5;
    _os_log_impl(&dword_21FF9E000, v6, OS_LOG_TYPE_DEFAULT, "Finish setup viewDidDisappear: isBeingDismissed %d", buf, 8u);
  }

  v10.receiver = self;
  v10.super_class = (Class)BFFFinishSetupViewController;
  [(BFFFinishSetupViewController *)&v10 viewDidDisappear:v3];
  if (v5)
  {
    id v7 = [MEMORY[0x263F67FF8] sharedInstance];
    [v7 setBasicFunctionalityEnabled:1];

    objc_super v8 = [(BFFFinishSetupViewController *)self flowSkipController];
    [v8 cancelPendingFlows];

    id v9 = [(BFFFinishSetupViewController *)self analyticsManager];
    [v9 commit];
  }
}

- (int64_t)preferredStatusBarStyle
{
  return [(BFFNavigationController *)self->_navigationController preferredStatusBarStyle];
}

- (void)_startNextFlowIdentifier
{
  id v3 = [(BFFFinishSetupViewController *)self _flowControllerForNextFlowIdentifier];
  if (!-[BFFFinishSetupViewController _presentPreconditionViewControllerIfNecessaryForFlowController:](self, "_presentPreconditionViewControllerIfNecessaryForFlowController:"))[(BFFFinishSetupViewController *)self _didSatisfyPreconditionsForFlowController:v3]; {
}
  }

- (BOOL)_presentPreconditionViewControllerIfNecessaryForFlowController:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  if (objc_opt_respondsToSelector())
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __95__BFFFinishSetupViewController__presentPreconditionViewControllerIfNecessaryForFlowController___block_invoke;
    v13[3] = &unk_26454ADD8;
    long long v16 = &v17;
    id v5 = v4;
    id v14 = v5;
    v15 = self;
    uint64_t v6 = [v5 preconditionViewControllerWithCompletion:v13];
    id v7 = (void *)v18[5];
    v18[5] = v6;

    if (v18[5])
    {
      objc_super v8 = _BYLoggingFacility();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v5;
        _os_log_impl(&dword_21FF9E000, v8, OS_LOG_TYPE_DEFAULT, "Finish setup will present precondition view controller for  %@", buf, 0xCu);
      }

      navigationController = self->_navigationController;
      if (!navigationController) {
        navigationController = self;
      }
      id v10 = navigationController;
      [v10 presentViewController:v18[5] animated:1 completion:0];
    }
  }
  BOOL v11 = v18[5] != 0;
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __95__BFFFinishSetupViewController__presentPreconditionViewControllerIfNecessaryForFlowController___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) presentingViewController];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __95__BFFFinishSetupViewController__presentPreconditionViewControllerIfNecessaryForFlowController___block_invoke_2;
  v9[3] = &unk_26454ADB0;
  id v7 = *(id *)(a1 + 32);
  char v13 = a2;
  id v10 = v7;
  id v11 = v5;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v8 = v5;
  [v6 dismissViewControllerAnimated:1 completion:v9];
}

void __95__BFFFinishSetupViewController__presentPreconditionViewControllerIfNecessaryForFlowController___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v9 = 138412802;
    uint64_t v10 = v4;
    __int16 v11 = 1024;
    int v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    _os_log_impl(&dword_21FF9E000, v2, OS_LOG_TYPE_DEFAULT, "Finish setup did complete precondition view controller for %@ with precondition satisfied %d completed identifiers %@", (uint8_t *)&v9, 0x1Cu);
  }

  uint64_t v6 = *(void **)(a1 + 48);
  if (*(unsigned char *)(a1 + 64)) {
    [v6 _didSatisfyPreconditionsForFlowController:*(void *)(a1 + 32)];
  }
  else {
    [v6 _flowDidFinishForIdentifiers:*(void *)(a1 + 40) result:1];
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

- (void)_didSatisfyPreconditionsForFlowController:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_5;
  }
  int v5 = [v4 controllerNeedsToRun];
  uint64_t v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v11 = v5;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_21FF9E000, v6, OS_LOG_TYPE_DEFAULT, "Finish setup did observe needsToRun %d for %@", buf, 0x12u);
  }

  if (!v5)
  {
    uint64_t v7 = [(NSMutableArray *)self->_flowIdentifiers firstObject];
    int v9 = v7;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
    [(BFFFinishSetupViewController *)self _flowDidFinishForIdentifiers:v8 result:1];
  }
  else
  {
LABEL_5:
    if (objc_opt_respondsToSelector()) {
      [(BFFFinishSetupViewController *)self _performExtendedInitializationForFlowController:v4];
    }
    else {
      [(BFFFinishSetupViewController *)self _didSatisfyInitializationForFlowController:v4];
    }
  }
}

- (void)_performExtendedInitializationForFlowController:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = _BYLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_21FF9E000, v5, OS_LOG_TYPE_DEFAULT, "Finish setup will perform extended initialization for %@", buf, 0xCu);
  }

  uint64_t v6 = [(OBSetupAssistantSpinnerController *)[BFFSpinnerController alloc] initWithSpinnerText:&stru_26D1D0C18];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __80__BFFFinishSetupViewController__performExtendedInitializationForFlowController___block_invoke;
  v8[3] = &unk_26454AAF0;
  id v9 = v4;
  uint64_t v10 = self;
  id v7 = v4;
  [(BFFFinishSetupViewController *)self _pushViewControllerOntoNavigationController:v6 completion:v8];
}

void __80__BFFFinishSetupViewController__performExtendedInitializationForFlowController___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __80__BFFFinishSetupViewController__performExtendedInitializationForFlowController___block_invoke_2;
  v4[3] = &unk_26454AAF0;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

void __80__BFFFinishSetupViewController__performExtendedInitializationForFlowController___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_21FF9E000, v2, OS_LOG_TYPE_DEFAULT, "Finish setup extended initialization for %@ did reach the main queue", buf, 0xCu);
  }

  id v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__BFFFinishSetupViewController__performExtendedInitializationForFlowController___block_invoke_54;
  v7[3] = &unk_26454AE00;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = v5;
  uint64_t v9 = v6;
  [v5 performExtendedInitializationWithCompletion:v7];
}

void __80__BFFFinishSetupViewController__performExtendedInitializationForFlowController___block_invoke_54(int8x16_t *a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = a1[2].i64[0];
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v7;
    __int16 v17 = 1024;
    int v18 = a2;
    _os_log_impl(&dword_21FF9E000, v6, OS_LOG_TYPE_DEFAULT, "Finish setup did perform extended initialization for %@ with success %d", buf, 0x12u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__BFFFinishSetupViewController__performExtendedInitializationForFlowController___block_invoke_55;
  block[3] = &unk_26454ACF0;
  char v14 = a2;
  int8x16_t v10 = a1[2];
  id v8 = (id)v10.i64[0];
  int8x16_t v12 = vextq_s8(v10, v10, 8uLL);
  id v13 = v5;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __80__BFFFinishSetupViewController__performExtendedInitializationForFlowController___block_invoke_55(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2) {
    return [v3 _didSatisfyInitializationForFlowController:*(void *)(a1 + 40)];
  }
  else {
    return [v3 _flowDidFinishForIdentifiers:*(void *)(a1 + 48) result:1];
  }
}

- (void)_didSatisfyInitializationForFlowController:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _BYLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_21FF9E000, v5, OS_LOG_TYPE_DEFAULT, "Finish setup will present view controller for  %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  int8x16_t v10 = __75__BFFFinishSetupViewController__didSatisfyInitializationForFlowController___block_invoke;
  uint64_t v11 = &unk_26454AE28;
  id v6 = v4;
  id v12 = v6;
  objc_copyWeak(&v13, (id *)buf);
  uint64_t v7 = [v6 viewControllerWithCompletion:&v8];
  -[BFFFinishSetupViewController _pushViewControllerOntoNavigationController:completion:](self, "_pushViewControllerOntoNavigationController:completion:", v7, 0, v8, v9, v10, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __75__BFFFinishSetupViewController__didSatisfyInitializationForFlowController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v7;
    __int16 v11 = 2048;
    uint64_t v12 = a2;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_21FF9E000, v6, OS_LOG_TYPE_DEFAULT, "Finish setup flow %@ did complete with result %lu completed identifiers %@", (uint8_t *)&v9, 0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _flowDidFinishForIdentifiers:v5 result:a2];
}

- (void)_ensureNavigationControllerWithViewController:(id)a3 pushCompletion:(id)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_newRootViewController, a3);
  int v9 = [v7 navigationItem];
  [v9 setHidesBackButton:1];

  navigationController = self->_navigationController;
  if (navigationController)
  {
    if ([(BFFFinishSetupModalNavigationController *)navigationController _isTransitioning])
    {
      __int16 v11 = _BYLoggingFacility();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[BFFFinishSetupViewController _ensureNavigationControllerWithViewController:pushCompletion:](v11);
      }
    }
    [(BFFNavigationController *)self->_navigationController pushViewController:v7 completion:v8];
  }
  else
  {
    uint64_t v12 = objc_alloc_init(BFFFinishSetupModalNavigationController);
    __int16 v13 = self->_navigationController;
    self->_navigationController = v12;

    v22[0] = v7;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
    [(BFFFinishSetupModalNavigationController *)self->_navigationController setViewControllers:v14];

    uint64_t v15 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v16 = [v15 userInterfaceIdiom];

    [(BFFFinishSetupModalNavigationController *)self->_navigationController setIsPad:(v16 & 0xFFFFFFFFFFFFFFFBLL) == 1];
    __int16 v17 = _BYLoggingFacility();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = self->_navigationController;
      int v20 = 138412290;
      v21 = v18;
      _os_log_impl(&dword_21FF9E000, v17, OS_LOG_TYPE_DEFAULT, "did create _navigationController: %@", (uint8_t *)&v20, 0xCu);
    }

    +[BFFViewControllerSpinnerManager configureWithNavigationController:self->_navigationController];
    [(BFFFinishSetupViewController *)self presentViewController:self->_navigationController animated:1 completion:v8];
  }
  uint64_t v19 = +[BFFStyle sharedStyle];
  [v19 applyThemeToNavigationController:self->_navigationController];
}

- (void)_pushViewControllerOntoNavigationController:(id)a3 completion:(id)a4
{
  if (a3)
  {
    -[BFFFinishSetupViewController _ensureNavigationControllerWithViewController:pushCompletion:](self, "_ensureNavigationControllerWithViewController:pushCompletion:");
  }
  else
  {
    id v5 = _BYLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_21FF9E000, v5, OS_LOG_TYPE_DEFAULT, "failed to create view controller for next flow! will complete", v6, 2u);
    }

    [(BFFFinishSetupViewController *)self _complete];
  }
}

- (id)_flowControllerForFlowIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = [a3 componentsSeparatedByString:@"."];
  id v5 = [v4 lastObject];

  if (!v5)
  {
    id v7 = 0;
    goto LABEL_13;
  }
  overrideFlowControllerGenerator = (void (**)(id, void *))self->_overrideFlowControllerGenerator;
  if (!overrideFlowControllerGenerator
    || (overrideFlowControllerGenerator[2](overrideFlowControllerGenerator, v5),
        (id v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ([v5 isEqualToString:*MEMORY[0x263F67FA0]])
    {
      uint64_t v8 = +[BFFFinishSetupAssistantOptInController finishSetupAssistantOptInController];
    }
    else if ([v5 isEqualToString:*MEMORY[0x263F67F80]])
    {
      uint64_t v8 = +[BFFFinishSetupAppleIDController finishSetupAppleIDController];
    }
    else
    {
      if (![v5 isEqualToString:*MEMORY[0x263F67F88]])
      {
        if ([v5 isEqualToString:*MEMORY[0x263F67FA8]])
        {
          uint64_t v13 = +[BFFFinishSetupTouchIDController finishSetupTouchIDController];
        }
        else
        {
          if (![v5 isEqualToString:*MEMORY[0x263F67F90]])
          {
            if (![v5 isEqualToString:*MEMORY[0x263F67F98]])
            {
              id v7 = 0;
              goto LABEL_12;
            }
            uint64_t v8 = +[BFFFinishSetupPasscodeController finishSetupPasscodeController];
            goto LABEL_11;
          }
          uint64_t v13 = +[BFFFinishSetupFaceIDController finishSetupFaceIDController];
        }
        id v7 = (void *)v13;
        id v14 = [(BFFFinishSetupViewController *)self capabilities];
        [v7 setCapabilities:v14];

        goto LABEL_12;
      }
      uint64_t v8 = +[BFFFinishSetupPaymentController finishSetupPaymentControllerWithHost:self];
    }
LABEL_11:
    id v7 = (void *)v8;
  }
LABEL_12:
  int v9 = [(BFFFinishSetupViewController *)self flowSkipController];
  [v7 setFlowSkipController:v9];

  uint64_t v10 = [(BFFFinishSetupViewController *)self paneFeatureAnalyticsManager];
  [v7 setPaneFeatureAnalyticsManager:v10];

LABEL_13:
  __int16 v11 = _BYLoggingFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    uint64_t v16 = v7;
    _os_log_impl(&dword_21FF9E000, v11, OS_LOG_TYPE_DEFAULT, "Buddy followup did create flowController %@", (uint8_t *)&v15, 0xCu);
  }

  return v7;
}

- (id)_flowControllerForNextFlowIdentifier
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(NSMutableArray *)self->_flowIdentifiers firstObject];
  id v4 = [(BFFFinishSetupViewController *)self _flowControllerForFlowIdentifier:v3];

  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 prerequisiteFlowIdentifier];
    id v6 = _BYLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      uint64_t v10 = v5;
      _os_log_impl(&dword_21FF9E000, v6, OS_LOG_TYPE_DEFAULT, "Buddy followup prerequisite flow identifier %@", (uint8_t *)&v9, 0xCu);
    }

    if (v5)
    {
      uint64_t v7 = [(BFFFinishSetupViewController *)self _flowControllerForFlowIdentifier:v5];

      id v4 = (void *)v7;
    }
  }
  return v4;
}

- (void)_flowDidFinishForIdentifiers:(id)a3 result:(unint64_t)a4
{
  id v7 = a3;
  -[NSMutableArray removeObjectsInArray:](self->_flowIdentifiers, "removeObjectsInArray:");
  switch(a4)
  {
    case 0uLL:
      id v6 = &OBJC_IVAR___BFFFinishSetupViewController__completedFlowIdentifiers;
      goto LABEL_6;
    case 2uLL:
      goto LABEL_9;
    case 1uLL:
      id v6 = &OBJC_IVAR___BFFFinishSetupViewController__skippedFlowIdentifiers;
LABEL_6:
      [*(id *)((char *)&self->super.super.super.isa + *v6) addObjectsFromArray:v7];
      break;
  }
  if ([(NSMutableArray *)self->_flowIdentifiers count])
  {
    [(BFFFinishSetupViewController *)self _startNextFlowIdentifier];
    goto LABEL_10;
  }
LABEL_9:
  [(BFFFinishSetupViewController *)self _complete];
LABEL_10:
}

- (void)_complete
{
  uint64_t v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FF9E000, v3, OS_LOG_TYPE_DEFAULT, "Buddy followup will complete", buf, 2u);
  }

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __41__BFFFinishSetupViewController__complete__block_invoke;
  v10[3] = &unk_26454AAC8;
  v10[4] = self;
  uint64_t v4 = MEMORY[0x223C63B60](v10);
  id v5 = (void *)v4;
  if (self->_navigationController)
  {
    id v6 = _BYLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FF9E000, v6, OS_LOG_TYPE_DEFAULT, "Buddy followup will dismiss navigation controller", buf, 2u);
    }

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __41__BFFFinishSetupViewController__complete__block_invoke_70;
    v8[3] = &unk_26454AC80;
    void v8[4] = self;
    id v9 = v5;
    [(BFFFinishSetupViewController *)self dismissViewControllerAnimated:1 completion:v8];
  }
  else
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
  id v7 = _BYLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FF9E000, v7, OS_LOG_TYPE_DEFAULT, "Buddy followup did complete", buf, 2u);
  }
}

void __41__BFFFinishSetupViewController__complete__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 1032);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 1032);
    *(void *)(v4 + 1032) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v2 + 976) = 0;
}

uint64_t __41__BFFFinishSetupViewController__complete__block_invoke_70(uint64_t a1)
{
  uint64_t v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21FF9E000, v2, OS_LOG_TYPE_DEFAULT, "Buddy followup did dismiss navigation controller", v6, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 984);
  *(void *)(v3 + 984) = 0;

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)didCompleteFlowInFinishSetup:(id)a3
{
  return [(NSMutableSet *)self->_completedFlowIdentifiers containsObject:a3];
}

- (BOOL)didSkipFlowInFinishSetup:(id)a3
{
  return [(NSMutableSet *)self->_skippedFlowIdentifiers containsObject:a3];
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (BYFlowSkipController)flowSkipController
{
  return self->_flowSkipController;
}

- (void)setFlowSkipController:(id)a3
{
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_flowSkipController, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong(&self->_overrideFlowControllerGenerator, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_newRootViewController, 0);
  objc_storeStrong((id *)&self->_skippedFlowIdentifiers, 0);
  objc_storeStrong((id *)&self->_completedFlowIdentifiers, 0);
  objc_storeStrong((id *)&self->_flowIdentifiers, 0);
  objc_storeStrong((id *)&self->_followUpAction, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

- (void)_ensureNavigationControllerWithViewController:(os_log_t)log pushCompletion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21FF9E000, log, OS_LOG_TYPE_ERROR, "Finish setup attempting to push view controller while transition in progress. Probably going to hang.", v1, 2u);
}

@end