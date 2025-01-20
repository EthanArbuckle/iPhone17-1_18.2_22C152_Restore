@interface MRActiveRoutesObserver
+ (id)_computeActiveRouteIDsFromEndpoint:(id)a3;
+ (void)fetchActiveEndpointOnQueue:(id)a3 withCompletion:(id)a4;
+ (void)fetchActiveRouteIDsWithCompletion:(id)a3;
- (BOOL)supportNonLocalDevices;
- (MRAVEndpoint)activeEndpoint;
- (MRActiveRoutesObserver)initWithActiveRouteIDsChangedCallback:(id)a3;
- (NSArray)activeRouteIDs;
- (OS_dispatch_queue)workerQueue;
- (id)callback;
- (id)lastFetchAttemptToken;
- (void)_handleActiveSystemEndpointOutputDevicesDidChange:(id)a3;
- (void)_onWorkerQueue_reevaluate;
- (void)_onWorkerQueue_reevaluateWithEndpoint:(id)a3;
- (void)_reevaluate;
- (void)_reevaluateWithEndpoint:(id)a3;
- (void)setActiveEndpoint:(id)a3;
- (void)setActiveRouteIDs:(id)a3;
- (void)setCallback:(id)a3;
- (void)setLastFetchAttemptToken:(id)a3;
- (void)setSupportNonLocalDevices:(BOOL)a3;
- (void)setWorkerQueue:(id)a3;
@end

@implementation MRActiveRoutesObserver

- (MRActiveRoutesObserver)initWithActiveRouteIDsChangedCallback:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRActiveRoutesObserver;
  v5 = [(MRActiveRoutesObserver *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(MRActiveRoutesObserver *)v5 setCallback:v4];
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.mediaremote.MRActiveRoutesObserver", v7);
    [(MRActiveRoutesObserver *)v6 setWorkerQueue:v8];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v6 selector:sel__handleActiveSystemEndpointDidChange_ name:@"kMRMediaRemoteActiveSystemEndpointDidChangeNotification" object:0];

    [(MRActiveRoutesObserver *)v6 _reevaluate];
  }

  return v6;
}

+ (void)fetchActiveRouteIDsWithCompletion:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"MRActiveRoutesObserver.m", 61, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  qos_class_t v6 = qos_class_self();
  v7 = [MEMORY[0x1E4F1C9C8] date];
  dispatch_queue_t v8 = [MEMORY[0x1E4F29128] UUID];
  v9 = [v8 UUIDString];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"MRActiveRoutesObserver.fetchActiveRouteIDsWithCompletion", v9];
  objc_super v11 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = v10;
    _os_log_impl(&dword_194F3C000, v11, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __60__MRActiveRoutesObserver_fetchActiveRouteIDsWithCompletion___block_invoke;
  v22[3] = &unk_1E57D94B0;
  id v23 = v9;
  id v24 = v7;
  qos_class_t v26 = v6;
  id v25 = v5;
  id v12 = v5;
  id v13 = v7;
  id v14 = v9;
  v15 = (void *)MEMORY[0x1997190F0](v22);
  v16 = dispatch_get_global_queue(v6, 0);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __60__MRActiveRoutesObserver_fetchActiveRouteIDsWithCompletion___block_invoke_2;
  v19[3] = &unk_1E57D94D8;
  id v20 = v15;
  id v21 = a1;
  id v17 = v15;
  [a1 fetchActiveEndpointOnQueue:v16 withCompletion:v19];
}

