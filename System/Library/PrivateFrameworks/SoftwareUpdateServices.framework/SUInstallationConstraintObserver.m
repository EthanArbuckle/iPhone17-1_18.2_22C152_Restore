@interface SUInstallationConstraintObserver
- (BOOL)_hasAnyBlockObservers;
- (SUDownload)download;
- (SUInstallOptions)installOptions;
- (SUInstallationConstraintObserver)init;
- (SUInstallationConstraintObserver)initWithDownload:(id)a3;
- (SUInstallationConstraintObserver)initWithDownload:(id)a3 andInstallOptions:(id)a4;
- (SUInstallationConstraintObserver)initWithDownload:(id)a3 installOptions:(id)a4 queue:(id)a5 constraints:(id)a6;
- (SUInstallationConstraintObserver)initWithDownload:(id)a3 queue:(id)a4 constraints:(id)a5;
- (id)monitorOfClass:(Class)a3;
- (id)registerObserverBlock:(id)a3;
- (void)_queue_noteInstallationConstraintMonitor:(id)a3 constraintsDidChange:(unint64_t)a4;
- (void)_removeToken:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateWithError:(id)a3;
@end

@implementation SUInstallationConstraintObserver

- (SUInstallationConstraintObserver)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SUInstallationConstraintObserver.m" lineNumber:86 description:@"Init is unsupported.  Please use -[SUInstallationConstraintObserver initWithDownload:] instead."];

  return 0;
}

- (SUInstallationConstraintObserver)initWithDownload:(id)a3
{
  return [(SUInstallationConstraintObserver *)self initWithDownload:a3 andInstallOptions:0];
}

- (SUInstallationConstraintObserver)initWithDownload:(id)a3 andInstallOptions:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = dispatch_queue_create("com.apple.softwareupdateservices.installationconstraints.bg", 0);
  v9 = [MEMORY[0x263EFF9C0] set];
  v10 = [MEMORY[0x263F086E0] mainBundle];
  v11 = [v10 bundleIdentifier];
  int v12 = [v11 isEqualToString:@"com.apple.softwareupdateservices"];

  if (v12)
  {
    v13 = [MEMORY[0x263F7E1A0] sharedInstance];
    BOOL v14 = [v13 currentAudioAndVideoCallCount] != 0;
  }
  else
  {
    BOOL v14 = 0;
    v13 = 0;
  }
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  v28 = __71__SUInstallationConstraintObserver_initWithDownload_andInstallOptions___block_invoke;
  v29 = &unk_26447DA20;
  id v15 = v9;
  id v30 = v15;
  v16 = v8;
  v31 = v16;
  id v17 = v6;
  id v32 = v17;
  id v18 = v7;
  char v35 = v12;
  id v33 = v18;
  v34 = v13;
  BOOL v36 = v14;
  id v19 = v13;
  dispatch_sync(v16, &v26);
  v20 = -[SUInstallationConstraintObserver initWithDownload:installOptions:queue:constraints:](self, "initWithDownload:installOptions:queue:constraints:", v17, v18, v16, v15, v26, v27, v28, v29);
  v21 = SULogInstallConstraints();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = SUStringFromInstallationConstraints([(SUComposedInstallationConstraintMonitor *)v20 unsatisfiedConstraints]);
    *(_DWORD *)buf = 138412546;
    v38 = v20;
    __int16 v39 = 2112;
    v40 = v22;
    _os_log_impl(&dword_21DCF7000, v21, OS_LOG_TYPE_INFO, "[InstallationConstraintObserver] Create: %@ (unsatisfied constraints: %@)", buf, 0x16u);
  }
  v23 = v34;
  v24 = v20;

  return v24;
}

