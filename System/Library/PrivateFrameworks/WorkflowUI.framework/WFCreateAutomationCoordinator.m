@interface WFCreateAutomationCoordinator
- (NSString)triggerIdentifier;
- (UINavigationController)navigationController;
- (WFConfiguredTriggerRecord)triggerRecord;
- (WFCreateAutomationCoordinator)initWithDatabase:(id)a3 homeManager:(id)a4;
- (WFCreateAutomationCoordinatorDelegate)delegate;
- (WFDatabase)database;
- (WFHomeManager)homeManager;
- (WFTriggerManager)triggerManager;
- (WFWorkflow)workflow;
- (WFWorkflowReference)workflowReference;
- (void)automationSummaryViewController:(id)a3 didFinishWithTrigger:(id)a4;
- (void)buildViewControllerForHomeTriggerChooserStepWithBackButtonAction:(unint64_t)a3 hostingViewController:(id)a4 completion:(id)a5;
- (void)buildViewControllerForPersonalTriggerChooserStepWithBackButtonAction:(unint64_t)a3 completion:(id)a4;
- (void)cancel;
- (void)finishWithTriggerRecord:(id)a3;
- (void)openHomeApp;
- (void)selectTypeViewController:(id)a3 didChooseAutomationType:(unint64_t)a4;
- (void)selectTypeViewController:(id)a3 didChooseTrigger:(id)a4;
- (void)setDatabase:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setTriggerIdentifier:(id)a3;
- (void)setTriggerManager:(id)a3;
- (void)setTriggerRecord:(id)a3;
- (void)setWorkflow:(id)a3;
- (void)setWorkflowReference:(id)a3;
- (void)startAtStep:(unint64_t)a3 hostingViewController:(id)a4 completion:(id)a5;
- (void)trackAddAutomationActions;
- (void)trackAddAutomationWithRecord:(id)a3;
- (void)triggerComposeViewController:(id)a3 didFinishWithWorkflow:(id)a4;
- (void)triggerComposeViewControllerDidCancel:(id)a3;
- (void)triggerConfigurationViewController:(id)a3 didFinishWithTrigger:(id)a4;
- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4;
- (void)triggerSuggestionViewControllerDidFinish:(id)a3 actions:(id)a4 editable:(BOOL)a5 selectedEntryMetadata:(id)a6;
- (void)triggerSuggestionViewControllerDidFinish:(id)a3 reference:(id)a4 selectedEntryMetadata:(id)a5;
@end

@implementation WFCreateAutomationCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_workflowReference, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_triggerRecord, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_triggerIdentifier, 0);
  objc_storeStrong((id *)&self->_triggerManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

- (WFHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setWorkflowReference:(id)a3
{
}

- (WFWorkflowReference)workflowReference
{
  return self->_workflowReference;
}

- (void)setWorkflow:(id)a3
{
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (void)setTriggerRecord:(id)a3
{
}

- (WFConfiguredTriggerRecord)triggerRecord
{
  return self->_triggerRecord;
}

- (void)setDatabase:(id)a3
{
}

- (WFDatabase)database
{
  return self->_database;
}

- (void)setTriggerIdentifier:(id)a3
{
}

- (NSString)triggerIdentifier
{
  return self->_triggerIdentifier;
}

- (void)setTriggerManager:(id)a3
{
}

- (WFTriggerManager)triggerManager
{
  return self->_triggerManager;
}

- (void)setDelegate:(id)a3
{
}

- (WFCreateAutomationCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFCreateAutomationCoordinatorDelegate *)WeakRetained;
}

- (void)setNavigationController:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)trackAddAutomationActions
{
  v3 = [(WFCreateAutomationCoordinator *)self workflow];
  v4 = [v3 actions];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__WFCreateAutomationCoordinator_trackAddAutomationActions__block_invoke;
  v5[3] = &unk_2649CBDF0;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __58__WFCreateAutomationCoordinator_trackAddAutomationActions__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = (objc_class *)MEMORY[0x263F868A8];
  id v6 = a2;
  id v10 = objc_alloc_init(v5);
  v7 = [*(id *)(a1 + 32) workflowReference];
  v8 = [v7 identifier];
  [v10 setShortcutIdentifier:v8];

  v9 = [v6 metricsIdentifier];

  [v10 setActionIdentifier:v9];
  [v10 setActionIndex:a3];
  [v10 track];
}

- (void)trackAddAutomationWithRecord:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F868B0];
  id v5 = a3;
  id v15 = objc_alloc_init(v4);
  id v6 = [(WFCreateAutomationCoordinator *)self workflowReference];
  objc_msgSend(v15, "setActionCount:", objc_msgSend(v6, "actionCount"));

  [v15 setSource:@"AutomationTab"];
  v7 = (void *)MEMORY[0x263F86F40];
  v8 = [v5 triggerData];
  v9 = [v7 triggerWithSerializedData:v8];
  id v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  [v15 setTriggerType:v11];

  v12 = [(WFCreateAutomationCoordinator *)self workflowReference];
  v13 = [v12 identifier];
  [v15 setShortcutIdentifier:v13];

  objc_msgSend(v15, "setShowsNotification:", objc_msgSend(v5, "shouldNotify"));
  uint64_t v14 = [v5 shouldPrompt];

  [v15 setRequiresRuntimeConfirmation:v14];
  [v15 track];
}

