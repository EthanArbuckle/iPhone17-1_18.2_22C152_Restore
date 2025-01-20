@interface SFSessionCache
+ (BOOL)supportsSecureCoding;
- (BOOL)cacheFull;
- (NSString)serviceIdentifier;
- (NSUUID)identifier;
- (OS_dispatch_queue)dispatchQueue;
- (SFSessionCache)init;
- (SFSessionCache)initWithCoder:(id)a3;
- (id)_sessionWithDevice:(id)a3 activate:(BOOL)a4 withCompletion:(id)a5;
- (id)activePeerDeviceIDs;
- (id)activeSessions;
- (id)description;
- (id)errorHandler;
- (id)sessionWithDevice:(id)a3 activate:(BOOL)a4 withCompletion:(id)a5;
- (unint64_t)capacity;
- (void)_ensureStarted;
- (void)_ensureStopped;
- (void)_popCache;
- (void)_sessionWasInterrupted:(id)a3;
- (void)_sessionWasInvalidated:(id)a3;
- (void)activate;
- (void)clearCache;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)sendRequestWithFlags:(unsigned int)a3 object:(id)a4 responseHandler:(id)a5 toDevice:(id)a6;
- (void)sendWithFlags:(unsigned int)a3 object:(id)a4 toDevice:(id)a5;
- (void)setCapacity:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setServiceIdentifier:(id)a3;
@end

@implementation SFSessionCache

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSessionCache)init
{
  v9.receiver = self;
  v9.super_class = (Class)SFSessionCache;
  v2 = [(SFSessionCache *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_capacity = 6;
    uint64_t v4 = SFMainQueue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
    identifier = v3->_identifier;
    v3->_identifier = (NSUUID *)v6;
  }
  return v3;
}

- (SFSessionCache)initWithCoder:(id)a3
{
  v29[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SFSessionCache;
  v5 = [(SFSessionCache *)&v27 init];
  if (v5)
  {
    uint64_t v6 = SFMainQueue();
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v6;

    if ([v4 containsValueForKey:@"cp"]) {
      v5->_capacity = [v4 decodeIntegerForKey:@"cp"];
    }
    if ([v4 containsValueForKey:@"id"])
    {
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
      identifier = v5->_identifier;
      v5->_identifier = (NSUUID *)v8;
    }
    if ([v4 containsValueForKey:@"sid"])
    {
      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sid"];
      serviceIdentifier = v5->_serviceIdentifier;
      v5->_serviceIdentifier = (NSString *)v10;
    }
    if ([v4 containsValueForKey:@"sd"])
    {
      v12 = (void *)MEMORY[0x1E4F1CAD0];
      v29[0] = objc_opt_class();
      v29[1] = objc_opt_class();
      v29[2] = objc_opt_class();
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];
      v14 = [v12 setWithArray:v13];

      v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sd"];
      v16 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v14 fromData:v15 error:0];
      uint64_t v17 = [v16 mutableCopy];
      sessions = v5->_sessions;
      v5->_sessions = (NSMutableDictionary *)v17;
    }
    if ([v4 containsValueForKey:@"tsd"])
    {
      v19 = (void *)MEMORY[0x1E4F1CAD0];
      v28[0] = objc_opt_class();
      v28[1] = objc_opt_class();
      v28[2] = objc_opt_class();
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
      v21 = [v19 setWithArray:v20];

      v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sd"];
      v23 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v21 fromData:v22 error:0];
      uint64_t v24 = [v23 mutableCopy];
      timestamps = v5->_timestamps;
      v5->_timestamps = (NSMutableDictionary *)v24;
    }
  }

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  [v10 encodeInteger:self->_capacity forKey:@"cp"];
  identifier = self->_identifier;
  if (identifier) {
    [v10 encodeObject:identifier forKey:@"id"];
  }
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier) {
    [v10 encodeObject:serviceIdentifier forKey:@"sid"];
  }
  sessions = self->_sessions;
  if (sessions)
  {
    v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:sessions requiringSecureCoding:1 error:0];
    [v10 encodeObject:v7 forKey:@"sd"];
  }
  timestamps = self->_timestamps;
  if (timestamps)
  {
    objc_super v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:timestamps requiringSecureCoding:1 error:0];
    [v10 encodeObject:v9 forKey:@"tsd"];
  }
}

