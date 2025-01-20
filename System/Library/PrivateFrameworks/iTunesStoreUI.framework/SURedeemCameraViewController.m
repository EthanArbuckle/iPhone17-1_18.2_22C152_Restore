@interface SURedeemCameraViewController
+ (BOOL)cameraSupported;
- (BOOL)ignoreDefaultKeyboardNotifications;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (SUCodeRedeemerController)cameraController;
- (SURedeemCodeTextField)codeTextField;
- (UIActivityIndicatorView)activityIndicator;
- (UIBarButtonItem)redeemBarButton;
- (UIBarButtonItem)toggleCameraBarButton;
- (UIView)overlayView;
- (double)keyboardHeight;
- (id)codeHandler;
- (int64_t)state;
- (void)_cancelButtonAction;
- (void)_detectedCode:(id)a3;
- (void)_dismissKeyboard;
- (void)_hideOverlay;
- (void)_layoutCodeTextField;
- (void)_layoutCodeTextFieldWithNotification:(id)a3;
- (void)_overlayTapAction;
- (void)_pauseCamera;
- (void)_presentCameraErrorAlert;
- (void)_recognitionError;
- (void)_recognitionSuccess;
- (void)_redeemButtonAction;
- (void)_resumeCamera;
- (void)_setBackButtonTitle:(id)a3;
- (void)_setup;
- (void)_setupActivityIndicator;
- (void)_setupCameraController;
- (void)_setupCodeTextField;
- (void)_setupNavigationItem;
- (void)_setupNotifications;
- (void)_setupOverlayView;
- (void)_showOverlay;
- (void)_startActivityIndicator;
- (void)_startCameraController;
- (void)_stopAcitivityIndicator;
- (void)_stopCameraController;
- (void)_toggleCameraButtonAction;
- (void)_updateNavigationItemAnimated;
- (void)_updateState;
- (void)codeRedeemerControllerDidEndWithCode:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)performAction:(int64_t)a3 withObject:(id)a4;
- (void)setActivityIndicator:(id)a3;
- (void)setCameraController:(id)a3;
- (void)setCodeHandler:(id)a3;
- (void)setCodeTextField:(id)a3;
- (void)setIgnoreDefaultKeyboardNotifications:(BOOL)a3;
- (void)setKeyboardHeight:(double)a3;
- (void)setOverlayView:(id)a3;
- (void)setRedeemBarButton:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setToggleCameraBarButton:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SURedeemCameraViewController

+ (BOOL)cameraSupported
{
  return +[SUCodeRedeemerController cameraSupported];
}

- (void)performAction:(int64_t)a3 withObject:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SURedeemCameraViewController_performAction_withObject___block_invoke;
  block[3] = &unk_2648128D8;
  id v9 = v6;
  int64_t v10 = a3;
  block[4] = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __57__SURedeemCameraViewController_performAction_withObject___block_invoke(uint64_t result)
{
  switch(*(void *)(result + 48))
  {
    case 0:
      result = [*(id *)(result + 32) dismissViewControllerAnimated:1 completion:0];
      break;
    case 2:
      result = [*(id *)(result + 32) _pauseCamera];
      break;
    case 3:
      result = [*(id *)(result + 32) _resumeCamera];
      break;
    case 4:
      result = [*(id *)(result + 32) _recognitionError];
      break;
    case 5:
      result = [*(id *)(result + 32) _recognitionSuccess];
      break;
    case 6:
      result = [*(id *)(result + 32) _setBackButtonTitle:*(void *)(result + 40)];
      break;
    default:
      return result;
  }
  return result;
}