void __71__SUInstallationConstraintObserver_initWithDownload_andInstallOptions___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [[SUInstallationConstraintMonitorForBatteryDiskAndKeybag alloc] initOnQueue:*(void *)(a1 + 40) withDownload:*(void *)(a1 + 48) andInstallOptions:*(void *)(a1 + 56)];
  [v2 addObject:v3];

  v4 = *(void **)(a1 + 32);
  id v5 = [[SUInstallationConstraintMonitorNetwork alloc] initOnQueue:*(void *)(a1 + 40) withDownload:*(void *)(a1 + 48)];
  [v4 addObject:v5];

  LODWORD(v5) = *(unsigned __int8 *)(a1 + 72);
  id v6 = *(void **)(a1 + 32);
  id v7 = [SUInstallationConstraintMonitorPhoneCalls alloc];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  if (v5) {
    uint64_t v10 = [(SUInstallationConstraintMonitorPhoneCalls *)v7 initOnQueue:v8 withDownload:v9 callCenter:*(void *)(a1 + 64) inSpringBoard:*(unsigned __int8 *)(a1 + 72) onExistingPhoneCall:*(unsigned __int8 *)(a1 + 73)];
  }
  else {
    uint64_t v10 = [(SUInstallationConstraintMonitorPhoneCalls *)v7 initOnQueue:v8 withDownload:v9];
  }
  v11 = (void *)v10;
  [v6 addObject:v10];

  int v12 = *(void **)(a1 + 32);
  id v13 = [[SUInstallationConstraintMonitorRestoreFromICloud alloc] initOnQueue:*(void *)(a1 + 40) withDownload:*(void *)(a1 + 48)];
  [v12 addObject:v13];

  BOOL v14 = *(void **)(a1 + 32);
  id v15 = [[SUInstallationConstraintMonitorRestoreFromITunes alloc] initOnQueue:*(void *)(a1 + 40) withDownload:*(void *)(a1 + 48)];
  [v14 addObject:v15];

  v16 = *(void **)(a1 + 32);
  id v17 = [[SUInstallationConstraintMonitorSync alloc] initOnQueue:*(void *)(a1 + 40) withDownload:*(void *)(a1 + 48)];
  [v16 addObject:v17];

  id v18 = *(void **)(a1 + 32);
  id v19 = [[SUInstallationConstraintMonitorCarplay alloc] initOnQueue:*(void *)(a1 + 40) withDownload:*(void *)(a1 + 48)];
  [v18 addObject:v19];

  v20 = *(void **)(a1 + 32);
  id v21 = [[SUInstallationConstraintMonitorMediaPlaying alloc] initOnQueue:*(void *)(a1 + 40) withDownload:*(void *)(a1 + 48)];
  [v20 addObject:v21];

  v22 = *(void **)(a1 + 32);
  id v23 = [[SUInstallationConstraintMonitorDriving alloc] initOnQueue:*(void *)(a1 + 40) withDownload:*(void *)(a1 + 48)];
  [v22 addObject:v23];

  v24 = *(void **)(a1 + 32);
  id v25 = [[SUInstallationConstraintMonitorWombat alloc] initOnQueue:*(void *)(a1 + 40) withDownload:*(void *)(a1 + 48)];
  [v24 addObject:v25];
}

- (SUInstallationConstraintObserver)initWithDownload:(id)a3 queue:(id)a4 constraints:(id)a5
{
  return [(SUInstallationConstraintObserver *)self initWithDownload:a3 installOptions:0 queue:a4 constraints:a5];
}

- (SUInstallationConstraintObserver)initWithDownload:(id)a3 installOptions:(id)a4 queue:(id)a5 constraints:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SUInstallationConstraintObserver;
  id v13 = [(SUComposedInstallationConstraintMonitor *)&v18 initWithInternalQueue:a5 withInstallationConstraintMonitors:a6];
  BOOL v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_download, a3);
    objc_storeStrong((id *)&v14->_installOptions, a4);
    uint64_t v15 = [MEMORY[0x263F08968] mapTableWithKeyOptions:517 valueOptions:0];
    queue_observerBlockTokens = v14->_queue_observerBlockTokens;
    v14->_queue_observerBlockTokens = (NSMapTable *)v15;

    v14->_queue_tokenCount = 0;
  }

  return v14;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = SULogInstallConstraints();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v6 = self;
    _os_log_impl(&dword_21DCF7000, v3, OS_LOG_TYPE_INFO, "[InstallationConstraintObserver] Dealloc: %@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)SUInstallationConstraintObserver;
  [(SUComposedInstallationConstraintMonitor *)&v4 dealloc];
}

- (id)registerObserverBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SUInstallationConstraintObserver.m", 159, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__7;
  v22 = __Block_byref_object_dispose__7;
  id v23 = 0;
  queue = self->super._queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__SUInstallationConstraintObserver_registerObserverBlock___block_invoke;
  block[3] = &unk_26447DA48;
  block[4] = self;
  id v17 = &v18;
  id v7 = v5;
  id v16 = v7;
  dispatch_sync(queue, block);
  uint64_t v8 = self->super._queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__SUInstallationConstraintObserver_registerObserverBlock___block_invoke_2;
  v13[3] = &unk_26447CFA0;
  v13[4] = self;
  id v14 = v7;
  id v9 = v7;
  dispatch_async(v8, v13);
  id v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v10;
}

