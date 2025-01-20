@interface XBApplicationSnapshotImageGenerator
- (BOOL)_generate_lock_shouldGenerateForSnapshot:(id)a3 reason:(id *)a4;
- (BOOL)_shouldGenerateForSnapshot:(id)a3 reason:(id *)a4;
- (XBApplicationSnapshotImageGenerator)initWithScheduler:(id)a3 snapshot:(id)a4 dataProvider:(id)a5 imageDataRequest:(int64_t)a6 loggingPrefix:(id)a7 imageGenerationHandler:(id)a8 imageDataGenerationHandler:(id)a9;
- (id)_generate_imageFromLegacyDataProvider:(id)a3 forSnapshot:(id)a4 imageDataHandler:(id)a5;
- (id)_generate_imageFromNewDataProvider:(id)a3 forSnapshot:(id)a4 imageDataHandler:(id)a5;
- (void)_generate;
- (void)_performImageDataGeneration:(id)a3 withHandler:(id)a4;
- (void)generate;
- (void)performAsync:(id)a3;
- (void)scheduleGeneration;
@end

@implementation XBApplicationSnapshotImageGenerator

- (XBApplicationSnapshotImageGenerator)initWithScheduler:(id)a3 snapshot:(id)a4 dataProvider:(id)a5 imageDataRequest:(int64_t)a6 loggingPrefix:(id)a7 imageGenerationHandler:(id)a8 imageDataGenerationHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v34 = [MEMORY[0x263F08690] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"XBApplicationSnapshotImageGenerator.m", 71, @"Invalid parameter not satisfying: %@", @"scheduler" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  v35 = [MEMORY[0x263F08690] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"XBApplicationSnapshotImageGenerator.m", 72, @"Invalid parameter not satisfying: %@", @"snapshot" object file lineNumber description];

LABEL_3:
  v21 = [v16 groupID];

  if (v21)
  {
    if (v17) {
      goto LABEL_5;
    }
  }
  else
  {
    v36 = [MEMORY[0x263F08690] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"XBApplicationSnapshotImageGenerator.m", 73, @"Invalid parameter not satisfying: %@", @"[snapshot groupID]" object file lineNumber description];

    if (v17) {
      goto LABEL_5;
    }
  }
  v37 = [MEMORY[0x263F08690] currentHandler];
  [v37 handleFailureInMethod:a2, self, @"XBApplicationSnapshotImageGenerator.m", 74, @"Invalid parameter not satisfying: %@", @"dataProvider" object file lineNumber description];

LABEL_5:
  v22 = [v17 context];

  if (!v22)
  {
    v38 = [MEMORY[0x263F08690] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"XBApplicationSnapshotImageGenerator.m", 75, @"Invalid parameter not satisfying: %@", @"[dataProvider context]" object file lineNumber description];
  }
  v41.receiver = self;
  v41.super_class = (Class)XBApplicationSnapshotImageGenerator;
  v23 = [(XBApplicationSnapshotImageGenerator *)&v41 init];
  v24 = v23;
  if (v23)
  {
    v23->_generate_handled_request = 0;
    v23->_generate_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v23->_weak_snapshot, v16);
    objc_storeStrong((id *)&v24->_scheduler, a3);
    objc_storeStrong((id *)&v24->_dataProvider, a5);
    if (objc_opt_respondsToSelector())
    {
      v24->_dataProviderFetchType = 0;
    }
    else if (objc_opt_respondsToSelector())
    {
      v24->_dataProviderFetchType = 1;
    }
    else if (objc_opt_respondsToSelector())
    {
      v24->_dataProviderFetchType = 2;
      v25 = XBLogCapture();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[XBApplicationSnapshotImageGenerator initWithScheduler:snapshot:dataProvider:imageDataRequest:loggingPrefix:imageGenerationHandler:imageDataGenerationHandler:]();
      }
    }
    else
    {
      v26 = [MEMORY[0x263F08690] currentHandler];
      [v26 handleFailureInMethod:a2, v24, @"XBApplicationSnapshotImageGenerator.m", 93, @"%@ XBSnapshotDataProvider %@ doesn't implement fetch* method", v24->_loggingPrefix, v17 object file lineNumber description];
    }
    v24->_imageDataRequest = a6;
    uint64_t v27 = [v19 copy];
    id didGenerateImageHandler = v24->_didGenerateImageHandler;
    v24->_id didGenerateImageHandler = (id)v27;

    uint64_t v29 = [v20 copy];
    id didGenerateImageDataHandler = v24->_didGenerateImageDataHandler;
    v24->_id didGenerateImageDataHandler = (id)v29;

    uint64_t v31 = [v18 copy];
    loggingPrefix = v24->_loggingPrefix;
    v24->_loggingPrefix = (NSString *)v31;
  }
  return v24;
}

