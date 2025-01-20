@interface SidecarSession
- (NSUUID)uuid;
- (OS_dispatch_queue)queue;
- (SidecarDevice)device;
- (SidecarService)service;
- (SidecarSession)init;
- (SidecarSession)initWithRemote:(id)a3 device:(id)a4 dataLink:(int)a5 service:(id)a6 error:(id *)a7;
- (SidecarSession)initWithService:(id)a3 device:(id)a4;
- (SidecarSessionDelegate)delegate;
- (id)description;
- (int)dataLink;
- (int64_t)handle;
- (int64_t)transport;
- (void)_closeWithError:(id)a3;
- (void)closeWithError:(id)a3 completion:(id)a4;
- (void)connectWithTransport:(int64_t)a3 reconnectToSession:(id)a4;
- (void)dealloc;
- (void)listenForStreamType:(int64_t)a3 flags:(unint64_t)a4 identifier:(id)a5;
- (void)listenForStreamType:(int64_t)a3 flags:(unint64_t)a4 identifier:(id)a5 processUniqueID:(unint64_t)a6 completion:(id)a7;
- (void)openStreamForType:(int64_t)a3 flags:(unint64_t)a4 identifier:(id)a5;
- (void)openStreamForType:(int64_t)a3 flags:(unint64_t)a4 identifier:(id)a5 processUniqueID:(unint64_t)a6 completion:(id)a7;
- (void)sendMessage:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)timeSyncWithCompletion:(id)a3;
@end

@implementation SidecarSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDelegate:(id)a3
{
}

- (SidecarSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SidecarSessionDelegate *)WeakRetained;
}

- (void)timeSyncWithCompletion:(id)a3
{
  id v5 = a3;
  v6 = SidecarQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SidecarSession_timeSyncWithCompletion___block_invoke;
  block[3] = &unk_2649C6288;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __41__SidecarSession_timeSyncWithCompletion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = v1[7];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = -1;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__SidecarSession_timeSyncWithCompletion___block_invoke_2;
  v7[3] = &unk_2649C6210;
  uint64_t v3 = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  id v9 = v10;
  v4 = sessionCompletion(v1, v3, v7);
  id v5 = SidecarRelayProxyAsync(0, v4);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__SidecarSession_timeSyncWithCompletion___block_invoke_3;
  v6[3] = &unk_2649C6260;
  v6[4] = v4;
  v6[5] = v10;
  [v5 relaySession:v2 timeSyncWithCompletion:v6];

  _Block_object_dispose(v10, 8);
}

uint64_t __41__SidecarSession_timeSyncWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), a2);
  }
  return result;
}

void __41__SidecarSession_timeSyncWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = SidecarQueue();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__SidecarSession_timeSyncWithCompletion___block_invoke_4;
  v8[3] = &unk_2649C6238;
  uint64_t v11 = a2;
  long long v10 = *(_OWORD *)(a1 + 32);
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __41__SidecarSession_timeSyncWithCompletion___block_invoke_4(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 24) = a1[7];
  return (*(uint64_t (**)(void, void))(a1[5] + 16))(a1[5], a1[4]);
}

- (void)closeWithError:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (SidecarSessionSetState(self, 3))
  {
    id v9 = SidecarQueue();
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44__SidecarSession_closeWithError_completion___block_invoke;
    v10[3] = &unk_2649C61E8;
    void v10[4] = self;
    SEL v13 = a2;
    id v12 = v8;
    id v11 = v7;
    dispatch_async(v9, v10);
  }
}

void __44__SidecarSession_closeWithError_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[7];
  sessionCompletion(v2, *(void *)(a1 + 56), *(void **)(a1 + 48));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = SidecarRelayProxyAsync(0, v5);
  [v4 relaySessionClose:v3 error:*(void *)(a1 + 40) completion:v5];
}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = SidecarQueue();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __41__SidecarSession_sendMessage_completion___block_invoke;
  v12[3] = &unk_2649C61E8;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

void __41__SidecarSession_sendMessage_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[7];
  sessionCompletion(v2, *(void *)(a1 + 56), *(void **)(a1 + 48));
  v4 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  id v5 = *(void **)(a1 + 40);
  id v9 = 0;
  v6 = SidecarOPACKEncode(v5, &v9);
  id v7 = v9;
  if (v7)
  {
    ((void (**)(void, id))v4)[2](v4, v7);
  }
  else
  {
    id v8 = SidecarRelayProxyAsync(0, v4);
    [v8 relaySession:v3 sendOPACKData:v6 completion:v4];
  }
}

