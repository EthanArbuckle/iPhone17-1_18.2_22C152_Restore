@interface PAAccessLogger
+ (id)sharedInstance;
+ (void)initialize;
- (BOOL)loggingEnabled;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (PAAccessLogger)initWithConnection:(id)a3 queue:(id)a4;
- (PAAccessLogger)initWithConnection:(id)a3 queue:(id)a4 enablementChangedNotificationName:(id)a5 options:(unint64_t)a6;
- (PAAccessLogger)initWithConnection:(id)a3 queue:(id)a4 forcingOptions:(unint64_t)a5 error:(id *)a6;
- (PAAccessLogger)initWithQueue:(id)a3;
- (PAAccessLoggerDelegate)delegate;
- (PACoalescingIntervalTracker)coalescingIntervalTracker;
- (ResyncStateResult)resyncState;
- (id)beginIntervalForAccess:(id)a3;
- (int64_t)maxRetryCount;
- (unint64_t)options;
- (void)dealloc;
- (void)endIntervalWithSlot:(id)a3 timestampAdjustment:(double)a4 accessCount:(int64_t)a5;
- (void)ensureEnablementChangedNotificationRegistered;
- (void)handleConnectionInterrupted;
- (void)handleConnectionInvalidated;
- (void)lockedInvalidateState;
- (void)lockedNotifyDidSetLoggingEnabled:(BOOL)a3;
- (void)log:(id)a3;
- (void)log:(id)a3 reason:(int64_t)a4;
- (void)notifyDidCoalesceAccess:(id)a3;
- (void)notifyDidLogAccess:(id)a3 failedWithError:(id)a4;
- (void)recordAssetIdentifiers:(id)a3 withVisibilityState:(int64_t)a4 accessEventCount:(unint64_t)a5 forSlot:(id)a6;
- (void)setCoalescingIntervalTracker:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLoggingEnabled:(BOOL)a3;
- (void)setMaxRetryCount:(int64_t)a3;
- (void)withLockedState:(id)a3;
@end

@implementation PAAccessLogger

void __85__PAAccessLogger_initWithConnection_queue_enablementChangedNotificationName_options___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleConnectionInterrupted];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance_instance_1;

  return v2;
}

- (void)log:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__PAAccessLogger_log___block_invoke;
  block[3] = &unk_1E5D71018;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v5 = v4;
  dispatch_block_t v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, block);
  dispatch_async((dispatch_queue_t)self->_queue, v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)beginIntervalForAccess:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (self->_connection)
  {
    dispatch_block_t v6 = [v4 asIntervalBeginEvent];
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__0;
    v34 = __Block_byref_object_dispose__0;
    id v35 = 0;
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__0;
    v28 = __Block_byref_object_dispose__0;
    id v29 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __41__PAAccessLogger_beginIntervalForAccess___block_invoke;
    v19[3] = &unk_1E5D71040;
    id v7 = v6;
    v22 = &v30;
    v23 = &v24;
    id v20 = v7;
    v21 = self;
    [(PAAccessLogger *)self withLockedState:v19];
    if (v31[5])
    {
      -[PAAccessLogger notifyDidLogAccess:failedWithError:](self, "notifyDidLogAccess:failedWithError:", v7);
      id v8 = +[PAAccessInterval placeholderAccessInterval];
    }
    else
    {
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      v15 = __41__PAAccessLogger_beginIntervalForAccess___block_invoke_28;
      v16 = &unk_1E5D70FF0;
      v17 = self;
      id v18 = v7;
      _os_activity_initiate(&dword_1A8FA5000, "PAAccessLogger -beginIntervalForAccess:", OS_ACTIVITY_FLAG_DEFAULT, &v13);

      v10 = (id)logger_3;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = objc_msgSend((id)v25[5], "slot", v13, v14, v15, v16, v17);
        [(PAAccessLogger *)v11 beginIntervalForAccess:v10];
      }

      id v8 = (id)v25[5];
    }
    id v9 = v8;

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    id v9 = +[PAAccessInterval placeholderAccessInterval];
  }

  return v9;
}

