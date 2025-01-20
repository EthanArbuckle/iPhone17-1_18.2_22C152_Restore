@interface WFSystemActionConfigurationRemoteViewController
+ (id)serviceViewControllerInterface;
- (WFConfiguredSystemAction)selectedAction;
- (WFSystemActionConfigurationRemoteViewControllerDelegate)delegate;
- (void)dealloc;
- (void)didCancelSystemActionConfiguration:(id)a3;
- (void)didSelectSystemAction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedAction:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation WFSystemActionConfigurationRemoteViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (WFConfiguredSystemAction)selectedAction
{
  return self->_selectedAction;
}

- (void)setDelegate:(id)a3
{
}

- (WFSystemActionConfigurationRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFSystemActionConfigurationRemoteViewControllerDelegate *)WeakRetained;
}

- (void)didSelectSystemAction:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v4 = (WFConfiguredSystemAction *)a3;
  v5 = getWFSystemActionConfigurationLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    v10 = "-[WFSystemActionConfigurationRemoteViewController didSelectSystemAction:]";
    __int16 v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_2177E0000, v5, OS_LOG_TYPE_DEFAULT, "%s System Action configuration finished, action = %@", (uint8_t *)&v9, 0x16u);
  }

  selectedAction = self->_selectedAction;
  self->_selectedAction = v4;
  v7 = v4;

  v8 = [(WFSystemActionConfigurationRemoteViewController *)self delegate];
  [v8 configurationController:self didFinishWithAction:v7 error:0];
}

- (void)didCancelSystemActionConfiguration:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = getWFSystemActionConfigurationLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    int v9 = "-[WFSystemActionConfigurationRemoteViewController didCancelSystemActionConfiguration:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_2177E0000, v5, OS_LOG_TYPE_DEFAULT, "%s System Action configuration finished, error = %@", (uint8_t *)&v8, 0x16u);
  }

  selectedAction = self->_selectedAction;
  self->_selectedAction = 0;

  v7 = [(WFSystemActionConfigurationRemoteViewController *)self delegate];
  [v7 configurationController:self didFinishWithAction:0 error:v4];
}

- (void)setSelectedAction:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = (WFConfiguredSystemAction *)a3;
  v5 = getWFSystemActionConfigurationLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    __int16 v10 = "-[WFSystemActionConfigurationRemoteViewController setSelectedAction:]";
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_2177E0000, v5, OS_LOG_TYPE_DEFAULT, "%s Sending selected action to remote view controller: %@", (uint8_t *)&v9, 0x16u);
  }

  selectedAction = self->_selectedAction;
  self->_selectedAction = v4;
  v7 = v4;

  int v8 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v8 setSelectedSystemAction:v7];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = getWFSystemActionConfigurationLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    int v8 = "-[WFSystemActionConfigurationRemoteViewController viewServiceDidTerminateWithError:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_2177E0000, v5, OS_LOG_TYPE_ERROR, "%s viewServiceDidTerminateWithError, error = %@", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)WFSystemActionConfigurationRemoteViewController;
  [(_UIRemoteViewController *)&v6 viewServiceDidTerminateWithError:v4];
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = getWFSystemActionConfigurationLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    objc_super v6 = "-[WFSystemActionConfigurationRemoteViewController dealloc]";
    _os_log_impl(&dword_2177E0000, v3, OS_LOG_TYPE_ERROR, "%s Destroying WFSystemActionConfigurationRemoteViewController", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)WFSystemActionConfigurationRemoteViewController;
  [(_UIRemoteViewController *)&v4 dealloc];
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C801DE0];
}

@end