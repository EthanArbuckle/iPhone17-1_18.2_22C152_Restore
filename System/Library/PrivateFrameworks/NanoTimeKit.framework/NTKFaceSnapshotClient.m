@interface NTKFaceSnapshotClient
+ (NTKFaceSnapshotClient)sharedInstance;
- (NTKFaceSnapshotClient)init;
- (void)_askDaemonForSnapshotOfDescriptor:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_askXPCServiceForSnapshotOfDescriptor:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_handleActiveDeviceChangedNotification;
- (void)_handleConnectionInterrupted;
- (void)_handleCustomMonogramChangedNotification;
- (void)_handleSignificantLocationChangeNotification;
- (void)_register;
- (void)_registerIfNeeded;
- (void)_setupDaemonConnection;
- (void)_updateAllSnapshots;
- (void)dealloc;
- (void)faceSnapshotChangedForKey:(id)a3;
- (void)performAfterCompletingCurrentlyPendingSnapshots:(id)a3;
- (void)requestSnapshotOfFace:(id)a3;
- (void)snapshotFace:(id)a3 options:(id)a4 completion:(id)a5;
- (void)snapshotLibrarySelectedFaceForDeviceUUID:(id)a3 options:(id)a4 completion:(id)a5;
@end

@implementation NTKFaceSnapshotClient

+ (NTKFaceSnapshotClient)sharedInstance
{
  if (sharedInstance_onceToken_23 != -1) {
    dispatch_once(&sharedInstance_onceToken_23, &__block_literal_global_158);
  }
  v2 = (void *)sharedInstance___sharedInstance_9;

  return (NTKFaceSnapshotClient *)v2;
}

void __39__NTKFaceSnapshotClient_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(NTKFaceSnapshotClient);
  v1 = (void *)sharedInstance___sharedInstance_9;
  sharedInstance___sharedInstance_9 = (uint64_t)v0;
}

- (NTKFaceSnapshotClient)init
{
  v9.receiver = self;
  v9.super_class = (Class)NTKFaceSnapshotClient;
  v2 = [(NTKFaceSnapshotClient *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(NTKFaceSnapshotClient *)v2 _setupDaemonConnection];
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.nanotimekit.facesnapshotclient.diskaccess", v4);
    snapshotFileQueue = v3->_snapshotFileQueue;
    v3->_snapshotFileQueue = (OS_dispatch_queue *)v5;

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v3 selector:sel__handleCustomMonogramChangedNotification name:@"NTKCustomMonogramChangedNotification" object:0];
    [v7 addObserver:v3 selector:sel__handleSignificantLocationChangeNotification name:@"NTKLocationManagerSignificantLocationChangeNotification" object:0];
    [v7 addObserver:v3 selector:sel__handleActiveDeviceChangedNotification name:*MEMORY[0x1E4F19620] object:0];
  }
  return v3;
}

- (void)_setupDaemonConnection
{
  if (!self->_daemonConnection)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleDaemonDidLaunchNotification_1, @"com.apple.nanotimekit.daemondidlaunch", 0, (CFNotificationSuspensionBehavior)0);
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.nanotimekit.facesnapshotserver" options:4096];
    daemonConnection = self->_daemonConnection;
    self->_daemonConnection = v4;

    v6 = self->_daemonConnection;
    v7 = NTKFaceSnapshotServerInterface();
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    v8 = self->_daemonConnection;
    objc_super v9 = NTKFaceSnapshotClientInterface();
    [(NSXPCConnection *)v8 setExportedInterface:v9];

    v10 = [[_NTKFaceSnapshotClientProxy alloc] initWithWeakProxy:self];
    [(NSXPCConnection *)self->_daemonConnection setExportedObject:v10];
    v11 = self->_daemonConnection;
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.NanoTimeKit.NTKFaceSnapshotClient", v12);
    [(NSXPCConnection *)v11 _setQueue:v13];

    objc_initWeak(&location, self);
    v14 = self->_daemonConnection;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __47__NTKFaceSnapshotClient__setupDaemonConnection__block_invoke;
    v18[3] = &unk_1E62C0068;
    objc_copyWeak(&v19, &location);
    [(NSXPCConnection *)v14 setInterruptionHandler:v18];
    v15 = self->_daemonConnection;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __47__NTKFaceSnapshotClient__setupDaemonConnection__block_invoke_2;
    v16[3] = &unk_1E62C0068;
    objc_copyWeak(&v17, &location);
    [(NSXPCConnection *)v15 setInvalidationHandler:v16];
    [(NSXPCConnection *)self->_daemonConnection resume];
    [(NTKFaceSnapshotClient *)self _register];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __47__NTKFaceSnapshotClient__setupDaemonConnection__block_invoke(uint64_t a1)
{
  v2 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __47__NTKFaceSnapshotClient__setupDaemonConnection__block_invoke_cold_1();
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__NTKFaceSnapshotClient__setupDaemonConnection__block_invoke_27;
  block[3] = &unk_1E62C0068;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v4);
}