void __22__PAAccessLogger_log___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained connection];

  if (v3)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__0;
    v17 = __Block_byref_object_dispose__0;
    id v18 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __22__PAAccessLogger_log___block_invoke_22;
    v10[3] = &unk_1E5D70FC8;
    v12 = &v13;
    id v11 = *(id *)(a1 + 32);
    [WeakRetained withLockedState:v10];
    if (v14[5])
    {
      objc_msgSend(WeakRetained, "notifyDidLogAccess:failedWithError:", *(void *)(a1 + 32));
    }
    else
    {
      dispatch_block_t v6 = [WeakRetained coalescingIntervalTracker];

      if (v6)
      {
        id v7 = [WeakRetained coalescingIntervalTracker];
        [v7 coalesce:*(void *)(a1 + 32)];
      }
      else
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __22__PAAccessLogger_log___block_invoke_2;
        v8[3] = &unk_1E5D70FF0;
        v8[4] = WeakRetained;
        id v9 = *(id *)(a1 + 32);
        _os_activity_initiate(&dword_1A8FA5000, "PAAccessLogger -log:", OS_ACTIVITY_FLAG_DEFAULT, v8);
      }
    }

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PAErrorDomain" code:1 userInfo:0];
    [WeakRetained notifyDidLogAccess:v4 failedWithError:v5];
  }
}

- (void)withLockedState:(id)a3
{
  uint64_t v4 = (void (**)(id, PAAccessLoggerState *))a3;
  os_unfair_lock_lock(&self->_lock);
  v4[2](v4, self->_state);
  os_unfair_lock_unlock(&self->_lock);
}

