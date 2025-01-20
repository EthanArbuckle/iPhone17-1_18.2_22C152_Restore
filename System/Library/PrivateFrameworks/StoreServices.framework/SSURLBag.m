@interface SSURLBag
+ (id)URLBagForContext:(id)a3;
+ (void)setURLBag:(id)a3 forContext:(id)a4;
- (NSDictionary)existingBagDictionary;
- (NSString)storeFrontIdentifier;
- (SSURLBag)init;
- (SSURLBag)initWithURLBagContext:(id)a3;
- (SSURLBagContext)URLBagContext;
- (id)_connection;
- (id)valueForKey:(id)a3 error:(id *)a4;
- (void)_drainPendingLookupsWithError:(id)a3;
- (void)_loadURLBag;
- (void)_loadWithCompletionBlock:(id)a3;
- (void)dealloc;
- (void)dispatchAsync:(id)a3;
- (void)dispatchSync:(id)a3;
- (void)getTrustForURL:(id)a3 completionBlock:(id)a4;
- (void)invalidate;
- (void)loadValueForKey:(id)a3 completionBlock:(id)a4;
@end

@implementation SSURLBag

- (SSURLBag)init
{
  v3 = objc_alloc_init(SSURLBagContext);
  v4 = [(SSURLBag *)self initWithURLBagContext:v3];

  return v4;
}

- (SSURLBag)initWithURLBagContext:(id)a3
{
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SSURLBag;
    v4 = [(SSURLBag *)&v6 init];
    if (v4)
    {
      v4->_context = (SSURLBagContext *)[a3 copy];
      v4->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.storeservices.SSURLBag", 0);
      v4->_expirationTime = -1.79769313e308;
    }
  }
  else
  {

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil bagContext"];
    return 0;
  }
  return v4;
}

- (void)dealloc
{
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)SSURLBag;
  [(SSURLBag *)&v4 dealloc];
}

+ (id)URLBagForContext:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  pthread_mutex_lock(&__URLBagsLock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v4 = (void *)__URLBags;
  uint64_t v5 = [(id)__URLBags countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
LABEL_4:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v4);
      }
      v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
      if (objc_msgSend((id)objc_msgSend(v8, "URLBagContext"), "isEqual:", a3)) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          goto LABEL_4;
        }
        goto LABEL_12;
      }
    }
    v9 = v8;
    if (v9) {
      goto LABEL_15;
    }
  }
LABEL_12:
  if (!__URLBags) {
    __URLBags = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  v9 = [[SSURLBag alloc] initWithURLBagContext:a3];
  [(id)__URLBags addObject:v9];
LABEL_15:
  pthread_mutex_unlock(&__URLBagsLock);
  return v9;
}

- (void)getTrustForURL:(id)a3 completionBlock:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__SSURLBag_getTrustForURL_completionBlock___block_invoke;
  v4[3] = &unk_1E5BAB968;
  v4[4] = a3;
  v4[5] = a4;
  [(SSURLBag *)self loadValueForKey:@"trustedDomains" completionBlock:v4];
}

uint64_t __43__SSURLBag_getTrustForURL_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    objc_super v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v4();
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = (void *)[*(id *)(a1 + 32) host];
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v8 = [a2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        char v10 = 0;
        uint64_t v11 = *(void *)v15;
LABEL_8:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(a2);
          }
          long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 length])
          {
            if ([v13 hasPrefix:@"."]) {
              char v10 = [v7 hasSuffix:v13];
            }
            else {
              char v10 = [v7 caseInsensitiveCompare:v13] == 0;
            }
          }
          if (v10) {
            break;
          }
          if (v9 == ++v12)
          {
            uint64_t v9 = [a2 countByEnumeratingWithState:&v14 objects:v18 count:16];
            if (v9) {
              goto LABEL_8;
            }
            return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
          }
        }
      }
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__SSURLBag_invalidate__block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

void __22__SSURLBag_invalidate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = 0;
  *(void *)(*(void *)(a1 + 32) + 64) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
}

- (void)loadValueForKey:(id)a3 completionBlock:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__SSURLBag_loadValueForKey_completionBlock___block_invoke;
  v4[3] = &unk_1E5BAB990;
  v4[4] = a3;
  v4[5] = a4;
  [(SSURLBag *)self _loadWithCompletionBlock:v4];
}

uint64_t __44__SSURLBag_loadValueForKey_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2)
  {
    a2 = (void *)[a2 objectForKey:*(void *)(a1 + 32)];
    objc_super v4 = *(uint64_t (**)(uint64_t, void *, uint64_t))(v3 + 16);
    uint64_t v5 = v3;
    a3 = 0;
  }
  else
  {
    objc_super v4 = *(uint64_t (**)(uint64_t, void *, uint64_t))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 40);
  }
  return v4(v5, a2, a3);
}

