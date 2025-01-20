@interface WFFocusConfigurationRemoteViewController
+ (id)exportedInterface;
- (WFFocusConfigurationHostContext)serviceContext;
- (WFFocusConfigurationRemoteViewControllerDelegate)delegate;
- (void)focusConfigurationHostContext:(id)a3 configurationUIStateDidChange:(id)a4;
- (void)focusConfigurationHostContext:(id)a3 didPressButtonWithIdentifier:(id)a4 cellFrame:(CGRect)a5;
- (void)notifyDelegateWithConfigurationUIState:(id)a3;
- (void)notifyDelegateWithPressedButtonIdentifier:(id)a3 cellFrame:(CGRect)a4;
- (void)setDelegate:(id)a3;
- (void)setServiceContext:(id)a3;
- (void)startConfigurationWithRequest:(id)a3 completion:(id)a4;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation WFFocusConfigurationRemoteViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (WFFocusConfigurationHostContext)serviceContext
{
  return self->_serviceContext;
}

- (void)setDelegate:(id)a3
{
}

- (WFFocusConfigurationRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFFocusConfigurationRemoteViewControllerDelegate *)WeakRetained;
}

- (void)focusConfigurationHostContext:(id)a3 didPressButtonWithIdentifier:(id)a4 cellFrame:(CGRect)a5
{
}

- (void)focusConfigurationHostContext:(id)a3 configurationUIStateDidChange:(id)a4
{
}

- (void)notifyDelegateWithPressedButtonIdentifier:(id)a3 cellFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v12 = a3;
  v9 = [(WFFocusConfigurationRemoteViewController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(WFFocusConfigurationRemoteViewController *)self delegate];
    objc_msgSend(v11, "focusConfigurationRemoteViewController:didPressButtonWithIdentifier:cellFrame:", self, v12, x, y, width, height);
  }
}

- (void)notifyDelegateWithConfigurationUIState:(id)a3
{
  id v7 = a3;
  v4 = [(WFFocusConfigurationRemoteViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(WFFocusConfigurationRemoteViewController *)self delegate];
    [v6 focusConfigurationRemoteViewController:self configurationUIStateDidChange:v7];
  }
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = getWFFocusConfigurationLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[WFFocusConfigurationRemoteViewController viewServiceDidTerminateWithError:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_2177E0000, v5, OS_LOG_TYPE_ERROR, "%s viewServiceDidTerminateWithError, error = %@", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)WFFocusConfigurationRemoteViewController;
  [(_UIRemoteViewController *)&v6 viewServiceDidTerminateWithError:v4];
}

- (void)startConfigurationWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __85__WFFocusConfigurationRemoteViewController_startConfigurationWithRequest_completion___block_invoke;
  v13[3] = &unk_2642A5F10;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  __int16 v9 = [(_UIRemoteViewController *)self serviceViewControllerProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __85__WFFocusConfigurationRemoteViewController_startConfigurationWithRequest_completion___block_invoke_47;
  v11[3] = &unk_2642A5F10;
  id v12 = v7;
  id v10 = v7;
  [v9 startConfigurationWithRequest:v8 completion:v11];
}

void __85__WFFocusConfigurationRemoteViewController_startConfigurationWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = getWFFocusConfigurationLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[WFFocusConfigurationRemoteViewController startConfigurationWithRequest:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_2177E0000, v4, OS_LOG_TYPE_ERROR, "%s Failed to start configuration request with %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __85__WFFocusConfigurationRemoteViewController_startConfigurationWithRequest_completion___block_invoke_47(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = getWFFocusConfigurationLogObject();
  int v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      v13 = "-[WFFocusConfigurationRemoteViewController startConfigurationWithRequest:completion:]_block_invoke";
      __int16 v14 = 2112;
      id v15 = v3;
      id v6 = "%s Failed to start configuration request with %@";
      __int16 v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      uint32_t v9 = 22;
LABEL_6:
      _os_log_impl(&dword_2177E0000, v7, v8, v6, (uint8_t *)&v12, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315138;
    v13 = "-[WFFocusConfigurationRemoteViewController startConfigurationWithRequest:completion:]_block_invoke";
    id v6 = "%s Start Configuration Finished";
    __int16 v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEBUG;
    uint32_t v9 = 12;
    goto LABEL_6;
  }

  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3, v10, v11);
}

- (void)setServiceContext:(id)a3
{
  id v4 = (WFFocusConfigurationHostContext *)a3;
  [(WFFocusConfigurationHostContext *)self->_serviceContext setFocusConfigurationDelegate:0];
  serviceContext = self->_serviceContext;
  self->_serviceContext = v4;
  id v6 = v4;

  [(WFFocusConfigurationHostContext *)self->_serviceContext setFocusConfigurationDelegate:self];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C7E9CA8];
}

@end