- (void)automationSummaryViewController:(id)a3 didFinishWithTrigger:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = getWFTriggersLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    v8 = "-[WFCreateAutomationCoordinator automationSummaryViewController:didFinishWithTrigger:]";
    _os_log_impl(&dword_22D994000, v6, OS_LOG_TYPE_DEBUG, "%s summary VC did finish", (uint8_t *)&v7, 0xCu);
  }

  [(WFCreateAutomationCoordinator *)self trackAddAutomationWithRecord:v5];
  [(WFCreateAutomationCoordinator *)self trackAddAutomationActions];
  [(WFCreateAutomationCoordinator *)self finishWithTriggerRecord:v5];
}

- (void)triggerComposeViewControllerDidCancel:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = getWFTriggersLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[WFCreateAutomationCoordinator triggerComposeViewControllerDidCancel:]";
    _os_log_impl(&dword_22D994000, v4, OS_LOG_TYPE_DEBUG, "%s WFTriggerConfigurationViewController was cancelled", (uint8_t *)&v8, 0xCu);
  }

  id v5 = [(WFCreateAutomationCoordinator *)self triggerIdentifier];

  if (v5)
  {
    id v6 = [(WFCreateAutomationCoordinator *)self triggerManager];
    int v7 = [(WFCreateAutomationCoordinator *)self triggerIdentifier];
    [v6 deleteTriggerWithIdentifier:v7 notifyDaemon:1 completion:&__block_literal_global_235];
  }
  else
  {
    id v6 = getWFTriggersLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[WFCreateAutomationCoordinator triggerComposeViewControllerDidCancel:]";
      _os_log_impl(&dword_22D994000, v6, OS_LOG_TYPE_ERROR, "%s No triggerIdentifier to delete for trigger configuration cancellation", (uint8_t *)&v8, 0xCu);
    }
  }
}