- (void)setIgnoreDefaultKeyboardNotifications:(BOOL)a3
{
  self->_ignoreDefaultKeyboardNotifications = a3;
  [(SURedeemCameraViewController *)self _setupNotifications];
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
  [(SURedeemCameraViewController *)self _updateState];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SURedeemCameraViewController;
  [(SURedeemCameraViewController *)&v3 viewDidLoad];
  [(SURedeemCameraViewController *)self _setup];
  [(SURedeemCameraViewController *)self setState:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SURedeemCameraViewController;
  [(SURedeemCameraViewController *)&v4 viewDidAppear:a3];
  [(SURedeemCameraViewController *)self _startCameraController];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SURedeemCameraViewController;
  [(SURedeemCameraViewController *)&v4 viewDidDisappear:a3];
  [(SURedeemCameraViewController *)self _stopCameraController];
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)SURedeemCameraViewController;
  [(SURedeemCameraViewController *)&v15 viewWillLayoutSubviews];
  objc_super v3 = [(SURedeemCameraViewController *)self cameraController];
  objc_super v4 = [v3 view];
  v5 = [(SURedeemCameraViewController *)self view];
  [v5 bounds];
  objc_msgSend(v4, "setFrame:");

  id v6 = [(SURedeemCameraViewController *)self activityIndicator];
  id v7 = [(SURedeemCameraViewController *)self view];
  [v7 center];
  double v9 = v8;
  int64_t v10 = [(SURedeemCameraViewController *)self view];
  [v10 bounds];
  double v12 = v11;
  v13 = [(SURedeemCameraViewController *)self view];
  [v13 safeAreaInsets];
  objc_msgSend(v6, "setCenter:", v9, v12 - v14 + -44.0 + -64.0);

  [(SURedeemCameraViewController *)self _layoutCodeTextField];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SURedeemCameraViewController;
  -[SURedeemCameraViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  [(SURedeemCameraViewController *)self setKeyboardHeight:0.0];
  [(SURedeemCameraViewController *)self _dismissKeyboard];
}

- (void)loadView
{
  id v4 = objc_alloc_init(MEMORY[0x263F1CB60]);
  objc_super v3 = [MEMORY[0x263F1C550] systemBackgroundColor];
  [v4 setBackgroundColor:v3];

  [(SURedeemCameraViewController *)self setView:v4];
}

- (void)_setup
{
  [(SURedeemCameraViewController *)self _setupCameraController];
  [(SURedeemCameraViewController *)self _setupCodeTextField];
  [(SURedeemCameraViewController *)self _setupNavigationItem];
  [(SURedeemCameraViewController *)self _setupNotifications];
  [(SURedeemCameraViewController *)self _setupOverlayView];

  [(SURedeemCameraViewController *)self _setupActivityIndicator];
}

- (void)_setupActivityIndicator
{
  objc_super v3 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:0];
  [(UIActivityIndicatorView *)v3 setAlpha:0.0];
  [(UIActivityIndicatorView *)v3 setHidden:1];
  id v4 = [(SURedeemCameraViewController *)self view];
  [v4 addSubview:v3];

  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v3;
}

- (void)_setupCameraController
{
  if ([(id)objc_opt_class() cameraSupported])
  {
    objc_super v3 = objc_alloc_init(SUCodeRedeemerController);
    [(SURedeemCameraViewController *)self setCameraController:v3];

    id v4 = [(SURedeemCameraViewController *)self cameraController];
    [v4 willMoveToParentViewController:self];

    objc_super v5 = [(SURedeemCameraViewController *)self cameraController];
    [(SURedeemCameraViewController *)self addChildViewController:v5];

    id v6 = [(SURedeemCameraViewController *)self view];
    id v7 = [(SURedeemCameraViewController *)self cameraController];
    double v8 = [v7 view];
    [v6 addSubview:v8];

    id v9 = [(SURedeemCameraViewController *)self cameraController];
    [v9 didMoveToParentViewController:self];
  }
}

- (void)_setupCodeTextField
{
  objc_super v3 = [[SURedeemCodeTextField alloc] initWithHeight:44.0];
  [(SURedeemCodeTextField *)v3 setDelegate:self];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v5 = [v4 localizedStringForKey:@"ENTER_CODE_MANUALLY" value:&stru_26DB8C5F8 table:0];
  [(SURedeemCodeTextField *)v3 setPlaceholder:v5];

  id v6 = [(SURedeemCameraViewController *)self view];
  [v6 addSubview:v3];

  codeTextField = self->_codeTextField;
  self->_codeTextField = v3;
}