- (void)connectWithTransport:(int64_t)a3 reconnectToSession:(id)a4
{
  id v7 = a4;
  if (SidecarSessionSetState(self, 1))
  {
    id v8 = SidecarQueue();
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __58__SidecarSession_connectWithTransport_reconnectToSession___block_invoke;
    v10[3] = &unk_2649C61C0;
    int64_t v12 = a3;
    SEL v13 = a2;
    void v10[4] = self;
    id v11 = v7;
    id v9 = v7;
    dispatch_async(v8, v10);
  }
  else
  {
    __break(1u);
  }
}

void __58__SidecarSession_connectWithTransport_reconnectToSession___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = *(void *)(a1 + 48);
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) identifier];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) serviceIdentifier];
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 56);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__SidecarSession_connectWithTransport_reconnectToSession___block_invoke_2;
  v10[3] = &unk_2649C6198;
  void v10[4] = v4;
  v6 = sessionCompletion(v4, v5, v10);
  id v7 = SidecarRelayProxyAsync(0, v6);
  id v8 = [*(id *)(a1 + 32) uuid];
  id v9 = [*(id *)(a1 + 40) uuid];
  [v7 relaySessionOpen:v8 reconnect:v9 serviceIdentifier:v3 destination:v2 transport:*(void *)(a1 + 48) completion:v6];
}

void __58__SidecarSession_connectWithTransport_reconnectToSession___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v5 = *(unint64_t **)(a1 + 32);
  if (v3)
  {
    [v5 _closeWithError:v3];
  }
  else
  {
    uint64_t v6 = atomic_load(v5 + 9);
    if (v6 <= 1
      && (uint64_t v7 = v6,
          atomic_compare_exchange_strong((atomic_ullong *volatile)v5 + 9, (unint64_t *)&v7, 2uLL),
          v7 == v6))
    {
      [v4 sidecarSessionStarted:*(void *)(a1 + 32)];
    }
    else
    {
      id v8 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
      id v9 = v8;
      if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        unint64_t v11 = atomic_load((unint64_t *)(v10 + 72));
        int v12 = 138543618;
        uint64_t v13 = v10;
        __int16 v14 = 2048;
        unint64_t v15 = v11;
        _os_log_impl(&dword_22D954000, v9, OS_LOG_TYPE_ERROR, "%{public}@: set state failed (%ld)", (uint8_t *)&v12, 0x16u);
      }
    }
  }
}

- (void)_closeWithError:(id)a3
{
  id v5 = a3;
  if (SidecarSessionSetState(self, 3))
  {
    v4 = [(SidecarSession *)self delegate];
    [v4 sidecarSession:self closedWithError:v5];
  }
}

- (int)dataLink
{
  return self->_dataLink;
}

- (int64_t)transport
{
  return self->_transport;
}

- (SidecarService)service
{
  return self->_service;
}

- (int64_t)handle
{
  return self->_handle;
}

- (SidecarDevice)device
{
  return self->_device;
}

- (id)description
{
  v9[2] = *MEMORY[0x263EF8340];
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uuid = self->_uuid;
  v9[0] = 0;
  v9[1] = 0;
  [(NSUUID *)uuid getUUIDBytes:v9];
  uint64_t v7 = [v3 stringWithFormat:@"%@<%lX>", v5, bswap32(v9[0])];

  return v7;
}

