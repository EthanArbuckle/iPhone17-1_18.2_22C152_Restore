@interface PUIPosterSnapshotController
+ (unint64_t)defaultRequestOutput;
- (PUIPosterSnapshotCache)cache;
- (PUIPosterSnapshotController)initWithCache:(id)a3 instanceIdentifier:(id)a4;
- (id)latestSnapshotBundleForRequest:(id)a3 error:(id *)a4;
- (void)_snapshotRequestDidFinishWithResult:(id)a3 error:(id)a4 request:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)executeSnapshotRequest:(id)a3 completion:(id)a4;
- (void)invalidate;
@end

@implementation PUIPosterSnapshotController

- (PUIPosterSnapshotController)initWithCache:(id)a3 instanceIdentifier:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  v11 = v10;
  if (!v10 || ([v10 conformsToProtocol:&unk_27083A7D0] & 1) != 0)
  {

    v34.receiver = self;
    v34.super_class = (Class)PUIPosterSnapshotController;
    v12 = [(PUIPosterSnapshotController *)&v34 init];
    if (v12)
    {
      uint64_t v13 = [objc_alloc(MEMORY[0x263F29BD0]) initWithFlag:0];
      invalidationFlag = v12->_invalidationFlag;
      v12->_invalidationFlag = (BSAtomicFlag *)v13;

      uint64_t v15 = [objc_alloc(MEMORY[0x263F5F430]) initWithDefaultInstanceIdentifier:v9];
      extensionProvider = v12->_extensionProvider;
      v12->_extensionProvider = (PFPosterExtensionProvider *)v15;

      [(PFPosterExtensionProvider *)v12->_extensionProvider start];
      objc_storeStrong((id *)&v12->_cache, a3);
      v12->_lock._os_unfair_lock_opaque = 0;
      uint64_t v17 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
      lock_providerToSnapshotterMap = v12->_lock_providerToSnapshotterMap;
      v12->_lock_providerToSnapshotterMap = (NSMapTable *)v17;

      uint64_t v19 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
      lock_snapshotIdentifierToSnapshotRequestMap = v12->_lock_snapshotIdentifierToSnapshotRequestMap;
      v12->_lock_snapshotIdentifierToSnapshotRequestMap = (NSMapTable *)v19;

      v21 = [MEMORY[0x263F29C50] concurrent];
      v22 = [v21 autoreleaseFrequency:1];
      uint64_t v23 = BSDispatchQueueCreate();
      completionBlockQueue = v12->_completionBlockQueue;
      v12->_completionBlockQueue = (OS_dispatch_queue *)v23;

      cache = v12->_cache;
      if (cache)
      {
        id v33 = 0;
        char v26 = [(PUIPosterSnapshotCache *)cache checkCacheIsReachable:&v33];
        id v27 = v33;
        v28 = v27;
        if ((v26 & 1) == 0)
        {
          v31 = PUILogSnapshotting();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
            -[PUIPosterSnapshotController initWithCache:instanceIdentifier:]((uint64_t)v28, v31);
          }

          v29 = 0;
          goto LABEL_8;
        }
      }
    }
    v29 = v12;
LABEL_8:

    return v29;
  }
  v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PUIPosterSnapshotCache)]"];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[PUIPosterSnapshotController initWithCache:instanceIdentifier:](a2);
  }
  [v32 UTF8String];
  result = (PUIPosterSnapshotController *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  [(PUIPosterSnapshotController *)self invalidate];
  lock_providerToSnapshotterMap = self->_lock_providerToSnapshotterMap;
  self->_lock_providerToSnapshotterMap = 0;

  lock_snapshotIdentifierToSnapshotRequestMap = self->_lock_snapshotIdentifierToSnapshotRequestMap;
  self->_lock_snapshotIdentifierToSnapshotRequestMap = 0;

  v5.receiver = self;
  v5.super_class = (Class)PUIPosterSnapshotController;
  [(PUIPosterSnapshotController *)&v5 dealloc];
}

+ (unint64_t)defaultRequestOutput
{
  return 1;
}

