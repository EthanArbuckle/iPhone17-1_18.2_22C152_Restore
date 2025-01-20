@interface SKUIReportAConcernReasonViewController
- (SKUIReportAConcernConfiguration)configuration;
- (SKUIReportAConcernReasonDataSource)dataSource;
- (SKUIReportAConcernReasonViewController)initWithCoder:(id)a3;
- (SKUIReportAConcernReasonViewController)initWithConfiguration:(id)a3;
- (SKUIReportAConcernReasonViewController)initWithNibName:(id)a3 bundle:(id)a4;
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

@implementation SKUIReportAConcernReasonViewController

- (SKUIReportAConcernReasonViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIReportAConcernReasonViewController initWithNibName:bundle:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13 = objc_alloc_init(SKUIReportAConcernConfiguration);
  v14 = [(SKUIReportAConcernReasonViewController *)self initWithConfiguration:v13];

  return v14;
}

- (SKUIReportAConcernReasonViewController)initWithCoder:(id)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        -[SKUIReportAConcernReasonViewController initWithCoder:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v12 = objc_alloc_init(SKUIReportAConcernConfiguration);
  v13 = [(SKUIReportAConcernReasonViewController *)self initWithConfiguration:v12];

  return v13;
}

- (SKUIReportAConcernReasonViewController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIReportAConcernReasonViewController initWithConfiguration:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIReportAConcernReasonViewController;
  v14 = [(SKUIReportAConcernReasonViewController *)&v17 initWithNibName:0 bundle:0];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_configuration, a3);
  }

  return v15;
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)SKUIReportAConcernReasonViewController;
  [(SKUIReportAConcernReasonViewController *)&v25 viewDidLoad];
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v4 = [v3 localizedStringForKey:@"REPORT_A_CONCERN" value:&stru_1F1C879E8 table:0];
  [(SKUIReportAConcernReasonViewController *)self setTitle:v4];

  id v5 = objc_alloc(MEMORY[0x1E4FB14A8]);
  BOOL v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"BACK" value:&stru_1F1C879E8 table:0];
  uint64_t v8 = (void *)[v5 initWithTitle:v7 style:0 target:0 action:0];
  uint64_t v9 = [(SKUIReportAConcernReasonViewController *)self navigationItem];
  [v9 setBackBarButtonItem:v8];

  id v10 = objc_alloc(MEMORY[0x1E4FB14A8]);
  uint64_t v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v12 = [v11 localizedStringForKey:@"CANCEL" value:&stru_1F1C879E8 table:0];
  uint64_t v13 = (void *)[v10 initWithTitle:v12 style:0 target:self action:sel_cancelPressed_];
  v14 = [(SKUIReportAConcernReasonViewController *)self navigationItem];
  [v14 setLeftBarButtonItem:v13];

  id v15 = objc_alloc(MEMORY[0x1E4FB1D00]);
  v16 = objc_msgSend(v15, "initWithFrame:style:", 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v16 setDelegate:self];
  objc_super v17 = [[SKUIReportAConcernReasonDataSource alloc] initWithTableView:v16];
  v18 = [(SKUIReportAConcernReasonViewController *)self configuration];
  v19 = [v18 reasons];
  [(SKUIReportAConcernReasonDataSource *)v17 setReasons:v19];

  v20 = [(SKUIReportAConcernReasonViewController *)self configuration];
  v21 = [v20 selectReasonTitle];
  [(SKUIReportAConcernReasonDataSource *)v17 setSelectReasonTitle:v21];

  v22 = [(SKUIReportAConcernReasonViewController *)self configuration];
  v23 = [v22 selectReasonSubtitle];
  [(SKUIReportAConcernReasonDataSource *)v17 setSelectReasonSubtitle:v23];

  [v16 setDataSource:v17];
  [(SKUIReportAConcernReasonViewController *)self setDataSource:v17];
  v24 = [(SKUIReportAConcernReasonViewController *)self view];
  [v24 addSubview:v16];

  [(SKUIReportAConcernReasonViewController *)self setTableView:v16];
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)SKUIReportAConcernReasonViewController;
  [(SKUIReportAConcernReasonViewController *)&v13 viewWillLayoutSubviews];
  v3 = [(SKUIReportAConcernReasonViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(SKUIReportAConcernReasonViewController *)self tableView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)cancelPressed:(id)a3
{
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  double v7 = [(SKUIReportAConcernReasonViewController *)self configuration];
  double v8 = [v7 reasons];
  uint64_t v9 = [v6 row];

  id v17 = [v8 objectAtIndexedSubscript:v9];

  double v10 = [(SKUIReportAConcernReasonViewController *)self configuration];
  double v11 = (void *)[v10 copy];

  uint64_t v12 = [[SKUIReportAConcernDetailsViewController alloc] initWithConfiguration:v11];
  objc_super v13 = objc_alloc_init(SKUIReportAConcernMetadata);
  [(SKUIReportAConcernMetadata *)v13 setSelectedReason:v17];
  -[SKUIReportAConcernMetadata setItemIdentifier:](v13, "setItemIdentifier:", [v11 itemIdentifier]);
  v14 = [v11 reportConcernURL];
  [(SKUIReportAConcernMetadata *)v13 setReportConcernURL:v14];

  [(SKUIReportAConcernDetailsViewController *)v12 setMetadata:v13];
  id v15 = [(SKUIReportAConcernReasonViewController *)self completion];
  [(SKUIReportAConcernDetailsViewController *)v12 setCompletion:v15];

  v16 = [(SKUIReportAConcernReasonViewController *)self navigationController];
  [v16 pushViewController:v12 animated:1];
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (SKUIReportAConcernConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (SKUIReportAConcernReasonDataSource)dataSource
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

- (void)initWithNibName:(uint64_t)a3 bundle:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithConfiguration:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end