void __60__MRActiveRoutesObserver_fetchActiveRouteIDsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _MRLogForCategory(0xAuLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      v7 = [MEMORY[0x1E4F1C9C8] date];
      [v7 timeIntervalSinceDate:*(void *)(a1 + 40)];
      *(_DWORD *)buf = 138544130;
      id v21 = @"MRActiveRoutesObserver.fetchActiveRouteIDsWithCompletion";
      __int16 v22 = 2114;
      uint64_t v23 = v6;
      __int16 v24 = 2112;
      id v25 = v3;
      __int16 v26 = 2048;
      uint64_t v27 = v8;
      v9 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      v10 = v4;
      uint32_t v11 = 42;
LABEL_6:
      _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
  }
  else if (v5)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    v7 = [MEMORY[0x1E4F1C9C8] date];
    [v7 timeIntervalSinceDate:*(void *)(a1 + 40)];
    *(_DWORD *)buf = 138543874;
    id v21 = @"MRActiveRoutesObserver.fetchActiveRouteIDsWithCompletion";
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    __int16 v24 = 2048;
    id v25 = v13;
    v9 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v10 = v4;
    uint32_t v11 = 32;
    goto LABEL_6;
  }

  id v14 = dispatch_get_global_queue(*(unsigned int *)(a1 + 56), 0);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__MRActiveRoutesObserver_fetchActiveRouteIDsWithCompletion___block_invoke_26;
  v17[3] = &unk_1E57D0DB8;
  id v15 = *(id *)(a1 + 48);
  id v18 = v3;
  id v19 = v15;
  id v16 = v3;
  dispatch_async(v14, v17);
}

uint64_t __60__MRActiveRoutesObserver_fetchActiveRouteIDsWithCompletion___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __60__MRActiveRoutesObserver_fetchActiveRouteIDsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _computeActiveRouteIDsFromEndpoint:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

+ (void)fetchActiveEndpointOnQueue:(id)a3 withCompletion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    __int16 v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"MRActiveRoutesObserver.m", 79, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  v9 = [MEMORY[0x1E4F1C9C8] date];
  v10 = [MEMORY[0x1E4F29128] UUID];
  uint32_t v11 = [v10 UUIDString];

  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"MRActiveRoutesObserver.fetchActiveEndpointOnQueue", v11];
  id v13 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v32 = v12;
    _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __68__MRActiveRoutesObserver_fetchActiveEndpointOnQueue_withCompletion___block_invoke;
  v26[3] = &unk_1E57D80A0;
  id v14 = v11;
  id v27 = v14;
  id v15 = v9;
  id v28 = v15;
  id v16 = v7;
  id v29 = v16;
  id v17 = v8;
  id v30 = v17;
  id v18 = (void (**)(void, void, void))MEMORY[0x1997190F0](v26);
  id v19 = +[MRUserSettings currentSettings];
  int v20 = [v19 supportTopologyHealing];

  if (v20)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __68__MRActiveRoutesObserver_fetchActiveEndpointOnQueue_withCompletion___block_invoke_2;
    v23[3] = &unk_1E57D9500;
    id v24 = v14;
    id v25 = v18;
    MRAVEndpointResolveActiveSystemEndpointWithTimeout(v16, v23, 7.0);

    id v21 = v24;
  }
  else
  {
    id v21 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:132];
    ((void (**)(void, void, void *))v18)[2](v18, 0, v21);
  }
}

void __68__MRActiveRoutesObserver_fetchActiveEndpointOnQueue_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _MRLogForCategory(0xAuLL);
  id v8 = v7;
  if (!v5 || v6)
  {
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __68__MRActiveRoutesObserver_fetchActiveEndpointOnQueue_withCompletion___block_invoke_cold_1(a1, (uint64_t)v6, v8);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:*(void *)(a1 + 40)];
      *(_DWORD *)buf = 138543874;
      __int16 v22 = @"MRActiveRoutesObserver.fetchActiveEndpointOnQueue";
      __int16 v23 = 2114;
      uint64_t v24 = v12;
      __int16 v25 = 2048;
      id v26 = v14;
      _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
    }
    if (!v5)
    {
      id v5 = +[MRAVLocalEndpoint sharedLocalEndpoint];
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:*(void *)(a1 + 40)];
      *(_DWORD *)buf = 138544130;
      __int16 v22 = @"MRActiveRoutesObserver.fetchActiveEndpointOnQueue";
      __int16 v23 = 2114;
      uint64_t v24 = v9;
      __int16 v25 = 2112;
      id v26 = v5;
      __int16 v27 = 2048;
      uint64_t v28 = v11;
      _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds", buf, 0x2Au);
    }
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__MRActiveRoutesObserver_fetchActiveEndpointOnQueue_withCompletion___block_invoke_34;
  v18[3] = &unk_1E57D0DB8;
  id v15 = *(NSObject **)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  id v19 = v5;
  id v20 = v16;
  id v17 = v5;
  dispatch_async(v15, v18);
}