- (void)performAsync:(id)a3
{
}

- (void)scheduleGeneration
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = _os_activity_create(&dword_2232AB000, "XBCapture", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v3, &state);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_snapshot);
  id v16 = 0;
  BOOL v5 = [(XBApplicationSnapshotImageGenerator *)self _shouldGenerateForSnapshot:WeakRetained reason:&v16];
  id v6 = v16;
  if (v5)
  {
    v7 = XBLogCapture();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      loggingPrefix = self->_loggingPrefix;
      *(_DWORD *)buf = 138543618;
      id v19 = loggingPrefix;
      __int16 v20 = 2114;
      id v21 = v6;
      _os_log_impl(&dword_2232AB000, v7, OS_LOG_TYPE_INFO, "[%{public}@] scheduling asynchronous request to generate image because: %{public}@", buf, 0x16u);
    }

    scheduler = self->_scheduler;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __57__XBApplicationSnapshotImageGenerator_scheduleGeneration__block_invoke_29;
    v13[3] = &unk_2646A5938;
    v13[4] = self;
    [(XBApplicationSnapshotImageGenerationScheduling *)scheduler performImageGenerationAsync:v13];
  }
  else
  {
    v10 = XBLogCapture();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = self->_loggingPrefix;
      *(_DWORD *)buf = 138543618;
      id v19 = v11;
      __int16 v20 = 2114;
      id v21 = v6;
      _os_log_impl(&dword_2232AB000, v10, OS_LOG_TYPE_INFO, "[%{public}@] ignoring asynchronous request to generate image because: %{public}@", buf, 0x16u);
    }

    if (self->_didGenerateImageHandler)
    {
      v12 = self->_scheduler;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __57__XBApplicationSnapshotImageGenerator_scheduleGeneration__block_invoke;
      v15[3] = &unk_2646A5938;
      v15[4] = self;
      [(XBApplicationSnapshotImageGenerationScheduling *)v12 performImageGenerationAsync:v15];
    }
    if (self->_didGenerateImageDataHandler)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __57__XBApplicationSnapshotImageGenerator_scheduleGeneration__block_invoke_2;
      v14[3] = &unk_2646A5938;
      v14[4] = self;
      [(XBApplicationSnapshotImageGenerator *)self _performImageDataGeneration:0 withHandler:v14];
    }
  }

  os_activity_scope_leave(&state);
}

uint64_t __57__XBApplicationSnapshotImageGenerator_scheduleGeneration__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
}

uint64_t __57__XBApplicationSnapshotImageGenerator_scheduleGeneration__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
}

uint64_t __57__XBApplicationSnapshotImageGenerator_scheduleGeneration__block_invoke_29(uint64_t a1)
{
  return [*(id *)(a1 + 32) _generate];
}