- (void)dealloc
{
  int64_t handle = self->_handle;
  if (*((unsigned char *)self + 64))
  {
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __SidecarSessionRemoveFromRemoteMapTable_block_invoke;
    __int16 v14 = &__block_descriptor_40_e25_v16__0__SidecarMapTable_8l;
    int64_t v15 = handle;
    v4 = &__SidecarSessionRemoteMapTable;
    id v5 = SidecarMapTableCreateStrong;
  }
  else
  {
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __SidecarSessionRemoveFromLocalMapTable_block_invoke;
    __int16 v14 = &__block_descriptor_40_e25_v16__0__SidecarMapTable_8l;
    int64_t v15 = handle;
    v4 = &__SidecarSessionLocalMapTable;
    id v5 = SidecarMapTableCreateWeak;
  }
  SidecarSessionWithMapTable((void (*)(void))v5, v4, &v11);
  uint64_t v6 = atomic_load((unint64_t *)&self->_state);
  if (v6 >= 1)
  {
    uint64_t v7 = [(SidecarSession *)self uuid];
    id v8 = SidecarQueue();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __25__SidecarSession_dealloc__block_invoke;
    block[3] = &unk_2649C64F0;
    block[4] = v7;
    dispatch_async(v8, block);
  }
  v9.receiver = self;
  v9.super_class = (Class)SidecarSession;
  [(SidecarSession *)&v9 dealloc];
}

void __25__SidecarSession_dealloc__block_invoke(uint64_t a1)
{
  SidecarRelayProxyAsync(0, &__block_literal_global_49);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 relaySessionDealloc:*(void *)(a1 + 32) completion:&__block_literal_global_49];
}

void __25__SidecarSession_dealloc__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    id v3 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    if (v3)
    {
      log = v3;
      BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
      id v3 = log;
      if (v4)
      {
        id v5 = [v2 domain];
        uint64_t v6 = [v2 code];
        uint64_t v7 = [v2 localizedDescription];
        *(_DWORD *)buf = 138543875;
        uint64_t v10 = v5;
        __int16 v11 = 2048;
        uint64_t v12 = v6;
        __int16 v13 = 2113;
        __int16 v14 = v7;
        _os_log_impl(&dword_22D954000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

        id v3 = log;
      }
    }
  }
}

- (SidecarSession)initWithService:(id)a3 device:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SidecarSession;
  objc_super v9 = [(SidecarSession *)&v18 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a4);
    objc_storeStrong((id *)&v10->_service, a3);
    __int16 v11 = v10;
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__686;
    v24 = __Block_byref_object_dispose__687;
    id v25 = 0;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __SidecarSessionAddToLocalMapTable_block_invoke;
    v19[3] = &unk_2649C6320;
    v19[4] = v11;
    v19[5] = &v20;
    SidecarSessionWithMapTable((void (*)(void))SidecarMapTableCreateWeak, &__SidecarSessionLocalMapTable, v19);
    uint64_t v12 = (NSUUID *)(id)v21[5];
    _Block_object_dispose(&v20, 8);

    uint64_t v20 = 0;
    v21 = 0;
    [(NSUUID *)v12 getUUIDBytes:&v20];
    v11->_int64_t handle = bswap32(v20);
    *((unsigned char *)v11 + 64) &= ~1u;
    uint64_t v13 = dispatch_get_global_queue(21, 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v13;

    uuid = v11->_uuid;
    v11->_uuid = v12;
    uint64_t v16 = v12;

    SidecarSessionSetState(v11, 0);
  }

  return v10;
}

- (SidecarSession)initWithRemote:(id)a3 device:(id)a4 dataLink:(int)a5 service:(id)a6 error:(id *)a7
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v32.receiver = self;
  v32.super_class = (Class)SidecarSession;
  uint64_t v16 = [(SidecarSession *)&v32 init];
  if (!v16)
  {
LABEL_8:
    v27 = v16;
    goto LABEL_12;
  }
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  [v13 getUUIDBytes:&v33];
  int64_t v17 = bswap32(v33);
  uint64_t v18 = +[SidecarService serviceWithIdentifier:v15];
  if (v18)
  {
    v19 = (SidecarService *)v18;
    objc_storeStrong((id *)&v16->_device, a4);
    service = v16->_service;
    v16->_service = v19;
    v21 = v19;

    v16->_dataLink = a5;
    v16->_int64_t handle = v17;
    *((unsigned char *)v16 + 64) |= 1u;
    uint64_t v22 = dispatch_get_global_queue(21, 0);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v22;

    uint64_t v24 = 3;
    if (a5 == 4) {
      uint64_t v24 = 1;
    }
    uint64_t v25 = 2;
    if ((a5 & 0xFFFFFFFE) != 8) {
      uint64_t v25 = v24;
    }
    v16->_transport = v25;
    objc_storeStrong((id *)&v16->_uuid, a3);
    SidecarSessionSetState(v16, 2);
    uint64_t v33 = MEMORY[0x263EF8330];
    uint64_t v34 = 3221225472;
    v35 = __SidecarSessionAddToRemoteMapTable_block_invoke;
    v36 = &unk_2649C62F8;
    v37 = v16;
    int64_t v38 = v17;
    uint64_t v26 = v16;
    SidecarSessionWithMapTable((void (*)(void))SidecarMapTableCreateStrong, &__SidecarSessionRemoteMapTable, &v33);

    goto LABEL_8;
  }
  v28 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"SidecarErrorDomain" code:-103 userInfo:0];
  v29 = v28;
  if (a7) {
    *a7 = v28;
  }
  v30 = SidecarRelayProxyAsync(0, &__block_literal_global_47);
  [v30 relaySessionClose:v17 error:v29 completion:&__block_literal_global_47];
  [v30 relaySessionDealloc:v13 completion:&__block_literal_global_47];

  v27 = 0;
