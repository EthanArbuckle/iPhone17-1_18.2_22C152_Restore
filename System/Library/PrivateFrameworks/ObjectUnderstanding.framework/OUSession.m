@interface OUSession
- (OUSessionDelegate)delegate;
- (id)init:(BOOL)a3;
- (void)generateOfflineObjectAsset:(id)a3 onlineObjects:(id)a4 block:(id)a5;
- (void)generateOfflineObjects:(id)a3 onlineObjects:(id)a4;
- (void)generateOfflineObjects:(id)a3 onlineObjects:(id)a4 block:(id)a5;
- (void)runWithConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)stop;
- (void)updateWithFrame:(id)a3;
- (void)updateWithKeyframes:(__n128)a3 currentCameraPose:(__n128)a4;
- (void)updateWithKeyframes:(id)a3 ouframe:(id)a4;
@end

@implementation OUSession

- (id)init:(BOOL)a3
{
  BOOL v3 = a3;
  v25.receiver = self;
  v25.super_class = (Class)OUSession;
  v4 = [(OUSession *)&v25 init];
  v5 = v4;
  if (v4)
  {
    v4->isOnline_ = v3;
    if (v3)
    {
      v6 = objc_alloc_init(OUPipelineOnline);
      ouPipeline = v5->ouPipeline_;
      v5->ouPipeline_ = v6;
    }
    else
    {
      v8 = [[OU3DObjectDetector alloc] init:0];
      ouPipeline = v5->det3d_;
      v5->det3d_ = v8;
    }

    dispatch_semaphore_t v9 = dispatch_semaphore_create(1);
    detSemaphore = v5->detSemaphore_;
    v5->detSemaphore_ = (OS_dispatch_semaphore *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    allKeyframes = v5->allKeyframes_;
    v5->allKeyframes_ = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    skipedKeyframes = v5->skipedKeyframes_;
    v5->skipedKeyframes_ = (NSMutableDictionary *)v13;

    uint64_t v15 = CreateWorkGroup("OU_OnlineOD3d_TG");
    workgroupOD = v5->_workgroupOD;
    v5->_workgroupOD = (OS_os_workgroup *)v15;

    uint64_t v17 = CreateFixedPrioritySerialDispatchQueue((_anonymous_namespace_ *)"com.apple.ObjectUnderstanding.onlineOD3d", (const char *)0x11, 0, 1, &v5->_workgroupOD);
    detQueue = v5->detQueue_;
    v5->detQueue_ = (OS_dispatch_queue *)v17;

    uint64_t v19 = CreateWorkGroup("OU_UpdateFrame_TG");
    workgroupFrame = v5->_workgroupFrame;
    v5->_workgroupFrame = (OS_os_workgroup *)v19;

    uint64_t v21 = CreateFixedPrioritySerialDispatchQueue((_anonymous_namespace_ *)"com.apple.ObjectUnderstanding.updateFrame", (const char *)0x11, 0, 1, &v5->_workgroupFrame);
    ouframeQueue = v5->ouframeQueue_;
    v5->ouframeQueue_ = (OS_dispatch_queue *)v21;
  }
  v23 = v5;

  return v23;
}

- (void)runWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = (OUConfiguration *)[v4 copy];
  configuration = self->configuration_;
  self->configuration_ = v5;

  if (self->isOnline_)
  {
    [(OUPipelineOnline *)self->ouPipeline_ clear];
    v7 = objc_alloc_init(OUPipelineOnlineConfig);
    -[OUPipelineOnlineConfig setEnableRgbRefinement:](v7, "setEnableRgbRefinement:", [v4 enableRgbRefinement]);
    -[OUPipelineOnlineConfig setEnable3DOROnline:](v7, "setEnable3DOROnline:", [v4 enable3DOR]);
    v8 = [[OUPipelineOnline alloc] initWithConfig:v7];
    ouPipeline = self->ouPipeline_;
    self->ouPipeline_ = v8;
  }
  else
  {
    [(OU3DObjectDetector *)self->det3d_ clear];
    -[OU3DObjectDetector setRgbRefinementEnabled:](self->det3d_, "setRgbRefinementEnabled:", [v4 enableRgbRefinement]);
    -[OU3DObjectDetector setObjectRepresentationEnabled:](self->det3d_, "setObjectRepresentationEnabled:", [v4 enable3DOR]);
  }
  [(OUConfiguration *)self->configuration_ maxFramerate];
  self->_minFrameInterval = 1.0 / v10;
  uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
  allKeyframes = self->allKeyframes_;
  self->allKeyframes_ = v11;

  uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
  skipedKeyframes = self->skipedKeyframes_;
  self->skipedKeyframes_ = v13;
}

