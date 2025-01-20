@interface PKPayLaterViewController
- (BOOL)disablesAutomaticDismissalUponEnteringBackground;
- (PKAccount)payLaterAccount;
- (PKAccountService)accountService;
- (PKPayLaterViewController)initWithPayLaterAccount:(id)a3;
- (double)footerViewContentHeight;
- (double)headerHeight;
- (id)navigationBarAnimationText;
- (id)navigationBarAnimationView;
- (id)navigationControllerViewControllers;
- (void)_cancelButtonTapped;
- (void)_layoutFooter;
- (void)_updateNavigationBarIconForNavigationBarAppeared:(BOOL)a3;
- (void)accountChanged:(id)a3;
- (void)accountFinancingPlanAdded:(id)a3 accountIdentifier:(id)a4;
- (void)accountFinancingPlanRemoved:(id)a3 accountIdentifier:(id)a4;
- (void)accountFinancingPlanUpdated:(id)a3 oldFinancingPlan:(id)a4 accountIdentifier:(id)a5;
- (void)dealloc;
- (void)didTapHyperLink:(id)a3;
- (void)popViewControllerAnimated:(BOOL)a3;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)reloadNavigationBarHeaderFooterLayout;
- (void)setFooterView:(id)a3;
- (void)setPayLaterAccount:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKPayLaterViewController

- (PKPayLaterViewController)initWithPayLaterAccount:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPayLaterViewController;
  v6 = [(PKPaymentSetupOptionsViewController *)&v12 initWithProvisioningController:0 context:0 delegate:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_payLaterAccount, a3);
    uint64_t v8 = [MEMORY[0x1E4F84270] sharedInstance];
    accountService = v7->_accountService;
    v7->_accountService = (PKAccountService *)v8;

    [(PKAccountService *)v7->_accountService registerObserver:v7];
    v10 = [(PKPayLaterViewController *)v7 navigationItem];
    objc_msgSend(v10, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v10, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    [v10 setBackButtonDisplayMode:2];
  }
  return v7;
}

