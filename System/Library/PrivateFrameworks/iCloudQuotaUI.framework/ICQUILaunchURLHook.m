@interface ICQUILaunchURLHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (id)continuationResponseBody;
- (void)_launchWithURLString:(id)a3 completion:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation ICQUILaunchURLHook

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"LAUNCH_URL"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  char v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F63818]];
  char v5 = [v4 isEqualToString:@"LAUNCH_URL"];

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a6;
  id v11 = a4;
  v12 = _ICQGetLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v9 name];
    int v15 = 138412290;
    v16 = v13;
    _os_log_impl(&dword_22C821000, v12, OS_LOG_TYPE_DEFAULT, "Processing iCloudSync RUI hook with element %@", (uint8_t *)&v15, 0xCu);
  }
  v14 = [v11 objectForKeyedSubscript:*MEMORY[0x263F63808]];

  [(ICQUILaunchURLHook *)self _launchWithURLString:v14 completion:v10];
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Processing iCloudSync RUI hook with objectModel %@", (uint8_t *)&v11, 0xCu);
  }

  id v9 = [v6 clientInfo];
  id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F63808]];
  [(ICQUILaunchURLHook *)self _launchWithURLString:v10 completion:v7];
}

- (void)_launchWithURLString:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Recieved URL to launch: %@, dismissing object models", buf, 0xCu);
  }

  id v9 = [(ICQUILaunchURLHook *)self delegate];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__ICQUILaunchURLHook__launchWithURLString_completion___block_invoke;
  v11[3] = &unk_2649221A0;
  id v12 = v7;
  id v10 = v7;
  [v9 dismissObjectModelsAnimated:1 completion:v11];
}

uint64_t __54__ICQUILaunchURLHook__launchWithURLString_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)continuationResponseBody
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
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_hookCompletion, 0);
}

@end