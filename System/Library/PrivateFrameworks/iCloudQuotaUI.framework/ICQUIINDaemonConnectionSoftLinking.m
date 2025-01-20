@interface ICQUIINDaemonConnectionSoftLinking
- (void)renewCredentialsWithCompletion:(id)a3;
@end

@implementation ICQUIINDaemonConnectionSoftLinking

- (void)renewCredentialsWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v4 = (void *)getINDaemonConnectionClass_softClass_2;
  uint64_t v14 = getINDaemonConnectionClass_softClass_2;
  if (!getINDaemonConnectionClass_softClass_2)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __getINDaemonConnectionClass_block_invoke_2;
    v10[3] = &unk_264921E58;
    v10[4] = &v11;
    __getINDaemonConnectionClass_block_invoke_2((uint64_t)v10);
    v4 = (void *)v12[3];
  }
  v5 = v4;
  _Block_object_dispose(&v11, 8);
  id v6 = objc_alloc_init(v5);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__ICQUIINDaemonConnectionSoftLinking_renewCredentialsWithCompletion___block_invoke;
  v8[3] = &unk_264922B88;
  id v9 = v3;
  id v7 = v3;
  [v6 renewCredentialsWithCompletion:v8];
}

void __69__ICQUIINDaemonConnectionSoftLinking_renewCredentialsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218242;
    uint64_t v8 = a2;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "Renew credential results: %lu - error: %@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end