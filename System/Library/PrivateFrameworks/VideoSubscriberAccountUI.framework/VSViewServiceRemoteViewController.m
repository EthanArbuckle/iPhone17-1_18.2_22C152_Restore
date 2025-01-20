@interface VSViewServiceRemoteViewController
+ (BOOL)shouldPropagateAppearanceCustomizations;
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (VSViewServiceRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (VSViewServiceRemoteViewControllerDelegate)delegate;
- (void)_didCancelRequest:(id)a3;
- (void)_didChooseAdditionalProvidersForRequest:(id)a3;
- (void)_didChooseProviderWithIdentifier:(id)a3 vetoHandler:(id)a4;
- (void)_dismissViewController;
- (void)_presentViewController;
- (void)_request:(id)a3 didFailWithError:(id)a4;
- (void)_request:(id)a3 didFinishWithResponse:(id)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation VSViewServiceRemoteViewController

- (VSViewServiceRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  VSRequireMainThread();
  v10.receiver = self;
  v10.super_class = (Class)VSViewServiceRemoteViewController;
  v8 = [(VSViewServiceRemoteViewController *)&v10 initWithNibName:v7 bundle:v6];

  return v8;
}

- (void)dealloc
{
  VSRequireMainThread();
  v3.receiver = self;
  v3.super_class = (Class)VSViewServiceRemoteViewController;
  [(_UIRemoteViewController *)&v3 dealloc];
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x263F1E2F8] viewServiceInterface];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x263F1E2F8] viewServiceHostInterface];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VSViewServiceRemoteViewController;
  id v4 = a3;
  [(_UIRemoteViewController *)&v6 viewServiceDidTerminateWithError:v4];
  v5 = [(VSViewServiceRemoteViewController *)self delegate];
  [v5 viewServiceRemoteViewController:self didTerminateWithError:v4];
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

- (void)_presentViewController
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  objc_super v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    objc_super v6 = "-[VSViewServiceRemoteViewController _presentViewController]";
    _os_log_impl(&dword_23F9AB000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(VSViewServiceRemoteViewController *)self delegate];
  [v4 presentViewServiceRemoteViewController:self];
}

- (void)_dismissViewController
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  objc_super v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    objc_super v6 = "-[VSViewServiceRemoteViewController _dismissViewController]";
    _os_log_impl(&dword_23F9AB000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(VSViewServiceRemoteViewController *)self delegate];
  [v4 dismissViewServiceRemoteViewController:self];
}

- (void)_request:(id)a3 didFinishWithResponse:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "-[VSViewServiceRemoteViewController _request:didFinishWithResponse:]";
    _os_log_impl(&dword_23F9AB000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v10, 0xCu);
  }

  v9 = [(VSViewServiceRemoteViewController *)self delegate];
  [v9 viewServiceRemoteViewController:self request:v7 didFinishWithResponse:v6];
}

- (void)_request:(id)a3 didFailWithError:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "-[VSViewServiceRemoteViewController _request:didFailWithError:]";
    _os_log_impl(&dword_23F9AB000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v10, 0xCu);
  }

  v9 = [(VSViewServiceRemoteViewController *)self delegate];
  [v9 viewServiceRemoteViewController:self request:v7 didFailWithError:v6];
}

- (void)_didChooseAdditionalProvidersForRequest:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[VSViewServiceRemoteViewController _didChooseAdditionalProvidersForRequest:]";
    _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(VSViewServiceRemoteViewController *)self delegate];
  [v6 viewServiceRemoteViewController:self didChooseAdditionalProvidersForRequest:v4];
}

- (void)_didCancelRequest:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[VSViewServiceRemoteViewController _didCancelRequest:]";
    _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(VSViewServiceRemoteViewController *)self delegate];
  [v6 viewServiceRemoteViewController:self didCancelRequest:v4];
}

- (void)_didChooseProviderWithIdentifier:(id)a3 vetoHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "-[VSViewServiceRemoteViewController _didChooseProviderWithIdentifier:vetoHandler:]";
    _os_log_impl(&dword_23F9AB000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = [(VSViewServiceRemoteViewController *)self delegate];
  [v9 viewServiceRemoteViewController:self didSelectProviderWithIdentifier:v7 vetoHandler:v6];
}

- (VSViewServiceRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSViewServiceRemoteViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end