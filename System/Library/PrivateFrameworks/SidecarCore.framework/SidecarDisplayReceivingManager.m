@interface SidecarDisplayReceivingManager
- (void)disconnectFromDeviceWithIdentifier:(id)a3 completion:(id)a4;
- (void)fetchDeviceReadinessStatusWithIDSIdentifier:(id)a3 completion:(id)a4;
- (void)fetchSendingDeviceSessionStatesWithCompletion:(id)a3;
- (void)ignoreDetectionForAnchorIdentifier:(id)a3 completion:(id)a4;
- (void)requestConnectionFromDeviceWithIdentifier:(id)a3 completion:(id)a4;
@end

@implementation SidecarDisplayReceivingManager

- (void)fetchDeviceReadinessStatusWithIDSIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = SidecarCoreLogSubsystem(OS_LOG_TYPE_DEFAULT);
  v8 = v7;
  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v5;
    _os_log_impl(&dword_22D954000, v8, OS_LOG_TYPE_DEFAULT, "Fetching readiness for identifier: [%{public}@]", buf, 0xCu);
  }

  v9 = SidecarQueue();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __89__SidecarDisplayReceivingManager_fetchDeviceReadinessStatusWithIDSIdentifier_completion___block_invoke;
  v12[3] = &unk_2649C6348;
  id v13 = v5;
  id v14 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v9, v12);
}

void __89__SidecarDisplayReceivingManager_fetchDeviceReadinessStatusWithIDSIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v3 = MEMORY[0x263EF8330];
  uint64_t v4 = 3221225472;
  id v5 = __89__SidecarDisplayReceivingManager_fetchDeviceReadinessStatusWithIDSIdentifier_completion___block_invoke_2;
  id v6 = &unk_2649C6170;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  v2 = SidecarRelayProxyAsync(0, &v3);
  objc_msgSend(v2, "relayFetchDeviceReadinessStatusWithIDSIdentifier:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40), v3, v4, v5, v6);
}

void __89__SidecarDisplayReceivingManager_fetchDeviceReadinessStatusWithIDSIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
  id v5 = v4;
  if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v7 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v15 = v7;
    _os_log_impl(&dword_22D954000, v5, OS_LOG_TYPE_ERROR, "Encountered error while trying to fetch readiness for device with IDS identifier [%{public}@].  The error will be logged separately.", buf, 0xCu);
  }

  id v6 = v3;
  if (v6)
  {
    id v8 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    if (v8)
    {
      log = v8;
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      id v8 = log;
      if (v9)
      {
        id v10 = [v6 domain];
        uint64_t v11 = [v6 code];
        v12 = [v6 localizedDescription];
        *(_DWORD *)buf = 138543875;
        v15 = v10;
        __int16 v16 = 2048;
        uint64_t v17 = v11;
        __int16 v18 = 2113;
        v19 = v12;
        _os_log_impl(&dword_22D954000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

        id v8 = log;
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)ignoreDetectionForAnchorIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = SidecarCoreLogSubsystem(OS_LOG_TYPE_DEFAULT);
  id v8 = v7;
  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v5;
    _os_log_impl(&dword_22D954000, v8, OS_LOG_TYPE_DEFAULT, "Requesting to ignore detection for identifier: [%{public}@]", buf, 0xCu);
  }

  BOOL v9 = SidecarQueue();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __80__SidecarDisplayReceivingManager_ignoreDetectionForAnchorIdentifier_completion___block_invoke;
  v12[3] = &unk_2649C6348;
  id v13 = v5;
  id v14 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v9, v12);
}

void __80__SidecarDisplayReceivingManager_ignoreDetectionForAnchorIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v3 = MEMORY[0x263EF8330];
  uint64_t v4 = 3221225472;
  id v5 = __80__SidecarDisplayReceivingManager_ignoreDetectionForAnchorIdentifier_completion___block_invoke_2;
  id v6 = &unk_2649C6170;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  v2 = SidecarRelayProxyAsync(0, &v3);
  objc_msgSend(v2, "relayIgnoreDetectionForAnchorIdentifier:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40), v3, v4, v5, v6);
}

void __80__SidecarDisplayReceivingManager_ignoreDetectionForAnchorIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
  id v5 = v4;
  if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v7 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v15 = v7;
    _os_log_impl(&dword_22D954000, v5, OS_LOG_TYPE_ERROR, "Encountered error while trying to ignore detection for identifier [%{public}@].  The error will be logged separately.", buf, 0xCu);
  }

  id v6 = v3;
  if (v6)
  {
    id v8 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    if (v8)
    {
      log = v8;
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      id v8 = log;
      if (v9)
      {
        id v10 = [v6 domain];
        uint64_t v11 = [v6 code];
        v12 = [v6 localizedDescription];
        *(_DWORD *)buf = 138543875;
        v15 = v10;
        __int16 v16 = 2048;
        uint64_t v17 = v11;
        __int16 v18 = 2113;
        v19 = v12;
        _os_log_impl(&dword_22D954000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

        id v8 = log;
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)disconnectFromDeviceWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = SidecarCoreLogSubsystem(OS_LOG_TYPE_DEFAULT);
  id v8 = v7;
  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v5;
    _os_log_impl(&dword_22D954000, v8, OS_LOG_TYPE_DEFAULT, "Disconnecting the virtual display session from device with identifier: [%{public}@].", buf, 0xCu);
  }

  BOOL v9 = SidecarQueue();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __80__SidecarDisplayReceivingManager_disconnectFromDeviceWithIdentifier_completion___block_invoke;
  v12[3] = &unk_2649C6348;
  id v13 = v5;
  id v14 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v9, v12);
}