void __47__NTKFaceSnapshotClient__setupDaemonConnection__block_invoke_27(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"NTKFaceSnapshotClientInterruptionName" object:WeakRetained];

  [WeakRetained _handleConnectionInterrupted];
}

void __47__NTKFaceSnapshotClient__setupDaemonConnection__block_invoke_2(uint64_t a1)
{
  v2 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __71__NTKPersistentFaceCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_4_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = (void *)WeakRetained[1];
  WeakRetained[1] = 0;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NTKFaceSnapshotClient;
  [(NTKFaceSnapshotClient *)&v4 dealloc];
}

- (void)requestSnapshotOfFace:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_queue_t v5 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 name];
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "Requesting snapshot for face:%@", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__NTKFaceSnapshotClient_requestSnapshotOfFace___block_invoke;
  v8[3] = &unk_1E62C09C0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __47__NTKFaceSnapshotClient_requestSnapshotOfFace___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupDaemonConnection];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) remoteObjectProxy];
  v2 = [*(id *)(a1 + 40) instanceDescriptor];
  [v3 requestSnapshotOfFaceInstanceDescriptor:v2];
}

- (void)performAfterCompletingCurrentlyPendingSnapshots:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__NTKFaceSnapshotClient_performAfterCompletingCurrentlyPendingSnapshots___block_invoke;
  v6[3] = &unk_1E62C2290;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __73__NTKFaceSnapshotClient_performAfterCompletingCurrentlyPendingSnapshots___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupDaemonConnection];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) remoteObjectProxy];
  [v2 performAfterCompletingCurrentlyPendingSnapshots:*(void *)(a1 + 40)];
}

