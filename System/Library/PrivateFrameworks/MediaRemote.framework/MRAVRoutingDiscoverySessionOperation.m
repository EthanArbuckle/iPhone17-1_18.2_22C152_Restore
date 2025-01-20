@interface MRAVRoutingDiscoverySessionOperation
- (MRAVRoutingDiscoverySessionOperation)initWithOutputDeviceUIDs:(id)a3;
- (NSArray)outputDeviceUIDs;
- (OS_dispatch_queue)dispatchQueue;
- (id)endpointDiscoveredHandler;
- (id)finishHandler;
- (id)outputDeviceDiscoveredHandler;
- (void)_finishWithError:(id)a3;
- (void)_notifyDiscoveredEndpoint:(id)a3 outputDevice:(id)a4 forTargetOutputDevice:(id)a5;
- (void)cancel;
- (void)cancelWithError:(id)a3;
- (void)executeWithTimeout:(double)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEndpointDiscoveredHandler:(id)a3;
- (void)setFinishHandler:(id)a3;
- (void)setOutputDeviceDiscoveredHandler:(id)a3;
@end

@implementation MRAVRoutingDiscoverySessionOperation

- (id)finishHandler
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[v2->_finishHandler copy];
  objc_sync_exit(v2);

  return v3;
}

- (void)setDispatchQueue:(id)a3
{
  v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  dispatchQueue = obj->_dispatchQueue;
  obj->_dispatchQueue = v4;

  objc_sync_exit(obj);
}

- (void)executeWithTimeout:(double)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_session)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, v5, @"MRAVRoutingDiscoverySessionOperation.m", 115, @"Invalid parameter not satisfying: %@", @"!_session" object file lineNumber description];
  }
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] now];
  startDate = v5->_startDate;
  v5->_startDate = (NSDate *)v6;

  v8 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v9 = [v8 UUIDString];
  requestID = v5->_requestID;
  v5->_requestID = (NSString *)v9;

  id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v12 = [(MRAVRoutingDiscoverySessionOperation *)v5 outputDeviceUIDs];
  v13 = (void *)[v11 initWithArray:v12];

  v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", objc_opt_class(), v5->_requestID];
  v15 = [(MRAVRoutingDiscoverySessionOperation *)v5 outputDeviceUIDs];

  if (v15)
  {
    v16 = [(MRAVRoutingDiscoverySessionOperation *)v5 outputDeviceUIDs];
    [v14 appendFormat:@" for %@", v16];
  }
  v17 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v37 = v14;
    _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v18 = [NSString alloc];
  uint64_t v19 = objc_opt_class();
  v20 = [(MRAVRoutingDiscoverySessionOperation *)v5 outputDeviceUIDs];
  v21 = (void *)[v18 initWithFormat:@"%@-%@", v19, v20];

  v22 = [MRBlockGuard alloc];
  v23 = [(MRAVRoutingDiscoverySessionOperation *)v5 dispatchQueue];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __59__MRAVRoutingDiscoverySessionOperation_executeWithTimeout___block_invoke;
  v35[3] = &unk_1E57D1148;
  v35[4] = v5;
  uint64_t v24 = [(MRBlockGuard *)v22 initWithTimeout:v21 reason:v23 queue:v35 handler:a3];
  guard = v5->_guard;
  v5->_guard = (MRBlockGuard *)v24;

  uint64_t v26 = +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:8];
  session = v5->_session;
  v5->_session = (MRAVRoutingDiscoverySession *)v26;

  objc_initWeak((id *)buf, v5);
  v28 = v5->_session;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __59__MRAVRoutingDiscoverySessionOperation_executeWithTimeout___block_invoke_2;
  v32[3] = &unk_1E57D4498;
  objc_copyWeak(&v34, (id *)buf);
  id v29 = v13;
  id v33 = v29;
  id v30 = [(MRAVRoutingDiscoverySession *)v28 addEndpointsAddedCallback:v32];
  [(MRAVRoutingDiscoverySession *)v5->_session setDiscoveryMode:2];

  objc_destroyWeak(&v34);
  objc_destroyWeak((id *)buf);

  objc_sync_exit(v5);
}

void __101__MRAVRoutingDiscoverySessionOperation__notifyDiscoveredEndpoint_outputDevice_forTargetOutputDevice___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) endpointDiscoveredHandler];
  if (v2)
  {
    id v3 = v2;
    v2[2](v2, *(void *)(a1 + 40));
    v2 = (void (**)(void, void))v3;
  }
}

- (void)setFinishHandler:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  id finishHandler = v4->_finishHandler;
  v4->_id finishHandler = (id)v5;

  objc_sync_exit(v4);
}

