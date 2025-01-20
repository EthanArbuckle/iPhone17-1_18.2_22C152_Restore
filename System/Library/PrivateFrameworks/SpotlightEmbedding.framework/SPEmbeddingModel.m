@interface SPEmbeddingModel
+ (id)log;
+ (id)sharedInstance;
+ (unint64_t)version;
- (BOOL)deviceCanGenerateEmbeddings;
- (BOOL)hardwareSupportsEmbedding;
- (SPEmbeddingModel)init;
- (id)_processAttributedString:(id)a3;
- (id)_processText:(id)a3;
- (id)_processTextInputs:(id)a3 error:(id *)a4;
- (id)_processTokenIDs:(id)a3;
- (id)generateEmbeddingForTextInputs:(id)a3 extendedContextLength:(BOOL)a4 bundleID:(id)a5 queryID:(int64_t)a6 timeout:(int64_t)a7 useCLIPSafety:(BOOL)a8 workCost:(int64_t *)a9 error:(id *)a10;
- (id)generateEmbeddingForTextInputs:(id)a3 extendedContextLength:(BOOL)a4 bundleID:(id)a5 queryID:(int64_t)a6 timeout:(int64_t)a7 workCost:(int64_t *)a8 error:(id *)a9;
- (id)generateEmbeddingForTextInputs:(id)a3 extendedContextLength:(BOOL)a4 queryID:(int64_t)a5 timeout:(int64_t)a6 error:(id *)a7;
- (id)generateEmbeddingForTextInputs:(id)a3 extendedContextLength:(BOOL)a4 queryID:(int64_t)a5 timeout:(int64_t)a6 useCLIPSafety:(BOOL)a7 workCost:(int64_t *)a8 error:(id *)a9;
- (id)generateEmbeddingForTextInputs:(id)a3 extendedContextLength:(BOOL)a4 queryID:(int64_t)a5 timeout:(int64_t)a6 workCost:(int64_t *)a7 error:(id *)a8;
- (void)_initModel;
- (void)cancelQueryID:(int64_t)a3;
- (void)cancelRequestID:(int)a3;
- (void)clear;
- (void)clearQueryID:(int64_t)a3 requestID:(int)a4;
- (void)hardwareSupportsEmbedding;
- (void)preheatWithCompletionHandler:(id)a3;
@end

@implementation SPEmbeddingModel

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sSharedInstance;

  return v2;
}

uint64_t __34__SPEmbeddingModel_sharedInstance__block_invoke()
{
  sharedInstance_sSharedInstance = objc_alloc_init(SPEmbeddingModel);

  return MEMORY[0x270F9A758]();
}

- (SPEmbeddingModel)init
{
  v12.receiver = self;
  v12.super_class = (Class)SPEmbeddingModel;
  v2 = [(SPEmbeddingModel *)&v12 init];
  v3 = v2;
  if (v2)
  {
    service = v2->_service;
    v2->_service = 0;

    requestIDs = v3->_requestIDs;
    v3->_requestIDs = 0;

    queryIDs = v3->_queryIDs;
    v3->_queryIDs = 0;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.SpotlightEmbedding.queue", v8);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;
  }
  return v3;
}

+ (id)log
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__SPEmbeddingModel_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, block);
  }
  v2 = (void *)log_log;

  return v2;
}

void __23__SPEmbeddingModel_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.spotlightembedding", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;
}

- (void)_initModel
{
  if (!self->_service)
  {
    id v3 = [MEMORY[0x263F54108] service];
    service = self->_service;
    self->_service = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    requestIDs = self->_requestIDs;
    self->_requestIDs = v5;

    self->_queryIDs = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    MEMORY[0x270F9A758]();
  }
}

+ (unint64_t)version
{
  return [MEMORY[0x263F54050] getUnifiedEmbeddingVersion];
}

- (BOOL)deviceCanGenerateEmbeddings
{
  unint64_t v3 = [MEMORY[0x263F413C8] currentWithUseCaseIdentifiers:&unk_270B0FA28];
  BOOL result = [(SPEmbeddingModel *)self hardwareSupportsEmbedding];
  if (v3 >= 2) {
    return 0;
  }
  return result;
}

- (BOOL)hardwareSupportsEmbedding
{
  if (getDeviceSupported_onceToken != -1) {
    dispatch_once(&getDeviceSupported_onceToken, &__block_literal_global_106);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[SPEmbeddingModel hardwareSupportsEmbedding]();
  }
  return getDeviceSupported_gDeviceSupported;
}

- (void)clear
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__SPEmbeddingModel_clear__block_invoke;
  block[3] = &unk_2655206D8;
  block[4] = self;
  dispatch_async(queue, block);
}

