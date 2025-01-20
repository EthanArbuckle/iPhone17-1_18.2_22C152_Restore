@interface SPOwnerSessionLocationFetch
+ (id)exportedInterface;
+ (id)remoteInterface;
- (FMXPCSession)session;
- (SPLocationFetchContext)lastContext;
- (SPOwnerSessionLocationFetch)init;
- (SPOwnerSessionXPCProtocol)proxy;
- (SPRetryCount)retryCount;
- (id)deviceEventUpdates;
- (id)locationFetchSessionInvalidationBlock;
- (id)locationUpdates;
- (void)interruptionHandler:(id)a3;
- (void)invalidationHandler:(id)a3;
- (void)locationForContext:(id)a3 completion:(id)a4;
- (void)receivedUpdatedDeviceEvents:(id)a3;
- (void)receivedUpdatedLocation:(id)a3;
- (void)setDeviceEventUpdates:(id)a3;
- (void)setLastContext:(id)a3;
- (void)setLocationFetchSessionInvalidationBlock:(id)a3;
- (void)setLocationUpdates:(id)a3;
- (void)setProxy:(id)a3;
- (void)setRetryCount:(id)a3;
- (void)setSession:(id)a3;
- (void)subscribeAndFetchLocationForContext:(id)a3 completion:(id)a4;
- (void)unsubscribeLocationUpdatesWithCompletion:(id)a3;
@end

@implementation SPOwnerSessionLocationFetch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastContext, 0);
  objc_storeStrong((id *)&self->_retryCount, 0);
  objc_storeStrong(&self->_locationFetchSessionInvalidationBlock, 0);
  objc_storeStrong(&self->_deviceEventUpdates, 0);
  objc_storeStrong(&self->_locationUpdates, 0);
  objc_storeStrong((id *)&self->_proxy, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

- (SPOwnerSessionLocationFetch)init
{
  v6.receiver = self;
  v6.super_class = (Class)SPOwnerSessionLocationFetch;
  v2 = [(SPOwnerSessionLocationFetch *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SPRetryCount);
    retryCount = v2->_retryCount;
    v2->_retryCount = v3;
  }
  return v2;
}

- (void)interruptionHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = LogCategory_LocationFetch();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionLocationFetch interruptionHandler %@", buf, 0xCu);
  }

  objc_super v6 = self->_lastContext;
  objc_initWeak((id *)buf, self);
  [(SPRetryCount *)self->_retryCount decayWaitInterval];
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __51__SPOwnerSessionLocationFetch_interruptionHandler___block_invoke;
  v13 = &unk_1E601BB38;
  objc_copyWeak(&v15, (id *)buf);
  v9 = v6;
  v14 = v9;
  dispatch_after(v8, MEMORY[0x1E4F14428], &v10);
  [(SPRetryCount *)self->_retryCount increment];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __51__SPOwnerSessionLocationFetch_interruptionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (*(void *)(a1 + 32))
  {
    id v4 = [WeakRetained proxy];
    uint64_t v5 = *(void *)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__SPOwnerSessionLocationFetch_interruptionHandler___block_invoke_2;
    v6[3] = &unk_1E601CB80;
    v6[4] = v3;
    [v4 locationForContext:v5 completion:v6];
  }
}

void __51__SPOwnerSessionLocationFetch_interruptionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    double v7 = LogCategory_LocationFetch();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __51__SPOwnerSessionLocationFetch_interruptionHandler___block_invoke_2_cold_1((uint64_t)v6, v7);
    }
  }
  else
  {
    dispatch_time_t v8 = [*(id *)(a1 + 32) retryCount];
    [v8 reset];

    [*(id *)(a1 + 32) receivedUpdatedLocation:v5];
  }
}

- (void)invalidationHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = LogCategory_LocationFetch();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionLocationFetch invalidationHandler %@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [(SPOwnerSessionLocationFetch *)self locationFetchSessionInvalidationBlock];

  if (v6)
  {
    double v7 = [(SPOwnerSessionLocationFetch *)self locationFetchSessionInvalidationBlock];
    dispatch_time_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.icloud.searchpartyd.SPOwnerSession.ErrorDomain" code:19 userInfo:0];
    ((void (**)(void, void *))v7)[2](v7, v8);
  }
}

