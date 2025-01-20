@interface WFAutomationSummaryViewController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (NSArray)actionIcons;
- (NSString)triggerIdentifier;
- (UITableView)tableView;
- (WFAutomationSummaryViewController)initWithTrigger:(id)a3 triggerIdentifier:(id)a4 workflow:(id)a5 mode:(unint64_t)a6;
- (WFAutomationSummaryViewControllerDelegate)delegate;
- (WFConfiguredTriggerRecord)triggerRecord;
- (WFTrigger)trigger;
- (WFWorkflow)workflow;
- (id)infoForSection:(int64_t)a3;
- (id)menuForTrigger;
- (id)sections;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)mode;
- (void)didTapDone:(id)a3;
- (void)handleRunSelection:(int64_t)a3;
- (void)loadActionDescriptionIcons;
- (void)loadView;
- (void)notifySwitchChanged:(id)a3;
- (void)setActionIcons:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setWorkflow:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)testAutomation;
- (void)updateUI;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFAutomationSummaryViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_actionIcons, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_triggerIdentifier, 0);
  objc_storeStrong((id *)&self->_triggerRecord, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setActionIcons:(id)a3
{
}

- (NSArray)actionIcons
{
  return self->_actionIcons;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setWorkflow:(id)a3
{
}

- (WFWorkflow)workflow
{
  return self->_workflow;
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

- (void)setDelegate:(id)a3
{
}

- (WFAutomationSummaryViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFAutomationSummaryViewControllerDelegate *)WeakRetained;
}

- (void)didTapDone:(id)a3
{
  id v5 = [(WFAutomationSummaryViewController *)self delegate];
  v4 = [(WFAutomationSummaryViewController *)self triggerRecord];
  [v5 automationSummaryViewController:self didFinishWithTrigger:v4];
}

- (void)notifySwitchChanged:(id)a3
{
  uint64_t v4 = [a3 isOn];
  id v5 = [(WFAutomationSummaryViewController *)self triggerRecord];
  [v5 setShouldNotify:v4];
}

- (void)handleRunSelection:(int64_t)a3
{
  if (a3 == 2)
  {
    v7 = [(WFAutomationSummaryViewController *)self triggerRecord];
    v8 = v7;
    uint64_t v9 = 0;
  }
  else
  {
    if (a3 == 1)
    {
      uint64_t v4 = [(WFAutomationSummaryViewController *)self triggerRecord];
      id v5 = v4;
      uint64_t v6 = 1;
    }
    else
    {
      if (a3) {
        return;
      }
      uint64_t v4 = [(WFAutomationSummaryViewController *)self triggerRecord];
      id v5 = v4;
      uint64_t v6 = 0;
    }
    [v4 setShouldPrompt:v6];

    v7 = [(WFAutomationSummaryViewController *)self triggerRecord];
    v8 = v7;
    uint64_t v9 = 1;
  }
  [v7 setEnabled:v9];

  id v10 = [(WFAutomationSummaryViewController *)self tableView];
  [v10 reloadData];
}

- (void)testAutomation
{
  v3 = [MEMORY[0x263F85128] standardClient];
  uint64_t v4 = [(WFAutomationSummaryViewController *)self triggerIdentifier];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__WFAutomationSummaryViewController_testAutomation__block_invoke;
  v5[3] = &unk_2649CBCE0;
  v5[4] = self;
  [v3 fireTriggerWithIdentifier:v4 force:1 completion:v5];
}

void __51__WFAutomationSummaryViewController_testAutomation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x263F336E8], "alertWithError:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = WFUserInterfaceFromViewController();
    [v3 presentAlert:v4];
  }
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a4 != 1) {
    return;
  }
  uint64_t v6 = [(WFAutomationSummaryViewController *)self workflow];
  v7 = [v6 workflowID];

  if (!v7) {
    return;
  }
  id v16 = [MEMORY[0x263F86A48] defaultDatabase];
  v8 = [(WFAutomationSummaryViewController *)self workflow];
  uint64_t v9 = [v8 workflowID];
  id v10 = [v16 referenceForWorkflowID:v9];

  if ([v10 hiddenFromLibraryAndSync])
  {
    if (([v16 deleteReference:v10 error:0] & 1) == 0)
    {
      v11 = getWFTriggersLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[WFAutomationSummaryViewController tableView:commitEditingStyle:forRowAtIndexPath:]";
        _os_log_impl(&dword_22D994000, v11, OS_LOG_TYPE_ERROR, "%s Failed to delete workflow reference from trigger summary view", buf, 0xCu);
      }

      return;
    }
  }
  else
  {
    v12 = [(WFAutomationSummaryViewController *)self triggerIdentifier];
    v13 = [v16 configuredTriggerForTriggerID:v12];

    id v14 = (id)[v16 associateWorkflowToTrigger:v13 workflow:0 error:0];
  }
  [(WFAutomationSummaryViewController *)self setWorkflow:0];
  v15 = [(WFAutomationSummaryViewController *)self tableView];
  [v15 reloadData];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v4 = -[WFAutomationSummaryViewController infoForSection:](self, "infoForSection:", objc_msgSend(a4, "section", a3));
  id v5 = [v4 objectForKeyedSubscript:@"identifier"];
  char v6 = [v5 isEqual:@"workflowSummary"];

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  uint64_t v7 = [v6 section];

  id v16 = [(WFAutomationSummaryViewController *)self infoForSection:v7];
  v8 = [v16 objectForKeyedSubscript:@"identifier"];
  LODWORD(v6) = [v8 isEqual:@"triggerSummary"];

  if (v6)
  {
    uint64_t v9 = [(WFAutomationSummaryViewController *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_13:

      goto LABEL_14;
    }
    id v10 = [(WFAutomationSummaryViewController *)self triggerRecord];
    [v9 automationSummaryViewController:self editTrigger:v10];
LABEL_8:

    goto LABEL_13;
  }
  v11 = [v16 objectForKeyedSubscript:@"identifier"];
  int v12 = [v11 isEqual:@"workflowSummary"];

  if (v12)
  {
    uint64_t v9 = [(WFAutomationSummaryViewController *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([(WFAutomationSummaryViewController *)self workflow],
          v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          !v13))
    {
      if (objc_opt_respondsToSelector()) {
        [v9 automationSummaryViewControllerChooseShortcut:self];
      }
      goto LABEL_13;
    }
    id v10 = [(WFAutomationSummaryViewController *)self workflow];
    [v9 automationSummaryViewController:self editWorkflow:v10];
    goto LABEL_8;
  }
  id v14 = [v16 objectForKeyedSubscript:@"identifier"];
  int v15 = [v14 isEqual:@"testAutomation"];

  if (v15) {
    [(WFAutomationSummaryViewController *)self testAutomation];
  }
LABEL_14:
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4 = [(WFAutomationSummaryViewController *)self infoForSection:a4];
  id v5 = [v4 objectForKeyedSubscript:@"sectionTitle"];
  id v6 = WFAutomationTableSectionHeaderViewWithTitle(v5);

  return v6;
}

- (id)menuForTrigger
{
  v25[2] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F823D0];
  id v4 = WFLocalizedString(@"Run After Confirmation");
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __51__WFAutomationSummaryViewController_menuForTrigger__block_invoke;
  v24[3] = &unk_2649CB998;
  v24[4] = self;
  id v5 = [v3 actionWithTitle:v4 image:0 identifier:@"confirmation" handler:v24];

  id v6 = (void *)MEMORY[0x263F823D0];
  uint64_t v7 = WFLocalizedString(@"Don’t Run");
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __51__WFAutomationSummaryViewController_menuForTrigger__block_invoke_2;
  v23[3] = &unk_2649CB998;
  v23[4] = self;
  v8 = [v6 actionWithTitle:v7 image:0 identifier:0 handler:v23];

  uint64_t v9 = (void *)MEMORY[0x263EFF980];
  v25[0] = v5;
  v25[1] = v8;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  v11 = [v9 arrayWithArray:v10];

  int v12 = [(WFAutomationSummaryViewController *)self trigger];
  int v13 = [(id)objc_opt_class() isAllowedToRunAutomatically];

  id v14 = 0;
  if (v13)
  {
    int v15 = (void *)MEMORY[0x263F823D0];
    id v16 = WFLocalizedString(@"Run Immediately");
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __51__WFAutomationSummaryViewController_menuForTrigger__block_invoke_3;
    v22[3] = &unk_2649CB998;
    v22[4] = self;
    id v14 = [v15 actionWithTitle:v16 image:0 identifier:0 handler:v22];

    [v11 insertObject:v14 atIndex:0];
  }
  v17 = [(WFAutomationSummaryViewController *)self triggerRecord];
  uint64_t v18 = WFRunSelectionForTrigger(v17);

  uint64_t v19 = v14;
  if (!v18) {
    goto LABEL_8;
  }
  if (v18 == 2)
  {
    uint64_t v19 = v8;
    goto LABEL_8;
  }
  uint64_t v19 = v5;
  if (v18 == 1) {
LABEL_8:
  }
    [v19 setState:1];
  v20 = [MEMORY[0x263F82940] menuWithChildren:v11];

  return v20;
}

