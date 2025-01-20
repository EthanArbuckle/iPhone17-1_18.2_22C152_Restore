@interface WFAutomationListViewController
- (BOOL)showEditViewForItem:(id)a3;
- (BOOL)showHomeAutomationEditorForTriggerItem:(id)a3;
- (BOOL)showPersonalAutomationEditorForConfiguredTrigger:(id)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (NSArray)sortedPersonalAutomations;
- (NSArray)tableSections;
- (WFAutomationListViewController)initWithDatabase:(id)a3 workflowProvider:(id)a4;
- (WFDatabase)database;
- (WFEditAutomationCoordinator)editAutomationCoordinator;
- (WFHomeManager)homeManager;
- (WFTriggerManager)triggerManager;
- (WFTriggerWorkflowProvider)workflowProvider;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)updateHandler;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)automationListCell:(id)a3 didUpdateNotificationsEnabled:(BOOL)a4;
- (void)buildTableSectionsWithConfiguredTriggers:(id)a3 homeTriggers:(id)a4;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)editAutomationCoordinatorDidCancel:(id)a3;
- (void)editAutomationCoordinatorDidFinish:(id)a3;
- (void)flashAutomationForTriggerID:(id)a3;
- (void)loadView;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setEditAutomationCoordinator:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setSortedPersonalAutomations:(id)a3;
- (void)setTableSections:(id)a3;
- (void)setTriggerManager:(id)a3;
- (void)setUpdateHandler:(id)a3;
- (void)setWorkflowProvider:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4;
- (void)updateTableViewLayoutMargins;
- (void)updateUIWithConfiguredTriggers:(id)a3 homeTriggers:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFAutomationListViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowProvider, 0);
  objc_storeStrong((id *)&self->_editAutomationCoordinator, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_sortedPersonalAutomations, 0);
  objc_storeStrong((id *)&self->_tableSections, 0);
  objc_storeStrong((id *)&self->_triggerManager, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong(&self->_updateHandler, 0);
}

- (void)setWorkflowProvider:(id)a3
{
}

- (WFTriggerWorkflowProvider)workflowProvider
{
  return self->_workflowProvider;
}

- (void)setEditAutomationCoordinator:(id)a3
{
}

- (WFEditAutomationCoordinator)editAutomationCoordinator
{
  return self->_editAutomationCoordinator;
}

- (void)setHomeManager:(id)a3
{
}

- (WFHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setSortedPersonalAutomations:(id)a3
{
}

- (NSArray)sortedPersonalAutomations
{
  return self->_sortedPersonalAutomations;
}

- (void)setTableSections:(id)a3
{
}

- (NSArray)tableSections
{
  return self->_tableSections;
}

- (void)setTriggerManager:(id)a3
{
}

- (WFTriggerManager)triggerManager
{
  return self->_triggerManager;
}

- (WFDatabase)database
{
  return self->_database;
}

- (void)setUpdateHandler:(id)a3
{
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__WFAutomationListViewController_triggerEditor_didFinishWithTriggerBuilder___block_invoke;
  block[3] = &unk_2649CBF20;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __76__WFAutomationListViewController_triggerEditor_didFinishWithTriggerBuilder___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  id v4 = [*(id *)(a1 + 32) tableView];
  v2 = [*(id *)(a1 + 32) tableView];
  v3 = [v2 indexPathForSelectedRow];
  [v4 deselectRowAtIndexPath:v3 animated:1];
}

- (BOOL)showHomeAutomationEditorForTriggerItem:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"WFAutomationListViewController.m", 400, @"Invalid parameter not satisfying: %@", @"triggerItem" object file lineNumber description];
  }
  v6 = [v5 trigger];
  uint64_t v7 = [v5 home];
  v8 = (void *)v7;
  if (!v5 || !v6 || !v7)
  {
    v11 = getWFTriggersLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[WFAutomationListViewController showHomeAutomationEditorForTriggerItem:]";
      __int16 v26 = 2114;
      id v27 = v5;
      _os_log_impl(&dword_22D994000, v11, OS_LOG_TYPE_ERROR, "%s Missing home or trigger from triggerItem: %{public}@", buf, 0x16u);
    }
    goto LABEL_15;
  }
  Class HFTriggerBuilderClass = getHFTriggerBuilderClass();
  getHUTriggerBuilderContextClass();
  v10 = objc_opt_new();
  v11 = [(objc_class *)HFTriggerBuilderClass triggerBuilderForTrigger:v6 inHome:v8 context:v10];

  if (!v11)
  {
    v21 = getWFTriggersLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[WFAutomationListViewController showHomeAutomationEditorForTriggerItem:]";
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl(&dword_22D994000, v21, OS_LOG_TYPE_ERROR, "%s Could not create HFTriggerBuilder for trigger: %@", buf, 0x16u);
    }

    v11 = 0;
