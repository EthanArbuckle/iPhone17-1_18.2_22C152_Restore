@interface PLAutoBindingProxyFactory
+ (id)clientToServiceSandboxExtensionForURL:(id)a3;
+ (unint64_t)maxBindAttemptCount;
- (BOOL)_bindToPhotoLibraryIfNecessaryWithErrorHandler:(id)a3;
- (BOOL)_isResultAnInterruptionError:(id)a3;
- (NSURL)photoLibraryURL;
- (PLAutoBindingProxyFactory)initWithProxyFactory:(id)a3 photoLibraryURL:(id)a4;
- (PLXPCProxyCreating)proxyFactory;
- (id)_attemptBindToPhotoLibrary;
- (id)_bindToPhotoLibrary;
- (id)_bindToPhotoLibraryAndCacheResult;
- (id)_bindToPhotoLibraryIfNecessary;
- (id)_blackholeProxyForProxy:(id)a3;
- (id)_cachedBindResult;
- (id)_lazilyBindToPhotoLibrary;
- (id)_unboostingRemoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)_connectionInterrupted:(id)a3;
- (void)_updateCachedBindResult:(id)a3;
- (void)addBarrierBlock:(id)a3;
@end

@implementation PLAutoBindingProxyFactory

id __46__PLAutoBindingProxyFactory__cachedBindResult__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

id __66__PLAutoBindingProxyFactory_initWithProxyFactory_photoLibraryURL___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained _bindToPhotoLibrary];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __54__PLAutoBindingProxyFactory__lazilyBindToPhotoLibrary__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

- (id)_bindToPhotoLibraryAndCacheResult
{
  v3 = [(PLAutoBindingProxyFactory *)self _lazilyBindToPhotoLibrary];
  [(PLAutoBindingProxyFactory *)self _updateCachedBindResult:v3];
  return v3;
}

- (void)_updateCachedBindResult:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__PLAutoBindingProxyFactory__updateCachedBindResult___block_invoke;
  v7[3] = &unk_1E58A1EF8;
  p_bindLock = &self->_bindLock;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  PLRunWithUnfairLock(p_bindLock, v7);
}

- (id)_lazilyBindToPhotoLibrary
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__PLAutoBindingProxyFactory__lazilyBindToPhotoLibrary__block_invoke;
  v5[3] = &unk_1E58A1A60;
  v5[4] = self;
  v2 = PLResultWithUnfairLock(&self->_bindLock, v5);
  v3 = [v2 objectValue];

  return v3;
}

- (id)_bindToPhotoLibrary
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(id)objc_opt_class() maxBindAttemptCount];
  id v4 = 0;
  uint64_t v5 = -1;
  do
  {
    id v6 = v4;
    id v4 = [(PLAutoBindingProxyFactory *)self _attemptBindToPhotoLibrary];

    BOOL v7 = [(PLAutoBindingProxyFactory *)self _isResultAnInterruptionError:v4];
    unint64_t v8 = v5 + 2;
    ++v5;
  }
  while (v7 && v8 < v3);
  if (v5)
  {
    v9 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      unint64_t v13 = v8;
      _os_log_impl(&dword_19BCFB000, v9, OS_LOG_TYPE_DEFAULT, "Repeated bind for %lu attempts", (uint8_t *)&v12, 0xCu);
    }
  }
  if (v7)
  {
    v10 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 134217984;
      unint64_t v13 = v8;
      _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_ERROR, "Failed bind after %lu attempts", (uint8_t *)&v12, 0xCu);
    }
  }
  return v4;
}

