@interface SUUIRedeemCameraViewController
- (BOOL)_enabled;
- (BOOL)disablesAutomaticKeyboardDismissal;
- (NSString)initialCode;
- (SUUIRedeemCameraViewController)initWithRedeemCategory:(int64_t)a3;
- (SUUIRedeemCameraViewController)initWithRedeemCategoryFullscreen:(int64_t)a3;
- (SUUIRedeemCameraViewControllerDelegate)delegate;
- (SUUIRedeemViewCameraOverrideDelegate)cameraOverrideDelegate;
- (id)contentScrollView;
- (id)redeemerViewForSUUIRedeemCameraView:(id)a3;
- (int64_t)category;
- (void)SUUIRedeemCameraView:(id)a3 textFieldDidChange:(id)a4;
- (void)SUUIRedeemCameraView:(id)a3 textFieldDidRedeem:(id)a4;
- (void)SUUIRedeemPreflightImagesDidLoad:(id)a3;
- (void)_cameraRedeemDidFinish:(id)a3 error:(id)a4;
- (void)_cancelAction:(id)a3;
- (void)_flipAction:(id)a3;
- (void)_performRedeemOperationWithCode:(id)a3 cameraRecognized:(BOOL)a4 allowOverride:(BOOL)a5 completion:(id)a6;
- (void)_redeemAction:(id)a3;
- (void)_redeemDidFinish:(id)a3 error:(id)a4;
- (void)_setEnabled:(BOOL)a3;
- (void)_updateRightBarButtonItemsForRedeemInputState:(int64_t)a3;
- (void)cancelRedeemerViewForSUUIRedeemCameraView:(id)a3;
- (void)codeRedeemerController:(id)a3 didEndWithInfo:(id)a4;
- (void)codeRedeemerControllerDidDisplayMessage:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)performRedeemOperationWithCode:(id)a3 cameraRecognized:(BOOL)a4 completion:(id)a5;
- (void)presentFullScreenCameraViewForSUUIRedeemCameraView:(id)a3;
- (void)redeemCameraViewController:(id)a3 didFinishWithRedeem:(id)a4;
- (void)setCameraOverrideDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInitialCode:(id)a3;
- (void)showITunesPassLearnMoreForSUUIRedeemCameraView:(id)a3;
- (void)startRedeemerViewForSUUIRedeemCameraView:(id)a3;
@end

@implementation SUUIRedeemCameraViewController

- (SUUIRedeemCameraViewController)initWithRedeemCategory:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIRedeemCameraViewController;
  v4 = [(SUUIRedeemCameraViewController *)&v7 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    v4->_category = a3;
    v4->_fullscreen = 0;
    [(SUUIRedeemCameraViewController *)v4 setEdgesForExtendedLayout:0];
  }
  return v5;
}

- (SUUIRedeemCameraViewController)initWithRedeemCategoryFullscreen:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIRedeemCameraViewController;
  result = [(SUUIRedeemCameraViewController *)&v5 initWithNibName:0 bundle:0];
  if (result)
  {
    result->_category = a3;
    result->_fullscreen = 1;
  }
  return result;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  v4 = [(SUUIRedeemStepViewController *)self configuration];
  [v3 removeObserver:self name:0x270508410 object:v4];

  v5.receiver = self;
  v5.super_class = (Class)SUUIRedeemCameraViewController;
  [(SUUIRedeemCameraViewController *)&v5 dealloc];
}

- (void)performRedeemOperationWithCode:(id)a3 cameraRecognized:(BOOL)a4 completion:(id)a5
{
}

