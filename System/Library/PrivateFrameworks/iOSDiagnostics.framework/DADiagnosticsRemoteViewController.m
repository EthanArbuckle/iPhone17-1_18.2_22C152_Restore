@interface DADiagnosticsRemoteViewController
+ (id)exportedInterface;
+ (id)requestViewControllerWithConnectionHandler:(id)a3;
+ (id)serviceViewControllerInterface;
- (DADiagnosticResponder)responder;
- (DADiagnosticsRemoteViewControllerDelegate)delegate;
- (float)originalScreenBrightness;
- (id)_stringForReason:(unint64_t)a3;
- (void)requiredSerialNumbers:(id)a3;
- (void)selectableSerialNumbers:(id)a3;
- (void)sessionToken:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOriginalScreenBrightness:(float)a3;
- (void)setResponder:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewServiceDidEnableVolumeHUD:(BOOL)a3;
- (void)viewServiceDidFinishWithReason:(unint64_t)a3;
- (void)viewServiceDidSetScreenToBrightness:(float)a3 animate:(BOOL)a4;
- (void)viewServiceDidSuspend;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation DADiagnosticsRemoteViewController

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  return (id)[a1 requestViewController:@"DARootViewController" fromServiceWithBundleIdentifier:@"com.apple.Diagnostics" connectionHandler:a3];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)DADiagnosticsRemoteViewController;
  [(DADiagnosticsRemoteViewController *)&v5 viewDidLoad];
  v3 = objc_alloc_init(DADiagnosticResponder);
  [(DADiagnosticsRemoteViewController *)self setResponder:v3];

  BKSDisplayBrightnessGetCurrent();
  -[DADiagnosticsRemoteViewController setOriginalScreenBrightness:](self, "setOriginalScreenBrightness:");
  [(DADiagnosticsRemoteViewController *)self setModalPresentationStyle:0];
  v4 = [MEMORY[0x263F1C408] sharedApplication];
  [v4 setIdleTimerDisabled:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DADiagnosticsRemoteViewController;
  [(_UIRemoteViewController *)&v9 viewDidDisappear:a3];
  v4 = [(DADiagnosticsRemoteViewController *)self _viewServiceInterface];
  [v4 remoteViewControllerDidDisappear];

  objc_super v5 = [(DADiagnosticsRemoteViewController *)self responder];
  [v5 enableVolumeHUD:1];

  v6 = [MEMORY[0x263F1C920] mainScreen];
  [(DADiagnosticsRemoteViewController *)self originalScreenBrightness];
  [v6 setBrightness:v7];

  v8 = [MEMORY[0x263F1C408] sharedApplication];
  [v8 setIdleTimerDisabled:0];
}

- (void)requiredSerialNumbers:(id)a3
{
  id v4 = a3;
  id v5 = [(DADiagnosticsRemoteViewController *)self _viewServiceInterface];
  [v5 remoteViewControllerDidSetRequiredSerialNumbers:v4];
}

- (void)selectableSerialNumbers:(id)a3
{
  id v4 = a3;
  id v5 = [(DADiagnosticsRemoteViewController *)self _viewServiceInterface];
  [v5 remoteViewControllerDidSetSelectableSerialNumbers:v4];
}

- (void)sessionToken:(id)a3
{
  id v4 = a3;
  id v5 = [(DADiagnosticsRemoteViewController *)self _viewServiceInterface];
  [v5 remoteViewControllerDidSetSessionToken:v4];
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
  id v4 = a3;
  id v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[DADiagnosticsRemoteViewController viewServiceDidTerminateWithError:]((uint64_t)v4, v5);
  }

  v6 = [(DADiagnosticsRemoteViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(DADiagnosticsRemoteViewController *)self delegate];
    [v8 remoteViewController:self didFinishWithReason:4];
  }
}

- (void)viewServiceDidFinishWithReason:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(DADiagnosticsRemoteViewController *)self _stringForReason:a3];
    *(_DWORD *)buf = 136315394;
    v11 = "-[DADiagnosticsRemoteViewController viewServiceDidFinishWithReason:]";
    __int16 v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_2399E3000, v5, OS_LOG_TYPE_DEFAULT, "%s reason: %@", buf, 0x16u);
  }
  char v7 = [(DADiagnosticsRemoteViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __68__DADiagnosticsRemoteViewController_viewServiceDidFinishWithReason___block_invoke;
    v9[3] = &unk_264DB5AE8;
    v9[4] = self;
    v9[5] = a3;
    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
}

void __68__DADiagnosticsRemoteViewController_viewServiceDidFinishWithReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 remoteViewController:*(void *)(a1 + 32) didFinishWithReason:*(void *)(a1 + 40)];
}

- (void)viewServiceDidEnableVolumeHUD:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    objc_super v9 = "-[DADiagnosticsRemoteViewController viewServiceDidEnableVolumeHUD:]";
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl(&dword_2399E3000, v5, OS_LOG_TYPE_DEFAULT, "%s enableVolumeHUD: %d", buf, 0x12u);
  }

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__DADiagnosticsRemoteViewController_viewServiceDidEnableVolumeHUD___block_invoke;
  v6[3] = &unk_264DB5B10;
  v6[4] = self;
  BOOL v7 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __67__DADiagnosticsRemoteViewController_viewServiceDidEnableVolumeHUD___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) responder];
  [v2 enableVolumeHUD:*(unsigned __int8 *)(a1 + 40)];
}

- (void)viewServiceDidSetScreenToBrightness:(float)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v7 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v12 = "-[DADiagnosticsRemoteViewController viewServiceDidSetScreenToBrightness:animate:]";
    __int16 v13 = 2048;
    double v14 = a3;
    __int16 v15 = 1024;
    BOOL v16 = v4;
    _os_log_impl(&dword_2399E3000, v7, OS_LOG_TYPE_DEFAULT, "%s brightness: %f animate: %d", buf, 0x1Cu);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __81__DADiagnosticsRemoteViewController_viewServiceDidSetScreenToBrightness_animate___block_invoke;
  v8[3] = &unk_264DB5B38;
  v8[4] = self;
  float v9 = a3;
  BOOL v10 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __81__DADiagnosticsRemoteViewController_viewServiceDidSetScreenToBrightness_animate___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) responder];
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  [v3 setScreenToBrightness:*(unsigned __int8 *)(a1 + 44) animate:v2];
}

- (void)viewServiceDidSuspend
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  double v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    BOOL v4 = "-[DADiagnosticsRemoteViewController viewServiceDidSuspend]";
    _os_log_impl(&dword_2399E3000, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v3, 0xCu);
  }

  dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global);
}

uint64_t __58__DADiagnosticsRemoteViewController_viewServiceDidSuspend__block_invoke()
{
  return [(id)*MEMORY[0x263F1D020] suspend];
}

- (id)_stringForReason:(unint64_t)a3
{
  if (a3 > 8) {
    return @"UnknownReason";
  }
  else {
    return off_264DB5B78[a3];
  }
}

- (DADiagnosticsRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DADiagnosticsRemoteViewControllerDelegate *)WeakRetained;
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

- (void)viewServiceDidTerminateWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  int v3 = "-[DADiagnosticsRemoteViewController viewServiceDidTerminateWithError:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_2399E3000, a2, OS_LOG_TYPE_ERROR, "%s error: %@", (uint8_t *)&v2, 0x16u);
}

@end