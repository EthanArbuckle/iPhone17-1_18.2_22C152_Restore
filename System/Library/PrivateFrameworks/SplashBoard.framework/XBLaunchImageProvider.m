@interface XBLaunchImageProvider
+ (id)sharedInstance;
- (XBLaunchImageProvider)init;
- (id)createLaunchImageGeneratorWithContext:(id)a3 asyncImageData:(BOOL)a4 error:(id *)a5;
- (void)_addBadLaunchInterfaceToDenyList:(id)a3 forError:(id)a4;
- (void)_generateImageForSnapshot:(id)a3 inManifest:(id)a4 withContext:(id)a5 asyncImageData:(BOOL)a6 dataProvider:(id)a7 scheduleAsyncGeneration:(BOOL)a8 completion:(id)a9;
- (void)_resetBadLaunchInterfaceCount:(id)a3;
- (void)captureLaunchImageForManifest:(id)a3 withCompatibilityInfo:(id)a4 launchRequests:(id)a5 createCaptureInfo:(BOOL)a6 firstImageIsReady:(id)a7 withCompletionHandler:(id)a8;
- (void)dealloc;
- (void)preheatServiceWithTimeout:(double)a3;
@end

@implementation XBLaunchImageProvider

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_sXBLaunchImageProvider;
  return v2;
}

uint64_t __39__XBLaunchImageProvider_sharedInstance__block_invoke()
{
  sharedInstance_sXBLaunchImageProvider = objc_alloc_init(XBLaunchImageProvider);
  return MEMORY[0x270F9A758]();
}

- (XBLaunchImageProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)XBLaunchImageProvider;
  v2 = [(XBLaunchImageProvider *)&v6 init];
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial();
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)Serial;
  }
  return v2;
}

- (void)dealloc
{
  stateCaptureAssertion = self->_stateCaptureAssertion;
  if (stateCaptureAssertion)
  {
    [(BSInvalidatable *)stateCaptureAssertion invalidate];
    v4 = self->_stateCaptureAssertion;
    self->_stateCaptureAssertion = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)XBLaunchImageProvider;
  [(XBLaunchImageProvider *)&v5 dealloc];
}

- (void)preheatServiceWithTimeout:(double)a3
{
}

- (id)createLaunchImageGeneratorWithContext:(id)a3 asyncImageData:(BOOL)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v9 = a3;
  v10 = [v9 launchRequest];
  v11 = [v9 applicationCompatibilityInfo];
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_22:
    v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"XBLaunchImageProvider.m", 73, @"Invalid parameter not satisfying: %@", @"launchRequest" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_23;
  }
  v24 = [MEMORY[0x263F08690] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"XBLaunchImageProvider.m", 72, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

  if (!v10) {
    goto LABEL_22;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_23:
  v26 = [MEMORY[0x263F08690] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"XBLaunchImageProvider.m", 74, @"Invalid parameter not satisfying: %@", @"appInfo" object file lineNumber description];

LABEL_4:
  if ([v11 hasKnownBadLaunchImage])
  {
    v12 = XBLogCapture();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[XBLaunchImageProvider createLaunchImageGeneratorWithContext:asyncImageData:error:](v11, v12);
    }
    v13 = 0;
  }
  else
  {
    BOOL v27 = a4;
    v12 = [MEMORY[0x263EFF910] date];
    v14 = XBLogCapture();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v10;
      _os_log_impl(&dword_2232AB000, v14, OS_LOG_TYPE_DEFAULT, "Synchronously generating image for request: %@", buf, 0xCu);
    }

    v15 = [[XBLaunchImageProviderClient alloc] initWithApplicationInfo:v11];
    id v35 = 0;
    uint64_t v16 = [(XBLaunchImageProviderClient *)v15 generateImageWithContext:v9 captureInfo:0 error:&v35];
    id v17 = v35;
    v18 = v17;
    if (v17)
    {
      if (a5) {
        *a5 = v17;
      }
      [(XBLaunchImageProvider *)self _addBadLaunchInterfaceToDenyList:v11 forError:v18];
      v19 = 0;
    }
    else
    {
      v19 = 0;
      if (v16 && v16 != -1)
      {
        [(XBLaunchImageProvider *)self _resetBadLaunchInterfaceCount:v11];
        v20 = -[XBLaunchImageDataProvider initWithRequest:contextID:opaque:]([XBLaunchImageDataProvider alloc], "initWithRequest:contextID:opaque:", v10, v16, [v11 launchesOpaque]);
        id v21 = [(XBLaunchImageDataProvider *)v20 fetchImage];
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __84__XBLaunchImageProvider_createLaunchImageGeneratorWithContext_asyncImageData_error___block_invoke;
        v28[3] = &unk_2646A6318;
        SEL v33 = a2;
        v28[4] = self;
        id v29 = v11;
        BOOL v34 = v27;
        id v30 = v9;
        v31 = v20;
        v32 = v12;
        v22 = v20;
        v19 = (void *)MEMORY[0x223CB2F50](v28);
      }
    }
    [(BSBaseXPCClient *)v15 invalidate];
    v13 = (void *)[v19 copy];
  }
  return v13;
}