void __71__WFCreateAutomationCoordinator_triggerComposeViewControllerDidCancel___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = getWFTriggersLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      int v7 = "-[WFCreateAutomationCoordinator triggerComposeViewControllerDidCancel:]_block_invoke";
      __int16 v8 = 2114;
      id v9 = v4;
      _os_log_impl(&dword_22D994000, v5, OS_LOG_TYPE_ERROR, "%s Failed to delete configured trigger: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)triggerComposeViewController:(id)a3 didFinishWithWorkflow:(id)a4
{
  [(WFCreateAutomationCoordinator *)self setWorkflow:a4];
  id v5 = [(WFCreateAutomationCoordinator *)self triggerRecord];
  [(WFCreateAutomationCoordinator *)self trackAddAutomationWithRecord:v5];

  [(WFCreateAutomationCoordinator *)self trackAddAutomationActions];
  id v6 = [(WFCreateAutomationCoordinator *)self triggerRecord];
  [(WFCreateAutomationCoordinator *)self finishWithTriggerRecord:v6];
}

- (void)triggerSuggestionViewControllerDidFinish:(id)a3 reference:(id)a4 selectedEntryMetadata:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x263F86A48] defaultDatabase];
  id v22 = 0;
  v12 = [MEMORY[0x263F86FF8] workflowWithReference:v9 database:v11 error:&v22];
  id v13 = v22;
  if (v12)
  {
    [(WFCreateAutomationCoordinator *)self setWorkflowReference:v9];
    uint64_t v14 = [(WFCreateAutomationCoordinator *)self triggerRecord];
    [v14 setEditableShortcut:0];

    id v15 = [(WFCreateAutomationCoordinator *)self triggerRecord];
    [v15 setSelectedEntryMetadata:v10];

    objc_initWeak((id *)location, self);
    v16 = [(WFCreateAutomationCoordinator *)self triggerManager];
    v17 = [(WFCreateAutomationCoordinator *)self triggerRecord];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __106__WFCreateAutomationCoordinator_triggerSuggestionViewControllerDidFinish_reference_selectedEntryMetadata___block_invoke;
    v19[3] = &unk_2649CBDC8;
    v19[4] = self;
    objc_copyWeak(&v21, (id *)location);
    id v20 = v9;
    [v16 saveNewConfiguredTrigger:v17 notifyDaemon:1 completion:v19];

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v18 = getWFTriggersLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315650;
      *(void *)&location[4] = "-[WFCreateAutomationCoordinator triggerSuggestionViewControllerDidFinish:reference:selec"
                                "tedEntryMetadata:]";
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      id v27 = v13;
      _os_log_impl(&dword_22D994000, v18, OS_LOG_TYPE_ERROR, "%s Could not get workflow from reference %@ with error %@", location, 0x20u);
    }
  }
}

void __106__WFCreateAutomationCoordinator_triggerSuggestionViewControllerDidFinish_reference_selectedEntryMetadata___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  [*(id *)(a1 + 32) setTriggerIdentifier:v3];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = [WeakRetained triggerManager];
  id v6 = [WeakRetained triggerIdentifier];
  int v7 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __106__WFCreateAutomationCoordinator_triggerSuggestionViewControllerDidFinish_reference_selectedEntryMetadata___block_invoke_2;
  v8[3] = &unk_2649CBDA0;
  id v9 = v7;
  id v10 = WeakRetained;
  [v5 associateWorkflowToTriggerID:v6 deletingExistingReference:0 notifyDaemon:1 workflowReference:v9 completion:v8];
}

void __106__WFCreateAutomationCoordinator_triggerSuggestionViewControllerDidFinish_reference_selectedEntryMetadata___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = getWFTriggersLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v12 = 136315650;
      id v13 = "-[WFCreateAutomationCoordinator triggerSuggestionViewControllerDidFinish:reference:selectedEntryMetadata:]_block_invoke_2";
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_impl(&dword_22D994000, v6, OS_LOG_TYPE_ERROR, "%s Failed to update configured trigger with reference %@: error: %{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
  id v8 = *(void **)(a1 + 40);
  id v9 = [v8 triggerRecord];
  [v8 trackAddAutomationWithRecord:v9];

  [*(id *)(a1 + 40) trackAddAutomationActions];
  id v10 = *(void **)(a1 + 40);
  v11 = [v10 triggerRecord];
  [v10 finishWithTriggerRecord:v11];
}