void __22__PAAccessLogger_log___block_invoke_22(uint64_t a1, void *a2)
{
  id v10 = a2;
  if ([v10 loggingEnabled])
  {
    v3 = [v10 negativeAccessCache];
    uint64_t v4 = +[PAAccessMatcher negativeAccessCacheMatcherForAccess:*(void *)(a1 + 32)];
    uint64_t v5 = [v3 objectForKey:v4];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PAErrorDomain" code:2 userInfo:0];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    v3 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (BOOL)loggingEnabled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(PAAccessLoggerState *)v2->_state loggingEnabled];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)notifyDidLogAccess:(id)a3 failedWithError:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = logger_3;
  if (v7)
  {
    uint64_t v9 = (id)logger_3;
    id v10 = [v7 domain];
    int v11 = [v10 isEqualToString:@"PAErrorDomain"];

    if (v11 && (unint64_t v12 = [v7 code] - 1, v12 <= 0xF)) {
      os_log_type_t v13 = byte_1A8FCA080[v12];
    }
    else {
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    }
    if (os_log_type_enabled(v9, v13))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v6;
      __int16 v29 = 2114;
      id v30 = v7;
      _os_log_impl(&dword_1A8FA5000, v9, v13, "Failed to log access with error: access=%@, error=%{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)logger_3, OS_LOG_TYPE_DEBUG))
  {
    -[PAAccessLogger notifyDidLogAccess:failedWithError:]((uint64_t)v6, v8, v14, v15, v16, v17, v18, v19);
  }
  id v20 = [(PAAccessLogger *)self delegate];
  char v21 = objc_opt_respondsToSelector();

  if (v21)
  {
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__PAAccessLogger_notifyDidLogAccess_failedWithError___block_invoke;
    block[3] = &unk_1E5D71108;
    objc_copyWeak(&v26, (id *)buf);
    id v24 = v6;
    id v25 = v7;
    dispatch_async(queue, block);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
}

- (PAAccessLoggerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PAAccessLoggerDelegate *)WeakRetained;
}

- (PACoalescingIntervalTracker)coalescingIntervalTracker
{
  return (PACoalescingIntervalTracker *)objc_getProperty(self, a2, 72, 1);
}

- (void)notifyDidCoalesceAccess:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PAAccessLogger *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__PAAccessLogger_notifyDidCoalesceAccess___block_invoke;
    block[3] = &unk_1E5D71018;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    dispatch_async(queue, block);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)recordAssetIdentifiers:(id)a3 withVisibilityState:(int64_t)a4 accessEventCount:(unint64_t)a5 forSlot:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if ([v11 integerValue] >= 1 && objc_msgSend(v10, "count"))
  {
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x3032000000;
    id v26 = __Block_byref_object_copy__0;
    v27 = __Block_byref_object_dispose__0;
    id v28 = 0;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __86__PAAccessLogger_recordAssetIdentifiers_withVisibilityState_accessEventCount_forSlot___block_invoke;
    id v20 = &unk_1E5D70FC8;
    v22 = &v23;
    id v12 = v11;
    id v21 = v12;
    [(PAAccessLogger *)self withLockedState:&v17];
    if (v24[5])
    {
      if (objc_msgSend(v10, "count", v17, v18, v19, v20)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || ([(id)v24[5] tccService],
            os_log_type_t v13 = objc_claimAutoreleasedReturnValue(),
            char v14 = [v13 isEqual:*MEMORY[0x1E4FA9AA0]],
            v13,
            (v14 & 1) == 0))
      {
        uint64_t v15 = [(id)v24[5] asIntervalEventWithAssetIdentifiers:v10 visibilityState:a4 accessEventCount:a5];
        [(PAAccessLogger *)self log:v15 reason:0];
      }
    }
    else
    {
      uint64_t v16 = logger_3;
      if (os_log_type_enabled((os_log_t)logger_3, OS_LOG_TYPE_ERROR)) {
        -[PAAccessLogger recordAssetIdentifiers:withVisibilityState:accessEventCount:forSlot:]((uint64_t)v12, v16);
      }
    }

    _Block_object_dispose(&v23, 8);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PAAccessLogger)initWithConnection:(id)a3 queue:(id)a4 enablementChangedNotificationName:(id)a5 options:(unint64_t)a6
{
  id v10 = a3;
  dispatch_queue_t v11 = (dispatch_queue_t)a4;
  id v12 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PAAccessLogger;
  os_log_type_t v13 = [(PAAccessLogger *)&v27 init];
  if (v13)
  {
    if (!v10)
    {
      if (_os_feature_enabled_impl()) {
        id v10 = (id)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.privacyaccountingd" options:4096];
      }
      else {
        id v10 = 0;
      }
    }
    PARegisterUserInfoValueProviderForPAErrorDomain();
    if (!v11)
    {
      char v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v11 = dispatch_queue_create("com.apple.privacyaccounting.PAAccessLogger", v14);
    }
    objc_storeStrong((id *)&v13->_queue, v11);
    [v10 _setQueue:v13->_queue];
    uint64_t v15 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFF87D48];
    [v10 setRemoteObjectInterface:v15];
    objc_initWeak(&location, v13);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __85__PAAccessLogger_initWithConnection_queue_enablementChangedNotificationName_options___block_invoke;
    v24[3] = &unk_1E5D70E00;
    objc_copyWeak(&v25, &location);
    [v10 setInterruptionHandler:v24];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __85__PAAccessLogger_initWithConnection_queue_enablementChangedNotificationName_options___block_invoke_2;
    v22[3] = &unk_1E5D70E00;
    objc_copyWeak(&v23, &location);
    [v10 setInvalidationHandler:v22];
    objc_storeStrong((id *)&v13->_connection, v10);
    v13->_options = a6;
    v13->_lock._os_unfair_lock_opaque = 0;
    uint64_t v16 = objc_opt_new();
    state = v13->_state;
    v13->_state = (PAAccessLoggerState *)v16;

    objc_storeStrong((id *)&v13->_enablementChangedNotificationName, a5);
    v13->_enablementChangedNotificationToken = -1;
    v13->_maxRetryCount = 5;
    uint64_t v18 = [[PACoalescingIntervalTracker alloc] initWithLogger:v13];
    coalescingIntervalTracker = v13->_coalescingIntervalTracker;
    v13->_coalescingIntervalTracker = v18;

    [v10 resume];
    id v20 = logger_3;
    if (os_log_type_enabled((os_log_t)logger_3, OS_LOG_TYPE_DEBUG)) {
      -[PAAccessLogger initWithConnection:queue:enablementChangedNotificationName:options:]((uint64_t)v10, (uint64_t)v11, v20);
    }
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  return v13;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)lockedInvalidateState
{
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = self->_state;
  id v4 = (PAAccessLoggerState *)objc_opt_new();
  state = self->_state;
  self->_state = v4;

  [(PAAccessLoggerState *)self->_state setTopAccessIntervalSlot:[(PAAccessLoggerState *)v3 topAccessIntervalSlot]];
  [(PAAccessLoggerState *)self->_state setLoggingEnabled:0];
  BOOL v6 = [(PAAccessLoggerState *)v3 loggingEnabled];

  if (v6)
  {
    [(PAAccessLogger *)self lockedNotifyDidSetLoggingEnabled:0];
  }
}

- (ResyncStateResult)resyncState
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  __int16 v29 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v31 = [MEMORY[0x1E4F1CA48] array];
  id v30 = [MEMORY[0x1E4F1CA48] array];
  id v26 = retstr;
  uint64_t v5 = [(PAAccessLogger *)self maxRetryCount];
  BOOL v6 = self->_state;
  id v7 = (PAAccessLoggerState *)objc_opt_new();
  state = self->_state;
  self->_state = v7;

  [(PAAccessLoggerState *)self->_state setLoggingEnabled:[(PAAccessLoggerState *)v6 loggingEnabled]];
  [(PAAccessLoggerState *)self->_state setTopAccessIntervalSlot:[(PAAccessLoggerState *)v6 topAccessIntervalSlot]];
  id v28 = self;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v9 = [(PAAccessLoggerState *)v6 ongoingAccessIntervals];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v34;
    id obj = v9;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v33 + 1) + 8 * v12);
        char v14 = [(PAAccessLoggerState *)v6 ongoingAccessIntervals];
        uint64_t v15 = [v14 objectForKeyedSubscript:v13];

        objc_msgSend(v15, "setRetryCount:", objc_msgSend(v15, "retryCount") + 1);
        if ([v15 retryCount] <= v5)
        {
          uint64_t v19 = [v15 access];
          id v20 = [v19 asIntervalEndEventWithTimestampAdjustment:0.0];
          [v31 addObject:v20];

          id v21 = [v15 access];
          v22 = [MEMORY[0x1E4F29128] UUID];
          uint64_t v17 = (void *)[v21 copyWithNewIdentifier:v22];

          id v23 = [v17 asIntervalBeginEvent];
          [v29 setObject:v23 forKeyedSubscript:v13];

          [v15 setAccess:v17];
          [(PAAccessLoggerState *)v28->_state setOngoingAccessIntervalState:v15 forSlot:v13];
        }
        else
        {
          uint64_t v16 = (id)logger_3;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            id v24 = [v15 access];
            *(_DWORD *)buf = 134218242;
            uint64_t v38 = v5;
            __int16 v39 = 2112;
            v40 = v24;
            _os_log_error_impl(&dword_1A8FA5000, v16, OS_LOG_TYPE_ERROR, "Dropping interval exceeding maximum retries=%ld for access=%@", buf, 0x16u);
          }
          uint64_t v17 = [v15 access];
          uint64_t v18 = [v17 asIntervalEndEventWithTimestampAdjustment:0.0];
          [v30 addObject:v18];
        }
        ++v12;
      }
      while (v10 != v12);
      id v9 = obj;
      uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v10);
  }

  v26->var0 = v29;
  v26->var1 = v31;
  v26->var2 = v30;

  os_unfair_lock_unlock(lock);
  return result;
}