void __84__XBLaunchImageProvider_createLaunchImageGeneratorWithContext_asyncImageData_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!v3)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 32), @"XBLaunchImageProvider.m", 106, @"Invalid parameter not satisfying: %@", @"snapshot" object file lineNumber description];
  }
  v4 = +[XBSnapshotContainerIdentity identityForCompatibilityInfo:*(void *)(a1 + 40)];
  objc_super v5 = [XBApplicationSnapshotManifest alloc];
  objc_super v6 = [v3 _store];
  v7 = [(XBApplicationSnapshotManifest *)v5 initWithContainerIdentity:v4 store:v6];

  [*(id *)(a1 + 32) _generateImageForSnapshot:v3 inManifest:v7 withContext:*(void *)(a1 + 48) asyncImageData:*(unsigned __int8 *)(a1 + 80) dataProvider:*(void *)(a1 + 56) scheduleAsyncGeneration:0 completion:0];
  [v3 _generateImageIfPossible];
  v8 = XBLogCapture();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 64) timeIntervalSinceNow];
    *(_DWORD *)buf = 134217984;
    double v12 = -v9;
    _os_log_impl(&dword_2232AB000, v8, OS_LOG_TYPE_DEFAULT, "Snapshot image generation completed after %.3fs.", buf, 0xCu);
  }
}