- (void)loadView
{
  id v34 = [(SUUIRedeemStepViewController *)self clientContext];
  v3 = [(SUUIRedeemCameraViewController *)self navigationItem];
  [v3 setHidesBackButton:1];
  id v4 = objc_alloc_init(MEMORY[0x263F824A8]);
  [v4 setAction:sel__cancelAction_];
  [v4 setTarget:self];
  if (v34) {
    [v34 localizedStringForKey:@"CAMERA_REDEEM_CANCEL_BUTTON" inTable:@"Redeem"];
  }
  else {
  objc_super v5 = +[SUUIClientContext localizedStringForKey:@"CAMERA_REDEEM_CANCEL_BUTTON" inBundles:0 inTable:@"Redeem"];
  }
  [v4 setTitle:v5];

  [v3 setLeftBarButtonItem:v4];
  v6 = (UIBarButtonItem *)objc_alloc_init(MEMORY[0x263F824A8]);
  redeemButton = self->_redeemButton;
  self->_redeemButton = v6;

  [(UIBarButtonItem *)self->_redeemButton setAction:sel__redeemAction_];
  [(UIBarButtonItem *)self->_redeemButton setTarget:self];
  v8 = self->_redeemButton;
  if (v34) {
    [v34 localizedStringForKey:@"CAMERA_REDEEM_REDEEM_BUTTON" inTable:@"Redeem"];
  }
  else {
  v9 = +[SUUIClientContext localizedStringForKey:@"CAMERA_REDEEM_REDEEM_BUTTON" inBundles:0 inTable:@"Redeem"];
  }
  -[UIBarButtonItem setTitle:](v8, "setTitle:", v9, v3);

  [(UIBarButtonItem *)self->_redeemButton setStyle:2];
  [(UIBarButtonItem *)self->_redeemButton setEnabled:[(NSString *)self->_initialCode length] != 0];
  v10 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:2];
  [v10 startAnimating];
  v11 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v10];
  activityBarButtonItem = self->_activityBarButtonItem;
  self->_activityBarButtonItem = v11;

  if ((unint64_t)[MEMORY[0x263F37E18] isCRCodeRedeemerAvailable] >= 2)
  {
    v13 = (UIBarButtonItem *)objc_alloc_init(MEMORY[0x263F824A8]);
    flipButton = self->_flipButton;
    self->_flipButton = v13;

    [(UIBarButtonItem *)self->_flipButton setAction:sel__flipAction_];
    [(UIBarButtonItem *)self->_flipButton setTarget:self];
    v15 = self->_flipButton;
    v16 = (void *)MEMORY[0x263F827E8];
    v17 = SUUIBundle();
    v18 = [v16 imageNamed:@"CameraFlip" inBundle:v17];
    [(UIBarButtonItem *)v15 setImage:v18];
  }
  [(SUUIRedeemCameraViewController *)self _updateRightBarButtonItemsForRedeemInputState:1];
  v19 = [(SUUIRedeemStepViewController *)self configuration];
  v20 = [v19 landingImage];

  v21 = [MEMORY[0x263F08A00] defaultCenter];
  v22 = [(SUUIRedeemStepViewController *)self configuration];
  [v21 addObserver:self selector:sel_SUUIRedeemPreflightImagesDidLoad_ name:0x270508410 object:v22];

  if (self->_fullscreen)
  {
    v23 = [[SUUIFullscreenRedeemCameraView alloc] initWithClientContext:v34];
    v24 = [(SUUIRedeemStepViewController *)self clientContext];
    v25 = v24;
    if (v24) {
      [v24 localizedStringForKey:@"CAMERA_REDEEM_TITLE" inTable:@"Redeem"];
    }
    else {
    v29 = +[SUUIClientContext localizedStringForKey:@"CAMERA_REDEEM_TITLE" inBundles:0 inTable:@"Redeem"];
    }
    v28 = v33;
    [(SUUIRedeemCameraViewController *)self setTitle:v29];
  }
  else
  {
    v26 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v27 = [v26 userInterfaceIdiom];

    if ((v27 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v23 = [[SUUIIPadRedeemCameraView alloc] initWithClientContext:v34];
      v28 = v33;
    }
    else
    {
      v23 = [[SUUIRedeemCameraView alloc] initWithClientContext:v34];
      v28 = v33;
      if ([(SUUIRedeemStepViewController *)self shouldShowPassbookLearnMore])
      {
        v31 = [(SUUIRedeemStepViewController *)self configuration];
        v32 = [v31 ITunesPassConfiguration];
        [(SUUIFullscreenRedeemCameraView *)v23 setITunesPassConfiguration:v32];
      }
    }
  }
  v30 = [MEMORY[0x263F825C8] whiteColor];
  [(SUUIFullscreenRedeemCameraView *)v23 setBackgroundColor:v30];

  [(SUUIFullscreenRedeemCameraView *)v23 setText:self->_initialCode];
  [(SUUIFullscreenRedeemCameraView *)v23 setImage:v20];
  [(SUUIFullscreenRedeemCameraView *)v23 setDelegate:self];
  [(SUUIFullscreenRedeemCameraView *)v23 start];
  [(SUUIRedeemCameraViewController *)self setView:v23];
}

