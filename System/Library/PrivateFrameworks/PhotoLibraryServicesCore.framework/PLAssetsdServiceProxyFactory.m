@interface PLAssetsdServiceProxyFactory
- (OS_dispatch_queue)queue;
- (PLAssetsdServiceProxyFactory)initWithQueue:(id)a3 proxyCreating:(id)a4 proxyGetter:(SEL)a5;
- (id)_inq_createServiceProxyWithCallStackSymbols:(id)a3 errorHandler:(id)a4;
- (id)_inq_createServiceProxyWithErrorHandler:(id)a3;
- (id)_unboostingRemoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)serviceProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)_logReplyError:(id)a3 withCallStackSymbols:(id)a4;
- (void)addBarrierBlock:(id)a3;
- (void)remoteObjectProxyWithErrorHandler:(id)a3 handler:(id)a4;
@end

@implementation PLAssetsdServiceProxyFactory

- (void)remoteObjectProxyWithErrorHandler:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PLAssetsdServiceProxyFactory_remoteObjectProxyWithErrorHandler_handler___block_invoke;
  block[3] = &unk_1E589FF50;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __74__PLAssetsdServiceProxyFactory_remoteObjectProxyWithErrorHandler_handler___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  if (v2
    || (objc_msgSend(*(id *)(a1 + 32), "_inq_createServiceProxyWithCallStackSymbols:errorHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48)), (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = v2;
    v3 = [v2 remoteObjectProxyWithErrorHandler:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (id)_inq_createServiceProxyWithCallStackSymbols:(id)a3 errorHandler:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v47 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v45) = v8;
  if (v8)
  {
    id v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: _inq_createServiceProxyWithCallStackSymbols:errorHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v45 + 1);
    *((void *)&v45 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v46 + 8));
  }
  *(void *)&long long v54 = 0;
  *((void *)&v54 + 1) = &v54;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__5778;
  v57 = __Block_byref_object_dispose__5779;
  id v58 = 0;
  proxyCreating = self->_proxyCreating;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __89__PLAssetsdServiceProxyFactory__inq_createServiceProxyWithCallStackSymbols_errorHandler___block_invoke;
  v44[3] = &unk_1E58A1A88;
  v44[4] = self;
  v44[5] = &v54;
  id v12 = [(PLXPCProxyCreating *)proxyCreating synchronousRemoteObjectProxyWithErrorHandler:v44];
  if (v12)
  {
    if ((_BYTE)v45)
    {
      id v13 = PLRequestGetLog();
      os_signpost_id_t v14 = os_signpost_id_generate(v13);
      v52 = @"SignpostId";
      v15 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v14];
      v53 = v15;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
      objc_msgSend(v12, "set_userInfo:", v16);

      v17 = v13;
      v18 = v17;
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        if (self->_proxyGetterSelector) {
          proxyGetterSelector = self->_proxyGetterSelector;
        }
        else {
          proxyGetterSelector = 0;
        }
        v20 = NSStringFromSelector(proxyGetterSelector);
        *(_DWORD *)buf = 138543362;
        v51 = v20;
        _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PLXPC Async", "%{public}@", buf, 0xCu);
      }
    }
    if (self->_proxyGetterSelector) {
      SEL v21 = self->_proxyGetterSelector;
    }
    else {
      SEL v21 = 0;
    }
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __89__PLAssetsdServiceProxyFactory__inq_createServiceProxyWithCallStackSymbols_errorHandler___block_invoke_3;
    v41[3] = &unk_1E589FED8;
    v41[4] = self;
    v43 = &v54;
    id v42 = v6;
    v22 = (void *)MEMORY[0x19F38F770](v41);
    [v12 performSelector:v21 withObject:v22];
  }
  v23 = *(void **)(*((void *)&v54 + 1) + 40);
  if (v23)
  {
    v24 = [v23 domain];
    int v25 = [v24 isEqualToString:@"com.apple.photos.error"];

    if (v25)
    {
      id v26 = *(id *)(*((void *)&v54 + 1) + 40);
    }
    else
    {
      v28 = NSString;
      if (self->_proxyGetterSelector) {
        v29 = self->_proxyGetterSelector;
      }
      else {
        v29 = 0;
      }
      v30 = NSStringFromSelector(v29);
      v31 = [v28 stringWithFormat:@"Unable to obtain %@ XPC proxy for %@. %@ could have crashed", @"assetsd", v30, @"assetsd"];

      v32 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = *MEMORY[0x1E4F28A50];
      v48[0] = *MEMORY[0x1E4F28568];
      v48[1] = v33;
      uint64_t v34 = *(void *)(*((void *)&v54 + 1) + 40);
      v49[0] = v31;
      v49[1] = v34;
      v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];
      id v26 = [v32 errorWithDomain:@"com.apple.photos.error" code:41002 userInfo:v35];
    }
    v7[2](v7, v26);

    v27 = 0;
  }
  else
  {
    v27 = self->_serviceProxy;
  }

  _Block_object_dispose(&v54, 8);
  if ((_BYTE)v45) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v46 + 8));
  }
  if ((void)v46)
  {
    v36 = PLRequestGetLog();
    v37 = v36;
    os_signpost_id_t v38 = v46;
    if ((unint64_t)(v46 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      Name = sel_getName(*((SEL *)&v47 + 1));
      LODWORD(v54) = 136446210;
      *(void *)((char *)&v54 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v37, OS_SIGNPOST_INTERVAL_END, v38, "PLXPC Sync", "%{public}s", (uint8_t *)&v54, 0xCu);
    }
  }
  return v27;
}