void __80__SidecarDisplayReceivingManager_disconnectFromDeviceWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v3 = MEMORY[0x263EF8330];
  uint64_t v4 = 3221225472;
  id v5 = __80__SidecarDisplayReceivingManager_disconnectFromDeviceWithIdentifier_completion___block_invoke_2;
  id v6 = &unk_2649C6170;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  v2 = SidecarRelayProxyAsync(0, &v3);
  objc_msgSend(v2, "relayIssueRemoteDisplayDisconnectionRequestToSendingDeviceWithIdentifier:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40), v3, v4, v5, v6);
}

void __80__SidecarDisplayReceivingManager_disconnectFromDeviceWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
  id v5 = v4;
  if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v7 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v15 = v7;
    _os_log_impl(&dword_22D954000, v5, OS_LOG_TYPE_ERROR, "Encountered error while trying to disconnect the virtual display session from device with identifier: [%{public}@]. The error will be logged separately.", buf, 0xCu);
  }

  id v6 = v3;
  if (v6)
  {
    id v8 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    if (v8)
    {
      log = v8;
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      id v8 = log;
      if (v9)
      {
        id v10 = [v6 domain];
        uint64_t v11 = [v6 code];
        v12 = [v6 localizedDescription];
        *(_DWORD *)buf = 138543875;
        v15 = v10;
        __int16 v16 = 2048;
        uint64_t v17 = v11;
        __int16 v18 = 2113;
        v19 = v12;
        _os_log_impl(&dword_22D954000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

        id v8 = log;
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)requestConnectionFromDeviceWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = SidecarCoreLogSubsystem(OS_LOG_TYPE_DEFAULT);
  id v8 = v7;
  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v5;
    _os_log_impl(&dword_22D954000, v8, OS_LOG_TYPE_DEFAULT, "Requesting that device with identifier [%{public}@] open a virtual display session with this device.", buf, 0xCu);
  }

  BOOL v9 = SidecarQueue();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __87__SidecarDisplayReceivingManager_requestConnectionFromDeviceWithIdentifier_completion___block_invoke;
  v12[3] = &unk_2649C6348;
  id v13 = v5;
  id v14 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v9, v12);
}

void __87__SidecarDisplayReceivingManager_requestConnectionFromDeviceWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v3 = MEMORY[0x263EF8330];
  uint64_t v4 = 3221225472;
  id v5 = __87__SidecarDisplayReceivingManager_requestConnectionFromDeviceWithIdentifier_completion___block_invoke_2;
  id v6 = &unk_2649C6170;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  v2 = SidecarRelayProxyAsync(0, &v3);
  objc_msgSend(v2, "relayIssueRemoteDisplayConnectionRequestToSendingDeviceWithIdentifier:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40), v3, v4, v5, v6);
}

void __87__SidecarDisplayReceivingManager_requestConnectionFromDeviceWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
  id v5 = v4;
  if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v7 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v15 = v7;
    _os_log_impl(&dword_22D954000, v5, OS_LOG_TYPE_ERROR, "Encountered error while trying to request that device with identifier [%{public}@] open a virtual display session with this device.  The error will be logged separately.", buf, 0xCu);
  }

  id v6 = v3;
  if (v6)
  {
    id v8 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    if (v8)
    {
      log = v8;
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      id v8 = log;
      if (v9)
      {
        id v10 = [v6 domain];
        uint64_t v11 = [v6 code];
        v12 = [v6 localizedDescription];
        *(_DWORD *)buf = 138543875;
        v15 = v10;
        __int16 v16 = 2048;
        uint64_t v17 = v11;
        __int16 v18 = 2113;
        v19 = v12;
        _os_log_impl(&dword_22D954000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

        id v8 = log;
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchSendingDeviceSessionStatesWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = SidecarCoreLogSubsystem(OS_LOG_TYPE_INFO);
  id v5 = v4;
  if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D954000, v5, OS_LOG_TYPE_INFO, "Fetching the sending remote display device session states.", buf, 2u);
  }

  id v6 = SidecarQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__SidecarDisplayReceivingManager_fetchSendingDeviceSessionStatesWithCompletion___block_invoke;
  block[3] = &unk_2649C6148;
  id v9 = v3;
  id v7 = v3;
  dispatch_async(v6, block);
}

void __80__SidecarDisplayReceivingManager_fetchSendingDeviceSessionStatesWithCompletion___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __80__SidecarDisplayReceivingManager_fetchSendingDeviceSessionStatesWithCompletion___block_invoke_2;
  v3[3] = &unk_2649C6120;
  id v4 = *(id *)(a1 + 32);
  v2 = SidecarRelayProxyAsync(0, v3);
  [v2 relayFetchRemoteDisplaySendingDeviceStatesWithCompletion:*(void *)(a1 + 32)];
}

void __80__SidecarDisplayReceivingManager_fetchSendingDeviceSessionStatesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
  id v5 = v4;
  if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D954000, v5, OS_LOG_TYPE_ERROR, "Encountered error while trying to fetch sending remote display device session states.  The error will be logged separately.", buf, 2u);
  }

  id v6 = v3;
  if (v6)
  {
    id v9 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    if (v9)
    {
      log = v9;
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      id v9 = log;
      if (v10)
      {
        uint64_t v11 = [v6 domain];
        uint64_t v12 = [v6 code];
        id v13 = [v6 localizedDescription];
        *(_DWORD *)buf = 138543875;
        __int16 v16 = v11;
        __int16 v17 = 2048;
        uint64_t v18 = v12;
        __int16 v19 = 2113;
        uint64_t v20 = v13;
        _os_log_impl(&dword_22D954000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

        id v9 = log;
      }
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [MEMORY[0x263EFF8C0] array];
  (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v6);
}

@end