- (void)triggerSuggestionViewControllerDidFinish:(id)a3 actions:(id)a4 editable:(BOOL)a5 selectedEntryMetadata:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(WFCreateAutomationCoordinator *)self triggerRecord];
  [v13 setEditableShortcut:v7];

  __int16 v14 = [(WFCreateAutomationCoordinator *)self triggerRecord];
  [v14 setSelectedEntryMetadata:v12];

  id v15 = objc_alloc_init(MEMORY[0x263F86FF8]);
  __int16 v16 = NSString;
  id v17 = [MEMORY[0x263F08C38] UUID];
  uint64_t v18 = [v17 UUIDString];
  v19 = [v16 stringWithFormat:@"Automation %@", v18];
  [v15 setName:v19];

  id v20 = [v15 record];
  [v20 setHiddenFromLibraryAndSync:1];

  if ([v11 count])
  {
    id v21 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v11, "count"));
    [v15 insertActions:v11 atIndexes:v21];
  }
  objc_initWeak(&location, self);
  id v22 = [(WFCreateAutomationCoordinator *)self triggerManager];
  v23 = [(WFCreateAutomationCoordinator *)self triggerRecord];
  __int16 v24 = [v15 record];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __113__WFCreateAutomationCoordinator_triggerSuggestionViewControllerDidFinish_actions_editable_selectedEntryMetadata___block_invoke;
  v25[3] = &unk_2649CBD78;
  objc_copyWeak(&v26, &location);
  BOOL v27 = v7;
  [v22 saveNewConfiguredTrigger:v23 workflow:v24 notifyDaemon:1 completion:v25];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __113__WFCreateAutomationCoordinator_triggerSuggestionViewControllerDidFinish_actions_editable_selectedEntryMetadata___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v9 = (void *)MEMORY[0x263F86FF8];
  id v10 = [WeakRetained database];
  id v11 = [v9 workflowWithReference:v6 database:v10 error:0];

  [WeakRetained setWorkflowReference:v6];
  id v12 = [v7 identifier];

  [WeakRetained setTriggerIdentifier:v12];
  if (*(unsigned char *)(a1 + 40))
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __113__WFCreateAutomationCoordinator_triggerSuggestionViewControllerDidFinish_actions_editable_selectedEntryMetadata___block_invoke_2;
    v15[3] = &unk_2649CC018;
    id v16 = v11;
    id v17 = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], v15);
  }
  else
  {
    id v13 = [WeakRetained triggerRecord];
    [WeakRetained trackAddAutomationWithRecord:v13];

    [WeakRetained trackAddAutomationActions];
    __int16 v14 = [WeakRetained triggerRecord];
    [WeakRetained finishWithTriggerRecord:v14];
  }
}

void __113__WFCreateAutomationCoordinator_triggerSuggestionViewControllerDidFinish_actions_editable_selectedEntryMetadata___block_invoke_2(uint64_t a1)
{
  v2 = [WFTriggerComposeViewController alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) database];
  id v13 = [(WFTriggerComposeViewController *)v2 initWithWorkflow:v3 mode:0 database:v4];

  [(WFTriggerComposeViewController *)v13 setDelegate:*(void *)(a1 + 40)];
  id v5 = [(WFTriggerComposeViewController *)v13 navigationItem];
  [v5 setLargeTitleDisplayMode:1];

  id v6 = [(WFTriggerComposeViewController *)v13 navigationItem];
  [v6 _setSupportsTwoLineLargeTitles:1];

  id v7 = (void *)MEMORY[0x263F86F40];
  id v8 = [*(id *)(a1 + 40) triggerRecord];
  id v9 = [v8 triggerData];
  id v10 = [v7 triggerWithSerializedData:v9];
  id v11 = [v10 localizedDescriptionWithConfigurationSummary];
  [(WFTriggerComposeViewController *)v13 setTitle:v11];

  id v12 = [*(id *)(a1 + 40) navigationController];
  [v12 pushViewController:v13 animated:1];
}

- (void)triggerConfigurationViewController:(id)a3 didFinishWithTrigger:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x263F869E0];
  id v7 = a4;
  id v8 = a3;
  id v15 = objc_alloc_init(v6);
  id v9 = [v7 serializedData];
  [v15 setTriggerData:v9];

  objc_msgSend(v15, "setShouldPrompt:", objc_msgSend(v8, "runImmediately") ^ 1);
  objc_msgSend(v15, "setShouldNotify:", objc_msgSend(v8, "shouldNotify"));
  uint64_t v10 = [v8 shouldRecur];

  [v15 setShouldRecur:v10];
  [v15 setEnabled:1];
  [v15 setSource:0];
  [v15 setNotificationLevel:0];
  [(WFCreateAutomationCoordinator *)self setTriggerRecord:v15];
  id v11 = [[WFTriggerSuggestionViewController alloc] initWithTrigger:v7 selectedEntryMetadataData:0 selectedReference:0];

  [(WFTriggerSuggestionViewController *)v11 setDelegate:self];
  id v12 = [(WFTriggerSuggestionViewController *)v11 navigationItem];
  [v12 _setSupportsTwoLineLargeTitles:1];

  id v13 = [(WFTriggerSuggestionViewController *)v11 navigationItem];
  [v13 setLargeTitleDisplayMode:1];

  __int16 v14 = [(WFCreateAutomationCoordinator *)self navigationController];
  [v14 pushViewController:v11 animated:1];
}