- (void)captureLaunchImageForManifest:(id)a3 withCompatibilityInfo:(id)a4 launchRequests:(id)a5 createCaptureInfo:(BOOL)a6 firstImageIsReady:(id)a7 withCompletionHandler:(id)a8
{
  BOOL v50 = a6;
  uint64_t v101 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v43 = a7;
  id v16 = a8;
  v49 = v13;
  if (!v13)
  {
    v39 = [MEMORY[0x263F08690] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"XBLaunchImageProvider.m", 142, @"Invalid parameter not satisfying: %@", @"manifest" object file lineNumber description];
  }
  if (([v14 allowsSavingLaunchImages] & 1) == 0)
  {
    v40 = [MEMORY[0x263F08690] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"XBLaunchImageProvider.m", 143, @"Invalid parameter not satisfying: %@", @"[appInfo allowsSavingLaunchImages]" object file lineNumber description];
  }
  if (![v15 count])
  {
    v41 = [MEMORY[0x263F08690] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"XBLaunchImageProvider.m", 144, @"Invalid parameter not satisfying: %@", @"[launchRequests count] > 0" object file lineNumber description];
  }
  uint64_t v90 = 0;
  v91 = &v90;
  uint64_t v92 = 0x3032000000;
  v93 = __Block_byref_object_copy__3;
  v94 = __Block_byref_object_dispose__3;
  id v95 = 0;
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x3032000000;
  v87 = __Block_byref_object_copy__3;
  v88 = __Block_byref_object_dispose__3;
  id v89 = 0;
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__3;
  v82 = __Block_byref_object_dispose__3;
  id v83 = 0;
  if (v16 && v50)
  {
    uint64_t v17 = [objc_alloc(MEMORY[0x263EFF9B0]) initWithArray:v15];
    v18 = (void *)v91[5];
    v91[5] = v17;

    uint64_t v19 = [(id)v91[5] count];
    uint64_t v20 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v19];
    id v21 = (void *)v85[5];
    v85[5] = v20;

    uint64_t v22 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v19];
    v23 = (void *)v79[5];
    v79[5] = v22;
  }
  v24 = [[XBLaunchImageProviderClient alloc] initWithApplicationInfo:v14];
  if (v43)
  {
    v25 = objc_msgSend(MEMORY[0x263F3F640], "sentinelWithQueue:signalCount:completion:", 0, 1);
  }
  else
  {
    v25 = 0;
  }
  v26 = (void *)MEMORY[0x263F3F640];
  uint64_t v27 = [v15 count] + 1;
  v70[0] = MEMORY[0x263EF8330];
  v70[1] = 3221225472;
  v70[2] = __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke;
  v70[3] = &unk_2646A6340;
  id v48 = v25;
  id v71 = v48;
  BOOL v77 = v50;
  id v42 = v16;
  id v73 = v42;
  v74 = &v90;
  v75 = &v84;
  v76 = &v78;
  v47 = v24;
  v72 = v47;
  uint64_t v28 = [v26 sentinelWithQueue:0 signalCount:v27 completion:v70];
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x2020000000;
  char v69 = 0;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obj = v15;
  uint64_t v29 = [obj countByEnumeratingWithState:&v64 objects:v100 count:16];
  v46 = (void *)v28;
  if (v29)
  {
    uint64_t v30 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v65 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = *(void *)(*((void *)&v64 + 1) + 8 * i);
        SEL v33 = XBLogCapture();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          id v34 = [MEMORY[0x263F3F658] descriptionForObject:v32];
          id v35 = [v14 bundleIdentifier];
          *(_DWORD *)buf = 138412546;
          id v97 = v34;
          __int16 v98 = 2112;
          v99 = v35;
          _os_log_impl(&dword_2232AB000, v33, OS_LOG_TYPE_DEFAULT, "Processing launch request %@ for app: %@.", buf, 0x16u);
        }
        v36 = [[XBApplicationSnapshotGenerationContext alloc] initWithApplicationCompatibilityInfo:v14 launchRequest:v32 timeout:0.0];
        workQueue = self->_workQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke_44;
        block[3] = &unk_2646A6390;
        block[4] = v32;
        v59 = v68;
        id v52 = v14;
        v53 = v47;
        v54 = v36;
        BOOL v63 = v50;
        id v55 = v49;
        v56 = self;
        id v57 = v48;
        v60 = &v90;
        v61 = &v84;
        v62 = &v78;
        id v58 = v46;
        uint64_t v38 = v36;
        dispatch_async(workQueue, block);
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v64 objects:v100 count:16];
    }
    while (v29);
  }

  [v46 signal];
  _Block_object_dispose(v68, 8);

  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v84, 8);

  _Block_object_dispose(&v90, 8);
}

uint64_t __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) signal];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    if (*(unsigned char *)(a1 + 80))
    {
      id v3 = [[XBApplicationCaptureInformation alloc] initWithLaunchRequests:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) captureInfos:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) launchImagePaths:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
      uint64_t v2 = *(void *)(a1 + 48);
    }
    else
    {
      id v3 = 0;
    }
    (*(void (**)(uint64_t, XBApplicationCaptureInformation *))(v2 + 16))(v2, v3);
  }
  v4 = *(void **)(a1 + 40);
  return [v4 invalidate];
}

