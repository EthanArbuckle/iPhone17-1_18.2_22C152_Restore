@interface WFEditAutomationCoordinator
- (NSString)triggerIdentifier;
- (UINavigationController)navigationController;
- (WFAutomationSummaryViewController)automationSummaryViewController;
- (WFConfiguredTriggerRecord)triggerRecord;
- (WFDatabase)database;
- (WFEditAutomationCoordinator)initWithDatabase:(id)a3 triggerRecord:(id)a4 triggerIdentifier:(id)a5 workflowReference:(id)a6;
- (WFEditAutomationCoordinatorDelegate)delegate;
- (WFTrigger)trigger;
- (WFTriggerManager)triggerManager;
- (WFWorkflow)editingWorkflow;
- (WFWorkflowReference)workflowReference;
- (id)start;
- (void)automationSummaryViewController:(id)a3 editTrigger:(id)a4;
- (void)automationSummaryViewController:(id)a3 editWorkflow:(id)a4;
- (void)automationSummaryViewControllerChooseShortcut:(id)a3;
- (void)cancel;
- (void)finish;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)setAutomationSummaryViewController:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditingWorkflow:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setTrigger:(id)a3;
- (void)setTriggerManager:(id)a3;
- (void)setWorkflowReference:(id)a3;
- (void)triggerComposeViewController:(id)a3 didFinishWithWorkflow:(id)a4;
- (void)triggerConfigurationViewController:(id)a3 didFinishWithTrigger:(id)a4;
- (void)triggerSuggestionViewControllerDidFinish:(id)a3 actions:(id)a4 editable:(BOOL)a5 selectedEntryMetadata:(id)a6;
- (void)triggerSuggestionViewControllerDidFinish:(id)a3 reference:(id)a4 selectedEntryMetadata:(id)a5;
- (void)updateUIForShowingViewController:(id)a3;
@end

@implementation WFEditAutomationCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automationSummaryViewController, 0);
  objc_storeStrong((id *)&self->_editingWorkflow, 0);
  objc_storeStrong((id *)&self->_workflowReference, 0);
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_triggerIdentifier, 0);
  objc_storeStrong((id *)&self->_triggerRecord, 0);
  objc_storeStrong((id *)&self->_triggerManager, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

- (void)setAutomationSummaryViewController:(id)a3
{
}

- (WFAutomationSummaryViewController)automationSummaryViewController
{
  return self->_automationSummaryViewController;
}

- (void)setEditingWorkflow:(id)a3
{
}

- (WFWorkflow)editingWorkflow
{
  return self->_editingWorkflow;
}

- (void)setWorkflowReference:(id)a3
{
}

- (WFWorkflowReference)workflowReference
{
  return self->_workflowReference;
}

- (void)setTrigger:(id)a3
{
}

- (WFTrigger)trigger
{
  return self->_trigger;
}

- (NSString)triggerIdentifier
{
  return self->_triggerIdentifier;
}

- (WFConfiguredTriggerRecord)triggerRecord
{
  return self->_triggerRecord;
}

- (void)setTriggerManager:(id)a3
{
}

- (WFTriggerManager)triggerManager
{
  return self->_triggerManager;
}

- (void)setDatabase:(id)a3
{
}

- (WFDatabase)database
{
  return self->_database;
}

- (void)setDelegate:(id)a3
{
}

- (WFEditAutomationCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFEditAutomationCoordinatorDelegate *)WeakRetained;
}

- (void)setNavigationController:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)updateUIForShowingViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(WFEditAutomationCoordinator *)self automationSummaryViewController];

  if (v5 == v4)
  {
    v6 = [(WFEditAutomationCoordinator *)self trigger];
    v7 = [v6 serializedData];
    v8 = [(WFEditAutomationCoordinator *)self triggerRecord];
    [v8 setTriggerData:v7];

    id v9 = [(WFEditAutomationCoordinator *)self automationSummaryViewController];
    [v9 updateUI];
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
}