- (void)selectTypeViewController:(id)a3 didChooseAutomationType:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    objc_initWeak(&location, self);
    id v8 = [(WFCreateAutomationCoordinator *)self navigationController];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __82__WFCreateAutomationCoordinator_selectTypeViewController_didChooseAutomationType___block_invoke_2;
    v9[3] = &unk_2649CBD50;
    objc_copyWeak(&v10, &location);
    [(WFCreateAutomationCoordinator *)self buildViewControllerForHomeTriggerChooserStepWithBackButtonAction:0 hostingViewController:v8 completion:v9];

    id v7 = &v10;
    goto LABEL_5;
  }
  if (!a4)
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __82__WFCreateAutomationCoordinator_selectTypeViewController_didChooseAutomationType___block_invoke;
    v11[3] = &unk_2649CBD50;
    objc_copyWeak(&v12, &location);
    [(WFCreateAutomationCoordinator *)self buildViewControllerForPersonalTriggerChooserStepWithBackButtonAction:0 completion:v11];
    id v7 = &v12;
LABEL_5:
    objc_destroyWeak(v7);
    objc_destroyWeak(&location);
  }
}

void __82__WFCreateAutomationCoordinator_selectTypeViewController_didChooseAutomationType___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = objc_msgSend(MEMORY[0x263F825C8], "wf_accentColor");
  id v5 = [WeakRetained navigationController];
  id v6 = [v5 navigationBar];
  [v6 setTintColor:v4];

  id v7 = [WeakRetained navigationController];
  [v7 pushViewController:v3 animated:1];
}

void __82__WFCreateAutomationCoordinator_selectTypeViewController_didChooseAutomationType___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = objc_msgSend(MEMORY[0x263F825C8], "wf_homeTintColor");
  id v5 = [WeakRetained navigationController];
  id v6 = [v5 navigationBar];
  [v6 setTintColor:v4];

  id v7 = [WeakRetained navigationController];
  [v7 pushViewController:v3 animated:1];
}

- (void)selectTypeViewController:(id)a3 didChooseTrigger:(id)a4
{
  id v6 = a4;
  id v7 = objc_opt_class();
  if (([v7 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"WFCreateAutomationCoordinator.m", 246, @"Invalid parameter not satisfying: %@", @"[trigger.class isSubclassOfClass:[WFTrigger class]]" object file lineNumber description];
  }
  id v11 = (id)objc_msgSend(objc_alloc(+[WFTriggerConfigurationViewController viewControllerClassForTriggerClass:](WFTriggerConfigurationViewController, "viewControllerClassForTriggerClass:", objc_opt_class())), "initWithTrigger:mode:", v6, 0);

  [v11 setDelegate:self];
  id v8 = [v11 navigationItem];
  [v8 setLargeTitleDisplayMode:2];

  id v9 = [(WFCreateAutomationCoordinator *)self navigationController];
  [v9 pushViewController:v11 animated:1];
}

- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = getWFTriggersLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    id v8 = "-[WFCreateAutomationCoordinator triggerEditor:didFinishWithTriggerBuilder:]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_22D994000, v6, OS_LOG_TYPE_DEBUG, "%s didFinishWithTriggerBuilder: %@", (uint8_t *)&v7, 0x16u);
  }

  if (v5) {
    [(WFCreateAutomationCoordinator *)self finishWithTriggerRecord:0];
  }
  else {
    [(WFCreateAutomationCoordinator *)self cancel];
  }
}

- (void)openHomeApp
{
  id v2 = objc_alloc(MEMORY[0x263F33710]);
  id v3 = (id)[v2 initWithBundleIdentifier:*MEMORY[0x263F85508] options:0 URL:0 userActivity:0];
  [v3 performWithCompletionHandler:&__block_literal_global_16793];
}

void __44__WFCreateAutomationCoordinator_openHomeApp__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = getWFTriggersLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      int v7 = "-[WFCreateAutomationCoordinator openHomeApp]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_22D994000, v5, OS_LOG_TYPE_ERROR, "%s Failed to open Home app with error: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)cancel
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = getWFTriggersLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[WFCreateAutomationCoordinator cancel]";
    _os_log_impl(&dword_22D994000, v3, OS_LOG_TYPE_DEBUG, "%s WFCreateAutomationCoordinator was cancelled", buf, 0xCu);
  }

  id v4 = [(WFCreateAutomationCoordinator *)self triggerIdentifier];
  BOOL v5 = v4 == 0;

  if (v5)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__WFCreateAutomationCoordinator_cancel__block_invoke;
    block[3] = &unk_2649CBF20;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    int v6 = [(WFCreateAutomationCoordinator *)self triggerManager];
    int v7 = [(WFCreateAutomationCoordinator *)self triggerIdentifier];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __39__WFCreateAutomationCoordinator_cancel__block_invoke_2;
    v8[3] = &unk_2649CBD08;
    objc_copyWeak(&v9, (id *)buf);
    [v6 deleteTriggerWithIdentifier:v7 notifyDaemon:1 completion:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
}