void __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke_44(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__3;
  BOOL v50 = __Block_byref_object_dispose__3;
  id v51 = 0;
  uint64_t v2 = XBLogCapture();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v53 = v3;
    _os_log_impl(&dword_2232AB000, v2, OS_LOG_TYPE_DEFAULT, "Asynchronously generating image data for request: %@", buf, 0xCu);
  }

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
  {
    v4 = XBLogCapture();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [MEMORY[0x263F3F658] descriptionForObject:*(void *)(a1 + 32)];
      objc_super v6 = [*(id *)(a1 + 40) bundleIdentifier];
      __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke_44_cold_3(v5, v6, buf, v4);
    }
    v7 = 0;
  }
  else
  {
    v8 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    int v10 = *(unsigned __int8 *)(a1 + 128);
    if (*(unsigned char *)(a1 + 128)) {
      v11 = &v45;
    }
    else {
      v11 = 0;
    }
    if (*(unsigned char *)(a1 + 128)) {
      id v45 = 0;
    }
    id v44 = 0;
    uint64_t v12 = [v8 generateImageWithContext:v9 captureInfo:v11 error:&v44];
    if (v10) {
      v7 = (XBLaunchCaptureInformation *)v45;
    }
    else {
      v7 = 0;
    }
    v4 = v44;
    if (v4)
    {
      id v13 = XBLogCapture();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = [MEMORY[0x263F3F658] descriptionForObject:*(void *)(a1 + 32)];
        __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke_44_cold_2(v14, (uint64_t)buf, v13);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
      [*(id *)(a1 + 72) _addBadLaunchInterfaceToDenyList:*(void *)(a1 + 40) forError:v4];
    }
    else
    {
      if (!v12 || v12 == -1)
      {
        id v15 = XBLogCapture();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v30 = [MEMORY[0x263F3F658] descriptionForObject:*(void *)(a1 + 32)];
          __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke_44_cold_1(v30, (uint64_t)buf, v15);
        }
      }
      else
      {
        id v15 = [*(id *)(a1 + 56) launchRequest];
        id v16 = -[XBLaunchImageDataProvider initWithRequest:contextID:opaque:]([XBLaunchImageDataProvider alloc], "initWithRequest:contextID:opaque:", v15, v12, [*(id *)(a1 + 40) launchesOpaque]);
        dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
        v18 = *(void **)(a1 + 64);
        uint64_t v19 = [v15 groupID];
        uint64_t v20 = [v18 createSnapshotWithGroupID:v19];
        id v21 = (void *)v47[5];
        v47[5] = v20;

        uint64_t v22 = *(void *)(a1 + 64);
        uint64_t v23 = v47[5];
        uint64_t v24 = *(void *)(a1 + 56);
        v36 = *(void **)(a1 + 72);
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke_45;
        v37[3] = &unk_2646A6368;
        id v43 = &v46;
        id v25 = *(id *)(a1 + 80);
        uint64_t v26 = *(void *)(a1 + 72);
        id v38 = v25;
        uint64_t v39 = v26;
        id v27 = *(id *)(a1 + 40);
        uint64_t v28 = *(void *)(a1 + 32);
        id v40 = v27;
        uint64_t v41 = v28;
        uint64_t v29 = v17;
        id v42 = v29;
        [v36 _generateImageForSnapshot:v23 inManifest:v22 withContext:v24 asyncImageData:0 dataProvider:v16 scheduleAsyncGeneration:1 completion:v37];
        dispatch_semaphore_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
      }
    }
  }

  if (*(unsigned char *)(a1 + 128))
  {
    uint64_t v31 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) indexOfObject:*(void *)(a1 + 32)];
    if (v31 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v32 = v7;
      if (!v7) {
        uint64_t v32 = objc_alloc_init(XBLaunchCaptureInformation);
      }
      [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setObject:v32 atIndexedSubscript:v31];
      if (!v7) {

      }
      uint64_t v33 = [(id)v47[5] path];
      id v34 = (void *)v33;
      if (v33) {
        id v35 = (__CFString *)v33;
      }
      else {
        id v35 = &stru_26D65DBC8;
      }
      [*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) setObject:v35 atIndexedSubscript:v31];
    }
  }
  [*(id *)(a1 + 88) signal];
  _Block_object_dispose(&v46, 8);
}

intptr_t __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke_45(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) _cacheImage:0];
  [*(id *)(a1 + 32) signal];
  if (a2)
  {
    [*(id *)(a1 + 40) _resetBadLaunchInterfaceCount:*(void *)(a1 + 48)];
    v4 = XBLogCapture();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 56);
      int v8 = 138543362;
      uint64_t v9 = v5;
      _os_log_impl(&dword_2232AB000, v4, OS_LOG_TYPE_DEFAULT, "Image generation complete for: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    v4 = XBLogCapture();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke_45_cold_1(a1, v4, v6);
    }
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

