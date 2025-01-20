@interface VCCompanionSyncSession
+ (int64_t)direction;
- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4;
- (NSSet)syncDataHandlers;
- (NSString)debugDescription;
- (OS_dispatch_queue)queue;
- (OS_os_transaction)transaction;
- (SYSession)session;
- (VCCompanionSyncSession)initWithSYSession:(id)a3 service:(id)a4 syncDataHandlers:(id)a5;
- (VCCompanionSyncSessionDelegate)delegate;
- (VCShortcutSyncService)service;
- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5;
- (void)resetDataStoreForSyncSession:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5;
- (void)syncSession:(id)a3 didEndWithError:(id)a4;
@end

@implementation VCCompanionSyncSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncDataHandlers, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSSet)syncDataHandlers
{
  return self->_syncDataHandlers;
}

- (VCShortcutSyncService)service
{
  return self->_service;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (SYSession)session
{
  return self->_session;
}

- (void)setDelegate:(id)a3
{
}

- (VCCompanionSyncSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VCCompanionSyncSessionDelegate *)WeakRetained;
}

- (void)resetDataStoreForSyncSession:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [(id)objc_opt_class() direction];
  v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  if (v7)
  {
    v8 = (void *)[MEMORY[0x1E4F1CA00] raise:v9 format:@"-[VCCompanionSyncSession resetDataStoreForSyncSession:completion:] must be overridden"];
    __break(1u);
  }
  [v8 raise:v9 format:@"-[VCCompanionSyncSession resetDataStoreForSyncSession:completion:] should not be invoked on an outgoing session"];
  __break(1u);
}

- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4
{
  id v4 = a3;
  BOOL result = [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"-[VCCompanionSyncSession resetDataStoreForSyncSession:completion:] should be called instead"];
  __break(1u);
  return result;
}

- (void)syncSession:(id)a3 didEndWithError:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(VCCompanionSyncSession *)self session];
  char v10 = [v7 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"VCCompanionSyncSession.m", 84, @"Unexpected session finishing: %@", v7 object file lineNumber description];
  }
  v11 = getWFWatchSyncLogObject();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v20 = "-[VCCompanionSyncSession syncSession:didEndWithError:]";
      __int16 v21 = 2114;
      id v22 = v7;
      __int16 v23 = 2114;
      id v24 = v8;
      v13 = "%s finished session %{public}@ with error %{public}@";
      v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 32;
LABEL_8:
      _os_log_impl(&dword_1C7D7E000, v14, v15, v13, buf, v16);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[VCCompanionSyncSession syncSession:didEndWithError:]";
    __int16 v21 = 2114;
    id v22 = v7;
    v13 = "%s finished session %{public}@";
    v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    uint32_t v16 = 22;
    goto LABEL_8;
  }

  v17 = [(VCCompanionSyncSession *)self delegate];
  [v17 companionSyncSession:self didFinishWithError:v8];
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  uint64_t v5 = [(id)objc_opt_class() direction];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  if (v5) {
    id v7 = @"-[VCCompanionSyncSession syncSession:applyChanges:completion:] must be overridden";
  }
  else {
    id v7 = @"-[VCCompanionSyncSession syncSession:applyChanges:completion:] should not be invoked on an outgoing session";
  }
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  [v8 raise:v6 format:v7];
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(id)objc_opt_class() direction];
  uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v10 = *MEMORY[0x1E4F1C3B8];
  if (v8)
  {
    uint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] raise:v10 format:@"-[VCCompanionSyncSession syncSession:enqueueChanges:error:] must be overridden"];
    __break(1u);
  }
  unsigned int result = [v9 raise:v10 format:@"-[VCCompanionSyncSession syncSession:enqueueChanges:error:] should not be invoked on an incoming session"];
  __break(1u);
  return result;
}

- (NSString)debugDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [(VCCompanionSyncSession *)self session];
  id v7 = [(VCCompanionSyncSession *)self session];
  uint64_t v8 = [v7 identifier];
  uint64_t v9 = [v3 stringWithFormat:@"<%@: %p SYSession=%@ id=%@>", v5, self, v6, v8];

  return (NSString *)v9;
}

- (VCCompanionSyncSession)initWithSYSession:(id)a3 service:(id)a4 syncDataHandlers:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_19:
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"VCCompanionSyncSession.m", 31, @"Invalid parameter not satisfying: %@", @"service" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_20;
  }
  v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, self, @"VCCompanionSyncSession.m", 30, @"Invalid parameter not satisfying: %@", @"session" object file lineNumber description];

  if (!v11) {
    goto LABEL_19;
  }
LABEL_3:
  if (v12)
  {
LABEL_4:
    v13 = v12;
    goto LABEL_5;
  }
LABEL_20:
  v33 = [MEMORY[0x1E4F28B00] currentHandler];
  [v33 handleFailureInMethod:a2, self, @"VCCompanionSyncSession.m", 32, @"Invalid parameter not satisfying: %@", @"syncDataHandlers" object file lineNumber description];

  v13 = 0;
LABEL_5:
  VCAssertUniqueMessageTypes(v13);
  v34.receiver = self;
  v34.super_class = (Class)VCCompanionSyncSession;
  v14 = [(VCCompanionSyncSession *)&v34 init];
  if (v14)
  {
    uint64_t v15 = [(id)objc_opt_class() direction];
    uint32_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_USER_INITIATED, 0);

    if (v15 == 1) {
      v18 = "com.apple.VCCompanionSyncSession.incoming";
    }
    else {
      v18 = "com.apple.VCCompanionSyncSession.outgoing";
    }
    if (v15 == 1) {
      v19 = @"VCCompanionSyncSession.incoming";
    }
    else {
      v19 = @"VCCompanionSyncSession.outgoing";
    }
    dispatch_queue_t v20 = dispatch_queue_create(v18, v17);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v20;

    uint64_t v22 = VCOSTransactionWithName((uint64_t)v19);
    transaction = v14->_transaction;
    v14->_transaction = (OS_os_transaction *)v22;

    objc_storeStrong((id *)&v14->_session, a3);
    [(SYSession *)v14->_session setDelegate:v14];
    [(SYSession *)v14->_session setTargetQueue:v14->_queue];
    id v24 = objc_alloc_init(VCCompanionSyncSerializer);
    [(SYSession *)v14->_session setSerializer:v24];

    [(SYSession *)v14->_session setMaxConcurrentMessages:15];
    objc_storeStrong((id *)&v14->_service, a4);
    uint64_t v25 = [v12 copy];
    syncDataHandlers = v14->_syncDataHandlers;
    v14->_syncDataHandlers = (NSSet *)v25;

    v27 = getWFWatchSyncLogObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = @"outgoing";
      *(_DWORD *)buf = 136315906;
      v36 = "-[VCCompanionSyncSession initWithSYSession:service:syncDataHandlers:]";
      __int16 v37 = 2114;
      v38 = v14;
      if (v15 == 1) {
        v28 = @"incoming";
      }
      __int16 v39 = 2114;
      v40 = v28;
      __int16 v41 = 2114;
      id v42 = v10;
      _os_log_impl(&dword_1C7D7E000, v27, OS_LOG_TYPE_DEFAULT, "%s %{public}@ %{public}@ session created with SYSession: %{public}@", buf, 0x2Au);
    }

    v29 = v14;
  }

  return v14;
}

+ (int64_t)direction
{
  int64_t result = [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"+[VCCompanionSyncSession sessionType] must be overridden"];
  __break(1u);
  return result;
}

@end