- (BOOL)disablesAutomaticKeyboardDismissal
{
  return 0;
}

- (id)contentScrollView
{
  return 0;
}

- (void)_cancelAction:(id)a3
{
  id v4 = [(SUUIRedeemCameraViewController *)self parentViewController];
  id v5 = v4;
  if (!v4) {
    id v4 = self;
  }
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)_redeemAction:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIRedeemCameraViewController *)self view];
  v6 = [v5 text];

  [(SUUIRedeemCameraViewController *)self _updateRightBarButtonItemsForRedeemInputState:2];
  [(SUUIRedeemCameraViewController *)self _setEnabled:0];
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__SUUIRedeemCameraViewController__redeemAction___block_invoke;
  v7[3] = &unk_265401B18;
  objc_copyWeak(&v8, &location);
  [(SUUIRedeemCameraViewController *)self _performRedeemOperationWithCode:v6 cameraRecognized:0 allowOverride:1 completion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __48__SUUIRedeemCameraViewController__redeemAction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _redeemDidFinish:v6 error:v5];
}

- (void)_flipAction:(id)a3
{
}

- (void)cancelRedeemerViewForSUUIRedeemCameraView:(id)a3
{
  [(SUUIRedeemCameraViewController *)self _updateRightBarButtonItemsForRedeemInputState:1];
  camera = self->_camera;
  [(CRCodeRedeemerController *)camera cancel];
}

- (void)presentFullScreenCameraViewForSUUIRedeemCameraView:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3);
  uint64_t v5 = [v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1
    && ([(SUUIRedeemCameraViewController *)self cameraOverrideDelegate],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = objc_opt_respondsToSelector(),
        v6,
        (v7 & 1) != 0))
  {
    id v8 = [(SUUIRedeemCameraViewController *)self cameraOverrideDelegate];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __85__SUUIRedeemCameraViewController_presentFullScreenCameraViewForSUUIRedeemCameraView___block_invoke;
    v14[3] = &unk_265401B40;
    v14[4] = self;
    [v8 overrideIPadRedeemCamera:self completion:v14];
  }
  else
  {
    v13 = [[SUUIRedeemViewControllerLegacy alloc] initWithRedeemCategory:0];
    v9 = [(SUUIRedeemCameraViewController *)self delegate];
    [(SUUIRedeemViewControllerLegacy *)v13 setCameraDelegate:v9];

    [(SUUIRedeemViewControllerLegacy *)v13 setModalPresentationStyle:0];
    v10 = [(SUUIRedeemStepViewController *)self clientContext];
    [(SUUIRedeemViewControllerLegacy *)v13 setClientContext:v10];

    v11 = [(SUUIRedeemStepViewController *)self operationQueue];
    [(SUUIRedeemViewControllerLegacy *)v13 setOperationQueue:v11];

    [(SUUIRedeemViewControllerLegacy *)v13 setCameraRedeemVisible:1];
    v12 = [(SUUIRedeemStepViewController *)self configuration];
    [(SUUIRedeemViewControllerLegacy *)v13 setRedeemConfiguration:v12];

    [(SUUIRedeemViewControllerLegacy *)v13 setShouldPerformInitialOperationOnAppear:0];
    [(SUUIRedeemCameraViewController *)self presentViewController:v13 animated:1 completion:0];
  }
}

uint64_t __85__SUUIRedeemCameraViewController_presentFullScreenCameraViewForSUUIRedeemCameraView___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) redeemCameraViewController:0 didFinishWithRedeem:a2];
}

