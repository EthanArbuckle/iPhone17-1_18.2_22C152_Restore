@interface UIRemoteViewControllerConnectionRequest
@end

@implementation UIRemoteViewControllerConnectionRequest

void __207___UIRemoteViewControllerConnectionRequest___requestRemoteViewController_service_fromServiceWithBundleIdentifier_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler___block_invoke(uint64_t a1)
{
  if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 1u) & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      v3 = (void *)WeakRetained[15];
      WeakRetained[15] = 0;
      v4 = WeakRetained;

      WeakRetained = v4;
    }
  }
}

uint64_t __207___UIRemoteViewControllerConnectionRequest___requestRemoteViewController_service_fromServiceWithBundleIdentifier_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _cancelUnconditionallyThen:a2];
}

uint64_t __207___UIRemoteViewControllerConnectionRequest___requestRemoteViewController_service_fromServiceWithBundleIdentifier_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectToPlugInKitService];
}

uint64_t __207___UIRemoteViewControllerConnectionRequest___requestRemoteViewController_service_fromServiceWithBundleIdentifier_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectToViewService];
}

void __207___UIRemoteViewControllerConnectionRequest___requestRemoteViewController_service_fromServiceWithBundleIdentifier_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = v4[12];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __207___UIRemoteViewControllerConnectionRequest___requestRemoteViewController_service_fromServiceWithBundleIdentifier_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler___block_invoke_6;
  v7[3] = &unk_1E52DA160;
  v8 = v4;
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __207___UIRemoteViewControllerConnectionRequest___requestRemoteViewController_service_fromServiceWithBundleIdentifier_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler___block_invoke_6(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_UIViewServiceErrorDomain" code:1 userInfo:&unk_1ED3F7C58];
  v2 = [*(id *)(a1 + 32) _cancelWithError:v3];
  [v2 whenCompleteDo:*(void *)(a1 + 40)];
}

void __71___UIRemoteViewControllerConnectionRequest__cancelUnconditionallyThen___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 104))
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    *(unsigned char *)(v2 + 104) = 1;
    v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = [*(id *)(*(void *)(a1 + 32) + 88) interface];

    if (v5)
    {
      id v6 = [*(id *)(*(void *)(a1 + 32) + 88) interface];
      v7 = [v6 disconnect];
      [v4 addObject:v7];
    }
    v8 = *(void **)(a1 + 32);
    id v9 = (void *)v8[10];
    if (v9)
    {
      v10 = [v9 invoke];
      [v4 addObject:v10];

      v8 = *(void **)(a1 + 32);
    }
    objc_initWeak(&location, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71___UIRemoteViewControllerConnectionRequest__cancelUnconditionallyThen___block_invoke_2;
    v11[3] = &unk_1E52F0B98;
    v11[4] = *(void *)(a1 + 32);
    objc_copyWeak(&v13, &location);
    id v12 = *(id *)(a1 + 40);
    +[_UIAsyncInvocationObserver whenInvocationsCompleteForObservers:v4 do:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __71___UIRemoteViewControllerConnectionRequest__cancelUnconditionallyThen___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71___UIRemoteViewControllerConnectionRequest__cancelUnconditionallyThen___block_invoke_3;
  v3[3] = &unk_1E52E95A0;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
}

void __71___UIRemoteViewControllerConnectionRequest__cancelUnconditionallyThen___block_invoke_3(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained[2];
  id v5 = WeakRetained;
  if (v3)
  {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, 0, WeakRetained[14]);
    WeakRetained = v5;
    id v4 = (void *)v5[2];
  }
  else
  {
    id v4 = 0;
  }
  WeakRetained[2] = 0;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __115___UIRemoteViewControllerConnectionRequest__connectToDeputyWithInterface_fromExportedHostingObject_successHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 48);
  v8 = *(NSObject **)(*(void *)(*(void *)(v7 + 8) + 40) + 96);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __115___UIRemoteViewControllerConnectionRequest__connectToDeputyWithInterface_fromExportedHostingObject_successHandler___block_invoke_2;
  block[3] = &unk_1E530D7B8;
  id v13 = v6;
  uint64_t v17 = v7;
  id v14 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v15 = v5;
  id v16 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_sync(v8, block);
}

id __115___UIRemoteViewControllerConnectionRequest__connectToDeputyWithInterface_fromExportedHostingObject_successHandler___block_invoke_2(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a1[4]) {
    return (id)objc_msgSend(*(id *)(*(void *)(a1[8] + 8) + 40), "_cancelWithError:");
  }
  uint64_t v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServiceConnectionRequest", &_UIInternalPreference_RemoteViewControllerSnapshotDelay_block_invoke___s_category)+ 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[5];
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "Successfully connected to deputy interface %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return (id)(*(uint64_t (**)(void))(a1[7] + 16))();
}

