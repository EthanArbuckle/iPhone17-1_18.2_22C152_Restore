@interface WFWorkflowWizardNameViewController
- (NSString)updatedName;
- (WFIconComposeViewController)iconComposeViewController;
- (WFWorkflow)workflow;
- (WFWorkflowWizardNameConfiguration)configuration;
- (WFWorkflowWizardNameViewController)initWithWorkflow:(id)a3 configuration:(id)a4;
- (WFWorkflowWizardNameViewControllerDelegate)delegate;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)dequeueNameCellAtIndexPath:(id)a3;
- (id)dequeueNameSuggestionCellAtIndexPath:(id)a3;
- (id)infoText;
- (id)nameCell;
- (id)nameSuggestionCell;
- (id)suggestedPhrases;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)workflowName;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)didTapDone;
- (void)iconComposeViewControllerDidTapDone;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIconComposeViewController:(id)a3;
- (void)setUpdatedName:(id)a3;
- (void)updateDoneButtonForName:(id)a3;
- (void)updateNameCell:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)workflowWizardNameCell:(id)a3 didUpdateName:(id)a4;
- (void)workflowWizardNameCellDidSelectEditIcon:(id)a3;
- (void)workflowWizardNameSuggestionCellDidSelectSuggestedPhrase:(id)a3;
@end

@implementation WFWorkflowWizardNameViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconComposeViewController);
  objc_storeStrong((id *)&self->_updatedName, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setIconComposeViewController:(id)a3
{
}

- (WFIconComposeViewController)iconComposeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconComposeViewController);
  return (WFIconComposeViewController *)WeakRetained;
}

- (void)setUpdatedName:(id)a3
{
}

- (NSString)updatedName
{
  return self->_updatedName;
}

- (void)setConfiguration:(id)a3
{
}

- (WFWorkflowWizardNameConfiguration)configuration
{
  return self->_configuration;
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (void)setDelegate:(id)a3
{
}

- (WFWorkflowWizardNameViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFWorkflowWizardNameViewControllerDelegate *)WeakRetained;
}

- (id)dequeueNameSuggestionCellAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(WFWorkflowWizardNameViewController *)self tableView];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v5 dequeueReusableCellWithIdentifier:v7 forIndexPath:v4];

  v9 = [(WFWorkflowWizardNameViewController *)self infoText];
  [v8 setInfoText:v9];

  [v8 setDelegate:self];
  v10 = objc_msgSend(MEMORY[0x263F825C8], "wf_wizardBackgroundColor");
  [v8 setBackgroundColor:v10];

  return v8;
}

- (id)dequeueNameCellAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(WFWorkflowWizardNameViewController *)self tableView];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v5 dequeueReusableCellWithIdentifier:v7 forIndexPath:v4];

  [v8 setDelegate:self];
  [v8 setShowsHeySiri:1];
  [v8 setUseDoneButtonOnKeyboard:1];
  [(WFWorkflowWizardNameViewController *)self updateNameCell:v8];
  return v8;
}

- (void)updateNameCell:(id)a3
{
  id v4 = a3;
  v5 = [(WFWorkflowWizardNameViewController *)self updatedName];
  if (v5) {
    [(WFWorkflowWizardNameViewController *)self updatedName];
  }
  else {
  id v10 = [(WFWorkflowWizardNameViewController *)self workflowName];
  }

  v6 = [(WFWorkflowWizardNameViewController *)self configuration];
  uint64_t v7 = [v6 showsHeySiri];
  v8 = [(WFWorkflowWizardNameViewController *)self workflow];
  v9 = [v8 icon];
  [v4 configureWithName:v10 showsHeySiri:v7 icon:v9];
}

- (id)nameSuggestionCell
{
  v2 = [(WFWorkflowWizardNameViewController *)self tableView];
  v3 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:0];
  id v4 = [v2 cellForRowAtIndexPath:v3];

  return v4;
}