- (void)updateWithKeyframes:(__n128)a3 currentCameraPose:(__n128)a4
{
  __n128 v25 = a4;
  __n128 v26 = a5;
  __n128 v23 = a2;
  __n128 v24 = a3;
  uint64_t v40 = *MEMORY[0x263EF8340];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v8 = a7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v13 = *(void **)(a1 + 96);
        v14 = objc_msgSend(v12, "identifier", *(_OWORD *)&v23, *(_OWORD *)&v24, *(_OWORD *)&v25, *(_OWORD *)&v26);
        [v13 setObject:v12 forKeyedSubscript:v14];

        uint64_t v15 = *(void **)(a1 + 104);
        v16 = [v12 identifier];
        [v15 setObject:v12 forKeyedSubscript:v16];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v9);
  }

  if (!dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFELL))
  {
    uint64_t v17 = [MEMORY[0x263EFF910] date];
    [v17 timeIntervalSinceDate:*(void *)(a1 + 64)];
    BOOL v19 = v18 < *(float *)(a1 + 60);

    if (v19)
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
    }
    else
    {
      objc_initWeak(&location, (id)a1);
      v20 = [*(id *)(a1 + 104) allValues];
      [*(id *)(a1 + 104) removeAllObjects];
      uint64_t v21 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __51__OUSession_updateWithKeyframes_currentCameraPose___block_invoke;
      block[3] = &unk_264CFAEC8;
      objc_copyWeak(v33, &location);
      id v32 = v20;
      __n128 v28 = v23;
      __n128 v29 = v24;
      __n128 v30 = v25;
      __n128 v31 = v26;
      id v22 = v20;
      dispatch_async(v21, block);

      objc_destroyWeak(v33);
      objc_destroyWeak(&location);
    }
  }
}

void __51__OUSession_updateWithKeyframes_currentCameraPose___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  if (WeakRetained)
  {
    uint64_t v3 = [MEMORY[0x263EFF910] date];
    id v4 = (void *)*((void *)WeakRetained + 8);
    *((void *)WeakRetained + 8) = v3;

    uint64_t v5 = objc_msgSend(*((id *)WeakRetained + 3), "updatePipelineWithKeyframes:currentCameraPose:", *(void *)(a1 + 96), *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 80));
    v6 = (void *)*((void *)WeakRetained + 10);
    *((void *)WeakRetained + 10) = v5;

    uint64_t v7 = [*((id *)WeakRetained + 10) objects];
    id v8 = (void *)*((void *)WeakRetained + 9);
    *((void *)WeakRetained + 9) = v7;

    uint64_t v9 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [*((id *)WeakRetained + 10) objects];
      int v14 = 134217984;
      uint64_t v15 = [v10 count];
      _os_log_impl(&dword_237C17000, v9, OS_LOG_TYPE_INFO, "[OD] Detected objects number: %lu", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v11 = [WeakRetained delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      uint64_t v13 = [WeakRetained delegate];
      [v13 session:WeakRetained didUpdateDetectedObjects:*((void *)WeakRetained + 9)];
    }
    dispatch_semaphore_signal(*((dispatch_semaphore_t *)WeakRetained + 6));
  }
}