- (void)_askXPCServiceForSnapshotOfDescriptor:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__50;
  v63 = __Block_byref_object_dispose__50;
  id v64 = (id)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.NTKFaceSnapshotService"];
  uint64_t v11 = [objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.NTKFaceSnapshotService"];
  uint64_t v12 = (void *)v60[5];
  v60[5] = v11;

  dispatch_queue_t v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1FCE1B750];
  [(id)v60[5] setRemoteObjectInterface:v13];

  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__50;
  v57 = __Block_byref_object_dispose__50;
  id v58 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke;
  aBlock[3] = &unk_1E62C1CD8;
  aBlock[4] = &v59;
  aBlock[5] = &v53;
  v14 = _Block_copy(aBlock);
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  char v51 = 0;
  v15 = [v8 description];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_3;
  v45[3] = &unk_1E62C9030;
  v49 = v50;
  id v16 = v15;
  id v46 = v16;
  id v17 = v10;
  id v47 = v17;
  id v18 = v14;
  id v48 = v18;
  id v19 = _Block_copy(v45);
  v20 = (void *)v60[5];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_36;
  v43[3] = &unk_1E62C4E78;
  id v21 = v19;
  id v44 = v21;
  uint64_t v22 = [v20 remoteObjectProxyWithErrorHandler:v43];
  v23 = (void *)v54[5];
  v54[5] = v22;

  objc_initWeak(&location, self);
  v24 = (void *)v60[5];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_2_39;
  v39[3] = &unk_1E62C3398;
  objc_copyWeak(&v41, &location);
  id v25 = v21;
  id v40 = v25;
  [v24 setInterruptionHandler:v39];
  v26 = (void *)v60[5];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_2_41;
  v37[3] = &unk_1E62C0718;
  id v27 = v25;
  id v38 = v27;
  [v26 setInvalidationHandler:v37];
  [(id)v60[5] resume];
  v28 = (void *)v54[5];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_2_43;
  v35[3] = &unk_1E62C1FB8;
  id v29 = v27;
  id v36 = v29;
  [v28 provideSnapshotOfFaceInstanceDescriptor:v8 options:v9 completion:v35];
  dispatch_time_t v30 = dispatch_time(0, 30000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_4;
  block[3] = &unk_1E62C0718;
  id v34 = v29;
  id v31 = v29;
  v32 = (void *)MEMORY[0x1E4F14428];
  dispatch_after(v30, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);

  _Block_object_dispose(v50, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_2;
  v1[3] = &unk_1E62C1CD8;
  long long v2 = *(_OWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v1);
}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setInterruptionHandler:0];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setInvalidationHandler:0];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_3(void *a1, void *a2, int a3)
{
  id v5 = a2;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v6 = *(void *)(a1[7] + 8);
  if (*(unsigned char *)(v6 + 24))
  {
    if ((a3 & 1) == 0)
    {
      id v7 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_3_cold_2();
      }
    }
  }
  else
  {
    if (a3)
    {
      id v8 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_3_cold_1();
      }

      uint64_t v6 = *(void *)(a1[7] + 8);
    }
    *(unsigned char *)(v6 + 24) = 1;
    uint64_t v9 = a1[5];
    if (v9) {
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v5);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_36(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_36_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_37;
  block[3] = &unk_1E62C0718;
  id v12 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_2_39(uint64_t a1)
{
  uint64_t v2 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_2_39_cold_1();
  }

  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_40;
  v3[3] = &unk_1E62C3398;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v3);

  objc_destroyWeak(&v5);
}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_40(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"NTKFaceSnapshotClientInterruptionName" object:WeakRetained];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_2_41(uint64_t a1)
{
  uint64_t v2 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_2_41_cold_1();
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_42;
  block[3] = &unk_1E62C0718;
  id v4 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_42(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_2_43(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_3_44;
  v7[3] = &unk_1E62C0AE8;
  id v5 = *(id *)(a1 + 32);
  id v8 = v4;
  id v9 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_3_44(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_askDaemonForSnapshotOfDescriptor:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v11 = [v8 description];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  char v29 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__NTKFaceSnapshotClient__askDaemonForSnapshotOfDescriptor_options_completion___block_invoke;
  aBlock[3] = &unk_1E62C9058;
  id v27 = v28;
  id v12 = v11;
  id v25 = v12;
  id v13 = v10;
  id v26 = v13;
  v14 = _Block_copy(aBlock);
  [(NTKFaceSnapshotClient *)self _setupDaemonConnection];
  v15 = [(NSXPCConnection *)self->_daemonConnection remoteObjectProxy];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __78__NTKFaceSnapshotClient__askDaemonForSnapshotOfDescriptor_options_completion___block_invoke_46;
  v22[3] = &unk_1E62C2330;
  id v16 = v14;
  id v23 = v16;
  [v15 snapshotFaceInstanceDescriptor:v8 options:v9 completion:v22];
  dispatch_time_t v17 = dispatch_time(0, 30000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__NTKFaceSnapshotClient__askDaemonForSnapshotOfDescriptor_options_completion___block_invoke_3;
  block[3] = &unk_1E62C0718;
  id v21 = v16;
  id v18 = v16;
  id v19 = (void *)MEMORY[0x1E4F14428];
  dispatch_after(v17, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v28, 8);
}

void __78__NTKFaceSnapshotClient__askDaemonForSnapshotOfDescriptor_options_completion___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v6 + 24))
  {
    if ((a3 & 1) == 0)
    {
      uint64_t v7 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __78__NTKFaceSnapshotClient__askDaemonForSnapshotOfDescriptor_options_completion___block_invoke_cold_2();
      }
    }
  }
  else
  {
    if (a3)
    {
      id v8 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_3_cold_1();
      }

      uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    }
    *(unsigned char *)(v6 + 24) = 1;
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v5);
    }
  }
}