- (void)dealloc
{
  [(PKAccountService *)self->_accountService unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterViewController;
  [(PKPayLaterViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterViewController;
  [(PKPaymentSetupOptionsViewController *)&v16 viewDidLoad];
  objc_super v3 = PKPayLaterSetupGreyBackgroundColor();
  v4 = [(PKDynamicCollectionViewController *)self collectionView];
  [v4 setBackgroundColor:v3];

  id v5 = [(PKPayLaterViewController *)self view];
  [v5 setBackgroundColor:v3];

  v6 = [MEMORY[0x1E4FB1618] clearColor];
  [(PKPaymentSetupOptionsViewController *)self setHeaderBackgroundColor:v6];

  v7 = [(PKPaymentSetupOptionsViewController *)self headerView];
  [v7 setTitleAccessoriesEnabled:0];

  uint64_t v8 = [(PKPaymentSetupOptionsViewController *)self headerView];
  [v8 setRemoveAdditionalTopPadding:1];

  v9 = [(PKPayLaterViewController *)self navigationItem];
  uint64_t v10 = [v9 backBarButtonItem];
  if (v10)
  {
    v11 = (void *)v10;
LABEL_5:

    goto LABEL_6;
  }
  objc_super v12 = [(PKPayLaterViewController *)self navigationController];
  v13 = [v12 viewControllers];
  v14 = [v13 firstObject];
  int v15 = PKEqualObjects();

  if (v15)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonTapped];
    v11 = [(PKPayLaterViewController *)self navigationItem];
    [v11 setLeftBarButtonItem:v9];
    goto LABEL_5;
  }
LABEL_6:
}

- (double)footerViewContentHeight
{
  footerView = self->_footerView;
  unint64_t v3 = PKUIGetMinScreenType();
  v4 = (double *)((char *)&unk_1A0445A20 + 8 * v3);
  if (v3 >= 0x14) {
    v4 = (double *)MEMORY[0x1E4F1DB30];
  }
  -[UIView sizeThatFits:](footerView, "sizeThatFits:", *v4, 1.79769313e308);
  return v5;
}

- (void)setFooterView:(id)a3
{
  double v5 = (UIView *)a3;
  footerView = self->_footerView;
  if (footerView != v5)
  {
    v7 = v5;
    [(UIView *)footerView removeFromSuperview];
    objc_storeStrong((id *)&self->_footerView, a3);
    [(PKPayLaterViewController *)self _layoutFooter];
    double v5 = v7;
  }
}

- (id)navigationBarAnimationText
{
  return 0;
}

- (id)navigationBarAnimationView
{
  return 0;
}

- (double)headerHeight
{
  return 0.0;
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterViewController;
  [(PKPaymentSetupOptionsViewController *)&v3 viewWillLayoutSubviews];
  [(PKPayLaterViewController *)self reloadNavigationBarHeaderFooterLayout];
}

- (void)reloadNavigationBarHeaderFooterLayout
{
  id v12 = [(PKDynamicCollectionViewController *)self collectionView];
  [v12 contentOffset];
  double v4 = v3;
  [v12 safeAreaInsets];
  double v6 = v5;
  double navBarAnimationProgress = self->_navBarAnimationProgress;
  [(PKPayLaterViewController *)self headerHeight];
  if (v8 <= 0.0)
  {
    self->_double navBarAnimationProgress = 0.0;
    if (navBarAnimationProgress >= 1.0) {
      goto LABEL_9;
    }
  }
  else
  {
    double v9 = fmin(fmax(v4 / vabdd_f64(v8, v6), 0.0), 1.0);
    self->_double navBarAnimationProgress = v9;
    if (navBarAnimationProgress < 1.0 && v9 >= 1.0)
    {
      uint64_t v10 = 1;
LABEL_10:
      [(PKPayLaterViewController *)self _updateNavigationBarIconForNavigationBarAppeared:v10];
      goto LABEL_11;
    }
    if (navBarAnimationProgress >= 1.0 && v9 < 1.0)
    {
LABEL_9:
      uint64_t v10 = 0;
      goto LABEL_10;
    }
  }
LABEL_11:
  [(PKPayLaterViewController *)self _layoutFooter];
  v11 = [(PKPayLaterViewController *)self navigationItem];
  objc_msgSend(v12, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v11);
}

- (void)didTapHyperLink:(id)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 linkURL];
  double v6 = [v4 termsIdentifier];
  if (v6)
  {
    if (self->_payLaterAccount)
    {
      v7 = [PKAccountTermsAndConditionsController alloc];
      payLaterAccount = self->_payLaterAccount;
      double v9 = [MEMORY[0x1E4F84D50] sharedService];
      uint64_t v10 = [(PKAccountTermsAndConditionsController *)v7 initWithAccount:payLaterAccount webService:v9 context:[(PKPaymentSetupOptionsViewController *)self context] termsIdentifier:v6];
      termsController = self->_termsController;
      self->_termsController = v10;

      objc_initWeak(location, self);
      id v12 = self->_termsController;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __44__PKPayLaterViewController_didTapHyperLink___block_invoke;
      v18[3] = &unk_1E59CB9C8;
      objc_copyWeak(&v19, location);
      [(PKAccountTermsAndConditionsController *)v12 termsViewControllerWithCompletion:v18];
      objc_destroyWeak(&v19);
      objc_destroyWeak(location);
      goto LABEL_14;
    }
    objc_super v16 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v6;
      _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "Error: there is no account in order to open termsIdentifier %@", (uint8_t *)location, 0xCu);
    }
