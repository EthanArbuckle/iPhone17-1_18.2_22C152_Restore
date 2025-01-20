@interface SUCodeRedeemerController
+ (BOOL)cameraSupported;
- (BOOL)cameraflipDirection;
- (CRCodeRedeemerController)codeRedeemerController;
- (SUCodeRedeemerController)init;
- (SUCodeRedeemerControllerDelegate)delegate;
- (UIVisualEffectView)visualEffectView;
- (void)_disableBlur;
- (void)_enableBlur;
- (void)_setChildViewController:(id)a3;
- (void)_setup;
- (void)_setupCodeRedeemerController;
- (void)_setupFlipVisualEffectView;
- (void)cancel;
- (void)codeRedeemerController:(id)a3 didEndWithInfo:(id)a4;
- (void)codeRedeemerControllerDidCancel:(id)a3;
- (void)recognitionError;
- (void)recognitionSuccess;
- (void)setCameraflipDirection:(BOOL)a3;
- (void)setCodeRedeemerController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startSession;
- (void)toggleCameraWithCompletion:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SUCodeRedeemerController

- (SUCodeRedeemerController)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUCodeRedeemerController;
  v2 = [(SUCodeRedeemerController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SUCodeRedeemerController *)v2 _setup];
  }
  return v3;
}

- (void)cancel
{
  id v2 = [(SUCodeRedeemerController *)self codeRedeemerController];
  [v2 cancel];
}

+ (BOOL)cameraSupported
{
  return [MEMORY[0x263F37E18] isCRCodeRedeemerAvailable] != 0;
}

- (void)recognitionError
{
  id v3 = [(SUCodeRedeemerController *)self codeRedeemerController];
  id v2 = [MEMORY[0x263F1C550] redColor];
  [v3 showMessage:0 color:v2 style:3 duration:60.0];
}

- (void)recognitionSuccess
{
  id v3 = [(SUCodeRedeemerController *)self codeRedeemerController];
  id v2 = [MEMORY[0x263F1C550] greenColor];
  [v3 showMessage:0 color:v2 style:2 duration:60.0];
}

- (void)startSession
{
  id v3 = [(SUCodeRedeemerController *)self codeRedeemerController];
  [v3 startSession];

  [(SUCodeRedeemerController *)self _enableBlur];
  objc_initWeak(&location, self);
  dispatch_time_t v4 = dispatch_time(0, 500000000);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__SUCodeRedeemerController_startSession__block_invoke;
  v5[3] = &unk_264812708;
  objc_copyWeak(&v6, &location);
  dispatch_after(v4, MEMORY[0x263EF83A0], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __40__SUCodeRedeemerController_startSession__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _disableBlur];
}

- (void)toggleCameraWithCompletion:(id)a3
{
  id v4 = a3;
  [(SUCodeRedeemerController *)self _enableBlur];
  if ([(SUCodeRedeemerController *)self cameraflipDirection]) {
    uint64_t v5 = 0x100000;
  }
  else {
    uint64_t v5 = 0x200000;
  }
  id v6 = (void *)MEMORY[0x263F1CB60];
  v7 = [(SUCodeRedeemerController *)self view];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __55__SUCodeRedeemerController_toggleCameraWithCompletion___block_invoke;
  v12 = &unk_264814118;
  v13 = self;
  id v14 = v4;
  id v8 = v4;
  [v6 transitionWithView:v7 duration:v5 options:0 animations:&v9 completion:0.3];

  [(SUCodeRedeemerController *)self setCameraflipDirection:[(SUCodeRedeemerController *)self cameraflipDirection] ^ 1];
}

uint64_t __55__SUCodeRedeemerController_toggleCameraWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) codeRedeemerController];
  [v2 toggleCamera];

  [*(id *)(a1 + 32) _disableBlur];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void)_setup
{
  [(SUCodeRedeemerController *)self _setupCodeRedeemerController];

  [(SUCodeRedeemerController *)self _setupFlipVisualEffectView];
}