uint64_t __51__WFAutomationSummaryViewController_menuForTrigger__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleRunSelection:1];
}

uint64_t __51__WFAutomationSummaryViewController_menuForTrigger__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleRunSelection:2];
}

uint64_t __51__WFAutomationSummaryViewController_menuForTrigger__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleRunSelection:0];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = -[WFAutomationSummaryViewController infoForSection:](self, "infoForSection:", [v6 section]);
  uint64_t v9 = [v8 objectForKeyedSubscript:@"sectionRows"];
  id v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

  v11 = [v10 objectForKeyedSubscript:@"cellIdentifier"];
  id v12 = [v7 dequeueReusableCellWithIdentifier:v11 forIndexPath:v6];

  int v13 = [v8 objectForKeyedSubscript:@"identifier"];
  int v14 = [v13 isEqual:@"runImmediately"];

  if (v14)
  {
    [v12 setSelectionStyle:0];
    if ([v6 row])
    {
      int v15 = [v10 objectForKeyedSubscript:@"cellTitle"];
      id v16 = [v12 textLabel];
      [v16 setText:v15];

      [v12 setSelectionStyle:0];
      id v12 = v12;
      if (v12)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v17 = v12;
        }
        else {
          v17 = 0;
        }
      }
      else
      {
        v17 = 0;
      }
      id v48 = v17;

      v49 = [v48 switchControl];

      v50 = [(WFAutomationSummaryViewController *)self triggerRecord];
      objc_msgSend(v49, "setOn:", objc_msgSend(v50, "shouldNotify"));

      [v49 addTarget:self action:sel_notifySwitchChanged_ forControlEvents:4096];
    }
    else
    {
      id v12 = v12;
      v37 = v11;
      if (v12)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v38 = v12;
        }
        else {
          v38 = 0;
        }
      }
      else
      {
        v38 = 0;
      }
      id v51 = v38;

      v52 = [v10 objectForKeyedSubscript:@"cellTitle"];
      v53 = [v51 textLabel];
      [v53 setText:v52];

      v54 = [(WFAutomationSummaryViewController *)self menuForTrigger];
      [v12 setMenu:v54];

      v11 = v37;
    }
  }
  else
  {
    uint64_t v18 = [v8 objectForKeyedSubscript:@"identifier"];
    int v19 = [v18 isEqual:@"triggerSummary"];

    if (v19)
    {
      v20 = [(WFAutomationSummaryViewController *)self triggerRecord];
      v21 = [v20 triggerData];

      if ([v21 length]
        && ([MEMORY[0x263F86F40] triggerWithSerializedData:v21],
            (v22 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v23 = v22;
        v65 = [v22 displayGlyph];
        [v65 UIImage];
        v24 = v66 = v10;
        v25 = [v23 displayGlyphTintColor];
        [v25 UIColor];
        v26 = v68 = v11;
        v27 = [v23 localizedDescriptionWithConfigurationSummary];
        [v12 configureWithImage:v24 tintColor:v26 title:v27 numberOfLines:3 withTrigger:v23];

        v11 = v68;
        id v10 = v66;
      }
      else
      {
        v23 = getWFTriggersLogObject();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v72 = "-[WFAutomationSummaryViewController tableView:cellForRowAtIndexPath:]";
          _os_log_impl(&dword_22D994000, v23, OS_LOG_TYPE_ERROR, "%s Could not deserialize trigger data from record in Automation Summary", buf, 0xCu);
        }
      }

      unint64_t v39 = [(WFAutomationSummaryViewController *)self mode];
      BOOL v40 = v39 != 0;
      if (v39) {
        uint64_t v41 = 3;
      }
      else {
        uint64_t v41 = 0;
      }
      [v12 setSelectionStyle:v41];
      [v12 setAccessoryType:v40];
    }
    else
    {
      v28 = [v8 objectForKeyedSubscript:@"identifier"];
      int v29 = [v28 isEqual:@"workflowSummary"];

      if (v29)
      {
        v30 = [(WFAutomationSummaryViewController *)self workflow];

        if (v30)
        {
          v31 = [(WFAutomationSummaryViewController *)self workflow];
          int v32 = [v31 hiddenFromLibraryAndSync];

          v33 = [(WFAutomationSummaryViewController *)self workflow];
          v34 = v33;
          if (v32)
          {
            v35 = [v33 actionsDescription];
            v36 = [(WFAutomationSummaryViewController *)self actionIcons];
            [v12 configureWithTitle:v35 actionIcons:v36];
          }
          else
          {
            v35 = [v33 name];
            v67 = [(WFAutomationSummaryViewController *)self workflow];
            v60 = [v67 icon];
            [v60 icon];
            uint64_t v70 = v69 = v11;
            v61 = (void *)v70;
            [MEMORY[0x263EFF8C0] arrayWithObjects:&v70 count:1];
            v63 = v62 = v10;
            [v12 configureWithTitle:v35 actionIcons:v63];

            id v10 = v62;
            v11 = v69;
          }
          if ([(WFAutomationSummaryViewController *)self mode])
          {
            [v12 setSelectionStyle:3];
            [v12 setAccessoryType:1];
          }
          else
          {
            [v12 setSelectionStyle:0];
          }
        }
        else
        {
          v55 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:0];

          [v55 setSelectionStyle:0];
          v56 = [MEMORY[0x263F825C8] systemBlueColor];
          v57 = [v55 textLabel];
          [v57 setTextColor:v56];

          v58 = WFLocalizedString(@"Choose…");
          v59 = [v55 textLabel];
          [v59 setText:v58];

          id v12 = v55;
        }
      }
      else
      {
        v42 = [v8 objectForKeyedSubscript:@"identifier"];
        int v43 = [v42 isEqual:@"testAutomation"];

        if (v43)
        {
          v44 = [v10 objectForKeyedSubscript:@"cellTitle"];
          v45 = [v12 textLabel];
          [v45 setText:v44];

          v46 = [MEMORY[0x263F825C8] systemBlueColor];
          v47 = [v12 textLabel];
          [v47 setTextColor:v46];
        }
      }
    }
  }

  return v12;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(WFAutomationSummaryViewController *)self infoForSection:a4];
  id v5 = [v4 objectForKeyedSubscript:@"sectionRows"];
  int64_t v6 = [v5 count];

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(WFAutomationSummaryViewController *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)infoForSection:(int64_t)a3
{
  int64_t v4 = [(WFAutomationSummaryViewController *)self sections];
  id v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)WFAutomationSummaryViewController;
  [(WFAutomationSummaryViewController *)&v3 viewDidLoad];
  [(WFAutomationSummaryViewController *)self loadActionDescriptionIcons];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFAutomationSummaryViewController;
  [(WFAutomationSummaryViewController *)&v4 viewWillAppear:a3];
  [(WFAutomationSummaryViewController *)self loadActionDescriptionIcons];
}