- (id)redeemerViewForSUUIRedeemCameraView:(id)a3
{
  [(SUUIRedeemCameraViewController *)self _updateRightBarButtonItemsForRedeemInputState:0];
  if (!self->_camera)
  {
    id v4 = (CRCodeRedeemerController *)objc_alloc_init(MEMORY[0x263F37E18]);
    camera = self->_camera;
    self->_camera = v4;

    [(SUUIRedeemCameraViewController *)self addChildViewController:self->_camera];
    [(CRCodeRedeemerController *)self->_camera setDelegate:self];
  }
  id v6 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    id v8 = [(SUUIRedeemStepViewController *)self clientContext];
    v9 = v8;
    if (v8) {
      [v8 localizedStringForKey:@"CAMERA_REDEEM_TITLE" inTable:@"Redeem"];
    }
    else {
    v10 = +[SUUIClientContext localizedStringForKey:@"CAMERA_REDEEM_TITLE" inBundles:0 inTable:@"Redeem"];
    }
    [(SUUIRedeemCameraViewController *)self setTitle:v10];
  }
  v11 = self->_camera;
  return (id)[(CRCodeRedeemerController *)v11 view];
}

- (void)showITunesPassLearnMoreForSUUIRedeemCameraView:(id)a3
{
  id v8 = objc_alloc_init(SUUIRedeemITunesPassLearnMoreViewController);
  id v4 = [(SUUIRedeemStepViewController *)self clientContext];
  [(SUUIRedeemStepViewController *)v8 setClientContext:v4];

  uint64_t v5 = [(SUUIRedeemStepViewController *)self configuration];
  [(SUUIRedeemStepViewController *)v8 setConfiguration:v5];

  id v6 = [(SUUIRedeemStepViewController *)self operationQueue];
  [(SUUIRedeemStepViewController *)v8 setOperationQueue:v6];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v8];
  [(SUUIRedeemCameraViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)SUUIRedeemCameraView:(id)a3 textFieldDidChange:(id)a4
{
  id v8 = a4;
  BOOL v5 = [(SUUIRedeemCameraViewController *)self _enabled];
  redeemButton = self->_redeemButton;
  BOOL v7 = v5 && [v8 length] != 0;
  [(UIBarButtonItem *)redeemButton setEnabled:v7];
}

- (void)SUUIRedeemCameraView:(id)a3 textFieldDidRedeem:(id)a4
{
}

- (void)startRedeemerViewForSUUIRedeemCameraView:(id)a3
{
  [(SUUIRedeemCameraViewController *)self _updateRightBarButtonItemsForRedeemInputState:0];
  dispatch_time_t v4 = dispatch_time(0, 50000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__SUUIRedeemCameraViewController_startRedeemerViewForSUUIRedeemCameraView___block_invoke;
  block[3] = &unk_265400980;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

uint64_t __75__SUUIRedeemCameraViewController_startRedeemerViewForSUUIRedeemCameraView___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1016) startSession];
}

- (void)redeemCameraViewController:(id)a3 didFinishWithRedeem:(id)a4
{
  id v5 = a4;
  [(SUUIRedeemCameraViewController *)self dismissViewControllerAnimated:1 completion:0];
  v10 = [[SUUIRedeemResultsViewController alloc] initWithRedeem:v5];

  id v6 = [(SUUIRedeemStepViewController *)self clientContext];
  [(SUUIRedeemStepViewController *)v10 setClientContext:v6];

  [(SUUIRedeemResultsViewController *)v10 setRedeemCategory:self->_category];
  BOOL v7 = [(SUUIRedeemStepViewController *)self operationQueue];
  [(SUUIRedeemStepViewController *)v10 setOperationQueue:v7];

  id v8 = [(SUUIRedeemStepViewController *)self configuration];
  [(SUUIRedeemStepViewController *)v10 setConfiguration:v8];

  v9 = [(SUUIRedeemCameraViewController *)self navigationController];
  [v9 pushViewController:v10 animated:1];
}