- (void)updateWithKeyframes:(id)a3 ouframe:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        allKeyframes = self->allKeyframes_;
        uint64_t v11 = [v9 identifier];
        [(NSMutableDictionary *)allKeyframes setObject:v9 forKeyedSubscript:v11];

        skipedKeyframes = self->skipedKeyframes_;
        uint64_t v13 = [v9 identifier];
        [(NSMutableDictionary *)skipedKeyframes setObject:v9 forKeyedSubscript:v13];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v6);
  }

  if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->detSemaphore_, 0xFFFFFFFFFFFFFFFELL))
  {
    int v14 = [MEMORY[0x263EFF910] date];
    [v14 timeIntervalSinceDate:self->_detStartDate];
    BOOL v16 = v15 < self->_minFrameInterval;

    if (v16)
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)self->detSemaphore_);
    }
    else
    {
      objc_initWeak(&location, self);
      v36[0] = 0;
      v36[1] = v36;
      v36[2] = 0x3032000000;
      v36[3] = __Block_byref_object_copy__0;
      v36[4] = __Block_byref_object_dispose__0;
      id v37 = 0;
      ouframeQueue = self->ouframeQueue_;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __41__OUSession_updateWithKeyframes_ouframe___block_invoke;
      block[3] = &unk_264CFAEF0;
      objc_copyWeak(&v35, &location);
      void block[4] = self;
      block[5] = v36;
      dispatch_sync(ouframeQueue, block);
      double v18 = [(NSMutableDictionary *)self->skipedKeyframes_ allValues];
      [(NSMutableDictionary *)self->skipedKeyframes_ removeAllObjects];
      detQueue = self->detQueue_;
      uint64_t v26 = MEMORY[0x263EF8330];
      uint64_t v27 = 3221225472;
      __n128 v28 = __41__OUSession_updateWithKeyframes_ouframe___block_invoke_2;
      __n128 v29 = &unk_264CFAF18;
      objc_copyWeak(&v33, &location);
      id v20 = v18;
      __n128 v31 = self;
      id v32 = v36;
      id v30 = v20;
      dispatch_async(detQueue, &v26);
      uint64_t v21 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        NSUInteger v22 = [(NSArray *)self->objects_ count];
        uint64_t v23 = [(NSMutableDictionary *)self->allKeyframes_ count];
        uint64_t v24 = [v5 count];
        uint64_t v25 = [v20 count];
        *(_DWORD *)buf = 134218752;
        NSUInteger v44 = v22;
        __int16 v45 = 2048;
        uint64_t v46 = v23;
        __int16 v47 = 2048;
        uint64_t v48 = v24;
        __int16 v49 = 2048;
        uint64_t v50 = v25;
        _os_log_impl(&dword_237C17000, v21, OS_LOG_TYPE_INFO, "[OD] Detected objects number: %lu in %lu keyframes (%lu, %lu)", buf, 0x2Au);
      }

      objc_destroyWeak(&v33);
      objc_destroyWeak(&v35);
      _Block_object_dispose(v36, 8);

      objc_destroyWeak(&location);
    }
  }
}

void __41__OUSession_updateWithKeyframes_ouframe___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 112));
    id WeakRetained = v3;
  }
}

void __41__OUSession_updateWithKeyframes_ouframe___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = [MEMORY[0x263EFF910] date];
    id v4 = (void *)*((void *)WeakRetained + 8);
    *((void *)WeakRetained + 8) = v3;

    uint64_t v5 = [*((id *)WeakRetained + 3) updatePipelineWithKeyframes:*(void *)(a1 + 32) ouframe:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    uint64_t v6 = (void *)*((void *)WeakRetained + 10);
    *((void *)WeakRetained + 10) = v5;

    uint64_t v7 = [*((id *)WeakRetained + 10) objects];
    id v8 = (void *)*((void *)WeakRetained + 9);
    *((void *)WeakRetained + 9) = v7;

    uint64_t v9 = [WeakRetained delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      uint64_t v11 = [WeakRetained delegate];
      [v11 session:WeakRetained didUpdateDetectedObjects:*(void *)(*(void *)(a1 + 40) + 72)];
    }
    char v12 = [WeakRetained delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      int v14 = [WeakRetained delegate];
      [v14 session:WeakRetained didUpdateObjectAsset:*(void *)(*(void *)(a1 + 40) + 80)];
    }
    dispatch_semaphore_signal(*((dispatch_semaphore_t *)WeakRetained + 6));
  }
}

- (void)updateWithFrame:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 sceneCamera];

  if (v5)
  {
    objc_initWeak(&location, self);
    ouframeQueue = self->ouframeQueue_;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29__OUSession_updateWithFrame___block_invoke;
    block[3] = &unk_264CFAF40;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    dispatch_async(ouframeQueue, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __29__OUSession_updateWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 14, *(id *)(a1 + 32));
    id WeakRetained = v3;
  }
}