- (void)triggerComposeViewController:(id)a3 didFinishWithWorkflow:(id)a4
{
  id v5 = [(WFEditAutomationCoordinator *)self triggerManager];
  v6 = [(WFEditAutomationCoordinator *)self triggerIdentifier];
  v7 = [(WFEditAutomationCoordinator *)self workflowReference];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __82__WFEditAutomationCoordinator_triggerComposeViewController_didFinishWithWorkflow___block_invoke;
  v8[3] = &unk_2649CBCE0;
  v8[4] = self;
  [v5 associateWorkflowToTriggerID:v6 deletingExistingReference:0 notifyDaemon:1 workflowReference:v7 completion:v8];
}

uint64_t __82__WFEditAutomationCoordinator_triggerComposeViewController_didFinishWithWorkflow___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

- (void)triggerSuggestionViewControllerDidFinish:(id)a3 reference:(id)a4 selectedEntryMetadata:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  [(WFEditAutomationCoordinator *)self setWorkflowReference:v7];
  id v9 = [(WFEditAutomationCoordinator *)self triggerRecord];
  [v9 setEditableShortcut:0];

  v10 = [(WFEditAutomationCoordinator *)self triggerRecord];
  [v10 setSelectedEntryMetadata:v8];

  v11 = [(WFEditAutomationCoordinator *)self triggerManager];
  v12 = [(WFEditAutomationCoordinator *)self triggerIdentifier];
  v13 = [(WFEditAutomationCoordinator *)self editingWorkflow];
  uint64_t v14 = [v13 hiddenFromLibraryAndSync];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __104__WFEditAutomationCoordinator_triggerSuggestionViewControllerDidFinish_reference_selectedEntryMetadata___block_invoke;
  v16[3] = &unk_2649CBDA0;
  id v17 = v7;
  v18 = self;
  id v15 = v7;
  [v11 associateWorkflowToTriggerID:v12 deletingExistingReference:v14 notifyDaemon:1 workflowReference:v15 completion:v16];
}

void __104__WFEditAutomationCoordinator_triggerSuggestionViewControllerDidFinish_reference_selectedEntryMetadata___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = getWFTriggersLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 136315650;
      id v9 = "-[WFEditAutomationCoordinator triggerSuggestionViewControllerDidFinish:reference:selectedEntryMetadata:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_impl(&dword_22D994000, v6, OS_LOG_TYPE_ERROR, "%s Failed to update configured trigger with reference %@: error: %{public}@", (uint8_t *)&v8, 0x20u);
    }
  }
  [*(id *)(a1 + 40) finish];
}