LABEL_15:
    BOOL v20 = 0;
    goto LABEL_16;
  }
  id v12 = objc_alloc(getHUTriggerSummaryViewControllerClass());
  v13 = (void *)[objc_alloc(getHUTriggerActionFlowClass()) initWithFlowState:3];
  v14 = (void *)[v12 initWithTriggerBuilder:v11 flow:v13 delegate:self];

  v15 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v14];
  v16 = objc_msgSend(MEMORY[0x263F825C8], "wf_homeTintColor");
  v17 = [v15 navigationBar];
  [v17 setTintColor:v16];

  [v15 setModalPresentationStyle:2];
  v18 = [v15 presentationController];
  v19 = v18;
  if (v18) {
    [v18 setDelegate:self];
  }
  BOOL v20 = 1;
  [(WFAutomationListViewController *)self presentViewController:v15 animated:1 completion:0];

LABEL_16:
  return v20;
}

- (void)editAutomationCoordinatorDidCancel:(id)a3
{
  id v4 = [a3 navigationController];
  [v4 dismissViewControllerAnimated:1 completion:0];

  id v7 = [(WFAutomationListViewController *)self tableView];
  id v5 = [(WFAutomationListViewController *)self tableView];
  v6 = [v5 indexPathForSelectedRow];
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (void)editAutomationCoordinatorDidFinish:(id)a3
{
  id v4 = [a3 navigationController];
  [v4 dismissViewControllerAnimated:1 completion:0];

  id v5 = [(WFAutomationListViewController *)self tableView];
  v6 = [(WFAutomationListViewController *)self tableView];
  id v7 = [v6 indexPathForSelectedRow];
  [v5 deselectRowAtIndexPath:v7 animated:1];

  id v8 = [(WFAutomationListViewController *)self tableView];
  [v8 reloadData];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v3 = [(WFAutomationListViewController *)self tableView];
  [v3 selectRowAtIndexPath:0 animated:0 scrollPosition:0];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5 = [(WFAutomationListViewController *)self tableSections];
  v6 = [v5 objectAtIndexedSubscript:a4];

  id v7 = [v6 objectForKeyedSubscript:@"title"];
  if (v7)
  {
    id v8 = objc_opt_new();
    objc_msgSend(v8, "setDirectionalLayoutMargins:", 4.0, 0.0, 10.0, 0.0);
    v9 = objc_opt_new();
    v10 = (void *)MEMORY[0x263F81708];
    v11 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83618]];
    id v12 = [v11 fontDescriptorWithSymbolicTraits:2];
    v13 = [v10 fontWithDescriptor:v12 size:0.0];
    [v9 setFont:v13];

    [v9 setText:v7];
    [v8 addSubview:v9];
    v14 = [v8 layoutMarginsGuide];
    id v15 = (id)objc_msgSend(v9, "wf_addConstraintsToFillLayoutGuide:", v14);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a4;
  id v5 = [(WFAutomationListViewController *)self tableSections];
  v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v10, "section"));

  id v7 = [v6 objectForKeyedSubscript:@"items"];
  id v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v10, "row"));
  if (![(WFAutomationListViewController *)self showEditViewForItem:v8])
  {
    v9 = [(WFAutomationListViewController *)self tableView];
    [v9 deselectRowAtIndexPath:v10 animated:1];
  }
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (a4 == 1)
  {
    id v6 = a5;
    id v7 = [(WFAutomationListViewController *)self tableSections];
    id v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));

    v9 = [v8 objectForKeyedSubscript:@"items"];
    uint64_t v10 = [v6 row];

    v11 = [v9 objectAtIndex:v10];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v11;
      uint64_t v13 = [v12 identifier];
      if (!v13)
      {
        v17 = getWFTriggersLogObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v24 = "-[WFAutomationListViewController tableView:commitEditingStyle:forRowAtIndexPath:]";
          __int16 v25 = 2112;
          id v26 = v12;
          _os_log_impl(&dword_22D994000, v17, OS_LOG_TYPE_ERROR, "%s failed to get triggerID from WFConfiguredTrigger: %@", buf, 0x16u);
        }
        goto LABEL_8;
      }
      v14 = (void *)v13;
      id v15 = [(WFAutomationListViewController *)self triggerManager];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __81__WFAutomationListViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
      v21[3] = &unk_2649CBCE0;
      v16 = &v22;
      v22 = v14;
      v17 = v14;
      [v15 deleteTriggerWithIdentifier:v17 notifyDaemon:1 completion:v21];
    }
    else
    {
      getHFTriggerItemClass();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_9:

        return;
      }
      id v18 = v11;
      id v12 = [v8 objectForKeyedSubscript:@"home"];
      id v15 = [v18 trigger];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __81__WFAutomationListViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_216;
      v19[3] = &unk_2649CAB10;
      v16 = (id *)v20;
      v20[0] = v18;
      v20[1] = self;
      v17 = v18;
      [v12 removeTrigger:v15 completionHandler:v19];
    }