void __58__SUInstallationConstraintObserver_registerObserverBlock___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 72))
  {
    v2 = [[_SUInstallationConstraintBlockObserverToken alloc] initWithObserver:*(void *)(a1 + 32)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    objc_super v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      ++*(void *)(*(void *)(a1 + 32) + 80);
      id v5 = *(void **)(*(void *)(a1 + 32) + 64);
      id v7 = (id)[*(id *)(a1 + 40) copy];
      id v6 = (void *)MEMORY[0x223C18480]();
      [v5 setObject:v6 forKey:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    }
  }
}

uint64_t __58__SUInstallationConstraintObserver_registerObserverBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_unsatisfiedConstraints");
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "_queue_representedConstraints");
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v2 + 16);
  return v5(v2, v3, v4, 0);
}

- (void)invalidateWithError:(id)a3
{
  id v4 = a3;
  queue = self->super._queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__SUInstallationConstraintObserver_invalidateWithError___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __56__SUInstallationConstraintObserver_invalidateWithError___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = SULogInstallConstraints();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v3;
    _os_log_impl(&dword_21DCF7000, v2, OS_LOG_TYPE_INFO, "[InstallationConstraintObserver] Invalidate: %@", buf, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v4 + 72))
  {
    *(unsigned char *)(v4 + 72) = 1;
    if (*(void *)(a1 + 40))
    {
      id v5 = (void *)[*(id *)(*(void *)(a1 + 32) + 64) copy];
      id v6 = [v5 objectEnumerator];

      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            (*(void (**)(void, void, uint64_t, void))(*(void *)(*((void *)&v14 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * v11), 0, objc_msgSend(*(id *)(a1 + 32), "_queue_representedConstraints", (void)v14), *(void *)(a1 + 40));
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v9);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_queue_invalidateChildConstraintMonitors", (void)v14);
    [*(id *)(*(void *)(a1 + 32) + 64) removeAllObjects];
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 64);
    *(void *)(v12 + 64) = 0;

    objc_msgSend(*(id *)(a1 + 32), "_queue_clearDelegate");
  }
}

- (id)monitorOfClass:(Class)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__7;
  queue = self->super._queue;
  uint64_t v11 = __Block_byref_object_dispose__7;
  id v12 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SUInstallationConstraintObserver_monitorOfClass___block_invoke;
  block[3] = &unk_26447DA70;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __51__SUInstallationConstraintObserver_monitorOfClass___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "constraintMonitors", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)invalidate
{
}

- (void)_queue_noteInstallationConstraintMonitor:(id)a3 constraintsDidChange:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssert();
  uint64_t v6 = [(SUComposedInstallationConstraintMonitor *)self _queue_unsatisfiedConstraints];
  uint64_t v7 = SULogInstallConstraints();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    long long v8 = SUStringFromInstallationConstraints(v6);
    *(_DWORD *)buf = 138412546;
    id v23 = self;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl(&dword_21DCF7000, v7, OS_LOG_TYPE_INFO, "%@ - unsatisfied constraints changed (unsatisfied? %@)", buf, 0x16u);
  }
  long long v9 = (void *)[(NSMapTable *)self->_queue_observerBlockTokens copy];
  long long v10 = [v9 objectEnumerator];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * v15) + 16))(*(void *)(*((void *)&v17 + 1) + 8 * v15));
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }

  long long v16 = [(SUComposedInstallationConstraintMonitor *)self _queue_delegate];
  [v16 installationConstraintMonitor:self constraintsDidChange:a4];
}

- (void)_removeToken:(id)a3
{
  if (!a3)
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SUInstallationConstraintObserver.m", 249, @"Invalid parameter not satisfying: %@", @"token" object file lineNumber description];
  }
  queue = self->super._queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SUInstallationConstraintObserver__removeToken___block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __49__SUInstallationConstraintObserver__removeToken___block_invoke(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 80);
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[10])
  {
    objc_msgSend(v2, "_queue_delegate");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v3 installationConstraintObserverDidRemoveAllObserverBlocks:*(void *)(a1 + 32)];
  }
}

- (BOOL)_hasAnyBlockObservers
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->super._queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__SUInstallationConstraintObserver__hasAnyBlockObservers__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__SUInstallationConstraintObserver__hasAnyBlockObservers__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 80) != 0;
  return result;
}

- (SUDownload)download
{
  return self->_download;
}

- (SUInstallOptions)installOptions
{
  return self->_installOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_observerBlockTokens, 0);
  objc_storeStrong((id *)&self->_installOptions, 0);
  objc_storeStrong((id *)&self->_download, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end