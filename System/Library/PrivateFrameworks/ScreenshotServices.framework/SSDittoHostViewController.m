@interface SSDittoHostViewController
+ (BOOL)__shouldHostRemoteTextEffectsWindow;
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (BOOL)becomeFirstResponder;
- (SSDittoHostViewControllerDelegate)delegate;
- (unint64_t)supportedInterfaceOrientations;
- (void)dismiss;
- (void)dismissScreenshotExperience;
- (void)screenshotExperienceHasDismissed;
- (void)setDelegate:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation SSDittoHostViewController

- (BOOL)becomeFirstResponder
{
  v7.receiver = self;
  v7.super_class = (Class)SSDittoHostViewController;
  BOOL v3 = [(SSDittoHostViewController *)&v7 becomeFirstResponder];
  if (v3)
  {
    v4 = [(SSDittoHostViewController *)self view];
    v5 = [v4 window];
    [v5 makeKeyWindow];
  }
  return v3;
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D07F2A0];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D0643C8];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[SSDittoHostViewController viewServiceDidTerminateWithError:](v4, v5);
  }

  v7.receiver = self;
  v7.super_class = (Class)SSDittoHostViewController;
  [(_UIRemoteViewController *)&v7 viewServiceDidTerminateWithError:v4];
  v6 = [(SSDittoHostViewController *)self delegate];
  [v6 remoteViewControllerDisconnectedFromHostViewController:self withError:v4];
}

- (void)screenshotExperienceHasDismissed
{
  BOOL v3 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21ECED000, v3, OS_LOG_TYPE_INFO, "Received dismiss notification from service", v5, 2u);
  }

  id v4 = [(SSDittoHostViewController *)self delegate];
  [v4 remoteViewControllerOfHostViewControllerHasDismissedScreenshots:self];
}

- (void)dismissScreenshotExperience
{
  BOOL v3 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21ECED000, v3, OS_LOG_TYPE_INFO, "Notifying service to tear down screenshot experience", v5, 2u);
  }

  id v4 = [(SSDittoHostViewController *)self _serviceProxy];
  [v4 tearDownScreenshotExperience];
}

- (void)dismiss
{
  BOOL v3 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21ECED000, v3, OS_LOG_TYPE_INFO, "Received dismiss request from service", v5, 2u);
  }

  id v4 = [(SSDittoHostViewController *)self presentingViewController];
  [v4 dismissViewControllerAnimated:0 completion:0];
}

+ (BOOL)__shouldHostRemoteTextEffectsWindow
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SSDittoHostViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SSDittoHostViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)viewServiceDidTerminateWithError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 description];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_21ECED000, a2, OS_LOG_TYPE_ERROR, "Service Terminated with error %@", (uint8_t *)&v4, 0xCu);
}

@end