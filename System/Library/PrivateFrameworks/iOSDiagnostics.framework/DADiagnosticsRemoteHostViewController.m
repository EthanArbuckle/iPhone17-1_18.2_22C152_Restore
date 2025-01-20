@interface DADiagnosticsRemoteHostViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
+ (void)requestDiagnosticsRemoteViewControllerWithConnectionHandler:(id)a3;
- (DADiagnosticResponder)responder;
- (DADiagnosticsRemoteDelegate)delegate;
- (float)originalScreenBrightness;
- (id)disconnect;
- (void)setDelegate:(id)a3;
- (void)setOriginalScreenBrightness:(float)a3;
- (void)setResponder:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewServiceDidEnableVolumeHUD:(BOOL)a3;
- (void)viewServiceDidFinishWithReason:(unint64_t)a3;
- (void)viewServiceDidSetScreenToBrightness:(float)a3 animate:(BOOL)a4;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation DADiagnosticsRemoteHostViewController

+ (void)requestDiagnosticsRemoteViewControllerWithConnectionHandler:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __101__DADiagnosticsRemoteHostViewController_requestDiagnosticsRemoteViewControllerWithConnectionHandler___block_invoke;
  v8[3] = &unk_264DB5C90;
  id v9 = v4;
  id v5 = v4;
  v6 = (void *)MEMORY[0x23ECAA090](v8);
  if ((requestDiagnosticsRemoteViewControllerWithConnectionHandler__alreadyRequestingController & 1) == 0)
  {
    requestDiagnosticsRemoteViewControllerWithConnectionHandler__alreadyRequestingController = 1;
    id v7 = (id)[a1 requestViewController:@"DARootViewController" fromServiceWithBundleIdentifier:@"com.apple.Diagnostics" connectionHandler:v6];
  }
}

uint64_t __101__DADiagnosticsRemoteHostViewController_requestDiagnosticsRemoteViewControllerWithConnectionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  requestDiagnosticsRemoteViewControllerWithConnectionHandler__alreadyRequestingController = 0;
  return result;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)DADiagnosticsRemoteHostViewController;
  [(DADiagnosticsRemoteHostViewController *)&v5 viewDidLoad];
  v3 = objc_alloc_init(DADiagnosticResponder);
  [(DADiagnosticsRemoteHostViewController *)self setResponder:v3];

  BKSDisplayBrightnessGetCurrent();
  -[DADiagnosticsRemoteHostViewController setOriginalScreenBrightness:](self, "setOriginalScreenBrightness:");
  [(DADiagnosticsRemoteHostViewController *)self setModalPresentationStyle:0];
  id v4 = [MEMORY[0x263F1C408] sharedApplication];
  [v4 setIdleTimerDisabled:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DADiagnosticsRemoteHostViewController;
  [(_UIRemoteViewController *)&v9 viewDidDisappear:a3];
  id v4 = [(DADiagnosticsRemoteHostViewController *)self _viewServiceInterface];
  [v4 remoteViewControllerDidDisappear];

  objc_super v5 = [(DADiagnosticsRemoteHostViewController *)self responder];
  [v5 enableVolumeHUD:1];

  v6 = [MEMORY[0x263F1C408] sharedApplication];
  [v6 setIdleTimerDisabled:0];

  id v7 = [MEMORY[0x263F1C920] mainScreen];
  [(DADiagnosticsRemoteHostViewController *)self originalScreenBrightness];
  [v7 setBrightness:v8];
}

- (id)disconnect
{
  return 0;
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26ED349C0];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26ED2C6E8];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v7 = a3;
  id v4 = [(DADiagnosticsRemoteHostViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(DADiagnosticsRemoteHostViewController *)self delegate];
    [v6 didTerminateWithError:v7];
  }
}

- (void)viewServiceDidFinishWithReason:(unint64_t)a3
{
  id v4 = [(DADiagnosticsRemoteHostViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__DADiagnosticsRemoteHostViewController_viewServiceDidFinishWithReason___block_invoke;
    block[3] = &unk_264DB5CB8;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __72__DADiagnosticsRemoteHostViewController_viewServiceDidFinishWithReason___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 didTerminateWithError:0];
}

- (void)viewServiceDidEnableVolumeHUD:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __71__DADiagnosticsRemoteHostViewController_viewServiceDidEnableVolumeHUD___block_invoke;
  v3[3] = &unk_264DB5B10;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __71__DADiagnosticsRemoteHostViewController_viewServiceDidEnableVolumeHUD___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) responder];
  [v2 enableVolumeHUD:*(unsigned __int8 *)(a1 + 40)];
}

- (void)viewServiceDidSetScreenToBrightness:(float)a3 animate:(BOOL)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __85__DADiagnosticsRemoteHostViewController_viewServiceDidSetScreenToBrightness_animate___block_invoke;
  v4[3] = &unk_264DB5B38;
  v4[4] = self;
  float v5 = a3;
  BOOL v6 = a4;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

void __85__DADiagnosticsRemoteHostViewController_viewServiceDidSetScreenToBrightness_animate___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) responder];
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  [v3 setScreenToBrightness:*(unsigned __int8 *)(a1 + 44) animate:v2];
}

- (DADiagnosticsRemoteDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DADiagnosticsRemoteDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DADiagnosticResponder)responder
{
  return self->_responder;
}

- (void)setResponder:(id)a3
{
}

- (float)originalScreenBrightness
{
  return self->_originalScreenBrightness;
}

- (void)setOriginalScreenBrightness:(float)a3
{
  self->_originalScreenBrightness = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responder, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end