- (void)triggerSuggestionViewControllerDidFinish:(id)a3 actions:(id)a4 editable:(BOOL)a5 selectedEntryMetadata:(id)a6
{
  BOOL v7 = a5;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a6;
  uint64_t v11 = [(WFEditAutomationCoordinator *)self editingWorkflow];
  uint64_t v12 = [v11 hiddenFromLibraryAndSync];

  id v13 = objc_alloc_init(MEMORY[0x263F86FF8]);
  uint64_t v14 = NSString;
  id v15 = [MEMORY[0x263F08C38] UUID];
  v16 = [v15 UUIDString];
  id v17 = [v14 stringWithFormat:@"Automation %@", v16];
  [v13 setName:v17];

  v18 = [v13 record];
  [v18 setHiddenFromLibraryAndSync:1];

  if ([v9 count])
  {
    v19 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v9, "count"));
    [v13 insertActions:v9 atIndexes:v19];
  }
  id v20 = objc_alloc(MEMORY[0x263F87000]);
  v21 = [v13 record];
  v22 = (void *)[v20 initWithRecord:v21];

  v23 = [(WFEditAutomationCoordinator *)self database];
  id v38 = 0;
  v24 = [v23 createWorkflowWithOptions:v22 error:&v38];
  id v25 = v38;

  if (!v24)
  {
    v26 = getWFTriggersLogObject();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[WFEditAutomationCoordinator triggerSuggestionViewControllerDidFinish:actions:editable:selectedEntryMetadata:]";
      __int16 v41 = 2114;
      id v42 = v25;
      _os_log_impl(&dword_22D994000, v26, OS_LOG_TYPE_FAULT, "%s Failed to create reference: %{public}@", buf, 0x16u);
    }
  }
  [(WFEditAutomationCoordinator *)self setWorkflowReference:v24];
  [(WFEditAutomationCoordinator *)self setEditingWorkflow:v13];
  v27 = [(WFEditAutomationCoordinator *)self triggerRecord];
  [v27 setSelectedEntryMetadata:v10];

  v28 = [(WFEditAutomationCoordinator *)self triggerRecord];
  [v28 setEditableShortcut:v7];

  if (v7)
  {
    v29 = [WFTriggerComposeViewController alloc];
    v30 = [(WFEditAutomationCoordinator *)self database];
    v31 = [(WFTriggerComposeViewController *)v29 initWithWorkflow:v13 mode:1 database:v30];

    [(WFTriggerComposeViewController *)v31 setDelegate:self];
    v32 = [(WFTriggerComposeViewController *)v31 navigationItem];
    [v32 setLargeTitleDisplayMode:2];

    v33 = [(WFEditAutomationCoordinator *)self navigationController];
    [v33 pushViewController:v31 animated:1];
  }
  else
  {
    v34 = [(WFEditAutomationCoordinator *)self triggerManager];
    v35 = [(WFEditAutomationCoordinator *)self triggerIdentifier];
    v36 = [(WFEditAutomationCoordinator *)self workflowReference];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __111__WFEditAutomationCoordinator_triggerSuggestionViewControllerDidFinish_actions_editable_selectedEntryMetadata___block_invoke;
    v37[3] = &unk_2649CBCE0;
    v37[4] = self;
    [v34 associateWorkflowToTriggerID:v35 deletingExistingReference:v12 notifyDaemon:1 workflowReference:v36 completion:v37];
  }
}

uint64_t __111__WFEditAutomationCoordinator_triggerSuggestionViewControllerDidFinish_actions_editable_selectedEntryMetadata___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

- (void)triggerConfigurationViewController:(id)a3 didFinishWithTrigger:(id)a4
{
  id v6 = a3;
  BOOL v7 = [a4 serializedData];
  int v8 = [(WFEditAutomationCoordinator *)self triggerRecord];
  [v8 setTriggerData:v7];

  uint64_t v9 = [v6 runImmediately] ^ 1;
  id v10 = [(WFEditAutomationCoordinator *)self triggerRecord];
  [v10 setShouldPrompt:v9];

  uint64_t v11 = [v6 shouldNotify];
  uint64_t v12 = [(WFEditAutomationCoordinator *)self triggerRecord];
  [v12 setShouldNotify:v11];

  uint64_t v13 = [v6 shouldRecur];
  uint64_t v14 = [(WFEditAutomationCoordinator *)self triggerRecord];
  [v14 setShouldRecur:v13];

  [(WFEditAutomationCoordinator *)self finish];
}

- (void)automationSummaryViewControllerChooseShortcut:(id)a3
{
  id v4 = [WFTriggerSuggestionViewController alloc];
  id v5 = [(WFEditAutomationCoordinator *)self trigger];
  int v8 = [(WFTriggerSuggestionViewController *)v4 initWithTrigger:v5 selectedEntryMetadataData:0 selectedReference:0];

  id v6 = [(WFTriggerSuggestionViewController *)v8 navigationItem];
  [v6 setLargeTitleDisplayMode:1];

  [(WFTriggerSuggestionViewController *)v8 setDelegate:self];
  BOOL v7 = [(WFEditAutomationCoordinator *)self navigationController];
  [v7 pushViewController:v8 animated:1];
}

