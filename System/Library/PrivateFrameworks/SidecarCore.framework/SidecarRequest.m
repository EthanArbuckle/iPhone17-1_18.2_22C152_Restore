@interface SidecarRequest
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)didStart;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (NSArray)devices;
- (NSArray)items;
- (NSData)data;
- (NSError)error;
- (NSProgress)progress;
- (NSString)description;
- (NSString)localizedDescription;
- (NSString)localizedItemName;
- (NSString)uniformTypeIdentifier;
- (NSUUID)uuid;
- (SidecarDevice)device;
- (SidecarMessage)message;
- (SidecarRequest)initWithService:(id)a3 device:(id)a4;
- (SidecarRequest)initWithSession:(id)a3 message:(id)a4;
- (SidecarRequestDelegate)delegate;
- (SidecarService)service;
- (SidecarSession)session;
- (double)timeAccept;
- (double)timeFinish;
- (double)timeStart;
- (double)timeTransfer;
- (id)sessionForDevice:(id)a3;
- (void)_registerStreamListeners;
- (void)_sendMessage:(id)a3;
- (void)_willConnect;
- (void)cancel;
- (void)dealloc;
- (void)listenForStreamType:(int64_t)a3 flags:(unint64_t)a4 identifier:(id)a5;
- (void)listenForStreamType:(int64_t)a3 flags:(unint64_t)a4 identifier:(id)a5 processUniqueID:(unint64_t)a6 completion:(id)a7;
- (void)listenForStreamType:(int64_t)a3 identifier:(id)a4 completion:(id)a5;
- (void)listenForStreamType:(int64_t)a3 identifier:(id)a4 processUniqueID:(unint64_t)a5 completion:(id)a6;
- (void)openStreamForType:(int64_t)a3 flags:(unint64_t)a4 identifier:(id)a5;
- (void)openStreamForType:(int64_t)a3 flags:(unint64_t)a4 identifier:(id)a5 processUniqueID:(unint64_t)a6 completion:(id)a7;
- (void)openStreamForType:(int64_t)a3 identifier:(id)a4 completion:(id)a5;
- (void)openStreamForType:(int64_t)a3 identifier:(id)a4 processUniqueID:(unint64_t)a5 completion:(id)a6;
- (void)sendItems:(id)a3;
- (void)sendItems:(id)a3 complete:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setDevices:(id)a3;
- (void)setError:(id)a3;
- (void)setItems:(id)a3;
- (void)setTimeAccept:(double)a3;
- (void)setTimeFinish:(double)a3;
- (void)setTimeStart:(double)a3;
- (void)setTimeTransfer:(double)a3;
- (void)sidecarSession:(id)a3 closedWithError:(id)a4;
- (void)sidecarSession:(id)a3 receivedMessage:(id)a4;
- (void)sidecarSessionStarted:(id)a3;
- (void)sidecarTransfer:(id)a3 didComplete:(id)a4;
- (void)sidecarTransfer:(id)a3 receivedItems:(id)a4 messageType:(int64_t)a5;
- (void)start;
- (void)startWithTransport:(int64_t)a3;
- (void)startWithTransport:(int64_t)a3 reconnectToRequest:(id)a4;
@end

@implementation SidecarRequest

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"cancelled", @"data", @"devices", @"error", @"finished", @"items", 0);
  if ([v5 containsObject:v4])
  {
    unsigned __int8 v6 = 0;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___SidecarRequest;
    unsigned __int8 v6 = objc_msgSendSuper2(&v8, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_sendTransfers, 0);
  objc_storeStrong((id *)&self->_transferReceiver, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_sessionZombie, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_devices_deprecated, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 152, 1);
}

- (void)setTimeFinish:(double)a3
{
  self->_timeFinish = a3;
}

- (double)timeFinish
{
  return self->_timeFinish;
}

- (void)setTimeTransfer:(double)a3
{
  self->_timeTransfer = a3;
}