- (void)_notifyDiscoveredEndpoint:(id)a3 outputDevice:(id)a4 forTargetOutputDevice:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  objc_sync_enter(v11);
  discoveredTargetOutputDeviceUIDs = v11->_discoveredTargetOutputDeviceUIDs;
  if (!discoveredTargetOutputDeviceUIDs)
  {
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v14 = v11->_discoveredTargetOutputDeviceUIDs;
    v11->_discoveredTargetOutputDeviceUIDs = v13;

    discoveredTargetOutputDeviceUIDs = v11->_discoveredTargetOutputDeviceUIDs;
  }
  [(NSMutableSet *)discoveredTargetOutputDeviceUIDs addObject:v10];
  discoveredEndpoints = v11->_discoveredEndpoints;
  if (!discoveredEndpoints)
  {
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSArray count](v11->_outputDeviceUIDs, "count"));
    v17 = v11->_discoveredEndpoints;
    v11->_discoveredEndpoints = (NSMutableSet *)v16;

    discoveredEndpoints = v11->_discoveredEndpoints;
  }
  if (([(NSMutableSet *)discoveredEndpoints containsObject:v8] & 1) == 0)
  {
    [(NSMutableSet *)v11->_discoveredEndpoints addObject:v8];
    id v18 = [(MRAVRoutingDiscoverySessionOperation *)v11 dispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __101__MRAVRoutingDiscoverySessionOperation__notifyDiscoveredEndpoint_outputDevice_forTargetOutputDevice___block_invoke;
    block[3] = &unk_1E57D0790;
    block[4] = v11;
    id v28 = v8;
    dispatch_async(v18, block);
  }
  discoveredOutputDevices = v11->_discoveredOutputDevices;
  if (!discoveredOutputDevices)
  {
    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSArray count](v11->_outputDeviceUIDs, "count"));
    v21 = v11->_discoveredOutputDevices;
    v11->_discoveredOutputDevices = (NSMutableSet *)v20;

    discoveredOutputDevices = v11->_discoveredOutputDevices;
  }
  if (([(NSMutableSet *)discoveredOutputDevices containsObject:v9] & 1) == 0)
  {
    [(NSMutableSet *)v11->_discoveredOutputDevices addObject:v9];
    v22 = [(MRAVRoutingDiscoverySessionOperation *)v11 dispatchQueue];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __101__MRAVRoutingDiscoverySessionOperation__notifyDiscoveredEndpoint_outputDevice_forTargetOutputDevice___block_invoke_2;
    v24[3] = &unk_1E57D1B18;
    v24[4] = v11;
    id v25 = v8;
    id v26 = v9;
    dispatch_async(v22, v24);
  }
  uint64_t v23 = [(NSMutableSet *)v11->_discoveredTargetOutputDeviceUIDs count];
  if (v23 == [(NSArray *)v11->_outputDeviceUIDs count]) {
    [(MRAVRoutingDiscoverySessionOperation *)v11 _finishWithError:0];
  }
  objc_sync_exit(v11);
}

- (OS_dispatch_queue)dispatchQueue
{
  v2 = self;
  objc_sync_enter(v2);
  dispatchQueue = v2->_dispatchQueue;
  if (!dispatchQueue)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.mediaremote.discoverySessionOperation", v4);
    uint64_t v6 = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    dispatchQueue = v2->_dispatchQueue;
  }
  id v7 = dispatchQueue;
  objc_sync_exit(v2);

  return v7;
}

- (MRAVRoutingDiscoverySessionOperation)initWithOutputDeviceUIDs:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRAVRoutingDiscoverySessionOperation;
  dispatch_queue_t v5 = [(MRAVRoutingDiscoverySessionOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    outputDeviceUIDs = v5->_outputDeviceUIDs;
    v5->_outputDeviceUIDs = (NSArray *)v6;
  }
  return v5;
}

- (void)setEndpointDiscoveredHandler:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  id endpointDiscoveredHandler = v4->_endpointDiscoveredHandler;
  v4->_id endpointDiscoveredHandler = (id)v5;

  objc_sync_exit(v4);
}

- (id)endpointDiscoveredHandler
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[v2->_endpointDiscoveredHandler copy];
  objc_sync_exit(v2);

  return v3;
}

- (void)setOutputDeviceDiscoveredHandler:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  id outputDeviceDiscoveredHandler = v4->_outputDeviceDiscoveredHandler;
  v4->_id outputDeviceDiscoveredHandler = (id)v5;

  objc_sync_exit(v4);
}

- (id)outputDeviceDiscoveredHandler
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[v2->_outputDeviceDiscoveredHandler copy];
  objc_sync_exit(v2);

  return v3;
}

uint64_t __59__MRAVRoutingDiscoverySessionOperation_executeWithTimeout___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) cancelWithError:a2];
}