LABEL_9:

    goto LABEL_14;
  }
  if (!v5)
  {
    objc_super v16 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v4;
      _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "Error: not opening any link for %@ since there is no URL or terms identifier set.", (uint8_t *)location, 0xCu);
    }
    goto LABEL_9;
  }
  v13 = [v5 scheme];
  int v14 = [v13 containsString:@"http"];

  if (v14)
  {
    int v15 = (void *)[objc_alloc(MEMORY[0x1E4F3AEB8]) initWithURL:v5];
    [v15 setModalPresentationStyle:2];
    [(PKPayLaterViewController *)self presentViewController:v15 animated:1 completion:0];
  }
  else
  {
    v17 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v17 openSensitiveURL:v5 withOptions:0];
  }
LABEL_14:
}

void __44__PKPayLaterViewController_didTapHyperLink___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      id v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      double v8 = [WeakRetained navigationController];
      [v8 presentViewController:v7 animated:1 completion:0];
    }
    else if (v9)
    {
      [WeakRetained presentViewController:v9 animated:1 completion:0];
    }
  }
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    id v6 = a3;
    id v7 = [(PKPayLaterViewController *)self navigationController];
    [v7 pushViewController:v6 animated:v4];
  }
}

- (id)navigationControllerViewControllers
{
  v2 = [(PKPayLaterViewController *)self navigationController];
  double v3 = [v2 viewControllers];

  return v3;
}

- (void)popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PKPayLaterViewController *)self navigationController];
  id v4 = (id)[v5 popViewControllerAnimated:v3];
}

- (BOOL)disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void)accountChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__PKPayLaterViewController_accountChanged___block_invoke;
  v6[3] = &unk_1E59CA870;
  id v7 = v4;
  double v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __43__PKPayLaterViewController_accountChanged___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) accountIdentifier];
  BOOL v3 = [*(id *)(*(void *)(a1 + 40) + 1312) accountIdentifier];
  id v9 = v2;
  id v4 = v3;
  if (v9 == v4)
  {

LABEL_12:
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 1312), *(id *)(a1 + 32));
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = v7[164];
    [v7 didUpdatePayLaterAccount:v8];
    return;
  }
  if (v9) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    char v6 = [v9 isEqualToString:v4];

    if ((v6 & 1) == 0) {
      return;
    }
    goto LABEL_12;
  }
}

- (void)accountFinancingPlanUpdated:(id)a3 oldFinancingPlan:(id)a4 accountIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__PKPayLaterViewController_accountFinancingPlanUpdated_oldFinancingPlan_accountIdentifier___block_invoke;
  block[3] = &unk_1E59CA8E8;
  id v12 = v8;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __91__PKPayLaterViewController_accountFinancingPlanUpdated_oldFinancingPlan_accountIdentifier___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  BOOL v3 = [*(id *)(a1[5] + 1312) accountIdentifier];
  id v4 = v2;
  id v5 = v3;
  if (v4 == v5)
  {

LABEL_12:
    id v8 = (void *)a1[5];
    uint64_t v9 = a1[6];
    [v8 didUpdateFinancingPlan:v9];
    return;
  }
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  id v10 = v5;
  if (!v6)
  {
    int v7 = [v4 isEqualToString:v5];

    if (!v7) {
      return;
    }
    goto LABEL_12;
  }
}

- (void)accountFinancingPlanRemoved:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PKPayLaterViewController_accountFinancingPlanRemoved_accountIdentifier___block_invoke;
  block[3] = &unk_1E59CA8E8;
  id v11 = v7;
  id v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __74__PKPayLaterViewController_accountFinancingPlanRemoved_accountIdentifier___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  BOOL v3 = [*(id *)(a1[5] + 1312) accountIdentifier];
  id v4 = v2;
  id v5 = v3;
  if (v4 == v5)
  {

LABEL_12:
    id v8 = (void *)a1[5];
    uint64_t v9 = a1[6];
    [v8 didRemoveFinancingPlan:v9];
    return;
  }
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  id v10 = v5;
  if (!v6)
  {
    int v7 = [v4 isEqualToString:v5];

    if (!v7) {
      return;
    }
    goto LABEL_12;
  }
}

