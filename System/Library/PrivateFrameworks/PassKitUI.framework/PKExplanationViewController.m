@interface PKExplanationViewController
- (BOOL)paymentSetupMarkerRemovalIsInclusive;
- (BOOL)prefersCloseButtonOnLeft;
- (BOOL)showCancelButton;
- (BOOL)showCloseButton;
- (BOOL)showDoneButton;
- (OBPrivacyLinkController)privacyLinkController;
- (PKExplanationView)explanationView;
- (PKExplanationViewController)init;
- (PKExplanationViewController)initWithContext:(int64_t)a3;
- (PKExplanationViewControllerDelegate)explanationViewControllerDelegate;
- (id)contentScrollView;
- (int64_t)context;
- (unint64_t)paymentSetupMarker;
- (void)_cancelPressed;
- (void)_dismissViewController;
- (void)_donePressed;
- (void)_setNavigationBarEnabled:(BOOL)a3;
- (void)loadView;
- (void)setExplanationViewControllerDelegate:(id)a3;
- (void)setPrefersCloseButtonOnLeft:(BOOL)a3;
- (void)setPrivacyLinkController:(id)a3;
- (void)setShowCancelButton:(BOOL)a3;
- (void)setShowCloseButton:(BOOL)a3;
- (void)setShowDoneButton:(BOOL)a3;
- (void)showNavigationBarSpinner:(BOOL)a3;
- (void)showSpinner:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKExplanationViewController

- (PKExplanationViewController)init
{
  return [(PKExplanationViewController *)self initWithContext:0];
}

- (PKExplanationViewController)initWithContext:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKExplanationViewController;
  v4 = [(PKExplanationViewController *)&v11 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    v4->_context = a3;
    v6 = [[PKExplanationView alloc] initWithContext:v4->_context delegate:v4];
    explanationView = v5->_explanationView;
    v5->_explanationView = v6;

    v8 = objc_msgSend(MEMORY[0x1E4F83AD0], "pk_privacyLinkForContext:", 1);
    [(PKExplanationViewController *)v5 setPrivacyLinkController:v8];

    v9 = [(PKExplanationViewController *)v5 navigationItem];
    objc_msgSend(v9, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v9, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    [(PKExplanationViewController *)v5 setShowCancelButton:1];
    [(PKExplanationViewController *)v5 setShowDoneButton:0];
  }
  return v5;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)PKExplanationViewController;
  [(PKExplanationViewController *)&v5 loadView];
  v3 = [(PKExplanationViewController *)self view];
  v4 = PKProvisioningBackgroundColor();
  [v3 setBackgroundColor:v4];

  [v3 addSubview:self->_explanationView];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PKExplanationViewController;
  [(PKExplanationViewController *)&v5 viewDidLoad];
  v3 = [(OBPrivacyLinkController *)self->_privacyLinkController view];
  v4 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [v3 setTintColor:v4];

  PKPaymentSetupApplyContextAppearance(self->_context, self);
}

- (id)contentScrollView
{
  return [(PKExplanationView *)self->_explanationView scrollView];
}

- (void)viewWillLayoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)PKExplanationViewController;
  [(PKExplanationViewController *)&v16 viewWillLayoutSubviews];
  v3 = [(PKExplanationViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 safeAreaInsets];
  -[PKExplanationView setFrame:](self->_explanationView, "setFrame:", v5 + v12, v7 + 0.0, v9 - (v12 + v13), v11);
  v14 = [(PKExplanationView *)self->_explanationView scrollView];
  v15 = [(PKExplanationViewController *)self navigationItem];
  objc_msgSend(v14, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v15);
}

- (void)_cancelPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_explanationViewControllerDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained explanationViewControllerDidSelectCancel:self];
  }
  else {
    [(PKExplanationViewController *)self _dismissViewController];
  }
}

- (void)_donePressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_explanationViewControllerDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained explanationViewControllerDidSelectDone:self];
  }
  else {
    [(PKExplanationViewController *)self _dismissViewController];
  }
}

- (void)_dismissViewController
{
}

- (void)setShowDoneButton:(BOOL)a3
{
  self->_showDoneButton = a3;
  if (a3)
  {
    id v5 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__donePressed];
    [v5 setAccessibilityIdentifier:*MEMORY[0x1E4F85AC8]];
    double v4 = [(PKExplanationViewController *)self navigationItem];
    [v4 setRightBarButtonItem:v5];
  }
  else
  {
    id v5 = [(PKExplanationViewController *)self navigationItem];
    [v5 setRightBarButtonItem:0];
  }
}

- (void)setShowCancelButton:(BOOL)a3
{
  self->_showCancelButton = a3;
  if (a3)
  {
    id v5 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelPressed];
    [v5 setAccessibilityIdentifier:*MEMORY[0x1E4F85668]];
    double v4 = [(PKExplanationViewController *)self navigationItem];
    [v4 setLeftBarButtonItem:v5];
  }
  else
  {
    id v5 = [(PKExplanationViewController *)self navigationItem];
    [v5 setLeftBarButtonItem:0];
  }
}

- (void)setShowCloseButton:(BOOL)a3
{
  self->_showCloseButton = a3;
  id v5 = [(PKExplanationViewController *)self navigationItem];
  if (self->_showCloseButton) {
    double v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:24 target:self action:sel__cancelPressed];
  }
  else {
    double v4 = 0;
  }
  [v4 setAccessibilityIdentifier:*MEMORY[0x1E4F85488]];
  if (self->_prefersCloseButtonOnLeft) {
    [v5 setLeftBarButtonItem:v4];
  }
  else {
    [v5 setRightBarButtonItem:v4];
  }
}

