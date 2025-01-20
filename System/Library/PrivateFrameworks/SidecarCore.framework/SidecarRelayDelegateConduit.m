@interface SidecarRelayDelegateConduit
- (void)sendDataRequest:(id)a3 completion:(id)a4;
@end

@implementation SidecarRelayDelegateConduit

- (void)sendDataRequest:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = SidecarCoreLogSubsystem(OS_LOG_TYPE_INFO);
  v8 = v7;
  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D954000, v8, OS_LOG_TYPE_INFO, "Sending a request to the relay delegate.", buf, 2u);
  }

  v9 = SidecarQueue();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__SidecarRelayDelegateConduit_sendDataRequest_completion___block_invoke;
  v12[3] = &unk_2649C6348;
  id v13 = v5;
  id v14 = v6;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v9, v12);
}

void __58__SidecarRelayDelegateConduit_sendDataRequest_completion___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__SidecarRelayDelegateConduit_sendDataRequest_completion___block_invoke_2;
  v3[3] = &unk_2649C6120;
  id v4 = *(id *)(a1 + 40);
  v2 = SidecarRelayProxyAsync(0, v3);
  [v2 relayDelegateSendDataRequest:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

void __58__SidecarRelayDelegateConduit_sendDataRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
  id v5 = v4;
  if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D954000, v5, OS_LOG_TYPE_ERROR, "Encountered error while trying to send a request to the relay delegate.  The error will be logged separately.", buf, 2u);
  }

  id v6 = v3;
  if (v6)
  {
    v9 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    if (v9)
    {
      log = v9;
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      v9 = log;
      if (v10)
      {
        id v11 = [v6 domain];
        uint64_t v12 = [v6 code];
        id v13 = [v6 localizedDescription];
        *(_DWORD *)buf = 138543875;
        v16 = v11;
        __int16 v17 = 2048;
        uint64_t v18 = v12;
        __int16 v19 = 2113;
        v20 = v13;
        _os_log_impl(&dword_22D954000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

        v9 = log;
      }
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = [MEMORY[0x263EFF8F8] data];
  (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v6);
}

@end