- (id)description
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v32 = 0;
  identifier = self->_identifier;
  unint64_t capacity = self->_capacity;
  NSAppendPrintF();
  id v3 = 0;
  id v4 = v3;
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier)
  {
    id v31 = v3;
    identifier = (NSUUID *)serviceIdentifier;
    NSAppendPrintF();
    id v6 = v31;

    id v4 = v6;
  }
  v30 = v4;
  NSAppendPrintF();
  id v7 = v4;

  id v29 = v7;
  uint64_t v21 = [(NSMutableDictionary *)self->_sessions count];
  NSAppendPrintF();
  id v8 = v7;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  objc_super v9 = [(NSMutableDictionary *)self->_sessions allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      uint64_t v13 = 0;
      v14 = v8;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * v13);
        v16 = -[NSMutableDictionary objectForKeyedSubscript:](self->_timestamps, "objectForKeyedSubscript:", v15, v22, v24);
        [v16 doubleValue];
        uint64_t v18 = v17;

        uint64_t v24 = v18;
        uint64_t v22 = v15;
        NSAppendPrintF();
        id v8 = v14;

        ++v13;
        v14 = v8;
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16, v22, v18);
    }
    while (v11);
  }

  return v8;
}

- (void)_ensureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidated)
  {
    if (gLogCategory_SFSessionCache <= 60
      && (gLogCategory_SFSessionCache != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (!self->_sessions)
    {
      id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      sessions = self->_sessions;
      self->_sessions = v3;
    }
    if (!self->_timestamps)
    {
      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      timestamps = self->_timestamps;
      self->_timestamps = v5;
    }
  }
}

- (void)_ensureStopped
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(NSMutableDictionary *)self->_sessions allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_sessions removeAllObjects];
  sessions = self->_sessions;
  self->_sessions = 0;

  [(NSMutableDictionary *)self->_timestamps removeAllObjects];
  timestamps = self->_timestamps;
  self->_timestamps = 0;
}

- (void)_popCache
{
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy_;
  v10[4] = __Block_byref_object_dispose_;
  id v11 = 0;
  id v3 = NSNumber;
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSince1970];
  objc_msgSend(v3, "numberWithDouble:");
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_activated)
  {
LABEL_13:
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  timestamps = self->_timestamps;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __27__SFSessionCache__popCache__block_invoke;
  v9[3] = &unk_1E5BBC9A0;
  v9[4] = v10;
  v9[5] = &v12;
  [(NSMutableDictionary *)timestamps enumerateKeysAndObjectsUsingBlock:v9];
  uint64_t v6 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v13[5]];
  if (!v6)
  {
    if (gLogCategory_SFSessionCache <= 60
      && (gLogCategory_SFSessionCache != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_13;
  }
  if (gLogCategory_SFSessionCache <= 10
    && (gLogCategory_SFSessionCache != -1 || _LogCategory_Initialize()))
  {
    identifier = self->_identifier;
    uint64_t v8 = v13[5];
    LogPrintF();
  }
  objc_msgSend(v6, "invalidate", identifier, v8);
  [(NSMutableDictionary *)self->_sessions removeObjectForKey:v13[5]];
  [(NSMutableDictionary *)self->_timestamps removeObjectForKey:v13[5]];
LABEL_8:

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v12, 8);
}