- (double)timeTransfer
{
  return self->_timeTransfer;
}

- (void)setTimeAccept:(double)a3
{
  self->_timeAccept = a3;
}

- (double)timeAccept
{
  return self->_timeAccept;
}

- (void)setTimeStart:(double)a3
{
  self->_timeStart = a3;
}

- (double)timeStart
{
  return self->_timeStart;
}

- (SidecarMessage)message
{
  return self->_message;
}

- (void)setDelegate:(id)a3
{
}

- (SidecarRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SidecarRequestDelegate *)WeakRetained;
}

- (id)sessionForDevice:(id)a3
{
  id v4 = a3;
  v5 = [(SidecarRequest *)self session];
  id v6 = [v5 device];

  if (v6 == v4) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (void)sidecarSession:(id)a3 closedWithError:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(SidecarRequest *)self session];

  if (v8 == v6)
  {
    SidecarRequestFinish(self, v7);
  }
  else
  {
    v9 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    v10 = v9;
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = v6[7];
      int v12 = 134217984;
      uint64_t v13 = v11;
      _os_log_impl(&dword_22D954000, v10, OS_LOG_TYPE_ERROR, "unexpected session[%lX]", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)sidecarSession:(id)a3 receivedMessage:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t Type = SidecarMessageGetType(v7);
  if ((unint64_t)(Type - 1) >= 4)
  {
    id v9 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"SidecarErrorDomain" code:-1010 userInfo:0];
    if (v9)
    {
      v18 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
      v19 = v18;
      if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v20 = [v9 domain];
        uint64_t v21 = [v9 code];
        v22 = [v9 localizedDescription];
        *(_DWORD *)buf = 138543875;
        *(void *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v21;
        *(_WORD *)&buf[22] = 2113;
        v30 = v22;
        _os_log_impl(&dword_22D954000, v19, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);
      }
    }

    [(SidecarRequest *)self setError:v9];
  }
  else
  {
    if (Type == 4)
    {
      self->_timeTransfer = SidecarAbsoluteTime();
    }
    else if (Type == 2)
    {
      self->_timeAccept = SidecarAbsoluteTime();
      goto LABEL_10;
    }
    if (SidecarMessageGetTransferID(v7))
    {
      v10 = self;
      v24 = &v23;
      uint64_t v25 = 0x3032000000;
      v26 = __Block_byref_object_copy__118;
      v27 = __Block_byref_object_dispose__119;
      id v28 = 0;
      uint64_t v11 = [(SidecarRequest *)v10 uuid];
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      [v11 getUUIDBytes:buf];
      uint64_t v12 = buf[0];
      uint64_t v13 = buf[1];
      uint64_t v14 = buf[2];
      uint64_t v15 = buf[3];

      v16 = [(SidecarRequest *)v10 session];
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __SidecarRequestEnsureTransferReceiver_block_invoke;
      v30 = &unk_2649C5F90;
      v31 = v10;
      v32 = v16;
      v33 = &v23;
      uint64_t v34 = (v12 << 24) | (v13 << 16) | (v14 << 8) | v15;
      SidecarTransferLocked((os_unfair_lock_s *)v10, buf);
      id v17 = (id)v24[5];

      _Block_object_dispose(&v23, 8);
      [v17 handleMessage:v7];
    }
  }
LABEL_10:
}

- (void)sidecarSessionStarted:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SidecarRequest *)self session];

  if (v5 == v4)
  {
    [(SidecarRequest *)self _willConnect];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __40__SidecarRequest_sidecarSessionStarted___block_invoke;
    v8[3] = &unk_2649C64F0;
    v8[4] = self;
    SidecarTransferLocked((os_unfair_lock_s *)self, v8);
  }
  else
  {
    id v6 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    id v7 = v6;
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v4;
      _os_log_impl(&dword_22D954000, v7, OS_LOG_TYPE_ERROR, "unexpected session %{public}@", buf, 0xCu);
    }
  }
}

