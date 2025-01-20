@interface PKPaymentSetupDismissibleNavigationController
- (PKPaymentSetupDismissibleNavigationController)init;
- (PKPaymentSetupDismissibleNavigationController)initWithContext:(int64_t)a3;
- (PKUIFlowManagerRendererDelegate)flowDelegate;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (int64_t)context;
- (unint64_t)supportedInterfaceOrientations;
- (void)_configureRootViewController;
- (void)cancelButtonPressed:(id)a3;
- (void)dealloc;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)setFlowDelegate:(id)a3;
- (void)useStandardPlatformPresentationStyle;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKPaymentSetupDismissibleNavigationController

- (PKPaymentSetupDismissibleNavigationController)init
{
  return 0;
}

- (PKPaymentSetupDismissibleNavigationController)initWithContext:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupDismissibleNavigationController;
  result = [(PKNavigationController *)&v5 init];
  if (result) {
    result->_context = a3;
  }
  return result;
}

- (void)dealloc
{
  p_flowDelegate = &self->_flowDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  [WeakRetained rendererDidDisappearWithRenderer:self];

  objc_storeWeak((id *)p_flowDelegate, 0);
  objc_super v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupNavigationController: Calling didCompleteFlow for Buddy", buf, 2u);
  }

  v6 = [(objc_class *)_MergedGlobals_3_12() sharedInstance];
  v7 = off_1EC34A000();
  [v6 didCompleteFlow:v7];

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupDismissibleNavigationController;
  [(PKNavigationController *)&v8 dealloc];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupDismissibleNavigationController;
  [(PKNavigationController *)&v3 viewDidLoad];
  PKPaymentSetupApplyContextAppearance(self->_context, self);
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupDismissibleNavigationController;
  [(PKPaymentSetupDismissibleNavigationController *)&v3 viewWillAppear:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupDismissibleNavigationController;
  [(PKPaymentSetupDismissibleNavigationController *)&v5 viewWillDisappear:a3];
  if ([(PKPaymentSetupDismissibleNavigationController *)self isBeingDismissed])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
    [WeakRetained rendererDidDisappearWithRenderer:self];

    objc_storeWeak((id *)&self->_flowDelegate, 0);
  }
}

- (void)_configureRootViewController
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!self->_configureRootViewController)
  {
    self->_configureRootViewController = 1;
    if ((PKPaymentSetupContextIsSetupAssistant() & 1) == 0)
    {
      objc_super v3 = [(PKPaymentSetupDismissibleNavigationController *)self viewControllers];
      v4 = [v3 firstObject];

      objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonPressed_];
      v6 = [v4 navigationItem];
      if ([v4 conformsToProtocol:&unk_1EF2E3F28])
      {
        v10 = v5;
        v7 = (void *)MEMORY[0x1E4F1C978];
        id v8 = v4;
        v9 = [v7 arrayWithObjects:&v10 count:1];
        objc_msgSend(v8, "_setLeftBarButtonItems:animated:", v9, 0, v10, v11);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            [v6 setHidesBackButton:1];
            [v6 setLeftBarButtonItem:v5];
            goto LABEL_9;
          }
        }
        v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:24 target:self action:sel_cancelButtonPressed_];
        [v6 setHidesBackButton:1];
        [v6 setRightBarButtonItem:v9];
      }

LABEL_9:
    }
  }
}

- (void)useStandardPlatformPresentationStyle
{
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    [(PKNavigationController *)self setCustomFormSheetPresentationStyleForiPad];
  }
  else
  {
    [(PKPaymentSetupDismissibleNavigationController *)self setModalPresentationStyle:3];
  }
}

- (void)cancelButtonPressed:(id)a3
{
}

- (unint64_t)supportedInterfaceOrientations
{
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    return 30;
  }
  else
  {
    return 2;
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  [(PKPaymentSetupDismissibleNavigationController *)self _configureRootViewController];
  PKPaymentSetupApplyContextAppearance(self->_context, v8);
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentSetupDismissibleNavigationController;
  [(PKNavigationController *)&v12 navigationController:v9 willShowViewController:v8 animated:v5];

  if (([(PKPaymentSetupDismissibleNavigationController *)self isModalInPresentation] & 1) == 0)
  {
    v10 = [(PKPaymentSetupDismissibleNavigationController *)self viewControllers];
    unint64_t v11 = [v10 count];

    if (v11 >= 2) {
      [(PKPaymentSetupDismissibleNavigationController *)self setModalInPresentation:1];
    }
  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(PKPaymentSetupDismissibleNavigationController *)self topViewController];
  int v8 = [v7 conformsToProtocol:&unk_1EF2FA680];
  char v9 = v8;
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v7 viewWillDismissModalView];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__PKPaymentSetupDismissibleNavigationController_dismissViewControllerAnimated_completion___block_invoke;
  v13[3] = &unk_1E59CF278;
  char v16 = v9;
  id v14 = v7;
  id v15 = v6;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentSetupDismissibleNavigationController;
  id v10 = v6;
  id v11 = v7;
  [(PKPaymentSetupDismissibleNavigationController *)&v12 dismissViewControllerAnimated:v4 completion:v13];
}

uint64_t __90__PKPaymentSetupDismissibleNavigationController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48) && (objc_opt_respondsToSelector() & 1) != 0) {
    [*(id *)(a1 + 32) viewDidDismissModalView];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    objc_super v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if ([v10 conformsToProtocol:&unk_1EF2CEE70]
    && (char v12 = objc_opt_respondsToSelector(), v13 = v10, (v12 & 1) != 0)
    || [v11 conformsToProtocol:&unk_1EF2CEE70]
    && (char v14 = objc_opt_respondsToSelector(), v13 = v11, (v14 & 1) != 0))
  {
    id v15 = [v13 navigationController:v9 animationControllerForOperation:a4 fromViewController:v10 toViewController:v11];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (int64_t)context
{
  return self->_context;
}

- (PKUIFlowManagerRendererDelegate)flowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

  return (PKUIFlowManagerRendererDelegate *)WeakRetained;
}

- (void)setFlowDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end