void __27__SFSessionCache__popCache__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  [a3 doubleValue];
  double v7 = v6;
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) doubleValue];
  if (v7 < v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (id)_sessionWithDevice:(id)a3 activate:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  long long v10 = [v8 identifier];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_activated)
  {
    id v11 = 0;
    if (!self->_invalidated && v10)
    {
      uint64_t v12 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v10];
      if (v12)
      {
        id v11 = (SFSession *)v12;
        if (gLogCategory_SFSessionCache <= 30
          && (gLogCategory_SFSessionCache != -1 || _LogCategory_Initialize()))
        {
          uint64_t v21 = v10;
          LogPrintF();
        }
        if (!v9) {
          goto LABEL_21;
        }
        dispatchQueue = self->_dispatchQueue;
        uint64_t block = MEMORY[0x1E4F143A8];
        uint64_t v23 = 3221225472;
        uint64_t v24 = __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke_7;
        long long v25 = &unk_1E5BBC9C8;
        long long v27 = (SFSession *)v9;
        id v11 = v11;
        long long v26 = v11;
        dispatch_async(dispatchQueue, &block);

        uint64_t v14 = v27;
      }
      else
      {
        if (gLogCategory_SFSessionCache <= 30
          && (gLogCategory_SFSessionCache != -1 || _LogCategory_Initialize()))
        {
          uint64_t v21 = v10;
          LogPrintF();
        }
        uint64_t v15 = objc_alloc_init(SFSession);
        [(SFSession *)v15 setDispatchQueue:self->_dispatchQueue];
        [(SFSession *)v15 setPeerDevice:v8];
        [(SFSession *)v15 setServiceIdentifier:self->_serviceIdentifier];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke;
        v33[3] = &unk_1E5BBBD18;
        v33[4] = self;
        v16 = v15;
        uint64_t v34 = v16;
        [(SFSession *)v16 setInterruptionHandler:v33];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke_3;
        v31[3] = &unk_1E5BBBD18;
        v31[4] = self;
        id v11 = v16;
        uint64_t v32 = v11;
        [(SFSession *)v11 setInvalidationHandler:v31];
        if (v6)
        {
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke_5;
          void v28[3] = &unk_1E5BBC9F0;
          id v30 = v9;
          v28[4] = self;
          id v29 = v11;
          [(SFSession *)v29 activateWithCompletion:v28];
        }
        if ([(SFSessionCache *)self cacheFull]) {
          [(SFSessionCache *)self _popCache];
        }
        [(NSMutableDictionary *)self->_sessions setObject:v11 forKeyedSubscript:v10];

        uint64_t v14 = v34;
      }

LABEL_21:
      id v17 = NSNumber;
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v21, block, v23, v24, v25);
      [v18 timeIntervalSince1970];
      v19 = objc_msgSend(v17, "numberWithDouble:");
      [(NSMutableDictionary *)self->_timestamps setObject:v19 forKeyedSubscript:v10];
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke_2;
  v3[3] = &unk_1E5BBBD18;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

uint64_t __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sessionWasInterrupted:*(void *)(a1 + 40)];
}

void __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke_4;
  v3[3] = &unk_1E5BBBD18;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

uint64_t __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sessionWasInvalidated:*(void *)(a1 + 40)];
}

void __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (gLogCategory_SFSessionCache <= 30
      && (gLogCategory_SFSessionCache != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_SFSessionCache <= 30
      && (gLogCategory_SFSessionCache != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v4 = *(void **)(a1 + 48);
    if (v4)
    {
      uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 40);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke_6;
      block[3] = &unk_1E5BBC9C8;
      id v8 = v4;
      id v7 = *(id *)(a1 + 40);
      dispatch_async(v5, block);
    }
  }
}

uint64_t __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_sessionWasInterrupted:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (gLogCategory_SFSessionCache <= 30)
  {
    id v6 = v3;
    if (gLogCategory_SFSessionCache != -1 || (v5 = _LogCategory_Initialize(), id v4 = v6, v5))
    {
      LogPrintF();
      id v4 = v6;
    }
  }
}

- (void)_sessionWasInvalidated:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (gLogCategory_SFSessionCache <= 30)
  {
    id v6 = v3;
    if (gLogCategory_SFSessionCache != -1 || (v5 = _LogCategory_Initialize(), id v4 = v6, v5))
    {
      LogPrintF();
      id v4 = v6;
    }
  }
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__SFSessionCache_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__SFSessionCache_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFSessionCache <= 50
    && (gLogCategory_SFSessionCache != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  v2 = *(void **)(a1 + 32);

  return [v2 _ensureStarted];
}