void __40__SidecarRequest_sidecarSessionStarted___block_invoke(uint64_t a1)
{
  v2 = 0;
  uint64_t v25 = *MEMORY[0x263EF8340];
  while (1)
  {
    id v3 = *(id *)(a1 + 32);
    AssociatedObject = (void **)objc_getAssociatedObject(v3, SidecarRequestTransferEnqueue);
    if (AssociatedObject)
    {
      id v5 = AssociatedObject;
      id v6 = (void **)*AssociatedObject;
      if (!v6) {
        goto LABEL_19;
      }
      objc_super v8 = *v6;
      id v7 = v6[1];
      void *v5 = v7;
      if (!v7) {
        v5[1] = v5;
      }
      free(v6);
      if (!*v5) {
        _SidecarAssociatedQueueDealloc(v3, SidecarRequestTransferEnqueue, v5);
      }
    }
    else
    {
      objc_super v8 = 0;
    }

    if (!v8) {
      break;
    }
    id v9 = v8;
    v2 = v9;
    int add = atomic_fetch_add(v9 + 10, 0xFFFFFFFF);
    if (add == 1)
    {
      uint64_t v11 = v9;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v22 = __Block_byref_object_copy__64;
      uint64_t v23 = __Block_byref_object_dispose__65;
      id v24 = 0;
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __SidecarTransferDequeueMessages_block_invoke;
      v20[3] = &unk_2649C5EC8;
      v20[4] = v11;
      v20[5] = buf;
      SidecarTransferLocked(v11, v20);
      uint64_t v12 = *(void *)(*(void *)&buf[8] + 40);
      if (v12) {
        (*(void (**)(void))(v12 + 16))();
      }
      _Block_object_dispose(buf, 8);
    }
    else if (add <= 0)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
  }
  uint64_t v13 = (unint64_t *)(*(void *)(a1 + 32) + 112);
  uint64_t v14 = atomic_load(v13);
  if (v14 <= 1)
  {
    uint64_t v15 = v14;
    atomic_compare_exchange_strong((atomic_ullong *volatile)v13, (unint64_t *)&v15, 2uLL);
    if (v15 == v14) {
      return;
    }
  }
LABEL_20:
  v16 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
  id v17 = v16;
  if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    unint64_t v19 = atomic_load((unint64_t *)(v18 + 112));
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v18;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v19;
    _os_log_impl(&dword_22D954000, v17, OS_LOG_TYPE_ERROR, "%{public}@: set state failed (%ld)", buf, 0x16u);
  }
}

- (void)_willConnect
{
  v8[2] = *MEMORY[0x263EF8340];
  [(SidecarRequest *)self _registerStreamListeners];
  id v3 = [(SidecarRequest *)self service];
  id v4 = [v3 mutableRequestMessage];
  id v5 = [(SidecarRequest *)self uuid];
  v8[0] = 0;
  v8[1] = 0;
  [v5 getUUIDBytes:v8];
  uint64_t v6 = bswap32(v8[0]);

  SidecarMessageSetRequestID(v4, v6);
  id v7 = [(SidecarRequest *)self session];
  SidecarRequestSendMessage(self, v7, (uint64_t)v4);
}

- (void)sidecarTransfer:(id)a3 receivedItems:(id)a4 messageType:(int64_t)a5
{
  id v7 = a4;
  id v9 = v7;
  if (a5 == 4)
  {
    [(SidecarRequest *)self setItems:v7];
  }
  else
  {
    objc_super v8 = [(SidecarRequest *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v8 sidecarRequest:self receivedItems:v9];
    }
  }
}