void __39__WFCreateAutomationCoordinator_cancel__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) navigationController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

void __39__WFCreateAutomationCoordinator_cancel__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    int v6 = getWFTriggersLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v10 = "-[WFCreateAutomationCoordinator cancel]_block_invoke_2";
      __int16 v11 = 2114;
      id v12 = v5;
      _os_log_impl(&dword_22D994000, v6, OS_LOG_TYPE_ERROR, "%s Failed to delete configured trigger: %{public}@", buf, 0x16u);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__WFCreateAutomationCoordinator_cancel__block_invoke_214;
  block[3] = &unk_2649CBEF8;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v8);
}

void __39__WFCreateAutomationCoordinator_cancel__block_invoke_214(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained delegate];
  [v1 createAutomationCoordinatorDidCancel:WeakRetained];
}

- (void)finishWithTriggerRecord:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = getWFTriggersLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v21 = "-[WFCreateAutomationCoordinator finishWithTriggerRecord:]";
    _os_log_impl(&dword_22D994000, v5, OS_LOG_TYPE_DEBUG, "%s WFCreateAutomationCoordinator is finished", buf, 0xCu);
  }

  int v6 = getWFTriggersLogObject();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      id v21 = "-[WFCreateAutomationCoordinator finishWithTriggerRecord:]";
      _os_log_impl(&dword_22D994000, v6, OS_LOG_TYPE_INFO, "%s Updating workflow and trigger", buf, 0xCu);
    }

    id v8 = [(WFCreateAutomationCoordinator *)self workflow];

    if (v8)
    {
      id v9 = [(WFCreateAutomationCoordinator *)self database];
      uint64_t v10 = [(WFCreateAutomationCoordinator *)self workflow];
      __int16 v11 = [v10 record];
      id v12 = [(WFCreateAutomationCoordinator *)self workflowReference];
      id v19 = 0;
      char v13 = [v9 saveRecord:v11 withDescriptor:v12 error:&v19];
      id v8 = v19;

      if ((v13 & 1) == 0)
      {
        __int16 v14 = getWFTriggersLogObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          id v21 = "-[WFCreateAutomationCoordinator finishWithTriggerRecord:]";
          _os_log_impl(&dword_22D994000, v14, OS_LOG_TYPE_ERROR, "%s Failed to save edited workflow", buf, 0xCu);
        }
      }
    }
    objc_initWeak((id *)buf, self);
    id v15 = [(WFCreateAutomationCoordinator *)self triggerManager];
    id v16 = [(WFCreateAutomationCoordinator *)self triggerIdentifier];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __57__WFCreateAutomationCoordinator_finishWithTriggerRecord___block_invoke;
    v17[3] = &unk_2649CBD08;
    objc_copyWeak(&v18, (id *)buf);
    [v15 updateConfiguredTrigger:v4 triggerID:v16 notifyDaemon:0 completion:v17];

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      id v21 = "-[WFCreateAutomationCoordinator finishWithTriggerRecord:]";
      _os_log_impl(&dword_22D994000, v6, OS_LOG_TYPE_INFO, "%s No trigger to save; was a Home Automation", buf, 0xCu);
    }

    id v8 = [(WFCreateAutomationCoordinator *)self delegate];
    [v8 createAutomationCoordinatorDidFinish:self];
  }
}

void __57__WFCreateAutomationCoordinator_finishWithTriggerRecord___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained triggerManager];
  id v3 = [WeakRetained triggerIdentifier];
  id v4 = [WeakRetained workflowReference];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__WFCreateAutomationCoordinator_finishWithTriggerRecord___block_invoke_2;
  v5[3] = &unk_2649CBCE0;
  v5[4] = WeakRetained;
  [v2 associateWorkflowToTriggerID:v3 deletingExistingReference:0 notifyDaemon:1 workflowReference:v4 completion:v5];
}