- (void)clearCache
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__SFSessionCache_clearCache__block_invoke;
  block[3] = &unk_1E5BBC870;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__SFSessionCache_clearCache__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFSessionCache <= 50
    && (gLogCategory_SFSessionCache != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [*(id *)(a1 + 32) _ensureStopped];
  v2 = *(void **)(a1 + 32);

  return [v2 _ensureStarted];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__SFSessionCache_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__SFSessionCache_invalidate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFSessionCache <= 50
    && (gLogCategory_SFSessionCache != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t result = [*(id *)(a1 + 32) _ensureStopped];
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  return result;
}

- (void)sendRequestWithFlags:(unsigned int)a3 object:(id)a4 responseHandler:(id)a5 toDevice:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__SFSessionCache_sendRequestWithFlags_object_responseHandler_toDevice___block_invoke;
  block[3] = &unk_1E5BBCA40;
  unsigned int v22 = a3;
  id v18 = v10;
  v19 = self;
  id v20 = v12;
  id v21 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(dispatchQueue, block);
}

void __71__SFSessionCache_sendRequestWithFlags_object_responseHandler_toDevice___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__SFSessionCache_sendRequestWithFlags_object_responseHandler_toDevice___block_invoke_2;
  aBlock[3] = &unk_1E5BBCA18;
  int v7 = *(_DWORD *)(a1 + 64);
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 56);
  v2 = _Block_copy(aBlock);
  id v3 = (id)[*(id *)(a1 + 40) _sessionWithDevice:*(void *)(a1 + 48) activate:1 withCompletion:v2];
}

void __71__SFSessionCache_sendRequestWithFlags_object_responseHandler_toDevice___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogCategory_SFSessionCache <= 10
    && (gLogCategory_SFSessionCache != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [v3 sendRequestWithFlags:*(unsigned int *)(a1 + 48) object:*(void *)(a1 + 32) responseHandler:*(void *)(a1 + 40)];
}

- (void)sendWithFlags:(unsigned int)a3 object:(id)a4 toDevice:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__SFSessionCache_sendWithFlags_object_toDevice___block_invoke;
  v13[3] = &unk_1E5BBCA90;
  unsigned int v17 = a3;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

void __48__SFSessionCache_sendWithFlags_object_toDevice___block_invoke(uint64_t a1)
{
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __48__SFSessionCache_sendWithFlags_object_toDevice___block_invoke_2;
  int v7 = &unk_1E5BBCA68;
  int v9 = *(_DWORD *)(a1 + 56);
  id v8 = *(id *)(a1 + 32);
  v2 = _Block_copy(&v4);
  id v3 = (id)objc_msgSend(*(id *)(a1 + 40), "_sessionWithDevice:activate:withCompletion:", *(void *)(a1 + 48), 1, v2, v4, v5, v6, v7);
}

void __48__SFSessionCache_sendWithFlags_object_toDevice___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogCategory_SFSessionCache <= 10
    && (gLogCategory_SFSessionCache != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [v3 sendWithFlags:*(unsigned int *)(a1 + 40) object:*(void *)(a1 + 32)];
}

- (id)sessionWithDevice:(id)a3 activate:(BOOL)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy_;
  uint64_t v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SFSessionCache_sessionWithDevice_activate_withCompletion___block_invoke;
  block[3] = &unk_1E5BBCAB8;
  void block[4] = self;
  id v16 = v8;
  BOOL v19 = a4;
  id v17 = v9;
  id v18 = &v20;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(dispatchQueue, block);
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v13;
}

void __60__SFSessionCache_sessionWithDevice_activate_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _sessionWithDevice:*(void *)(a1 + 40) activate:*(unsigned __int8 *)(a1 + 64) withCompletion:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)activePeerDeviceIDs
{
  if (self->_activated && !self->_invalidated)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v4 = [(NSMutableDictionary *)self->_sessions allKeys];
    uint64_t v2 = [v3 setWithArray:v4];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)activeSessions
{
  if (self->_activated && !self->_invalidated)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v4 = [(NSMutableDictionary *)self->_sessions allValues];
    uint64_t v2 = [v3 setWithArray:v4];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (BOOL)cacheFull
{
  return [(NSMutableDictionary *)self->_sessions count] >= self->_capacity;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(unint64_t)a3
{
  self->_unint64_t capacity = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_timestamps, 0);

  objc_storeStrong((id *)&self->_sessions, 0);
}

@end