- (void)automationSummaryViewController:(id)a3 editWorkflow:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"WFEditAutomationCoordinator.m", 140, @"Invalid parameter not satisfying: %@", @"workflow" object file lineNumber description];
  }
  uint64_t v9 = getWFTriggersLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[WFEditAutomationCoordinator automationSummaryViewController:editWorkflow:]";
    __int16 v27 = 2112;
    id v28 = v8;
    _os_log_impl(&dword_22D994000, v9, OS_LOG_TYPE_DEBUG, "%s will edit workflow: %@", buf, 0x16u);
  }

  id v10 = [(WFEditAutomationCoordinator *)self triggerRecord];
  int v11 = [v10 editableShortcut];

  if (v11)
  {
    uint64_t v12 = [WFTriggerComposeViewController alloc];
    uint64_t v13 = [(WFEditAutomationCoordinator *)self database];
    uint64_t v14 = [(WFTriggerComposeViewController *)v12 initWithWorkflow:v8 mode:1 database:v13];

    id v15 = [(WFTriggerComposeViewController *)v14 navigationItem];
    v16 = v15;
    uint64_t v17 = 2;
  }
  else
  {
    v18 = [WFTriggerSuggestionViewController alloc];
    v19 = [(WFEditAutomationCoordinator *)self trigger];
    id v20 = [(WFEditAutomationCoordinator *)self triggerRecord];
    v21 = [v20 selectedEntryMetadata];
    v22 = [(WFEditAutomationCoordinator *)self workflowReference];
    uint64_t v14 = [(WFTriggerSuggestionViewController *)v18 initWithTrigger:v19 selectedEntryMetadataData:v21 selectedReference:v22];

    id v15 = [(WFTriggerComposeViewController *)v14 navigationItem];
    v16 = v15;
    uint64_t v17 = 1;
  }
  [v15 setLargeTitleDisplayMode:v17];

  [(WFTriggerComposeViewController *)v14 setDelegate:self];
  v23 = [(WFEditAutomationCoordinator *)self navigationController];
  [v23 pushViewController:v14 animated:1];
}

- (void)automationSummaryViewController:(id)a3 editTrigger:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFEditAutomationCoordinator.m", 123, @"Invalid parameter not satisfying: %@", @"triggerRecord" object file lineNumber description];
  }
  uint64_t v9 = getWFTriggersLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[WFEditAutomationCoordinator automationSummaryViewController:editTrigger:]";
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl(&dword_22D994000, v9, OS_LOG_TYPE_DEBUG, "%s WFEditAutomationCoordinator will edit trigger: %@", buf, 0x16u);
  }

  id v10 = [(WFEditAutomationCoordinator *)self trigger];
  int v11 = +[WFTriggerConfigurationViewController viewControllerClassForTriggerClass:objc_opt_class()];

  id v12 = [v11 alloc];
  uint64_t v13 = [(WFEditAutomationCoordinator *)self trigger];
  uint64_t v14 = (void *)[v12 initWithTrigger:v13 mode:1];

  [v14 setDelegate:self];
  objc_msgSend(v14, "setRunImmediately:", objc_msgSend(v8, "shouldPrompt") ^ 1);
  objc_msgSend(v14, "setShouldNotify:", objc_msgSend(v8, "shouldNotify"));
  objc_msgSend(v14, "setShouldRecur:", objc_msgSend(v8, "shouldRecur"));
  id v15 = [v14 navigationItem];
  [v15 setLargeTitleDisplayMode:2];

  objc_msgSend(v14, "setRunImmediately:", objc_msgSend(v8, "shouldPrompt") ^ 1);
  v16 = [(WFEditAutomationCoordinator *)self navigationController];
  [v16 pushViewController:v14 animated:1];
}