void __59__MRAVRoutingDiscoverySessionOperation_executeWithTimeout___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v19 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v16 = v3;
    obuint64_t j = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v9 = *(id *)(v19 + 32);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v21;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v21 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * j);
                v15 = objc_msgSend(v8, "outputDeviceForUID:", v14, v16);
                if (v15) {
                  [WeakRetained _notifyDiscoveredEndpoint:v8 outputDevice:v15 forTargetOutputDevice:v14];
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v11);
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v6);
    }

    id v3 = v16;
  }
}

void __101__MRAVRoutingDiscoverySessionOperation__notifyDiscoveredEndpoint_outputDevice_forTargetOutputDevice___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) outputDeviceDiscoveredHandler];
  if (v2)
  {
    id v3 = v2;
    v2[2](v2, *(void *)(a1 + 40), *(void *)(a1 + 48));
    v2 = (void (**)(void, void, void))v3;
  }
}

- (void)_finishWithError:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MRAVRoutingDiscoverySession *)self->_session discoveryMode])
  {
    [(MRAVRoutingDiscoverySession *)self->_session setDiscoveryMode:0];
    id v5 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v6 = [(MRAVRoutingDiscoverySessionOperation *)self outputDeviceUIDs];
    id v7 = (void *)[v5 initWithArray:v6];

    [v7 minusSet:self->_discoveredTargetOutputDeviceUIDs];
    id v8 = objc_alloc_init(MRAVRoutingDiscoverySessionOperationReport);
    id v9 = [(NSMutableSet *)self->_discoveredTargetOutputDeviceUIDs allObjects];
    [(MRAVRoutingDiscoverySessionOperationReport *)v8 setDiscoveredOutputDeviceUIDs:v9];

    uint64_t v10 = [v7 allObjects];
    [(MRAVRoutingDiscoverySessionOperationReport *)v8 setUndiscoveredOutputDeviceUIDs:v10];

    if ([(NSArray *)self->_outputDeviceUIDs count]
      && ![(NSMutableSet *)self->_discoveredTargetOutputDeviceUIDs count])
    {
      id v11 = v4;
      if (!v4)
      {
        id v34 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:39 format:@"Could not discover any of the provided devices"];
        [(MRAVRoutingDiscoverySessionOperationReport *)v8 setError:v34];

LABEL_6:
        uint64_t v12 = [(MRAVRoutingDiscoverySessionOperationReport *)v8 error];
        if (v12)
        {
        }
        else
        {
          uint64_t v18 = [(MRAVRoutingDiscoverySessionOperationReport *)v8 discoveredOutputDeviceUIDs];

          if (v18)
          {
            uint64_t v19 = [(MRAVRoutingDiscoverySessionOperation *)self outputDeviceUIDs];

            id v16 = _MRLogForCategory(0xAuLL);
            BOOL v20 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
            if (v19)
            {
              if (v20)
              {
                uint64_t v21 = objc_opt_class();
                requestID = self->_requestID;
                long long v23 = [(MRAVRoutingDiscoverySessionOperationReport *)v8 discoveredOutputDeviceUIDs];
                long long v24 = [(MRAVRoutingDiscoverySessionOperation *)self outputDeviceUIDs];
                long long v25 = [MEMORY[0x1E4F1C9C8] date];
                [v25 timeIntervalSinceDate:self->_startDate];
                *(_DWORD *)buf = 138544386;
                uint64_t v46 = v21;
                __int16 v47 = 2114;
                v48 = requestID;
                __int16 v49 = 2112;
                v50 = v23;
                __int16 v51 = 2114;
                v52 = v24;
                __int16 v53 = 2048;
                uint64_t v54 = v26;
                _os_log_impl(&dword_194F3C000, v16, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds", buf, 0x34u);
              }
              goto LABEL_29;
            }
            if (v20)
            {
              uint64_t v38 = objc_opt_class();
              v39 = self->_requestID;
              uint64_t v30 = [(MRAVRoutingDiscoverySessionOperationReport *)v8 discoveredOutputDeviceUIDs];
              v31 = [MEMORY[0x1E4F1C9C8] date];
              [v31 timeIntervalSinceDate:self->_startDate];
              *(_DWORD *)buf = 138544130;
              uint64_t v46 = v38;
              __int16 v47 = 2114;
              v48 = v39;
              __int16 v49 = 2112;
              v50 = v30;
              __int16 v51 = 2048;
              v52 = v40;
              id v33 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
              goto LABEL_27;
            }
LABEL_29:

            v41 = [(MRAVRoutingDiscoverySessionOperation *)self dispatchQueue];
            v43[0] = MEMORY[0x1E4F143A8];
            v43[1] = 3221225472;
            v43[2] = __57__MRAVRoutingDiscoverySessionOperation__finishWithError___block_invoke;
            v43[3] = &unk_1E57D0790;
            v43[4] = self;
            v44 = v8;
            v42 = v8;
            dispatch_async(v41, v43);

            goto LABEL_30;
          }
        }
        v13 = [(MRAVRoutingDiscoverySessionOperationReport *)v8 error];

        uint64_t v14 = [(MRAVRoutingDiscoverySessionOperation *)self outputDeviceUIDs];

        v15 = _MRLogForCategory(0xAuLL);
        id v16 = v15;
        if (v13)
        {
          BOOL v17 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
          if (v14)
          {
            if (v17) {
              [(MRAVRoutingDiscoverySessionOperation *)self _finishWithError:v16];
            }
          }
          else if (v17)
          {
            [(MRAVRoutingDiscoverySessionOperation *)(uint64_t)self _finishWithError:v16];
          }
          goto LABEL_29;
        }
        BOOL v27 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          if (v27)
          {
            uint64_t v28 = objc_opt_class();
            id v29 = self->_requestID;
            uint64_t v30 = [(MRAVRoutingDiscoverySessionOperation *)self outputDeviceUIDs];
            v31 = [MEMORY[0x1E4F1C9C8] date];
            [v31 timeIntervalSinceDate:self->_startDate];
            *(_DWORD *)buf = 138544130;
            uint64_t v46 = v28;
            __int16 v47 = 2114;
            v48 = v29;
            __int16 v49 = 2114;
            v50 = v30;
            __int16 v51 = 2048;
            v52 = v32;
            id v33 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_27:
            _os_log_impl(&dword_194F3C000, v16, OS_LOG_TYPE_DEFAULT, v33, buf, 0x2Au);

            goto LABEL_28;
          }
        }
        else if (v27)
        {
          uint64_t v35 = objc_opt_class();
          v36 = self->_requestID;
          uint64_t v30 = [MEMORY[0x1E4F1C9C8] date];
          [v30 timeIntervalSinceDate:self->_startDate];
          *(_DWORD *)buf = 138543874;
          uint64_t v46 = v35;
          __int16 v47 = 2114;
          v48 = v36;
          __int16 v49 = 2048;
          v50 = v37;
          _os_log_impl(&dword_194F3C000, v16, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
LABEL_28:

          goto LABEL_29;
        }
        goto LABEL_29;
      }
    }
    else
    {
      id v11 = 0;
    }
    [(MRAVRoutingDiscoverySessionOperationReport *)v8 setError:v11];
    goto LABEL_6;
  }
