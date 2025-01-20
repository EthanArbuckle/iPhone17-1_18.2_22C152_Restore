@interface MRApplicationConnection
- (BOOL)isEqual:(id)a3;
- (BOOL)isIncomingConnection;
- (MRApplicationConnection)initWithContext:(id)a3 requestInfo:(id)a4;
- (MRApplicationConnection)initWithServiceName:(id)a3 playerPath:(id)a4;
- (MRApplicationConnectionContext)context;
- (MRApplicationConnectionRequestInfo)requestInfo;
- (NSMutableArray)pendingReceivedMessages;
- (NSString)identifier;
- (NSString)serviceName;
- (OS_dispatch_queue)messageQueue;
- (OS_dispatch_queue)queue;
- (id)description;
- (id)destinationPlayerPath;
- (id)incomingMessageHandler;
- (id)invalidationHandler;
- (int64_t)state;
- (os_unfair_lock_s)lock;
- (unint64_t)hash;
- (void)activate;
- (void)close;
- (void)dealloc;
- (void)handleMediaRemoteServiceInvalidatedNotification:(id)a3;
- (void)handleMessage:(id)a3;
- (void)invalidate:(id)a3;
- (void)sendMessage:(id)a3;
- (void)setIncomingMessageHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setIsIncomingConnection:(BOOL)a3;
- (void)setPendingReceivedMessages:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation MRApplicationConnection

- (MRApplicationConnection)initWithServiceName:(id)a3 playerPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 origin];
  if (v8)
  {
    v9 = [v7 client];
    v10 = [v9 bundleIdentifier];

    if (v10)
    {
      v11 = [MRApplicationConnectionContext alloc];
      v12 = MSVNanoIDCreateTaggedPointer();
      v13 = [(MRApplicationConnectionContext *)v11 initWithIdentifier:v12 service:v6 destinationPlayerPath:v7];
      self = [(MRApplicationConnection *)self initWithContext:v13 requestInfo:0];

      v8 = self;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (MRApplicationConnection)initWithContext:(id)a3 requestInfo:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)MRApplicationConnection;
  v9 = [(MRApplicationConnection *)&v31 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    v11 = NSString;
    v12 = [v7 identifier];
    v13 = [v11 stringWithFormat:@"com.apple.MediaRemote.MRApplicationConnection-%@", v12];

    id v14 = v13;
    v15 = (const char *)[v14 UTF8String];
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = MRApplicationConnectionGetQueue();
    dispatch_queue_t v18 = dispatch_queue_create_with_target_V2(v15, v16, v17);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v18;

    v20 = NSString;
    v21 = [v7 identifier];
    v22 = [v20 stringWithFormat:@"com.apple.MediaRemote.MRApplicationConnectionMessage-%@", v21];

    id v23 = v22;
    v24 = (const char *)[v23 UTF8String];
    v25 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v26 = MRApplicationConnectionGetMessageQueue();
    dispatch_queue_t v27 = dispatch_queue_create_with_target_V2(v24, v25, v26);
    messageQueue = v10->_messageQueue;
    v10->_messageQueue = (OS_dispatch_queue *)v27;

    v10->_lock._os_unfair_lock_opaque = 0;
    v10->_state = 0;
    objc_storeStrong((id *)&v10->_requestInfo, a4);
    v10->_isIncomingConnection = v8 != 0;
    v29 = _MRLogForCategory(0);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v33 = v10;
      __int16 v34 = 2112;
      id v35 = v7;
      _os_log_impl(&dword_194F3C000, v29, OS_LOG_TYPE_DEFAULT, "[MRApplicationConnection] initialize<%p> - context: %@", buf, 0x16u);
    }
  }
  return v10;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = _MRLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v6 = self;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[MRApplicationConnection]<%p> dealloc", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MRApplicationConnection;
  [(MRApplicationConnection *)&v4 dealloc];
}

