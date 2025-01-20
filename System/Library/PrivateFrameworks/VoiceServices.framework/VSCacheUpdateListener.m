@interface VSCacheUpdateListener
+ (id)sharedListener;
+ (id)sharedListenerIfExists;
- (VSCacheUpdateListener)init;
- (id)_initShared;
- (void)_enqueueRequest:(id)a3;
- (void)_flush;
- (void)_spokenLanguageChanged:(id)a3;
- (void)dealloc;
- (void)performUpdateForModelIdentifier:(id)a3 classIdentifier:(id)a4;
- (void)startListening;
- (void)stopListening;
@end

@implementation VSCacheUpdateListener

- (void)_flush
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(NSLock *)self->_lock lock];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  updateRequestQueue = self->_updateRequestQueue;
  uint64_t v4 = [(NSMutableArray *)updateRequestQueue countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(updateRequestQueue);
        }
        VSRecognitionConfigurationCacheUpdate((const __CFString *)[*(id *)(*((void *)&v8 + 1) + 8 * i) modelIdentifier], (const __CFString *)objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "classIdentifier"));
      }
      uint64_t v5 = [(NSMutableArray *)updateRequestQueue countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(NSMutableArray *)self->_updateRequestQueue removeAllObjects];
  [(NSTimer *)self->_flushTimer invalidate];

  self->_flushTimer = 0;
  [(NSLock *)self->_lock unlock];
}

- (void)_enqueueRequest:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  [(NSLock *)self->_lock lock];
  if (self->_isListening)
  {
    uint64_t v5 = VSGetLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 138412290;
      id v21 = a3;
      _os_log_debug_impl(&dword_20CABC000, v5, OS_LOG_TYPE_DEBUG, "Enqueuing request: %@", (uint8_t *)&v20, 0xCu);
    }
    uint64_t v6 = [(NSMutableArray *)self->_updateRequestQueue count];
    if (v6)
    {
      unint64_t v7 = v6;
      char v8 = 0;
      unint64_t v9 = 0;
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      id v11 = a3;
      while (1)
      {
        v12 = (void *)[(NSMutableArray *)self->_updateRequestQueue objectAtIndex:v9];
        uint64_t v13 = (void *)[v12 coalescedRequest:v11];
        if (v13 == v12) {
          break;
        }
        a3 = v13;
        if (v13)
        {
          if (v10 == 0x7FFFFFFFFFFFFFFFLL)
          {
            [(NSMutableArray *)self->_updateRequestQueue replaceObjectAtIndex:v9 withObject:v13];
            char v8 = 1;
            uint64_t v10 = v9;
          }
          else
          {
            updateRequestQueue = self->_updateRequestQueue;
            if (a3 == v11)
            {
              a3 = v11;
            }
            else
            {
              [(NSMutableArray *)updateRequestQueue replaceObjectAtIndex:v10 withObject:a3];
              updateRequestQueue = self->_updateRequestQueue;
            }
            [(NSMutableArray *)updateRequestQueue removeObjectAtIndex:v9--];
            --v7;
            char v8 = 1;
          }
        }
        else
        {
          a3 = v11;
        }
        ++v9;
        id v11 = a3;
        if (v9 >= v7) {
          goto LABEL_18;
        }
      }
      if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
        [(NSMutableArray *)self->_updateRequestQueue removeObjectAtIndex:v10];
      }
    }
    else
    {
      char v8 = 0;
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_18:
      if (v10 == 0x7FFFFFFFFFFFFFFFLL && (v8 & 1) == 0) {
        [(NSMutableArray *)self->_updateRequestQueue addObject:a3];
      }
    }
    flushTimer = self->_flushTimer;
    if (flushTimer)
    {
      -[NSTimer setFireDate:](flushTimer, "setFireDate:", [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:3.0]);
    }
    else
    {
      self->_flushTimer = (NSTimer *)[MEMORY[0x263EFFA20] timerWithTimeInterval:self target:sel__flush selector:0 userInfo:0 repeats:3.0];
      v16 = (void *)[MEMORY[0x263EFF9F0] mainRunLoop];
      [v16 addTimer:self->_flushTimer forMode:*MEMORY[0x263EFF588]];
      v17 = self->_flushTimer;
    }
    v18 = VSGetLogDefault();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = self->_updateRequestQueue;
      int v20 = 138412290;
      id v21 = v19;
      _os_log_debug_impl(&dword_20CABC000, v18, OS_LOG_TYPE_DEBUG, "Queue is now:\n%@", (uint8_t *)&v20, 0xCu);
    }
  }
  [(NSLock *)self->_lock unlock];
}

