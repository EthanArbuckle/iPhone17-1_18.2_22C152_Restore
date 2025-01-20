@interface ICQUIStorageUsedController
- (ICQUIStorageUsedController)initWithAppBundleID:(id)a3 account:(id)a4 navigationController:(id)a5;
- (void)_beginLiftUIFlowWithURL:(id)a3;
- (void)_beginRUIFlowWithURL:(id)a3;
- (void)_startSpinnerInSpecifier:(id)a3;
- (void)_stopSpinnerInSpecifier:(id)a3;
- (void)beginLoading;
- (void)beginLoadingForSpecifier:(id)a3;
- (void)loadFailed:(id)a3 withError:(id)a4;
- (void)loadFinished:(id)a3;
- (void)loadStarted:(id)a3;
@end

@implementation ICQUIStorageUsedController

- (ICQUIStorageUsedController)initWithAppBundleID:(id)a3 account:(id)a4 navigationController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICQUIStorageUsedController;
  v12 = [(ICQUIStorageUsedController *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a4);
    objc_storeStrong((id *)&v13->_appBundleID, a3);
    objc_storeStrong((id *)&v13->_navigationController, a5);
  }

  return v13;
}

- (void)beginLoading
{
}

- (void)beginLoadingForSpecifier:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_activeSpecifier, a3);
  [(ICQUIStorageUsedController *)self _startSpinnerInSpecifier:v5];
  v6 = (void *)[objc_alloc(MEMORY[0x263F888D0]) initWithAccount:self->_account];
  appBundleID = self->_appBundleID;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__ICQUIStorageUsedController_beginLoadingForSpecifier___block_invoke;
  v9[3] = &unk_264922A30;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [v6 fetchStorageByApp:appBundleID completion:v9];
}

void __55__ICQUIStorageUsedController_beginLoadingForSpecifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = _ICQGetLogSystem();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__ICQUIStorageUsedController_beginLoadingForSpecifier___block_invoke_cold_1((uint64_t)v6, v8);
    }

    [*(id *)(a1 + 32) _stopSpinnerInSpecifier:*(void *)(a1 + 40)];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Fetch app storage finished with success.", buf, 2u);
    }

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __55__ICQUIStorageUsedController_beginLoadingForSpecifier___block_invoke_28;
    v11[3] = &unk_264921B68;
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 32);
    id v12 = v9;
    uint64_t v13 = v10;
    dispatch_async(MEMORY[0x263EF83A0], v11);
  }
}

void __55__ICQUIStorageUsedController_beginLoadingForSpecifier___block_invoke_28(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) ruiURL];

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  if (v2)
  {
    id v5 = [v3 ruiURL];
    objc_msgSend(v4, "_beginRUIFlowWithURL:");
  }
  else
  {
    id v5 = [v3 liftUIURL];
    objc_msgSend(v4, "_beginLiftUIFlowWithURL:");
  }
}

- (void)_beginRUIFlowWithURL:(id)a3
{
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Initiating RUI flow.", v8, 2u);
  }

  id v6 = [[ICQPreferencesRemoteUIDelegate alloc] initWithNavigationController:self->_navigationController initialAction:0 account:self->_account];
  ruiDelegate = self->_ruiDelegate;
  self->_ruiDelegate = v6;

  [(ICQPreferencesRemoteUIDelegate *)self->_ruiDelegate setDelegate:self];
  [(ICQPreferencesRemoteUIDelegate *)self->_ruiDelegate loadURL:v4 postBody:0];
}

- (void)_beginLiftUIFlowWithURL:(id)a3
{
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Initiating LiftUI flow.", v8, 2u);
  }

  id v6 = [[ICQUIPreferencesLiftUIDelegate alloc] initWithNavigationController:self->_navigationController account:self->_account];
  liftUIDelegate = self->_liftUIDelegate;
  self->_liftUIDelegate = v6;

  [(ICQUIPreferencesLiftUIDelegate *)self->_liftUIDelegate loadURL:v4];
  [(ICQUIStorageUsedController *)self _stopSpinnerInSpecifier:self->_activeSpecifier];
}

- (void)loadStarted:(id)a3
{
  v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Storage used VC loading started.", v4, 2u);
  }
}

- (void)loadFinished:(id)a3
{
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Storage used VC load finished with success.", v5, 2u);
  }

  [(ICQUIStorageUsedController *)self _stopSpinnerInSpecifier:self->_activeSpecifier];
}

- (void)loadFailed:(id)a3 withError:(id)a4
{
  id v5 = a4;
  id v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[ICQUIStorageUsedController loadFailed:withError:]((uint64_t)v5, v6);
  }

  [(ICQUIStorageUsedController *)self _stopSpinnerInSpecifier:self->_activeSpecifier];
}

- (void)_startSpinnerInSpecifier:(id)a3
{
  id v5 = [a3 propertyForKey:*MEMORY[0x263F602B0]];
  if (v5)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    id v4 = [MEMORY[0x263F825C8] systemGrayColor];
    [v3 setColor:v4];

    [v3 startAnimating];
    [v5 setAccessoryView:v3];
  }
}

- (void)_stopSpinnerInSpecifier:(id)a3
{
  id v5 = a3;
  v3 = [v5 propertyForKey:*MEMORY[0x263F602B0]];
  if (v3)
  {
    id v4 = [v5 propertyForKey:*MEMORY[0x263F60028]];
    [v3 setAccessoryView:v4];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSpecifier, 0);
  objc_storeStrong((id *)&self->_liftUIDelegate, 0);
  objc_storeStrong((id *)&self->_ruiDelegate, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

void __55__ICQUIStorageUsedController_beginLoadingForSpecifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "Fetch app storage failed with error %@", (uint8_t *)&v2, 0xCu);
}

- (void)loadFailed:(uint64_t)a1 withError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "Storage used VC load failed with error: %@", (uint8_t *)&v2, 0xCu);
}

@end