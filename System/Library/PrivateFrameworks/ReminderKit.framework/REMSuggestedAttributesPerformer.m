@interface REMSuggestedAttributesPerformer
- (OS_dispatch_queue)queue;
- (REMStore)store;
- (REMSuggestedAttributesPerformer)initWithQueue:(id)a3 store:(id)a4;
- (REMXPCSuggestedAttributesPerformer)q_cachedXPCPerformer;
- (id)q_resolveSuggestedAttributesPerformerWithReason:(id)a3 errorHandler:(id)a4;
- (id)q_syncSuggestedAttributesPerformerWithReason:(id)a3 errorHandler:(id)a4;
- (id)resultFromPerformingSwiftInvocation:(id)a3 parametersData:(id)a4 storages:(id)a5 error:(id *)a6;
- (void)preWarmModels;
- (void)setQ_cachedXPCPerformer:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation REMSuggestedAttributesPerformer

- (REMSuggestedAttributesPerformer)initWithQueue:(id)a3 store:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REMSuggestedAttributesPerformer;
  v9 = [(REMSuggestedAttributesPerformer *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    uint64_t v11 = [v8 nonUserInteractiveStore];
    store = v10->_store;
    v10->_store = (REMStore *)v11;
  }
  return v10;
}

- (void)preWarmModels
{
  v3 = [(REMSuggestedAttributesPerformer *)self queue];
  dispatch_assert_queue_V2(v3);

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__REMSuggestedAttributesPerformer_preWarmModels__block_invoke;
  v5[3] = &unk_1E61DC248;
  id v6 = 0;
  v4 = [(REMSuggestedAttributesPerformer *)self q_syncSuggestedAttributesPerformerWithReason:@"preWarmModels" errorHandler:v5];
  [v4 preWarmModels];
}

void __48__REMSuggestedAttributesPerformer_preWarmModels__block_invoke(uint64_t a1)
{
  v2 = +[REMLogStore utility];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __48__REMSuggestedAttributesPerformer_preWarmModels__block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }
}

- (id)resultFromPerformingSwiftInvocation:(id)a3 parametersData:(id)a4 storages:(id)a5 error:(id *)a6
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v37 = a4;
  id v38 = a5;
  uint64_t v11 = [(REMSuggestedAttributesPerformer *)self queue];
  dispatch_assert_queue_V2(v11);

  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__7;
  v57 = __Block_byref_object_dispose__7;
  id v58 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__7;
  v51 = __Block_byref_object_dispose__7;
  id v52 = 0;
  v12 = _os_activity_create(&dword_1B9AA2000, "REMSuggestedAttributesPerformer swiftInvocation", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  v13 = +[REMSignpost database];
  os_signpost_id_t v14 = os_signpost_id_generate(v13);
  v15 = v13;
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    id v17 = [v10 name];
    uint64_t v18 = [v17 cStringUsingEncoding:1];
    *(_DWORD *)buf = 136446210;
    uint64_t v60 = v18;
    _os_signpost_emit_with_name_impl(&dword_1B9AA2000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "REMStore.invocation", " enableTelemetry=YES Name=%{public, signpost.telemetry:string1, Name=InvocationName}s}d", buf, 0xCu);
  }
  v19 = +[REMLogStore read];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = [v10 name];
    uint64_t v21 = [v37 length];
    uint64_t v22 = [v38 count];
    *(_DWORD *)buf = 138543874;
    uint64_t v60 = (uint64_t)v20;
    __int16 v61 = 2048;
    uint64_t v62 = v21;
    __int16 v63 = 2048;
    uint64_t v64 = v22;
    _os_log_impl(&dword_1B9AA2000, v19, OS_LOG_TYPE_DEFAULT, "INVOCATION START {name: %{public}@, parametersData.length %ld, storages.count: %ld}", buf, 0x20u);
  }
  v23 = NSString;
  v24 = [v10 name];
  v25 = [v23 stringWithFormat:@"swInv_%@", v24];

  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __101__REMSuggestedAttributesPerformer_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke;
  v43[3] = &unk_1E61DC308;
  id v26 = v10;
  id v44 = v26;
  v45 = &v53;
  v27 = [(REMSuggestedAttributesPerformer *)self q_syncSuggestedAttributesPerformerWithReason:v25 errorHandler:v43];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __101__REMSuggestedAttributesPerformer_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke_7;
  v39[3] = &unk_1E61DD3F8;
  id v28 = v26;
  id v40 = v28;
  v41 = &v47;
  v42 = &v53;
  [v27 performSwiftInvocation:v28 withParametersData:v37 storages:v38 completion:v39];
  if (a6) {
    *a6 = (id) v54[5];
  }
  v29 = v16;
  v30 = v29;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    v31 = [(id)v48[5] resultStorages];
    uint64_t v32 = [v31 count];
    v33 = [(id)v48[5] resultData];
    uint64_t v34 = [v33 length];
    *(_DWORD *)buf = 134349312;
    uint64_t v60 = v32;
    __int16 v61 = 2050;
    uint64_t v62 = v34;
    _os_signpost_emit_with_name_impl(&dword_1B9AA2000, v30, OS_SIGNPOST_INTERVAL_END, v14, "REMStore.invocation", " enableTelemetry=YES ResultCount=%{public, signpost.telemetry:number1, Name:ResultCount}ld DataSize=%{public, signpost.telemetry:number2, Name:DataSize}ld", buf, 0x16u);
  }
  id v35 = (id)v48[5];

  os_activity_scope_leave(&state);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);

  return v35;
}