- (void)generate
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = _os_activity_create(&dword_2232AB000, "XBCapture", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v3, &state);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_snapshot);
  id v17 = 0;
  BOOL v5 = [(XBApplicationSnapshotImageGenerator *)self _shouldGenerateForSnapshot:WeakRetained reason:&v17];
  id v6 = v17;
  if (v5)
  {
    v7 = XBLogCapture();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      loggingPrefix = self->_loggingPrefix;
      v13 = [WeakRetained logIdentifier];
      *(_DWORD *)buf = 138543874;
      __int16 v20 = loggingPrefix;
      __int16 v21 = 2114;
      id v22 = v13;
      __int16 v23 = 2114;
      id v24 = v6;
      _os_log_error_impl(&dword_2232AB000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] CALLED IMAGE GENERATOR FOR %{public}@. This should be considered a last resort, and will likely result in significant blocking of the calling thread! reason: %{public}@", buf, 0x20u);
    }
    scheduler = self->_scheduler;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __47__XBApplicationSnapshotImageGenerator_generate__block_invoke_30;
    v14[3] = &unk_2646A5938;
    v14[4] = self;
    [(XBApplicationSnapshotImageGenerationScheduling *)scheduler performImageGenerationAsyncAndWait:v14];
  }
  else
  {
    v9 = XBLogCapture();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = self->_loggingPrefix;
      *(_DWORD *)buf = 138543618;
      __int16 v20 = v10;
      __int16 v21 = 2114;
      id v22 = v6;
      _os_log_impl(&dword_2232AB000, v9, OS_LOG_TYPE_INFO, "[%{public}@] ignoring synchronous request to generate image because: %{public}@", buf, 0x16u);
    }

    if (self->_didGenerateImageHandler)
    {
      v11 = self->_scheduler;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __47__XBApplicationSnapshotImageGenerator_generate__block_invoke;
      v16[3] = &unk_2646A5938;
      v16[4] = self;
      [(XBApplicationSnapshotImageGenerationScheduling *)v11 performImageGenerationAsyncAndWait:v16];
    }
    if (self->_didGenerateImageDataHandler)
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __47__XBApplicationSnapshotImageGenerator_generate__block_invoke_2;
      v15[3] = &unk_2646A5938;
      v15[4] = self;
      [(XBApplicationSnapshotImageGenerator *)self _performImageDataGeneration:0 withHandler:v15];
    }
  }

  os_activity_scope_leave(&state);
}

uint64_t __47__XBApplicationSnapshotImageGenerator_generate__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __47__XBApplicationSnapshotImageGenerator_generate__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
}

uint64_t __47__XBApplicationSnapshotImageGenerator_generate__block_invoke_30(uint64_t a1)
{
  return [*(id *)(a1 + 32) _generate];
}

- (void)_performImageDataGeneration:(id)a3 withHandler:(id)a4
{
  int64_t imageDataRequest = self->_imageDataRequest;
  scheduler = self->_scheduler;
  if (imageDataRequest == 2) {
    [(XBApplicationSnapshotImageGenerationScheduling *)scheduler performImageDataGenerationAsync:a3 withHandler:a4];
  }
  else {
    [(XBApplicationSnapshotImageGenerationScheduling *)scheduler performImageDataGenerationAsyncAndWait:a3 withHandler:a4];
  }
}

- (BOOL)_shouldGenerateForSnapshot:(id)a3 reason:(id *)a4
{
  p_generate_lock = &self->_generate_lock;
  id v7 = a3;
  os_unfair_lock_assert_not_owner(p_generate_lock);
  os_unfair_lock_lock(p_generate_lock);
  LOBYTE(a4) = [(XBApplicationSnapshotImageGenerator *)self _generate_lock_shouldGenerateForSnapshot:v7 reason:a4];

  os_unfair_lock_unlock(p_generate_lock);
  return (char)a4;
}

- (BOOL)_generate_lock_shouldGenerateForSnapshot:(id)a3 reason:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (self->_generate_handled_request)
  {
    char v8 = 0;
    if (a4)
    {
      v9 = @"already complete";
      goto LABEL_4;
    }
  }
  else
  {
    if (!v6)
    {
      char v8 = 0;
      if (!a4) {
        goto LABEL_5;
      }
      v9 = @"snapshot is nil";
      goto LABEL_4;
    }
    if ([v6 _isInvalidated])
    {
      char v8 = 0;
      if (!a4) {
        goto LABEL_5;
      }
      v9 = @"snapshot is invalidated";
      goto LABEL_4;
    }
    if (self->_imageDataRequest)
    {
      char v8 = 1;
      if (!a4) {
        goto LABEL_5;
      }
      v9 = @"image data requested";
      goto LABEL_4;
    }
    int v11 = [v7 hasCachedImage];
    char v8 = v11 ^ 1;
    v9 = @"no cached image";
    if (v11) {
      v9 = @"have a cached image and no requests to regenerate";
    }
    if (a4) {
LABEL_4:
    }
      *a4 = v9;
  }
LABEL_5:

  return v8;
}