- (id)description
{
  id v3 = [NSString alloc];
  objc_super v4 = [(MRApplicationConnection *)self context];
  v5 = (void *)[v3 initWithFormat:@"<MRApplicationConnection<%p> - context: %@>", self, v4];

  return v5;
}

- (NSString)serviceName
{
  v2 = [(MRApplicationConnection *)self context];
  id v3 = [v2 service];

  return (NSString *)v3;
}

- (NSString)identifier
{
  v2 = [(MRApplicationConnection *)self context];
  id v3 = [v2 identifier];

  return (NSString *)v3;
}

- (id)destinationPlayerPath
{
  v2 = [(MRApplicationConnection *)self context];
  id v3 = [v2 destinationPlayerPath];

  return v3;
}

- (void)activate
{
  OUTLINED_FUNCTION_2_2();
  v1 = MRApplicationConnectionStateDescription(*v0);
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_5(&dword_194F3C000, v2, v3, "[MRApplicationConnection]<%p> Attempting to activate connection in state: %@", v4, v5, v6, v7, v8);
}

uint64_t __35__MRApplicationConnection_activate__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) invalidate:a2];
  }
  return result;
}

- (void)close
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t state = self->_state;
  if (state != 2)
  {
    uint64_t v5 = _MRLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v17 = self;
      _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRApplicationConnection]<%p> close - invalidating)", buf, 0xCu);
    }

    self->_unint64_t state = 2;
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    id incomingMessageHandler = self->_incomingMessageHandler;
    self->_id incomingMessageHandler = 0;
  }
  os_unfair_lock_unlock(p_lock);
  uint8_t v8 = _MRLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = MRApplicationConnectionStateDescription(state);
    *(_DWORD *)buf = 134218242;
    v17 = self;
    __int16 v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "[MRApplicationConnection]<%p> close - state: %@", buf, 0x16u);
  }
  if (state == 1)
  {
    v10 = +[MRClientApplicationConnectionManager sharedManager];
    [v10 unregisterConnection:self];

    v11 = MRGetSharedService();
    if ([(MRApplicationConnection *)self isIncomingConnection]) {
      uint64_t v12 = 182;
    }
    else {
      uint64_t v12 = 181;
    }
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:v12];
    id v14 = [(MRApplicationConnection *)self queue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __32__MRApplicationConnection_close__block_invoke;
    v15[3] = &unk_1E57D1148;
    v15[4] = self;
    [v11 closeApplicationConnection:self error:v13 queue:v14 completion:v15];
  }
}

void __32__MRApplicationConnection_close__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _MRLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __32__MRApplicationConnection_close__block_invoke_cold_1(a1, (uint64_t)v3, v4);
    }
  }
}

- (void)invalidate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state == 2)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    self->_unint64_t state = 2;
    uint64_t v5 = _MRLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v15 = self;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRApplicationConnection]<%p> invalidate - error: %@", buf, 0x16u);
    }

    uint64_t v6 = (void *)MEMORY[0x1997190F0](self->_invalidationHandler);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    id incomingMessageHandler = self->_incomingMessageHandler;
    self->_id incomingMessageHandler = 0;

    os_unfair_lock_unlock(&self->_lock);
    if (v6)
    {
      v9 = [(MRApplicationConnection *)self messageQueue];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __38__MRApplicationConnection_invalidate___block_invoke;
      v11[3] = &unk_1E57D0DB8;
      id v13 = v6;
      id v12 = v4;
      id v10 = v6;
      dispatch_async(v9, v11);
    }
  }
}

