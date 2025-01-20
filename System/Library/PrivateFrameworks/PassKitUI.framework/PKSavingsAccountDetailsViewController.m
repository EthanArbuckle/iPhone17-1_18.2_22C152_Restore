@interface PKSavingsAccountDetailsViewController
- (PKSavingsAccountDetailsViewController)initWithConfiguration:(id)a3;
- (void)loadView;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKSavingsAccountDetailsViewController

- (PKSavingsAccountDetailsViewController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKSavingsAccountDetailsViewController;
  v5 = [(PKSavingsAccountDetailsViewController *)&v17 init];
  if (v5)
  {
    objc_initWeak(&location, v5);
    v6 = [_PKAccountSavingsDetailsViewController alloc];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __63__PKSavingsAccountDetailsViewController_initWithConfiguration___block_invoke;
    v14 = &unk_1E59CB100;
    objc_copyWeak(&v15, &location);
    uint64_t v7 = [(_PKAccountSavingsDetailsViewController *)v6 initWithConfiguration:v4 setNavigationIconVisible:&v11];
    viewController = v5->_viewController;
    v5->_viewController = (_PKAccountSavingsDetailsViewController *)v7;

    -[PKSavingsAccountDetailsViewController addChildViewController:](v5, "addChildViewController:", v5->_viewController, v11, v12, v13, v14);
    v9 = [(PKSavingsAccountDetailsViewController *)v5 navigationItem];
    [v9 setLargeTitleDisplayMode:2];
    [v9 setBackButtonDisplayMode:2];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __63__PKSavingsAccountDetailsViewController_initWithConfiguration___block_invoke(uint64_t a1, int a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)WeakRetained[123];
    uint64_t v7 = v4;
    if (a2) {
      uint64_t v6 = v4[124];
    }
    else {
      uint64_t v6 = 0;
    }
    [v5 setTitleView:v6 animated:1];
    id v4 = v7;
  }
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)PKSavingsAccountDetailsViewController;
  [(PKSavingsAccountDetailsViewController *)&v5 loadView];
  [(_PKAccountSavingsDetailsViewController *)self->_viewController didMoveToParentViewController:self];
  v3 = [(_PKAccountSavingsDetailsViewController *)self->_viewController view];
  id v4 = [(PKSavingsAccountDetailsViewController *)self view];
  [v4 addSubview:v3];
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PKSavingsAccountDetailsViewController;
  [(PKSavingsAccountDetailsViewController *)&v13 viewWillLayoutSubviews];
  v3 = [(PKSavingsAccountDetailsViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = [(_PKAccountSavingsDetailsViewController *)self->_viewController view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)viewWillAppear:(BOOL)a3
{
  v18.receiver = self;
  v18.super_class = (Class)PKSavingsAccountDetailsViewController;
  [(PKSavingsAccountDetailsViewController *)&v18 viewWillAppear:a3];
  if (!self->_titleIconView)
  {
    double v4 = [(PKSavingsAccountDetailsViewController *)self navigationController];
    double v5 = [v4 navigationBar];
    [v5 frame];
    double v7 = v6;

    double v8 = -[PKAnimatedNavigationBarTitleView initWithFrame:]([PKAnimatedNavigationBarTitleView alloc], "initWithFrame:", 0.0, 0.0, v7, v7);
    titleIconView = self->_titleIconView;
    self->_titleIconView = v8;

    double v10 = [(PKSavingsAccountDetailsViewController *)self navigationItem];
    objc_msgSend(v10, "pkui_setCenterAlignedTitleView:", self->_titleIconView);

    double v11 = PKPassKitUIBundle();
    uint64_t v12 = [v11 URLForResource:@"SAVINGS_Icon" withExtension:@"pdf"];
    double v13 = PKUIScreenScale();
    v14 = PKUIImageFromPDF(v12, v7, v7, v13);

    id v15 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v14];
    titleIcon = self->_titleIcon;
    self->_titleIcon = v15;

    objc_super v17 = [(UIImageView *)self->_titleIcon layer];
    [v17 setCornerRadius:6.0];
    [v17 setMasksToBounds:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleIcon, 0);
  objc_storeStrong((id *)&self->_titleIconView, 0);

  objc_storeStrong((id *)&self->_viewController, 0);
}

@end