- (void)_setupNavigationItem
{
  objc_super v3 = [(SURedeemCameraViewController *)self navigationItem];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v5 = [v4 localizedStringForKey:@"SCAN_CARD" value:&stru_26DB8C5F8 table:0];
  [v3 setTitle:v5];

  id v6 = [(SURedeemCameraViewController *)self navigationItem];
  id v7 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonAction];
  [v6 setLeftBarButtonItem:v7];

  id v8 = objc_alloc(MEMORY[0x263F1C468]);
  id v9 = (void *)MEMORY[0x263F1C6B0];
  int64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v11 = [v9 imageNamed:@"CameraFlip.png" inBundle:v10];
  double v12 = (void *)[v8 initWithImage:v11 style:0 target:self action:sel__toggleCameraButtonAction];
  [(SURedeemCameraViewController *)self setToggleCameraBarButton:v12];

  id v13 = objc_alloc(MEMORY[0x263F1C468]);
  id v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v14 = [v16 localizedStringForKey:@"REDEEM" value:&stru_26DB8C5F8 table:0];
  objc_super v15 = (void *)[v13 initWithTitle:v14 style:0 target:self action:sel__redeemButtonAction];
  [(SURedeemCameraViewController *)self setRedeemBarButton:v15];
}

- (void)_setupNotifications
{
  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 removeObserver:self];
  objc_super v3 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1
    && [(SURedeemCameraViewController *)self ignoreDefaultKeyboardNotifications])
  {
    [v7 addObserver:self selector:sel__layoutCodeTextFieldWithNotification_ name:@"SUKeyboardDidChangeNotification" object:0];
    objc_super v5 = SUKeyboardWillChangeNotification;
  }
  else
  {
    id v6 = (void *)MEMORY[0x263F1D488];
    if (v4 == 1) {
      id v6 = (void *)MEMORY[0x263F1D418];
    }
    [v7 addObserver:self selector:sel__layoutCodeTextFieldWithNotification_ name:*v6 object:0];
    objc_super v5 = (__CFString **)MEMORY[0x263F1D480];
  }
  [v7 addObserver:self selector:sel__layoutCodeTextFieldWithNotification_ name:*v5 object:0];
}

- (void)_setupOverlayView
{
  objc_super v3 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
  [(UIView *)v3 setAlpha:0.0];
  uint64_t v4 = [MEMORY[0x263F1C550] blackColor];
  [(UIView *)v3 setBackgroundColor:v4];

  [(UIView *)v3 setHidden:1];
  id v8 = (id)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__overlayTapAction];
  [(UIView *)v3 addGestureRecognizer:v8];
  overlayView = self->_overlayView;
  self->_overlayView = v3;

  id v6 = [(SURedeemCameraViewController *)self view];
  id v7 = [(SURedeemCameraViewController *)self overlayView];
  [v6 addSubview:v7];
}

- (void)_cancelButtonAction
{
  [(SURedeemCameraViewController *)self _dismissKeyboard];
  [(SURedeemCameraViewController *)self setState:0];

  [(SURedeemCameraViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_redeemButtonAction
{
  [(SURedeemCameraViewController *)self _dismissKeyboard];
  objc_super v3 = [(SURedeemCameraViewController *)self codeTextField];
  id v4 = [v3 text];

  [(SURedeemCameraViewController *)self _detectedCode:v4];
}

- (void)_setBackButtonTitle:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F1C468];
  id v5 = a3;
  id v7 = (id)[[v4 alloc] initWithTitle:v5 style:0 target:self action:sel__cancelButtonAction];

  id v6 = [(SURedeemCameraViewController *)self navigationItem];
  [v6 setLeftBarButtonItem:v7];
}

- (void)_toggleCameraButtonAction
{
  objc_super v3 = [(SURedeemCameraViewController *)self toggleCameraBarButton];
  [v3 setEnabled:0];

  objc_initWeak(&location, self);
  id v4 = [(SURedeemCameraViewController *)self cameraController];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__SURedeemCameraViewController__toggleCameraButtonAction__block_invoke;
  v5[3] = &unk_264812708;
  objc_copyWeak(&v6, &location);
  [v4 toggleCameraWithCompletion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __57__SURedeemCameraViewController__toggleCameraButtonAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained toggleCameraBarButton];
  [v1 setEnabled:1];
}

- (void)_overlayTapAction
{
  if ([(SURedeemCameraViewController *)self state] != 2)
  {
    objc_super v3 = [(SURedeemCameraViewController *)self codeTextField];
    [v3 setText:0];

    [(SURedeemCameraViewController *)self _dismissKeyboard];
  }
}

- (void)_pauseCamera
{
}

- (void)_recognitionError
{
  id v2 = [(SURedeemCameraViewController *)self cameraController];
  [v2 recognitionError];
}

- (void)_recognitionSuccess
{
  id v2 = [(SURedeemCameraViewController *)self cameraController];
  [v2 recognitionSuccess];
}

- (void)_resumeCamera
{
}

- (void)_startActivityIndicator
{
  objc_super v3 = [(SURedeemCameraViewController *)self activityIndicator];
  [v3 startAnimating];

  id v4 = [(SURedeemCameraViewController *)self activityIndicator];
  [v4 setHidden:0];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__SURedeemCameraViewController__startActivityIndicator__block_invoke;
  v5[3] = &unk_2648123D0;
  void v5[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v5 animations:0.5];
}

void __55__SURedeemCameraViewController__startActivityIndicator__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) activityIndicator];
  [v1 setAlpha:1.0];
}

