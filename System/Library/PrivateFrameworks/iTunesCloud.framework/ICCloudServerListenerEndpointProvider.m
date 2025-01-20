@interface ICCloudServerListenerEndpointProvider
+ (id)_remoteObjectInterface;
- (ICCloudServerListenerEndpointProvider)init;
- (id)_listenerEndpointProviderConnection;
- (id)listenerEndpointForService:(int64_t)a3 error:(id *)a4;
- (void)dealloc;
- (void)notifyDeviceSetupFinishedWithCompletion:(id)a3;
@end

@implementation ICCloudServerListenerEndpointProvider

- (ICCloudServerListenerEndpointProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICCloudServerListenerEndpointProvider;
  result = [(ICCloudServerListenerEndpointProvider *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_listenerEndpointProviderConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ICCloudServerListenerEndpointProvider;
  [(ICCloudServerListenerEndpointProvider *)&v3 dealloc];
}

uint64_t __63__ICCloudServerListenerEndpointProvider__remoteObjectInterface__block_invoke()
{
  _remoteObjectInterface_sListenerEndpointProviderRemoteObjectInterface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF67B8A0];

  return MEMORY[0x1F41817F8]();
}

- (id)listenerEndpointForService:(int64_t)a3 error:(id *)a4
{
  v17 = a4;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__22702;
  v34 = __Block_byref_object_dispose__22703;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__22702;
  v28 = __Block_byref_object_dispose__22703;
  id v29 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  do
  {
    v6 = [(ICCloudServerListenerEndpointProvider *)self _listenerEndpointProviderConnection];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __74__ICCloudServerListenerEndpointProvider_listenerEndpointForService_error___block_invoke;
    v19[3] = &unk_1E5AC9B70;
    v19[4] = self;
    v19[5] = &v20;
    v19[7] = 10;
    v19[8] = a3;
    v19[6] = &v24;
    v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v19];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __74__ICCloudServerListenerEndpointProvider_listenerEndpointForService_error___block_invoke_3;
    v18[3] = &unk_1E5AC9B98;
    v18[4] = self;
    v18[5] = &v24;
    v18[6] = &v30;
    v18[7] = a3;
    [v7 getListenerEndpointForService:a3 completion:v18];
  }
  while (!v31[5] && v21[3] < 10);
  v8 = (void *)v25[5];
  if (v8)
  {
    if (v17) {
      id *v17 = v8;
    }
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = ICCloudServerSupportedServiceGetName(a3);
      uint64_t v11 = v31[5];
      uint64_t v12 = v25[5];
      *(_DWORD *)buf = 138544386;
      v37 = self;
      __int16 v38 = 2114;
      v39 = v10;
      __int16 v40 = 2048;
      int64_t v41 = a3;
      __int16 v42 = 2114;
      uint64_t v43 = v11;
      __int16 v44 = 2114;
      uint64_t v45 = v12;
      _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_ERROR, "%{public}@: listenerEndpointForService [done with error] - service=%{public}@[%ld] - endpoint=%{public}@ - error=%{public}@", buf, 0x34u);
    }
  }
  else
  {
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = ICCloudServerSupportedServiceGetName(a3);
      uint64_t v14 = v31[5];
      *(_DWORD *)buf = 138544130;
      v37 = self;
      __int16 v38 = 2114;
      v39 = v13;
      __int16 v40 = 2048;
      int64_t v41 = a3;
      __int16 v42 = 2114;
      uint64_t v43 = v14;
      _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: listenerEndpointForService [done] - service=%{public}@[%ld] - endpoint=%{public}@", buf, 0x2Au);
    }
  }

  id v15 = (id)v31[5];
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);

  return v15;
}