void __78__NTKFaceSnapshotClient__askDaemonForSnapshotOfDescriptor_options_completion___block_invoke_46(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__NTKFaceSnapshotClient__askDaemonForSnapshotOfDescriptor_options_completion___block_invoke_2;
  v6[3] = &unk_1E62C0AE8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __78__NTKFaceSnapshotClient__askDaemonForSnapshotOfDescriptor_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __78__NTKFaceSnapshotClient__askDaemonForSnapshotOfDescriptor_options_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)snapshotFace:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__NTKFaceSnapshotClient_snapshotFace_options_completion___block_invoke;
  aBlock[3] = &unk_1E62C3348;
  id v11 = v8;
  id v34 = v11;
  v35 = self;
  id v12 = v9;
  id v36 = v12;
  id v13 = v10;
  id v37 = v13;
  v14 = _Block_copy(aBlock);
  if (NTKAlwaysGenerateSnapshots()) {
    goto LABEL_15;
  }
  v15 = [v12 valueForKey:@"NTKSnapshotPersistableKey"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_15;
  }
  int v16 = [v15 BOOLValue];

  if (!v16)
  {
LABEL_15:
    uint64_t v22 = [v11 instanceDescriptor];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__NTKFaceSnapshotClient_snapshotFace_options_completion___block_invoke_5;
    block[3] = &unk_1E62C3348;
    void block[4] = self;
    id v26 = v22;
    id v27 = v12;
    id v28 = v13;
    id v17 = v22;
    dispatch_async(MEMORY[0x1E4F14428], block);

    id v23 = v26;
    goto LABEL_16;
  }
  id v17 = [v12 valueForKey:@"NTKSnapshotPriorityKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = [v17 unsignedIntegerValue];
    if (v18 == 2) {
      int v19 = 21;
    }
    else {
      int v19 = 17;
    }
    if (v18 == 3) {
      dispatch_qos_class_t v20 = QOS_CLASS_USER_INITIATED;
    }
    else {
      dispatch_qos_class_t v20 = v19;
    }
    if (v18 == 3) {
      int v21 = -1;
    }
    else {
      int v21 = 0;
    }
  }
  else
  {
    int v21 = 0;
    dispatch_qos_class_t v20 = QOS_CLASS_UTILITY;
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __57__NTKFaceSnapshotClient_snapshotFace_options_completion___block_invoke_3;
  v29[3] = &unk_1E62C66C8;
  id v30 = v11;
  id v31 = v13;
  id v32 = v14;
  dispatch_block_t v24 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v20, v21, v29);
  dispatch_async((dispatch_queue_t)self->_snapshotFileQueue, v24);

  id v23 = v30;
LABEL_16:
}

void __57__NTKFaceSnapshotClient_snapshotFace_options_completion___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__NTKFaceSnapshotClient_snapshotFace_options_completion___block_invoke_2;
  v5[3] = &unk_1E62C3348;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(a1 + 48);
  id v6 = v2;
  uint64_t v7 = v3;
  id v8 = v4;
  id v9 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __57__NTKFaceSnapshotClient_snapshotFace_options_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) instanceDescriptor];
  [*(id *)(a1 + 40) _askDaemonForSnapshotOfDescriptor:v2 options:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

void __57__NTKFaceSnapshotClient_snapshotFace_options_completion___block_invoke_3(uint64_t a1)
{
  id v2 = NTKCachedSnapshotForFace(*(void **)(a1 + 32));
  if (v2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __57__NTKFaceSnapshotClient_snapshotFace_options_completion___block_invoke_4;
    v3[3] = &unk_1E62C0AE8;
    id v5 = *(id *)(a1 + 40);
    id v4 = v2;
    dispatch_async(MEMORY[0x1E4F14428], v3);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __57__NTKFaceSnapshotClient_snapshotFace_options_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __57__NTKFaceSnapshotClient_snapshotFace_options_completion___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _askXPCServiceForSnapshotOfDescriptor:*(void *)(a1 + 40) options:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)snapshotLibrarySelectedFaceForDeviceUUID:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 UUIDString];
    *(_DWORD *)buf = 138412290;
    int v21 = v12;
    _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "Snapshotting SelectedFace for device UUID:%@", buf, 0xCu);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__NTKFaceSnapshotClient_snapshotLibrarySelectedFaceForDeviceUUID_options_completion___block_invoke;
  v16[3] = &unk_1E62C3348;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v16);
}