- (BOOL)_isResultAnInterruptionError:(id)a3
{
  id v3 = a3;
  if ([v3 isFailure])
  {
    id v4 = [v3 error];
    char v5 = PLIsErrorEqualToCode(v4, (void *)*MEMORY[0x1E4F281F8], 4097);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

void __53__PLAutoBindingProxyFactory__updateCachedBindResult___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isFailure])
  {
    v2 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(v3 + 40);
      uint64_t v6 = *(void *)(v3 + 24);
      *(_DWORD *)buf = 138412802;
      uint64_t v19 = v5;
      __int16 v20 = 2112;
      uint64_t v21 = v4;
      __int16 v22 = 2112;
      uint64_t v23 = v6;
      _os_log_impl(&dword_19BCFB000, v2, OS_LOG_TYPE_ERROR, "Got a bind failure for URL %@, resetting bind state: %@ (previous result: %@)", buf, 0x20u);
    }

    uint64_t v7 = *(void *)(a1 + 40);
    unint64_t v8 = *(void **)(v7 + 24);
    *(void *)(v7 + 24) = 0;

    v9 = *(void **)(a1 + 40);
    id v10 = objc_initWeak((id *)buf, v9);

    v11 = [PLLazyObject alloc];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __53__PLAutoBindingProxyFactory__updateCachedBindResult___block_invoke_7;
    v16[3] = &unk_1E58A19E8;
    objc_copyWeak(&v17, (id *)buf);
    uint64_t v12 = [(PLLazyObject *)v11 initWithBlock:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(NSObject **)(v13 + 16);
    *(void *)(v13 + 16) = v12;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 24), *(id *)(a1 + 32));
    uint64_t v14 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 24);
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v15;
      _os_log_impl(&dword_19BCFB000, v14, OS_LOG_TYPE_DEBUG, "Setting bind result to: %@", buf, 0xCu);
    }
  }
}

+ (unint64_t)maxBindAttemptCount
{
  if (!PFOSVariantHasInternalDiagnostics()) {
    return 50;
  }
  if (PFProcessIsLaunchedToExecuteTests()) {
    return 2;
  }
  if (PLMobileSlideShowPhotoLibraryTestingMode_onceToken != -1) {
    dispatch_once(&PLMobileSlideShowPhotoLibraryTestingMode_onceToken, &__block_literal_global_3810);
  }
  if (PLMobileSlideShowPhotoLibraryTestingMode_sMobileSlideShowPhotoLibraryTestingMode) {
    return 2;
  }
  else {
    return -1;
  }
}

- (id)_attemptBindToPhotoLibrary
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  *(_OWORD *)sel = 0u;
  long long v24 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v24) = v4;
  if (v4)
  {
    uint64_t v5 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: _attemptBindToPhotoLibrary", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v6 = (void *)*((void *)&v24 + 1);
    *((void *)&v24 + 1) = v5;

    os_activity_scope_enter(v5, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  uint64_t v7 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  *(void *)&long long v25 = v8;
  v9 = v7;
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__11538;
  v30 = __Block_byref_object_dispose__11539;
  id v31 = 0;
  proxyFactory = self->_proxyFactory;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __55__PLAutoBindingProxyFactory__attemptBindToPhotoLibrary__block_invoke;
  v23[3] = &unk_1E58A1A88;
  v23[4] = self;
  v23[5] = &buf;
  uint64_t v13 = [(PLXPCProxyCreating *)proxyFactory synchronousRemoteObjectProxyWithErrorHandler:v23];
  photoLibraryURL = self->_photoLibraryURL;
  uint64_t v15 = [(id)objc_opt_class() clientToServiceSandboxExtensionForURL:photoLibraryURL];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __55__PLAutoBindingProxyFactory__attemptBindToPhotoLibrary__block_invoke_11;
  v22[3] = &unk_1E58A1A88;
  v22[4] = self;
  v22[5] = &buf;
  [v13 bindToPhotoLibraryURL:photoLibraryURL sandboxExtension:v15 clientOptions:0 withReply:v22];

  id v16 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v24) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  }
  if ((void)v25)
  {
    id v17 = PLRequestGetLog();
    v18 = v17;
    os_signpost_id_t v19 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      __int16 v20 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v20;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v16;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PLAutoBindingProxyFactory *)self _bindToPhotoLibraryIfNecessaryWithErrorHandler:v4];
  uint64_t v6 = [(PLXPCProxyCreating *)self->_proxyFactory synchronousRemoteObjectProxyWithErrorHandler:v4];

  if (!v5)
  {
    uint64_t v7 = [(PLAutoBindingProxyFactory *)self _blackholeProxyForProxy:v6];

    uint64_t v6 = (void *)v7;
  }
  return v6;
}

- (BOOL)_bindToPhotoLibraryIfNecessaryWithErrorHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  BOOL v5 = [(PLAutoBindingProxyFactory *)self _bindToPhotoLibraryIfNecessary];
  char v6 = [v5 isSuccess];
  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [v5 error];
    v4[2](v4, v7);
  }
  return v6;
}

