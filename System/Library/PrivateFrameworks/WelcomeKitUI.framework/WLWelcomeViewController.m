@interface WLWelcomeViewController
- (WLWelcomeViewController)init;
- (id)_initWithForceUITestMode:(BOOL)a3 forceUITestModeDownloadError:(BOOL)a4;
- (id)completionHandler;
- (id)continueHandler;
- (id)initForUITestWithForceDownloadError:(BOOL)a3;
- (id)resetHandler;
- (void)_continueTapped:(id)a3;
- (void)_qrcodeTapped:(id)a3;
- (void)dealloc;
- (void)setCompletionHandler:(id)a3;
- (void)setContinueHandler:(id)a3;
- (void)setResetHandler:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WLWelcomeViewController

- (WLWelcomeViewController)init
{
  return (WLWelcomeViewController *)[(WLWelcomeViewController *)self _initWithForceUITestMode:0 forceUITestModeDownloadError:0];
}

- (id)initForUITestWithForceDownloadError:(BOOL)a3
{
  return [(WLWelcomeViewController *)self _initWithForceUITestMode:1 forceUITestModeDownloadError:a3];
}

- (id)_initWithForceUITestMode:(BOOL)a3 forceUITestModeDownloadError:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = WLLocalizedString();
  v8 = WLLocalizedString();
  v9 = (void *)MEMORY[0x263F827E8];
  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v9 imageNamed:@"MoveToiOS" inBundle:v10];
  v21.receiver = self;
  v21.super_class = (Class)WLWelcomeViewController;
  v12 = [(WLWelcomeViewController *)&v21 initWithTitle:v7 detailText:v8 icon:v11 contentLayout:2];

  if (v12)
  {
    uint64_t v13 = [MEMORY[0x263F5B898] boldButton];
    continueButton = v12->_continueButton;
    v12->_continueButton = (OBTrayButton *)v13;

    v15 = v12->_continueButton;
    v16 = WLLocalizedString();
    [(OBTrayButton *)v15 setTitle:v16 forState:0];

    [(OBTrayButton *)v12->_continueButton addTarget:v12 action:sel__continueTapped_ forControlEvents:64];
    v17 = [(WLWelcomeViewController *)v12 buttonTray];
    [v17 addButton:v12->_continueButton];

    v18 = [[WLWelcomeController alloc] initWithWelcomeViewController:v12 forceUITestMode:v5 forceUITestModeDownloadError:v4];
    welcomeController = v12->_welcomeController;
    v12->_welcomeController = v18;
  }
  return v12;
}

- (void)dealloc
{
  _WLLog();
  v4.receiver = self;
  v4.super_class = (Class)WLWelcomeViewController;
  [(WLWelcomeViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)WLWelcomeViewController;
  [(WLOnboardingViewController *)&v6 viewDidLoad];
  v3 = [MEMORY[0x263F827E8] systemImageNamed:@"qrcode"];
  objc_super v4 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithImage:v3 style:2 target:self action:sel__qrcodeTapped_];
  BOOL v5 = [(OBBaseWelcomeController *)self navigationItem];
  [v5 setRightBarButtonItem:v4];
}

- (void)_qrcodeTapped:(id)a3
{
  if (!self->_qrcodeLoaded)
  {
    self->_qrcodeLoaded = 1;
    objc_super v4 = objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults", a3);
    [v4 setObject:MEMORY[0x263EFFA88] forKey:@"qrcode_loaded"];
    [v4 synchronize];
  }
  objc_super v6 = [[WLQRCodeDefaultViewController alloc] initWithDefaultQRCode];
  BOOL v5 = [(WLWelcomeViewController *)self navigationController];
  [v5 pushViewController:v6 animated:1];
}

- (void)_continueTapped:(id)a3
{
  [(OBTrayButton *)self->_continueButton showsBusyIndicator];
  if (self->_qrcodeLoaded)
  {
    uint64_t v4 = 1;
  }
  else
  {
    BOOL v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
    objc_super v6 = [v5 objectForKey:@"qrcode_loaded"];
    uint64_t v4 = [v6 BOOLValue];
  }
  v7 = [MEMORY[0x263F862E0] sharedInstance];
  [v7 didLoadQRCode:v4];

  id continueHandler = self->_continueHandler;
  if (continueHandler)
  {
    v9 = (void (*)(void))*((void *)continueHandler + 2);
    v9();
  }
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return [(WLWelcomeController *)self->_welcomeController completionHandler];
}

- (void)setResetHandler:(id)a3
{
}

- (id)resetHandler
{
  return [(WLWelcomeController *)self->_welcomeController resetHandler];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WLWelcomeViewController;
  [(WLWelcomeViewController *)&v4 viewWillAppear:a3];
  [(OBTrayButton *)self->_continueButton hidesBusyIndicator];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WLWelcomeViewController;
  [(OBBaseWelcomeController *)&v6 viewDidAppear:a3];
  objc_super v4 = [(WLWelcomeViewController *)self navigationController];
  if (!v4) {
    -[WLWelcomeViewController viewDidAppear:]();
  }

  BOOL v5 = [(WLWelcomeViewController *)self navigationController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[WLWelcomeViewController viewDidAppear:]();
  }
  [(WLWelcomeController *)self->_welcomeController setNavigationController:v5];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WLWelcomeViewController;
  [(WLWelcomeViewController *)&v4 viewDidDisappear:a3];
  [(OBTrayButton *)self->_continueButton hidesBusyIndicator];
}

- (id)continueHandler
{
  return self->_continueHandler;
}

- (void)setContinueHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_continueHandler, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_welcomeController, 0);
}

- (void)viewDidAppear:.cold.1()
{
}

- (void)viewDidAppear:.cold.2()
{
}

@end