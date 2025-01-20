@interface ICQUpgradePhotosOptimizeEnableHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (id)continuationResponseBody;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation ICQUpgradePhotosOptimizeEnableHook

- (BOOL)shouldMatchElement:(id)a3
{
  return 0;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a6;
  v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v7 name];
    int v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "Couldn't process element |%@|, It's not yet supported.", (uint8_t *)&v11, 0xCu);
  }
  (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
}

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  v4 = [v3 objectForKey:@"action"];
  char v5 = [v4 isEqualToString:@"ENABLE_OPTIMIZE_ICPL"];

  return v5;
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
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
}

@end