- (id)nameCell
{
  v2 = [(WFWorkflowWizardNameViewController *)self tableView];
  v3 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
  id v4 = [v2 cellForRowAtIndexPath:v3];

  return v4;
}

- (id)suggestedPhrases
{
  v2 = [(WFWorkflowWizardNameViewController *)self configuration];
  [v2 showsSuggestions];

  return (id)MEMORY[0x263EFFA68];
}

- (id)workflowName
{
  v3 = [(WFWorkflowWizardNameViewController *)self workflow];
  if ([v3 isUntitled])
  {
    id v4 = 0;
  }
  else
  {
    v5 = [(WFWorkflowWizardNameViewController *)self workflow];
    id v4 = [v5 name];
  }
  return v4;
}

- (void)iconComposeViewControllerDidTapDone
{
  v3 = [(WFWorkflowWizardNameViewController *)self iconComposeViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];

  id v4 = [(WFWorkflowWizardNameViewController *)self nameCell];
  [(WFWorkflowWizardNameViewController *)self updateNameCell:v4];
}

- (void)didTapDone
{
  id v8 = [(WFWorkflowWizardNameViewController *)self nameCell];
  v3 = [v8 name];
  if ([v3 length])
  {
    id v4 = [(WFWorkflowWizardNameViewController *)self delegate];
    v5 = [v8 name];
    [v4 workflowWizardNameViewController:self didFinishWithName:v5];

    v6 = [(WFWorkflowWizardNameViewController *)self navigationItem];
    uint64_t v7 = [v6 rightBarButtonItem];
    [v7 setEnabled:0];
  }
}

- (void)updateDoneButtonForName:(id)a3
{
  BOOL v4 = [a3 length] != 0;
  id v6 = [(WFWorkflowWizardNameViewController *)self navigationItem];
  v5 = [v6 rightBarButtonItem];
  [v5 setEnabled:v4];
}

- (id)infoText
{
  v3 = [(WFWorkflowWizardNameViewController *)self configuration];
  if ([v3 showsHeySiri])
  {
    BOOL v4 = [(WFWorkflowWizardNameViewController *)self updatedName];
    uint64_t v5 = [v4 length];

    if (v5)
    {
      id v6 = NSString;
      uint64_t v7 = WFLocalizedString(@"Just say “Hey Siri, %@” to run this shortcut.");
      id v8 = [(WFWorkflowWizardNameViewController *)self updatedName];
      v9 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v8);

      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v7 = [(WFWorkflowWizardNameViewController *)self configuration];
  v9 = [v7 footerText];
LABEL_6:

  return v9;
}

- (void)workflowWizardNameSuggestionCellDidSelectSuggestedPhrase:(id)a3
{
  id v4 = [(WFWorkflowWizardNameViewController *)self nameCell];
  [(WFWorkflowWizardNameViewController *)self updateNameCell:v4];
}

- (void)workflowWizardNameCellDidSelectEditIcon:(id)a3
{
  id v8 = objc_alloc_init(WFIconComposeViewController);
  id v4 = [(WFWorkflowWizardNameViewController *)self workflow];
  [(WFIconComposeViewController *)v8 setWorkflow:v4];

  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_iconComposeViewControllerDidTapDone];
  id v6 = [(WFIconComposeViewController *)v8 navigationItem];
  [v6 setRightBarButtonItem:v5];

  [(WFWorkflowWizardNameViewController *)self setIconComposeViewController:v8];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v8];
  [(WFWorkflowWizardNameViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)workflowWizardNameCell:(id)a3 didUpdateName:(id)a4
{
  id v5 = a4;
  [(WFWorkflowWizardNameViewController *)self setUpdatedName:v5];
  [(WFWorkflowWizardNameViewController *)self updateDoneButtonForName:v5];

  id v6 = [(WFWorkflowWizardNameViewController *)self tableView];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__WFWorkflowWizardNameViewController_workflowWizardNameCell_didUpdateName___block_invoke;
  v7[3] = &unk_2649CBF20;
  v7[4] = self;
  [v6 performBatchUpdates:v7 completion:0];
}

void __75__WFWorkflowWizardNameViewController_workflowWizardNameCell_didUpdateName___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) infoText];
  v2 = [*(id *)(a1 + 32) nameSuggestionCell];
  [v2 setInfoText:v3];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  if (objc_msgSend(a4, "row", a3)) {
    return *MEMORY[0x263F839B8];
  }
  +[WFWorkflowWizardNameCell defaultRowHeight];
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 row];
  if (v6 == 1)
  {
    uint64_t v7 = [(WFWorkflowWizardNameViewController *)self dequeueNameSuggestionCellAtIndexPath:v5];
    goto LABEL_5;
  }
  if (!v6)
  {
    uint64_t v7 = [(WFWorkflowWizardNameViewController *)self dequeueNameCellAtIndexPath:v5];
LABEL_5:
    id v8 = (void *)v7;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF498], @"Invalid section %li for WFWorkflowWizardNameViewController", objc_msgSend(v5, "section"));
  id v8 = 0;