LABEL_12:

  return v27;
}

void __63__SidecarSession_initWithRemote_device_dataLink_service_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    id v3 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    if (v3)
    {
      log = v3;
      BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
      id v3 = log;
      if (v4)
      {
        id v5 = [v2 domain];
        uint64_t v6 = [v2 code];
        id v7 = [v2 localizedDescription];
        *(_DWORD *)buf = 138543875;
        uint64_t v10 = v5;
        __int16 v11 = 2048;
        uint64_t v12 = v6;
        __int16 v13 = 2113;
        id v14 = v7;
        _os_log_impl(&dword_22D954000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

        id v3 = log;
      }
    }
  }
}

- (SidecarSession)init
{
  id v2 = NSString;
  id v3 = NSStringFromSelector(a2);
  BOOL v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v2 stringWithFormat:@"*** initialization method -[%@] not supported with class %@", v3, v5];

  id v7 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:v6 userInfo:0];
  objc_exception_throw(v7);
}

- (void)openStreamForType:(int64_t)a3 flags:(unint64_t)a4 identifier:(id)a5
{
  id v9 = a5;
  uint64_t v10 = SidecarQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__SidecarSession_SidecarStreamsInternal__openStreamForType_flags_identifier___block_invoke;
  block[3] = &unk_2649C66B8;
  SEL v14 = a2;
  int64_t v15 = a3;
  unint64_t v16 = a4;
  block[4] = self;
  id v13 = v9;
  id v11 = v9;
  dispatch_async(v10, block);
}

void __77__SidecarSession_SidecarStreamsInternal__openStreamForType_flags_identifier___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(v2 + 56);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __77__SidecarSession_SidecarStreamsInternal__openStreamForType_flags_identifier___block_invoke_2;
  v6[3] = &unk_2649C6690;
  uint64_t v4 = a1[6];
  v6[4] = v2;
  v6[5] = v4;
  id v5 = SidecarRelayProxyAsync(0, v6);
  [v5 relaySession:v3 connectStreamType:a1[7] flags:a1[8] identifier:a1[5]];
}

void __77__SidecarSession_SidecarStreamsInternal__openStreamForType_flags_identifier___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2) {
    SidecarCoreLogObjCAPIError(*(void **)(a1 + 32), *(const char **)(a1 + 40), a2);
  }
}

- (void)openStreamForType:(int64_t)a3 flags:(unint64_t)a4 identifier:(id)a5 processUniqueID:(unint64_t)a6 completion:(id)a7
{
  id v13 = a5;
  id v14 = a7;
  int64_t v15 = SidecarQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __104__SidecarSession_SidecarStreamsInternal__openStreamForType_flags_identifier_processUniqueID_completion___block_invoke;
  block[3] = &unk_2649C6668;
  id v20 = v14;
  SEL v21 = a2;
  int64_t v22 = a3;
  unint64_t v23 = a4;
  block[4] = self;
  id v19 = v13;
  unint64_t v24 = a6;
  id v16 = v13;
  id v17 = v14;
  dispatch_async(v15, block);
}