- (void)loadActionDescriptionIcons
{
  objc_super v3 = [(WFAutomationSummaryViewController *)self workflow];
  objc_super v4 = [v3 actions];
  id v5 = [(WFAutomationSummaryViewController *)self workflow];
  int64_t v6 = [v5 actions];
  unint64_t v7 = [v6 count];

  if (v7 >= 8) {
    uint64_t v8 = 8;
  }
  else {
    uint64_t v8 = v7;
  }
  objc_msgSend(v4, "subarrayWithRange:", 0, v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = objc_msgSend(v11, "if_compactMap:", &__block_literal_global_13776);
  [(WFAutomationSummaryViewController *)self setActionIcons:v9];

  id v10 = [(WFAutomationSummaryViewController *)self tableView];
  [v10 reloadData];
}

uint64_t __63__WFAutomationSummaryViewController_loadActionDescriptionIcons__block_invoke(uint64_t a1, void *a2)
{
  return [a2 icon];
}

- (void)loadView
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F82C78]);
  objc_super v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  id v5 = [MEMORY[0x263F825C8] systemGroupedBackgroundColor];
  [(UITableView *)v4 setBackgroundColor:v5];

  [(UITableView *)v4 setDataSource:self];
  [(UITableView *)v4 setDelegate:self];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v21 = self;
  obuint64_t j = [(WFAutomationSummaryViewController *)self sections];
  uint64_t v24 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(obj);
        }
        unint64_t v7 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v8 = [v7 objectForKeyedSubscript:@"sectionRows"];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v26 != v11) {
                objc_enumerationMutation(v8);
              }
              int v13 = *(void **)(*((void *)&v25 + 1) + 8 * j);
              int v14 = [v13 objectForKeyedSubscript:@"cellClass"];
              int v15 = [v13 objectForKeyedSubscript:@"cellIdentifier"];
              [(UITableView *)v4 registerClass:v14 forCellReuseIdentifier:v15];
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v10);
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v24);
  }

  uint64_t v16 = objc_opt_class();
  v17 = (objc_class *)objc_opt_class();
  uint64_t v18 = NSStringFromClass(v17);
  [(UITableView *)v4 registerClass:v16 forCellReuseIdentifier:v18];

  tableView = v21->_tableView;
  v21->_tableView = v4;
  v20 = v4;

  [(WFAutomationSummaryViewController *)v21 setView:v20];
}