- (void)accountFinancingPlanAdded:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PKPayLaterViewController_accountFinancingPlanAdded_accountIdentifier___block_invoke;
  block[3] = &unk_1E59CA8E8;
  id v11 = v7;
  id v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __72__PKPayLaterViewController_accountFinancingPlanAdded_accountIdentifier___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  BOOL v3 = [*(id *)(a1[5] + 1312) accountIdentifier];
  id v4 = v2;
  id v5 = v3;
  if (v4 == v5)
  {

LABEL_12:
    id v8 = (void *)a1[5];
    uint64_t v9 = a1[6];
    [v8 didAddFinancingPlan:v9];
    return;
  }
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  id v10 = v5;
  if (!v6)
  {
    int v7 = [v4 isEqualToString:v5];

    if (!v7) {
      return;
    }
    goto LABEL_12;
  }
}

- (void)_layoutFooter
{
  BOOL v3 = [(PKPayLaterViewController *)self viewIfLoaded];
  footerView = self->_footerView;
  if (footerView) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    id v14 = v3;
    BOOL v6 = [(UIView *)footerView superview];

    if (!v6) {
      [v14 addSubview:self->_footerView];
    }
    [v14 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [(PKPayLaterViewController *)self footerViewContentHeight];
    -[UIView setFrame:](self->_footerView, "setFrame:", 0.0, v8 + v12 - v13, v10, v13);
    BOOL v3 = v14;
  }
}

- (void)_updateNavigationBarIconForNavigationBarAppeared:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = [(PKPayLaterViewController *)self navigationBarAnimationView];
  uint64_t v5 = [(PKPayLaterViewController *)self navigationBarAnimationText];
  if (v18 | v5
    && ([(PKPayLaterViewController *)self isBeingDismissed] & 1) == 0
    && ([(PKPayLaterViewController *)self isBeingPresented] & 1) == 0)
  {
    if (v3)
    {
      if (v18)
      {
        navBarImageView = self->_navBarImageView;
        if (!navBarImageView)
        {
          double v7 = [(PKPayLaterViewController *)self navigationController];
          double v8 = [v7 navigationBar];
          [v8 frame];
          double v10 = v9;

          double v11 = -[PKAnimatedNavigationBarTitleView initWithFrame:]([PKAnimatedNavigationBarTitleView alloc], "initWithFrame:", 0.0, 0.0, v10, v10);
          double v12 = self->_navBarImageView;
          self->_navBarImageView = v11;

          double v13 = [(PKPayLaterViewController *)self navigationItem];
          objc_msgSend(v13, "pkui_setCenterAlignedTitleView:", self->_navBarImageView);

          navBarImageView = self->_navBarImageView;
        }
        uint64_t v14 = v18;
        goto LABEL_11;
      }
      if (v5)
      {
        int v15 = [(PKPayLaterViewController *)self navigationItem];
        objc_super v16 = v15;
        uint64_t v17 = v5;
LABEL_16:
        [v15 _setTitle:v17 animated:1];
      }
    }
    else
    {
      if (v18)
      {
        navBarImageView = self->_navBarImageView;
        uint64_t v14 = 0;
LABEL_11:
        [(PKAnimatedNavigationBarTitleView *)navBarImageView setTitleView:v14 animated:1];
        goto LABEL_17;
      }
      if (v5)
      {
        int v15 = [(PKPayLaterViewController *)self navigationItem];
        objc_super v16 = v15;
        uint64_t v17 = 0;
        goto LABEL_16;
      }
    }
  }
LABEL_17:
}

- (void)_cancelButtonTapped
{
}

- (PKAccount)payLaterAccount
{
  return self->_payLaterAccount;
}

- (void)setPayLaterAccount:(id)a3
{
}

- (PKAccountService)accountService
{
  return self->_accountService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_payLaterAccount, 0);
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_footerView, 0);

  objc_storeStrong((id *)&self->_navBarImageView, 0);
}

@end