- (void)codeRedeemerController:(id)a3 didEndWithInfo:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__SUUIRedeemCameraViewController_codeRedeemerController_didEndWithInfo___block_invoke;
  v7[3] = &unk_265400890;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __72__SUUIRedeemCameraViewController_codeRedeemerController_didEndWithInfo___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) clientContext];
  v3 = [*(id *)(a1 + 40) valueForKey:*MEMORY[0x263F37DD0]];
  uint64_t v4 = [*(id *)(a1 + 40) valueForKey:*MEMORY[0x263F37DC8]];
  id v5 = (void *)v4;
  if (!v3)
  {
    if (!v4) {
      goto LABEL_5;
    }
LABEL_8:
    BOOL v7 = [*(id *)(a1 + 32) view];
    [v7 setText:v5];

    [*(id *)(a1 + 32) _setEnabled:0];
    [*(id *)(*(void *)(a1 + 32) + 1016) showMessage:0 color:0 style:1 duration:0.0];
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v8 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __72__SUUIRedeemCameraViewController_codeRedeemerController_didEndWithInfo___block_invoke_2;
    v11[3] = &unk_265401B18;
    objc_copyWeak(&v12, &location);
    [v8 _performRedeemOperationWithCode:v5 cameraRecognized:1 allowOverride:1 completion:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    goto LABEL_11;
  }
  if ([v3 code] != 1 && v5 && objc_msgSend(v3, "code") != 2) {
    goto LABEL_8;
  }
LABEL_5:
  id v6 = *(void **)(*(void *)(a1 + 32) + 1016);
  if (v2) {
    [v2 localizedStringForKey:@"CAMERA_REDEEM_UNABLE_TO_READ_CODE" inTable:@"Redeem"];
  }
  else {
  v9 = +[SUUIClientContext localizedStringForKey:@"CAMERA_REDEEM_UNABLE_TO_READ_CODE" inBundles:0 inTable:@"Redeem"];
  }
  v10 = [MEMORY[0x263F825C8] redColor];
  [v6 showMessage:v9 color:v10 style:3 duration:1.0];

LABEL_11:
}

void __72__SUUIRedeemCameraViewController_codeRedeemerController_didEndWithInfo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _cameraRedeemDidFinish:v6 error:v5];
}

- (void)codeRedeemerControllerDidDisplayMessage:(id)a3
{
  id v4 = a3;
  if (self->_successfulRedeem)
  {
    id v12 = v4;
    if (self->_fullscreen
      && (id v5 = objc_loadWeakRetained((id *)&self->_delegate),
          char v6 = objc_opt_respondsToSelector(),
          v5,
          (v6 & 1) != 0))
    {
      id WeakRetained = (SUUIRedeemResultsViewController *)objc_loadWeakRetained((id *)&self->_delegate);
      [(SUUIRedeemResultsViewController *)WeakRetained redeemCameraViewController:self didFinishWithRedeem:self->_successfulRedeem];
    }
    else
    {
      id WeakRetained = [[SUUIRedeemResultsViewController alloc] initWithRedeem:self->_successfulRedeem];
      id v8 = [(SUUIRedeemStepViewController *)self clientContext];
      [(SUUIRedeemStepViewController *)WeakRetained setClientContext:v8];

      [(SUUIRedeemResultsViewController *)WeakRetained setRedeemCategory:self->_category];
      v9 = [(SUUIRedeemStepViewController *)self operationQueue];
      [(SUUIRedeemStepViewController *)WeakRetained setOperationQueue:v9];

      v10 = [(SUUIRedeemStepViewController *)self configuration];
      [(SUUIRedeemStepViewController *)WeakRetained setConfiguration:v10];

      v11 = [(SUUIRedeemCameraViewController *)self navigationController];
      [v11 pushViewController:WeakRetained animated:1];

      UIKeyboardOrderOutAutomatic();
    }

    id v4 = v12;
  }
}

- (void)SUUIRedeemPreflightImagesDidLoad:(id)a3
{
  id v6 = [(SUUIRedeemCameraViewController *)self view];
  id v4 = [(SUUIRedeemStepViewController *)self configuration];
  id v5 = [v4 landingImage];
  [v6 setImage:v5];
}