uint64_t __38__MRApplicationConnection_invalidate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)sendMessage:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  int64_t state = self->_state;
  os_unfair_lock_unlock(&self->_lock);
  if (state == 1)
  {
    uint64_t v6 = MRGetSharedService();
    uint64_t v7 = objc_alloc_init(MRApplicationConnectionMessageHeader);
    [v4 setHeader:v7];

    uint8_t v8 = _MRLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v4 underlyingMessage];
      *(_DWORD *)buf = 134218242;
      id v13 = self;
      __int16 v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "[MRApplicationConnection]<%p> sendMessage - sending payload: %@", buf, 0x16u);
    }
    id v10 = [(MRApplicationConnection *)self queue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __39__MRApplicationConnection_sendMessage___block_invoke;
    v11[3] = &unk_1E57D1148;
    void v11[4] = self;
    [v6 sendApplicationConnectionMessage:v4 forConnection:self queue:v10 completion:v11];
  }
  else
  {
    uint64_t v6 = _MRLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MRApplicationConnection sendMessage:]();
    }
  }
}

uint64_t __39__MRApplicationConnection_sendMessage___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) invalidate:a2];
  }
  return result;
}

- (void)handleMessage:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (*(_OWORD *)&self->_state == 0)
  {
    v9 = [MEMORY[0x1E4F1CA48] array];
    pendingReceivedMessages = self->_pendingReceivedMessages;
    self->_pendingReceivedMessages = v9;

    int v11 = 1;
  }
  else
  {
    int v11 = 0;
  }
  uint64_t v5 = self->_pendingReceivedMessages;
  if (v5) {
    [(NSMutableArray *)self->_pendingReceivedMessages addObject:v4];
  }
  uint64_t v6 = (void *)MEMORY[0x1997190F0](self->_incomingMessageHandler);
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    if (v11)
    {
      uint64_t v7 = +[MRClientApplicationConnectionManager sharedManager];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __41__MRApplicationConnection_handleMessage___block_invoke;
      v15[3] = &unk_1E57D3FB8;
      v15[4] = self;
      [v7 listenerForHandlingConnection:self completion:v15];
LABEL_11:
    }
  }
  else if (v6)
  {
    uint8_t v8 = [(MRApplicationConnection *)self messageQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41__MRApplicationConnection_handleMessage___block_invoke_143;
    v12[3] = &unk_1E57D3F90;
    v12[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v8, v12);

    uint64_t v7 = v13;
    goto LABEL_11;
  }
}

void __41__MRApplicationConnection_handleMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  id v4 = (id *)(a1 + 32);
  uint64_t v6 = [v5 requestInfo];
  int v7 = [v3 handleIncomingConnection:v5 requestInfo:v6];

  os_unfair_lock_lock((os_unfair_lock_t)*v4 + 3);
  v22 = (void *)MEMORY[0x1997190F0](*((void *)*v4 + 2));
  uint8_t v8 = (os_unfair_lock_s *)*v4;
  if (v7)
  {
    if (*(void *)&v8[12]._os_unfair_lock_opaque == 1)
    {
      id v9 = *(id *)&v8[14]._os_unfair_lock_opaque;
      id v10 = (void *)*((void *)*v4 + 7);
      *((void *)*v4 + 7) = 0;

      goto LABEL_9;
    }
    id v12 = _MRLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __41__MRApplicationConnection_handleMessage___block_invoke_cold_1((uint64_t)v4);
    }
  }
  else
  {
    int v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:183];
    [(os_unfair_lock_s *)v8 invalidate:v11];
  }
  id v9 = 0;
LABEL_9:
  os_unfair_lock_unlock((os_unfair_lock_t)*v4 + 3);
  if (v22)
  {
    id v20 = v9;
    id v21 = v3;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * v17);
          v19 = objc_msgSend(*v4, "messageQueue", v20, v21);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __41__MRApplicationConnection_handleMessage___block_invoke_141;
          block[3] = &unk_1E57D3F90;
          block[4] = *v4;
          block[5] = v18;
          id v24 = v22;
          dispatch_async(v19, block);

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v15);
    }

    id v9 = v20;
    id v3 = v21;
  }
}

