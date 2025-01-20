@interface SUUIReportAConcernReasonViewController
- (SUUIReportAConcernConfiguration)configuration;
- (SUUIReportAConcernReasonDataSource)dataSource;
- (SUUIReportAConcernReasonViewController)initWithCoder:(id)a3;
- (SUUIReportAConcernReasonViewController)initWithConfiguration:(id)a3;
- (SUUIReportAConcernReasonViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UITableView)tableView;
- (id)completion;
- (void)cancelPressed:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SUUIReportAConcernReasonViewController

- (SUUIReportAConcernReasonViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = objc_alloc_init(SUUIReportAConcernConfiguration);
  v6 = [(SUUIReportAConcernReasonViewController *)self initWithConfiguration:v5];

  return v6;
}

- (SUUIReportAConcernReasonViewController)initWithCoder:(id)a3
{
  v4 = objc_alloc_init(SUUIReportAConcernConfiguration);
  v5 = [(SUUIReportAConcernReasonViewController *)self initWithConfiguration:v4];

  return v5;
}

- (SUUIReportAConcernReasonViewController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIReportAConcernReasonViewController;
  v6 = [(SUUIReportAConcernReasonViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)SUUIReportAConcernReasonViewController;
  [(SUUIReportAConcernReasonViewController *)&v25 viewDidLoad];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"REPORT_A_CONCERN" value:&stru_2704F8130 table:0];
  [(SUUIReportAConcernReasonViewController *)self setTitle:v4];

  id v5 = objc_alloc(MEMORY[0x263F824A8]);
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"BACK" value:&stru_2704F8130 table:0];
  v8 = (void *)[v5 initWithTitle:v7 style:0 target:0 action:0];
  objc_super v9 = [(SUUIReportAConcernReasonViewController *)self navigationItem];
  [v9 setBackBarButtonItem:v8];

  id v10 = objc_alloc(MEMORY[0x263F824A8]);
  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"CANCEL" value:&stru_2704F8130 table:0];
  v13 = (void *)[v10 initWithTitle:v12 style:0 target:self action:sel_cancelPressed_];
  v14 = [(SUUIReportAConcernReasonViewController *)self navigationItem];
  [v14 setLeftBarButtonItem:v13];

  id v15 = objc_alloc(MEMORY[0x263F82C78]);
  v16 = objc_msgSend(v15, "initWithFrame:style:", 1, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v16 setDelegate:self];
  v17 = [[SUUIReportAConcernReasonDataSource alloc] initWithTableView:v16];
  v18 = [(SUUIReportAConcernReasonViewController *)self configuration];
  v19 = [v18 reasons];
  [(SUUIReportAConcernReasonDataSource *)v17 setReasons:v19];

  v20 = [(SUUIReportAConcernReasonViewController *)self configuration];
  v21 = [v20 selectReasonTitle];
  [(SUUIReportAConcernReasonDataSource *)v17 setSelectReasonTitle:v21];

  v22 = [(SUUIReportAConcernReasonViewController *)self configuration];
  v23 = [v22 selectReasonSubtitle];
  [(SUUIReportAConcernReasonDataSource *)v17 setSelectReasonSubtitle:v23];

  [v16 setDataSource:v17];
  [(SUUIReportAConcernReasonViewController *)self setDataSource:v17];
  v24 = [(SUUIReportAConcernReasonViewController *)self view];
  [v24 addSubview:v16];

  [(SUUIReportAConcernReasonViewController *)self setTableView:v16];
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)SUUIReportAConcernReasonViewController;
  [(SUUIReportAConcernReasonViewController *)&v13 viewWillLayoutSubviews];
  v3 = [(SUUIReportAConcernReasonViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(SUUIReportAConcernReasonViewController *)self tableView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)cancelPressed:(id)a3
{
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  double v7 = [(SUUIReportAConcernReasonViewController *)self configuration];
  double v8 = [v7 reasons];
  uint64_t v9 = [v6 row];

  id v17 = [v8 objectAtIndexedSubscript:v9];

  double v10 = [(SUUIReportAConcernReasonViewController *)self configuration];
  double v11 = (void *)[v10 copy];

  v12 = [[SUUIReportAConcernDetailsViewController alloc] initWithConfiguration:v11];
  objc_super v13 = objc_alloc_init(SUUIReportAConcernMetadata);
  [(SUUIReportAConcernMetadata *)v13 setSelectedReason:v17];
  -[SUUIReportAConcernMetadata setItemIdentifier:](v13, "setItemIdentifier:", [v11 itemIdentifier]);
  v14 = [v11 reportConcernURL];
  [(SUUIReportAConcernMetadata *)v13 setReportConcernURL:v14];

  [(SUUIReportAConcernDetailsViewController *)v12 setMetadata:v13];
  id v15 = [(SUUIReportAConcernReasonViewController *)self completion];
  [(SUUIReportAConcernDetailsViewController *)v12 setCompletion:v15];

  v16 = [(SUUIReportAConcernReasonViewController *)self navigationController];
  [v16 pushViewController:v12 animated:1];
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (SUUIReportAConcernConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (SUUIReportAConcernReasonDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end