void __57__WFCreateAutomationCoordinator_finishWithTriggerRecord___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    int v6 = getWFTriggersLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v9 = "-[WFCreateAutomationCoordinator finishWithTriggerRecord:]_block_invoke_2";
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_impl(&dword_22D994000, v6, OS_LOG_TYPE_ERROR, "%s Failed to save configured trigger: %{public}@", buf, 0x16u);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__WFCreateAutomationCoordinator_finishWithTriggerRecord___block_invoke_211;
  block[3] = &unk_2649CBF20;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __57__WFCreateAutomationCoordinator_finishWithTriggerRecord___block_invoke_211(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 createAutomationCoordinatorDidFinish:*(void *)(a1 + 32)];
}

- (void)buildViewControllerForHomeTriggerChooserStepWithBackButtonAction:(unint64_t)a3 hostingViewController:(id)a4 completion:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v9 = a4;
  v31 = (void (**)(id, void *))a5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __131__WFCreateAutomationCoordinator_buildViewControllerForHomeTriggerChooserStepWithBackButtonAction_hostingViewController_completion___block_invoke;
  aBlock[3] = &unk_2649CBC90;
  aBlock[4] = self;
  aBlock[5] = a2;
  aBlock[6] = a3;
  v30 = (void (**)(void *, void *))_Block_copy(aBlock);
  __int16 v10 = [(WFCreateAutomationCoordinator *)self homeManager];
  id v11 = [v10 homesToWhichWeCanAddHomeAutomations];

  if ([v11 count])
  {
    if ([v11 count] == 1)
    {
      uint64_t v12 = [v11 firstObject];
      char v13 = v30[2](v30, v12);

      v31[2](v31, v13);
    }
    else if ((unint64_t)[v11 count] >= 2)
    {
      uint64_t v28 = v9;
      BOOL v27 = WFLocalizedString(@"Choose a Home to Automate");
      __int16 v14 = objc_msgSend(MEMORY[0x263F82418], "alertControllerWithTitle:message:preferredStyle:");
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id obj = v11;
      uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v36 != v17) {
              objc_enumerationMutation(obj);
            }
            id v19 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            id v20 = (void *)MEMORY[0x263F82400];
            id v21 = [v19 name];
            v32[0] = MEMORY[0x263EF8330];
            v32[1] = 3221225472;
            v32[2] = __131__WFCreateAutomationCoordinator_buildViewControllerForHomeTriggerChooserStepWithBackButtonAction_hostingViewController_completion___block_invoke_2;
            v32[3] = &unk_2649CBCB8;
            uint64_t v22 = v30;
            v32[4] = v19;
            v33 = v22;
            v34 = v31;
            v23 = [v20 actionWithTitle:v21 style:0 handler:v32];
            [v14 addAction:v23];
          }
          uint64_t v16 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v16);
      }

      __int16 v24 = (void *)MEMORY[0x263F82400];
      id v25 = WFLocalizedString(@"Cancel");
      id v26 = [v24 actionWithTitle:v25 style:1 handler:0];
      [v14 addAction:v26];

      id v9 = v28;
      [v28 presentViewController:v14 animated:1 completion:0];
    }
  }
  else
  {
    [(WFCreateAutomationCoordinator *)self openHomeApp];
  }
}

id __131__WFCreateAutomationCoordinator_buildViewControllerForHomeTriggerChooserStepWithBackButtonAction_hostingViewController_completion___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a1[5], a1[4], @"WFCreateAutomationCoordinator.m", 133, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];
  }
  id v4 = [(objc_class *)getHFHomeKitDispatcherClass() sharedDispatcher];
  [v4 setSelectedHome:v3 userInitiated:0];
  id v5 = (void *)[objc_alloc(getHUTriggerTypePickerViewControllerClass()) initWithActionSetBuilder:0 delegate:a1[4]];
  int v6 = v5;
  uint64_t v7 = a1[6];
  if (v7 == 1)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:a1[4] action:sel_cancel];
    id v9 = [v6 navigationItem];
    [v9 setLeftBarButtonItem:v8];
  }
  else
  {
    if (v7) {
      goto LABEL_8;
    }
    id v8 = [v5 navigationItem];
    [v8 setLeftBarButtonItem:0];
  }