- (void)_stopAcitivityIndicator
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__SURedeemCameraViewController__stopAcitivityIndicator__block_invoke;
  v3[3] = &unk_2648123D0;
  v3[4] = self;
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __55__SURedeemCameraViewController__stopAcitivityIndicator__block_invoke_2;
  v2[3] = &unk_2648131A8;
  v2[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v3 animations:v2 completion:0.5];
}

void __55__SURedeemCameraViewController__stopAcitivityIndicator__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) activityIndicator];
  [v1 setAlpha:0.0];
}

void __55__SURedeemCameraViewController__stopAcitivityIndicator__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activityIndicator];
  [v2 setHidden:1];

  id v3 = [*(id *)(a1 + 32) activityIndicator];
  [v3 stopAnimating];
}

- (void)_startCameraController
{
  if (![(SURedeemCameraViewController *)self state])
  {
    id v3 = [(SURedeemCameraViewController *)self cameraController];
    id v4 = [v3 delegate];

    if (!v4)
    {
      id v5 = [(SURedeemCameraViewController *)self cameraController];
      [v5 setDelegate:self];

      id v6 = [(SURedeemCameraViewController *)self cameraController];
      [v6 startSession];
    }
  }
}

- (void)_stopCameraController
{
  uint64_t v3 = [(SURedeemCameraViewController *)self cameraController];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(SURedeemCameraViewController *)self cameraController];
    id v6 = [v5 delegate];

    if (v6)
    {
      id v7 = [(SURedeemCameraViewController *)self cameraController];
      [v7 setDelegate:0];

      id v8 = [(SURedeemCameraViewController *)self cameraController];
      [v8 cancel];
    }
  }
}

- (void)_hideOverlay
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__SURedeemCameraViewController__hideOverlay__block_invoke;
  v3[3] = &unk_2648123D0;
  v3[4] = self;
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __44__SURedeemCameraViewController__hideOverlay__block_invoke_2;
  v2[3] = &unk_2648131A8;
  v2[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v3 animations:v2 completion:0.5];
}

void __44__SURedeemCameraViewController__hideOverlay__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) overlayView];
  [v1 setAlpha:0.0];
}

void __44__SURedeemCameraViewController__hideOverlay__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) overlayView];
  [v1 setHidden:1];
}

- (void)_showOverlay
{
  uint64_t v3 = [(SURedeemCameraViewController *)self overlayView];
  [v3 setHidden:0];

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__SURedeemCameraViewController__showOverlay__block_invoke;
  v4[3] = &unk_2648123D0;
  v4[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v4 animations:0.5];
}

void __44__SURedeemCameraViewController__showOverlay__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) overlayView];
  [v1 setAlpha:0.4];
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  if ([(SURedeemCameraViewController *)self state] == 1) {
    [(SURedeemCameraViewController *)self setState:0];
  }
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)codeRedeemerControllerDidEndWithCode:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__SURedeemCameraViewController_codeRedeemerControllerDidEndWithCode_error___block_invoke;
  block[3] = &unk_2648122B8;
  id v11 = v7;
  id v12 = v6;
  id v13 = self;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __75__SURedeemCameraViewController_codeRedeemerControllerDidEndWithCode_error___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) || !*(void *)(a1 + 40))
  {
    [*(id *)(a1 + 48) _presentCameraErrorAlert];
    id v2 = *(void **)(a1 + 48);
    return [v2 _recognitionError];
  }
  else
  {
    id v4 = [*(id *)(a1 + 48) codeTextField];
    [v4 setText:*(void *)(a1 + 40)];

    uint64_t v6 = *(void *)(a1 + 40);
    id v5 = *(void **)(a1 + 48);
    return [v5 _detectedCode:v6];
  }
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SURedeemCameraViewController;
  [(SURedeemCameraViewController *)&v4 dealloc];
}

