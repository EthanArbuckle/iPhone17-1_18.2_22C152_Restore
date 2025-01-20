@interface PKSavingsAccountViewController
- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground;
- (PKSavingsAccountViewController)initWithConfiguration:(id)a3;
- (void)loadView;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKSavingsAccountViewController

- (PKSavingsAccountViewController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKSavingsAccountViewController;
  v5 = [(PKSavingsAccountViewController *)&v20 init];
  if (v5)
  {
    v6 = [[_PKAccountSavingsViewController alloc] initWithConfiguration:v4];
    viewController = v5->_viewController;
    v5->_viewController = v6;

    [(PKSavingsAccountViewController *)v5 addChildViewController:v5->_viewController];
    v8 = [(PKSavingsAccountViewController *)v5 navigationItem];
    v9 = PKLocalizedFeatureString();
    [v8 setTitle:v9];

    [v8 setLargeTitleDisplayMode:1];
    [v8 setBackButtonDisplayMode:2];
    v10 = PKUIInfoButtonImageWithDefaultConfiguration();
    v11 = objc_alloc_init(PKDashboardMoreMenuFactory);
    moreMenuFactory = v5->_moreMenuFactory;
    v5->_moreMenuFactory = v11;

    v13 = v5->_moreMenuFactory;
    v14 = [v4 account];
    [(PKDashboardMoreMenuFactory *)v13 setAccount:v14];

    id v15 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v16 = [(PKDashboardMoreMenuFactory *)v5->_moreMenuFactory moreMenu];
    v17 = (void *)[v15 initWithImage:v10 menu:v16];

    [v17 setAccessibilityIdentifier:*MEMORY[0x1E4F856F8]];
    v18 = [MEMORY[0x1E4FB1618] labelColor];
    [v17 setTintColor:v18];

    [v8 setRightBarButtonItem:v17];
  }

  return v5;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)PKSavingsAccountViewController;
  [(PKSavingsAccountViewController *)&v5 loadView];
  [(_PKAccountSavingsViewController *)self->_viewController didMoveToParentViewController:self];
  v3 = [(_PKAccountSavingsViewController *)self->_viewController view];
  id v4 = [(PKSavingsAccountViewController *)self view];
  [v4 addSubview:v3];
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PKSavingsAccountViewController;
  [(PKSavingsAccountViewController *)&v13 viewWillLayoutSubviews];
  v3 = [(PKSavingsAccountViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(_PKAccountSavingsViewController *)self->_viewController view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKSavingsAccountViewController;
  [(PKSavingsAccountViewController *)&v6 viewWillAppear:a3];
  double v4 = [(PKSavingsAccountViewController *)self navigationController];
  [(PKDashboardMoreMenuFactory *)self->_moreMenuFactory setNavigationController:v4];
  double v5 = [v4 navigationBar];
  [v5 setPrefersLargeTitles:1];
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreMenuFactory, 0);

  objc_storeStrong((id *)&self->_viewController, 0);
}

@end