LABEL_8:
    goto LABEL_9;
  }
}

void __81__WFAutomationListViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = getWFTriggersLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 136315650;
      v9 = "-[WFAutomationListViewController tableView:commitEditingStyle:forRowAtIndexPath:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_impl(&dword_22D994000, v6, OS_LOG_TYPE_ERROR, "%s Failed to delete triggerID (%@) error: %{public}@", (uint8_t *)&v8, 0x20u);
    }
  }
}

void __81__WFAutomationListViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_216(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = getWFTriggersLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [*(id *)(a1 + 32) trigger];
      *(_DWORD *)buf = 136315650;
      int v8 = "-[WFAutomationListViewController tableView:commitEditingStyle:forRowAtIndexPath:]_block_invoke";
      __int16 v9 = 2112;
      __int16 v10 = v5;
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_impl(&dword_22D994000, v4, OS_LOG_TYPE_ERROR, "%s Failed to delete home trigger (%@) error: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__WFAutomationListViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_217;
    block[3] = &unk_2649CBF20;
    block[4] = *(void *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __81__WFAutomationListViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_217(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) updateHandler];
  v1[2]();
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(WFAutomationListViewController *)self tableSections];
  uint64_t v7 = [v5 section];

  int v8 = [v6 objectAtIndexedSubscript:v7];

  __int16 v9 = [v8 objectForKeyedSubscript:@"isEditable"];
  LOBYTE(v7) = [v9 BOOLValue];

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(WFAutomationListViewController *)self tableSections];
  uint64_t v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));

  int v8 = [v7 objectForKeyedSubscript:@"cellIdentifier"];
  __int16 v9 = [v7 objectForKeyedSubscript:@"items"];
  __int16 v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));

  __int16 v11 = [(WFAutomationListViewController *)self tableView];
  id v12 = [v11 dequeueReusableCellWithIdentifier:v8 forIndexPath:v5];

  [(WFAutomationListViewController *)self configureCell:v12 forItem:v10];
  return v12;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(WFAutomationListViewController *)self tableSections];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"items"];
  int64_t v8 = [v7 count];

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(WFAutomationListViewController *)self tableSections];
  int64_t v4 = [v3 count];

  return v4;
}