void __41__PAAccessLogger_beginIntervalForAccess___block_invoke(uint64_t *a1, void *a2)
{
  id v3 = a2;
  if (([v3 loggingEnabled] & 1) == 0)
  {
    uint64_t v16 = logger_3;
    if (os_log_type_enabled((os_log_t)logger_3, OS_LOG_TYPE_DEBUG)) {
      __41__PAAccessLogger_beginIntervalForAccess___block_invoke_cold_2((uint64_t)a1, v16, v17, v18, v19, v20, v21, v22);
    }
    uint64_t v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PAErrorDomain" code:2 userInfo:0];
    uint64_t v24 = *(void *)(a1[6] + 8);
    id v9 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;
    goto LABEL_10;
  }
  id v4 = [v3 negativeAccessCache];
  uint64_t v5 = +[PAAccessMatcher negativeAccessCacheMatcherForAccess:a1[4]];
  uint64_t v6 = [v4 objectForKey:v5];
  uint64_t v7 = *(void *)(a1[6] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    id v9 = [v3 takeOngoingAccessIntervalStateForAccess:a1[4]];
    if (v9)
    {
      uint64_t v10 = logger_3;
      if (os_log_type_enabled((os_log_t)logger_3, OS_LOG_TYPE_ERROR)) {
        __41__PAAccessLogger_beginIntervalForAccess___block_invoke_cold_1(a1 + 4, v10);
      }
    }
    objc_msgSend(v3, "setTopAccessIntervalSlot:", objc_msgSend(v3, "topAccessIntervalSlot") + 1);
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "topAccessIntervalSlot"));
    uint64_t v12 = [[PAOngoingAccessIntervalState alloc] initWithAccess:a1[4]];
    [v3 setOngoingAccessIntervalState:v12 forSlot:v11];

    uint64_t v13 = [[PAAccessInterval alloc] initWithLogger:a1[5] slot:v11];
    uint64_t v14 = *(void *)(a1[7] + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

LABEL_10:
  }
}