void *__25__SPEmbeddingModel_clear__block_invoke(uint64_t a1)
{
  BOOL result = *(void **)(*(void *)(a1 + 32) + 8);
  if (result)
  {
    [result cancelAllRequests];
    [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
    unint64_t v3 = *(void **)(*(void *)(a1 + 32) + 24);
    return (void *)[v3 removeAllObjects];
  }
  return result;
}

- (void)preheatWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(SPEmbeddingModel *)self deviceCanGenerateEmbeddings])
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __49__SPEmbeddingModel_preheatWithCompletionHandler___block_invoke;
    v7[3] = &unk_265520728;
    v7[4] = self;
    id v8 = v4;
    dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v7);
    dispatch_async(queue, v6);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __49__SPEmbeddingModel_preheatWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    qos_class_t v10 = qos_class_self();
    _os_log_impl(&dword_25E340000, v2, OS_LOG_TYPE_INFO, "preheat request as QOS (%d)", buf, 8u);
  }

  id v3 = objc_alloc_init(MEMORY[0x263F54110]);
  [*(id *)(a1 + 32) _initModel];
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v8 = v3;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:1];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__SPEmbeddingModel_preheatWithCompletionHandler___block_invoke_13;
  v6[3] = &unk_265520700;
  id v7 = *(id *)(a1 + 40);
  [v4 prewarmTextRequests:v5 completionHandler:v6];
}

void __49__SPEmbeddingModel_preheatWithCompletionHandler___block_invoke_13(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F08320];
    dispatch_block_t v6 = NSString;
    id v7 = [v3 description];
    id v8 = [v6 stringWithFormat:@"Text embedding model preheat failed, error: %@", v7];
    v14[0] = v8;
    dispatch_queue_t v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    qos_class_t v10 = [v5 errorWithDomain:@"com.apple.SpotlightEmbedding.EmbeddingModelError" code:-8003 userInfo:v9];

    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v10);
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
    }
  }
}

- (void)clearQueryID:(int64_t)a3 requestID:(int)a4
{
  if ([(SPEmbeddingModel *)self deviceCanGenerateEmbeddings]
    && a4 != -1
    && (a3 & 0x7FFFFFFFFFFFFFFFLL) != 0x7FFFFFFFFFFFFFFFLL)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__SPEmbeddingModel_clearQueryID_requestID___block_invoke;
    block[3] = &unk_265520750;
    int v9 = a4;
    block[4] = self;
    void block[5] = a3;
    dispatch_async(queue, block);
  }
}

void __43__SPEmbeddingModel_clearQueryID_requestID___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8))
  {
    id v3 = *(void **)(v1 + 16);
    id v4 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
    [v3 removeObjectForKey:v4];

    uint64_t v5 = *(void *)(a1 + 40);
    dispatch_block_t v6 = *(void **)(*(void *)(a1 + 32) + 24);
    id v7 = [NSNumber numberWithInteger:v5];
    [v6 removeObjectForKey:v7];
  }
}

- (void)cancelQueryID:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v5 = [(SPEmbeddingModel *)self deviceCanGenerateEmbeddings];
  if ((~a3 & 0x7FFFFFFFFFFFFFFFLL) != 0 && v5)
  {
    dispatch_block_t v6 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v10 = a3;
      _os_log_impl(&dword_25E340000, v6, OS_LOG_TYPE_INFO, "[qid=%ld] cancelQueryID", buf, 0xCu);
    }

    queue = self->_queue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __34__SPEmbeddingModel_cancelQueryID___block_invoke;
    v8[3] = &unk_265520778;
    v8[4] = self;
    v8[5] = a3;
    dispatch_async(queue, v8);
  }
}

void __34__SPEmbeddingModel_cancelQueryID___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8))
  {
    id v3 = *(void **)(v1 + 24);
    id v4 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
    BOOL v5 = [v3 objectForKey:v4];

    if (v5)
    {
      dispatch_block_t v6 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        int v11 = 134218240;
        uint64_t v12 = v7;
        __int16 v13 = 1024;
        int v14 = [v5 intValue];
        _os_log_impl(&dword_25E340000, v6, OS_LOG_TYPE_INFO, "[qid=%ld] cancelQueryID, requestID: %d", (uint8_t *)&v11, 0x12u);
      }

      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "cancelRequestID:", objc_msgSend(v5, "intValue"));
      [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:v5];
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = *(void **)(*(void *)(a1 + 32) + 24);
      int64_t v10 = [NSNumber numberWithInteger:v8];
      [v9 removeObjectForKey:v10];
    }
  }
}