void __85__NTKFaceSnapshotClient_snapshotLibrarySelectedFaceForDeviceUUID_options_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupDaemonConnection];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) remoteObjectProxy];
  [v2 snapshotLibrarySelectedFaceForDeviceUUID:*(void *)(a1 + 40) options:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)faceSnapshotChangedForKey:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "snapshot changed for key:%@", buf, 0xCu);
  }

  id v5 = NTKSnapshotMappedImageCache();
  [v5 _noteExternalChangeForKey:v3];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__NTKFaceSnapshotClient_faceSnapshotChangedForKey___block_invoke;
  block[3] = &unk_1E62BFF20;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __51__NTKFaceSnapshotClient_faceSnapshotChangedForKey___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"NTKFaceSnapshotChangedNotification" object:*(void *)(a1 + 32)];
}

- (void)_updateAllSnapshots
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__NTKFaceSnapshotClient__updateAllSnapshots__block_invoke;
  block[3] = &unk_1E62BFF20;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __44__NTKFaceSnapshotClient__updateAllSnapshots__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupDaemonConnection];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) remoteObjectProxy];
  [v2 updateAllSnapshots];
}

- (void)_handleCustomMonogramChangedNotification
{
  id v3 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Update all snapshots due to custom monogram changed notification", v4, 2u);
  }

  [(NTKFaceSnapshotClient *)self _updateAllSnapshots];
}

- (void)_handleSignificantLocationChangeNotification
{
  id v3 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Update all snapshots due to significant location change notification", v4, 2u);
  }

  [(NTKFaceSnapshotClient *)self _updateAllSnapshots];
}

- (void)_handleActiveDeviceChangedNotification
{
  id v3 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Update all snapshots due to active device change notification", v4, 2u);
  }

  [(NTKFaceSnapshotClient *)self _updateAllSnapshots];
}

- (void)_register
{
  id v3 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Registering for updates", v5, 2u);
  }

  id v4 = [(NSXPCConnection *)self->_daemonConnection remoteObjectProxy];
  [v4 registerForUpdates];

  self->_registrationNeeded = 0;
}

- (void)_registerIfNeeded
{
  if (self->_registrationNeeded) {
    [(NTKFaceSnapshotClient *)self _register];
  }
}

- (void)_handleConnectionInterrupted
{
  self->_registrationNeeded = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotFileQueue, 0);

  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

void __47__NTKFaceSnapshotClient__setupDaemonConnection__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_4(&dword_1BC5A9000, v0, v1, "xpc connection interrupted. This is recoverable.", v2, v3, v4, v5, v6);
}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_5();
  _os_log_fault_impl(&dword_1BC5A9000, v0, OS_LOG_TYPE_FAULT, "Failed to snapshot %@ in timely manner", v1, 0xCu);
}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Delayed XPC completion of %@ finally called", v2, v3, v4, v5, v6);
}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_36_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_2_39_cold_1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_4(&dword_1BC5A9000, v0, v1, "persist-less xpc connection interrupted. This is recoverable.", v2, v3, v4, v5, v6);
}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_2_41_cold_1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_4(&dword_1BC5A9000, v0, v1, "persist-less xpc connection invalidated. This is unrecoverable.", v2, v3, v4, v5, v6);
}

void __78__NTKFaceSnapshotClient__askDaemonForSnapshotOfDescriptor_options_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Delayed completion of %@ finally called", v2, v3, v4, v5, v6);
}

@end