void __101__REMSuggestedAttributesPerformer_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __101__REMSuggestedAttributesPerformer_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke_cold_1(a1);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __101__REMSuggestedAttributesPerformer_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[REMLogStore read];
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __101__REMSuggestedAttributesPerformer_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke_7_cold_1(a1);
    }

    v9 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v10 = v6;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [*(id *)(a1 + 32) name];
      v12 = [v5 resultData];
      uint64_t v13 = [v12 length];
      os_signpost_id_t v14 = [v5 resultStorages];
      int v17 = 138543874;
      uint64_t v18 = v11;
      __int16 v19 = 2048;
      uint64_t v20 = v13;
      __int16 v21 = 2048;
      uint64_t v22 = [v14 count];
      _os_log_impl(&dword_1B9AA2000, v8, OS_LOG_TYPE_DEFAULT, "INVOCATION END {name: %{public}@, result.data.length: %ld, result.storages.count: %ld}", (uint8_t *)&v17, 0x20u);
    }
    v9 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = v5;
  }
  id v15 = v10;
  v16 = *v9;
  REMSuggestedAttributesPerformer *v9 = v15;
}

- (id)q_syncSuggestedAttributesPerformerWithReason:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(REMSuggestedAttributesPerformer *)self q_cachedXPCPerformer];

  if (!v8)
  {
    objc_initWeak(&location, self);
    v9 = [(REMSuggestedAttributesPerformer *)self q_resolveSuggestedAttributesPerformerWithReason:v6 errorHandler:v7];
    if ([v9 conformsToProtocol:&unk_1F139A550])
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __93__REMSuggestedAttributesPerformer_q_syncSuggestedAttributesPerformerWithReason_errorHandler___block_invoke;
      v16[3] = &unk_1E61DD448;
      objc_copyWeak(&v17, &location);
      id v10 = [v9 remoteObjectProxyWithErrorHandler:v16];
      [(REMSuggestedAttributesPerformer *)self setQ_cachedXPCPerformer:v10];

      objc_destroyWeak(&v17);
    }
    else
    {
      [(REMSuggestedAttributesPerformer *)self setQ_cachedXPCPerformer:v9];
    }

    objc_destroyWeak(&location);
  }
  uint64_t v11 = [(REMSuggestedAttributesPerformer *)self q_cachedXPCPerformer];
  if ([v11 conformsToProtocol:&unk_1F139A550])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __93__REMSuggestedAttributesPerformer_q_syncSuggestedAttributesPerformerWithReason_errorHandler___block_invoke_15;
    v14[3] = &unk_1E61DC3F8;
    id v15 = v7;
    id v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v14];
  }
  else
  {
    id v12 = v11;
  }

  return v12;
}

void __93__REMSuggestedAttributesPerformer_q_syncSuggestedAttributesPerformerWithReason_errorHandler___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__REMSuggestedAttributesPerformer_q_syncSuggestedAttributesPerformerWithReason_errorHandler___block_invoke_2;
    block[3] = &unk_1E61DD420;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);

    objc_destroyWeak(&v6);
  }
}