- (id)_generate_imageFromNewDataProvider:(id)a3 forSnapshot:(id)a4 imageDataHandler:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (objc_opt_respondsToSelector()) {
    uint64_t v12 = [v9 hasProtectedContent];
  }
  else {
    uint64_t v12 = 0;
  }
  [v10 _setHasProtectedContent:v12];
  int64_t v13 = +[XBApplicationSnapshotManifestImpl _outputFormatForSnapshot:v10];
  int64_t dataProviderFetchType = self->_dataProviderFetchType;
  if (dataProviderFetchType)
  {
    if (dataProviderFetchType != 1)
    {
      id v17 = [MEMORY[0x263F08690] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"XBApplicationSnapshotImageGenerator.m", 240, @"%@ somehow we got into this method with the wrong data provider %@", self->_loggingPrefix, v9 object file lineNumber description];

      id v16 = 0;
      if (v11) {
        goto LABEL_9;
      }
      goto LABEL_11;
    }
    uint64_t v15 = [v9 fetchImage];
  }
  else
  {
    uint64_t v15 = [v9 fetchImageForFormat:v13];
  }
  id v16 = (void *)v15;
  if (v11)
  {
LABEL_9:
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__1;
    v38 = __Block_byref_object_dispose__1;
    id v39 = 0;
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    v34[3] = 0;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __103__XBApplicationSnapshotImageGenerator__generate_imageFromNewDataProvider_forSnapshot_imageDataHandler___block_invoke;
    v26[3] = &unk_2646A5C38;
    v30 = v34;
    id v27 = v9;
    v28 = self;
    char v33 = v12;
    id v29 = v16;
    p_long long buf = &buf;
    int64_t v32 = v13;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __103__XBApplicationSnapshotImageGenerator__generate_imageFromNewDataProvider_forSnapshot_imageDataHandler___block_invoke_56;
    v21[3] = &unk_2646A5C60;
    id v23 = v11;
    id v24 = &buf;
    id v22 = v29;
    uint64_t v25 = v34;
    [(XBApplicationSnapshotImageGenerator *)self _performImageDataGeneration:v26 withHandler:v21];

    _Block_object_dispose(v34, 8);
    _Block_object_dispose(&buf, 8);

    goto LABEL_14;
  }
LABEL_11:
  id v18 = XBLogCapture();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    loggingPrefix = self->_loggingPrefix;
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = loggingPrefix;
    _os_log_impl(&dword_2232AB000, v18, OS_LOG_TYPE_INFO, "[%{public}@] we don't have requests for imageData. skipping imageData generation", (uint8_t *)&buf, 0xCu);
  }

LABEL_14:
  return v16;
}

void __103__XBApplicationSnapshotImageGenerator__generate_imageFromNewDataProvider_forSnapshot_imageDataHandler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = XBLogCapture();
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));

  v3 = XBLogCapture();
  v4 = v3;
  os_signpost_id_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    char v8 = (void *)v7;
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 64);
    id v10 = "XBImageDataGenerationRequestNone";
    if (v9 == 1) {
      id v10 = "XBImageDataGenerationRequestSynchronous";
    }
    if (v9 == 2) {
      id v11 = "XBImageDataGenerationRequestAsynchronous";
    }
    else {
      id v11 = v10;
    }
    int v23 = 138543618;
    uint64_t v24 = v7;
    __int16 v25 = 2082;
    v26 = v11;
    _os_signpost_emit_with_name_impl(&dword_2232AB000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "GenerateImageData", "dataProvider=%{public}@ imageDataRequest=%{public}s", (uint8_t *)&v23, 0x16u);
  }
  uint64_t v12 = XBLogCapture();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    __103__XBApplicationSnapshotImageGenerator__generate_imageFromNewDataProvider_forSnapshot_imageDataHandler___block_invoke_cold_4(a1, a1 + 32, v12);
  }

  if (*(void *)(a1 + 48))
  {
    if (*(unsigned char *)(a1 + 80))
    {
      int64_t v13 = XBLogCapture();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 48);
        uint64_t v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        id v16 = (char *)objc_claimAutoreleasedReturnValue();
        int v23 = 138543618;
        uint64_t v24 = v14;
        __int16 v25 = 2114;
        v26 = v16;
        _os_log_impl(&dword_2232AB000, v13, OS_LOG_TYPE_INFO, "[%{public}@] -[%{public}@<XBSnapshotDataProvider> hasProtectedContent] is YES. skipping imageData generation", (uint8_t *)&v23, 0x16u);
      }
    }
    else if (*(void *)(*(void *)(a1 + 40) + 64))
    {
      uint64_t v17 = +[XBApplicationSnapshot dataForImage:withFormat:](XBApplicationSnapshot, "dataForImage:withFormat:");
      uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
      id v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;

      uint64_t v20 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) length];
      __int16 v21 = XBLogCapture();
      int64_t v13 = v21;
      if (v20)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          __103__XBApplicationSnapshotImageGenerator__generate_imageFromNewDataProvider_forSnapshot_imageDataHandler___block_invoke_cold_3();
        }
      }
      else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __103__XBApplicationSnapshotImageGenerator__generate_imageFromNewDataProvider_forSnapshot_imageDataHandler___block_invoke_cold_2();
      }
    }
    else
    {
      int64_t v13 = XBLogCapture();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 48);
        int v23 = 138543362;
        uint64_t v24 = v22;
        _os_log_impl(&dword_2232AB000, v13, OS_LOG_TYPE_INFO, "[%{public}@] was not asked for imageData. skipping imageData generation", (uint8_t *)&v23, 0xCu);
      }
    }
  }
  else
  {
    int64_t v13 = XBLogCapture();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __103__XBApplicationSnapshotImageGenerator__generate_imageFromNewDataProvider_forSnapshot_imageDataHandler___block_invoke_cold_1();
    }
  }
}