- (void)cancelRequestID:(int)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v5 = [(SPEmbeddingModel *)self deviceCanGenerateEmbeddings];
  if (a3 != -1 && v5)
  {
    dispatch_block_t v6 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v11 = a3;
      _os_log_impl(&dword_25E340000, v6, OS_LOG_TYPE_INFO, "cancelRequestID, requestID: %d", buf, 8u);
    }

    queue = self->_queue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __36__SPEmbeddingModel_cancelRequestID___block_invoke;
    v8[3] = &unk_2655207A0;
    v8[4] = self;
    int v9 = a3;
    dispatch_async(queue, v8);
  }
}

void __36__SPEmbeddingModel_cancelRequestID___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v2)
  {
    [v2 cancelRequestID:*(unsigned int *)(a1 + 40)];
    id v3 = *(void **)(*(void *)(a1 + 32) + 16);
    id v4 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
    BOOL v5 = [v3 objectForKey:v4];

    dispatch_block_t v6 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = [v5 intValue];
      int v8 = *(_DWORD *)(a1 + 40);
      v11[0] = 67109376;
      v11[1] = v7;
      __int16 v12 = 1024;
      int v13 = v8;
      _os_log_impl(&dword_25E340000, v6, OS_LOG_TYPE_INFO, "[qid=%d] cancelRequestID, requestID: %d", (uint8_t *)v11, 0xEu);
    }

    if (v5) {
      [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:v5];
    }
    int v9 = *(void **)(*(void *)(a1 + 32) + 16);
    int64_t v10 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
    [v9 removeObjectForKey:v10];
  }
}

- (id)_processTextInputs:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v14 = [v13 type];
        switch(v14)
        {
          case 3:
            uint64_t v15 = [v13 attributedString];
            uint64_t v16 = [(SPEmbeddingModel *)self _processAttributedString:v15];
            break;
          case 2:
            uint64_t v15 = [v13 tokenIDs];
            uint64_t v16 = [(SPEmbeddingModel *)self _processTokenIDs:v15];
            break;
          case 1:
            uint64_t v15 = [v13 text];
            uint64_t v16 = [(SPEmbeddingModel *)self _processText:v15];
            break;
          default:
            if (a4)
            {
              v22 = (void *)MEMORY[0x263F087E8];
              uint64_t v31 = *MEMORY[0x263F08320];
              v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid input format (%lu)", objc_msgSend(v13, "type"));
              v32 = v23;
              v24 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
              *a4 = [v22 errorWithDomain:@"com.apple.SpotlightEmbedding.EmbeddingModelError" code:-8004 userInfo:v24];
            }
            v20 = 0;
            goto LABEL_19;
        }
        v17 = (void *)v16;

        if (!v17)
        {
          if (a4)
          {
            v18 = (void *)MEMORY[0x263F087E8];
            uint64_t v29 = *MEMORY[0x263F08320];
            v30 = @"Processing text input failed";
            v19 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
            *a4 = [v18 errorWithDomain:@"com.apple.SpotlightEmbedding.EmbeddingModelError" code:-8004 userInfo:v19];
          }
          goto LABEL_18;
        }
        [v7 addObject:v17];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  v20 = [MEMORY[0x263EFF8C0] arrayWithArray:v7];
LABEL_19:

  return v20;
}

- (id)_processText:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  BOOL v5 = [v3 whitespaceCharacterSet];
  id v6 = [v4 stringByTrimmingCharactersInSet:v5];

  if ([v6 length])
  {
    id v7 = objc_alloc_init(MEMORY[0x263F54120]);
    [v7 addText:v6];
  }
  else
  {
    id v8 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_25E340000, v8, OS_LOG_TYPE_INFO, "**Warning** Skipping embedding generation as text is empty", v10, 2u);
    }

    id v7 = 0;
  }

  return v7;
}

- (id)_processTokenIDs:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x263F54120]);
    BOOL v5 = [MEMORY[0x263EFF980] arrayWithArray:v3];
    if ([v5 count])
    {
      id v6 = [v5 objectAtIndexedSubscript:0];
      int v7 = [v6 isEqualToNumber:&unk_270B0FA10];

      if (v7) {
        [v5 removeObjectAtIndex:0];
      }
    }
    if ([v5 count])
    {
      id v8 = [v5 lastObject];
      int v9 = [v8 isEqualToNumber:&unk_270B0FA10];

      if (v9) {
        [v5 removeLastObject];
      }
    }
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];
    [v4 addTokenIDs:v10];
  }
  else
  {
    uint64_t v11 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v13 = 0;
      _os_log_impl(&dword_25E340000, v11, OS_LOG_TYPE_INFO, "**Warning** Skipping embedding generation as token IDs are empty", v13, 2u);
    }

    id v4 = 0;
  }

  return v4;
}