- (void)sidecarTransfer:(id)a3 didComplete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  id v9 = v6;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__118;
  id v17 = __Block_byref_object_dispose__119;
  id v18 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __SidecarRequestTransferCompleted_block_invoke;
  v12[3] = &unk_2649C5F68;
  v12[4] = v8;
  v12[5] = v9;
  v12[6] = &v13;
  SidecarTransferLocked((os_unfair_lock_s *)v8, v12);
  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  if (!v10 || (uint64_t v11 = [v10 type], v7) || v11 == 4) {
    SidecarRequestFinish(v8, v7);
  }
}

- (void)_sendMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(SidecarRequest *)self session];
  SidecarRequestSendMessage(self, v5, (uint64_t)v4);
}

- (void)sendItems:(id)a3
{
}

- (void)sendItems:(id)a3 complete:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = self;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__118;
  uint64_t v21 = __Block_byref_object_dispose__119;
  id v22 = 0;
  objc_super v8 = [(SidecarRequest *)v7 session];
  id v9 = [(SidecarRequest *)v7 uuid];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __SidecarRequestCreateSendTransfer_block_invoke;
  v16[3] = &unk_2649C5F40;
  v16[4] = v7;
  v16[5] = v9;
  v16[6] = v8;
  v16[7] = &v17;
  SidecarTransferLocked((os_unfair_lock_s *)v7, v16);
  if (v4) {
    uint64_t v10 = 4;
  }
  else {
    uint64_t v10 = 3;
  }
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __37__SidecarRequest_sendItems_complete___block_invoke;
  v13[3] = &unk_2649C5EF0;
  v13[4] = v7;
  v13[5] = v11;
  id v14 = v6;
  uint64_t v15 = v10;
  id v12 = v6;
  SidecarTransferLocked((os_unfair_lock_s *)v7, v13);
}

atomic_uint *__37__SidecarRequest_sendItems_complete___block_invoke(uint64_t a1)
{
  uint64_t v2 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 112));
  if (v2 <= 1)
  {
    result = (atomic_uint *)*(id *)(a1 + 40);
    if (atomic_fetch_add(result + 10, 1u) == 0x7FFFFFFF)
    {
      __break(1u);
      return result;
    }

    SidecarRequestTransferEnqueue(*(void **)(a1 + 32), *(void **)(a1 + 40));
  }
  BOOL v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);

  return (atomic_uint *)[v4 sendItems:v5 messageType:v6];
}

- (void)startWithTransport:(int64_t)a3 reconnectToRequest:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a4;
  objc_super v8 = (os_unfair_lock_s *)&v22;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__118;
  v26 = __Block_byref_object_dispose__119;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__118;
  v20 = __Block_byref_object_dispose__119;
  id v21 = 0;
  if ((SidecarRequestSetState(self, 1) & 1) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __56__SidecarRequest_startWithTransport_reconnectToRequest___block_invoke;
  v15[3] = &unk_2649C5EC8;
  v15[4] = self;
  v15[5] = &v22;
  SidecarTransferLocked((os_unfair_lock_s *)self, v15);
  if (v7)
  {
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    id v11 = __56__SidecarRequest_startWithTransport_reconnectToRequest___block_invoke_2;
    id v12 = &unk_2649C5EC8;
    id v14 = &v16;
    objc_super v8 = (os_unfair_lock_s *)v7;
    uint64_t v13 = v8;
    SidecarTransferLocked(v8, &v9);
    if (v17[5])
    {
LABEL_6:

      goto LABEL_7;
    }
    BOOL v4 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    if (!v4)
    {
LABEL_5:

      goto LABEL_6;
    }
LABEL_9:
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v29 = self;
      __int16 v30 = 2114;
      v31 = v8;
      _os_log_impl(&dword_22D954000, v4, OS_LOG_TYPE_ERROR, "%{public}@ reconnecting to %{public}@ with nil session", buf, 0x16u);
    }
    goto LABEL_5;
  }
LABEL_7:
  objc_msgSend((id)v23[5], "connectWithTransport:reconnectToSession:", a3, v17[5], v9, v10, v11, v12);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