void __104__SidecarSession_SidecarStreamsInternal__openStreamForType_flags_identifier_processUniqueID_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 56);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __104__SidecarSession_SidecarStreamsInternal__openStreamForType_flags_identifier_processUniqueID_completion___block_invoke_2;
  v15[3] = &unk_2649C6570;
  v15[4] = v2;
  long long v11 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v11;
  long long v16 = v11;
  id v5 = SidecarRelayProxyAsync(0, v15);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 80);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __104__SidecarSession_SidecarStreamsInternal__openStreamForType_flags_identifier_processUniqueID_completion___block_invoke_3;
  v13[3] = &unk_2649C6640;
  uint64_t v9 = *(void *)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 48);
  id v10 = (id)v12;
  long long v14 = v12;
  [v5 relaySession:v3 connectStreamType:v6 flags:v7 identifier:v9 processUniqueID:v8 completion:v13];
}

void __104__SidecarSession_SidecarStreamsInternal__openStreamForType_flags_identifier_processUniqueID_completion___block_invoke_2(uint64_t a1, void *a2)
{
}

void __104__SidecarSession_SidecarStreamsInternal__openStreamForType_flags_identifier_processUniqueID_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
}

- (void)listenForStreamType:(int64_t)a3 flags:(unint64_t)a4 identifier:(id)a5
{
  id v9 = a5;
  id v10 = SidecarQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__SidecarSession_SidecarStreamsInternal__listenForStreamType_flags_identifier___block_invoke;
  block[3] = &unk_2649C66B8;
  SEL v14 = a2;
  int64_t v15 = a3;
  unint64_t v16 = a4;
  block[4] = self;
  id v13 = v9;
  id v11 = v9;
  dispatch_async(v10, block);
}

void __79__SidecarSession_SidecarStreamsInternal__listenForStreamType_flags_identifier___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(v2 + 56);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__SidecarSession_SidecarStreamsInternal__listenForStreamType_flags_identifier___block_invoke_2;
  v6[3] = &unk_2649C6690;
  uint64_t v4 = a1[6];
  v6[4] = v2;
  v6[5] = v4;
  id v5 = SidecarRelayProxyAsync(0, v6);
  [v5 relaySession:v3 listenStreamType:a1[7] flags:a1[8] identifier:a1[5]];
}

void __79__SidecarSession_SidecarStreamsInternal__listenForStreamType_flags_identifier___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2) {
    SidecarCoreLogObjCAPIError(*(void **)(a1 + 32), *(const char **)(a1 + 40), a2);
  }
}

- (void)listenForStreamType:(int64_t)a3 flags:(unint64_t)a4 identifier:(id)a5 processUniqueID:(unint64_t)a6 completion:(id)a7
{
  id v13 = a5;
  id v14 = a7;
  int64_t v15 = SidecarQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __106__SidecarSession_SidecarStreamsInternal__listenForStreamType_flags_identifier_processUniqueID_completion___block_invoke;
  block[3] = &unk_2649C6668;
  id v20 = v14;
  SEL v21 = a2;
  int64_t v22 = a3;
  unint64_t v23 = a4;
  block[4] = self;
  id v19 = v13;
  unint64_t v24 = a6;
  id v16 = v13;
  id v17 = v14;
  dispatch_async(v15, block);
}

void __106__SidecarSession_SidecarStreamsInternal__listenForStreamType_flags_identifier_processUniqueID_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 56);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __106__SidecarSession_SidecarStreamsInternal__listenForStreamType_flags_identifier_processUniqueID_completion___block_invoke_2;
  v15[3] = &unk_2649C6570;
  v15[4] = v2;
  long long v11 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v11;
  long long v16 = v11;
  id v5 = SidecarRelayProxyAsync(0, v15);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 80);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __106__SidecarSession_SidecarStreamsInternal__listenForStreamType_flags_identifier_processUniqueID_completion___block_invoke_3;
  v13[3] = &unk_2649C6640;
  uint64_t v9 = *(void *)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 48);
  id v10 = (id)v12;
  long long v14 = v12;
  [v5 relaySession:v3 listenStreamType:v6 flags:v7 identifier:v9 processUniqueID:v8 completion:v13];
}

void __106__SidecarSession_SidecarStreamsInternal__listenForStreamType_flags_identifier_processUniqueID_completion___block_invoke_2(uint64_t a1, void *a2)
{
}

void __106__SidecarSession_SidecarStreamsInternal__listenForStreamType_flags_identifier_processUniqueID_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
}

@end