@interface VSInlineStreamService
+ (id)sharedService;
- (BOOL)hasInlineStreamRequestForSpeakRequest:(id)a3;
- (NSMutableArray)streamRequestQueue;
- (NSMutableDictionary)queuedNotification;
- (NSMutableSet)ongoingNotifications;
- (OS_dispatch_queue)notifyQueue;
- (VSInlineStreamService)init;
- (_opaque_pthread_mutex_t)lock;
- (_opaque_pthread_mutexattr_t)recursiveLockAttr;
- (id)popInlineStreamRequestForSpeakRequest:(id)a3;
- (void)addInlineStreamRequest:(id)a3;
- (void)dealloc;
- (void)enqueueStreamId:(id)a3 withObject:(id)a4;
- (void)removeStreamId:(id)a3;
- (void)setLock:(_opaque_pthread_mutex_t *)a3;
- (void)setNotifyQueue:(id)a3;
- (void)setOngoingNotifications:(id)a3;
- (void)setQueuedNotification:(id)a3;
- (void)setRecursiveLockAttr:(_opaque_pthread_mutexattr_t)a3;
- (void)setStreamRequestQueue:(id)a3;
- (void)startStreamingWithId:(id)a3;
@end

@implementation VSInlineStreamService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_streamRequestQueue, 0);
  objc_storeStrong((id *)&self->_ongoingNotifications, 0);
  objc_storeStrong((id *)&self->_queuedNotification, 0);
}

- (void)setNotifyQueue:(id)a3
{
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (void)setRecursiveLockAttr:(_opaque_pthread_mutexattr_t)a3
{
  self->_recursiveLockAttr = a3;
}

- (_opaque_pthread_mutexattr_t)recursiveLockAttr
{
  uint64_t v2 = *(void *)self->_recursiveLockAttr.__opaque;
  uint64_t sig = self->_recursiveLockAttr.__sig;
  *(void *)result.__opaque = v2;
  result.__uint64_t sig = sig;
  return result;
}

- (void)setLock:(_opaque_pthread_mutex_t *)a3
{
  long long v3 = *(_OWORD *)&a3->__sig;
  long long v4 = *(_OWORD *)&a3->__opaque[8];
  long long v5 = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_lock.__opaque[40] = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_lock.__opaque[24] = v5;
  *(_OWORD *)&self->_lock.__opaque[8] = v4;
  *(_OWORD *)&self->_lock.__uint64_t sig = v3;
}

- (_opaque_pthread_mutex_t)lock
{
  long long v3 = *(_OWORD *)self[1].__opaque;
  *(_OWORD *)&retstr->__uint64_t sig = *(_OWORD *)&self->__opaque[48];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  long long v4 = *(_OWORD *)&self[1].__opaque[32];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[1].__opaque[16];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setStreamRequestQueue:(id)a3
{
}

- (NSMutableArray)streamRequestQueue
{
  return self->_streamRequestQueue;
}

- (void)setOngoingNotifications:(id)a3
{
}

- (NSMutableSet)ongoingNotifications
{
  return self->_ongoingNotifications;
}

- (void)setQueuedNotification:(id)a3
{
}

- (NSMutableDictionary)queuedNotification
{
  return self->_queuedNotification;
}

- (void)removeStreamId:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v6 = VSGetLogDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_226CB1000, v6, OS_LOG_TYPE_INFO, "Remove notification %@", (uint8_t *)&v9, 0xCu);
  }

  v7 = [(VSInlineStreamService *)self ongoingNotifications];
  [v7 removeObject:v4];

  v8 = [(VSInlineStreamService *)self queuedNotification];
  [v8 removeObjectForKey:v4];

  pthread_mutex_unlock(p_lock);
}

- (void)startStreamingWithId:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22 = self;
  p_lock = &self->_lock;
  pthread_mutex_lock(p_lock);
  v6 = VSGetLogDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v32 = v4;
    _os_log_impl(&dword_226CB1000, v6, OS_LOG_TYPE_INFO, "Start notifying for: %@", buf, 0xCu);
  }

  v7 = [(VSInlineStreamService *)v22 ongoingNotifications];
  [v7 addObject:v4];

  v8 = [(VSInlineStreamService *)v22 queuedNotification];
  int v9 = [v8 objectForKeyedSubscript:v4];

  id v10 = VSGetLogDefault();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      int v12 = [v9 count];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v32 = v12;
      *(_WORD *)&v32[4] = 2112;
      *(void *)&v32[6] = v4;
      _os_log_impl(&dword_226CB1000, v10, OS_LOG_TYPE_INFO, "%d cached objects found for notification: %@", buf, 0x12u);
    }
    v13 = v4;

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v21 = v9;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v20 = [(VSInlineStreamService *)v22 notifyQueue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __46__VSInlineStreamService_startStreamingWithId___block_invoke;
          block[3] = &unk_2647DCED8;
          id v24 = v13;
          uint64_t v25 = v19;
          dispatch_async(v20, block);
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v16);
    }

    [v14 removeAllObjects];
    id v4 = v13;
    int v9 = v21;
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v32 = v4;
      _os_log_impl(&dword_226CB1000, v10, OS_LOG_TYPE_INFO, "No cached object found for notification %@.", buf, 0xCu);
    }
  }
  pthread_mutex_unlock(p_lock);
}

