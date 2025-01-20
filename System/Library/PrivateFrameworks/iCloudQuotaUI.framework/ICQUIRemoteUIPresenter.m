@interface ICQUIRemoteUIPresenter
- (BOOL)isLiftUIFlow;
- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5;
- (ICQUIRemoteUIPresenter)initWithAccount:(id)a3 presenter:(id)a4;
- (ICQUIRemoteUIPresenterDelegate)delegate;
- (NSSet)dataclasses;
- (void)_attachServerHooks;
- (void)_configureTableRow:(id)a3 withDataclass:(id)a4;
- (void)_processObjectModel:(id)a3;
- (void)_processTableRow:(id)a3;
- (void)beginRUIFlowWithRequest:(id)a3;
- (void)beginRUIFlowWithURL:(id)a3;
- (void)dismissUpgradeFlowWithSuccess:(BOOL)a3;
- (void)objectModel:(id)a3 configureTableRow:(id)a4 page:(id)a5;
- (void)objectModelDidChange:(id)a3;
- (void)remoteUIController:(id)a3 didDismissModalNavigationWithObjectModels:(id)a4;
- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)setDataclasses:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ICQUIRemoteUIPresenter

- (ICQUIRemoteUIPresenter)initWithAccount:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICQUIRemoteUIPresenter;
  v9 = [(ICQUIRemoteUIPresenter *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_presenter, a4);
    v11 = (RemoteUIController *)objc_alloc_init(MEMORY[0x263F637E8]);
    ruiController = v10->_ruiController;
    v10->_ruiController = v11;

    [(RemoteUIController *)v10->_ruiController setDelegate:v10];
    [(RemoteUIController *)v10->_ruiController setHostViewController:v10->_presenter];
  }

  return v10;
}

- (void)beginRUIFlowWithURL:(id)a3
{
  id v4 = [MEMORY[0x263F08BD8] requestWithURL:a3];
  [(ICQUIRemoteUIPresenter *)self beginRUIFlowWithRequest:v4];
}

- (void)beginRUIFlowWithRequest:(id)a3
{
  id v4 = a3;
  [(ICQUIRemoteUIPresenter *)self _attachServerHooks];
  [(RemoteUIController *)self->_ruiController loadRequest:v4 completion:&__block_literal_global_4];
}

void __50__ICQUIRemoteUIPresenter_beginRUIFlowWithRequest___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  v5 = _ICQGetLogSystem();
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "RUI flow initiated successfully.", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __50__ICQUIRemoteUIPresenter_beginRUIFlowWithRequest___block_invoke_cold_1((uint64_t)v4, v6);
  }
}

- (void)_attachServerHooks
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (self->_dataclasses)
  {
    id v4 = _ICQGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      dataclasses = self->_dataclasses;
      int v11 = 138412290;
      v12 = dataclasses;
      _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Attaching enable iCloud sync hook for dataclasses: %@", (uint8_t *)&v11, 0xCu);
    }

    v6 = [[ICQUIEnableiCloudSyncHook alloc] initWithAccount:self->_account dataclasses:self->_dataclasses];
    [v3 addObject:v6];
    id v7 = objc_alloc_init(ICQUILaunchURLHook);
    [v3 addObject:v7];
  }
  id v8 = [[ICQFamilySharingHook alloc] initWithFlowDelegate:self];
  [v3 addObject:v8];

  v9 = (RUIServerHookHandler *)[objc_alloc(MEMORY[0x263F637C0]) initWithRemoteUIController:self->_ruiController hooks:v3];
  serverHookHandler = self->_serverHookHandler;
  self->_serverHookHandler = v9;
}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  id v6 = a4;
  objc_msgSend(v6, "ak_addAnisetteHeaders");
  objc_msgSend(v6, "ak_addDeviceUDIDHeader");
  objc_msgSend(v6, "aa_addMultiUserDeviceHeaderIfEnabled");
  +[ICQUsageQuotaRequest addHeadersToRequest:v6 forAccount:self->_account];

  return 1;
}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "didFinishLoad forRequest: %@, error: %@", (uint8_t *)&v13, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    [v12 remoteUIFlowManager:self didLoadWithSuccess:v7 == 0 error:v7];
  }
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v9 = *a5;
    *(_DWORD *)buf = 134217984;
    unint64_t v17 = v9;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "objectModel received with action: %lu", buf, 0xCu);
  }

  [(ICQUIRemoteUIPresenter *)self _processObjectModel:v7];
  [(RUIServerHookHandler *)self->_serverHookHandler processObjectModel:v7 isModal:1];

  if (*a5 == 4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = (id)[(UIViewController *)self->_presenter popViewControllerAnimated:1];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        id v14 = objc_loadWeakRetained((id *)&self->_delegate);
        [v14 remoteUIFlowManager:self didDismissWithError:0];
      }
    }
  }
  else if (*a5 == 1)
  {
    presenter = self->_presenter;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __80__ICQUIRemoteUIPresenter_remoteUIController_didReceiveObjectModel_actionSignal___block_invoke;
    v15[3] = &unk_264921C80;
    v15[4] = self;
    [(UIViewController *)presenter dismissViewControllerAnimated:1 completion:v15];
  }
}

void __80__ICQUIRemoteUIPresenter_remoteUIController_didReceiveObjectModel_actionSignal___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
    [v4 remoteUIFlowManager:*(void *)(a1 + 32) didDismissWithError:0];
  }
}

