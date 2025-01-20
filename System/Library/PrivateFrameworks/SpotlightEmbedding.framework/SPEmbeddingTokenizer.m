@interface SPEmbeddingTokenizer
+ (id)log;
+ (id)sharedInstance;
- (SPEmbeddingTokenizer)init;
- (id)getTokenIDsForText:(id)a3;
- (id)getTokensForText:(id)a3;
- (unint64_t)maxTokenLength;
- (void)clear;
- (void)initTokenizer;
@end

@implementation SPEmbeddingTokenizer

+ (id)log
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__SPEmbeddingTokenizer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1) {
    dispatch_once(&log_onceToken_0, block);
  }
  v2 = (void *)log_log_0;

  return v2;
}

void __27__SPEmbeddingTokenizer_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.spotlightembedding", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_sSharedInstance_0;

  return v2;
}

uint64_t __38__SPEmbeddingTokenizer_sharedInstance__block_invoke()
{
  sharedInstance_sSharedInstance_0 = objc_alloc_init(SPEmbeddingTokenizer);

  return MEMORY[0x270F9A758]();
}

- (SPEmbeddingTokenizer)init
{
  v7.receiver = self;
  v7.super_class = (Class)SPEmbeddingTokenizer;
  v2 = [(SPEmbeddingTokenizer *)&v7 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, -1);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.SpotlightEmbedding.SPEmbeddingTokenizer.queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)initTokenizer
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (!self->_tokenizer)
  {
    id v7 = 0;
    objc_msgSend(MEMORY[0x263F37F60], "TokenizerForRevision:error:", objc_msgSend(MEMORY[0x263F54120], "csuTokenizerRevision"), &v7);
    id v3 = (CSUTokenizer *)objc_claimAutoreleasedReturnValue();
    id v4 = v7;
    tokenizer = self->_tokenizer;
    self->_tokenizer = v3;

    if (v4 || !self->_tokenizer)
    {
      v6 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v9 = v4;
        _os_log_impl(&dword_25E340000, v6, OS_LOG_TYPE_ERROR, "CSU tokenizer initialization failed with error %@", buf, 0xCu);
      }
    }
  }
}

- (id)getTokenIDsForText:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SPEmbeddingTokenizer_getTokenIDsForText___block_invoke;
  block[3] = &unk_265520868;
  id v11 = v4;
  v12 = &v13;
  block[4] = self;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_sync(queue, v7);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void *__43__SPEmbeddingTokenizer_getTokenIDsForText___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) initTokenizer];
  result = *(void **)(*(void *)(a1 + 32) + 8);
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [result getTokenIDsForText:*(void *)(a1 + 40)];
    return (void *)MEMORY[0x270F9A758]();
  }
  return result;
}

- (id)getTokensForText:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SPEmbeddingTokenizer_getTokensForText___block_invoke;
  block[3] = &unk_265520868;
  id v11 = v4;
  v12 = &v13;
  block[4] = self;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_sync(queue, v7);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void *__41__SPEmbeddingTokenizer_getTokensForText___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) initTokenizer];
  result = *(void **)(*(void *)(a1 + 32) + 8);
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [result getTokensForText:*(void *)(a1 + 40)];
    return (void *)MEMORY[0x270F9A758]();
  }
  return result;
}

- (unint64_t)maxTokenLength
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__SPEmbeddingTokenizer_maxTokenLength__block_invoke;
  v6[3] = &unk_265520890;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_block_t v3 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v6);
  dispatch_sync(queue, v3);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void *__38__SPEmbeddingTokenizer_maxTokenLength__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) initTokenizer];
  result = *(void **)(*(void *)(a1 + 32) + 8);
  if (result)
  {
    result = (void *)[result maxTokenLength];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)clear
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__SPEmbeddingTokenizer_clear__block_invoke;
  block[3] = &unk_2655206D8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __29__SPEmbeddingTokenizer_clear__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_tokenizer, 0);
}

@end