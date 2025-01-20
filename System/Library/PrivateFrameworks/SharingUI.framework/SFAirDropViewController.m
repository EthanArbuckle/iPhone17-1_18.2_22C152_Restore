@interface SFAirDropViewController
- (NSExtension)extension;
- (SFAirDropViewController)initWithNoContentView:(BOOL)a3;
- (SFAirDropViewControllerDelegate)delegate;
- (UIViewController)retainedActivityViewController;
- (_UIRemoteViewController)_containedRemoteViewController;
- (void)_presentationControllerDidDismiss:(id)a3;
- (void)_setChildViewController:(id)a3;
- (void)_setExtensionRequest:(id)a3;
- (void)airDropViewServiceDidFinishTransferWithSuccess:(BOOL)a3;
- (void)airDropViewServiceDidRequestDismissal;
- (void)airDropViewServiceDidStartTransfer;
- (void)airDropViewServiceRequestingSendingAppBundleIdentifierWithCompletionHandler:(id)a3;
- (void)airDropViewServiceRequestingSharedItemsWithDataRequest:(id)a3 completionHandler:(id)a4;
- (void)airDropViewServiceWillStartTransferToRecipient:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setExtension:(id)a3;
- (void)setRetainedActivityViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation SFAirDropViewController

- (SFAirDropViewController)initWithNoContentView:(BOOL)a3
{
  BOOL v3 = a3;
  v21[1] = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)SFAirDropViewController;
  v4 = [(SFAirDropViewController *)&v20 init];
  v5 = v4;
  if (v4)
  {
    [(SFAirDropViewController *)v4 _beginDelayingPresentation:0 cancellationHandler:3.0];
    v6 = [MEMORY[0x263F08800] extensionWithIdentifier:@"com.apple.Sharing.AirDrop" error:0];
    [(SFAirDropViewController *)v5 setExtension:v6];
    id location = 0;
    objc_initWeak(&location, v5);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __49__SFAirDropViewController_initWithNoContentView___block_invoke;
    v17[3] = &unk_264472688;
    objc_copyWeak(&v18, &location);
    [v6 setRequestCancellationBlock:v17];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __49__SFAirDropViewController_initWithNoContentView___block_invoke_3;
    v15[3] = &unk_2644726B0;
    objc_copyWeak(&v16, &location);
    [v6 setRequestInterruptionBlock:v15];
    id v7 = objc_alloc_init(MEMORY[0x263F08810]);
    v8 = NSDictionary;
    v9 = [NSNumber numberWithBool:v3];
    v10 = [v8 dictionaryWithObject:v9 forKey:@"ShowNoContentView"];
    [v7 setUserInfo:v10];

    v21[0] = v7;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __49__SFAirDropViewController_initWithNoContentView___block_invoke_5;
    v13[3] = &unk_2644726D8;
    objc_copyWeak(&v14, &location);
    [v6 instantiateViewControllerWithInputItems:v11 connectionHandler:v13];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __49__SFAirDropViewController_initWithNoContentView___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SFAirDropViewController_initWithNoContentView___block_invoke_2;
  block[3] = &unk_264471E48;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __49__SFAirDropViewController_initWithNoContentView___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

void __49__SFAirDropViewController_initWithNoContentView___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SFAirDropViewController_initWithNoContentView___block_invoke_4;
  block[3] = &unk_264471E48;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __49__SFAirDropViewController_initWithNoContentView___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

void __49__SFAirDropViewController_initWithNoContentView___block_invoke_5(id *a1, void *a2, void *a3)
{
  id v10 = a3;
  a1 += 4;
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(a1);
  [WeakRetained _setChildViewController:v10];

  id v7 = objc_loadWeakRetained(a1);
  [v7 _setExtensionRequest:v5];

  id v8 = objc_loadWeakRetained(a1);
  [v10 setAirDropHost:v8];

  id v9 = objc_loadWeakRetained(a1);
  [v9 _endDelayingPresentation];
}

- (void)dealloc
{
  if (self->_extensionRequest) {
    -[NSExtension cancelExtensionRequestWithIdentifier:](self->_extension, "cancelExtensionRequestWithIdentifier:");
  }
  v3.receiver = self;
  v3.super_class = (Class)SFAirDropViewController;
  [(SFAirDropViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)SFAirDropViewController;
  [(SFAirDropViewController *)&v2 viewDidLoad];
}

- (void)_setExtensionRequest:(id)a3
{
}

- (void)_setChildViewController:(id)a3
{
  id v30 = a3;
  id v5 = [(_SFAirDropRemoteViewController *)self->_childViewController view];
  [v5 removeFromSuperview];

  [(_SFAirDropRemoteViewController *)self->_childViewController removeFromParentViewController];
  objc_storeStrong((id *)&self->_childViewController, a3);
  if (self->_childViewController)
  {
    [v30 willMoveToParentViewController:self];
    v6 = [v30 view];
    id v7 = [(SFAirDropViewController *)self view];
    [v7 bounds];
    objc_msgSend(v6, "setFrame:");

    [(SFAirDropViewController *)self addChildViewController:v30];
    id v8 = [(SFAirDropViewController *)self view];
    [v8 addSubview:v6];

    id v9 = [MEMORY[0x263EFF980] array];
    id v10 = [v30 view];
    v11 = [v10 widthAnchor];
    v12 = [(SFAirDropViewController *)self view];
    v13 = [v12 widthAnchor];
    id v14 = [v11 constraintEqualToAnchor:v13];
    [v9 addObject:v14];

    v15 = [v30 view];
    id v16 = [v15 heightAnchor];
    v17 = [(SFAirDropViewController *)self view];
    id v18 = [v17 heightAnchor];
    v19 = [v16 constraintEqualToAnchor:v18];
    [v9 addObject:v19];

    objc_super v20 = [v30 view];
    v21 = [v20 centerXAnchor];
    v22 = [(SFAirDropViewController *)self view];
    v23 = [v22 centerXAnchor];
    v24 = [v21 constraintEqualToAnchor:v23];
    [v9 addObject:v24];

    v25 = [v30 view];
    v26 = [v25 centerYAnchor];
    v27 = [(SFAirDropViewController *)self view];
    v28 = [v27 centerYAnchor];
    v29 = [v26 constraintEqualToAnchor:v28];
    [v9 addObject:v29];

    [MEMORY[0x263F08938] activateConstraints:v9];
    [v30 didMoveToParentViewController:self];
  }
}

- (void)airDropViewServiceDidRequestDismissal
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __64__SFAirDropViewController_airDropViewServiceDidRequestDismissal__block_invoke;
  v2[3] = &unk_264471EE0;
  v2[4] = self;
  [(SFAirDropViewController *)self dismissViewControllerAnimated:1 completion:v2];
}

void __64__SFAirDropViewController_airDropViewServiceDidRequestDismissal__block_invoke(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 airDropViewControllerDidDismiss:*(void *)(a1 + 32)];
  }
}