void __65___UIRemoteViewControllerConnectionRequest__connectToViewService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(NSObject **)(*(void *)(*(void *)(v7 + 8) + 40) + 96);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65___UIRemoteViewControllerConnectionRequest__connectToViewService__block_invoke_2;
  block[3] = &unk_1E52E5E48;
  id v13 = v5;
  uint64_t v14 = v7;
  id v12 = v6;
  id v9 = v5;
  id v10 = v6;
  dispatch_sync(v8, block);
}

id __65___UIRemoteViewControllerConnectionRequest__connectToViewService__block_invoke_2(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(id **)(*(void *)(a1[6] + 8) + 40);
  if (v2) {
    return (id)objc_msgSend(v3, "_cancelWithError:");
  }
  [v3[11] setInterface:a1[5]];
  id v5 = *(void **)(*(void *)(a1[6] + 8) + 40);
  return (id)[v5 _connectToViewControllerOperator];
}

void __70___UIRemoteViewControllerConnectionRequest__connectToPlugInKitService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(NSObject **)(*(void *)(*(void *)(v7 + 8) + 40) + 96);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70___UIRemoteViewControllerConnectionRequest__connectToPlugInKitService__block_invoke_2;
  block[3] = &unk_1E52E5E48;
  id v13 = v5;
  uint64_t v14 = v7;
  id v12 = v6;
  id v9 = v5;
  id v10 = v6;
  dispatch_sync(v8, block);
}

id __70___UIRemoteViewControllerConnectionRequest__connectToPlugInKitService__block_invoke_2(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(id **)(*(void *)(a1[6] + 8) + 40);
  if (v2) {
    return (id)objc_msgSend(v3, "_cancelWithError:");
  }
  [v3[11] setInterface:a1[5]];
  id v5 = *(void **)(*(void *)(a1[6] + 8) + 40);
  return (id)[v5 _connectToViewControllerOperator];
}

uint64_t __76___UIRemoteViewControllerConnectionRequest__connectToViewControllerOperator__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 88) setViewControllerOperatorProxy:a2];
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return [v3 _sendServiceViewControllerRequest];
}

id __77___UIRemoteViewControllerConnectionRequest__sendServiceViewControllerRequest__block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)[*(id *)(a1 + 32) _cancelWithError:a2];
}

void __77___UIRemoteViewControllerConnectionRequest__sendServiceViewControllerRequest__block_invoke_286(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v16 = v5;
  if (a3)
  {
    id v7 = (id)[v6 _cancelWithError:a3];
  }
  else
  {
    v8 = (void *)v6[11];
    id v9 = [v5 serviceWindowHostingHandle];
    [v8 setHostedWindowHostingHandle:v9];

    id v10 = *(void **)(*(void *)(a1 + 32) + 88);
    id v11 = [v16 supportedInterfaceOrientations];
    [v10 setServiceViewControllerSupportedInterfaceOrientations:v11];

    id v12 = *(void **)(*(void *)(a1 + 32) + 88);
    id v13 = [v16 accessibilityServerPort];
    [v12 setServiceAccessibilityServerPortWrapper:v13];

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "setPreferredStatusBarStyle:", objc_msgSend(v16, "preferredStatusBarStyle"));
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "setPreferredStatusBarVisibility:", objc_msgSend(v16, "preferredStatusBarVisibility"));
    int v14 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "__shouldHostRemoteTextEffectsWindow");
    id v15 = *(void **)(a1 + 32);
    if (v14) {
      [v15 _connectToTextEffectsOperator];
    }
    else {
      [v15 _connectToServiceViewController];
    }
  }
}

uint64_t __73___UIRemoteViewControllerConnectionRequest__connectToTextEffectsOperator__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 88) setTextEffectsOperatorProxy:a2];
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return [v3 _sendServiceTextEffectsRequest];
}

id __74___UIRemoteViewControllerConnectionRequest__sendServiceTextEffectsRequest__block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)[*(id *)(a1 + 32) _cancelWithError:a2];
}

uint64_t __74___UIRemoteViewControllerConnectionRequest__sendServiceTextEffectsRequest__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = *(void **)(*(void *)(a1 + 32) + 88);
  id v8 = a4;
  id v9 = a3;
  [v7 setTextEffectsWindowHostingHandle:a2];
  [*(id *)(*(void *)(a1 + 32) + 88) setTextEffectsWindowAboveStatusBarHostingHandle:v9];

  [*(id *)(*(void *)(a1 + 32) + 88) setRemoteKeyboardsWindowHostingHandle:v8];
  id v10 = *(void **)(a1 + 32);
  return [v10 _connectToServiceViewController];
}

uint64_t __75___UIRemoteViewControllerConnectionRequest__connectToServiceViewController__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 88) setServiceViewControllerProxy:a2];
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 _connectToViewControllerControlMessageDeputy];
}

uint64_t __88___UIRemoteViewControllerConnectionRequest__connectToViewControllerControlMessageDeputy__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 88) setServiceViewControllerControlMessageProxy:a2];
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 _didFinishEstablishingConnection];
}

@end