- (void)_generateImageForSnapshot:(id)a3 inManifest:(id)a4 withContext:(id)a5 asyncImageData:(BOOL)a6 dataProvider:(id)a7 scheduleAsyncGeneration:(BOOL)a8 completion:(id)a9
{
  BOOL v33 = a6;
  BOOL v34 = a8;
  id v35 = a4;
  id v14 = a9;
  id v15 = a7;
  id v16 = a5;
  id v17 = a3;
  v18 = [v16 launchRequest];
  uint64_t v19 = [v16 applicationCompatibilityInfo];

  uint64_t v20 = [v18 groupID];
  if (v35)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v28 = [MEMORY[0x263F08690] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"XBLaunchImageProvider.m", 259, @"Invalid parameter not satisfying: %@", @"manifest" object file lineNumber description];

    if (v16)
    {
LABEL_3:
      if (v19) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  uint64_t v29 = [MEMORY[0x263F08690] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"XBLaunchImageProvider.m", 260, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

  if (v19)
  {
LABEL_4:
    if (v15) {
      goto LABEL_5;
    }
LABEL_19:
    uint64_t v31 = [MEMORY[0x263F08690] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"XBLaunchImageProvider.m", 262, @"Invalid parameter not satisfying: %@", @"dataProvider" object file lineNumber description];

    if (v20) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_18:
  uint64_t v30 = [MEMORY[0x263F08690] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"XBLaunchImageProvider.m", 261, @"Invalid parameter not satisfying: %@", @"appInfo" object file lineNumber description];

  if (!v15) {
    goto LABEL_19;
  }
LABEL_5:
  if (v20) {
    goto LABEL_6;
  }
LABEL_20:
  uint64_t v32 = [MEMORY[0x263F08690] currentHandler];
  [v32 handleFailureInMethod:a2, self, @"XBLaunchImageProvider.m", 263, @"Invalid parameter not satisfying: %@", @"snapshotGroupID" object file lineNumber description];

LABEL_6:
  id v21 = +[XBApplicationSnapshotManifestImpl _snapshotPredicateForRequest:v18];
  uint64_t v22 = [v35 snapshotsForGroupID:v20 matchingPredicate:v21];

  uint64_t v23 = [v22 indexesOfObjectsPassingTest:&__block_literal_global_60];
  uint64_t v24 = [v22 objectsAtIndexes:v23];

  if ([v24 count]) {
    [v35 deleteSnapshots:v24];
  }
  +[XBApplicationSnapshotManifestImpl _configureSnapshot:v17 withCompatibilityInfo:v19 forLaunchRequest:v18];
  unsigned int v25 = [v19 allowsSavingLaunchImages];
  uint64_t v26 = v25;
  if (v33) {
    uint64_t v26 = v25 | 2;
  }
  if (v34) {
    uint64_t v27 = v26;
  }
  else {
    uint64_t v27 = v26 | 4;
  }
  [v35 generateImageForSnapshot:v17 dataProvider:v15 options:v27 imageGeneratedHandler:v14 imageDataSavedHandler:0];
}

BOOL __137__XBLaunchImageProvider__generateImageForSnapshot_inManifest_withContext_asyncImageData_dataProvider_scheduleAsyncGeneration_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 generationContext];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)_addBadLaunchInterfaceToDenyList:(id)a3 forError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 code];
  uint64_t v10 = [v7 bundleIdentifier];
  v11 = XBLogCapture();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[XBLaunchImageProvider _addBadLaunchInterfaceToDenyList:forError:].cold.4(v8, (uint64_t)v10, v11);
  }

  if (v9 != 10 && ([v7 hasKnownBadLaunchImage] & 1) == 0)
  {
    if ((v9 & 0xFFFFFFFFFFFFFFFELL) != 8) {
      goto LABEL_12;
    }
    unint64_t v12 = [v7 badLaunchImageCandidateCount];
    if ((v12 & 0x8000000000000000) != 0)
    {
      v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"strikeCount >= 1"];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[XBLaunchImageProvider _addBadLaunchInterfaceToDenyList:forError:](a2, (uint64_t)self, (uint64_t)v18);
      }
    }
    else
    {
      if (v12 < 4)
      {
        unint64_t v13 = v12 + 1;
        if ((uint64_t)(v12 + 1) >= 3) {
          uint64_t v14 = 3;
        }
        else {
          uint64_t v14 = v12 + 1;
        }
        [v7 setBadLaunchImageCandidateCount:v14];
        if (v13 != 3)
        {
LABEL_13:
          if ([v7 hasKnownBadLaunchImage])
          {
            id v15 = XBLogCapture();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              -[XBLaunchImageProvider _addBadLaunchInterfaceToDenyList:forError:]((uint64_t)v10, v15, v16);
            }

            id v17 = +[XBApplicationDataStore sharedInstance];
            [v17 _persistCompatibilityInfo:v7 forBundleIdentifier:v10];
          }
          goto LABEL_17;
        }
LABEL_12:
        [v7 setHasKnownBadLaunchImage:1];
        goto LABEL_13;
      }
      v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"strikeCount <= NumberOfStrikesBeforeMarkingBad + 1"];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[XBLaunchImageProvider _addBadLaunchInterfaceToDenyList:forError:](a2, (uint64_t)self, (uint64_t)v18);
      }
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2232CE86CLL);
  }
