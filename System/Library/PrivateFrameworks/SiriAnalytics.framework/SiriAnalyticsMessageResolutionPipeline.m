@interface SiriAnalyticsMessageResolutionPipeline
- (SiriAnalyticsMessageResolutionPipeline)initWithQueue:(id)a3;
- (id)_startResolutionTimerWithElapsed:(id)a3;
- (void)_continueResolutionWithMessage:(id)a3 resolvers:(id)a4 currentResolverIndex:(unint64_t)a5 resolversApplied:(unint64_t)a6 completion:(id)a7;
- (void)_discardResolutionTimer:(id)a3;
- (void)registerMessageResolver:(id)a3;
- (void)resolveMessage:(id)a3 timestamp:(unint64_t)a4 completion:(id)a5;
@end

@implementation SiriAnalyticsMessageResolutionPipeline

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolutionTimers, 0);
  objc_storeStrong((id *)&self->_resolvers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_discardResolutionTimer:(id)a3
{
  if (a3)
  {
    v4 = a3;
    dispatch_source_cancel(v4);
    [(NSMutableArray *)self->_resolutionTimers removeObject:v4];
  }
}

- (id)_startResolutionTimerWithElapsed:(id)a3
{
  id v4 = a3;
  v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
  dispatch_time_t v6 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak(&location, self);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __75__SiriAnalyticsMessageResolutionPipeline__startResolutionTimerWithElapsed___block_invoke;
  v15 = &unk_1E5AC0508;
  objc_copyWeak(&v18, &location);
  v7 = v5;
  v16 = v7;
  id v8 = v4;
  id v17 = v8;
  dispatch_source_set_event_handler(v7, &v12);
  -[NSMutableArray addObject:](self->_resolutionTimers, "addObject:", v7, v12, v13, v14, v15);
  v9 = v17;
  v10 = v7;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v10;
}

uint64_t __75__SiriAnalyticsMessageResolutionPipeline__startResolutionTimerWithElapsed___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _discardResolutionTimer:*(void *)(a1 + 32)];

  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)registerMessageResolver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__SiriAnalyticsMessageResolutionPipeline_registerMessageResolver___block_invoke;
  v7[3] = &unk_1E5AC0530;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __66__SiriAnalyticsMessageResolutionPipeline_registerMessageResolver___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  v2 = SiriAnalyticsLogContextResolution;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextResolution, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v9 = 136315394;
    v10 = "-[SiriAnalyticsMessageResolutionPipeline registerMessageResolver:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v3;
    _os_log_impl(&dword_1A2B39000, v2, OS_LOG_TYPE_INFO, "%s Registering message resolver: %@", (uint8_t *)&v9, 0x16u);
  }
  id v4 = *(void **)(*(void *)(a1 + 40) + 16);
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v6 = *(void *)(a1 + 40);
    v7 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v5;

    id v4 = *(void **)(*(void *)(a1 + 40) + 16);
  }
  return [v4 addObject:*(void *)(a1 + 32)];
}

- (void)_continueResolutionWithMessage:(id)a3 resolvers:(id)a4 currentResolverIndex:(unint64_t)a5 resolversApplied:(unint64_t)a6 completion:(id)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  unint64_t v15 = [v13 count];
  if (v12 && v15 > a5)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __132__SiriAnalyticsMessageResolutionPipeline__continueResolutionWithMessage_resolvers_currentResolverIndex_resolversApplied_completion___block_invoke;
    aBlock[3] = &unk_1E5AC0468;
    aBlock[4] = self;
    id v16 = v13;
    id v37 = v16;
    unint64_t v39 = a5;
    unint64_t v40 = a6;
    id v38 = v14;
    id v17 = _Block_copy(aBlock);
    id v18 = [v16 objectAtIndex:a5];
    if ([v18 handlesMessage:v12])
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v42 = 0;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __132__SiriAnalyticsMessageResolutionPipeline__continueResolutionWithMessage_resolvers_currentResolverIndex_resolversApplied_completion___block_invoke_2;
      v31[3] = &unk_1E5AC0490;
      id v19 = v18;
      id v32 = v19;
      id v20 = v12;
      id v33 = v20;
      v35 = buf;
      id v21 = v17;
      id v34 = v21;
      id val = [(SiriAnalyticsMessageResolutionPipeline *)self _startResolutionTimerWithElapsed:v31];
      objc_initWeak(&location, self);
      objc_initWeak(&from, val);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __132__SiriAnalyticsMessageResolutionPipeline__continueResolutionWithMessage_resolvers_currentResolverIndex_resolversApplied_completion___block_invoke_2;
      v24[3] = &unk_1E5AC04E0;
      objc_copyWeak(&v27, &location);
      objc_copyWeak(&v28, &from);
      v26 = buf;
      id v25 = v21;
      [v19 resolveMessage:v20 completion:v24];

      objc_destroyWeak(&v28);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      (*((void (**)(void *, id, void))v17 + 2))(v17, v12, 0);
    }
  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    v22 = SiriAnalyticsLogContextResolution;
    if (a6)
    {
      if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextResolution, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[SiriAnalyticsMessageResolutionPipeline _continueResolutionWithMessage:resolvers:currentRe"
                             "solverIndex:resolversApplied:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        _os_log_debug_impl(&dword_1A2B39000, v22, OS_LOG_TYPE_DEBUG, "%s Resolved message: %@", buf, 0x16u);
      }
      (*((void (**)(id, id))v14 + 2))(v14, v12);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextResolution, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[SiriAnalyticsMessageResolutionPipeline _continueResolutionWithMessage:resolvers:currentRe"
                             "solverIndex:resolversApplied:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        _os_log_error_impl(&dword_1A2B39000, v22, OS_LOG_TYPE_ERROR, "%s No applicable resolvers found for message: %@, dropping.", buf, 0x16u);
      }
      (*((void (**)(id, void))v14 + 2))(v14, 0);
    }
  }
}