- (void)updateUI
{
  id v2 = [(WFAutomationSummaryViewController *)self tableView];
  [v2 reloadData];
}

- (id)sections
{
  v58[3] = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  if ([(WFAutomationSummaryViewController *)self mode] == 1)
  {
    objc_super v4 = (void *)MEMORY[0x263EFF980];
    v57[0] = @"cellTitle";
    id v5 = WFLocalizedString(@"Automation");
    v58[0] = v5;
    v57[1] = @"cellIdentifier";
    int64_t v6 = (objc_class *)objc_opt_class();
    unint64_t v7 = NSStringFromClass(v6);
    v58[1] = v7;
    v57[2] = @"cellClass";
    v58[2] = objc_opt_class();
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:3];
    uint64_t v9 = [v4 arrayWithObject:v8];

    uint64_t v10 = [(WFAutomationSummaryViewController *)self triggerRecord];
    uint64_t v11 = WFRunSelectionForTrigger(v10);

    if (!v11)
    {
      id v12 = [(WFAutomationSummaryViewController *)self trigger];
      char v13 = [(id)objc_opt_class() requiresNotification];

      if ((v13 & 1) == 0)
      {
        v55[0] = @"cellTitle";
        int v14 = WFLocalizedString(@"Notify When Run");
        v56[0] = v14;
        v55[1] = @"cellIdentifier";
        int v15 = (objc_class *)objc_opt_class();
        uint64_t v16 = NSStringFromClass(v15);
        v56[1] = v16;
        v55[2] = @"cellClass";
        v56[2] = objc_opt_class();
        v17 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:3];
        [v9 addObject:v17];
      }
    }
    v53[0] = @"identifier";
    v53[1] = @"sectionRows";
    v54[0] = @"runImmediately";
    v54[1] = v9;
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
    [v3 addObject:v18];
  }
  v52[0] = @"triggerSummary";
  v51[0] = @"identifier";
  v51[1] = @"sectionTitle";
  int v19 = WFLocalizedString(@"When");
  v52[1] = v19;
  v51[2] = @"sectionRows";
  v48[0] = @"cellIdentifier";
  v20 = (objc_class *)objc_opt_class();
  v21 = NSStringFromClass(v20);
  v48[1] = @"cellClass";
  v49[0] = v21;
  v49[1] = objc_opt_class();
  v22 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];
  v50 = v22;
  uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];
  v52[2] = v23;
  uint64_t v24 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:3];
  [v3 addObject:v24];

  v47[0] = @"workflowSummary";
  v46[0] = @"identifier";
  v46[1] = @"sectionTitle";
  long long v25 = WFLocalizedString(@"Do");
  v47[1] = v25;
  v46[2] = @"sectionRows";
  v43[0] = @"cellIdentifier";
  long long v26 = (objc_class *)objc_opt_class();
  long long v27 = NSStringFromClass(v26);
  v43[1] = @"cellClass";
  v44[0] = v27;
  v44[1] = objc_opt_class();
  long long v28 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
  v45 = v28;
  long long v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
  v47[2] = v29;
  long long v30 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:3];
  [v3 addObject:v30];

  long long v31 = [MEMORY[0x263EFFA40] workflowUserDefaults];
  LODWORD(v27) = [v31 BOOLForKey:@"WFShowTestAutomationButton"];

  if (v27)
  {
    v41[1] = @"sectionRows";
    v42[0] = @"testAutomation";
    v41[0] = @"identifier";
    v39[0] = @"Test This Automation";
    v38[0] = @"cellTitle";
    v38[1] = @"cellIdentifier";
    long long v32 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v32);
    v39[1] = v33;
    v38[2] = @"cellClass";
    v39[2] = objc_opt_class();
    v34 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];
    BOOL v40 = v34;
    uint64_t v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];
    v42[1] = v35;
    v36 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
    [v3 addObject:v36];
  }
  return v3;
}