void __56__SidecarRequest_startWithTransport_reconnectToRequest___block_invoke(uint64_t a1)
{
  *(double *)(*(void *)(a1 + 32) + 120) = SidecarAbsoluteTime();
}

void __56__SidecarRequest_startWithTransport_reconnectToRequest___block_invoke_2(uint64_t a1)
{
}

- (void)startWithTransport:(int64_t)a3
{
}

- (void)start
{
}

- (SidecarSession)session
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  objc_super v8 = __Block_byref_object_copy__118;
  uint64_t v9 = __Block_byref_object_dispose__119;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __25__SidecarRequest_session__block_invoke;
  v4[3] = &unk_2649C5EC8;
  v4[4] = self;
  v4[5] = &v5;
  SidecarTransferLocked((os_unfair_lock_s *)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SidecarSession *)v2;
}

void __25__SidecarRequest_session__block_invoke(uint64_t a1)
{
}

- (void)cancel
{
  id v3 = objc_alloc(MEMORY[0x263F087E8]);
  id v4 = (id)[v3 initWithDomain:*MEMORY[0x263F07F70] code:3072 userInfo:0];
  [(SidecarRequest *)self setError:v4];
}

- (NSString)localizedItemName
{
  return (NSString *)&stru_26E18A930;
}

- (NSString)localizedDescription
{
  return (NSString *)&stru_26E18A930;
}

- (void)setError:(id)a3
{
  if (a3) {
    SidecarRequestFinish(self, a3);
  }
}

- (NSError)error
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  objc_super v8 = __Block_byref_object_copy__118;
  uint64_t v9 = __Block_byref_object_dispose__119;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __23__SidecarRequest_error__block_invoke;
  v4[3] = &unk_2649C5EC8;
  v4[4] = self;
  v4[5] = &v5;
  SidecarTransferLocked((os_unfair_lock_s *)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSError *)v2;
}

void __23__SidecarRequest_error__block_invoke(uint64_t a1)
{
}

- (NSString)uniformTypeIdentifier
{
  id v2 = [(SidecarRequest *)self items];
  id v3 = [v2 firstObject];
  id v4 = [v3 type];

  return (NSString *)v4;
}

- (NSData)data
{
  id v2 = [(SidecarRequest *)self items];
  id v3 = [v2 firstObject];
  id v4 = [v3 data];

  return (NSData *)v4;
}

- (void)setItems:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[2] = __27__SidecarRequest_setItems___block_invoke;
  v7[3] = &unk_2649C6598;
  v7[4] = self;
  id v8 = v4;
  uint64_t v5 = self;
  id v6 = v4;
  [(SidecarRequest *)v5 willChangeValueForKey:@"items", v7[0], 3221225472];
  __27__SidecarRequest_setItems___block_invoke((uint64_t)v7);
  [(SidecarRequest *)v5 didChangeValueForKey:@"items"];
}

void __27__SidecarRequest_setItems___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __27__SidecarRequest_setItems___block_invoke_2;
  v3[3] = &unk_2649C6598;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  id v2 = v1;
  objc_msgSend(v2, "willChangeValueForKey:", @"data", v3[0], 3221225472);
  __27__SidecarRequest_setItems___block_invoke_2((uint64_t)v3);
  [v2 didChangeValueForKey:@"data"];
}

void __27__SidecarRequest_setItems___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __27__SidecarRequest_setItems___block_invoke_3;
  v3[3] = &unk_2649C6598;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  id v2 = v1;
  objc_msgSend(v2, "willChangeValueForKey:", @"uniformTypeIdentifier", v3[0], 3221225472);
  __27__SidecarRequest_setItems___block_invoke_3((uint64_t)v3);
  [v2 didChangeValueForKey:@"uniformTypeIdentifier"];
}