void __93__REMSuggestedAttributesPerformer_q_syncSuggestedAttributesPerformerWithReason_errorHandler___block_invoke_2(uint64_t a1)
{
  v2 = +[REMLogStore utility];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1B9AA2000, v2, OS_LOG_TYPE_DEFAULT, "suggestedAttributesPerformer invalidated. Dropping cache", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setQ_cachedXPCPerformer:", 0);
}

uint64_t __93__REMSuggestedAttributesPerformer_q_syncSuggestedAttributesPerformerWithReason_errorHandler___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)q_resolveSuggestedAttributesPerformerWithReason:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[REMLogStore utility];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B9AA2000, v8, OS_LOG_TYPE_DEFAULT, "Cache-miss getting suggestedAttributesPerformer. Resolving.", buf, 2u);
  }

  v9 = [(REMSuggestedAttributesPerformer *)self store];
  id v10 = [v9 daemonController];

  uint64_t v11 = [NSString stringWithFormat:@"suggestedAttributesPerformer-%@", v6];
  id v12 = [v10 syncStorePerformerWithReason:v11 errorHandler:v7];
  if (v12)
  {
    *(void *)buf = 0;
    uint64_t v20 = buf;
    uint64_t v21 = 0x3032000000;
    uint64_t v22 = __Block_byref_object_copy__7;
    uint64_t v23 = __Block_byref_object_dispose__7;
    id v24 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __96__REMSuggestedAttributesPerformer_q_resolveSuggestedAttributesPerformerWithReason_errorHandler___block_invoke;
    v16[3] = &unk_1E61DD470;
    uint64_t v18 = buf;
    id v17 = v7;
    [v12 uncachedSuggestedAttributesPerformerWithReason:v11 completion:v16];
    id v13 = *((id *)v20 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    os_signpost_id_t v14 = +[REMLogStore utility];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[REMSuggestedAttributesPerformer q_resolveSuggestedAttributesPerformerWithReason:errorHandler:]();
    }

    id v13 = 0;
  }

  return v13;
}

void __96__REMSuggestedAttributesPerformer_q_resolveSuggestedAttributesPerformerWithReason_errorHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = +[REMLogStore utility];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __96__REMSuggestedAttributesPerformer_q_resolveSuggestedAttributesPerformerWithReason_errorHandler___block_invoke_cold_2();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    v9 = +[REMLogStore xpc];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __96__REMSuggestedAttributesPerformer_q_resolveSuggestedAttributesPerformerWithReason_errorHandler___block_invoke_cold_1(v9);
    }

    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = +[REMError internalErrorWithDebugDescription:@"uncachedSuggestedAttributesPerfomer produced no result and no error"];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
}

- (REMStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (REMXPCSuggestedAttributesPerformer)q_cachedXPCPerformer
{
  return self->_q_cachedXPCPerformer;
}

- (void)setQ_cachedXPCPerformer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_q_cachedXPCPerformer, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

void __48__REMSuggestedAttributesPerformer_preWarmModels__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __101__REMSuggestedAttributesPerformer_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) name];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v2, v3, "INVOCATION END ERROR_XPC {name: %{public}@, error: %{public}@}", v4, v5, v6, v7, v8);
}

void __101__REMSuggestedAttributesPerformer_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke_7_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) name];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v2, v3, "INVOCATION END ERROR {name: %{public}@, error: %@}", v4, v5, v6, v7, v8);
}

- (void)q_resolveSuggestedAttributesPerformerWithReason:errorHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "Failed to get storePerformer for suggestedAttributesPerformer. {action: %@}", v2, v3, v4, v5, v6);
}

void __96__REMSuggestedAttributesPerformer_q_resolveSuggestedAttributesPerformerWithReason_errorHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_FAULT, "uncachedSuggestedAttributesPerfomer produced no result and no error", v1, 2u);
}

void __96__REMSuggestedAttributesPerformer_q_resolveSuggestedAttributesPerformerWithReason_errorHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "uncachedSuggestedAttributesPerfomer ERROR {error: %{public}@}", v2, v3, v4, v5, v6);
}

@end