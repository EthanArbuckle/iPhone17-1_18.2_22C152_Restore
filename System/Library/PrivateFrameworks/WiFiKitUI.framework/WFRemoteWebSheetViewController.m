@interface WFRemoteWebSheetViewController
+ (id)exportedInterface;
+ (id)requestViewControllerWithConnectionHandler:(id)a3;
+ (id)serviceViewControllerInterface;
- (WFRemoteWebSheetViewControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewServiceDidTerminateWithError:(id)a3;
- (void)webSheetViewControllerContentDidFinishLoading;
- (void)webSheetViewControllerContentDidStartLoading;
- (void)webSheetViewControllerContentReadyForPresentation;
@end

@implementation WFRemoteWebSheetViewController

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() requestViewController:@"WebSheetViewController" fromServiceWithBundleIdentifier:@"com.apple.NanoWebSheet" connectionHandler:v3];

  return v4;
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D94B6C8];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D94B728];
}

- (void)viewDidLoad
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5.receiver = self;
  v5.super_class = (Class)WFRemoteWebSheetViewController;
  [(WFRemoteWebSheetViewController *)&v5 viewDidLoad];
  id v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[WFRemoteWebSheetViewController viewDidLoad]";
    _os_log_impl(&dword_2257EC000, v3, v4, "%s", buf, 0xCu);
  }

  [(WFRemoteWebSheetViewController *)self _setupButtonListener];
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_msgSend(MEMORY[0x263F825C8], "clearColor", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  os_log_type_t v4 = [(WFRemoteWebSheetViewController *)self view];
  [v4 setBackgroundColor:v5];
}

- (void)webSheetViewControllerContentDidStartLoading
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    int v6 = 136315138;
    v7 = "-[WFRemoteWebSheetViewController webSheetViewControllerContentDidStartLoading]";
    _os_log_impl(&dword_2257EC000, v3, v4, "%s", (uint8_t *)&v6, 0xCu);
  }

  id v5 = [(WFRemoteWebSheetViewController *)self delegate];
  [v5 remoteWebSheetViewController:self handleEvent:0 context:0];
}

- (void)webSheetViewControllerContentReadyForPresentation
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    int v6 = 136315138;
    v7 = "-[WFRemoteWebSheetViewController webSheetViewControllerContentReadyForPresentation]";
    _os_log_impl(&dword_2257EC000, v3, v4, "%s", (uint8_t *)&v6, 0xCu);
  }

  id v5 = [(WFRemoteWebSheetViewController *)self delegate];
  [v5 remoteWebSheetViewController:self handleEvent:1 context:0];
}

- (void)webSheetViewControllerContentDidFinishLoading
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    int v6 = 136315138;
    v7 = "-[WFRemoteWebSheetViewController webSheetViewControllerContentDidFinishLoading]";
    _os_log_impl(&dword_2257EC000, v3, v4, "%s", (uint8_t *)&v6, 0xCu);
  }

  id v5 = [(WFRemoteWebSheetViewController *)self delegate];
  [v5 remoteWebSheetViewController:self handleEvent:2 context:0];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    int v11 = 136315394;
    v12 = "-[WFRemoteWebSheetViewController viewServiceDidTerminateWithError:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_2257EC000, v5, v6, "%s: error %@", (uint8_t *)&v11, 0x16u);
  }

  if (v4)
  {
    v7 = [v4 domain];
    if ([v7 isEqualToString:*MEMORY[0x263F83E20]]) {
      [v4 code];
    }
  }
  uint64_t v8 = [(WFRemoteWebSheetViewController *)self delegate];

  if (v8)
  {
    v9 = objc_alloc_init(WFRemoteWebSheetViewControllerErrorContext);
    [(WFRemoteWebSheetViewControllerErrorContext *)v9 setError:v4];
    v10 = [(WFRemoteWebSheetViewController *)self delegate];
    [v10 remoteWebSheetViewController:self handleEvent:3 context:v9];
  }
}

- (WFRemoteWebSheetViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFRemoteWebSheetViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end