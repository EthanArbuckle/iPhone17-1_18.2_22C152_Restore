@interface UIOverlayService
@end

@implementation UIOverlayService

void __69___UIOverlayService__makeConnectionIfNecessaryWithConnectionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = [WeakRetained serviceConnection];

    if (!v4)
    {
      v5 = (void *)MEMORY[0x1E4F62888];
      v6 = +[_UIOverlayServiceInterfaceSpecification identifier];
      v7 = [v5 endpointForMachName:0x1ED14C440 service:v6 instance:0];

      v8 = [MEMORY[0x1E4F62880] connectionWithEndpoint:v7];
      [v3 setServiceConnection:v8];

      v9 = [v3 serviceConnection];

      if (v9)
      {
        objc_initWeak(&location, v3);
        v10 = [v3 serviceConnection];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __69___UIOverlayService__makeConnectionIfNecessaryWithConnectionHandler___block_invoke_2;
        v14[3] = &unk_1E5310318;
        objc_copyWeak(&v15, &location);
        v14[4] = *(void *)(a1 + 32);
        [v10 configureConnection:v14];

        v11 = [v3 serviceConnection];
        [v11 activate];

        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
      }
    }
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12)
    {
      v13 = [v3 serviceConnection];
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
    }
  }
}

void __69___UIOverlayService__makeConnectionIfNecessaryWithConnectionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 16)];
    v5 = +[_UIOverlayServiceInterfaceSpecification interface];
    [v3 setInterface:v5];

    v6 = +[_UIOverlayServiceInterfaceSpecification serviceQuality];
    [v3 setServiceQuality:v6];

    v7 = [[_UIWeakOverlayService alloc] initWithService:WeakRetained];
    [v3 setInterfaceTarget:v7];

    objc_initWeak(&location, WeakRetained);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69___UIOverlayService__makeConnectionIfNecessaryWithConnectionHandler___block_invoke_3;
    v8[3] = &unk_1E53102F0;
    objc_copyWeak(&v9, &location);
    [v3 setInvalidationHandler:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __69___UIOverlayService__makeConnectionIfNecessaryWithConnectionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_initWeak(&location, WeakRetained);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69___UIOverlayService__makeConnectionIfNecessaryWithConnectionHandler___block_invoke_4;
    block[3] = &unk_1E52DC308;
    objc_copyWeak(&v9, &location);
    dispatch_async(MEMORY[0x1E4F14428], block);
    v5 = [WeakRetained connectionQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69___UIOverlayService__makeConnectionIfNecessaryWithConnectionHandler___block_invoke_5;
    v6[3] = &unk_1E52DC308;
    objc_copyWeak(&v7, &location);
    dispatch_async(v5, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __69___UIOverlayService__makeConnectionIfNecessaryWithConnectionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    [v2 overlayServiceDidInvalidate:v3];

    id WeakRetained = v3;
  }
}

void __69___UIOverlayService__makeConnectionIfNecessaryWithConnectionHandler___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setServiceConnection:0];
    id WeakRetained = v2;
  }
}

void __45___UIOverlayService__asyncTargetWithHandler___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F96358];
  id v4 = a2;
  v5 = [v3 attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v7 = [v4 remoteTargetWithLaunchingAssertionAttributes:v6];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __39___UIOverlayService_sendOverlayAction___block_invoke(uint64_t a1, void *a2)
{
  return [a2 performOverlayServerAction:*(void *)(a1 + 32)];
}

uint64_t __48___UIOverlayService_performOverlayClientAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleClientActionToOverlayService:*(void *)(a1 + 40)];
}

@end