- (id)_listenerEndpointProviderConnection
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_listenerEndpointProviderConnection)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      uint64_t v14 = self;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: listenerEndpointProviderConnection [started]", (uint8_t *)&v13, 0xCu);
    }

    v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.itunescloudd.xpc" options:0];
    listenerEndpointProviderConnection = self->_listenerEndpointProviderConnection;
    self->_listenerEndpointProviderConnection = v5;

    v7 = self->_listenerEndpointProviderConnection;
    v8 = [(id)objc_opt_class() _remoteObjectInterface];
    [(NSXPCConnection *)v7 setRemoteObjectInterface:v8];

    [(NSXPCConnection *)self->_listenerEndpointProviderConnection resume];
  }
  v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_listenerEndpointProviderConnection;
    int v13 = 138543618;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: listenerEndpointProviderConnection [done] - connection:%{public}@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v11 = self->_listenerEndpointProviderConnection;
  os_unfair_lock_unlock(p_lock);

  return v11;
}

+ (id)_remoteObjectInterface
{
  if (_remoteObjectInterface_sListenerEndpointProviderRemoteObjectInterfaceOnceToken != -1) {
    dispatch_once(&_remoteObjectInterface_sListenerEndpointProviderRemoteObjectInterfaceOnceToken, &__block_literal_global_22715);
  }
  v2 = (void *)_remoteObjectInterface_sListenerEndpointProviderRemoteObjectInterface;

  return v2;
}

void __74__ICCloudServerListenerEndpointProvider_listenerEndpointForService_error___block_invoke_3(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[4];
      v10 = ICCloudServerSupportedServiceGetName(a1[7]);
      uint64_t v11 = a1[7];
      int v16 = 138544130;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      v19 = v10;
      __int16 v20 = 2048;
      uint64_t v21 = v11;
      __int16 v22 = 2114;
      id v23 = v7;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@: listenerEndpointForService - XPC Error [no listener endpoint for service] - service=%{public}@[%ld] - error=%{public}@", (uint8_t *)&v16, 0x2Au);
    }
    uint64_t v12 = [v7 copy];
    uint64_t v13 = *(void *)(a1[5] + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    uint64_t v15 = *(void *)(a1[5] + 8);
    uint64_t v14 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = 0;
  }
}

- (void)notifyDeviceSetupFinishedWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(ICCloudServerListenerEndpointProvider *)self _listenerEndpointProviderConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__ICCloudServerListenerEndpointProvider_notifyDeviceSetupFinishedWithCompletion___block_invoke;
  v11[3] = &unk_1E5ACAC90;
  id v6 = v4;
  id v12 = v6;
  id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__ICCloudServerListenerEndpointProvider_notifyDeviceSetupFinishedWithCompletion___block_invoke_2;
  v9[3] = &unk_1E5ACAC90;
  id v10 = v6;
  id v8 = v6;
  [v7 notifyDeviceSetupFinishedWithCompletion:v9];
}

uint64_t __81__ICCloudServerListenerEndpointProvider_notifyDeviceSetupFinishedWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __81__ICCloudServerListenerEndpointProvider_notifyDeviceSetupFinishedWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__ICCloudServerListenerEndpointProvider_listenerEndpointForService_error___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  ++*(void *)(*(void *)(a1[5] + 8) + 24);
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = *(void *)(*(void *)(a1[5] + 8) + 24);
    uint64_t v7 = a1[7];
    id v8 = ICCloudServerSupportedServiceGetName(a1[8]);
    uint64_t v9 = a1[8];
    int v13 = 138544642;
    uint64_t v14 = v5;
    __int16 v15 = 2048;
    uint64_t v16 = v6;
    __int16 v17 = 2048;
    uint64_t v18 = v7;
    __int16 v19 = 2114;
    __int16 v20 = v8;
    __int16 v21 = 2048;
    uint64_t v22 = v9;
    __int16 v23 = 2114;
    id v24 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "%{public}@: listenerEndpointForService - XPC Error retrieving endpoint [Attempt %ld of %ld] - service=%{public}@[%ld] - error=%{public}@", (uint8_t *)&v13, 0x3Eu);
  }
  uint64_t v10 = [v3 copy];
  uint64_t v11 = *(void *)(a1[6] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

@end