void __103__XBApplicationSnapshotImageGenerator__generate_imageFromNewDataProvider_forSnapshot_imageDataHandler___block_invoke_56(void *a1)
{
  uint64_t v2 = a1[5];
  if ([*(id *)(*(void *)(a1[6] + 8) + 40) length]) {
    uint64_t v3 = *(void *)(*(void *)(a1[6] + 8) + 40);
  }
  else {
    uint64_t v3 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, BOOL))(v2 + 16))(v2, v3, a1[4] != 0);
  v4 = XBLogCapture();
  os_signpost_id_t v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(a1[7] + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_2232AB000, v5, OS_SIGNPOST_INTERVAL_END, v6, "GenerateImageData", "", v7, 2u);
  }
}

- (id)_generate_imageFromLegacyDataProvider:(id)a3 forSnapshot:(id)a4 imageDataHandler:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = XBLogCapture();
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, v7);

  id v11 = XBLogCapture();
  uint64_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    int64_t v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v14;
    _os_signpost_emit_with_name_impl(&dword_2232AB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "GenerateImageDataLegacy", "dataProvider=%{public}@", buf, 0xCu);
  }
  long long v15 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)long long buf = *MEMORY[0x263F000D0];
  long long v29 = v15;
  long long v30 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  id v16 = [v7 fetchImageData:buf];
  if ([v16 length])
  {
    id v17 = objc_alloc(MEMORY[0x263F1C6B0]);
    uint64_t v18 = [v7 context];
    [v18 scale];
    id v19 = objc_msgSend(v17, "initWithData:scale:", v16);

    if (v19) {
      goto LABEL_12;
    }
    uint64_t v20 = XBLogCapture();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[XBApplicationSnapshotImageGenerator _generate_imageFromLegacyDataProvider:forSnapshot:imageDataHandler:]();
    }

    __int16 v21 = v16;
    id v16 = 0;
  }
  else
  {
    __int16 v21 = XBLogCapture();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[XBApplicationSnapshotImageGenerator _generate_imageFromLegacyDataProvider:forSnapshot:imageDataHandler:]();
    }
  }

  id v19 = 0;
LABEL_12:
  if (v8)
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __106__XBApplicationSnapshotImageGenerator__generate_imageFromLegacyDataProvider_forSnapshot_imageDataHandler___block_invoke;
    v23[3] = &unk_2646A5C88;
    id v26 = v8;
    v23[4] = self;
    uint64_t v24 = v16;
    id v25 = v19;
    os_signpost_id_t v27 = v10;
    [(XBApplicationSnapshotImageGenerator *)self _performImageDataGeneration:0 withHandler:v23];
  }
  return v19;
}