LABEL_17:
}

- (void)_resetBadLaunchInterfaceCount:(id)a3
{
  id v5 = a3;
  if ([v5 badLaunchImageCandidateCount])
  {
    [v5 setBadLaunchImageCandidateCount:0];
    BOOL v3 = [v5 bundleIdentifier];
    v4 = +[XBApplicationDataStore sharedInstance];
    [v4 _persistCompatibilityInfo:v5 forBundleIdentifier:v3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)createLaunchImageGeneratorWithContext:(void *)a1 asyncImageData:(NSObject *)a2 error:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 bundleIdentifier];
  int v5 = 138543362;
  uint64_t v6 = v3;
  OUTLINED_FUNCTION_1_2(&dword_2232AB000, a2, v4, "Snapshot generation request for bundleID: %{public}@ rejected due to the app being denylisted.", (uint8_t *)&v5);
}

void __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke_44_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_2(&dword_2232AB000, a3, (uint64_t)a3, "Unable to generate context for %@, so skipping it and moving on.", (uint8_t *)a2);
}

void __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke_44_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_2(&dword_2232AB000, a3, (uint64_t)a3, "Error generating image for launch request %@ .", (uint8_t *)a2);
}

void __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke_44_cold_3(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_2232AB000, log, OS_LOG_TYPE_ERROR, "Skipping launch request %@ due to denied app: %@.", buf, 0x16u);
}

void __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke_45_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = 138543362;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_1_2(&dword_2232AB000, a2, a3, "Image generation failed for: %{public}@", (uint8_t *)&v4);
}

- (void)_addBadLaunchInterfaceToDenyList:(uint64_t)a3 forError:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v4 = NSStringFromSelector(a1);
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = @"XBLaunchImageProvider.m";
  __int16 v10 = 1024;
  int v11 = 312;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_2232AB000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)_addBadLaunchInterfaceToDenyList:(uint64_t)a3 forError:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v4 = NSStringFromSelector(a1);
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = @"XBLaunchImageProvider.m";
  __int16 v10 = 1024;
  int v11 = 313;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_2232AB000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)_addBadLaunchInterfaceToDenyList:(uint64_t)a3 forError:.cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_1_2(&dword_2232AB000, a2, a3, "Noting that the application %@ has a bad launch image until it is updated.", (uint8_t *)&v3);
}

- (void)_addBadLaunchInterfaceToDenyList:(NSObject *)a3 forError:.cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = 134218242;
  uint64_t v6 = [a1 code];
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_2232AB000, a3, OS_LOG_TYPE_ERROR, "Snapshot generation resulted in an error with code: %ld for app bundleID: %@", (uint8_t *)&v5, 0x16u);
}

@end