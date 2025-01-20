@interface TFFeedbackFormViewController
- (TFFeedbackFormPresenter)presenter;
- (TFFeedbackFormViewController)initWithPresenter:(id)a3;
- (TFFeedbackFormViewDataSource)viewDataSource;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIBarButtonItem)activityItem;
- (UIBarButtonItem)submitButtonItem;
- (UITableView)tableView;
- (void)adjustContentOffsetForKeyboardNotification:(id)a3;
- (void)loadView;
- (void)prepareForEntryType:(unint64_t)a3;
- (void)registerNotifications;
- (void)reloadEntriesAtIndexPaths:(id)a3;
- (void)reloadEntryGroupsAtIndices:(id)a3;
- (void)setNavigationItemTitle:(id)a3;
- (void)setTableView:(id)a3;
- (void)showErrorAlertWithTitle:(id)a3 message:(id)a4;
- (void)showSubmitButtonForSubmissionPendingState:(BOOL)a3;
- (void)submitButtonPressed:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)unregisterNotifications;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TFFeedbackFormViewController

- (TFFeedbackFormViewController)initWithPresenter:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TFFeedbackFormViewController;
  v6 = [(TFFeedbackFormViewController *)&v19 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presenter, a3);
    v8 = [[TFFeedbackFormViewDataSource alloc] initWithPresenter:v7->_presenter];
    viewDataSource = v7->_viewDataSource;
    v7->_viewDataSource = v8;

    id v10 = objc_alloc(MEMORY[0x263F1C468]);
    v11 = TFLocalizedString(@"FEEDBACK_NAVIGATION_SUBMIT_BUTTON_TITLE");
    uint64_t v12 = [v10 initWithTitle:v11 style:2 target:v7 action:sel_submitButtonPressed_];
    submitButtonItem = v7->_submitButtonItem;
    v7->_submitButtonItem = (UIBarButtonItem *)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
    activityIndicatorView = v7->_activityIndicatorView;
    v7->_activityIndicatorView = (UIActivityIndicatorView *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x263F1C468]) initWithCustomView:v7->_activityIndicatorView];
    activityItem = v7->_activityItem;
    v7->_activityItem = (UIBarButtonItem *)v16;
  }
  return v7;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F1CB60]);
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  v8 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], v5, v6, v7);
  [(TFFeedbackFormViewController *)self setView:v8];

  v9 = objc_msgSend(objc_alloc(MEMORY[0x263F1CA40]), "initWithFrame:style:", 1, v4, v5, v6, v7);
  [(TFFeedbackFormViewController *)self setTableView:v9];

  id v10 = [(TFFeedbackFormViewController *)self tableView];
  [v10 setAutoresizingMask:18];

  v11 = [(TFFeedbackFormViewController *)self viewDataSource];
  uint64_t v12 = [(TFFeedbackFormViewController *)self tableView];
  [v12 setDataSource:v11];

  v13 = [(TFFeedbackFormViewController *)self viewDataSource];
  uint64_t v14 = [(TFFeedbackFormViewController *)self tableView];
  [v14 setDelegate:v13];

  v15 = [(TFFeedbackFormViewController *)self tableView];
  [v15 setKeyboardDismissMode:2];

  uint64_t v16 = [(TFFeedbackFormViewController *)self tableView];
  [v16 setSeparatorStyle:0];

  v17 = [(TFFeedbackFormViewController *)self tableView];
  objc_msgSend(v17, "setContentInset:", 0.0, 0.0, 50.0, 0.0);

  v18 = [(TFFeedbackFormViewController *)self view];
  objc_super v19 = [(TFFeedbackFormViewController *)self tableView];
  [v18 addSubview:v19];

  v20 = [(TFFeedbackFormViewController *)self viewDataSource];
  v21 = [(TFFeedbackFormViewController *)self tableView];
  [v20 prepareTableViewForDataSource:v21];

  [(TFFeedbackFormViewController *)self showSubmitButtonForSubmissionPendingState:0];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)TFFeedbackFormViewController;
  [(TFFeedbackFormViewController *)&v4 viewDidLoad];
  id v3 = [(TFFeedbackFormViewController *)self presenter];
  [v3 prepareViewForForm];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TFFeedbackFormViewController;
  [(TFFeedbackFormViewController *)&v4 viewWillAppear:a3];
  [(TFFeedbackFormViewController *)self registerNotifications];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TFFeedbackFormViewController;
  [(TFFeedbackFormViewController *)&v5 viewWillDisappear:a3];
  objc_super v4 = [(TFFeedbackFormViewController *)self tableView];
  [v4 endEditing:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TFFeedbackFormViewController;
  [(TFFeedbackFormViewController *)&v4 viewDidDisappear:a3];
  [(TFFeedbackFormViewController *)self unregisterNotifications];
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TFFeedbackFormViewController;
  [(TFFeedbackFormViewController *)&v5 traitCollectionDidChange:a3];
  objc_super v4 = [(TFFeedbackFormViewController *)self tableView];
  [v4 reloadData];
}