- (void)executeSnapshotRequest:(id)a3 completion:(id)a4
{
  v51[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v37 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"completion"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSnapshotController executeSnapshotRequest:completion:](a2);
    }
    [v37 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0DBC40);
  }
  id v9 = (void (**)(void, void, void, void))v8;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    id v10 = objc_msgSend(MEMORY[0x263F087E8], "pui_errorWithCode:", 5);
    ((void (**)(void, id, void, void *))v9)[2](v9, v7, 0, v10);
  }
  else
  {
    v11 = objc_opt_new();
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __65__PUIPosterSnapshotController_executeSnapshotRequest_completion___block_invoke;
    v47[3] = &unk_2654715A8;
    id v38 = v11;
    id v48 = v38;
    v49 = v9;
    v39 = (void (**)(void, void, void, void))MEMORY[0x25A2F6090](v47);
    v40 = [v7 path];
    v12 = [v40 serverIdentity];
    uint64_t v13 = [v12 provider];

    v14 = [(PFPosterExtensionProvider *)self->_extensionProvider extensionForIdentifier];
    uint64_t v15 = [v14 objectForKey:v13];

    if (v15)
    {
      os_unfair_lock_lock(&self->_lock);
      v16 = [(NSMapTable *)self->_lock_providerToSnapshotterMap objectForKey:v13];
      uint64_t v17 = v16;
      if (v16 && [(PUIPosterSnapshotter *)v16 isValid])
      {
        v18 = v17;
      }
      else
      {
        uint64_t v19 = [(PFPosterExtensionProvider *)self->_extensionProvider extensionForIdentifier];
        v20 = [v19 objectForKey:v13];

        v21 = [(PFPosterExtensionProvider *)self->_extensionProvider instanceProvider];
        v22 = [v21 acquireInstanceForExtension:v20 reason:@"snapshots" error:0];

        v18 = [[PUIPosterSnapshotter alloc] initWithExtensionInstance:v22];
        [(NSMapTable *)self->_lock_providerToSnapshotterMap setObject:v18 forKey:v13];
      }
      lock_snapshotIdentifierToSnapshotRequestMap = self->_lock_snapshotIdentifierToSnapshotRequestMap;
      v24 = [v7 uniqueIdentifier];
      [(NSMapTable *)lock_snapshotIdentifierToSnapshotRequestMap setObject:v7 forKey:v24];

      lock_runtimeAssertion = self->_lock_runtimeAssertion;
      ++self->_lock_runningSnapshotters;
      if (lock_runtimeAssertion)
      {
        char v26 = PUILogSnapshotting();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          -[PUIPosterSnapshotController executeSnapshotRequest:completion:].cold.4(v26);
        }
      }
      else
      {
        v30 = (void *)MEMORY[0x263F64408];
        v31 = [MEMORY[0x263F64630] currentProcess];
        v32 = objc_msgSend(v30, "pf_prewarmRuntimeAssertionForTarget:explanation:", v31, @"Snapshotting assertion");

        id v46 = 0;
        LOBYTE(v30) = [v32 acquireWithError:&v46];
        char v26 = v46;
        id v33 = PUILogSnapshotting();
        objc_super v34 = v33;
        if (v30)
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
            -[PUIPosterSnapshotController executeSnapshotRequest:completion:](v34);
          }

          v35 = v32;
        }
        else
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            -[PUIPosterSnapshotController executeSnapshotRequest:completion:]((uint64_t)v26, v34);
          }

          v35 = 0;
        }
        v36 = self->_lock_runtimeAssertion;
        self->_lock_runtimeAssertion = v35;
      }
      os_unfair_lock_unlock(&self->_lock);
      objc_initWeak(&location, self);
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __65__PUIPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_102;
      v41[3] = &unk_2654715D0;
      objc_copyWeak(&v44, &location);
      v43 = v39;
      id v42 = v7;
      [(PUIPosterSnapshotter *)v18 enqueueSnapshotRequest:v42 completion:v41];

      objc_destroyWeak(&v44);
      objc_destroyWeak(&location);
    }
    else
    {
      id v27 = (void *)MEMORY[0x263F087E8];
      uint64_t v50 = *MEMORY[0x263F08338];
      v18 = [NSString stringWithFormat:@"Extension '%@' was not found", v13];
      v51[0] = v18;
      v28 = [NSDictionary dictionaryWithObjects:v51 forKeys:&v50 count:1];
      v29 = objc_msgSend(v27, "pui_errorWithCode:userInfo:", 3, v28);
      ((void (**)(void, id, void, void *))v39)[2](v39, v7, 0, v29);
    }
  }
}