LABEL_30:
}

void __57__MRAVRoutingDiscoverySessionOperation__finishWithError___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) finishHandler];
  if (v2)
  {
    id v3 = v2;
    v2[2](v2, *(void *)(a1 + 40));
    v2 = (void (**)(void, void))v3;
  }
}

- (void)cancel
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:25];
  [(MRAVRoutingDiscoverySessionOperation *)self cancelWithError:v3];
}

- (void)cancelWithError:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(MRAVRoutingDiscoverySessionOperation *)v4 _finishWithError:v5];
  objc_sync_exit(v4);
}

- (NSArray)outputDeviceUIDs
{
  return self->_outputDeviceUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_guard, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_discoveredTargetOutputDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_discoveredOutputDevices, 0);
  objc_storeStrong((id *)&self->_discoveredEndpoints, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_finishHandler, 0);
  objc_storeStrong(&self->_endpointDiscoveredHandler, 0);

  objc_storeStrong(&self->_outputDeviceDiscoveredHandler, 0);
}

- (void)_finishWithError:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  uint64_t v6 = *(void *)(a1 + 88);
  id v7 = [a2 error];
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  [v8 timeIntervalSinceDate:*(void *)(a1 + 80)];
  OUTLINED_FUNCTION_0_10();
  uint64_t v12 = v6;
  __int16 v13 = v9;
  uint64_t v14 = v7;
  __int16 v15 = 2048;
  uint64_t v16 = v10;
  _os_log_error_impl(&dword_194F3C000, a3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v11, 0x2Au);
}

- (void)_finishWithError:(NSObject *)a3 .cold.2(void *a1, void *a2, NSObject *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  uint64_t v6 = a1[11];
  id v7 = [a2 error];
  id v8 = [a1 outputDeviceUIDs];
  __int16 v9 = [MEMORY[0x1E4F1C9C8] date];
  [v9 timeIntervalSinceDate:a1[10]];
  OUTLINED_FUNCTION_0_10();
  uint64_t v13 = v6;
  __int16 v14 = v10;
  __int16 v15 = v7;
  __int16 v16 = v10;
  uint64_t v17 = v8;
  __int16 v18 = 2048;
  uint64_t v19 = v11;
  _os_log_error_impl(&dword_194F3C000, a3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", v12, 0x34u);
}

@end