- (void)automationListCell:(id)a3 didUpdateNotificationsEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(WFAutomationListViewController *)self database];
  int64_t v8 = [v6 configuredTrigger];
  id v14 = 0;
  __int16 v9 = [v7 recordWithDescriptor:v8 error:&v14];
  id v10 = v14;

  if (v9)
  {
    [v9 setShouldNotify:v4];
    __int16 v11 = [(WFAutomationListViewController *)self triggerManager];
    id v12 = [v6 configuredTrigger];
    uint64_t v13 = [v12 identifier];
    [v11 updateConfiguredTrigger:v9 triggerID:v13 notifyDaemon:0 completion:&__block_literal_global_791];

LABEL_5:
    goto LABEL_6;
  }
  __int16 v11 = getWFTriggersLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    id v12 = [v6 configuredTrigger];
    *(_DWORD *)buf = 136315650;
    v16 = "-[WFAutomationListViewController automationListCell:didUpdateNotificationsEnabled:]";
    __int16 v17 = 2112;
    id v18 = v12;
    __int16 v19 = 2114;
    id v20 = v10;
    _os_log_impl(&dword_22D994000, v11, OS_LOG_TYPE_FAULT, "%s Failed to get trigger record from descriptor (%@): %{public}@", buf, 0x20u);
    goto LABEL_5;
  }
LABEL_6:
}

void __83__WFAutomationListViewController_automationListCell_didUpdateNotificationsEnabled___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = getWFTriggersLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      uint64_t v7 = "-[WFAutomationListViewController automationListCell:didUpdateNotificationsEnabled:]_block_invoke";
      __int16 v8 = 2114;
      id v9 = v4;
      _os_log_impl(&dword_22D994000, v5, OS_LOG_TYPE_ERROR, "%s Failed to update configured trigger with error: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (BOOL)showPersonalAutomationEditorForConfiguredTrigger:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"WFAutomationListViewController.m", 235, @"Invalid parameter not satisfying: %@", @"configuredTrigger" object file lineNumber description];
  }
  int v6 = [v5 workflowID];

  if (v6)
  {
    uint64_t v7 = [(WFAutomationListViewController *)self database];
    __int16 v8 = [v5 workflowID];
    int v6 = [v7 referenceForWorkflowID:v8];
  }
  id v9 = [(WFAutomationListViewController *)self database];
  id v26 = 0;
  uint64_t v10 = [v9 recordWithDescriptor:v5 error:&v26];
  id v11 = v26;

  if (v10)
  {
    id v12 = [WFEditAutomationCoordinator alloc];
    uint64_t v13 = [(WFAutomationListViewController *)self database];
    id v14 = [v5 identifier];
    id v15 = [(WFEditAutomationCoordinator *)v12 initWithDatabase:v13 triggerRecord:v10 triggerIdentifier:v14 workflowReference:v6];
    [(WFAutomationListViewController *)self setEditAutomationCoordinator:v15];

    v16 = [(WFAutomationListViewController *)self editAutomationCoordinator];
    [v16 setDelegate:self];

    __int16 v17 = [(WFAutomationListViewController *)self editAutomationCoordinator];
    id v18 = [v17 start];

    BOOL v19 = v18 != 0;
    if (v18)
    {
      [v18 setModalPresentationStyle:2];
      id v20 = [v18 presentationController];
      uint64_t v21 = v20;
      if (v20) {
        [v20 setDelegate:self];
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __83__WFAutomationListViewController_showPersonalAutomationEditorForConfiguredTrigger___block_invoke;
      block[3] = &unk_2649CC018;
      block[4] = self;
      __int16 v25 = v18;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    else
    {
      uint64_t v21 = getWFTriggersLogObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v28 = "-[WFAutomationListViewController showPersonalAutomationEditorForConfiguredTrigger:]";
        _os_log_impl(&dword_22D994000, v21, OS_LOG_TYPE_ERROR, "%s Failed to start the edit coordinator", buf, 0xCu);
      }
    }
  }
  else
  {
    id v18 = getWFTriggersLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v28 = "-[WFAutomationListViewController showPersonalAutomationEditorForConfiguredTrigger:]";
      __int16 v29 = 2112;
      id v30 = v5;
      __int16 v31 = 2114;
      id v32 = v11;
      _os_log_impl(&dword_22D994000, v18, OS_LOG_TYPE_ERROR, "%s Failed to get trigger record from descriptor (%@): %{public}@", buf, 0x20u);
    }
    BOOL v19 = 0;
  }

  return v19;
}