LABEL_8:
  return v6;
}

void __131__WFCreateAutomationCoordinator_buildViewControllerForHomeTriggerChooserStepWithBackButtonAction_hostingViewController_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)buildViewControllerForPersonalTriggerChooserStepWithBackButtonAction:(unint64_t)a3 completion:(id)a4
{
  uint64_t v12 = (void (**)(id, void *))a4;
  int v6 = [WFAutomationSelectTypeViewController alloc];
  uint64_t v7 = [(WFCreateAutomationCoordinator *)self triggerManager];
  id v8 = [(WFAutomationSelectTypeViewController *)v6 initWithTriggerManager:v7];

  [(WFAutomationSelectTypeViewController *)v8 setDelegate:self];
  id v9 = [(WFAutomationSelectTypeViewController *)v8 navigationItem];
  [v9 setLargeTitleDisplayMode:2];

  if (a3 == 1)
  {
    __int16 v10 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel];
    id v11 = [(WFAutomationSelectTypeViewController *)v8 navigationItem];
    [v11 setLeftBarButtonItem:v10];
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    __int16 v10 = [(WFAutomationSelectTypeViewController *)v8 navigationItem];
    [v10 setLeftBarButtonItem:0];
  }

LABEL_6:
  v12[2](v12, v8);
}

- (void)startAtStep:(unint64_t)a3 hostingViewController:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    __int16 v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFCreateAutomationCoordinator.m", 79, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v11 = [(WFCreateAutomationCoordinator *)self delegate];

  if (!v11)
  {
    uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"WFCreateAutomationCoordinator.m" lineNumber:80 description:@"Delegate must be set before starting this coordinator"];
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__WFCreateAutomationCoordinator_startAtStep_hostingViewController_completion___block_invoke;
  aBlock[3] = &unk_2649CBC68;
  id v17 = v10;
  unint64_t v18 = a3;
  aBlock[4] = self;
  id v12 = v10;
  char v13 = _Block_copy(aBlock);
  if (a3 >= 2)
  {
    if (a3 == 2) {
      [(WFCreateAutomationCoordinator *)self buildViewControllerForHomeTriggerChooserStepWithBackButtonAction:1 hostingViewController:v9 completion:v13];
    }
  }
  else
  {
    [(WFCreateAutomationCoordinator *)self buildViewControllerForPersonalTriggerChooserStepWithBackButtonAction:1 completion:v13];
  }
}

void __78__WFCreateAutomationCoordinator_startAtStep_hostingViewController_completion___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  if (!v13)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_9;
  }
  id v3 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v13];
  [*(id *)(a1 + 32) setNavigationController:v3];

  id v4 = [*(id *)(a1 + 32) navigationController];
  id v5 = [v4 navigationBar];
  [v5 setPrefersLargeTitles:1];

  unint64_t v6 = *(void *)(a1 + 48);
  if (v6 < 2)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x263F825C8], "wf_accentColor");
LABEL_7:
    id v8 = (void *)v7;
    id v9 = [*(id *)(a1 + 32) navigationController];
    id v10 = [v9 navigationBar];
    [v10 setTintColor:v8];

    goto LABEL_8;
  }
  if (v6 == 2)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x263F825C8], "wf_homeTintColor");
    goto LABEL_7;
  }
LABEL_8:
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = [*(id *)(a1 + 32) navigationController];
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

LABEL_9:
}

- (WFCreateAutomationCoordinator)initWithDatabase:(id)a3 homeManager:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    id v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFCreateAutomationCoordinator.m", 63, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  unint64_t v18 = [MEMORY[0x263F08690] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"WFCreateAutomationCoordinator.m", 64, @"Invalid parameter not satisfying: %@", @"homeManager" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)WFCreateAutomationCoordinator;
  uint64_t v11 = [(WFCreateAutomationCoordinator *)&v19 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_database, a3);
    uint64_t v13 = [objc_alloc(MEMORY[0x263F86F48]) initWithDatabase:v8];
    triggerManager = v12->_triggerManager;
    v12->_triggerManager = (WFTriggerManager *)v13;

    objc_storeStrong((id *)&v12->_homeManager, a4);
    uint64_t v15 = v12;
  }

  return v12;
}

@end