- (void)_performRedeemOperationWithCode:(id)a3 cameraRecognized:(BOOL)a4 allowOverride:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v16 = a3;
  id v10 = a6;
  if (v7
    && ([(SUUIRedeemCameraViewController *)self delegate],
        v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = objc_opt_respondsToSelector(),
        v11,
        (v12 & 1) != 0))
  {
    v13 = [(SUUIRedeemCameraViewController *)self delegate];
    [(SUUIRedeemOperation *)v13 overrideRedeemOperationWithCode:v16 cameraRecognized:v8 completion:v10];
  }
  else
  {
    v13 = [[SUUIRedeemOperation alloc] initWithCode:v16];
    [(SUUIRedeemOperation *)v13 setCameraRecognized:v8];
    v14 = [(SUUIRedeemStepViewController *)self clientContext];
    [(SUUIRedeemOperation *)v13 setClientContext:v14];

    [(SUUIRedeemOperation *)v13 setResultBlock:v10];
    v15 = [(SUUIRedeemStepViewController *)self operationQueue];
    [v15 addOperation:v13];
  }
}

- (void)_setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SUUIRedeemCameraViewController *)self view];
  id v8 = v5;
  if (v3)
  {
    [v5 setEnabled:1];
    redeemButton = self->_redeemButton;
    BOOL v7 = [v8 text];
    -[UIBarButtonItem setEnabled:](redeemButton, "setEnabled:", [v7 length] != 0);
  }
  else
  {
    [v5 setEnabled:0];
    [(UIBarButtonItem *)self->_redeemButton setEnabled:0];
  }
}

- (BOOL)_enabled
{
  v2 = [(SUUIRedeemCameraViewController *)self view];
  char v3 = [v2 isEnabled];

  return v3;
}

- (void)_cameraRedeemDidFinish:(id)a3 error:(id)a4
{
  id v15 = a3;
  id v7 = a4;
  if (v15)
  {
    camera = self->_camera;
    v9 = [MEMORY[0x263F825C8] greenColor];
    [(CRCodeRedeemerController *)camera showMessage:0 color:v9 style:2 duration:1.0];

    objc_storeStrong((id *)&self->_successfulRedeem, a3);
  }
  else
  {
    [(SUUIRedeemCameraViewController *)self _setEnabled:1];
    if (v7
      && ([v7 userInfo],
          id v10 = objc_claimAutoreleasedReturnValue(),
          [v10 valueForKey:@"hideError"],
          v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          !v11))
    {
      char v12 = self->_camera;
      v13 = [v7 localizedDescription];
      v14 = [MEMORY[0x263F825C8] redColor];
      [(CRCodeRedeemerController *)v12 showMessage:v13 color:v14 style:3 duration:1.0];
    }
    else
    {
      [(CRCodeRedeemerController *)self->_camera startSession];
    }
  }
  [(SUUIRedeemCameraViewController *)self _updateRightBarButtonItemsForRedeemInputState:0];
}

- (void)_redeemDidFinish:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    UIKeyboardOrderOutAutomatic();
    v9 = [[SUUIRedeemResultsViewController alloc] initWithRedeem:v6];
    id v10 = [(SUUIRedeemStepViewController *)self clientContext];
    [(SUUIRedeemStepViewController *)v9 setClientContext:v10];

    [(SUUIRedeemResultsViewController *)v9 setRedeemCategory:self->_category];
    v11 = [(SUUIRedeemStepViewController *)self operationQueue];
    [(SUUIRedeemStepViewController *)v9 setOperationQueue:v11];

    char v12 = [(SUUIRedeemStepViewController *)self configuration];
    [(SUUIRedeemStepViewController *)v9 setConfiguration:v12];

    v13 = [(SUUIRedeemCameraViewController *)self navigationController];
    [v13 pushViewController:v9 animated:1];
  }
  else
  {
    if (!v7
      || ([v7 userInfo],
          v14 = objc_claimAutoreleasedReturnValue(),
          [v14 valueForKey:@"hideError"],
          id v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          v14,
          v15))
    {
      [(SUUIRedeemCameraViewController *)self _setEnabled:1];
      v9 = [(SUUIRedeemCameraViewController *)self view];
      [(SUUIRedeemResultsViewController *)v9 showKeyboard];
      goto LABEL_7;
    }
    id v16 = [(SUUIRedeemStepViewController *)self clientContext];
    v9 = v16;
    v17 = (void *)MEMORY[0x263F82418];
    if (v16) {
      [(SUUIRedeemResultsViewController *)v16 localizedStringForKey:@"CAMERA_REDEEM_ERROR_TITLE" inTable:@"Redeem"];
    }
    else {
    v18 = +[SUUIClientContext localizedStringForKey:@"CAMERA_REDEEM_ERROR_TITLE" inBundles:0 inTable:@"Redeem"];
    }
    v19 = [v8 localizedDescription];
    v13 = [v17 alertControllerWithTitle:v18 message:v19 preferredStyle:1];

    v20 = (void *)MEMORY[0x263F82400];
    if (v9) {
      [(SUUIRedeemResultsViewController *)v9 localizedStringForKey:@"CAMERA_REDEEM_OK_BUTTON" inTable:@"Redeem"];
    }
    else {
    v21 = +[SUUIClientContext localizedStringForKey:@"CAMERA_REDEEM_OK_BUTTON" inBundles:0 inTable:@"Redeem"];
    }
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __57__SUUIRedeemCameraViewController__redeemDidFinish_error___block_invoke;
    v26 = &unk_265401B68;
    id v27 = v8;
    v28 = self;
    v22 = [v20 actionWithTitle:v21 style:0 handler:&v23];
    objc_msgSend(v13, "addAction:", v22, v23, v24, v25, v26);

    [(SUUIRedeemCameraViewController *)self presentViewController:v13 animated:1 completion:0];
  }