- (void)generateOfflineObjects:(id)a3 onlineObjects:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->detSemaphore_, 0xFFFFFFFFFFFFFFFELL))
  {
    objc_initWeak(&location, self);
    detQueue = self->detQueue_;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__OUSession_generateOfflineObjects_onlineObjects___block_invoke;
    block[3] = &unk_264CFAF68;
    objc_copyWeak(&v13, &location);
    id v10 = v6;
    id v11 = v7;
    char v12 = self;
    dispatch_async(detQueue, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __50__OUSession_generateOfflineObjects_onlineObjects___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained[2] generateOfflineObjects:*(void *)(a1 + 32) onlineObjects:*(void *)(a1 + 40)];
    id v5 = v3[11];
    v3[11] = (id)v4;

    id v6 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __50__OUSession_generateOfflineObjects_onlineObjects___block_invoke_cold_1(buf, [v3[11] count], v6);
    }

    id v7 = [v3 delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [v3 delegate];
      [v9 session:v3 didGeneratedOfflineObjects:*(void *)(*(void *)(a1 + 48) + 88)];
    }
    id v10 = [v3 delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      char v12 = [v3 delegate];
      [v12 session:v3 didGeneratedOfflineObjectAsset:v3[10]];
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)v3[6]);
  }
}

- (void)generateOfflineObjects:(id)a3 onlineObjects:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  detQueue = self->detQueue_;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __56__OUSession_generateOfflineObjects_onlineObjects_block___block_invoke;
  v15[3] = &unk_264CFAF90;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(detQueue, v15);
}

uint64_t __56__OUSession_generateOfflineObjects_onlineObjects_block___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 32;
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) generateOfflineObjects:*(void *)(a1 + 40) onlineObjects:*(void *)(a1 + 48)];
  uint64_t v4 = *(void **)(*(void *)v2 + 88);
  *(void *)(*(void *)v2 + 88) = v3;

  id v5 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 88) count];
    uint64_t v7 = [*(id *)(a1 + 40) count];
    uint64_t v8 = [*(id *)(a1 + 48) count];
    int v10 = 134218496;
    uint64_t v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v8;
    _os_log_impl(&dword_237C17000, v5, OS_LOG_TYPE_INFO, "[OD] Offline detected objects number: %lu, from %lu keyframes and %lu online objects", (uint8_t *)&v10, 0x20u);
  }

  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(a1 + 32) + 88));
  }
  return result;
}

- (void)generateOfflineObjectAsset:(id)a3 onlineObjects:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  detQueue = self->detQueue_;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60__OUSession_generateOfflineObjectAsset_onlineObjects_block___block_invoke;
  v15[3] = &unk_264CFAF90;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(detQueue, v15);
}

uint64_t __60__OUSession_generateOfflineObjectAsset_onlineObjects_block___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 32;
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) generateOfflineObjects:*(void *)(a1 + 40) onlineObjects:*(void *)(a1 + 48)];
  uint64_t v4 = *(void **)(*(void *)v2 + 88);
  *(void *)(*(void *)v2 + 88) = v3;

  uint64_t v5 = [*(id *)(*(void *)v2 + 16) getObjectAsset];
  uint64_t v6 = *(void **)(*(void *)v2 + 80);
  *(void *)(*(void *)v2 + 80) = v5;

  uint64_t v7 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 88) count];
    uint64_t v9 = [*(id *)(a1 + 40) count];
    uint64_t v10 = [*(id *)(a1 + 48) count];
    int v12 = 134218496;
    uint64_t v13 = v8;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    __int16 v16 = 2048;
    uint64_t v17 = v10;
    _os_log_impl(&dword_237C17000, v7, OS_LOG_TYPE_INFO, "[OD] Offline detected objects number: %lu, from %lu keyframes and %lu online objects", (uint8_t *)&v12, 0x20u);
  }

  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(a1 + 32) + 80));
  }
  return result;
}

- (void)stop
{
  objc_initWeak(&location, self);
  detQueue = self->detQueue_;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __17__OUSession_stop__block_invoke;
  v4[3] = &unk_264CFAFB8;
  objc_copyWeak(&v5, &location);
  dispatch_async(detQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __17__OUSession_stop__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[2] clear];
    uint64_t v3 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4[0] = 0;
      _os_log_impl(&dword_237C17000, v3, OS_LOG_TYPE_INFO, "Detected objects session ends.", (uint8_t *)v4, 2u);
    }
  }
}

