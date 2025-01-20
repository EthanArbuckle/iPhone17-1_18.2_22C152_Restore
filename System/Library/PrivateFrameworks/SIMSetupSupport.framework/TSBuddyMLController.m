@interface TSBuddyMLController
- (NSString)type;
- (NSURL)url;
- (TSBuddyMLController)initWithHostController:(id)a3;
- (TSSIMSetupFlowDelegate)delegate;
- (void)_configureRUIController;
- (void)_userDidTapCancel;
- (void)loadRequest:(id)a3 completion:(id)a4;
- (void)remoteUIController:(id)a3 didRemoveObjectModel:(id)a4;
- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6;
- (void)setDelegate:(id)a3;
@end

@implementation TSBuddyMLController

- (TSBuddyMLController)initWithHostController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TSBuddyMLController;
  v5 = [(TSBuddyMLController *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_initialRequest = 1;
    uint64_t v7 = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v5 action:sel__userDidTapCancel];
    cancelButton = v6->_cancelButton;
    v6->_cancelButton = (UIBarButtonItem *)v7;

    [(TSBuddyMLController *)v6 _configureRUIController];
    [(RemoteUIController *)v6->_remoteUIController setHostViewController:v4];
  }

  return v6;
}

- (void)_userDidTapCancel
{
  v3 = [(RemoteUIController *)self->_remoteUIController hostViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained userDidTapCancel];
}

- (void)loadRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if (_isInternalInstall())
    {
      v8 = _TSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[TSBuddyMLController loadRequest:completion:]((uint64_t)v6, v8);
      }
    }
    remoteUIController = self->_remoteUIController;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __46__TSBuddyMLController_loadRequest_completion___block_invoke;
    v11[3] = &unk_264828778;
    v11[4] = self;
    id v12 = v7;
    [(RemoteUIController *)remoteUIController loadRequest:v6 completion:v11];
  }
  else
  {
    objc_super v10 = _TSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[TSBuddyMLController loadRequest:completion:](v10);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

uint64_t __46__TSBuddyMLController_loadRequest_completion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a4;
  v8 = (void (**)(id, BOOL, void))a6;
  if (self->_initialRequest)
  {
    BOOL initialRequest = 1;
  }
  else
  {

    id v10 = 0;
    BOOL initialRequest = self->_initialRequest;
  }
  v8[2](v8, initialRequest, 0);
}

- (void)remoteUIController:(id)a3 didRemoveObjectModel:(id)a4
{
  id v12 = a3;
  v5 = [v12 displayedPages];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    id v7 = [v12 navigationController];
    v8 = [v7 topViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id WeakRetained = [v12 navigationController];
      id v11 = (id)[WeakRetained popViewControllerAnimated:0];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained userDidTapCancel];
    }
  }
}

- (void)_configureRUIController
{
  v3 = (RemoteUIController *)objc_alloc_init(MEMORY[0x263F637E8]);
  remoteUIController = self->_remoteUIController;
  self->_remoteUIController = v3;

  [(RemoteUIController *)self->_remoteUIController setDelegate:self];
  v5 = self->_remoteUIController;
  uint64_t v6 = [[TSRemoteUIStyle alloc] initWithButton:self->_cancelButton];
  [(RemoteUIController *)v5 setStyle:v6];

  id v7 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
  objc_msgSend(v7, "set_sourceApplicationSecondaryIdentifier:", @"com.apple.CommCenter.CellularPlanProvisioning");
  [(RemoteUIController *)self->_remoteUIController setSessionConfiguration:v7];
  objc_initWeak(&location, self);
  v8 = self->_remoteUIController;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __46__TSBuddyMLController__configureRUIController__block_invoke;
  v12[3] = &unk_2648287A0;
  objc_copyWeak(&v13, &location);
  [(RemoteUIController *)v8 setHandlerForButtonName:@"dataPlanUrl" handler:v12];
  v9 = self->_remoteUIController;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__TSBuddyMLController__configureRUIController__block_invoke_2;
  v10[3] = &unk_2648287A0;
  objc_copyWeak(&v11, &location);
  [(RemoteUIController *)v9 setHandlerForButtonName:@"dataPlanUrlWithIccid" handler:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __46__TSBuddyMLController__configureRUIController__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v6 = NSURL;
  id v7 = [v5 objectForKeyedSubscript:@"url"];
  uint64_t v8 = [v6 URLWithString:v7];
  v9 = (void *)*((void *)WeakRetained + 5);
  *((void *)WeakRetained + 5) = v8;

  uint64_t v10 = [v5 objectForKeyedSubscript:@"type"];

  id v11 = (void *)*((void *)WeakRetained + 6);
  *((void *)WeakRetained + 6) = v10;

  id v12 = [WeakRetained delegate];
  id v13 = [*((id *)WeakRetained + 3) displayedPages];
  v14 = [v13 firstObject];
  [v12 viewControllerDidComplete:v14];
}

void __46__TSBuddyMLController__configureRUIController__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v6 = NSURL;
  id v7 = [v5 objectForKeyedSubscript:@"url"];

  uint64_t v8 = [v6 URLWithString:v7];
  v9 = (void *)*((void *)WeakRetained + 5);
  *((void *)WeakRetained + 5) = v8;

  uint64_t v10 = [WeakRetained delegate];
  id v11 = [*((id *)WeakRetained + 3) displayedPages];
  id v12 = [v11 firstObject];
  [v10 viewControllerDidComplete:v12];
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
}

- (void)loadRequest:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[TSBuddyMLController loadRequest:completion:]";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E]Missing request @%s", (uint8_t *)&v1, 0xCu);
}

- (void)loadRequest:(uint64_t)a1 completion:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  id v5 = "-[TSBuddyMLController loadRequest:completion:]";
  _os_log_debug_impl(&dword_227A17000, a2, OS_LOG_TYPE_DEBUG, "[Db] Loading Request: %@ @%s", (uint8_t *)&v2, 0x16u);
}

@end