- (SSURLBagContext)URLBagContext
{
  v2 = (void *)[(SSURLBagContext *)self->_context copy];
  return (SSURLBagContext *)v2;
}

- (id)valueForKey:(id)a3 error:(id *)a4
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__34;
  v22 = __Block_byref_object_dispose__34;
  uint64_t v23 = 0;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3052000000;
  long long v15 = __Block_byref_object_copy__34;
  long long v16 = __Block_byref_object_dispose__34;
  uint64_t v17 = 0;
  uint64_t v7 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __30__SSURLBag_valueForKey_error___block_invoke;
  v11[3] = &unk_1E5BAB9B8;
  v11[5] = &v18;
  v11[6] = &v12;
  v11[4] = v7;
  [(SSURLBag *)self loadValueForKey:a3 completionBlock:v11];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v7);
  id v8 = (id)v13[5];
  if (a4) {
    *a4 = (id)v13[5];
  }
  id v9 = (id)v19[5];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

intptr_t __30__SSURLBag_valueForKey_error___block_invoke(void *a1, void *a2, void *a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = a2;
  *(void *)(*(void *)(a1[6] + 8) + 40) = a3;
  uint64_t v5 = a1[4];
  return dispatch_semaphore_signal(v5);
}

- (NSDictionary)existingBagDictionary
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  id v9 = __Block_byref_object_copy__34;
  char v10 = __Block_byref_object_dispose__34;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__SSURLBag_existingBagDictionary__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  uint64_t v3 = (NSDictionary *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __33__SSURLBag_existingBagDictionary__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 24);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (void)setURLBag:(id)a3 forContext:(id)a4
{
  pthread_mutex_lock(&__URLBagsLock);
  id v6 = (id)__URLBags;
  if (!__URLBags)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    __URLBags = (uint64_t)v6;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__SSURLBag_setURLBag_forContext___block_invoke;
  v8[3] = &unk_1E5BAB9E0;
  v8[4] = a4;
  uint64_t v7 = [v6 indexOfObjectPassingTest:v8];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    [(id)__URLBags removeObjectAtIndex:v7];
  }
  if (a3) {
    [(id)__URLBags addObject:a3];
  }
  pthread_mutex_unlock(&__URLBagsLock);
}

uint64_t __33__SSURLBag_setURLBag_forContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 URLBagContext];
  uint64_t v4 = *(void *)(a1 + 32);
  return [v3 isEqual:v4];
}

- (void)dispatchAsync:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __26__SSURLBag_dispatchAsync___block_invoke;
  v4[3] = &unk_1E5BA7728;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __26__SSURLBag_dispatchAsync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16));
}

- (void)dispatchSync:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __25__SSURLBag_dispatchSync___block_invoke;
  v4[3] = &unk_1E5BA7728;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __25__SSURLBag_dispatchSync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16));
}

- (id)_connection
{
  id result = self->_connection;
  if (!result)
  {
    id result = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
    self->_connection = (SSXPCConnection *)result;
  }
  return result;
}

- (void)_drainPendingLookupsWithError:(id)a3
{
  uint64_t v5 = (void *)[(NSMutableArray *)self->_pendingLookups copy];
  [(NSMutableArray *)self->_pendingLookups removeAllObjects];
  id v6 = (void *)[(NSDictionary *)self->_dictionary copy];
  global_queue = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__SSURLBag__drainPendingLookupsWithError___block_invoke;
  v8[3] = &unk_1E5BABA08;
  v8[4] = self;
  void v8[5] = v5;
  v8[6] = v6;
  v8[7] = a3;
  dispatch_async(global_queue, v8);
}

uint64_t __42__SSURLBag__drainPendingLookupsWithError___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t result = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t result = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

- (void)_loadURLBag
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v3 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v3) {
      id v3 = +[SSLogConfig sharedConfig];
    }
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    if (os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      int v6 = v5;
    }
    else {
      int v6 = v5 & 2;
    }
    if (v6)
    {
      int v22 = 136446210;
      uint64_t v23 = "-[SSURLBag _loadURLBag]";
      LODWORD(v20) = 12;
      uint64_t v19 = &v22;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        long long v8 = (void *)v7;
        uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v22, v20);
        free(v8);
        SSFileLog(v3, @"%@", v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v16, "0", 25);
  if (self->_ignoreCacheForNextLookup)
  {
    uint64_t v17 = (__CFString *)[(SSURLBagContext *)self->_context copy];
    [(__CFString *)v17 setIgnoresCaches:1];
    SSXPCDictionarySetCFObject(v16, "1", v17);
    self->_ignoreCacheForNextLookup = 0;
  }
  else
  {
    SSXPCDictionarySetCFObject(v16, "1", (__CFString *)self->_context);
  }
  id v18 = [(SSURLBag *)self _connection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __23__SSURLBag__loadURLBag__block_invoke;
  v21[3] = &unk_1E5BAA290;
  v21[4] = self;
  [v18 sendMessage:v16 withReply:v21];
  xpc_release(v16);
}