- (void)_spokenLanguageChanged:(id)a3
{
}

- (void)performUpdateForModelIdentifier:(id)a3 classIdentifier:(id)a4
{
  uint64_t v5 = [[VSCacheUpdateRequest alloc] initWithModelIdentifier:a3 classIdentifier:a4];
  [(VSCacheUpdateListener *)self _enqueueRequest:v5];
}

- (void)stopListening
{
  [(NSLock *)self->_lock lock];
  if (self->_isListening)
  {
    self->_isListening = 0;
    dataProviders = self->_dataProviders;
    self->_dataProviders = 0;
    [(NSLock *)self->_lock unlock];
    [(NSArray *)[(NSDictionary *)dataProviders allValues] makeObjectsPerformSelector:sel_stopReportingChanges];

    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, @"com.apple.voiceservices.language", 0);
    [(VSCacheUpdateListener *)self _flush];
  }
  else
  {
    lock = self->_lock;
    [(NSLock *)lock unlock];
  }
}

- (void)startListening
{
  [(NSLock *)self->_lock lock];
  if (self->_isListening)
  {
    lock = self->_lock;
    [(NSLock *)lock unlock];
  }
  else
  {
    self->_isListening = 1;
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", self, sel__spokenLanguageChanged_, @"com.apple.voiceservices.language", 0);
    [(NSLock *)self->_lock unlock];
    if (!self->_dataProviders)
    {
      global_queue = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __39__VSCacheUpdateListener_startListening__block_invoke;
      block[3] = &unk_2640E8B78;
      block[4] = self;
      dispatch_async(global_queue, block);
    }
  }
}

void __39__VSCacheUpdateListener_startListening__block_invoke(uint64_t a1)
{
  v2 = VSCopyUpdatableRecognitionModelDataProviderInfos();
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __39__VSCacheUpdateListener_startListening__block_invoke_2;
  v3[3] = &unk_2640E8520;
  v3[4] = *(void *)(a1 + 32);
  v3[5] = v2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

BOOL __39__VSCacheUpdateListener_startListening__block_invoke_2(uint64_t a1)
{
  id context = 0;
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 40);
  if (v2)
  {
    CFDictionaryApplyFunction(v2, (CFDictionaryApplierFunction)_AddDataProviderToArrayFromInfo, &context);
    CFRelease(*(CFTypeRef *)(a1 + 40));
    objc_msgSend((id)objc_msgSend(context, "allValues"), "makeObjectsPerformSelector:", sel_beginReportingChanges);
    [*(id *)(*(void *)(a1 + 32) + 8) lock];
    uint64_t v3 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v3 + 40))
    {
      [*(id *)(v3 + 8) unlock];
      objc_msgSend((id)objc_msgSend(context, "allValues"), "makeObjectsPerformSelector:", sel_stopReportingChanges);

      return VSRecognitionConfigurationCacheUpdate(0, 0);
    }

    *(void *)(*(void *)(a1 + 32) + 24) = context;
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 8) lock];

    *(void *)(*(void *)(a1 + 32) + 24) = objc_alloc_init(NSDictionary);
  }
  [*(id *)(*(void *)(a1 + 32) + 8) unlock];
  return VSRecognitionConfigurationCacheUpdate(0, 0);
}

- (void)dealloc
{
  [(VSCacheUpdateListener *)self stopListening];

  v3.receiver = self;
  v3.super_class = (Class)VSCacheUpdateListener;
  [(VSCacheUpdateListener *)&v3 dealloc];
}

- (id)_initShared
{
  v4.receiver = self;
  v4.super_class = (Class)VSCacheUpdateListener;
  CFDictionaryRef v2 = [(VSCacheUpdateListener *)&v4 init];
  if (v2)
  {
    v2->_lock = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    v2->_updateRequestQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    VSPreferencesInitialize();
  }
  return v2;
}

- (VSCacheUpdateListener)init
{
  return 0;
}

+ (id)sharedListenerIfExists
{
  return (id)__SharedListener;
}

+ (id)sharedListener
{
  if (sharedListener_onceToken != -1) {
    dispatch_once(&sharedListener_onceToken, &__block_literal_global_1995);
  }
  return (id)__SharedListener;
}

id __39__VSCacheUpdateListener_sharedListener__block_invoke()
{
  id result = [[VSCacheUpdateListener alloc] _initShared];
  __SharedListener = (uint64_t)result;
  return result;
}

@end