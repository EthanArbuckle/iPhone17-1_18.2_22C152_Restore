@interface LTUIRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (LTUIViewServiceExtensionHostProtocol)delegate;
- (void)confirmUserConsent;
- (void)dismiss;
- (void)expandSheet;
- (void)finishWithTranslation:(id)a3;
- (void)remoteIsReady;
- (void)setDelegate:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation LTUIRemoteViewController

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x263F08D80], "__LTUI_viewServiceExtensionInterface");
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x263F08D80], "__LTUI_viewServiceExtensionHostInterface");
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v3 = a3;
  v4 = _LTOSLogSystemTranslation();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[LTUIRemoteViewController viewServiceDidTerminateWithError:]((uint64_t)v3, v4);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dismiss
{
  id v2 = [(LTUIRemoteViewController *)self delegate];
  [v2 dismiss];
}

- (void)confirmUserConsent
{
  id v2 = [(LTUIRemoteViewController *)self delegate];
  [v2 confirmUserConsent];
}

- (void)expandSheet
{
  id v2 = [(LTUIRemoteViewController *)self delegate];
  [v2 expandSheet];
}

- (void)remoteIsReady
{
  id v2 = [(LTUIRemoteViewController *)self delegate];
  [v2 remoteIsReady];
}

- (void)finishWithTranslation:(id)a3
{
  id v4 = a3;
  id v5 = [(LTUIRemoteViewController *)self delegate];
  [v5 finishWithTranslation:v4];
}

- (LTUIViewServiceExtensionHostProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LTUIViewServiceExtensionHostProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)viewServiceDidTerminateWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2180E5000, a2, OS_LOG_TYPE_ERROR, "View service terminated during system translation with error: %@", (uint8_t *)&v2, 0xCu);
}

@end