LABEL_7:

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFWorkflowWizardNameViewController;
  [(WFWorkflowWizardNameViewController *)&v5 viewDidAppear:a3];
  id v4 = [(WFWorkflowWizardNameViewController *)self nameCell];
  [v4 becomeFirstResponder];
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)WFWorkflowWizardNameViewController;
  [(WFWorkflowWizardNameViewController *)&v29 viewDidLoad];
  id v3 = [(WFWorkflowWizardNameViewController *)self configuration];
  id v4 = [v3 title];
  [(WFWorkflowWizardNameViewController *)self setTitle:v4];

  objc_super v5 = [(WFWorkflowWizardNameViewController *)self navigationItem];
  [v5 setLargeTitleDisplayMode:2];

  id v6 = objc_alloc(MEMORY[0x263F824A8]);
  uint64_t v7 = [v3 doneBarButtonTitle];
  id v8 = (void *)[v6 initWithTitle:v7 style:2 target:self action:sel_didTapDone];
  v9 = [(WFWorkflowWizardNameViewController *)self navigationItem];
  [v9 setRightBarButtonItem:v8];

  id v10 = [(WFWorkflowWizardNameViewController *)self tableView];
  uint64_t v11 = objc_opt_class();
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  [v10 registerClass:v11 forCellReuseIdentifier:v13];

  v14 = [(WFWorkflowWizardNameViewController *)self tableView];
  uint64_t v15 = objc_opt_class();
  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  [v14 registerClass:v15 forCellReuseIdentifier:v17];

  id v18 = objc_alloc(MEMORY[0x263F82E00]);
  v19 = [(WFWorkflowWizardNameViewController *)self view];
  [v19 bounds];
  v20 = objc_msgSend(v18, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v30), 13.0);
  v21 = [(WFWorkflowWizardNameViewController *)self tableView];
  [v21 setTableHeaderView:v20];

  v22 = [(WFWorkflowWizardNameViewController *)self tableView];
  [v22 setSeparatorStyle:0];

  v23 = [(WFWorkflowWizardNameViewController *)self tableView];
  [v23 setAllowsSelection:0];

  v24 = objc_msgSend(MEMORY[0x263F825C8], "wf_wizardBackgroundColor");
  v25 = [(WFWorkflowWizardNameViewController *)self tableView];
  [v25 setBackgroundColor:v24];

  v26 = objc_msgSend(MEMORY[0x263F825C8], "wf_wizardBackgroundColor");
  v27 = [(WFWorkflowWizardNameViewController *)self tableView];
  [v27 setSectionIndexColor:v26];

  v28 = [(WFWorkflowWizardNameViewController *)self workflowName];
  [(WFWorkflowWizardNameViewController *)self updateDoneButtonForName:v28];
}

- (WFWorkflowWizardNameViewController)initWithWorkflow:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFWorkflowWizardNameViewController;
  v9 = [(WFWorkflowWizardNameViewController *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workflow, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    uint64_t v11 = v10;
  }

  return v10;
}

@end