- (void)registerNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_adjustContentOffsetForKeyboardNotification_ name:*MEMORY[0x263F1D418] object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_adjustContentOffsetForKeyboardNotification_ name:*MEMORY[0x263F1D480] object:0];
}

- (void)unregisterNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D418] object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F1D410] object:0];
}

- (void)setNavigationItemTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(TFFeedbackFormViewController *)self navigationItem];
  [v5 setTitle:v4];
}

- (void)prepareForEntryType:(unint64_t)a3
{
  id v6 = [(TFFeedbackFormViewController *)self tableView];
  id v4 = +[TFFeedbackEntryTypeCellProvider cellClassForEntryType:a3];
  id v5 = +[TFFeedbackEntryTypeCellProvider reuseIdentifierForEntryType:a3];
  [v6 registerClass:v4 forCellReuseIdentifier:v5];
}

- (void)reloadEntryGroupsAtIndices:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    id v4 = [(TFFeedbackFormViewController *)self tableView];
    [v4 reloadSections:v5 withRowAnimation:100];
  }
}

- (void)reloadEntriesAtIndexPaths:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    id v4 = [(TFFeedbackFormViewController *)self tableView];
    [v4 reloadRowsAtIndexPaths:v5 withRowAnimation:100];
  }
}

- (void)showSubmitButtonForSubmissionPendingState:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(TFFeedbackFormViewController *)self activityIndicatorView];
  id v6 = v5;
  if (v3)
  {
    [v5 startAnimating];

    [(TFFeedbackFormViewController *)self activityItem];
  }
  else
  {
    [v5 stopAnimating];

    [(TFFeedbackFormViewController *)self submitButtonItem];
  }
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  double v7 = [(TFFeedbackFormViewController *)self navigationItem];
  [v7 setRightBarButtonItem:v8];
}

- (void)showErrorAlertWithTitle:(id)a3 message:(id)a4
{
  id v8 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  id v5 = (void *)MEMORY[0x263F1C3F0];
  id v6 = TFLocalizedString(@"ALERT_DISMISS_ACTION_TITLE");
  double v7 = [v5 actionWithTitle:v6 style:0 handler:&__block_literal_global_0];

  [v8 addAction:v7];
  [(TFFeedbackFormViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)adjustContentOffsetForKeyboardNotification:(id)a3
{
  id v12 = a3;
  id v4 = [v12 name];
  int v5 = [v4 isEqualToString:*MEMORY[0x263F1D418]];

  if (v5)
  {
    id v6 = [v12 userInfo];
    double v7 = [v6 objectForKey:*MEMORY[0x263F1D428]];
    [v7 CGRectValue];
    double v9 = v8;

    double v10 = v9 + 50.0;
  }
  else
  {
    double v10 = 50.0;
  }
  v11 = [(TFFeedbackFormViewController *)self tableView];
  objc_msgSend(v11, "setContentInset:", 0.0, 0.0, v10, 0.0);
}

- (void)submitButtonPressed:(id)a3
{
  id v4 = [(TFFeedbackFormViewController *)self tableView];
  [v4 endEditing:1];

  id v5 = [(TFFeedbackFormViewController *)self presenter];
  [v5 presenterViewDidInitiateFeedbackSubmission:self];
}

- (TFFeedbackFormPresenter)presenter
{
  return self->_presenter;
}

- (TFFeedbackFormViewDataSource)viewDataSource
{
  return self->_viewDataSource;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (UIBarButtonItem)submitButtonItem
{
  return self->_submitButtonItem;
}

- (UIBarButtonItem)activityItem
{
  return self->_activityItem;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_activityItem, 0);
  objc_storeStrong((id *)&self->_submitButtonItem, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_viewDataSource, 0);

  objc_storeStrong((id *)&self->_presenter, 0);
}

@end