- (id)_processAttributedString:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    *(void *)v45 = 0;
    v46 = v45;
    uint64_t v47 = 0x3032000000;
    v48 = __Block_byref_object_copy_;
    v49 = __Block_byref_object_dispose_;
    id v50 = 0;
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x3010000000;
    uint64_t v43 = 0;
    uint64_t v44 = 0;
    v42 = &unk_25E346956;
    uint64_t v5 = [v3 length];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __45__SPEmbeddingModel__processAttributedString___block_invoke;
    v38[3] = &unk_2655207F0;
    v38[4] = v45;
    v38[5] = &v39;
    objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v38);
    id v6 = objc_alloc_init(MEMORY[0x263F54120]);
    if (!*((void *)v46 + 5))
    {
      int v7 = [v4 string];
      [v6 addText:v7];
    }
    uint64_t v8 = v40[5];
    if (v8 == [v4 length])
    {
      int v9 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25E340000, v9, OS_LOG_TYPE_INFO, "**Warning** Skipping embedding generation as query only contains person", buf, 2u);
      }

      id v10 = 0;
      goto LABEL_30;
    }
    uint64_t v12 = v40[4];
    if (!v12)
    {
LABEL_19:
      id v22 = objc_alloc(MEMORY[0x263F08C38]);
      v23 = (void *)[v22 initWithUUIDString:*((void *)v46 + 5)];
      [v6 addEntityUUID:v23];

      v24 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25E340000, v24, OS_LOG_TYPE_INFO, "Found person uuid from the query", buf, 2u);
      }

      uint64_t v25 = [v4 length];
      uint64_t v26 = v40[5] + v40[4];
      uint64_t v27 = v25 - v26;
      if (v25 - v26 < 1) {
        goto LABEL_29;
      }
      long long v28 = [v4 string];
      uint64_t v29 = objc_msgSend(v28, "substringWithRange:", v26, v27);

      v30 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      uint64_t v31 = [v29 stringByTrimmingCharactersInSet:v30];

      if ([v31 length])
      {
        [v6 addText:v31];
        v32 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          uint64_t v33 = [v29 length];
          *(_DWORD *)buf = 134217984;
          uint64_t v52 = v33;
          uint64_t v34 = "Found postString with %lu characters";
          v35 = v32;
          uint32_t v36 = 12;
LABEL_27:
          _os_log_impl(&dword_25E340000, v35, OS_LOG_TYPE_INFO, v34, buf, v36);
        }
      }
      else
      {
        v32 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          uint64_t v34 = "**Warning** postString is empty";
          v35 = v32;
          uint32_t v36 = 2;
          goto LABEL_27;
        }
      }

LABEL_29:
      id v10 = v6;
LABEL_30:

      _Block_object_dispose(&v39, 8);
      _Block_object_dispose(v45, 8);

      goto LABEL_31;
    }
    int v13 = [v4 string];
    uint64_t v14 = objc_msgSend(v13, "substringWithRange:", 0, v12);

    uint64_t v15 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    uint64_t v16 = [v14 stringByTrimmingCharactersInSet:v15];

    if ([v16 length])
    {
      [v6 addText:v16];
      v17 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = [v16 length];
        *(_DWORD *)buf = 134217984;
        uint64_t v52 = v18;
        v19 = "Found preString with %lu characters";
        v20 = v17;
        uint32_t v21 = 12;
LABEL_17:
        _os_log_impl(&dword_25E340000, v20, OS_LOG_TYPE_INFO, v19, buf, v21);
      }
    }
    else
    {
      v17 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v19 = "**Warning** preString is empty";
        v20 = v17;
        uint32_t v21 = 2;
        goto LABEL_17;
      }
    }

    goto LABEL_19;
  }
  uint64_t v11 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v45 = 0;
    _os_log_impl(&dword_25E340000, v11, OS_LOG_TYPE_INFO, "**Warning** Skipping personalized embedding generation as attributed query is empty", v45, 2u);
  }

  id v10 = 0;
LABEL_31:

  return v10;
}

uint64_t __45__SPEmbeddingModel__processAttributedString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__SPEmbeddingModel__processAttributedString___block_invoke_2;
  v5[3] = &unk_2655207C8;
  long long v6 = *(_OWORD *)(a1 + 32);
  uint64_t v7 = a3;
  uint64_t v8 = a4;
  return [a2 enumerateKeysAndObjectsUsingBlock:v5];
}

void __45__SPEmbeddingModel__processAttributedString___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ([a2 isEqualToString:@"kMDItemPhotosPeoplePersonIdentifiers"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
      *(_OWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = *(_OWORD *)(a1 + 48);
      *a4 = 1;
    }
  }
}

- (id)generateEmbeddingForTextInputs:(id)a3 extendedContextLength:(BOOL)a4 queryID:(int64_t)a5 timeout:(int64_t)a6 error:(id *)a7
{
  return [(SPEmbeddingModel *)self generateEmbeddingForTextInputs:a3 extendedContextLength:a4 queryID:a5 timeout:a6 useCLIPSafety:0 workCost:0 error:a7];
}

