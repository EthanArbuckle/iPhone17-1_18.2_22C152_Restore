@interface PDURootViewController
+ (BOOL)deviceIsPad;
+ (unint64_t)preferredOrientation;
- (BOOL)_canShowWhileLocked;
- (PDURootViewController)initWithApplicationIdentity:(id)a3 consentStore:(id)a4;
- (PDURootViewControllerDelegate)delegate;
- (void)_presentWelcomeViewIfNeeded;
- (void)_showWelcomeViewIfNeeded;
- (void)setDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)welcomeViewController:(id)a3 didDismissWithUserResponse:(unint64_t)a4;
@end

@implementation PDURootViewController

- (PDURootViewController)initWithApplicationIdentity:(id)a3 consentStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PDURootViewController;
  v9 = [(PDURootViewController *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_applicationIdentity, a3);
    objc_storeStrong((id *)&v10->_consentStore, a4);
    v11 = v10;
  }

  return v10;
}

- (void)welcomeViewController:(id)a3 didDismissWithUserResponse:(unint64_t)a4
{
  v6 = [(PDURootViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    if (a4 > 2) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = qword_25A6631C8[a4];
    }
    v9 = [(PDURootViewController *)self delegate];
    [v9 rootViewController:self didDismissWithUserResponse:v8];

    [(PDURootViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_showWelcomeViewIfNeeded
{
  v25[4] = *MEMORY[0x263EF8340];
  if (!self->_welcomeViewController)
  {
    PDUWelcomeViewControllerForApplicationWithConsentStore(self->_applicationIdentity, self, self->_consentStore);
    v3 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    welcomeViewController = self->_welcomeViewController;
    self->_welcomeViewController = v3;

    v5 = [(UIViewController *)self->_welcomeViewController view];
    [(PDURootViewController *)self addChildViewController:self->_welcomeViewController];
    v6 = [(PDURootViewController *)self view];
    [v6 addSubview:v5];

    [(UIViewController *)self->_welcomeViewController didMoveToParentViewController:self];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = (void *)MEMORY[0x263F08938];
    v23 = [v5 topAnchor];
    v24 = [(PDURootViewController *)self view];
    v22 = [v24 topAnchor];
    v21 = [v23 constraintEqualToAnchor:v22];
    v25[0] = v21;
    v19 = [v5 bottomAnchor];
    v20 = [(PDURootViewController *)self view];
    v18 = [v20 bottomAnchor];
    v16 = [v19 constraintEqualToAnchor:v18];
    v25[1] = v16;
    char v7 = [v5 leadingAnchor];
    uint64_t v8 = [(PDURootViewController *)self view];
    v9 = [v8 leadingAnchor];
    v10 = [v7 constraintEqualToAnchor:v9];
    v25[2] = v10;
    v11 = [v5 trailingAnchor];
    v12 = [(PDURootViewController *)self view];
    objc_super v13 = [v12 trailingAnchor];
    v14 = [v11 constraintEqualToAnchor:v13];
    v25[3] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
    [v17 activateConstraints:v15];
  }
}

+ (BOOL)deviceIsPad
{
  if (deviceIsPad_onceToken != -1) {
    dispatch_once(&deviceIsPad_onceToken, &__block_literal_global_1);
  }
  return deviceIsPad_isPad;
}

uint64_t __36__PDURootViewController_deviceIsPad__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  deviceIsPad_isPad = result == 3;
  return result;
}

+ (unint64_t)preferredOrientation
{
  if ([a1 deviceIsPad]) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)_presentWelcomeViewIfNeeded
{
  if (!self->_welcomeViewController)
  {
    PDUWelcomeViewControllerForApplicationWithConsentStore(self->_applicationIdentity, self, self->_consentStore);
    v3 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    welcomeViewController = self->_welcomeViewController;
    self->_welcomeViewController = v3;

    if ([(id)objc_opt_class() deviceIsPad]) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 5;
    }
    [(UIViewController *)self->_welcomeViewController setModalPresentationStyle:v5];
    [(UIViewController *)self->_welcomeViewController setModalInPresentation:1];
    v6 = self->_welcomeViewController;
    [(PDURootViewController *)self presentViewController:v6 animated:0 completion:0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(PDURootViewController *)self _presentWelcomeViewIfNeeded];
  v5.receiver = self;
  v5.super_class = (Class)PDURootViewController;
  [(PDURootViewController *)&v5 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(PDURootViewController *)self delegate];
  [v5 rootViewController:self didDismissWithUserResponse:3];

  v6.receiver = self;
  v6.super_class = (Class)PDURootViewController;
  [(PDURootViewController *)&v6 viewWillDisappear:v3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PDURootViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PDURootViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_consentStore, 0);
  objc_storeStrong((id *)&self->_applicationIdentity, 0);
  objc_storeStrong((id *)&self->_welcomeViewController, 0);
}

@end