uint64_t __83__WFAutomationListViewController_showPersonalAutomationEditorForConfiguredTrigger___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (BOOL)showEditViewForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(WFAutomationListViewController *)self showPersonalAutomationEditorForConfiguredTrigger:v4];
  }
  else
  {
    getHFTriggerItemClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v6 = 0;
      goto LABEL_7;
    }
    BOOL v5 = [(WFAutomationListViewController *)self showHomeAutomationEditorForTriggerItem:v4];
  }
  BOOL v6 = v5;
LABEL_7:

  return v6;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v8 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v7;
      uint64_t v10 = [(WFAutomationListViewController *)self workflowProvider];
      id v11 = [v9 workflowID];
      id v12 = [v10 workflowForIdentifier:v11];

      [v8 setConfiguredTrigger:v9 workflow:v12 delegate:self];
    }
    else
    {
      getHFTriggerItemClass();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v8 setHomeTrigger:v7];
      }
      else
      {
        uint64_t v13 = getWFTriggersLogObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          int v14 = 136315394;
          id v15 = "-[WFAutomationListViewController configureCell:forItem:]";
          __int16 v16 = 2114;
          id v17 = v7;
          _os_log_impl(&dword_22D994000, v13, OS_LOG_TYPE_ERROR, "%s Unexpected item (%{public}@)", (uint8_t *)&v14, 0x16u);
        }
      }
    }
  }
  else
  {
    __int16 v8 = getWFTriggersLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315650;
      id v15 = "-[WFAutomationListViewController configureCell:forItem:]";
      __int16 v16 = 2114;
      id v17 = v6;
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_impl(&dword_22D994000, v8, OS_LOG_TYPE_ERROR, "%s Unexpected cell (%{public}@) and/or item (%{public}@)", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (void)buildTableSectionsWithConfiguredTriggers:(id)a3 homeTriggers:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = objc_opt_new();
  id v9 = @"items";
  if ([v6 count])
  {
    id v10 = v6;
    id v11 = +[WFAutomationSelectTypeViewController allKnownTriggersSortedAsInUI];
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v46 = __WFAutomationsSortForUI_block_invoke;
    v47 = &unk_2649CAB38;
    id v48 = v11;
    id v12 = v11;
    uint64_t v13 = [v10 sortedArrayUsingComparator:&buf];

    [(WFAutomationListViewController *)self setSortedPersonalAutomations:v13];
    v43[0] = @"title";
    int v14 = WFLocalizedString(@"Personal");
    v44[0] = v14;
    v43[1] = @"cellIdentifier";
    id v15 = (objc_class *)objc_opt_class();
    __int16 v16 = NSStringFromClass(v15);
    v44[1] = v16;
    v43[2] = @"items";
    id v17 = [(WFAutomationListViewController *)self sortedPersonalAutomations];
    v43[3] = @"isEditable";
    v44[2] = v17;
    v44[3] = MEMORY[0x263EFFA88];
    __int16 v18 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:4];
    [v8 addObject:v18];
  }
  if ([v7 count])
  {
    v34 = self;
    id v35 = v6;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v33 = v7;
    id v19 = v7;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          v24 = v9;
          if (*(void *)v37 != v22) {
            objc_enumerationMutation(v19);
          }
          __int16 v25 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          id v26 = [v25 firstObject];

          if (v26)
          {
            uint64_t v27 = [v25 firstObject];
            uint64_t v28 = [v27 home];

            v40[0] = @"title";
            __int16 v29 = [v28 name];
            v41[0] = v29;
            v40[1] = @"cellIdentifier";
            id v30 = (objc_class *)objc_opt_class();
            __int16 v31 = NSStringFromClass(v30);
            v41[1] = v31;
            v41[2] = v28;
            v40[2] = @"home";
            v40[3] = v24;
            v40[4] = @"isEditable";
            v41[3] = v25;
            v41[4] = MEMORY[0x263EFFA88];
            id v32 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:5];
            [v8 addObject:v32];

            id v9 = v24;
          }
          else
          {
            uint64_t v28 = getWFTriggersLogObject();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            {
              LODWORD(buf) = 136315138;
              *(void *)((char *)&buf + 4) = "-[WFAutomationListViewController buildTableSectionsWithConfiguredTriggers:homeTriggers:]";
              _os_log_impl(&dword_22D994000, v28, OS_LOG_TYPE_FAULT, "%s Was given an empty array of home triggers", (uint8_t *)&buf, 0xCu);
            }
            id v9 = v24;
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v21);
    }

    self = v34;
    id v6 = v35;
    id v7 = v33;
  }
  [(WFAutomationListViewController *)self setTableSections:v8];
}