- (SPOwnerSessionXPCProtocol)proxy
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [(SPOwnerSessionLocationFetch *)self session];

  if (!v3)
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __36__SPOwnerSessionLocationFetch_proxy__block_invoke;
    aBlock[3] = &unk_1E601B7B8;
    objc_copyWeak(&v23, &location);
    id v4 = _Block_copy(aBlock);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __36__SPOwnerSessionLocationFetch_proxy__block_invoke_2;
    v20 = &unk_1E601B7B8;
    objc_copyWeak(&v21, &location);
    id v5 = _Block_copy(&v17);
    id v6 = objc_alloc(MEMORY[0x1E4F61588]);
    double v7 = +[SPOwnerSessionLocationFetch exportedInterface];
    dispatch_time_t v8 = +[SPOwnerSessionLocationFetch remoteInterface];
    int v9 = objc_msgSend(v6, "initWithMachServiceName:options:exportedObject:exportedInterface:remoteObjectInterface:interruptionHandler:invalidationHandler:", @"com.apple.icloud.searchparty.locationfetch.items", 0, self, v7, v8, v4, v5, v17, v18, v19, v20);

    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F61590]) initWithServiceDescription:v9];
    [(SPOwnerSessionLocationFetch *)self setSession:v10];

    uint64_t v11 = LogCategory_SecureLocations();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v9 machService];
      *(_DWORD *)buf = 138412290;
      v26 = v12;
      _os_log_impl(&dword_1B2FD8000, v11, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionLocationFetch: Establishing XPC connection to %@", buf, 0xCu);
    }
    v13 = [(SPOwnerSessionLocationFetch *)self session];
    [v13 resume];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  v14 = [(SPOwnerSessionLocationFetch *)self session];
  id v15 = [v14 proxy];

  return (SPOwnerSessionXPCProtocol *)v15;
}

void __36__SPOwnerSessionLocationFetch_proxy__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained interruptionHandler:v3];
}

void __36__SPOwnerSessionLocationFetch_proxy__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained invalidationHandler:v3];
}

+ (id)exportedInterface
{
  if (exportedInterface_onceToken_6 != -1) {
    dispatch_once(&exportedInterface_onceToken_6, &__block_literal_global_13);
  }
  v2 = (void *)exportedInterface_interface_6;

  return v2;
}

uint64_t __48__SPOwnerSessionLocationFetch_exportedInterface__block_invoke()
{
  exportedInterface_interface_6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B3DF08];

  return MEMORY[0x1F41817F8]();
}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken_7 != -1) {
    dispatch_once(&remoteInterface_onceToken_7, &__block_literal_global_56_1);
  }
  v2 = (void *)remoteInterface_interface_6;

  return v2;
}

uint64_t __46__SPOwnerSessionLocationFetch_remoteInterface__block_invoke()
{
  remoteInterface_interface_6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B44290];

  return MEMORY[0x1F41817F8]();
}

- (void)receivedUpdatedLocation:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__SPOwnerSessionLocationFetch_receivedUpdatedLocation___block_invoke;
  v6[3] = &unk_1E601B920;
  id v7 = v4;
  dispatch_time_t v8 = self;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSessionLocationFetch.receivedUpdatedLocation", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __55__SPOwnerSessionLocationFetch_receivedUpdatedLocation___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_LocationFetch();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) locationsByBeaconIdentifier];
    int v6 = 134217984;
    uint64_t v7 = [v3 count];
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionLocationFetch receivedUpdatedLocation %lu", (uint8_t *)&v6, 0xCu);
  }
  id v4 = [*(id *)(a1 + 40) locationUpdates];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 40) locationUpdates];
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, *(void *)(a1 + 32));
  }
  else
  {
    uint64_t v5 = LogCategory_LocationFetch();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1B2FD8000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionLocationFetch - received updated locations but no registered block", (uint8_t *)&v6, 2u);
    }
  }
}

- (void)receivedUpdatedDeviceEvents:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__SPOwnerSessionLocationFetch_receivedUpdatedDeviceEvents___block_invoke;
  v6[3] = &unk_1E601B920;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSessionLocationFetch.receivedUpdatedLocation", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __59__SPOwnerSessionLocationFetch_receivedUpdatedDeviceEvents___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_LocationFetch();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) beaconEventByBeaconIdentifier];
    int v6 = 134217984;
    uint64_t v7 = [v3 count];
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionLocationFetch receivedUpdatedDeviceEvents %lu.", (uint8_t *)&v6, 0xCu);
  }
  id v4 = [*(id *)(a1 + 40) deviceEventUpdates];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 40) deviceEventUpdates];
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, *(void *)(a1 + 32));
  }
  else
  {
    uint64_t v5 = LogCategory_LocationFetch();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1B2FD8000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionLocationFetch - received updated device events but no registered block.", (uint8_t *)&v6, 2u);
    }
  }
}