- (void)remoteUIController:(id)a3 didDismissModalNavigationWithObjectModels:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  closeURL = self->_closeURL;
  id v6 = _ICQGetLogSystem();
  id v7 = v6;
  if (closeURL)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "didDismiss Notifying server - sheet was dismissed.", v10, 2u);
    }

    id v8 = (void *)MEMORY[0x263F88908];
    unint64_t v9 = self->_closeURL;
    uint64_t v11 = *MEMORY[0x263F88808];
    v12[0] = v9;
    id v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [v8 performAction:124 parameters:v7 options:2];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    -[ICQUIRemoteUIPresenter remoteUIController:didDismissModalNavigationWithObjectModels:](v7);
  }
}

- (void)objectModelDidChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 delegate];
    int v7 = 136315394;
    id v8 = "-[ICQUIRemoteUIPresenter objectModelDidChange:]";
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "%s, current delegate %@", (uint8_t *)&v7, 0x16u);
  }
  [(ICQUIRemoteUIPresenter *)self _processObjectModel:v4];
}

- (void)objectModel:(id)a3 configureTableRow:(id)a4 page:(id)a5
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    __int16 v9 = "-[ICQUIRemoteUIPresenter objectModel:configureTableRow:page:]";
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  [(ICQUIRemoteUIPresenter *)self _processTableRow:v6];
}

- (void)_processObjectModel:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[ICQUIRemoteUIPresenter _processObjectModel:]";
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "%s objectModel: %@", buf, 0x16u);
  }

  id v6 = [v4 clientInfo];
  int v7 = [v6 objectForKeyedSubscript:@"closeURL"];
  closeURL = self->_closeURL;
  self->_closeURL = v7;

  __int16 v9 = [v4 subElementWithID:@"substituteRowSection"];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = objc_msgSend(v9, "rows", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [(ICQUIRemoteUIPresenter *)self _processTableRow:*(void *)(*((void *)&v15 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)_processTableRow:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    long long v16 = "-[ICQUIRemoteUIPresenter _processTableRow:]";
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "%s tableRow: %@", (uint8_t *)&v15, 0x16u);
  }

  id v6 = [v4 attributes];
  int v7 = [v6 objectForKeyedSubscript:@"hasSubstitutions"];
  if (([v7 BOOLValue] & 1) == 0)
  {

LABEL_8:
    goto LABEL_9;
  }
  int v8 = [v4 attributes];
  __int16 v9 = [v8 objectForKeyedSubscript:@"index"];
  int v10 = [v9 intValue];
  unint64_t v11 = [(NSSet *)self->_dataclasses count];

  if (v11 > v10)
  {
    uint64_t v12 = [(NSSet *)self->_dataclasses allObjects];
    uint64_t v13 = [v4 attributes];
    uint64_t v14 = [v13 objectForKeyedSubscript:@"index"];
    id v6 = objc_msgSend(v12, "objectAtIndexedSubscript:", (int)objc_msgSend(v14, "intValue"));

    if (v6) {
      [(ICQUIRemoteUIPresenter *)self _configureTableRow:v4 withDataclass:v6];
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_configureTableRow:(id)a3 withDataclass:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  int v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315650;
    __int16 v17 = "-[ICQUIRemoteUIPresenter _configureTableRow:withDataclass:]";
    __int16 v18 = 2112;
    id v19 = v5;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "%s tableRow: %@ dataclass: %@", (uint8_t *)&v16, 0x20u);
  }

  int v8 = [v5 tableCell];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int v10 = +[ICQUIDataclassHelper localizedTextForDataclass:v6];
    unint64_t v11 = [v5 tableCell];
    uint64_t v12 = [v11 textLabel];
    [v12 setText:v10];

    uint64_t v13 = +[ICQUIDataclassHelper iconForDataclass:v6];
    uint64_t v14 = [v5 tableCell];
    int v15 = [v14 imageView];
    [v15 setImage:v13];
  }
}

- (void)dismissUpgradeFlowWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"NO";
    if (v3) {
      id v6 = @"YES";
    }
    *(_DWORD *)buf = 136315394;
    int v10 = "-[ICQUIRemoteUIPresenter dismissUpgradeFlowWithSuccess:]";
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "%s success: %@", buf, 0x16u);
  }

  presenter = self->_presenter;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__ICQUIRemoteUIPresenter_dismissUpgradeFlowWithSuccess___block_invoke;
  v8[3] = &unk_264921C80;
  v8[4] = self;
  [(UIViewController *)presenter dismissViewControllerAnimated:1 completion:v8];
}

void __56__ICQUIRemoteUIPresenter_dismissUpgradeFlowWithSuccess___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
    [v4 remoteUIFlowManager:*(void *)(a1 + 32) didCompleteFlowWithSuccess:1 error:0];
  }
}

- (BOOL)isLiftUIFlow
{
  return 0;
}

- (NSSet)dataclasses
{
  return self->_dataclasses;
}

- (void)setDataclasses:(id)a3
{
}

- (ICQUIRemoteUIPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICQUIRemoteUIPresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataclasses, 0);
  objc_storeStrong((id *)&self->_closeURL, 0);
  objc_storeStrong((id *)&self->_serverHookHandler, 0);
  objc_storeStrong((id *)&self->_ruiController, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

void __50__ICQUIRemoteUIPresenter_beginRUIFlowWithRequest___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "Failed to load RUI request with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)remoteUIController:(os_log_t)log didDismissModalNavigationWithObjectModels:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "didDismiss No closeURL found in RUI Response unable to notify server", v1, 2u);
}

@end