- (void)_setupCodeRedeemerController
{
  id v3 = objc_alloc_init(MEMORY[0x263F37E18]);
  [v3 setDelegate:self];
  codeRedeemerController = self->_codeRedeemerController;
  self->_codeRedeemerController = (CRCodeRedeemerController *)v3;
}

- (void)_setupFlipVisualEffectView
{
  id v3 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x263F1CB98]);
  [(UIVisualEffectView *)v3 setHidden:1];
  id v4 = [(SUCodeRedeemerController *)self view];
  [v4 addSubview:v3];

  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = v3;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)SUCodeRedeemerController;
  [(SUCodeRedeemerController *)&v4 viewDidLoad];
  id v3 = [(SUCodeRedeemerController *)self codeRedeemerController];
  [(SUCodeRedeemerController *)self _setChildViewController:v3];
}

- (void)viewWillLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)SUCodeRedeemerController;
  [(SUCodeRedeemerController *)&v8 viewWillLayoutSubviews];
  id v3 = [(SUCodeRedeemerController *)self visualEffectView];
  objc_super v4 = [(SUCodeRedeemerController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");

  uint64_t v5 = [(SUCodeRedeemerController *)self codeRedeemerController];
  id v6 = [v5 view];
  v7 = [(SUCodeRedeemerController *)self view];
  [v7 bounds];
  objc_msgSend(v6, "setFrame:");
}

- (void)codeRedeemerController:(id)a3 didEndWithInfo:(id)a4
{
  uint64_t v5 = *MEMORY[0x263F37DC8];
  id v6 = a4;
  id v9 = [v6 valueForKey:v5];
  v7 = [v6 valueForKey:*MEMORY[0x263F37DD0]];

  objc_super v8 = [(SUCodeRedeemerController *)self delegate];
  [v8 codeRedeemerControllerDidEndWithCode:v9 error:v7];
}

- (void)codeRedeemerControllerDidCancel:(id)a3
{
  id v3 = [(SUCodeRedeemerController *)self delegate];
  [v3 codeRedeemerControllerDidCancel];
}

- (void)_disableBlur
{
  objc_initWeak(&location, self);
  id v2 = (void *)MEMORY[0x263F1CB60];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__SUCodeRedeemerController__disableBlur__block_invoke;
  v5[3] = &unk_264812708;
  objc_copyWeak(&v6, &location);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __40__SUCodeRedeemerController__disableBlur__block_invoke_2;
  v3[3] = &unk_264814140;
  objc_copyWeak(&v4, &location);
  [v2 animateWithDuration:v5 animations:v3 completion:0.3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __40__SUCodeRedeemerController__disableBlur__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained visualEffectView];
  [v1 setEffect:0];
}

void __40__SUCodeRedeemerController__disableBlur__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained visualEffectView];
  [v1 setHidden:1];
}

- (void)_enableBlur
{
  id v5 = [MEMORY[0x263F1C480] effectWithStyle:4];
  id v3 = [(SUCodeRedeemerController *)self visualEffectView];
  [v3 setEffect:v5];

  id v4 = [(SUCodeRedeemerController *)self visualEffectView];
  [v4 setHidden:0];
}

- (void)_setChildViewController:(id)a3
{
  id v8 = a3;
  [v8 willMoveToParentViewController:self];
  [(SUCodeRedeemerController *)self addChildViewController:v8];
  id v4 = [(SUCodeRedeemerController *)self view];
  id v5 = [v8 view];
  [v4 addSubview:v5];

  id v6 = [(SUCodeRedeemerController *)self view];
  v7 = [v8 view];
  [v6 sendSubviewToBack:v7];

  [v8 didMoveToParentViewController:self];
}

- (SUCodeRedeemerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SUCodeRedeemerControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)cameraflipDirection
{
  return self->_cameraflipDirection;
}

- (void)setCameraflipDirection:(BOOL)a3
{
  self->_cameraflipDirection = a3;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (CRCodeRedeemerController)codeRedeemerController
{
  return self->_codeRedeemerController;
}

- (void)setCodeRedeemerController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codeRedeemerController, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end