- (id)_bindToPhotoLibraryIfNecessary
{
  uint64_t v3 = [(PLAutoBindingProxyFactory *)self _cachedBindResult];
  if (!v3)
  {
    uint64_t v3 = [(PLAutoBindingProxyFactory *)self _bindToPhotoLibraryAndCacheResult];
  }
  return v3;
}

- (id)_cachedBindResult
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__PLAutoBindingProxyFactory__cachedBindResult__block_invoke;
  v4[3] = &unk_1E58A1A38;
  v4[4] = self;
  v2 = PLResultWithUnfairLock(&self->_bindLock, v4);
  return v2;
}

+ (id)clientToServiceSandboxExtensionForURL:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 path];
  char v6 = PLGetSandboxExtensionTokenWithFlags(v5, *MEMORY[0x1E4F14008], *MEMORY[0x1E4F14130], 0);
  uint64_t v7 = PLSandboxExtensionTokenAsData(v6);

  os_signpost_id_t v8 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    id v10 = [v4 path];
    uint64_t v11 = +[PLFileUtilities redactedDescriptionForPath:v10];
    uint64_t v12 = (void *)v11;
    uint64_t v13 = @"YES";
    int v15 = 138544130;
    __int16 v17 = 2112;
    id v16 = v9;
    if (!v7) {
      uint64_t v13 = @"NO";
    }
    id v18 = v4;
    __int16 v19 = 2114;
    uint64_t v20 = v11;
    __int16 v21 = 2114;
    __int16 v22 = v13;
    _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %@ (%{public}@) hasExtension:%{public}@", (uint8_t *)&v15, 0x2Au);
  }
  return v7;
}

- (PLAutoBindingProxyFactory)initWithProxyFactory:(id)a3 photoLibraryURL:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PLAutoBindingProxyFactory;
  v9 = [(PLAutoBindingProxyFactory *)&v22 init];
  if (v9)
  {
    if (!v7)
    {
      id v10 = PLGatekeeperXPCGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        photoLibraryURL = v9->_photoLibraryURL;
        *(_DWORD *)long long buf = 138412290;
        long long v24 = photoLibraryURL;
        _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_ERROR, "Creating an autobinding proxy factory from a nil proxy factor for library URL: %@", buf, 0xCu);
      }
    }
    objc_storeStrong((id *)&v9->_proxyFactory, a3);
    uint64_t v12 = [v8 copy];
    uint64_t v13 = v9->_photoLibraryURL;
    v9->_photoLibraryURL = (NSURL *)v12;

    v9->_bindLock._os_unfair_lock_opaque = 0;
    id v14 = objc_initWeak((id *)buf, v9);

    int v15 = [PLLazyObject alloc];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __66__PLAutoBindingProxyFactory_initWithProxyFactory_photoLibraryURL___block_invoke;
    v20[3] = &unk_1E58A19E8;
    objc_copyWeak(&v21, (id *)buf);
    uint64_t v16 = [(PLLazyObject *)v15 initWithBlock:v20];
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
    lazyBindToPhotoLibrary = v9->_lazyBindToPhotoLibrary;
    v9->_lazyBindToPhotoLibrary = (PLLazyObject *)v16;

    id v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v9 selector:sel__connectionInterrupted_ name:@"PLAssetsdClientXPCConnectionInterruptedInternalNotificationName" object:v9->_proxyFactory];
  }
  return v9;
}

void __55__PLAutoBindingProxyFactory__attemptBindToPhotoLibrary__block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 40);
      int v13 = 138412546;
      uint64_t v14 = v5;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Failed to open photo library %@, %@", (uint8_t *)&v13, 0x16u);
    }

    uint64_t v6 = +[PLResult failureWithError:v3];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v10 = +[PLResult successWithResult:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibraryURL, 0);
  objc_storeStrong((id *)&self->_proxyFactory, 0);
  objc_storeStrong((id *)&self->_cachedBindResult, 0);
  objc_storeStrong((id *)&self->_lazyBindToPhotoLibrary, 0);
}

- (NSURL)photoLibraryURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (PLXPCProxyCreating)proxyFactory
{
  return (PLXPCProxyCreating *)objc_getProperty(self, a2, 32, 1);
}