uint64_t __68__MRActiveRoutesObserver_fetchActiveEndpointOnQueue_withCompletion___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __68__MRActiveRoutesObserver_fetchActiveEndpointOnQueue_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [[MRRequestDetails alloc] initWithName:@"MRActiveRoutesObserver" requestID:*(void *)(a1 + 32) reason:@"MRActiveRoutesObserver"];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __68__MRActiveRoutesObserver_fetchActiveEndpointOnQueue_withCompletion___block_invoke_3;
    v5[3] = &unk_1E57D0DE0;
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    [v6 connectToExternalDeviceWithOptions:0 details:v4 completion:v5];
  }
  else
  {
    id v4 = (MRRequestDetails *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:24];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __68__MRActiveRoutesObserver_fetchActiveEndpointOnQueue_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (NSArray)activeRouteIDs
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_activeRouteIDs;
  objc_sync_exit(v2);

  return v3;
}

- (void)setActiveEndpoint:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _MRLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 debugName];
    int v11 = 138412290;
    uint64_t v12 = v7;
    _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "[MRActiveRoutesObserver] ActiveEndpoint -> %@", (uint8_t *)&v11, 0xCu);
  }
  id v8 = self;
  objc_sync_enter(v8);
  if (v8->_activeEndpoint)
  {
    uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 removeObserver:v8 name:@"kMRAVEndpointOutputDevicesDidChangeNotification" object:v8->_activeEndpoint];
  }
  objc_storeStrong((id *)&v8->_activeEndpoint, a3);
  if (v8->_activeEndpoint)
  {
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v8 selector:sel__handleActiveSystemEndpointOutputDevicesDidChange_ name:@"kMRAVEndpointOutputDevicesDidChangeNotification" object:v8->_activeEndpoint];
  }
  objc_sync_exit(v8);

  [(MRActiveRoutesObserver *)v8 _reevaluateWithEndpoint:v5];
}

- (MRAVEndpoint)activeEndpoint
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_activeEndpoint;
  objc_sync_exit(v2);

  return v3;
}

- (void)_handleActiveSystemEndpointOutputDevicesDidChange:(id)a3
{
  id v4 = [(MRActiveRoutesObserver *)self activeEndpoint];
  [(MRActiveRoutesObserver *)self _reevaluateWithEndpoint:v4];
}

- (void)_reevaluate
{
  id v3 = [(MRActiveRoutesObserver *)self workerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__MRActiveRoutesObserver__reevaluate__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __37__MRActiveRoutesObserver__reevaluate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onWorkerQueue_reevaluate");
}

- (void)_onWorkerQueue_reevaluate
{
  id v3 = [(MRActiveRoutesObserver *)self workerQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [MEMORY[0x1E4F1C9C8] now];
  [(MRActiveRoutesObserver *)self setLastFetchAttemptToken:v4];
  id v5 = objc_opt_class();
  id v6 = [(MRActiveRoutesObserver *)self workerQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__MRActiveRoutesObserver__onWorkerQueue_reevaluate__block_invoke;
  v8[3] = &unk_1E57D9528;
  id v9 = v4;
  v10 = self;
  id v7 = v4;
  [v5 fetchActiveEndpointOnQueue:v6 withCompletion:v8];
}

void __51__MRActiveRoutesObserver__onWorkerQueue_reevaluate__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) lastFetchAttemptToken];

  if (v3 == v4) {
    [*(id *)(a1 + 40) setActiveEndpoint:v5];
  }
}