void __46__VSInlineStreamService_startStreamingWithId___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_226CB1000, v2, OS_LOG_TYPE_INFO, "Notify %@ with cached object %@", (uint8_t *)&v6, 0x16u);
  }

  long long v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:*(void *)(a1 + 32) object:*(void *)(a1 + 40)];
}

- (void)enqueueStreamId:(id)a3 withObject:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  uint64_t v9 = [(VSInlineStreamService *)self ongoingNotifications];
  int v10 = [v9 containsObject:v6];

  BOOL v11 = VSGetLogDefault();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl(&dword_226CB1000, v11, OS_LOG_TYPE_INFO, "Notification for %@ is on-going. Posting object immediately %@", buf, 0x16u);
    }

    v13 = [(VSInlineStreamService *)self notifyQueue];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __52__VSInlineStreamService_enqueueStreamId_withObject___block_invoke;
    v17[3] = &unk_2647DCED8;
    id v18 = v6;
    id v19 = v7;
    dispatch_async(v13, v17);

    pthread_mutex_unlock(p_lock);
    id v14 = v18;
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl(&dword_226CB1000, v11, OS_LOG_TYPE_INFO, "Notification for %@ has not started. Cache object %@", buf, 0x16u);
    }

    uint64_t v15 = [(VSInlineStreamService *)self queuedNotification];
    id v14 = [v15 objectForKeyedSubscript:v6];

    if (!v14)
    {
      id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v16 = [(VSInlineStreamService *)self queuedNotification];
      [v16 setObject:v14 forKeyedSubscript:v6];
    }
    [v14 addObject:v7];
    pthread_mutex_unlock(p_lock);
  }
}

void __52__VSInlineStreamService_enqueueStreamId_withObject___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:*(void *)(a1 + 32) object:*(void *)(a1 + 40)];
}

- (BOOL)hasInlineStreamRequestForSpeakRequest:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(VSInlineStreamService *)self streamRequestQueue];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) text];
        BOOL v11 = [v4 text];
        char v12 = [v10 isEqualToString:v11];

        if (v12)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  pthread_mutex_unlock(p_lock);
  return v7;
}

- (id)popInlineStreamRequestForSpeakRequest:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&self->_lock);
  long long v5 = [(VSInlineStreamService *)self streamRequestQueue];
  id v6 = [v5 firstObject];

  if (v6)
  {
    do
    {
      uint64_t v7 = [(VSInlineStreamService *)self streamRequestQueue];
      [v7 removeObjectAtIndex:0];

      uint64_t v8 = [v6 text];
      uint64_t v9 = [v4 text];
      char v10 = [v8 isEqualToString:v9];

      if (v10) {
        break;
      }
      BOOL v11 = [v6 identifier];
      [(VSInlineStreamService *)self removeStreamId:v11];

      char v12 = [(VSInlineStreamService *)self streamRequestQueue];
      uint64_t v13 = [v12 firstObject];

      id v6 = (void *)v13;
    }
    while (v13);
  }
  pthread_mutex_unlock(&self->_lock);

  return v6;
}

- (void)addInlineStreamRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  id v6 = [(VSInlineStreamService *)self streamRequestQueue];
  [v6 addObject:v4];

  uint64_t v7 = VSGetLogDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v4 identifier];
    uint64_t v9 = [v4 logText];
    int v10 = 138412546;
    BOOL v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    _os_log_impl(&dword_226CB1000, v7, OS_LOG_TYPE_DEFAULT, "Received inline streaming TTS with id %@, text: %@", (uint8_t *)&v10, 0x16u);
  }
  pthread_mutex_unlock(p_lock);
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)VSInlineStreamService;
  [(VSInlineStreamService *)&v3 dealloc];
}

- (VSInlineStreamService)init
{
  v13.receiver = self;
  v13.super_class = (Class)VSInlineStreamService;
  id v2 = [(VSInlineStreamService *)&v13 init];
  if (v2)
  {
    objc_super v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    queuedNotification = v2->_queuedNotification;
    v2->_queuedNotification = v3;

    uint64_t v5 = [MEMORY[0x263EFF980] array];
    streamRequestQueue = v2->_streamRequestQueue;
    v2->_streamRequestQueue = (NSMutableArray *)v5;

    uint64_t v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    ongoingNotifications = v2->_ongoingNotifications;
    v2->_ongoingNotifications = v7;

    pthread_mutexattr_init(&v2->_recursiveLockAttr);
    pthread_mutexattr_settype(&v2->_recursiveLockAttr, 2);
    pthread_mutex_init(&v2->_lock, &v2->_recursiveLockAttr);
    uint64_t v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.voiced.VSInlineStreamService", v9);
    notifyQueue = v2->_notifyQueue;
    v2->_notifyQueue = (OS_dispatch_queue *)v10;
  }
  return v2;
}

+ (id)sharedService
{
  if (sharedService_onceToken_2889 != -1) {
    dispatch_once(&sharedService_onceToken_2889, &__block_literal_global_2890);
  }
  id v2 = (void *)sharedService___sharedQueue;
  return v2;
}

uint64_t __38__VSInlineStreamService_sharedService__block_invoke()
{
  sharedService___sharedQueue = objc_alloc_init(VSInlineStreamService);
  return MEMORY[0x270F9A758]();
}

@end