- (void)cancel
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = getWFTriggersLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "-[WFEditAutomationCoordinator cancel]";
    _os_log_impl(&dword_22D994000, v3, OS_LOG_TYPE_DEBUG, "%s WFEditAutomationCoordinator is cancelling", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(WFEditAutomationCoordinator *)self delegate];
  [v4 editAutomationCoordinatorDidCancel:self];
}

- (void)finish
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = getWFTriggersLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v9 = "-[WFEditAutomationCoordinator finish]";
    _os_log_impl(&dword_22D994000, v3, OS_LOG_TYPE_DEBUG, "%s WFEditAutomationCoordinator is finishing", buf, 0xCu);
  }

  [(WFEditAutomationCoordinator *)self setEditingWorkflow:0];
  id v4 = [(WFEditAutomationCoordinator *)self triggerManager];
  int v5 = [(WFEditAutomationCoordinator *)self triggerRecord];
  id v6 = [(WFEditAutomationCoordinator *)self triggerIdentifier];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__WFEditAutomationCoordinator_finish__block_invoke;
  v7[3] = &unk_2649CBCE0;
  v7[4] = self;
  [v4 updateConfiguredTrigger:v5 triggerID:v6 notifyDaemon:1 completion:v7];
}

void __37__WFEditAutomationCoordinator_finish__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = getWFTriggersLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v9 = "-[WFEditAutomationCoordinator finish]_block_invoke";
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_impl(&dword_22D994000, v6, OS_LOG_TYPE_ERROR, "%s Failed to save configured trigger: %{public}@", buf, 0x16u);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__WFEditAutomationCoordinator_finish__block_invoke_189;
  block[3] = &unk_2649CBF20;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __37__WFEditAutomationCoordinator_finish__block_invoke_189(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 editAutomationCoordinatorDidFinish:*(void *)(a1 + 32)];
}

