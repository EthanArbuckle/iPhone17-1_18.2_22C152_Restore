@interface WFWidgetConfigurationRemoteViewController
+ (id)exportedInterface;
- (WFWidgetConfigurationRemoteViewControllerDelegate)delegate;
- (void)intentWasConfigured:(id)a3;
- (void)preferredCardSizeDidUpdate:(CGSize)a3;
- (void)requestViewControllerDismissal;
- (void)setConfigurationCardViewFrame:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)startConfigurationWithRequest:(id)a3 completion:(id)a4;
@end

@implementation WFWidgetConfigurationRemoteViewController

+ (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C7F8988];
}

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (WFWidgetConfigurationRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFWidgetConfigurationRemoteViewControllerDelegate *)WeakRetained;
}

- (void)preferredCardSizeDidUpdate:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(WFWidgetConfigurationRemoteViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(WFWidgetConfigurationRemoteViewController *)self delegate];
    objc_msgSend(v8, "widgetConfigurationRemoteViewController:preferredContentSizeDidChange:", self, width, height);
  }
}

- (void)intentWasConfigured:(id)a3
{
  id v7 = a3;
  v4 = [(WFWidgetConfigurationRemoteViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(WFWidgetConfigurationRemoteViewController *)self delegate];
    [v6 widgetConfigurationRemoteViewController:self didReceiveConfiguredIntent:v7];
  }
}

- (void)requestViewControllerDismissal
{
  id v2 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v2 requestViewControllerDismissal];
}

- (void)setConfigurationCardViewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  objc_msgSend(v7, "setConfigurationCardViewFrame:", x, y, width, height);
}

- (void)startConfigurationWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_2885];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __86__WFWidgetConfigurationRemoteViewController_startConfigurationWithRequest_completion___block_invoke_47;
  v11[3] = &unk_2642A5F10;
  id v12 = v6;
  id v10 = v6;
  [v9 startConfigurationWithRequest:v7 completion:v11];
}

void __86__WFWidgetConfigurationRemoteViewController_startConfigurationWithRequest_completion___block_invoke_47(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = getWFWidgetConfigurationLogObject();
  char v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      v13 = "-[WFWidgetConfigurationRemoteViewController startConfigurationWithRequest:completion:]_block_invoke";
      __int16 v14 = 2112;
      id v15 = v3;
      id v6 = "%s Failed to start configuration request with %@";
      id v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      uint32_t v9 = 22;
LABEL_6:
      _os_log_impl(&dword_2177E0000, v7, v8, v6, (uint8_t *)&v12, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315138;
    v13 = "-[WFWidgetConfigurationRemoteViewController startConfigurationWithRequest:completion:]_block_invoke";
    id v6 = "%s Start Configuration Finished";
    id v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEBUG;
    uint32_t v9 = 12;
    goto LABEL_6;
  }

  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3, v10, v11);
}

void __86__WFWidgetConfigurationRemoteViewController_startConfigurationWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = getWFWidgetConfigurationLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    char v5 = "-[WFWidgetConfigurationRemoteViewController startConfigurationWithRequest:completion:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_2177E0000, v3, OS_LOG_TYPE_ERROR, "%s Failed to start configuration request with %@", (uint8_t *)&v4, 0x16u);
  }
}

@end