- (int64_t)maxRetryCount
{
  return self->_maxRetryCount;
}

- (void)handleConnectionInterrupted
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = logger_3;
  if (os_log_type_enabled((os_log_t)logger_3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A8FA5000, v3, OS_LOG_TYPE_INFO, "XPC connection interrupted", buf, 2u);
  }
  *(void *)buf = 0;
  id v34 = 0;
  id v35 = 0;
  [(PAAccessLogger *)self resyncState];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v4 = *(id *)buf;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v30;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)buf objectForKeyedSubscript:*(void *)(*((void *)&v29 + 1) + 8 * v7)];
        [(PAAccessLogger *)self log:v8 reason:1];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v5);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v34;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * v12);
        uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PAErrorDomain" code:10 userInfo:0];
        [(PAAccessLogger *)self notifyDidLogAccess:v13 failedWithError:v14];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = v35;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = *(void *)(*((void *)&v21 + 1) + 8 * v18);
        uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"PAErrorDomain", 11, 0, (void)v21);
        [(PAAccessLogger *)self notifyDidLogAccess:v19 failedWithError:v20];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v36 count:16];
    }
    while (v16);
  }
}

- (void)log:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (!a4)
  {
    uint64_t v8 = [v6 JSONObject];
    id v9 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v8 options:0 error:0];

    uint64_t v10 = (void *)logger_3;
    if (os_log_type_enabled((os_log_t)logger_3, OS_LOG_TYPE_DEBUG)) {
      -[PAAccessLogger log:reason:](v10, v9);
    }
  }
  objc_initWeak(&location, self);
  connection = self->_connection;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __29__PAAccessLogger_log_reason___block_invoke;
  v18[3] = &unk_1E5D71068;
  objc_copyWeak(&v20, &location);
  id v12 = v7;
  id v19 = v12;
  uint64_t v13 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v18];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __29__PAAccessLogger_log_reason___block_invoke_2;
  v15[3] = &unk_1E5D71068;
  objc_copyWeak(&v17, &location);
  id v14 = v12;
  id v16 = v14;
  [v13 log:v14 reason:a4 reply:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

uint64_t __41__PAAccessLogger_beginIntervalForAccess___block_invoke_28(uint64_t a1)
{
  return [*(id *)(a1 + 32) log:*(void *)(a1 + 40) reason:0];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    logger_3 = (uint64_t)os_log_create("com.apple.PrivacyAccounting", "PAAccessLogger");
    MEMORY[0x1F41817F8]();
  }
}

