@interface ICQUIManageSubHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5;
- (RUIServerHookDelegate)delegate;
- (void)_openAMSUIWithBag:(id)a3 version:(id)a4 url:(id)a5 completion:(id)a6;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation ICQUIManageSubHook

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"ICQManageSubAction"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  char v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F63818]];
  char v5 = [v4 isEqualToString:@"ICQManageSubAction"];

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a6;
  id v11 = a4;
  v12 = _ICQGetLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v9 name];
    int v18 = 138412290;
    v19 = v13;
    _os_log_impl(&dword_22C821000, v12, OS_LOG_TYPE_DEFAULT, "Processing Manage Sub RUI hook with element %@", (uint8_t *)&v18, 0xCu);
  }
  v14 = [v11 objectForKeyedSubscript:@"bagProfile"];
  v15 = [v11 objectForKeyedSubscript:@"bagProfileVersion"];
  v16 = [v11 objectForKeyedSubscript:@"manageSubsURL"];

  if (v14 && v15 && v16)
  {
    [(ICQUIManageSubHook *)self _openAMSUIWithBag:v14 version:v15 url:v16 completion:v10];
  }
  else
  {
    v17 = _ICQGetLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412802;
      v19 = v14;
      __int16 v20 = 2112;
      v21 = v15;
      __int16 v22 = 2112;
      v23 = v16;
      _os_log_error_impl(&dword_22C821000, v17, OS_LOG_TYPE_ERROR, "Manage Subs Hook - Attributes missing in element bag: %@, version: %@, manageSubURL: %@", (uint8_t *)&v18, 0x20u);
    }
  }
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 name];
    int v17 = 138412290;
    int v18 = v9;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Processing Manage Sub RUI hook with model %@", (uint8_t *)&v17, 0xCu);
  }
  id v10 = [v6 clientInfo];
  id v11 = [v10 objectForKeyedSubscript:@"bagProfile"];

  v12 = [v6 clientInfo];
  v13 = [v12 objectForKeyedSubscript:@"bagProfileVersion"];

  v14 = [v6 clientInfo];
  v15 = [v14 objectForKeyedSubscript:@"manageSubsURL"];

  if (v11 && v13 && v15)
  {
    [(ICQUIManageSubHook *)self _openAMSUIWithBag:v11 version:v13 url:v15 completion:v7];
  }
  else
  {
    v16 = _ICQGetLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412802;
      int v18 = v11;
      __int16 v19 = 2112;
      __int16 v20 = v13;
      __int16 v21 = 2112;
      __int16 v22 = v15;
      _os_log_error_impl(&dword_22C821000, v16, OS_LOG_TYPE_ERROR, "Manage Subs Hook - Attributes missing in object model bag: %@, version: %@, manageSubURL: %@", (uint8_t *)&v17, 0x20u);
    }
  }
}

- (void)_openAMSUIWithBag:(id)a3 version:(id)a4 url:(id)a5 completion:(id)a6
{
  v25[1] = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = [MEMORY[0x263F27B28] bagForProfile:a3 profileVersion:a4];
  id v11 = [MEMORY[0x263EFB210] defaultStore];
  v12 = objc_msgSend(v11, "ams_activeiTunesAccount");

  v13 = (void *)[objc_alloc(MEMORY[0x263F28030]) initWithBag:v10 account:v12 clientInfo:0];
  v14 = (void *)[objc_alloc(NSURL) initWithString:v9];
  v15 = (void *)[objc_alloc(MEMORY[0x263F08BD8]) initWithURL:v14];
  if (v15)
  {
    [v13 setDelegate:self];
    uint64_t v24 = @"source";
    v25[0] = @"iCloudFreshmint";
    v16 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    [v13 setClientOptions:v16];

    id v17 = (id)[v13 loadRequest:v15];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    __int16 v19 = [WeakRetained presentationContextForHook:self];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__ICQUIManageSubHook__openAMSUIWithBag_version_url_completion___block_invoke;
    block[3] = &unk_264921B68;
    id v22 = v19;
    id v23 = v13;
    __int16 v20 = v19;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    __int16 v20 = _ICQGetLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[ICQUIManageSubHook _openAMSUIWithBag:version:url:completion:]((uint64_t)v9, v20);
    }
  }
}

uint64_t __63__ICQUIManageSubHook__openAMSUIWithBag_version_url_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pushViewController:*(void *)(a1 + 40) animated:1];
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  return 0;
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_openAMSUIWithBag:(uint64_t)a1 version:(NSObject *)a2 url:completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "Manage Subs Hook - Unable to create request from provided URL %@. Bailing.", (uint8_t *)&v2, 0xCu);
}

@end