- (void)flashAutomationForTriggerID:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"WFAutomationListViewController.m", 133, @"Invalid parameter not satisfying: %@", @"triggerID" object file lineNumber description];
  }
  id v6 = [(WFAutomationListViewController *)self database];
  id v7 = [v6 configuredTriggerForTriggerID:v5];

  if (v7)
  {
    __int16 v8 = [(WFAutomationListViewController *)self sortedPersonalAutomations];
    uint64_t v9 = [v8 count];

    if (!v9) {
      goto LABEL_12;
    }
    unint64_t v10 = 0;
    while (1)
    {
      id v11 = [(WFAutomationListViewController *)self sortedPersonalAutomations];
      id v12 = [v11 objectAtIndexedSubscript:v10];

      uint64_t v13 = [v12 identifier];
      char v14 = [v13 isEqualToString:v5];

      if (v14) {
        break;
      }
      ++v10;
      id v15 = [(WFAutomationListViewController *)self sortedPersonalAutomations];
      unint64_t v16 = [v15 count];

      if (v10 >= v16) {
        goto LABEL_12;
      }
    }
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v19 = [MEMORY[0x263F088C8] indexPathForRow:v10 inSection:0];
      uint64_t v20 = [(WFAutomationListViewController *)self tableView];
      [v20 selectRowAtIndexPath:v19 animated:0 scrollPosition:2];

      dispatch_time_t v21 = dispatch_time(0, 600000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __62__WFAutomationListViewController_flashAutomationForTriggerID___block_invoke;
      block[3] = &unk_2649CC018;
      block[4] = self;
      id v24 = v19;
      id v17 = v19;
      dispatch_after(v21, MEMORY[0x263EF83A0], block);
    }
    else
    {
LABEL_12:
      id v17 = getWFTriggersLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __int16 v18 = [v7 identifier];
        *(_DWORD *)long long buf = 136315394;
        id v26 = "-[WFAutomationListViewController flashAutomationForTriggerID:]";
        __int16 v27 = 2112;
        id v28 = v18;
        _os_log_impl(&dword_22D994000, v17, OS_LOG_TYPE_ERROR, "%s Couldn't find indexPath for configuredTrigger: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v17 = getWFTriggersLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v26 = "-[WFAutomationListViewController flashAutomationForTriggerID:]";
      __int16 v27 = 2112;
      id v28 = v5;
      _os_log_impl(&dword_22D994000, v17, OS_LOG_TYPE_ERROR, "%s Couldn't find configuredTrigger for triggerID: %@", buf, 0x16u);
    }
  }
}