uint64_t __41__MRApplicationConnection_handleMessage___block_invoke_141(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _MRLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) underlyingMessage];
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRApplicationConnection]<%p> handleMessage - delivering payload: %@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __41__MRApplicationConnection_handleMessage___block_invoke_143(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _MRLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) underlyingMessage];
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRApplicationConnection]<%p> handleMessage - delivering payload: %@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRApplicationConnection *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      int v6 = [(MRApplicationConnection *)self identifier];
      uint64_t v7 = [(MRApplicationConnection *)v5 identifier];
      if (v6 == v7) {
        char v8 = 1;
      }
      else {
        char v8 = [v6 isEqual:v7];
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v2 = [(MRApplicationConnection *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)setIncomingMessageHandler:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state)
  {
    uint64_t v5 = _MRLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[MRApplicationConnection setIncomingMessageHandler:]();
    }
  }
  else
  {
    int v6 = (void *)MEMORY[0x1997190F0](v4);
    id incomingMessageHandler = self->_incomingMessageHandler;
    self->_id incomingMessageHandler = v6;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setInvalidationHandler:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state)
  {
    uint64_t v5 = _MRLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[MRApplicationConnection setInvalidationHandler:]();
    }
  }
  else
  {
    int v6 = (void *)MEMORY[0x1997190F0](v4);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = v6;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)handleMediaRemoteServiceInvalidatedNotification:(id)a3
{
  if ([(MRApplicationConnection *)self isIncomingConnection]) {
    uint64_t v4 = 177;
  }
  else {
    uint64_t v4 = 176;
  }
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:v4];
  [(MRApplicationConnection *)self invalidate:v5];
}

- (id)incomingMessageHandler
{
  return self->_incomingMessageHandler;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)messageQueue
{
  return self->_messageQueue;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (BOOL)isIncomingConnection
{
  return self->_isIncomingConnection;
}

- (void)setIsIncomingConnection:(BOOL)a3
{
  self->_isIncomingConnection = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (NSMutableArray)pendingReceivedMessages
{
  return self->_pendingReceivedMessages;
}

- (void)setPendingReceivedMessages:(id)a3
{
}

- (MRApplicationConnectionContext)context
{
  return self->_context;
}

- (MRApplicationConnectionRequestInfo)requestInfo
{
  return self->_requestInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestInfo, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_pendingReceivedMessages, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);

  objc_storeStrong(&self->_incomingMessageHandler, 0);
}

void __32__MRApplicationConnection_close__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_194F3C000, log, OS_LOG_TYPE_ERROR, "[MRApplicationConnection]<%p> close - notifying daemon failed with error: %@", (uint8_t *)&v4, 0x16u);
}

- (void)sendMessage:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  v1 = MRApplicationConnectionStateDescription(v0);
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_0(&dword_194F3C000, v2, v3, "[MRApplicationConnection]<%p> sendMessage - cannot send message in state: %@", v4, v5, v6, v7, v8);
}

void __41__MRApplicationConnection_handleMessage___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v7 = MRApplicationConnectionStateDescription(*(void *)(*(void *)a1 + 48));
  OUTLINED_FUNCTION_1_0(&dword_194F3C000, v1, v2, "[MRApplicationConnection]<%p> handleMessage - connection is in state: %@ after acceptance -> invalidating", v3, v4, v5, v6, 2u);
}

- (void)setIncomingMessageHandler:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  uint64_t v1 = MRApplicationConnectionStateDescription(*v0);
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_5(&dword_194F3C000, v2, v3, "[MRApplicationConnection]<%p> setIncomingMessageHandler - attempting to set while in state: %@", v4, v5, v6, v7, v8);
}

- (void)setInvalidationHandler:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  uint64_t v1 = MRApplicationConnectionStateDescription(*v0);
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_5(&dword_194F3C000, v2, v3, "[MRApplicationConnection]<%p> setInvalidationHandler - attempting to set while in state: %@", v4, v5, v6, v7, v8);
}

@end