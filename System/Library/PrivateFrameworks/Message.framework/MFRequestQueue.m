@interface MFRequestQueue
+ (OS_os_log)log;
+ (id)signpostLog;
- (BOOL)_processRequests:(id)a3;
- (BOOL)addRequest:(id)a3;
- (BOOL)addRequests:(id)a3;
- (BOOL)addRequests:(id)a3 combine:(BOOL)a4;
- (BOOL)processRequest:(id)a3;
- (BOOL)processRequests:(id)a3;
- (BOOL)sendRequests:(id)a3;
- (MFRequestQueue)init;
- (NSMutableArray)requestPairs;
- (unint64_t)signpostID;
- (void)setRequestPairs:(id)a3;
@end

@implementation MFRequestQueue

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__MFRequestQueue_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_29 != -1) {
    dispatch_once(&log_onceToken_29, block);
  }
  v2 = (void *)log_log_29;
  return (OS_os_log *)v2;
}

void __21__MFRequestQueue_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_29;
  log_log_29 = (uint64_t)v1;
}

+ (id)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__MFRequestQueue_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_1 != -1) {
    dispatch_once(&signpostLog_onceToken_1, block);
  }
  v2 = (void *)signpostLog_log_1;
  return v2;
}

void __29__MFRequestQueue_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log_1;
  signpostLog_log_1 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (MFRequestQueue)init
{
  v7.receiver = self;
  v7.super_class = (Class)MFRequestQueue;
  v2 = [(MFRequestQueue *)&v7 init];
  id v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    os_signpost_id_t v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    requestPairs = v3->_requestPairs;
    v3->_requestPairs = v4;
  }
  return v3;
}

- (BOOL)addRequests:(id)a3
{
  return [(MFRequestQueue *)self addRequests:a3 combine:0];
}

- (BOOL)addRequests:(id)a3 combine:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = v6;
  if (v4)
  {
    char v8 = [(MFRequestQueue *)self sendRequests:v6];
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v17;
      char v8 = 1;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v20 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v20, 1, (void)v16);
          BOOL v14 = [(MFRequestQueue *)self sendRequests:v13];

          v8 &= v14;
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v10);
    }
    else
    {
      char v8 = 1;
    }
  }
  return v8;
}

- (BOOL)addRequest:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  LOBYTE(self) = [(MFRequestQueue *)self sendRequests:v5];

  return (char)self;
}

- (BOOL)sendRequests:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 firstObject];
  id v6 = [v5 first];

  objc_super v7 = objc_opt_class();
  char v8 = +[MFRequestQueue signpostLog];
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  uint64_t v10 = +[MFRequestQueue signpostLog];
  uint64_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    int v17 = 138543874;
    long long v18 = v7;
    __int16 v19 = 2050;
    uint64_t v20 = [v7 hash];
    __int16 v21 = 2050;
    uint64_t v22 = [v4 count];
    _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "REQUEST QUEUE", "RequestClass=%{signpost.description:attribute,public}@ RequestType=%{public, signpost.telemetry:number1}lu RequestCount=%{public, signpost.telemetry:number2}lu enableTelemetry=YES ", (uint8_t *)&v17, 0x20u);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v13 = [(MFRequestQueue *)self _processRequests:v4];
  os_unfair_lock_unlock(p_lock);
  BOOL v14 = +[MFRequestQueue signpostLog];
  v15 = v14;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v15, OS_SIGNPOST_INTERVAL_END, v9, "REQUEST QUEUE", "", (uint8_t *)&v17, 2u);
  }

  return v13;
}

- (BOOL)processRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 second];
  v5 = [v3 first];
  [v4 handleResponse:v5 error:0];

  return 1;
}

- (BOOL)_processRequests:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(MFRequestQueue *)self processRequests:v4];

  return (char)self;
}

- (BOOL)processRequests:(id)a3
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__MFRequestQueue_processRequests___block_invoke;
  v5[3] = &unk_1E5D3B550;
  v5[4] = self;
  v5[5] = &v6;
  [a3 enumerateObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__MFRequestQueue_processRequests___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) processRequest:a2];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

- (NSMutableArray)requestPairs
{
  return self->_requestPairs;
}

- (void)setRequestPairs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end