void __65__PUIPosterSnapshotController_executeSnapshotRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if ([*(id *)(a1 + 32) signal]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __65__PUIPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_102(uint64_t a1, void *a2, void *a3)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _snapshotRequestDidFinishWithResult:v5 error:v6 request:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v11 = a1 + 32;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(v11 + 8);
    v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08338];
    v16[0] = @"Snapshot controller was deallocated before snapshot could be completed.";
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    v14 = objc_msgSend(v12, "pui_errorWithCode:userInfo:", 3, v13);
    (*(void (**)(uint64_t, uint64_t, void, void *))(v10 + 16))(v10, v9, 0, v14);
  }
}

- (id)latestSnapshotBundleForRequest:(id)a3 error:(id *)a4
{
  return (id)[(PUIPosterSnapshotCache *)self->_cache latestSnapshotBundleForRequest:a3 error:a4];
}

- (void)_snapshotRequestDidFinishWithResult:(id)a3 error:(id)a4 request:(id)a5 completion:(id)a6
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v14)
  {
    v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"completion"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSnapshotController _snapshotRequestDidFinishWithResult:error:request:completion:](a2);
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0DC304);
  }
  uint64_t v15 = v14;
  v16 = self->_completionBlockQueue;
  os_unfair_lock_lock(&self->_lock);
  --self->_lock_runningSnapshotters;
  lock_snapshotIdentifierToSnapshotRequestMap = self->_lock_snapshotIdentifierToSnapshotRequestMap;
  v18 = [v11 request];
  uint64_t v19 = [v18 uniqueIdentifier];
  [(NSMapTable *)lock_snapshotIdentifierToSnapshotRequestMap removeObjectForKey:v19];

  if (!self->_lock_runningSnapshotters)
  {
    v31 = v16;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v20 = [(NSMapTable *)self->_lock_providerToSnapshotterMap objectEnumerator];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v50;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v50 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v49 + 1) + 8 * v24++) invalidate];
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v49 objects:v53 count:16];
      }
      while (v22);
    }

    [(NSMapTable *)self->_lock_providerToSnapshotterMap removeAllObjects];
    [(RBSAssertion *)self->_lock_runtimeAssertion invalidate];
    lock_runtimeAssertion = self->_lock_runtimeAssertion;
    self->_lock_runtimeAssertion = 0;

    v16 = v31;
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v12)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __92__PUIPosterSnapshotController__snapshotRequestDidFinishWithResult_error_request_completion___block_invoke;
    block[3] = &unk_2654712A0;
    id v48 = v15;
    id v46 = v13;
    id v47 = v12;
    dispatch_async((dispatch_queue_t)v16, block);

    id v26 = v48;
  }
  else if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    [v11 invalidate];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __92__PUIPosterSnapshotController__snapshotRequestDidFinishWithResult_error_request_completion___block_invoke_2_111;
    v32[3] = &unk_265471648;
    id v34 = v15;
    id v33 = v13;
    dispatch_async((dispatch_queue_t)v16, v32);

    id v26 = v34;
  }
  else
  {
    if ([v13 output] != 2)
    {
      id v27 = [[PUIPosterSnapshotResult alloc] initWithSnapshotterResult:v11];
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __92__PUIPosterSnapshotController__snapshotRequestDidFinishWithResult_error_request_completion___block_invoke_2;
      v41[3] = &unk_2654712A0;
      id v44 = v15;
      id v42 = v13;
      v43 = v27;
      v28 = v27;
      dispatch_async((dispatch_queue_t)v16, v41);
    }
    id v26 = [(PUIPosterSnapshotController *)self cache];
    if (v26)
    {
      v29 = [v11 snapshotBundle];
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __92__PUIPosterSnapshotController__snapshotRequestDidFinishWithResult_error_request_completion___block_invoke_3;
      v35[3] = &unk_265471620;
      id v36 = v13;
      id v26 = v26;
      id v37 = v26;
      id v38 = v16;
      id v40 = v15;
      id v39 = v11;
      [v26 cacheSnapshotBundle:v29 forRequest:v36 completion:v35];
    }
  }
}

uint64_t __92__PUIPosterSnapshotController__snapshotRequestDidFinishWithResult_error_request_completion___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

uint64_t __92__PUIPosterSnapshotController__snapshotRequestDidFinishWithResult_error_request_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