- (PLAssetsdServiceProxyFactory)initWithQueue:(id)a3 proxyCreating:(id)a4 proxyGetter:(SEL)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PLAssetsdServiceProxyFactory;
  v11 = [(PLAssetsdServiceProxyFactory *)&v15 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a3);
    if (a5) {
      SEL v13 = a5;
    }
    else {
      SEL v13 = 0;
    }
    v12->_proxyGetterSelector = v13;
    objc_storeStrong((id *)&v12->_proxyCreating, a4);
  }

  return v12;
}

void __89__PLAssetsdServiceProxyFactory__inq_createServiceProxyWithCallStackSymbols_errorHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    [*(id *)(a1 + 32) _logReplyError:v6 withCallStackSymbols:*(void *)(a1 + 40)];
  }
}

void __74__PLAssetsdServiceProxyFactory_remoteObjectProxyWithErrorHandler_handler___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 remoteObjectProxyWithErrorHandler:*(void *)(a1 + 40)];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      v5 = [MEMORY[0x1E4F29060] callStackSymbols];
    }
    else
    {
      v5 = 0;
    }
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(NSObject **)(v6 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__PLAssetsdServiceProxyFactory_remoteObjectProxyWithErrorHandler_handler___block_invoke_2;
    v9[3] = &unk_1E589FF28;
    v9[4] = v6;
    id v10 = v5;
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    id v8 = v5;
    dispatch_async(v7, v9);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_proxyCreating, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)addBarrierBlock:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    [(PLXPCProxyCreating *)self->_proxyCreating addBarrierBlock:v4];
  }
  else
  {
    v5 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_ERROR, "Underlying proxy creating object does not respond to addBarrierBlock:", v6, 2u);
    }
  }
}

- (id)_unboostingRemoteObjectProxy
{
  id v2 = [(PLAssetsdServiceProxyFactory *)self serviceProxyWithErrorHandler:&__block_literal_global_5772];
  v3 = [v2 _unboostingRemoteObjectProxy];

  return v3;
}

void __60__PLAssetsdServiceProxyFactory__unboostingRemoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Unable to get the service proxy with error: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(PLAssetsdServiceProxyFactory *)self serviceProxyWithErrorHandler:v4];
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(PLAssetsdServiceProxyFactory *)self serviceProxyWithErrorHandler:v4];
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)serviceProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  SEL v13 = &v12;
  uint64_t v14 = 0x3032000000;
  objc_super v15 = __Block_byref_object_copy__5778;
  v16 = __Block_byref_object_dispose__5779;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PLAssetsdServiceProxyFactory_serviceProxyWithErrorHandler___block_invoke;
  block[3] = &unk_1E589FF00;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __61__PLAssetsdServiceProxyFactory_serviceProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 16));
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_inq_createServiceProxyWithErrorHandler:", *(void *)(a1 + 40));
    MEMORY[0x1F41817F8]();
  }
}

- (void)_logReplyError:(id)a3 withCallStackSymbols:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLGatekeeperXPCGetLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_FAULT);
  if (v7)
  {
    if (v9)
    {
      if (self->_proxyGetterSelector) {
        proxyGetterSelector = self->_proxyGetterSelector;
      }
      else {
        proxyGetterSelector = 0;
      }
      uint64_t v12 = NSStringFromSelector(proxyGetterSelector);
      SEL v13 = [v7 componentsJoinedByString:@"\n"];
      int v14 = 138543874;
      objc_super v15 = v12;
      __int16 v16 = 2112;
      id v17 = v6;
      __int16 v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_FAULT, "Unable to get XPC service from assetsd %{public}@: %@, callstack:\n%@", (uint8_t *)&v14, 0x20u);

LABEL_12:
    }
  }
  else if (v9)
  {
    if (self->_proxyGetterSelector) {
      id v11 = self->_proxyGetterSelector;
    }
    else {
      id v11 = 0;
    }
    uint64_t v12 = NSStringFromSelector(v11);
    int v14 = 138543618;
    objc_super v15 = v12;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_FAULT, "Unable to get XPC service from assetsd %{public}@: %@@", (uint8_t *)&v14, 0x16u);
    goto LABEL_12;
  }
}

void __89__PLAssetsdServiceProxyFactory__inq_createServiceProxyWithCallStackSymbols_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    if (*(void *)(*(void *)(a1 + 32) + 8)) {
      id v5 = *(const char **)(*(void *)(a1 + 32) + 8);
    }
    else {
      id v5 = 0;
    }
    id v6 = NSStringFromSelector(v5);
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_FAULT, "XPC connection error to assetsd %@ : %@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

- (id)_inq_createServiceProxyWithErrorHandler:(id)a3
{
  return [(PLAssetsdServiceProxyFactory *)self _inq_createServiceProxyWithCallStackSymbols:0 errorHandler:a3];
}

@end