- (id)generateEmbeddingForTextInputs:(id)a3 extendedContextLength:(BOOL)a4 queryID:(int64_t)a5 timeout:(int64_t)a6 workCost:(int64_t *)a7 error:(id *)a8
{
  return [(SPEmbeddingModel *)self generateEmbeddingForTextInputs:a3 extendedContextLength:a4 queryID:a5 timeout:a6 useCLIPSafety:0 workCost:a7 error:a8];
}

- (id)generateEmbeddingForTextInputs:(id)a3 extendedContextLength:(BOOL)a4 bundleID:(id)a5 queryID:(int64_t)a6 timeout:(int64_t)a7 workCost:(int64_t *)a8 error:(id *)a9
{
  return [(SPEmbeddingModel *)self generateEmbeddingForTextInputs:a3 extendedContextLength:a4 bundleID:a5 queryID:a6 timeout:a7 useCLIPSafety:0 workCost:a8 error:a9];
}

- (id)generateEmbeddingForTextInputs:(id)a3 extendedContextLength:(BOOL)a4 queryID:(int64_t)a5 timeout:(int64_t)a6 useCLIPSafety:(BOOL)a7 workCost:(int64_t *)a8 error:(id *)a9
{
  return [(SPEmbeddingModel *)self generateEmbeddingForTextInputs:a3 extendedContextLength:a4 bundleID:&stru_270B0F348 queryID:a5 timeout:a6 useCLIPSafety:a7 workCost:a8 error:a9];
}