void __23__SSURLBag__loadURLBag__block_invoke(uint64_t a1, void *a2)
{
  if (a2 && MEMORY[0x1A62689E0](a2) == MEMORY[0x1E4F14590])
  {
    CFArrayRef v4 = SSXPCDictionaryCopyCFObject(a2, "0");
    int v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
  }
  else
  {
    CFArrayRef v4 = 0;
    int v5 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    xpc_retain(a2);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(NSObject **)(v6 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __23__SSURLBag__loadURLBag__block_invoke_3;
    v10[3] = &unk_1E5BA8630;
    v10[4] = a2;
    v10[5] = v6;
    v10[6] = v4;
    long long v8 = v10;
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v7 = *(NSObject **)(v9 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __23__SSURLBag__loadURLBag__block_invoke_2;
    block[3] = &unk_1E5BA7448;
    block[4] = v9;
    void block[5] = v5;
    long long v8 = block;
  }
  dispatch_async(v7, v8);
}

uint64_t __23__SSURLBag__loadURLBag__block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  if (!v1) {
    uint64_t v1 = SSError(@"SSErrorDomain", 100, 0, 0);
  }
  return [v2 _drainPendingLookupsWithError:v1];
}

void __23__SSURLBag__loadURLBag__block_invoke_3(xpc_object_t *a1)
{
  xpc_object_t value = xpc_dictionary_get_value(a1[4], "1");
  if (!value || (id v3 = value, MEMORY[0x1A62689E0]() != MEMORY[0x1E4F14598]))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v5 = 86400.0;
LABEL_4:
    double v6 = Current + v5;
    uint64_t v7 = (double *)a1[5];
    goto LABEL_5;
  }
  *((double *)a1[5] + 5) = xpc_double_get_value(v3);
  double v10 = *((double *)a1[5] + 5);
  if (v10 <= CFAbsoluteTimeGetCurrent() + 60.0)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v5 = 60.0;
    goto LABEL_4;
  }
  uint64_t v7 = (double *)a1[5];
  double v6 = v7[5];
LABEL_5:
  v7[5] = v6;

  *((void *)a1[5] + 3) = [a1[6] copy];
  xpc_object_t v8 = a1[4];
  objc_opt_class();
  *((void *)a1[5] + 8) = SSXPCDictionaryCopyCFObjectWithClass(v8, "3");
  [a1[5] _drainPendingLookupsWithError:0];
  xpc_object_t v9 = a1[4];
  xpc_release(v9);
}

- (void)_loadWithCompletionBlock:(id)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = __Block_byref_object_copy__34;
  uint64_t v14 = __Block_byref_object_dispose__34;
  uint64_t v15 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SSURLBag__loadWithCompletionBlock___block_invoke;
  block[3] = &unk_1E5BAA0A8;
  block[4] = self;
  void block[5] = &v10;
  dispatch_sync(dispatchQueue, block);
  uint64_t v6 = v11[5];
  if (v6)
  {
    (*((void (**)(id, uint64_t, void))a3 + 2))(a3, v6, 0);
  }
  else
  {
    uint64_t v7 = self->_dispatchQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __37__SSURLBag__loadWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E5BAA2E0;
    v8[4] = self;
    void v8[5] = a3;
    dispatch_sync(v7, v8);
  }
  _Block_object_dispose(&v10, 8);
}

void __37__SSURLBag__loadWithCompletionBlock___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(*(void *)(a1 + 32) + 40);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFArrayRef v4 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2 <= Current)
  {

    *(void *)(*(void *)(a1 + 32) + 24) = 0;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v4;
  }
}

uint64_t __37__SSURLBag__loadWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 56)) {
    *(void *)(*(void *)(a1 + 32) + 56) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  double v2 = (void *)[*(id *)(a1 + 40) copy];
  [*(id *)(*(void *)(a1 + 32) + 56) addObject:v2];

  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) count];
  if (result == 1)
  {
    CFArrayRef v4 = *(void **)(a1 + 32);
    return [v4 _loadURLBag];
  }
  return result;
}

- (NSString)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

@end