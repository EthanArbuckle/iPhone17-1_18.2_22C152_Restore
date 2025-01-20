@interface TUIReportDetailsViewController
- (TUIReportDetailsViewController)initWithReportManager:(id)a3;
- (TUIReportManager)reportManager;
- (UITextView)reportDetailsTextView;
- (void)loadView;
- (void)setReportDetailsTextView:(id)a3;
- (void)setReportManager:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TUIReportDetailsViewController

- (TUIReportDetailsViewController)initWithReportManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIReportDetailsViewController;
  v6 = [(TUIReportDetailsViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_reportManager, a3);
  }

  return v7;
}

- (void)loadView
{
  v3 = objc_opt_new();
  [(TUIReportDetailsViewController *)self setView:v3];

  id v5 = [(TUIReportDetailsViewController *)self view];
  v4 = [MEMORY[0x263F1C550] systemBackgroundColor];
  [v5 setBackgroundColor:v4];
}

- (void)viewDidLoad
{
  v38[4] = *MEMORY[0x263EF8340];
  v37.receiver = self;
  v37.super_class = (Class)TUIReportDetailsViewController;
  [(TUIReportDetailsViewController *)&v37 viewDidLoad];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"DETAILS_TITLE" value:&stru_270C3F140 table:@"Localizable"];
  [(TUIReportDetailsViewController *)self setTitle:v4];

  id v5 = objc_alloc(MEMORY[0x263F1CAC8]);
  v6 = (UITextView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  reportDetailsTextView = self->_reportDetailsTextView;
  self->_reportDetailsTextView = v6;

  [(UITextView *)self->_reportDetailsTextView setEditable:0];
  [(UITextView *)self->_reportDetailsTextView setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = self->_reportDetailsTextView;
  objc_super v9 = [MEMORY[0x263F1C550] labelColor];
  [(UITextView *)v8 setTextColor:v9];

  v10 = self->_reportDetailsTextView;
  v11 = (void *)MEMORY[0x263F1C658];
  [MEMORY[0x263F1C658] systemFontSize];
  v12 = objc_msgSend(v11, "monospacedSystemFontOfSize:weight:");
  [(UITextView *)v10 setFont:v12];

  v13 = self->_reportDetailsTextView;
  v14 = [(TUIReportManager *)self->_reportManager reportDetails];
  [(UITextView *)v13 setText:v14];

  -[UITextView setTextContainerInset:](self->_reportDetailsTextView, "setTextContainerInset:", 0.0, 8.0, 0.0, 8.0);
  v15 = [(TUIReportDetailsViewController *)self view];
  [v15 addSubview:self->_reportDetailsTextView];

  v28 = (void *)MEMORY[0x263F08938];
  v35 = [(UITextView *)self->_reportDetailsTextView topAnchor];
  v36 = [(TUIReportDetailsViewController *)self view];
  v34 = [v36 safeAreaLayoutGuide];
  v33 = [v34 topAnchor];
  v32 = [v35 constraintEqualToAnchor:v33];
  v38[0] = v32;
  v30 = [(UITextView *)self->_reportDetailsTextView leadingAnchor];
  v31 = [(TUIReportDetailsViewController *)self view];
  v29 = [v31 safeAreaLayoutGuide];
  v27 = [v29 leadingAnchor];
  v26 = [v30 constraintEqualToAnchor:v27];
  v38[1] = v26;
  v16 = [(UITextView *)self->_reportDetailsTextView trailingAnchor];
  v17 = [(TUIReportDetailsViewController *)self view];
  v18 = [v17 safeAreaLayoutGuide];
  v19 = [v18 trailingAnchor];
  v20 = [v16 constraintEqualToAnchor:v19];
  v38[2] = v20;
  v21 = [(UITextView *)self->_reportDetailsTextView bottomAnchor];
  v22 = [(TUIReportDetailsViewController *)self view];
  v23 = [v22 bottomAnchor];
  v24 = [v21 constraintEqualToAnchor:v23];
  v38[3] = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:4];
  [v28 activateConstraints:v25];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TUIReportDetailsViewController;
  [(TUIReportDetailsViewController *)&v3 viewDidLayoutSubviews];
  -[UITextView setContentOffset:animated:](self->_reportDetailsTextView, "setContentOffset:animated:", 0, 0.0, 0.0);
}

- (UITextView)reportDetailsTextView
{
  return self->_reportDetailsTextView;
}

- (void)setReportDetailsTextView:(id)a3
{
}

- (TUIReportManager)reportManager
{
  return self->_reportManager;
}

- (void)setReportManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportManager, 0);
  objc_storeStrong((id *)&self->_reportDetailsTextView, 0);
}

@end