void __27__SidecarRequest_setItems___block_invoke_3(uint64_t a1)
{
  v1 = *(os_unfair_lock_s **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __27__SidecarRequest_setItems___block_invoke_4;
  v2[3] = &unk_2649C6598;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  SidecarTransferLocked(v1, v2);
}

void __27__SidecarRequest_setItems___block_invoke_4(uint64_t a1)
{
}

- (NSArray)items
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__118;
  uint64_t v9 = __Block_byref_object_dispose__119;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __23__SidecarRequest_items__block_invoke;
  v4[3] = &unk_2649C5EC8;
  v4[4] = self;
  v4[5] = &v5;
  SidecarTransferLocked((os_unfair_lock_s *)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __23__SidecarRequest_items__block_invoke(uint64_t a1)
{
}

- (void)setDevices:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SidecarRequest *)self devices];
  char v6 = [v4 isEqualToArray:v5];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = (void *)[v4 copy];

    v9[0] = MEMORY[0x263EF8330];
    v9[2] = __29__SidecarRequest_setDevices___block_invoke;
    v9[3] = &unk_2649C6598;
    v9[4] = self;
    id v4 = v7;
    id v10 = v4;
    id v8 = self;
    [(SidecarRequest *)v8 willChangeValueForKey:@"devices", v9[0], 3221225472];
    __29__SidecarRequest_setDevices___block_invoke((uint64_t)v9);
    [(SidecarRequest *)v8 didChangeValueForKey:@"devices"];
  }
}

void __29__SidecarRequest_setDevices___block_invoke(uint64_t a1)
{
  v1 = *(os_unfair_lock_s **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __29__SidecarRequest_setDevices___block_invoke_2;
  v2[3] = &unk_2649C6598;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  SidecarTransferLocked(v1, v2);
}

void __29__SidecarRequest_setDevices___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) firstObject];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  if ((unint64_t)[*(id *)(a1 + 40) count] < 2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *(void **)(a1 + 40);
  }
  char v6 = (id *)(*(void *)(a1 + 32) + 24);

  objc_storeStrong(v6, v5);
}

- (NSArray)devices
{
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__118;
  uint64_t v9 = __Block_byref_object_dispose__119;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __25__SidecarRequest_devices__block_invoke;
  v4[3] = &unk_2649C5EC8;
  v4[4] = self;
  v4[5] = &v5;
  SidecarTransferLocked((os_unfair_lock_s *)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __25__SidecarRequest_devices__block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  if (v3)
  {
    int v4 = 0;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 32);
    if (v5)
    {
      v6[0] = v5;
      int v4 = 1;
      uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
    }
    else
    {
      int v4 = 0;
      uint64_t v3 = (void *)MEMORY[0x263EFFA68];
    }
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
  if (v4) {
}
  }

- (SidecarDevice)device
{
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__118;
  uint64_t v9 = __Block_byref_object_dispose__119;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __24__SidecarRequest_device__block_invoke;
  v4[3] = &unk_2649C5EC8;
  v4[4] = self;
  v4[5] = &v5;
  SidecarTransferLocked((os_unfair_lock_s *)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SidecarDevice *)v2;
}

void __24__SidecarRequest_device__block_invoke(uint64_t a1)
{
}

- (BOOL)isFinished
{
  int64_t v2 = atomic_load((unint64_t *)&self->_state);
  return v2 > 3;
}

- (BOOL)isCancelled
{
  unint64_t v2 = atomic_load((unint64_t *)&self->_state);
  return v2 == 5;
}

- (BOOL)didStart
{
  int64_t v2 = atomic_load((unint64_t *)&self->_state);
  return v2 > 0;
}

- (SidecarService)service
{
  return self->_service;
}

- (NSProgress)progress
{
  progress = self->_progress;
  if (!progress)
  {
    int v4 = [MEMORY[0x263F08AB8] discreteProgressWithTotalUnitCount:-1];
    uint64_t v5 = self->_progress;
    self->_progress = v4;

    [(NSProgress *)self->_progress setCancellable:0];
    [(NSProgress *)self->_progress setPausable:0];
    progress = self->_progress;
  }

  return progress;
}

- (NSString)description
{
  v9[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = NSString;
  int v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  char v6 = [(SidecarRequest *)self uuid];
  v9[0] = 0;
  v9[1] = 0;
  [v6 getUUIDBytes:v9];
  uint64_t v7 = [v3 stringWithFormat:@"%@<%lX>", v5, bswap32(v9[0])];

  return (NSString *)v7;
}

- (void)dealloc
{
  SidecarRequestDisconnectSession(self);
  v3.receiver = self;
  v3.super_class = (Class)SidecarRequest;
  [(SidecarRequest *)&v3 dealloc];
}

- (SidecarRequest)initWithSession:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SidecarRequest;
  id v8 = [(SidecarRequest *)&v15 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __42__SidecarRequest_initWithSession_message___block_invoke;
    v11[3] = &unk_2649C5EA0;
    id v12 = v8;
    id v13 = v6;
    id v14 = v7;
    SidecarTransferLocked((os_unfair_lock_s *)v12, v11);
  }
  return v9;
}

void __42__SidecarRequest_initWithSession_message___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 40) device];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 48));
  uint64_t v5 = [*(id *)(a1 + 40) service];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v5;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  int RequestID = SidecarMessageGetRequestID(*(void **)(a1 + 48));
  v12[0] = HIBYTE(RequestID);
  v12[1] = BYTE2(RequestID);
  v12[2] = BYTE1(RequestID);
  v12[3] = RequestID;
  uint64_t v13 = -1;
  int v14 = -1;
  uint64_t v9 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v12];
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 152);
  *(void *)(v10 + 152) = v9;
}