void __92__PUIPosterSnapshotController__snapshotRequestDidFinishWithResult_error_request_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = PUILogSnapshotting();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __92__PUIPosterSnapshotController__snapshotRequestDidFinishWithResult_error_request_completion___block_invoke_3_cold_1(a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v6;
    _os_log_impl(&dword_25A0AF000, v5, OS_LOG_TYPE_DEFAULT, "finished caching result for request %{public}@", buf, 0xCu);
  }

  if ([*(id *)(a1 + 32) output] == 2)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    id v23 = 0;
    uint64_t v9 = [v7 latestSnapshotBundleForRequest:v8 error:&v23];
    id v10 = v23;
    id v11 = *(NSObject **)(a1 + 48);
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __92__PUIPosterSnapshotController__snapshotRequestDidFinishWithResult_error_request_completion___block_invoke_109;
    uint64_t v17 = &unk_2654715F8;
    id v22 = *(id *)(a1 + 64);
    id v18 = *(id *)(a1 + 32);
    id v19 = v9;
    id v20 = *(id *)(a1 + 56);
    id v21 = v10;
    id v12 = v10;
    id v13 = v9;
    dispatch_async(v11, &v14);
  }
  objc_msgSend(*(id *)(a1 + 56), "invalidate", v14, v15, v16, v17);
}

void __92__PUIPosterSnapshotController__snapshotRequestDidFinishWithResult_error_request_completion___block_invoke_109(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = [PUIPosterSnapshotResult alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  [*(id *)(a1 + 48) executionTime];
  id v7 = -[PUIPosterSnapshotResult initWithRequest:snapshotBundle:executeTime:](v4, "initWithRequest:snapshotBundle:executeTime:", v5, v6);
  (*(void (**)(uint64_t, uint64_t, PUIPosterSnapshotResult *, void))(v2 + 16))(v2, v3, v7, *(void *)(a1 + 56));
}

void __92__PUIPosterSnapshotController__snapshotRequestDidFinishWithResult_error_request_completion___block_invoke_2_111(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  objc_msgSend(MEMORY[0x263F087E8], "pui_errorWithCode:", 5);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void, id))(v1 + 16))(v1, v2, 0, v3);
}

- (void)invalidate
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(BSAtomicFlag *)self->_invalidationFlag setFlag:1])
  {
    os_unfair_lock_lock(&self->_lock);
    id v3 = [(NSMapTable *)self->_lock_providerToSnapshotterMap objectEnumerator];
    v4 = [v3 allObjects];

    lock_providerToSnapshotterMap = self->_lock_providerToSnapshotterMap;
    self->_lock_providerToSnapshotterMap = 0;

    uint64_t v6 = self->_lock_runtimeAssertion;
    lock_runtimeAssertion = self->_lock_runtimeAssertion;
    self->_lock_runtimeAssertion = 0;

    os_unfair_lock_unlock(&self->_lock);
    [(PFPosterExtensionProvider *)self->_extensionProvider cancel];
    extensionProvider = self->_extensionProvider;
    self->_extensionProvider = 0;
  }
  else
  {
    uint64_t v6 = 0;
    v4 = 0;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "invalidate", (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  if (v6) {
    [(RBSAssertion *)v6 invalidate];
  }
}

- (PUIPosterSnapshotCache)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_completionBlockQueue, 0);
  objc_storeStrong((id *)&self->_lock_snapshotIdentifierToSnapshotRequestMap, 0);
  objc_storeStrong((id *)&self->_lock_providerToSnapshotterMap, 0);
  objc_storeStrong((id *)&self->_lock_runtimeAssertion, 0);
  objc_storeStrong((id *)&self->_extensionProvider, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
}

- (void)initWithCache:(uint64_t)a1 instanceIdentifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_25A0AF000, a2, OS_LOG_TYPE_FAULT, "Unable to setup cache: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithCache:(const char *)a1 instanceIdentifier:.cold.2(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  int v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)executeSnapshotRequest:(const char *)a1 completion:.cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  int v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

- (void)executeSnapshotRequest:(os_log_t)log completion:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_25A0AF000, log, OS_LOG_TYPE_DEBUG, "acquired runtime assertion", v1, 2u);
}

- (void)executeSnapshotRequest:(uint64_t)a1 completion:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25A0AF000, a2, OS_LOG_TYPE_ERROR, "Error acquiring runtime assertion:'%@'", (uint8_t *)&v2, 0xCu);
}

- (void)executeSnapshotRequest:(os_log_t)log completion:.cold.4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_25A0AF000, log, OS_LOG_TYPE_DEBUG, "runtime assertion already acquired", v1, 2u);
}

- (void)_snapshotRequestDidFinishWithResult:(const char *)a1 error:request:completion:.cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  int v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __92__PUIPosterSnapshotController__snapshotRequestDidFinishWithResult_error_request_completion___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_25A0AF000, log, OS_LOG_TYPE_ERROR, "failed caching result for request %{public}@: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end