void __29__PAAccessLogger_log_reason___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    goto LABEL_30;
  }
  uint64_t v5 = [*(id *)(a1 + 32) kind];
  if (v5 == 1 || v5 == 4)
  {
    id v7 = v3;
    uint64_t v8 = [v7 domain];
    int v9 = [v8 isEqualToString:@"PAErrorDomain"];

    if (!v9) {
      goto LABEL_23;
    }
    unint64_t v10 = [v7 code];
    if (v10 > 0x10 || ((1 << v10) & 0x14060) == 0) {
      goto LABEL_23;
    }

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __29__PAAccessLogger_log_reason___block_invoke_4;
    v21[3] = &unk_1E5D71090;
    id v22 = v7;
    id v23 = *(id *)(a1 + 32);
    [WeakRetained withLockedState:v21];

    uint64_t v11 = v22;
  }
  else
  {
    if (v5 != 2) {
      goto LABEL_24;
    }
    id v7 = v3;
    id v12 = [v7 domain];
    if ([v12 isEqualToString:@"PAErrorDomain"])
    {
      if ([v7 code] == 2)
      {

LABEL_23:
        goto LABEL_24;
      }
      uint64_t v13 = [v7 code];

      if (v13 == 9) {
        goto LABEL_23;
      }
    }
    else
    {
    }
    id v14 = [v7 domain];
    int v15 = [v14 isEqualToString:@"PAErrorDomain"];

    if (!v15) {
      goto LABEL_23;
    }
    uint64_t v16 = [v7 code];
    if (v16 == 3) {
      goto LABEL_23;
    }
    if (v16 == 12)
    {
      int v17 = PAErrorBoolValueForUserInfoKey(v7, @"PASimulatedErrorShouldShouldDropOngoingIntervalState");

      if (!v17) {
        goto LABEL_24;
      }
    }
    else
    {
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __29__PAAccessLogger_log_reason___block_invoke_3;
    v24[3] = &unk_1E5D71090;
    id v25 = *(id *)(a1 + 32);
    id v26 = v7;
    [WeakRetained withLockedState:v24];

    uint64_t v11 = v25;
  }

LABEL_24:
  id v18 = v3;
  id v19 = [v18 domain];
  if ([v19 isEqualToString:@"PAErrorDomain"]) {
    BOOL v20 = [v18 code] != 2 && objc_msgSend(v18, "code") != 9;
  }
  else {
    BOOL v20 = 1;
  }

  [WeakRetained setLoggingEnabled:v20];
  [WeakRetained notifyDidLogAccess:*(void *)(a1 + 32) failedWithError:v18];
LABEL_30:
}

- (void)setLoggingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(PAAccessLogger *)self ensureEnablementChangedNotificationRegistered];
  if ([(PAAccessLoggerState *)self->_state loggingEnabled] != v3)
  {
    if (v3)
    {
      [(PAAccessLoggerState *)self->_state setLoggingEnabled:1];
      [(PAAccessLogger *)self lockedNotifyDidSetLoggingEnabled:1];
    }
    else
    {
      [(PAAccessLogger *)self lockedInvalidateState];
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)ensureEnablementChangedNotificationRegistered
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl(&dword_1A8FA5000, log, OS_LOG_TYPE_ERROR, "Failed to register for %{public}@ notifications with code=%u", (uint8_t *)&v4, 0x12u);
}

- (void)lockedNotifyDidSetLoggingEnabled:(BOOL)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v5 = [(PAAccessLogger *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PAAccessLogger_lockedNotifyDidSetLoggingEnabled___block_invoke;
    block[3] = &unk_1E5D710E0;
    objc_copyWeak(&v9, &location);
    BOOL v10 = a3;
    dispatch_async(queue, block);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

uint64_t __32__PAAccessLogger_sharedInstance__block_invoke()
{
  sharedInstance_instance_1 = [[PAAccessLogger alloc] initWithQueue:0];

  return MEMORY[0x1F41817F8]();
}

- (PAAccessLogger)initWithQueue:(id)a3
{
  return [(PAAccessLogger *)self initWithConnection:0 queue:a3];
}

- (PAAccessLogger)initWithConnection:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PAAccessLogger *)self initWithConnection:v7 queue:v6 enablementChangedNotificationName:@"com.apple.PrivacyAccounting.toggled" options:+[PALoggingOptionsFactory defaultLoggingOptions]];

  return v8;
}

uint64_t __22__PAAccessLogger_log___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) log:*(void *)(a1 + 40) reason:0];
}

void __85__PAAccessLogger_initWithConnection_queue_enablementChangedNotificationName_options___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleConnectionInvalidated];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  [(PACoalescingIntervalTracker *)self->_coalescingIntervalTracker invalidate];
  notify_cancel(self->_enablementChangedNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)PAAccessLogger;
  [(PAAccessLogger *)&v3 dealloc];
}

void __29__PAAccessLogger_log_reason___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained notifyDidLogAccess:*(void *)(a1 + 32) failedWithError:v4];
}