void __62__WFAutomationListViewController_flashAutomationForTriggerID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 deselectRowAtIndexPath:*(void *)(a1 + 40) animated:1];
}

- (void)updateUIWithConfiguredTriggers:(id)a3 homeTriggers:(id)a4
{
  [(WFAutomationListViewController *)self buildTableSectionsWithConfiguredTriggers:a3 homeTriggers:a4];
  id v5 = [(WFAutomationListViewController *)self tableView];
  [v5 reloadData];
}

- (void)updateTableViewLayoutMargins
{
  [(UIViewController *)self wf_contentLayoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(WFAutomationListViewController *)self tableView];
  objc_msgSend(v11, "setLayoutMargins:", v4, v6, v8, v10);
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFAutomationListViewController;
  [(WFAutomationListViewController *)&v6 viewWillAppear:a3];
  dispatch_time_t v4 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__WFAutomationListViewController_viewWillAppear___block_invoke;
  block[3] = &unk_2649CBF20;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

void __49__WFAutomationListViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  v1 = [v2 navigationBar];
  [v1 sizeToFit];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)WFAutomationListViewController;
  [(WFAutomationListViewController *)&v5 viewDidLoad];
  double v3 = (WFTriggerManager *)[objc_alloc(MEMORY[0x263F86F48]) initWithDatabase:self->_database];
  triggerManager = self->_triggerManager;
  self->_triggerManager = v3;
}

- (void)loadView
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)WFAutomationListViewController;
  [(WFAutomationListViewController *)&v22 loadView];
  double v3 = [MEMORY[0x263F825C8] systemGroupedBackgroundColor];
  dispatch_time_t v4 = [(WFAutomationListViewController *)self tableView];
  [v4 setBackgroundColor:v3];

  double v5 = *MEMORY[0x263F839B8];
  objc_super v6 = [(WFAutomationListViewController *)self tableView];
  [v6 setRowHeight:v5];

  double v7 = [(WFAutomationListViewController *)self tableView];
  objc_msgSend(v7, "setContentInset:", 8.0, 0.0, 0.0, 0.0);

  double v8 = [(WFAutomationListViewController *)self tableView];
  [v8 setEstimatedRowHeight:100.0];

  double v9 = [(WFAutomationListViewController *)self tableView];
  objc_msgSend(v9, "setSeparatorInset:", 0.0, 124.0, 0.0, 0.0);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v23 = objc_opt_class();
  double v10 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v23, 1, 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(objc_class **)(*((void *)&v18 + 1) + 8 * v14);
        unint64_t v16 = [(WFAutomationListViewController *)self tableView];
        id v17 = NSStringFromClass(v15);
        [v16 registerClass:v15 forCellReuseIdentifier:v17];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v12);
  }

  [(WFAutomationListViewController *)self updateTableViewLayoutMargins];
}

- (WFAutomationListViewController)initWithDatabase:(id)a3 workflowProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WFAutomationListViewController;
  double v9 = [(WFAutomationListViewController *)&v16 initWithStyle:2];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    sortedPersonalAutomations = v10->_sortedPersonalAutomations;
    uint64_t v12 = (NSArray *)MEMORY[0x263EFFA68];
    v10->_sortedPersonalAutomations = (NSArray *)MEMORY[0x263EFFA68];

    tableSections = v10->_tableSections;
    v10->_tableSections = v12;

    objc_storeStrong((id *)&v10->_workflowProvider, a4);
    uint64_t v14 = v10;
  }

  return v10;
}

@end