- (void)subscribeAndFetchLocationForContext:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = [MEMORY[0x1E4F28B50] mainBundle];
  id v10 = [v9 bundleIdentifier];
  [v7 setBundleIdentifier:v10];

  uint64_t v11 = [(SPOwnerSessionLocationFetch *)self locationUpdates];

  if (v11) {
    [v7 setSubscribe:1];
  }
  v12 = [(SPOwnerSessionLocationFetch *)self deviceEventUpdates];

  if (v12) {
    [v7 setReportDeviceEvents:1];
  }
  objc_storeStrong((id *)&self->_lastContext, a3);
  v13 = LogCategory_LocationFetch();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [v7 searchIdentifiers];
    *(_DWORD *)buf = 134217984;
    uint64_t v22 = [v14 count];
    _os_log_impl(&dword_1B2FD8000, v13, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionLocationFetch.subscribeAndFetchLocationForContext %lu", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __78__SPOwnerSessionLocationFetch_subscribeAndFetchLocationForContext_completion___block_invoke;
  activity_block[3] = &unk_1E601B850;
  objc_copyWeak(&v20, (id *)buf);
  id v18 = v7;
  id v19 = v8;
  id v15 = v8;
  id v16 = v7;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSessionLocationFetch.subscribeAndFetchLocationForContext:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

void __78__SPOwnerSessionLocationFetch_subscribeAndFetchLocationForContext_completion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained proxy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__SPOwnerSessionLocationFetch_subscribeAndFetchLocationForContext_completion___block_invoke_2;
  v6[3] = &unk_1E601CBA8;
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  objc_copyWeak(&v8, v2);
  [v4 locationForContext:v5 completion:v6];

  objc_destroyWeak(&v8);
}

void __78__SPOwnerSessionLocationFetch_subscribeAndFetchLocationForContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v6)
  {
    id WeakRetained = LogCategory_LocationFetch();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      __78__SPOwnerSessionLocationFetch_subscribeAndFetchLocationForContext_completion___block_invoke_2_cold_1((uint64_t)v6, WeakRetained);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained receivedUpdatedLocation:v5];
  }
}

- (void)unsubscribeLocationUpdatesWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = LogCategory_LocationFetch();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionLocationFetch.unsubscribeLocationUpdatesWithCompletion", v7, 2u);
  }

  [(SPOwnerSessionLocationFetch *)self setLocationFetchSessionInvalidationBlock:0];
  [(SPOwnerSessionLocationFetch *)self setLocationUpdates:0];
  id v6 = [(SPOwnerSessionLocationFetch *)self session];
  [v6 invalidate];

  [(SPOwnerSessionLocationFetch *)self setSession:0];
  v4[2](v4, 0);
}

- (void)locationForContext:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = LogCategory_LocationFetch();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v6 searchIdentifiers];
    *(_DWORD *)buf = 134217984;
    uint64_t v17 = [v9 count];
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionLocationFetch.locationForContext:completion: %lu", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __61__SPOwnerSessionLocationFetch_locationForContext_completion___block_invoke;
  activity_block[3] = &unk_1E601C400;
  id v13 = v6;
  id v10 = v6;
  objc_copyWeak(&v15, (id *)buf);
  id v14 = v7;
  id v11 = v7;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSessionLocationFetch.locationForContext:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __61__SPOwnerSessionLocationFetch_locationForContext_completion___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];
  [*(id *)(a1 + 32) setBundleIdentifier:v3];

  [*(id *)(a1 + 32) setSubscribe:0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained proxy];
  [v4 locationForContext:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (FMXPCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void)setProxy:(id)a3
{
}

- (id)locationUpdates
{
  return self->_locationUpdates;
}

- (void)setLocationUpdates:(id)a3
{
}

- (id)deviceEventUpdates
{
  return self->_deviceEventUpdates;
}

- (void)setDeviceEventUpdates:(id)a3
{
}

- (id)locationFetchSessionInvalidationBlock
{
  return self->_locationFetchSessionInvalidationBlock;
}

- (void)setLocationFetchSessionInvalidationBlock:(id)a3
{
}

- (SPRetryCount)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(id)a3
{
}

- (SPLocationFetchContext)lastContext
{
  return self->_lastContext;
}

- (void)setLastContext:(id)a3
{
}

void __51__SPOwnerSessionLocationFetch_interruptionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B2FD8000, a2, OS_LOG_TYPE_ERROR, "SPOwnerSessionLocationFetch Error re-subscribing location update %@", (uint8_t *)&v2, 0xCu);
}

void __78__SPOwnerSessionLocationFetch_subscribeAndFetchLocationForContext_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B2FD8000, a2, OS_LOG_TYPE_ERROR, "SPOwnerSessionLocationFetch Error receiving subscribed location update %@", (uint8_t *)&v2, 0xCu);
}

@end