void __29__PAAccessLogger_log_reason___block_invoke_3(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = (id)[v11 takeOngoingAccessIntervalStateForAccess:*(void *)(a1 + 32)];
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 domain];
  int v6 = [v5 isEqualToString:@"PAErrorDomain"];

  if (v6)
  {
    unint64_t v7 = [v4 code];
    if (v7 <= 0x10 && ((1 << v7) & 0x14060) != 0)
    {

      id v4 = [v11 negativeAccessCache];
      uint64_t v9 = *(void *)(a1 + 40);
      BOOL v10 = +[PAAccessMatcher negativeAccessCacheMatcherForAccess:*(void *)(a1 + 32)];
      [v4 setObject:v9 forKey:v10];
    }
  }
}

void __29__PAAccessLogger_log_reason___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = [a2 negativeAccessCache];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = +[PAAccessMatcher negativeAccessCacheMatcherForAccess:*(void *)(a1 + 40)];
  [v5 setObject:v3 forKey:v4];
}

uint64_t __86__PAAccessLogger_recordAssetIdentifiers_withVisibilityState_accessEventCount_forSlot___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 lookupCurrentAccessForSlot:*(void *)(a1 + 32)];

  return MEMORY[0x1F41817F8]();
}

- (void)endIntervalWithSlot:(id)a3 timestampAdjustment:(double)a4 accessCount:(int64_t)a5
{
  id v8 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__0;
  id v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  if ([v8 integerValue] >= 1)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __70__PAAccessLogger_endIntervalWithSlot_timestampAdjustment_accessCount___block_invoke;
    v18[3] = &unk_1E5D710B8;
    id v19 = v8;
    BOOL v20 = &v21;
    [(PAAccessLogger *)self withLockedState:v18];
  }
  uint64_t v9 = (void *)v22[5];
  if (v9)
  {
    BOOL v10 = [v9 asIntervalEndEventWithTimestampAdjustment:a4];
    [v10 setAccessCount:a5];
    [(PAAccessLogger *)self log:v10 reason:0];
  }
  else
  {
    id v11 = logger_3;
    if (os_log_type_enabled((os_log_t)logger_3, OS_LOG_TYPE_DEBUG)) {
      -[PAAccessLogger endIntervalWithSlot:timestampAdjustment:accessCount:]((uint64_t)v8, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  _Block_object_dispose(&v21, 8);
}

void __70__PAAccessLogger_endIntervalWithSlot_timestampAdjustment_accessCount___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 takeOngoingAccessIntervalStateForSlot:*(void *)(a1 + 32)];
  uint64_t v3 = [v6 access];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)handleConnectionInvalidated
{
  uint64_t v3 = logger_3;
  if (os_log_type_enabled((os_log_t)logger_3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A8FA5000, v3, OS_LOG_TYPE_INFO, "XPC connection invalidated", v4, 2u);
  }
  os_unfair_lock_lock(&self->_lock);
  [(PAAccessLogger *)self lockedInvalidateState];
  os_unfair_lock_unlock(&self->_lock);
}

void __51__PAAccessLogger_lockedNotifyDidSetLoggingEnabled___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  [v2 logger:WeakRetained didSetLoggingEnabled:*(unsigned __int8 *)(a1 + 40)];
}

void __53__PAAccessLogger_notifyDidLogAccess_failedWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained delegate];
  [v2 logger:WeakRetained didLogAccess:*(void *)(a1 + 32) failedWithError:*(void *)(a1 + 40)];
}

void __42__PAAccessLogger_notifyDidCoalesceAccess___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained delegate];
  [v2 logger:WeakRetained didCoalesceAccess:*(void *)(a1 + 32)];
}