- (OUSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (OUSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_workgroupFrame, 0);
  objc_storeStrong((id *)&self->_workgroupOD, 0);
  objc_storeStrong((id *)&self->ouframe_, 0);
  objc_storeStrong((id *)&self->skipedKeyframes_, 0);
  objc_storeStrong((id *)&self->allKeyframes_, 0);
  objc_storeStrong((id *)&self->offline_objects_, 0);
  objc_storeStrong((id *)&self->object_asset_, 0);
  objc_storeStrong((id *)&self->objects_, 0);
  objc_storeStrong((id *)&self->_detStartDate, 0);
  objc_storeStrong((id *)&self->detSemaphore_, 0);
  objc_storeStrong((id *)&self->ouframeQueue_, 0);
  objc_storeStrong((id *)&self->detQueue_, 0);
  objc_storeStrong((id *)&self->ouPipeline_, 0);
  objc_storeStrong((id *)&self->det3d_, 0);
  objc_storeStrong((id *)&self->configuration_, 0);
}

- (void)init:(void *)a1 .cold.1(void *a1)
{
  __cxa_begin_catch(a1);
  v1 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
  if (OUTLINED_FUNCTION_2_0(v1))
  {
    OUTLINED_FUNCTION_5();
    uint64_t v2 = OUTLINED_FUNCTION_1_0();
    v3(v2);
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_0_2(&dword_237C17000, v4, v5, "OUOnline Error: (init) %s", v6, v7, v8, v9, v10);
  }
}

- (void)init:(void *)a1 .cold.2(void *a1)
{
  __cxa_begin_catch(a1);
  v1 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
  if (OUTLINED_FUNCTION_2_0(v1))
  {
    OUTLINED_FUNCTION_5();
    uint64_t v2 = OUTLINED_FUNCTION_1_0();
    v3(v2);
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_0_2(&dword_237C17000, v4, v5, "OUOffline Error: (init) %s", v6, v7, v8, v9, v10);
  }
}

- (void)runWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_4();
  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_237C17000, v1, v2, "OUError: (init) %s", v3, v4, v5, v6, v7);
}

- (void)runWithConfiguration:(void *)a3 .cold.2(void *a1, uint64_t a2, void **a3)
{
  *a3 = __cxa_begin_catch(a1);
  uint64_t v3 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
  if (OUTLINED_FUNCTION_2_0(v3))
  {
    OUTLINED_FUNCTION_5();
    uint64_t v4 = OUTLINED_FUNCTION_1_0();
    v5(v4);
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_0_2(&dword_237C17000, v6, v7, "OUError: (run) %s", v8, v9, v10, v11, v12);
  }
}

- (void)runWithConfiguration:.cold.4()
{
  OUTLINED_FUNCTION_4();
  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_237C17000, v1, v2, "OUError: (run) %s", v3, v4, v5, v6, v7);
}

void __41__OUSession_updateWithKeyframes_ouframe___block_invoke_2_cold_1(void *a1)
{
  __cxa_begin_catch(a1);
  uint64_t v1 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
  if (OUTLINED_FUNCTION_2_0(v1))
  {
    OUTLINED_FUNCTION_5();
    uint64_t v2 = OUTLINED_FUNCTION_1_0();
    v3(v2);
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_0_2(&dword_237C17000, v4, v5, "OUError: (online) %s", v6, v7, v8, v9, v10);
  }
}

void __50__OUSession_generateOfflineObjects_onlineObjects___block_invoke_cold_1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_error_impl(&dword_237C17000, log, OS_LOG_TYPE_ERROR, "[OD] Offline detected objects number: %lu", buf, 0xCu);
}

void __50__OUSession_generateOfflineObjects_onlineObjects___block_invoke_cold_2(void *a1)
{
  __cxa_begin_catch(a1);
  uint64_t v1 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
  if (OUTLINED_FUNCTION_2_0(v1))
  {
    OUTLINED_FUNCTION_5();
    uint64_t v2 = OUTLINED_FUNCTION_1_0();
    v3(v2);
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_0_2(&dword_237C17000, v4, v5, "OUError: (offline) %s", v6, v7, v8, v9, v10);
  }
}

@end