- (void)_reevaluateWithEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = [(MRActiveRoutesObserver *)self workerQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__MRActiveRoutesObserver__reevaluateWithEndpoint___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __50__MRActiveRoutesObserver__reevaluateWithEndpoint___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onWorkerQueue_reevaluateWithEndpoint:", *(void *)(a1 + 40));
}

- (void)_onWorkerQueue_reevaluateWithEndpoint:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MRActiveRoutesObserver *)self workerQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(id)objc_opt_class() _computeActiveRouteIDsFromEndpoint:v4];

  id v7 = [(MRActiveRoutesObserver *)self activeRouteIDs];
  if (v6 == v7)
  {
  }
  else
  {
    id v8 = v7;
    char v9 = [v6 isEqual:v7];

    if ((v9 & 1) == 0)
    {
      v10 = _MRLogForCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v6;
        _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "[MRActiveRoutesObserver] ActiveRouteIDs -> %@", (uint8_t *)&v14, 0xCu);
      }

      int v11 = self;
      objc_sync_enter(v11);
      objc_storeStrong((id *)&v11->_activeRouteIDs, v6);
      objc_sync_exit(v11);

      uint64_t v12 = [(MRActiveRoutesObserver *)v11 callback];

      if (v12)
      {
        uint64_t v13 = [(MRActiveRoutesObserver *)v11 callback];
        ((void (**)(void, id))v13)[2](v13, v6);
      }
    }
  }
}

+ (id)_computeActiveRouteIDsFromEndpoint:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[MRUserSettings currentSettings];
  int v5 = [v4 supportTopologyHealing];

  if (v5)
  {
    id v6 = [v3 resolvedOutputDevices];
    id v7 = objc_msgSend(v6, "msv_map:", &__block_literal_global_99);
  }
  else
  {
    id v6 = +[MRDeviceInfoRequest localDeviceInfo];
    uint64_t v8 = [v6 effectiveID];
    char v9 = (void *)v8;
    if (v8)
    {
      v11[0] = v8;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

id __61__MRActiveRoutesObserver__computeActiveRouteIDsFromEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 deviceType] == 1)
  {
    id v3 = [v2 uid];
  }
  else
  {
    id v4 = +[MRDeviceInfoRequest localDeviceInfo];
    int v5 = [v4 clusterID];
    id v6 = v5;
    if (v5)
    {
      id v3 = v5;
    }
    else
    {
      id v7 = [v4 deviceUID];
      uint64_t v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        id v9 = [v2 uid];
      }
      id v3 = v9;
    }
  }

  return v3;
}

- (void)setActiveRouteIDs:(id)a3
{
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (id)lastFetchAttemptToken
{
  return self->_lastFetchAttemptToken;
}

- (void)setLastFetchAttemptToken:(id)a3
{
}

- (BOOL)supportNonLocalDevices
{
  return self->_supportNonLocalDevices;
}

- (void)setSupportNonLocalDevices:(BOOL)a3
{
  self->_supportNonLocalDevices = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastFetchAttemptToken, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_activeRouteIDs, 0);

  objc_storeStrong((id *)&self->_activeEndpoint, 0);
}

void __68__MRActiveRoutesObserver_fetchActiveEndpointOnQueue_withCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSinceDate:*(void *)(a1 + 40)];
  int v9 = 138544130;
  v10 = @"MRActiveRoutesObserver.fetchActiveEndpointOnQueue";
  __int16 v11 = 2114;
  uint64_t v12 = v6;
  __int16 v13 = 2114;
  uint64_t v14 = a2;
  __int16 v15 = 2048;
  uint64_t v16 = v8;
  _os_log_error_impl(&dword_194F3C000, a3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", (uint8_t *)&v9, 0x2Au);
}

@end