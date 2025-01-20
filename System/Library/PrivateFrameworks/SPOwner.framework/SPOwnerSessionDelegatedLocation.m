@interface SPOwnerSessionDelegatedLocation
+ (id)exportedInterface;
+ (id)remoteInterface;
- (FMXPCSession)session;
- (SPOwnerSessionXPCProtocol)proxy;
- (id)locationUpdateBlock;
- (void)delegatedLocationForContext:(id)a3 completion:(id)a4;
- (void)didPublishDelegatedLocation:(id)a3;
- (void)setLocationUpdateBlock:(id)a3;
- (void)setProxy:(id)a3;
- (void)setSession:(id)a3;
- (void)subscribeDelegatedLocationUpdatesForContext:(id)a3 completion:(id)a4;
- (void)unsubscribeDelegatedLocationUpdatesWithCompletion:(id)a3;
@end

@implementation SPOwnerSessionDelegatedLocation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_locationUpdateBlock, 0);
  objc_storeStrong((id *)&self->_proxy, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

- (SPOwnerSessionXPCProtocol)proxy
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(SPOwnerSessionDelegatedLocation *)self session];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F61588]);
    v5 = +[SPOwnerSessionDelegatedLocation exportedInterface];
    v6 = +[SPOwnerSessionDelegatedLocation remoteInterface];
    v7 = (void *)[v4 initWithMachServiceName:@"com.apple.icloud.searchparty.delegatedlocationpublish.items" options:0 exportedObject:self exportedInterface:v5 remoteObjectInterface:v6 interruptionHandler:0 invalidationHandler:0];

    v8 = (void *)[objc_alloc(MEMORY[0x1E4F61590]) initWithServiceDescription:v7];
    [(SPOwnerSessionDelegatedLocation *)self setSession:v8];

    v9 = LogCategory_SecureLocations();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v7 machService];
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1B2FD8000, v9, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionLocationFetch: Establishing XPC connection to %@", buf, 0xCu);
    }
    v11 = [(SPOwnerSessionDelegatedLocation *)self session];
    [v11 resume];
  }
  v12 = [(SPOwnerSessionDelegatedLocation *)self session];
  v13 = [v12 proxy];

  return (SPOwnerSessionXPCProtocol *)v13;
}

+ (id)exportedInterface
{
  if (exportedInterface_onceToken_7 != -1) {
    dispatch_once(&exportedInterface_onceToken_7, &__block_literal_global_16);
  }
  v2 = (void *)exportedInterface_interface_7;

  return v2;
}

uint64_t __52__SPOwnerSessionDelegatedLocation_exportedInterface__block_invoke()
{
  exportedInterface_interface_7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B3FD78];

  return MEMORY[0x1F41817F8]();
}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken_9 != -1) {
    dispatch_once(&remoteInterface_onceToken_9, &__block_literal_global_49_0);
  }
  v2 = (void *)remoteInterface_interface_8;

  return v2;
}

uint64_t __50__SPOwnerSessionDelegatedLocation_remoteInterface__block_invoke()
{
  remoteInterface_interface_8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B44290];

  return MEMORY[0x1F41817F8]();
}

- (void)didPublishDelegatedLocation:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__SPOwnerSessionDelegatedLocation_didPublishDelegatedLocation___block_invoke;
  v6[3] = &unk_1E601B920;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSessionDelegatedLocation.didPublishDelegatedLocation", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __63__SPOwnerSessionDelegatedLocation_didPublishDelegatedLocation___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) locationUpdateBlock];

  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) locationUpdateBlock];
    v4[2](v4, *(void *)(a1 + 40));
  }
  else
  {
    v3 = LogCategory_LocationFetch();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionDelegatedLocation - received updated locations but no registered block", buf, 2u);
    }
  }
}

- (void)subscribeDelegatedLocationUpdatesForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F28B50] mainBundle];
  v9 = [v8 bundleIdentifier];
  [v6 setBundleIdentifier:v9];

  v10 = LogCategory_LocationFetch();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B2FD8000, v10, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionDelegatedLocation.subscribeDelegatedLocationUpdatesForContext:completion", (uint8_t *)buf, 2u);
  }

  v11 = [(SPOwnerSessionDelegatedLocation *)self locationUpdateBlock];

  if (v11) {
    [v6 setSubscribe:1];
  }
  objc_initWeak(buf, self);
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __90__SPOwnerSessionDelegatedLocation_subscribeDelegatedLocationUpdatesForContext_completion___block_invoke;
  activity_block[3] = &unk_1E601B850;
  objc_copyWeak(&v17, buf);
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSessionDelegatedLocation.subscribeDelegatedLocationUpdatesForContext:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  objc_destroyWeak(&v17);
  objc_destroyWeak(buf);
}

void __90__SPOwnerSessionDelegatedLocation_subscribeDelegatedLocationUpdatesForContext_completion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained proxy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __90__SPOwnerSessionDelegatedLocation_subscribeDelegatedLocationUpdatesForContext_completion___block_invoke_2;
  v6[3] = &unk_1E601D310;
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  objc_copyWeak(&v8, v2);
  [v4 delegatedLocationForContext:v5 completion:v6];

  objc_destroyWeak(&v8);
}

void __90__SPOwnerSessionDelegatedLocation_subscribeDelegatedLocationUpdatesForContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v6)
  {
    id WeakRetained = LogCategory_LocationFetch();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      __90__SPOwnerSessionDelegatedLocation_subscribeDelegatedLocationUpdatesForContext_completion___block_invoke_2_cold_1((uint64_t)v6, WeakRetained);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained didPublishDelegatedLocation:v5];
  }
}

- (void)unsubscribeDelegatedLocationUpdatesWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = LogCategory_LocationFetch();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionDelegatedLocation.unsubscribeDelegatedLocationUpdatesWithCompletion", v7, 2u);
  }

  [(SPOwnerSessionDelegatedLocation *)self setLocationUpdateBlock:0];
  id v6 = [(SPOwnerSessionDelegatedLocation *)self session];
  [v6 invalidate];

  [(SPOwnerSessionDelegatedLocation *)self setSession:0];
  v4[2](v4, 0);
}

- (void)delegatedLocationForContext:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = LogCategory_LocationFetch();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 uuids];
    *(_DWORD *)buf = 134217984;
    uint64_t v17 = [v9 count];
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionDelegatedLocation.delegatedLocationForContext:completion: %lu", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __74__SPOwnerSessionDelegatedLocation_delegatedLocationForContext_completion___block_invoke;
  activity_block[3] = &unk_1E601C400;
  id v13 = v6;
  id v10 = v6;
  objc_copyWeak(&v15, (id *)buf);
  id v14 = v7;
  id v11 = v7;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSessionDelegatedLocation.delegatedLocationForContext:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __74__SPOwnerSessionDelegatedLocation_delegatedLocationForContext_completion___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];
  [*(id *)(a1 + 32) setBundleIdentifier:v3];

  [*(id *)(a1 + 32) setSubscribe:0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained proxy];
  [v4 delegatedLocationForContext:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
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

- (id)locationUpdateBlock
{
  return self->_locationUpdateBlock;
}

- (void)setLocationUpdateBlock:(id)a3
{
}

void __90__SPOwnerSessionDelegatedLocation_subscribeDelegatedLocationUpdatesForContext_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B2FD8000, a2, OS_LOG_TYPE_ERROR, "SPOwnerSessionDelegatedLocation Error receiving subscribed location update %@", (uint8_t *)&v2, 0xCu);
}

@end