- (id)generateEmbeddingForTextInputs:(id)a3 extendedContextLength:(BOOL)a4 bundleID:(id)a5 queryID:(int64_t)a6 timeout:(int64_t)a7 useCLIPSafety:(BOOL)a8 workCost:(int64_t *)a9 error:(id *)a10
{
  v75[1] = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a5;
  if (![(SPEmbeddingModel *)self deviceCanGenerateEmbeddings]
    || (uint64_t v18 = [v16 count]) == 0)
  {
    id v32 = 0;
    goto LABEL_20;
  }
  uint64_t v19 = v18;
  v20 = [(SPEmbeddingModel *)self _processTextInputs:v16 error:a10];
  if ([v20 count] == v19)
  {
    uint64_t v68 = 0;
    v69 = &v68;
    uint64_t v70 = 0x3032000000;
    v71 = __Block_byref_object_copy_;
    v72 = __Block_byref_object_dispose_;
    id v73 = 0;
    uint64_t v64 = 0;
    v65 = (unsigned int *)&v64;
    uint64_t v66 = 0x2020000000;
    int v67 = -1;
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x3032000000;
    v61 = __Block_byref_object_copy_;
    v62 = __Block_byref_object_dispose_;
    id v63 = 0;
    uint64_t v52 = 0;
    uint64_t v53 = &v52;
    uint64_t v54 = 0x3032000000;
    v55 = __Block_byref_object_copy_;
    v56 = __Block_byref_object_dispose_;
    id v57 = 0;
    id v37 = v16;
    int64_t v21 = a6;
    id v22 = v20;
    v23 = dispatch_group_create();
    dispatch_group_enter(v23);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __127__SPEmbeddingModel_generateEmbeddingForTextInputs_extendedContextLength_bundleID_queryID_timeout_useCLIPSafety_workCost_error___block_invoke;
    block[3] = &unk_265520840;
    block[4] = self;
    int64_t v46 = v21;
    BOOL v50 = a8;
    BOOL v51 = a4;
    v24 = v23;
    uint64_t v39 = v24;
    id v40 = v22;
    v42 = &v58;
    uint64_t v43 = &v52;
    uint64_t v44 = &v68;
    uint64_t v47 = v19;
    v48 = a9;
    int64_t v49 = a7;
    id v41 = v17;
    v45 = &v64;
    dispatch_block_t v25 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(queue, v25);

    int64_t v26 = v21;
    id v16 = v37;
    v20 = v22;
    if (a7)
    {
      dispatch_time_t v27 = dispatch_time(0, 1000000 * a7);
      if (dispatch_group_wait(v24, v27))
      {
        uint64_t v28 = atomic_load(v65 + 6);
        [(SPEmbeddingModel *)self cancelRequestID:v28];
        if (a10)
        {
          uint64_t v29 = (void *)MEMORY[0x263F087E8];
          uint64_t v74 = *MEMORY[0x263F08320];
          v30 = objc_msgSend(NSString, "stringWithFormat:", @"Text embedding generation timeout (timeout=%lums)", a7);
          v75[0] = v30;
          uint64_t v31 = [NSDictionary dictionaryWithObjects:v75 forKeys:&v74 count:1];
          *a10 = [v29 errorWithDomain:@"com.apple.SpotlightEmbedding.EmbeddingModelError" code:-8007 userInfo:v31];
        }
        goto LABEL_17;
      }
    }
    else
    {
      dispatch_group_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
    }
    uint64_t v33 = atomic_load(v65 + 6);
    [(SPEmbeddingModel *)self clearQueryID:v26 requestID:v33];
    uint64_t v34 = (void *)v59[5];
    if (v34)
    {
      if (!a10)
      {
LABEL_17:
        id v32 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v34 = (void *)v53[5];
      if (!v34)
      {
        id v32 = (id)v69[5];
        goto LABEL_18;
      }
      if (!a10) {
        goto LABEL_17;
      }
    }
    id v32 = 0;
    *a10 = v34;
LABEL_18:

    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(&v58, 8);

    _Block_object_dispose(&v64, 8);
    _Block_object_dispose(&v68, 8);

    goto LABEL_19;
  }
  id v32 = 0;
LABEL_19:

LABEL_20:

  return v32;
}

void __127__SPEmbeddingModel_generateEmbeddingForTextInputs_extendedContextLength_bundleID_queryID_timeout_useCLIPSafety_workCost_error___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  v2 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 96);
    *(_DWORD *)buf = 134218240;
    uint64_t v49 = v3;
    __int16 v50 = 1024;
    qos_class_t v51 = qos_class_self();
    _os_log_impl(&dword_25E340000, v2, OS_LOG_TYPE_INFO, "[qid=%ld] MADRequest as QOS (%d)", buf, 0x12u);
  }

  id v4 = objc_alloc_init(MEMORY[0x263F54110]);
  if (+[SPEmbeddingModel version] == 4
    || +[SPEmbeddingModel version] == 5)
  {
    objc_msgSend(v4, "setVersion:", +[SPEmbeddingModel version](SPEmbeddingModel, "version"));
    [v4 setComputeThreshold:1];
    [v4 setComputeSafety:*(unsigned __int8 *)(a1 + 128)];
  }
  [v4 setExtendedContextLength:*(unsigned __int8 *)(a1 + 129)];
  if (*(unsigned char *)(a1 + 129) && (*(void *)(a1 + 96) | 0x8000000000000000) != 0xFFFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 96);
      *(_DWORD *)buf = 134217984;
      uint64_t v49 = v6;
      _os_log_impl(&dword_25E340000, v5, OS_LOG_TYPE_INFO, "[qid=%ld] Extended context length enabled", buf, 0xCu);
    }
  }
  id v47 = v4;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v47 count:1];
  dispatch_time_t v8 = dispatch_time(0, 0);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  [*(id *)(a1 + 32) _initModel];
  int v9 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v31 = MEMORY[0x263EF8330];
  uint64_t v32 = 3221225472;
  uint64_t v33 = __127__SPEmbeddingModel_generateEmbeddingForTextInputs_extendedContextLength_bundleID_queryID_timeout_useCLIPSafety_workCost_error___block_invoke_42;
  uint64_t v34 = &unk_265520818;
  uint64_t v41 = *(void *)(a1 + 104);
  id v11 = v4;
  char v46 = *(unsigned char *)(a1 + 128);
  long long v39 = *(_OWORD *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 96);
  uint64_t v13 = *(void *)(a1 + 32);
  id v35 = v11;
  uint64_t v36 = v13;
  uint64_t v14 = *(void *)(a1 + 80);
  uint64_t v42 = v12;
  dispatch_time_t v43 = v8;
  uint64_t v40 = v14;
  uint64_t v15 = *(void *)(a1 + 120);
  uint64_t v44 = *(void *)(a1 + 112);
  uint64_t v45 = v15;
  id v37 = *(id *)(a1 + 56);
  id v38 = *(id *)(a1 + 40);
  unsigned int v16 = [v9 performRequests:v7 textInputs:v10 completionHandler:&v31];
  atomic_store(v16, (unsigned int *)(*(void *)(*(void *)(a1 + 88) + 8) + 24));
  uint64_t v17 = *(void *)(a1 + 96);
  if (v17 != 0x7FFFFFFFFFFFFFFFLL && v17 != -1 && v16 != -1)
  {
    uint64_t v18 = objc_msgSend((id)objc_opt_class(), "log", v31, v32, v33, v34, v35, v36, v37);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(a1 + 96);
      unsigned int v20 = atomic_load((unsigned int *)(*(void *)(*(void *)(a1 + 88) + 8) + 24));
      *(_DWORD *)buf = 134218240;
      uint64_t v49 = v19;
      __int16 v50 = 1024;
      qos_class_t v51 = v20;
      _os_log_impl(&dword_25E340000, v18, OS_LOG_TYPE_INFO, "[qid=%ld] generateEmbeddingForTextInputs, requestID: %d", buf, 0x12u);
    }

    int64_t v21 = *(void **)(*(void *)(a1 + 32) + 24);
    id v22 = NSNumber;
    uint64_t v23 = atomic_load((unsigned int *)(*(void *)(*(void *)(a1 + 88) + 8) + 24));
    v24 = [v22 numberWithInt:v23];
    dispatch_block_t v25 = [NSNumber numberWithInteger:*(void *)(a1 + 96)];
    [v21 setObject:v24 forKey:v25];

    int64_t v26 = *(void **)(*(void *)(a1 + 32) + 16);
    dispatch_time_t v27 = [NSNumber numberWithInteger:*(void *)(a1 + 96)];
    uint64_t v28 = NSNumber;
    uint64_t v29 = atomic_load((unsigned int *)(*(void *)(*(void *)(a1 + 88) + 8) + 24));
    v30 = [v28 numberWithInt:v29];
    [v26 setObject:v27 forKey:v30];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __127__SPEmbeddingModel_generateEmbeddingForTextInputs_extendedContextLength_bundleID_queryID_timeout_useCLIPSafety_workCost_error___block_invoke_42(uint64_t a1, int a2, void *a3)
{
  v84[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = v5;
  int v63 = a2;
  if (a2 != -1 && !v5)
  {
    uint64_t v7 = *(void *)(a1 + 88);
    dispatch_time_t v8 = [*(id *)(a1 + 32) embeddingResults];
    uint64_t v9 = [v8 count];

    if (v7 == v9)
    {
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      uint64_t v10 = [*(id *)(a1 + 32) embeddingResults];
      uint64_t v65 = [v10 countByEnumeratingWithState:&v68 objects:v82 count:16];
      if (!v65) {
        goto LABEL_23;
      }
      uint64_t v66 = *(void *)v69;
      id obj = v10;
LABEL_6:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v69 != v66) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v68 + 1) + 8 * v11);
        if (!v12) {
          break;
        }
        uint64_t v13 = [*(id *)(*((void *)&v68 + 1) + 8 * v11) embedding];
        uint64_t v14 = [v13 data];

        if (!v14) {
          break;
        }
        if (*(unsigned char *)(a1 + 128))
        {
          uint64_t v15 = [v12 isSafe];
          int v16 = [v15 BOOLValue];

          uint64_t v17 = [v12 safetyScore];
          [v17 floatValue];
          float v19 = v18;

          if (!v16)
          {
            v61 = (void *)MEMORY[0x263F087E8];
            uint64_t v78 = *MEMORY[0x263F08320];
            uint64_t v42 = objc_msgSend(NSString, "stringWithFormat:", @"[qid=%ld] Result marked as unsafe by CLIP Safety Model with confidence score : %f", *(void *)(a1 + 96), v19);
            v79 = v42;
            dispatch_time_t v43 = [NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
            uint64_t v54 = [v61 errorWithDomain:@"com.apple.SpotlightEmbedding.EmbeddingModelError" code:-8008 userInfo:v43];
            uint64_t v55 = *(void *)(a1 + 72);
            goto LABEL_41;
          }
          unsigned int v20 = [(id)objc_opt_class() log];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            uint64_t v21 = *(void *)(a1 + 96);
            *(_DWORD *)buf = 134218240;
            uint64_t v73 = v21;
            __int16 v74 = 2048;
            double v75 = v19;
            _os_log_impl(&dword_25E340000, v20, OS_LOG_TYPE_INFO, "[qid=%ld] Result marked as safe by CLIP Safety Model with confidence score : %f", buf, 0x16u);
          }
        }
        int v67 = [SPEmbeddingResult alloc];
        unint64_t v22 = +[SPEmbeddingModel version];
        uint64_t v23 = [v12 embedding];
        v24 = [v23 data];
        [v12 embedding];
        v26 = uint64_t v25 = a1;
        uint64_t v27 = [v26 type];
        uint64_t v28 = [v12 scale];
        [v28 floatValue];
        int v30 = v29;
        uint64_t v31 = [v12 bias];
        [v31 floatValue];
        LODWORD(v33) = v32;
        LODWORD(v34) = v30;
        id v35 = [(SPEmbeddingResult *)v67 initWithVersion:v22 data:v24 type:v27 scale:v34 bias:v33];

        a1 = v25;
        uint64_t v36 = *(void **)(*(void *)(*(void *)(v25 + 80) + 8) + 40);
        if (!v36)
        {
          uint64_t v37 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:*(void *)(v25 + 88)];
          uint64_t v38 = *(void *)(*(void *)(v25 + 80) + 8);
          long long v39 = *(void **)(v38 + 40);
          *(void *)(v38 + 40) = v37;

          uint64_t v36 = *(void **)(*(void *)(*(void *)(v25 + 80) + 8) + 40);
        }
        [v36 addObject:v35];

        if (v65 == ++v11)
        {
          uint64_t v10 = obj;
          uint64_t v65 = [obj countByEnumeratingWithState:&v68 objects:v82 count:16];
          if (v65) {
            goto LABEL_6;
          }
          uint64_t v6 = 0;
          goto LABEL_23;
        }
      }
      uint64_t v53 = (void *)MEMORY[0x263F087E8];
      uint64_t v80 = *MEMORY[0x263F08320];
      uint64_t v42 = [NSString stringWithFormat:@"Text embedding generation result is empty"];
      v81 = v42;
      dispatch_time_t v43 = [NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
      uint64_t v54 = [v53 errorWithDomain:@"com.apple.SpotlightEmbedding.EmbeddingModelError" code:-8006 userInfo:v43];
      uint64_t v55 = *(void *)(a1 + 64);
LABEL_41:
      uint64_t v62 = *(void *)(v55 + 8);
      char v46 = *(void **)(v62 + 40);
      *(void *)(v62 + 40) = v54;
      uint64_t v6 = 0;
      uint64_t v10 = obj;
      goto LABEL_22;
    }
  }
  uint64_t v40 = (void *)MEMORY[0x263F087E8];
  uint64_t v83 = *MEMORY[0x263F08320];
  uint64_t v41 = NSString;
  uint64_t v10 = [*(id *)(a1 + 32) embeddingResults];
  uint64_t v42 = [v41 stringWithFormat:@"Text embedding generation failed (%lu results): %@", objc_msgSend(v10, "count"), v6];
  v84[0] = v42;
  dispatch_time_t v43 = [NSDictionary dictionaryWithObjects:v84 forKeys:&v83 count:1];
  uint64_t v44 = [v40 errorWithDomain:@"com.apple.SpotlightEmbedding.EmbeddingModelError" code:-8005 userInfo:v43];
  uint64_t v45 = *(void *)(*(void *)(a1 + 64) + 8);
  char v46 = *(void **)(v45 + 40);
  *(void *)(v45 + 40) = v44;
