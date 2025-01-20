@interface PXSurveyQuestionsMultipleAnswerSelectionTableViewController
- (PXSurveyQuestionsMultipleAnswerSelectionTableViewController)initWithTitle:(id)a3 message:(id)a4 reasons:(id)a5 currentlySelectedReasons:(id)a6 completion:(id)a7;
- (PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource)dataSource;
- (UIBarButtonItem)cancelButton;
- (UIBarButtonItem)doneButton;
- (id)completionBlock;
- (void)_handleCancel;
- (void)_handleDone;
- (void)_setupNavigationBar:(id)a3 message:(id)a4;
- (void)setCancelButton:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation PXSurveyQuestionsMultipleAnswerSelectionTableViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (void)setDoneButton:(id)a3
{
}

- (void)setCancelButton:(id)a3
{
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setDataSource:(id)a3
{
}

- (PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)_handleDone
{
  v3 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)self dataSource];
  id v6 = [v3 selectedReasons];

  v4 = [v6 componentsJoinedByString:@","];
  v5 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)self completionBlock];
  ((void (**)(void, void *, uint64_t))v5)[2](v5, v4, 1);

  [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_handleCancel
{
  v3 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)self completionBlock];
  v3[2](v3, 0, 0);

  [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = [v13 cellForRowAtIndexPath:a4];
  [v6 setAccessoryType:0];
  v7 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)self dataSource];
  v8 = [v6 textLabel];
  v9 = [v8 text];
  [v7 deselect:v9];

  v10 = [v13 indexPathsForSelectedRows];
  uint64_t v11 = [v10 count];

  if (!v11)
  {
    v12 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)self doneButton];
    [v12 setEnabled:0];
  }
  [v13 reloadData];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v16 = a4;
  id v6 = a3;
  v7 = [v6 cellForRowAtIndexPath:v16];
  if ([v7 accessoryType] == 3)
  {
    v8 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)self tableView];
    [v8 deselectRowAtIndexPath:v16 animated:1];

    v9 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)self tableView];
    [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)self tableView:v9 didDeselectRowAtIndexPath:v16];

    v10 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)self dataSource];
    uint64_t v11 = [v7 textLabel];
    v12 = [v11 text];
    [v10 deselect:v12];
  }
  else
  {
    [v7 setAccessoryType:3];
    id v13 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)self dataSource];
    v14 = [v7 textLabel];
    v15 = [v14 text];
    [v13 select:v15];

    v10 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)self doneButton];
    [v10 setEnabled:1];
  }

  [v6 reloadData];
}

- (UIBarButtonItem)doneButton
{
  doneButton = self->_doneButton;
  if (!doneButton)
  {
    v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__handleDone];
    v5 = self->_doneButton;
    self->_doneButton = v4;

    doneButton = self->_doneButton;
  }
  return doneButton;
}

- (UIBarButtonItem)cancelButton
{
  cancelButton = self->_cancelButton;
  if (!cancelButton)
  {
    v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__handleCancel];
    v5 = self->_cancelButton;
    self->_cancelButton = v4;

    cancelButton = self->_cancelButton;
  }
  return cancelButton;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXSurveyQuestionsMultipleAnswerSelectionTableViewController;
  [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)&v5 viewDidDisappear:a3];
  dataSource = self->_dataSource;
  self->_dataSource = 0;
}

- (void)_setupNavigationBar:(id)a3 message:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)self navigationItem];
  [v8 setTitle:v7];

  v9 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)self navigationItem];
  [v9 setPrompt:v6];

  v10 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)self cancelButton];
  uint64_t v11 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)self navigationItem];
  [v11 setLeftBarButtonItem:v10];

  id v13 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)self doneButton];
  v12 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)self navigationItem];
  [v12 setRightBarButtonItem:v13];
}

- (PXSurveyQuestionsMultipleAnswerSelectionTableViewController)initWithTitle:(id)a3 message:(id)a4 reasons:(id)a5 currentlySelectedReasons:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)PXSurveyQuestionsMultipleAnswerSelectionTableViewController;
  v17 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)&v32 initWithStyle:0];
  if (v17)
  {
    v18 = _Block_copy(v16);
    id completionBlock = v17->_completionBlock;
    v17->_id completionBlock = v18;

    v20 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)v17 tableView];
    [v20 setAllowsMultipleSelection:1];

    v21 = [PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource alloc];
    id v22 = objc_alloc(MEMORY[0x1E4F1CA80]);
    v23 = [v15 componentsSeparatedByString:@","];
    v24 = (void *)[v22 initWithArray:v23];
    uint64_t v25 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource *)v21 initWithReasons:v14 currentlySelected:v24];
    dataSource = v17->_dataSource;
    v17->_dataSource = (PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource *)v25;

    v27 = v17->_dataSource;
    v28 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)v17 tableView];
    [v28 setDataSource:v27];

    [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)v17 _setupNavigationBar:v12 message:v13];
    v29 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)v17 doneButton];
    v30 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewController *)v17 dataSource];
    objc_msgSend(v29, "setEnabled:", objc_msgSend(v30, "selectedReasonsCount") != 0);
  }
  return v17;
}

@end