- (void)airDropViewServiceWillStartTransferToRecipient:(id)a3
{
  id v4 = a3;
  id v5 = [(SFAirDropViewController *)self delegate];
  [v5 airDropViewServiceWillStartTransfer:self toRecipient:v4];
}

- (void)airDropViewServiceDidStartTransfer
{
  id v3 = [(SFAirDropViewController *)self delegate];
  [v3 airDropViewControllerDidStartTransfer:self];
}

- (void)airDropViewServiceDidFinishTransferWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SFAirDropViewController *)self delegate];
  [v5 airDropViewController:self didFinishTransferWithSuccess:v3];
}

- (void)airDropViewServiceRequestingSharedItemsWithDataRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SFAirDropViewController *)self delegate];
  [v8 airDropViewController:self requestSharedItemsWithDataRequest:v7 completionHandler:v6];
}

- (void)airDropViewServiceRequestingSendingAppBundleIdentifierWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SFAirDropViewController *)self delegate];
  [v5 airDropViewController:self requestSendingAppBundleIdentifierWithCompletionHandler:v4];
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)self->_childViewController;
}

- (void)_presentationControllerDidDismiss:(id)a3
{
  id v4 = [(SFAirDropViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SFAirDropViewController *)self delegate];
    [v6 airDropViewControllerDidDismiss:self];
  }
}

- (SFAirDropViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SFAirDropViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)retainedActivityViewController
{
  return self->_retainedActivityViewController;
}

- (void)setRetainedActivityViewController:(id)a3
{
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_retainedActivityViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_extensionRequest, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
}

@end