LABEL_7:
  [(SUUIRedeemCameraViewController *)self _updateRightBarButtonItemsForRedeemInputState:1];
}

void __57__SUUIRedeemCameraViewController__redeemDidFinish_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) code];
  char v3 = *(void **)(a1 + 40);
  if (v2 == 9518)
  {
    id v4 = [v3 redeemStepDelegate];
    [v4 redeemStepViewControllerShouldValidateNationalID:*(void *)(a1 + 40)];
  }
  else
  {
    [v3 _setEnabled:1];
    id v4 = [*(id *)(a1 + 40) view];
    [v4 showKeyboard];
  }
}

- (void)_updateRightBarButtonItemsForRedeemInputState:(int64_t)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  if (a3 == 2)
  {
    id v4 = [(SUUIRedeemCameraViewController *)self navigationItem];
    activityBarButtonItem = self->_activityBarButtonItem;
    v10[0] = self->_redeemButton;
    v10[1] = activityBarButtonItem;
    id v5 = (void *)MEMORY[0x263EFF8C0];
    p_redeemButton = (UIBarButtonItem **)v10;
    uint64_t v8 = 2;
  }
  else
  {
    if (a3 == 1)
    {
      id v4 = [(SUUIRedeemCameraViewController *)self navigationItem];
      redeemButton = self->_redeemButton;
      id v5 = (void *)MEMORY[0x263EFF8C0];
      p_redeemButton = &redeemButton;
    }
    else
    {
      if (a3) {
        return;
      }
      id v4 = [(SUUIRedeemCameraViewController *)self navigationItem];
      v12[0] = self->_flipButton;
      id v5 = (void *)MEMORY[0x263EFF8C0];
      p_redeemButton = (UIBarButtonItem **)v12;
    }
    uint64_t v8 = 1;
  }
  v9 = [v5 arrayWithObjects:p_redeemButton count:v8];
  [v4 setRightBarButtonItems:v9];
}

- (int64_t)category
{
  return self->_category;
}

- (SUUIRedeemCameraViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIRedeemCameraViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)initialCode
{
  return self->_initialCode;
}

- (void)setInitialCode:(id)a3
{
}

- (SUUIRedeemViewCameraOverrideDelegate)cameraOverrideDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraOverrideDelegate);
  return (SUUIRedeemViewCameraOverrideDelegate *)WeakRetained;
}

- (void)setCameraOverrideDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cameraOverrideDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_successfulRedeem, 0);
  objc_storeStrong((id *)&self->_initialCode, 0);
  objc_storeStrong((id *)&self->_activityBarButtonItem, 0);
  objc_storeStrong((id *)&self->_flipButton, 0);
  objc_storeStrong((id *)&self->_redeemButton, 0);
  objc_storeStrong((id *)&self->_camera, 0);
}

@end