void __106__XBApplicationSnapshotImageGenerator__generate_imageFromLegacyDataProvider_forSnapshot_imageDataHandler___block_invoke(void *a1)
{
  uint64_t v2 = a1[7];
  if (*(void *)(a1[4] + 64)) {
    uint64_t v3 = a1[5];
  }
  else {
    uint64_t v3 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, BOOL))(v2 + 16))(v2, v3, a1[6] != 0);
  v4 = XBLogCapture();
  os_signpost_id_t v5 = v4;
  os_signpost_id_t v6 = a1[8];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_2232AB000, v5, OS_SIGNPOST_INTERVAL_END, v6, "GenerateImageDataLegacy", "", v7, 2u);
  }
}

- (void)_generate
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  p_generate_lock = &self->_generate_lock;
  os_unfair_lock_assert_not_owner(&self->_generate_lock);
  os_unfair_lock_lock(p_generate_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_snapshot);
  id v37 = 0;
  BOOL v5 = [(XBApplicationSnapshotImageGenerator *)self _generate_lock_shouldGenerateForSnapshot:WeakRetained reason:&v37];
  id v6 = v37;
  if (v5)
  {
    context = (void *)MEMORY[0x223CB2D30]();
    id v7 = self->_dataProvider;
    id v8 = XBLogCapture();
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, WeakRetained);

    os_signpost_id_t v10 = XBLogCapture();
    id v11 = v10;
    unint64_t v12 = v9 - 1;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      int64_t v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      uint64_t v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 138543362;
      id v39 = v14;
      _os_signpost_emit_with_name_impl(&dword_2232AB000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "GenerateImage", "dataProvider=%{public}@", buf, 0xCu);
    }
    os_signpost_id_t spid = v9;

    BSContinuousMachTimeNow();
    uint64_t v16 = v15;
    long long v30 = (void *)os_transaction_create();
    id v17 = [WeakRetained logIdentifier];
    int64_t v18 = +[XBApplicationSnapshotManifestImpl _outputFormatForSnapshot:WeakRetained];
    if (self->_didGenerateImageDataHandler)
    {
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __48__XBApplicationSnapshotImageGenerator__generate__block_invoke_59;
      v32[3] = &unk_2646A5CB0;
      v32[4] = self;
      int64_t v34 = v18;
      id v33 = v17;
      uint64_t v35 = v16;
      id v19 = (void *)MEMORY[0x223CB2F50](v32);
    }
    else
    {
      id v19 = 0;
    }
    if (self->_dataProviderFetchType > 1uLL) {
      [(XBApplicationSnapshotImageGenerator *)self _generate_imageFromLegacyDataProvider:v7 forSnapshot:WeakRetained imageDataHandler:v19];
    }
    else {
    uint64_t v22 = [(XBApplicationSnapshotImageGenerator *)self _generate_imageFromNewDataProvider:v7 forSnapshot:WeakRetained imageDataHandler:v19];
    }
    [WeakRetained _cacheImage:v22];
    if (objc_opt_respondsToSelector())
    {
      int v23 = (void *)MEMORY[0x223CB2D30]();
      [(XBSnapshotDataProvider *)v7 invalidateImage];
    }
    id didGenerateImageHandler = (void (**)(id, BOOL))self->_didGenerateImageHandler;
    if (didGenerateImageHandler) {
      didGenerateImageHandler[2](didGenerateImageHandler, v22 != 0);
    }
    id v25 = XBLogCapture();
    id v26 = v25;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2232AB000, v26, OS_SIGNPOST_INTERVAL_END, spid, "GenerateImage", "", buf, 2u);
    }
  }
  else
  {
    uint64_t v20 = XBLogCapture();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      loggingPrefix = self->_loggingPrefix;
      v28 = [WeakRetained logIdentifier];
      *(_DWORD *)long long buf = 138543874;
      id v39 = loggingPrefix;
      __int16 v40 = 2114;
      id v41 = v6;
      __int16 v42 = 2114;
      v43 = v28;
      _os_log_error_impl(&dword_2232AB000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] we needlessly scheduled _generate even though we have nothing to do because: %{public}@; Snapshot: %{public}@",
        buf,
        0x20u);
    }
    __int16 v21 = (void (**)(id, void))self->_didGenerateImageHandler;
    if (v21) {
      v21[2](v21, 0);
    }
    if (self->_didGenerateImageDataHandler)
    {
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __48__XBApplicationSnapshotImageGenerator__generate__block_invoke;
      v36[3] = &unk_2646A5938;
      v36[4] = self;
      [(XBApplicationSnapshotImageGenerator *)self _performImageDataGeneration:0 withHandler:v36];
    }
  }
  self->_generate_handled_request = 1;
  os_unfair_lock_unlock(p_generate_lock);
}