uint64_t __132__SiriAnalyticsMessageResolutionPipeline__continueResolutionWithMessage_resolvers_currentResolverIndex_resolversApplied_completion___block_invoke(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return [*(id *)(a1 + 32) _continueResolutionWithMessage:a2 resolvers:*(void *)(a1 + 40) currentResolverIndex:*(void *)(a1 + 56) + 1 resolversApplied:*(void *)(a1 + 64) + a3 completion:*(void *)(a1 + 48)];
}

uint64_t __132__SiriAnalyticsMessageResolutionPipeline__continueResolutionWithMessage_resolvers_currentResolverIndex_resolversApplied_completion___block_invoke_2(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  v2 = SiriAnalyticsLogContextResolution;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextResolution, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    int v6 = 136315906;
    v7 = "-[SiriAnalyticsMessageResolutionPipeline _continueResolutionWithMessage:resolvers:currentResolverIndex:resolver"
         "sApplied:completion:]_block_invoke_2";
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    __int16 v10 = 2048;
    uint64_t v11 = 10;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    _os_log_error_impl(&dword_1A2B39000, v2, OS_LOG_TYPE_ERROR, "%s Message resolver: %@ timed out after %lu seconds and failed to resolve message: %@", (uint8_t *)&v6, 0x2Au);
  }
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __132__SiriAnalyticsMessageResolutionPipeline__continueResolutionWithMessage_resolvers_currentResolverIndex_resolversApplied_completion___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    __int16 v8 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __132__SiriAnalyticsMessageResolutionPipeline__continueResolutionWithMessage_resolvers_currentResolverIndex_resolversApplied_completion___block_invoke_2_3;
    block[3] = &unk_1E5AC04B8;
    block[4] = WeakRetained;
    objc_copyWeak(&v14, (id *)(a1 + 56));
    long long v10 = *(_OWORD *)(a1 + 32);
    id v9 = (id)v10;
    long long v13 = v10;
    id v12 = v5;
    char v15 = a3;
    dispatch_async(v8, block);

    objc_destroyWeak(&v14);
  }
}

void __132__SiriAnalyticsMessageResolutionPipeline__continueResolutionWithMessage_resolvers_currentResolverIndex_resolversApplied_completion___block_invoke_2_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [v2 _discardResolutionTimer:WeakRetained];

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
}

- (void)resolveMessage:(id)a3 timestamp:(unint64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__SiriAnalyticsMessageResolutionPipeline_resolveMessage_timestamp_completion___block_invoke;
  block[3] = &unk_1E5AC0768;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

void __78__SiriAnalyticsMessageResolutionPipeline_resolveMessage_timestamp_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) allObjects];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  uint64_t v3 = (void *)SiriAnalyticsLogContextResolution;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextResolution, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = v3;
    int v6 = 136315650;
    id v7 = "-[SiriAnalyticsMessageResolutionPipeline resolveMessage:timestamp:completion:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    __int16 v10 = 2048;
    uint64_t v11 = [v2 count];
    _os_log_impl(&dword_1A2B39000, v5, OS_LOG_TYPE_INFO, "%s Resolving message: %@ with %lu resolvers", (uint8_t *)&v6, 0x20u);
  }
  [*(id *)(a1 + 32) _continueResolutionWithMessage:*(void *)(a1 + 40) resolvers:v2 currentResolverIndex:0 resolversApplied:0 completion:*(void *)(a1 + 48)];
}

- (SiriAnalyticsMessageResolutionPipeline)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SiriAnalyticsMessageResolutionPipeline;
  int v6 = [(SiriAnalyticsMessageResolutionPipeline *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    __int16 v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    resolutionTimers = v7->_resolutionTimers;
    v7->_resolutionTimers = v8;
  }
  return v7;
}

@end