void __63__PAAccessLogger_ensureEnablementChangedNotificationRegistered__block_invoke(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = logger_3;
  if (os_log_type_enabled((os_log_t)logger_3, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_1A8FA5000, v4, OS_LOG_TYPE_INFO, "Received enablement changed notification with token=%d", (uint8_t *)v6, 8u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setLoggingEnabled:1];
}

- (void)setDelegate:(id)a3
{
}

- (void)setMaxRetryCount:(int64_t)a3
{
  self->_maxRetryCount = a3;
}

- (void)setCoalescingIntervalTracker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescingIntervalTracker, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_enablementChangedNotificationName, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

- (PAAccessLogger)initWithConnection:(id)a3 queue:(id)a4 forcingOptions:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [(PAAccessLogger *)self initWithConnection:v10 queue:v11 enablementChangedNotificationName:@"com.apple.PrivacyAccounting.toggled" options:a5];
  if (v12)
  {
    uint64_t v33 = 0;
    id v34 = &v33;
    uint64_t v35 = 0x3032000000;
    long long v36 = __Block_byref_object_copy__0;
    uint64_t v37 = __Block_byref_object_dispose__0;
    id v38 = 0;
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    uint64_t v14 = [(PAAccessLogger *)v12 connection];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __73__PAAccessLogger_Testing__initWithConnection_queue_forcingOptions_error___block_invoke;
    v30[3] = &unk_1E5D71158;
    long long v32 = &v33;
    uint64_t v15 = v13;
    long long v31 = v15;
    uint64_t v16 = [v14 remoteObjectProxyWithErrorHandler:v30];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    id v26 = __73__PAAccessLogger_Testing__initWithConnection_queue_forcingOptions_error___block_invoke_2;
    long long v27 = &unk_1E5D71158;
    long long v29 = &v33;
    uint64_t v17 = v15;
    long long v28 = v17;
    objc_msgSend(v16, "changeTestingSettings:reply:", 0, a5, &v24);

    dispatch_time_t v18 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v17, v18))
    {
      if (a6)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"PAErrorDomain", 20, 0, v24, v25, v26, v27);
        id v19 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v19 = 0;
      }
    }
    else
    {
      BOOL v20 = v34;
      if (a6)
      {
        uint64_t v21 = (void *)v34[5];
        if (v21)
        {
          *a6 = v21;
          BOOL v20 = v34;
        }
      }
      if (v20[5]) {
        id v22 = 0;
      }
      else {
        id v22 = v12;
      }
      id v19 = v22;
    }

    _Block_object_dispose(&v33, 8);
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

void __73__PAAccessLogger_Testing__initWithConnection_queue_forcingOptions_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __73__PAAccessLogger_Testing__initWithConnection_queue_forcingOptions_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)beginIntervalForAccess:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1A8FA5000, log, OS_LOG_TYPE_DEBUG, "Began interval with slot=%{public}@", buf, 0xCu);
}

void __41__PAAccessLogger_beginIntervalForAccess___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A8FA5000, a2, OS_LOG_TYPE_ERROR, "Trying to begin new interval for access=%@ already associated with ongoing interval", (uint8_t *)&v3, 0xCu);
}

void __41__PAAccessLogger_beginIntervalForAccess___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A8FA5000, a2, a3, "Logging disabled; returning placeholder interval for access=%@",
    a5,
    a6,
    a7,
    a8,
    2u);
}

- (void)initWithConnection:(os_log_t)log queue:enablementChangedNotificationName:options:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136315650;
  uint64_t v4 = "-[PAAccessLogger initWithConnection:queue:enablementChangedNotificationName:options:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_1A8FA5000, log, OS_LOG_TYPE_DEBUG, "%s: connection=%@, queue=%@", (uint8_t *)&v3, 0x20u);
}

- (void)log:(void *)a1 reason:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = a1;
  v4[0] = 68157954;
  v4[1] = [a2 length];
  __int16 v5 = 2080;
  uint64_t v6 = [a2 bytes];
  _os_log_debug_impl(&dword_1A8FA5000, v3, OS_LOG_TYPE_DEBUG, "#QA #PAAccess %.*s", (uint8_t *)v4, 0x12u);
}

- (void)recordAssetIdentifiers:(uint64_t)a1 withVisibilityState:(NSObject *)a2 accessEventCount:forSlot:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A8FA5000, a2, OS_LOG_TYPE_ERROR, "Tried to record asset identifiers for a closed interval.  Slot=%{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)endIntervalWithSlot:(uint64_t)a3 timestampAdjustment:(uint64_t)a4 accessCount:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A8FA5000, a2, a3, "Tried to end interval with unknown slot=%{public}@", a5, a6, a7, a8, 2u);
}

- (void)notifyDidLogAccess:(uint64_t)a3 failedWithError:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end