uint64_t __48__XBApplicationSnapshotImageGenerator__generate__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
}

void __48__XBApplicationSnapshotImageGenerator__generate__block_invoke_59(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 length])
  {
    v4 = XBLogCapture();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 48);
      [v3 length];
      id v6 = NSLocalizedFileSizeDescription();
      id v7 = NSStringFromXBApplicationSnapshotOnDiskFormat(*(void *)(a1 + 48));
      uint64_t v8 = *(void *)(a1 + 40);
      BSContinuousMachTimeNow();
      double v10 = v9 - *(double *)(a1 + 56);
      int v11 = 138544386;
      uint64_t v12 = v5;
      __int16 v13 = 2114;
      uint64_t v14 = v6;
      __int16 v15 = 2114;
      uint64_t v16 = v7;
      __int16 v17 = 2114;
      uint64_t v18 = v8;
      __int16 v19 = 2048;
      double v20 = v10;
      _os_log_impl(&dword_2232AB000, v4, OS_LOG_TYPE_INFO, "[%{public}@] Generated image data (%{public}@ as %{public}@) for %{public}@ after %.3fs", (uint8_t *)&v11, 0x34u);
    }
  }
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingPrefix, 0);
  objc_storeStrong(&self->_didGenerateImageDataHandler, 0);
  objc_storeStrong(&self->_didGenerateImageHandler, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_destroyWeak((id *)&self->_weak_snapshot);
}

- (void)initWithScheduler:snapshot:dataProvider:imageDataRequest:loggingPrefix:imageGenerationHandler:imageDataGenerationHandler:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_2232AB000, v2, v3, "[%{public}@] %{public}@ implementing deprecated fetchImageData:. rude. inconsiderate.", v4, v5, v6, v7, v8);
}

void __103__XBApplicationSnapshotImageGenerator__generate_imageFromNewDataProvider_forSnapshot_imageDataHandler___block_invoke_cold_1()
{
  v0 = (objc_class *)OUTLINED_FUNCTION_2();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_2232AB000, v2, v3, "[%{public}@] -[%{public}@<XBSnapshotDataProvider> fetchImage] returned a nil image. skipping imageData generation", v4, v5, v6, v7, v8);
}

void __103__XBApplicationSnapshotImageGenerator__generate_imageFromNewDataProvider_forSnapshot_imageDataHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_2232AB000, v0, v1, "[%{public}@] +[XBApplicationSnapshot dataForImage:withFormat:] failed to create imageData", v2, v3, v4, v5, v6);
}

void __103__XBApplicationSnapshotImageGenerator__generate_imageFromNewDataProvider_forSnapshot_imageDataHandler___block_invoke_cold_3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_2232AB000, v0, OS_LOG_TYPE_DEBUG, "[%{public}@] completed snapshot dataForImage", v1, 0xCu);
}

void __103__XBApplicationSnapshotImageGenerator__generate_imageFromNewDataProvider_forSnapshot_imageDataHandler___block_invoke_cold_4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = (objc_class *)OUTLINED_FUNCTION_2();
  uint64_t v5 = NSStringFromClass(v4);
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_2232AB000, a3, OS_LOG_TYPE_DEBUG, "[%{public}@] -[%{public}@<XBSnapshotDataProvider> fetchImage] doing imageData generation", v6, 0x16u);
}

- (void)_generate_imageFromLegacyDataProvider:forSnapshot:imageDataHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_2232AB000, v0, v1, "[%{public}@] -[<XBSnapshotDataProvider> fetchImageData:] returned nil imageData. Returning nil image and data", v2, v3, v4, v5, v6);
}

- (void)_generate_imageFromLegacyDataProvider:forSnapshot:imageDataHandler:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_2232AB000, v0, v1, "[%{public}@] -[UIImage initWithData:scale:] returned a nil image, so we're not returning the image or its data", v2, v3, v4, v5, v6);
}

@end