- (void)_detectedCode:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(SURedeemCameraViewController *)self codeHandler];

  if (v4)
  {
    id v5 = [(SURedeemCameraViewController *)self codeHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (void)_dismissKeyboard
{
  id v2 = [(SURedeemCameraViewController *)self view];
  [v2 endEditing:1];
}

- (void)_layoutCodeTextField
{
  uint64_t v3 = [(SURedeemCameraViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  if ([(SURedeemCameraViewController *)self state] == 1)
  {
    double v8 = 44.0;
  }
  else
  {
    id v9 = [(SURedeemCameraViewController *)self view];
    [v9 safeAreaInsets];
    double v8 = v10 + 44.0;
  }
  id v11 = [(SURedeemCameraViewController *)self codeTextField];
  [(SURedeemCameraViewController *)self keyboardHeight];
  objc_msgSend(v11, "setFrame:", 0.0, v7 - v12 - v8, v5, v8);

  id v14 = [(SURedeemCameraViewController *)self overlayView];
  [(SURedeemCameraViewController *)self keyboardHeight];
  objc_msgSend(v14, "setFrame:", 0.0, 0.0, v5, v7 - v13 - v8);
}

- (void)_layoutCodeTextFieldWithNotification:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  if ([(SURedeemCameraViewController *)self state] == 1)
  {
    double v6 = [v4 userInfo];
    double v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F1D428]];
    [v7 CGRectValue];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v5 = v14;

    if (![(SURedeemCameraViewController *)self ignoreDefaultKeyboardNotifications])
    {
      objc_super v15 = [(SURedeemCameraViewController *)self view];
      id v16 = [(SURedeemCameraViewController *)self view];
      v17 = [v16 window];
      objc_msgSend(v15, "convertRect:fromView:", v17, v9, v11, v13, v5);
      double v11 = v18;
      double v5 = v19;
    }
    v20 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v21 = [v20 userInterfaceIdiom];

    if (v21 == 1)
    {
      v22 = [(SURedeemCameraViewController *)self view];
      [v22 bounds];
      double v5 = v23 - v11;
    }
  }
  [(SURedeemCameraViewController *)self setKeyboardHeight:fmax(v5, 0.0)];
  v24 = [v4 userInfo];
  v25 = [v24 valueForKey:*MEMORY[0x263F1D3F0]];
  uint64_t v26 = (int)[v25 intValue];

  v27 = [v4 userInfo];
  v28 = [v27 valueForKey:*MEMORY[0x263F1D3F8]];
  [v28 floatValue];
  double v30 = v29;

  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __69__SURedeemCameraViewController__layoutCodeTextFieldWithNotification___block_invoke;
  v31[3] = &unk_2648123D0;
  v31[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v26 delay:v31 options:0 animations:v30 completion:0.0];
}

uint64_t __69__SURedeemCameraViewController__layoutCodeTextFieldWithNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutCodeTextField];
}

- (void)_presentCameraErrorAlert
{
  [(SURedeemCameraViewController *)self _pauseCamera];
  uint64_t v3 = (void *)MEMORY[0x263F1C3F8];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v5 = [v4 localizedStringForKey:@"REDEEM_CAMERA_ERROR_TITLE" value:&stru_26DB8C5F8 table:0];
  double v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v7 = [v6 localizedStringForKey:@"REDEEM_CAMERA_ERROR_MESSAGE" value:&stru_26DB8C5F8 table:0];
  double v8 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  objc_initWeak(&location, self);
  double v9 = (void *)MEMORY[0x263F1C3F0];
  double v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v11 = [v10 localizedStringForKey:@"OK" value:&stru_26DB8C5F8 table:0];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  objc_super v15 = __56__SURedeemCameraViewController__presentCameraErrorAlert__block_invoke;
  id v16 = &unk_2648131D0;
  objc_copyWeak(&v17, &location);
  double v12 = [v9 actionWithTitle:v11 style:0 handler:&v13];

  objc_msgSend(v8, "addAction:", v12, v13, v14, v15, v16);
  [(SURedeemCameraViewController *)self presentViewController:v8 animated:1 completion:0];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __56__SURedeemCameraViewController__presentCameraErrorAlert__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resumeCamera];
}