- (SidecarRequest)initWithService:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SidecarRequest;
  id v8 = [(SidecarRequest *)&v15 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __41__SidecarRequest_initWithService_device___block_invoke;
    v11[3] = &unk_2649C5EA0;
    id v12 = v8;
    id v13 = v7;
    id v14 = v6;
    SidecarTransferLocked((os_unfair_lock_s *)v12, v11);
  }
  return v9;
}

void __41__SidecarRequest_initWithService_device___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), *(id *)(a1 + 48));
  uint64_t v2 = [[SidecarSession alloc] initWithService:*(void *)(a1 + 48) device:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  id v8 = v2;

  uint64_t v5 = [(SidecarSession *)v8 uuid];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 152);
  *(void *)(v6 + 152) = v5;

  [(SidecarSession *)v8 setDelegate:*(void *)(a1 + 32)];
}

- (void)_registerStreamListeners
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_getAssociatedObject(self, &_SidecarRequestStreamRegistrations);
  int v4 = v3;
  if (v3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
          uint64_t v10 = [(SidecarRequest *)self session];
          (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
    objc_setAssociatedObject(self, &_SidecarRequestStreamRegistrations, 0, (void *)0x301);
  }
}

- (void)openStreamForType:(int64_t)a3 flags:(unint64_t)a4 identifier:(id)a5 processUniqueID:(unint64_t)a6 completion:(id)a7
{
  id v17 = a5;
  long long v13 = (void (**)(id, void, void *))a7;
  long long v14 = [(SidecarRequest *)self session];
  objc_super v15 = v14;
  if (v14)
  {
    [v14 openStreamForType:a3 flags:a4 identifier:v17 processUniqueID:a6 completion:v13];
  }
  else
  {
    uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:@"SidecarErrorDomain" code:-1020 userInfo:0];
    SidecarCoreLogObjCAPIError(self, a2, v16);
    v13[2](v13, 0, v16);
  }
}

