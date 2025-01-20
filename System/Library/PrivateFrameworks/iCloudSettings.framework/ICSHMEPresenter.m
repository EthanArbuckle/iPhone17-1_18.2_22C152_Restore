@interface ICSHMEPresenter
- (ICSCloudHomeViewDelegate)delegate;
- (ICSHMEPresenter)initWithAccountManager:(id)a3;
- (void)remoteUIRequestComplete:(id)a3 error:(id)a4;
- (void)setDelegate:(id)a3;
- (void)showHMEWithPresenter:(id)a3;
@end

@implementation ICSHMEPresenter

- (ICSHMEPresenter)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSHMEPresenter;
  v6 = [(ICSHMEPresenter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountManager, a3);
  }

  return v7;
}

- (void)showHMEWithPresenter:(id)a3
{
  v20[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = [(ICSHMEPresenter *)self delegate];
  [v5 didStartLoadingWithView:1];

  v6 = [MEMORY[0x263F29270] bagForAltDSID:0];
  v7 = [v6 privateEmailManageURL];

  id v8 = objc_alloc_init(MEMORY[0x263F089E0]);
  [v8 setURL:v7];
  [v8 setHTTPMethod:@"GET"];
  objc_super v9 = LogSubsystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[ICSPrivateEmailSpecifierProvider _privateEmailSpecifierWasTapped:]((uint64_t)v8, v9);
  }

  v10 = objc_alloc_init(ICSMatterhornUpsellHook);
  v11 = objc_alloc_init(ICSPrivateEmailUpdateCacheHook);
  v12 = [(AIDAAccountManager *)self->_accountManager accounts];
  v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  id v14 = objc_alloc(MEMORY[0x263F25CC0]);
  v15 = objc_msgSend(v13, "aa_altDSID");
  v16 = (void *)[v14 initWithAltDSID:v15 upgradeContext:*MEMORY[0x263F29098]];

  v20[0] = v10;
  v20[1] = v11;
  v20[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:3];
  v18 = (AAUIGrandSlamRemoteUIPresenter *)[objc_alloc(MEMORY[0x263F25CD8]) initWithAccountManager:self->_accountManager presenter:v4 hooks:v17];

  privateEmailPresenter = self->_privateEmailPresenter;
  self->_privateEmailPresenter = v18;

  [(AAUIGrandSlamRemoteUIPresenter *)self->_privateEmailPresenter setDelegate:self];
  [(AAUIGrandSlamRemoteUIPresenter *)self->_privateEmailPresenter loadRequest:v8];
}

- (void)remoteUIRequestComplete:(id)a3 error:(id)a4
{
  id v5 = a4;
  v6 = LogSubsystem();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ICSPrivateEmailSpecifierProvider remoteUIRequestComplete:error:]((uint64_t)v5, v7);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_262993000, v7, OS_LOG_TYPE_DEFAULT, "private email specifier provider success", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ICSHMEPresenter_remoteUIRequestComplete_error___block_invoke;
  block[3] = &unk_2655B5688;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __49__ICSHMEPresenter_remoteUIRequestComplete_error___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 didStopLoadingWithView:1];
}

- (ICSCloudHomeViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICSCloudHomeViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountManager, 0);

  objc_storeStrong((id *)&self->_privateEmailPresenter, 0);
}

@end