- (void)_connectionInterrupted:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__PLAutoBindingProxyFactory__connectionInterrupted___block_invoke;
  v3[3] = &unk_1E58A1EC0;
  v3[4] = self;
  PLSafeRunWithUnfairLock(&self->_bindLock, v3);
}

void __52__PLAutoBindingProxyFactory__connectionInterrupted___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 40);
    uint64_t v5 = *(void *)(v3 + 24);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v17 = v4;
    __int16 v18 = 2112;
    uint64_t v19 = v5;
    _os_log_impl(&dword_19BCFB000, v2, OS_LOG_TYPE_DEFAULT, "Client connection interrupted for URL %@, resetting bind state (previous result: %@)", buf, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = 0;

  id v8 = *(void **)(a1 + 32);
  id v9 = objc_initWeak((id *)buf, v8);

  uint64_t v10 = [PLLazyObject alloc];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__PLAutoBindingProxyFactory__connectionInterrupted___block_invoke_13;
  v14[3] = &unk_1E58A19E8;
  objc_copyWeak(&v15, (id *)buf);
  uint64_t v11 = [(PLLazyObject *)v10 initWithBlock:v14];
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
  uint64_t v12 = *(void *)(a1 + 32);
  int v13 = *(void **)(v12 + 16);
  *(void *)(v12 + 16) = v11;
}

id __52__PLAutoBindingProxyFactory__connectionInterrupted___block_invoke_13(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained _bindToPhotoLibrary];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __55__PLAutoBindingProxyFactory__attemptBindToPhotoLibrary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 40);
    int v9 = 136315650;
    uint64_t v10 = "-[PLAutoBindingProxyFactory _attemptBindToPhotoLibrary]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy to open photo library with URL %s: %@ %@", (uint8_t *)&v9, 0x20u);
  }

  uint64_t v6 = +[PLResult failureWithError:v3];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

id __53__PLAutoBindingProxyFactory__updateCachedBindResult___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained _bindToPhotoLibrary];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)addBarrierBlock:(id)a3
{
}

- (id)_unboostingRemoteObjectProxy
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__PLAutoBindingProxyFactory__unboostingRemoteObjectProxy__block_invoke;
  v5[3] = &unk_1E58A1A10;
  v5[4] = self;
  if ([(PLAutoBindingProxyFactory *)self _bindToPhotoLibraryIfNecessaryWithErrorHandler:v5])
  {
    id v3 = [(PLXPCProxyCreating *)self->_proxyFactory _unboostingRemoteObjectProxy];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

void __57__PLAutoBindingProxyFactory__unboostingRemoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 40);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Unable to bind to photo library URL %@: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (id)_blackholeProxyForProxy:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (PLXPCProxyCreating *)a3;
  uint64_t v5 = PLGatekeeperXPCGetLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      proxyFactory = self->_proxyFactory;
      photoLibraryURL = self->_photoLibraryURL;
      int v13 = 138412802;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = proxyFactory;
      __int16 v17 = 2112;
      __int16 v18 = photoLibraryURL;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_DEFAULT, "Creating blackhole proxy for %@ from proxy factory %@ for library URL: %@", (uint8_t *)&v13, 0x20u);
    }

    id v9 = [[PLAutoBindingBlackholeProxy alloc] initWithTargetObject:v4];
  }
  else
  {
    if (v6)
    {
      uint64_t v10 = self->_proxyFactory;
      __int16 v11 = self->_photoLibraryURL;
      int v13 = 138412546;
      id v14 = v10;
      __int16 v15 = 2112;
      id v16 = v11;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_DEFAULT, "Got a nil proxy from proxy factory %@ for library URL: %@", (uint8_t *)&v13, 0x16u);
    }

    id v9 = 0;
  }

  return v9;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PLAutoBindingProxyFactory *)self _bindToPhotoLibraryIfNecessaryWithErrorHandler:v4];
  BOOL v6 = [(PLXPCProxyCreating *)self->_proxyFactory remoteObjectProxyWithErrorHandler:v4];

  if (!v5)
  {
    uint64_t v7 = [(PLAutoBindingProxyFactory *)self _blackholeProxyForProxy:v6];

    BOOL v6 = (void *)v7;
  }
  return v6;
}

@end