- (void)openStreamForType:(int64_t)a3 flags:(unint64_t)a4 identifier:(id)a5
{
  id v11 = a5;
  uint64_t v9 = [(SidecarRequest *)self session];
  if (!v9)
  {
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:@"SidecarErrorDomain" code:-1020 userInfo:0];
    SidecarCoreLogObjCAPIError(self, a2, v10);
  }
  [v9 openStreamForType:a3 flags:a4 identifier:v11];
}

- (void)openStreamForType:(int64_t)a3 identifier:(id)a4 processUniqueID:(unint64_t)a5 completion:(id)a6
{
}

- (void)openStreamForType:(int64_t)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(SidecarRequest *)self openStreamForType:a3 flags:0 identifier:v9 processUniqueID:SidecarGetProcessUniqueID() completion:v8];
}

- (void)listenForStreamType:(int64_t)a3 flags:(unint64_t)a4 identifier:(id)a5
{
  id v8 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__SidecarRequest_SidecarStreams__listenForStreamType_flags_identifier___block_invoke;
  v14[3] = &unk_2649C6618;
  int64_t v16 = a3;
  unint64_t v17 = a4;
  id v9 = v8;
  id v15 = v9;
  uint64_t v10 = (void (**)(void, void))MEMORY[0x230F8F310](v14);
  if ([(SidecarRequest *)self didStart])
  {
    id v11 = [(SidecarRequest *)self session];
    ((void (**)(void, id))v10)[2](v10, v11);
  }
  else
  {
    objc_getAssociatedObject(self, &_SidecarRequestStreamRegistrations);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
      objc_setAssociatedObject(self, &_SidecarRequestStreamRegistrations, v11, (void *)0x301);
    }
    long long v12 = (void *)[v10 copy];
    long long v13 = (void *)MEMORY[0x230F8F310]();
    [v11 addObject:v13];
  }
}

uint64_t __71__SidecarRequest_SidecarStreams__listenForStreamType_flags_identifier___block_invoke(void *a1, void *a2)
{
  return [a2 listenForStreamType:a1[5] flags:a1[6] identifier:a1[4]];
}

- (void)listenForStreamType:(int64_t)a3 flags:(unint64_t)a4 identifier:(id)a5 processUniqueID:(unint64_t)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __98__SidecarRequest_SidecarStreams__listenForStreamType_flags_identifier_processUniqueID_completion___block_invoke;
  v20[3] = &unk_2649C65F0;
  int64_t v23 = a3;
  unint64_t v24 = a4;
  id v14 = v12;
  id v21 = v14;
  unint64_t v25 = a6;
  id v15 = v13;
  id v22 = v15;
  int64_t v16 = (void (**)(void, void))MEMORY[0x230F8F310](v20);
  if ([(SidecarRequest *)self didStart])
  {
    id v17 = [(SidecarRequest *)self session];
    ((void (**)(void, id))v16)[2](v16, v17);
  }
  else
  {
    objc_getAssociatedObject(self, &_SidecarRequestStreamRegistrations);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
      objc_setAssociatedObject(self, &_SidecarRequestStreamRegistrations, v17, (void *)0x301);
    }
    uint64_t v18 = (void *)[v16 copy];
    uint64_t v19 = (void *)MEMORY[0x230F8F310]();
    [v17 addObject:v19];
  }
}

uint64_t __98__SidecarRequest_SidecarStreams__listenForStreamType_flags_identifier_processUniqueID_completion___block_invoke(void *a1, void *a2)
{
  return [a2 listenForStreamType:a1[6] flags:a1[7] identifier:a1[4] processUniqueID:a1[8] completion:a1[5]];
}

- (void)listenForStreamType:(int64_t)a3 identifier:(id)a4 processUniqueID:(unint64_t)a5 completion:(id)a6
{
}

- (void)listenForStreamType:(int64_t)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(SidecarRequest *)self listenForStreamType:a3 flags:0 identifier:v9 processUniqueID:SidecarGetProcessUniqueID() completion:v8];
}

@end