- (void)setPrefersCloseButtonOnLeft:(BOOL)a3
{
  if (self->_prefersCloseButtonOnLeft != a3)
  {
    self->_prefersCloseButtonOnLeft = a3;
    if (self->_showCloseButton)
    {
      id v5 = [(PKExplanationViewController *)self navigationItem];
      double v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:24 target:self action:sel__cancelPressed];
      if (self->_prefersCloseButtonOnLeft)
      {
        [v5 setRightBarButtonItem:0];
        [v5 setLeftBarButtonItem:v4];
      }
      else
      {
        [v5 setLeftBarButtonItem:0];
        [v5 setRightBarButtonItem:v4];
      }
    }
  }
}

- (void)showNavigationBarSpinner:(BOOL)a3
{
  if (self->_showingSpinner != a3)
  {
    self->_showingSpinner = a3;
    BOOL v4 = !a3;
    id v5 = [(PKExplanationViewController *)self navigationController];
    double v6 = [v5 view];
    double v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(PKExplanationViewController *)self view];
    }
    id v21 = v8;

    [v21 setUserInteractionEnabled:v4];
    double v9 = [(PKExplanationView *)self->_explanationView dockView];
    [v9 setButtonsEnabled:v4];

    double v10 = [(PKExplanationViewController *)self navigationItem];
    double v11 = v10;
    if (self->_showingSpinner)
    {
      self->_BOOL wasBackHidden = [v10 hidesBackButton];
      double v12 = [v11 rightBarButtonItem];
      hiddenRightBarButtonItem = self->_hiddenRightBarButtonItem;
      self->_hiddenRightBarButtonItem = v12;

      if (!self->_spinningItem)
      {
        v17 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
        activityIndicatorView = self->_activityIndicatorView;
        self->_activityIndicatorView = v17;

        v19 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_activityIndicatorView];
        spinningItem = self->_spinningItem;
        self->_spinningItem = v19;
      }
      [(UIActivityIndicatorView *)self->_activityIndicatorView startAnimating];
      [v11 setRightBarButtonItem:self->_spinningItem];
      BOOL wasBackHidden = 1;
    }
    else
    {
      [(UIActivityIndicatorView *)self->_activityIndicatorView stopAnimating];
      v14 = [v11 rightBarButtonItem];
      v15 = self->_spinningItem;

      if (v14 == v15) {
        [v11 setRightBarButtonItem:self->_hiddenRightBarButtonItem];
      }
      BOOL wasBackHidden = self->_wasBackHidden;
    }
    [v11 setHidesBackButton:wasBackHidden];
    [(PKExplanationViewController *)self _setNavigationBarEnabled:v4];
    [v21 setNeedsLayout];
  }
}

- (void)showSpinner:(BOOL)a3
{
  if (self->_showingSpinner != a3)
  {
    BOOL v3 = a3;
    id v6 = [(PKExplanationView *)self->_explanationView dockView];
    id v5 = [v6 primaryButton];
    if (v5)
    {
      self->_showingSpinner = v3;
      [v6 setButtonsEnabled:v3 ^ 1];
      [v5 setShowSpinner:v3];
    }
    else
    {
      [(PKExplanationViewController *)self showNavigationBarSpinner:v3];
    }
  }
}

- (void)_setNavigationBarEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = [(PKExplanationViewController *)self navigationController];
  id v5 = [v10 navigationBar];
  [v5 setUserInteractionEnabled:v3];

  id v6 = [v10 interactivePopGestureRecognizer];
  [v6 setEnabled:v3];

  double v7 = [(PKExplanationViewController *)self navigationItem];
  id v8 = [v7 leftBarButtonItem];
  [v8 setEnabled:v3];

  double v9 = [v7 rightBarButtonItem];
  [v9 setEnabled:v3];
}

- (void)setPrivacyLinkController:(id)a3
{
  p_privacyLinkController = &self->_privacyLinkController;
  id v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    if (*p_privacyLinkController)
    {
      [(OBPrivacyLinkController *)*p_privacyLinkController willMoveToParentViewController:0];
      id v6 = [(OBPrivacyLinkController *)*p_privacyLinkController view];
      [v6 removeFromSuperview];

      [(OBPrivacyLinkController *)*p_privacyLinkController removeFromParentViewController];
    }
    objc_storeStrong((id *)&self->_privacyLinkController, a3);
    if (*p_privacyLinkController) {
      -[PKExplanationViewController addChildViewController:](self, "addChildViewController:");
    }
    -[PKExplanationView setPrivacyLink:](self->_explanationView, "setPrivacyLink:");
    [(OBPrivacyLinkController *)*p_privacyLinkController didMoveToParentViewController:self];
  }
}

- (unint64_t)paymentSetupMarker
{
  return 2;
}

- (BOOL)paymentSetupMarkerRemovalIsInclusive
{
  return 1;
}

- (PKExplanationViewControllerDelegate)explanationViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_explanationViewControllerDelegate);

  return (PKExplanationViewControllerDelegate *)WeakRetained;
}

- (void)setExplanationViewControllerDelegate:(id)a3
{
}

- (int64_t)context
{
  return self->_context;
}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (BOOL)showDoneButton
{
  return self->_showDoneButton;
}

- (BOOL)showCloseButton
{
  return self->_showCloseButton;
}

- (BOOL)prefersCloseButtonOnLeft
{
  return self->_prefersCloseButtonOnLeft;
}

- (PKExplanationView)explanationView
{
  return self->_explanationView;
}

- (OBPrivacyLinkController)privacyLinkController
{
  return self->_privacyLinkController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyLinkController, 0);
  objc_storeStrong((id *)&self->_explanationView, 0);
  objc_destroyWeak((id *)&self->_explanationViewControllerDelegate);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_hiddenRightBarButtonItem, 0);

  objc_storeStrong((id *)&self->_spinningItem, 0);
}

@end