- (id)start
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v4 = getWFTriggersLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v46 = "-[WFEditAutomationCoordinator start]";
    _os_log_impl(&dword_22D994000, v4, OS_LOG_TYPE_DEBUG, "%s WFEditAutomationCoordinator is starting", buf, 0xCu);
  }

  id v5 = [(WFEditAutomationCoordinator *)self delegate];

  if (!v5)
  {
    id v42 = [MEMORY[0x263F08690] currentHandler];
    [v42 handleFailureInMethod:a2 object:self file:@"WFEditAutomationCoordinator.m" lineNumber:64 description:@"Delegate must be set before starting this coordinator"];
  }
  id v6 = [(WFEditAutomationCoordinator *)self database];
  uint64_t v7 = [(WFEditAutomationCoordinator *)self workflowReference];
  id v44 = 0;
  id v8 = [v6 recordWithDescriptor:v7 error:&v44];
  id v9 = v44;

  if (v8)
  {
    __int16 v10 = (void *)MEMORY[0x263F86FF8];
    id v11 = [(WFEditAutomationCoordinator *)self workflowReference];
    uint64_t v12 = [(WFEditAutomationCoordinator *)self database];
    id v43 = v9;
    uint64_t v13 = [v10 workflowWithReference:v11 database:v12 error:&v43];
    id v14 = v43;

    [(WFEditAutomationCoordinator *)self setEditingWorkflow:v13];
    id v15 = [(WFEditAutomationCoordinator *)self editingWorkflow];

    if (!v15)
    {
      v16 = getWFTriggersLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = [(WFEditAutomationCoordinator *)self database];
        v18 = [(WFEditAutomationCoordinator *)self workflowReference];
        *(_DWORD *)buf = 136315906;
        v46 = "-[WFEditAutomationCoordinator start]";
        __int16 v47 = 2112;
        v48 = v17;
        __int16 v49 = 2112;
        uint64_t v50 = (uint64_t)v18;
        __int16 v51 = 2114;
        id v52 = v14;
        _os_log_impl(&dword_22D994000, v16, OS_LOG_TYPE_ERROR, "%s Failed to get workflow from database (%@) for reference (%@): %{public}@", buf, 0x2Au);
      }
      v19 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    id v14 = v9;
  }
  __int16 v20 = [(WFEditAutomationCoordinator *)self triggerRecord];
  v16 = [v20 triggerData];

  if ([v16 length]
    && ([MEMORY[0x263F86F40] triggerWithSerializedData:v16],
        (uint64_t v21 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v22 = v21;
    [(WFEditAutomationCoordinator *)self setTrigger:v21];
    v23 = [WFAutomationSummaryViewController alloc];
    v24 = [(WFEditAutomationCoordinator *)self triggerRecord];
    id v25 = [(WFEditAutomationCoordinator *)self triggerIdentifier];
    v26 = [(WFEditAutomationCoordinator *)self editingWorkflow];
    __int16 v27 = [(WFAutomationSummaryViewController *)v23 initWithTrigger:v24 triggerIdentifier:v25 workflow:v26 mode:1];
    [(WFEditAutomationCoordinator *)self setAutomationSummaryViewController:v27];

    id v28 = [(WFEditAutomationCoordinator *)self automationSummaryViewController];
    [v28 setDelegate:self];

    uint64_t v29 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel];
    v30 = [(WFEditAutomationCoordinator *)self automationSummaryViewController];
    v31 = [v30 navigationItem];
    [v31 setLeftBarButtonItem:v29];

    v32 = [(WFEditAutomationCoordinator *)self automationSummaryViewController];
    v33 = [v32 navigationItem];
    [v33 setLargeTitleDisplayMode:2];

    id v34 = objc_alloc(MEMORY[0x263F829B8]);
    v35 = [(WFEditAutomationCoordinator *)self automationSummaryViewController];
    v36 = (void *)[v34 initWithRootViewController:v35];
    [(WFEditAutomationCoordinator *)self setNavigationController:v36];

    v37 = [(WFEditAutomationCoordinator *)self navigationController];
    [v37 setDelegate:self];

    id v38 = [(WFEditAutomationCoordinator *)self navigationController];
    v39 = [v38 navigationBar];
    [v39 setPrefersLargeTitles:1];

    v19 = [(WFEditAutomationCoordinator *)self navigationController];
  }
  else
  {
    uint64_t v22 = getWFTriggersLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = [v16 length];
      *(_DWORD *)buf = 136315650;
      v46 = "-[WFEditAutomationCoordinator start]";
      __int16 v47 = 2112;
      v48 = v16;
      __int16 v49 = 2050;
      uint64_t v50 = v40;
      _os_log_impl(&dword_22D994000, v22, OS_LOG_TYPE_ERROR, "%s Failed to deserialize WFTrigger from data (%@) (length=%{public}lu)", buf, 0x20u);
    }
    v19 = 0;
  }

LABEL_18:
  return v19;
}

- (WFEditAutomationCoordinator)initWithDatabase:(id)a3 triggerRecord:(id)a4 triggerIdentifier:(id)a5 workflowReference:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"WFEditAutomationCoordinator.m", 44, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  id v25 = [MEMORY[0x263F08690] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"WFEditAutomationCoordinator.m", 45, @"Invalid parameter not satisfying: %@", @"triggerRecord" object file lineNumber description];

LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)WFEditAutomationCoordinator;
  v16 = [(WFEditAutomationCoordinator *)&v26 init];
  uint64_t v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_database, a3);
    uint64_t v18 = [objc_alloc(MEMORY[0x263F86F48]) initWithDatabase:v12];
    triggerManager = v17->_triggerManager;
    v17->_triggerManager = (WFTriggerManager *)v18;

    objc_storeStrong((id *)&v17->_triggerRecord, a4);
    uint64_t v20 = [v14 copy];
    triggerIdentifier = v17->_triggerIdentifier;
    v17->_triggerIdentifier = (NSString *)v20;

    objc_storeStrong((id *)&v17->_workflowReference, a6);
    uint64_t v22 = v17;
  }

  return v17;
}

@end