- (WFAutomationSummaryViewController)initWithTrigger:(id)a3 triggerIdentifier:(id)a4 workflow:(id)a5 mode:(unint64_t)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v12)
  {
    long long v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"WFAutomationSummaryViewController.m", 78, @"Invalid parameter not satisfying: %@", @"triggerRecord" object file lineNumber description];
  }
  v32.receiver = self;
  v32.super_class = (Class)WFAutomationSummaryViewController;
  int v15 = [(WFAutomationSummaryViewController *)&v32 initWithNibName:0 bundle:0];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_triggerRecord, a3);
    uint64_t v17 = [v13 copy];
    triggerIdentifier = v16->_triggerIdentifier;
    v16->_triggerIdentifier = (NSString *)v17;

    int v19 = (void *)MEMORY[0x263F86F40];
    v20 = [v12 triggerData];
    uint64_t v21 = [v19 triggerWithSerializedData:v20];
    trigger = v16->_trigger;
    v16->_trigger = (WFTrigger *)v21;

    if (!v16->_trigger)
    {
      long long v30 = [MEMORY[0x263F08690] currentHandler];
      long long v31 = [v12 triggerData];
      [v30 handleFailureInMethod:a2, v16, @"WFAutomationSummaryViewController.m", 87, @"Failed to deserialize trigger from data (%@)", v31 object file lineNumber description];
    }
    objc_storeStrong((id *)&v16->_workflow, a5);
    v16->_mode = a6;
    id v23 = objc_alloc(MEMORY[0x263F824A8]);
    uint64_t v24 = WFLocalizedString(@"Done");
    long long v25 = (void *)[v23 initWithTitle:v24 style:2 target:v16 action:sel_didTapDone_];
    long long v26 = [(WFAutomationSummaryViewController *)v16 navigationItem];
    [v26 setRightBarButtonItem:v25];

    long long v27 = v16;
  }

  return v16;
}

@end