LABEL_22:

LABEL_23:
  dispatch_time_t v47 = dispatch_time(0, 0);
  v48 = *(void **)(a1 + 112);
  *(void *)&double v49 = v47 - *(void *)(a1 + 104);
  if (v48 && !*(void *)(a1 + 120)) {
    *v48 += *(void *)&v49;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)
    && [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) count])
  {
    if ((*(void *)(a1 + 96) | 0x8000000000000000) == 0xFFFFFFFFFFFFFFFFLL)
    {
      __int16 v50 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        uint64_t v51 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) count];
        *(_DWORD *)buf = 134218496;
        uint64_t v73 = v51;
        __int16 v74 = 2048;
        double v75 = v49;
        __int16 v76 = 1024;
        int v77 = v63;
        uint64_t v52 = "Successfully generated %lu text embeddings (time=%lldns), requestID: %d";
LABEL_34:
        _os_log_impl(&dword_25E340000, v50, OS_LOG_TYPE_INFO, v52, buf, 0x1Cu);
      }
    }
    else
    {
      __int16 v50 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        uint64_t v56 = *(void *)(a1 + 96);
        *(_DWORD *)buf = 134218496;
        uint64_t v73 = v56;
        __int16 v74 = 2048;
        double v75 = v49;
        __int16 v76 = 1024;
        int v77 = v63;
        uint64_t v52 = "[qid=%ld] Successfully generated a text embedding (time=%lldns), requestID: %d";
        goto LABEL_34;
      }
    }
  }
  uint64_t v57 = *(void *)(a1 + 96);
  uint64_t v58 = [MEMORY[0x263F02A98] sharedInstance];
  v59 = v58;
  if (v57 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v60 = 6;
  }
  else {
    uint64_t v60 = 10;
  }
  [v58 logWithBundleID:*(void *)(a1 + 48) indexOperation:v60 itemCount:1 code:0];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queryIDs, 0);
  objc_storeStrong((id *)&self->_requestIDs, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

- (void)hardwareSupportsEmbedding
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  if (getDeviceSupported_gDeviceSupported) {
    v0 = @"supported";
  }
  else {
    v0 = @"unsupported";
  }
  int v1 = 138412290;
  v2 = v0;
  _os_log_debug_impl(&dword_25E340000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Embedding generation %@ on this device", (uint8_t *)&v1, 0xCu);
}

@end