- (void)_updateState
{
  if (![(SURedeemCameraViewController *)self state])
  {
    [(SURedeemCameraViewController *)self _stopAcitivityIndicator];
    [(SURedeemCameraViewController *)self _dismissKeyboard];
    [(SURedeemCameraViewController *)self _startCameraController];
    [(SURedeemCameraViewController *)self _hideOverlay];
    id v4 = [(SURedeemCameraViewController *)self codeTextField];
LABEL_7:
    double v5 = v4;
    uint64_t v6 = 1;
    goto LABEL_8;
  }
  if ([(SURedeemCameraViewController *)self state] != 2)
  {
    if ([(SURedeemCameraViewController *)self state] != 1) {
      goto LABEL_9;
    }
    [(SURedeemCameraViewController *)self _stopAcitivityIndicator];
    [(SURedeemCameraViewController *)self _stopCameraController];
    [(SURedeemCameraViewController *)self _showOverlay];
    id v4 = [(SURedeemCameraViewController *)self overlayView];
    goto LABEL_7;
  }
  [(SURedeemCameraViewController *)self _startActivityIndicator];
  [(SURedeemCameraViewController *)self _stopCameraController];
  [(SURedeemCameraViewController *)self _showOverlay];
  [(SURedeemCameraViewController *)self _dismissKeyboard];
  uint64_t v3 = [(SURedeemCameraViewController *)self overlayView];
  [v3 setUserInteractionEnabled:0];

  id v4 = [(SURedeemCameraViewController *)self codeTextField];
  double v5 = v4;
  uint64_t v6 = 0;
LABEL_8:
  [v4 setUserInteractionEnabled:v6];

LABEL_9:

  [(SURedeemCameraViewController *)self _updateNavigationItemAnimated];
}

- (void)_updateNavigationItemAnimated
{
  if (![(SURedeemCameraViewController *)self state])
  {
    id v5 = [(SURedeemCameraViewController *)self navigationItem];
    uint64_t v3 = [(SURedeemCameraViewController *)self toggleCameraBarButton];
LABEL_7:
    id v4 = (void *)v3;
    [v5 setRightBarButtonItem:v3];

    goto LABEL_8;
  }
  if ([(SURedeemCameraViewController *)self state] != 2)
  {
    if ([(SURedeemCameraViewController *)self state] != 1) {
      return;
    }
    id v5 = [(SURedeemCameraViewController *)self navigationItem];
    uint64_t v3 = [(SURedeemCameraViewController *)self redeemBarButton];
    goto LABEL_7;
  }
  id v5 = [(SURedeemCameraViewController *)self navigationItem];
  [v5 setRightBarButtonItem:0];
LABEL_8:
}

- (BOOL)ignoreDefaultKeyboardNotifications
{
  return self->_ignoreDefaultKeyboardNotifications;
}

- (id)codeHandler
{
  return self->_codeHandler;
}

- (void)setCodeHandler:(id)a3
{
}

- (SUCodeRedeemerController)cameraController
{
  return self->_cameraController;
}

- (void)setCameraController:(id)a3
{
}

- (double)keyboardHeight
{
  return self->_keyboardHeight;
}

- (void)setKeyboardHeight:(double)a3
{
  self->_keyboardHeight = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (UIBarButtonItem)redeemBarButton
{
  return self->_redeemBarButton;
}

- (void)setRedeemBarButton:(id)a3
{
}

- (SURedeemCodeTextField)codeTextField
{
  return self->_codeTextField;
}

- (void)setCodeTextField:(id)a3
{
}

- (UIBarButtonItem)toggleCameraBarButton
{
  return self->_toggleCameraBarButton;
}

- (void)setToggleCameraBarButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleCameraBarButton, 0);
  objc_storeStrong((id *)&self->_codeTextField, 0);
  objc_storeStrong((id *)&self->_redeemBarButton, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_cameraController, 0);

  objc_storeStrong(&self->_codeHandler, 0);
}

@end