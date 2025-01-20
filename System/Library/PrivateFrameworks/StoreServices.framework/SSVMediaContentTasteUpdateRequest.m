@interface SSVMediaContentTasteUpdateRequest
- (BOOL)shouldInvalidateLocalCache;
- (NSArray)contentTasteItemUpdates;
- (SSVMediaContentTasteUpdateRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (void)setContentTasteItemUpdates:(id)a3;
- (void)setShouldInvalidateLocalCache:(BOOL)a3;
- (void)startWithCompletionBlock:(id)a3;
- (void)startWithResponseBlock:(id)a3;
@end

@implementation SSVMediaContentTasteUpdateRequest

- (void)startWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__SSVMediaContentTasteUpdateRequest_startWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E5BABE00;
  id v7 = v4;
  id v5 = v4;
  [(SSVMediaContentTasteUpdateRequest *)self startWithResponseBlock:v6];
}

uint64_t __62__SSVMediaContentTasteUpdateRequest_startWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (SSVMediaContentTasteUpdateRequest)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v16.receiver = self;
    v16.super_class = (Class)SSVMediaContentTasteUpdateRequest;
    v6 = [(SSRequest *)&v16 init];
    if (v6)
    {
      uint64_t v10 = 0;
      v11 = &v10;
      uint64_t v12 = 0x3032000000;
      v13 = __Block_byref_object_copy__40;
      v14 = __Block_byref_object_dispose__40;
      id v15 = 0;
      v8 = xpc_dictionary_get_value(v5, "0");
      if (MEMORY[0x1A62689E0]() == MEMORY[0x1E4F14568])
      {
        applier[0] = MEMORY[0x1E4F143A8];
        applier[1] = 3221225472;
        applier[2] = __57__SSVMediaContentTasteUpdateRequest_initWithXPCEncoding___block_invoke;
        applier[3] = &unk_1E5BABE28;
        applier[4] = &v10;
        xpc_array_apply(v8, applier);
      }
      objc_storeStrong((id *)&v6->_contentTasteItemUpdates, (id)v11[5]);
      v6->_shouldInvalidateLocalCache = xpc_dictionary_get_BOOL(v5, "1");

      _Block_object_dispose(&v10, 8);
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

uint64_t __57__SSVMediaContentTasteUpdateRequest_initWithXPCEncoding___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [[SSVMediaContentTasteItemUpdate alloc] initWithXPCEncoding:v4];

  if (v5)
  {
    v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v6 addObject:v5];
  }

  return 1;
}

- (id)copyXPCEncoding
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v4 = xpc_array_create(0, 0);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_contentTasteItemUpdates;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "copyXPCEncoding", (void)v12);
        if (v10) {
          xpc_array_append_value(v4, v10);
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  xpc_dictionary_set_value(v3, "0", v4);
  xpc_dictionary_set_BOOL(v3, "1", self->_shouldInvalidateLocalCache);

  return v3;
}

- (void)startWithResponseBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      id v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    uint64_t v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v21 = 136446210;
      v22 = "-[SSVMediaContentTasteUpdateRequest startWithResponseBlock:]";
      LODWORD(v18) = 12;
      uint64_t v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v21, v18);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __60__SSVMediaContentTasteUpdateRequest_startWithResponseBlock___block_invoke;
  v19[3] = &unk_1E5BA6EE0;
  v19[4] = self;
  id v20 = v4;
  id v17 = v4;
  [(SSRequest *)self _startWithMessageID:163 messageBlock:v19];
}

void __60__SSVMediaContentTasteUpdateRequest_startWithResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E4F14520])
    {
      uint64_t v10 = SSError(@"SSErrorDomain", 121, 0, 0);
      int v7 = 0;
    }
    else
    {
      id v5 = [SSVMediaContentTasteUpdateResponse alloc];
      int v6 = xpc_dictionary_get_value(v4, "1");
      int v7 = [(SSVMediaContentTasteUpdateResponse *)v5 initWithXPCEncoding:v6];

      id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
      int v9 = xpc_dictionary_get_value(v4, "2");
      uint64_t v10 = (void *)[v8 initWithXPCEncoding:v9];
    }
    uint64_t v11 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__SSVMediaContentTasteUpdateRequest_startWithResponseBlock___block_invoke_2;
    block[3] = &unk_1E5BA6EB8;
    id v12 = *(id *)(a1 + 40);
    id v17 = v10;
    id v18 = v12;
    uint64_t v16 = v7;
    id v13 = v10;
    uint64_t v14 = v7;
    dispatch_async(v11, block);
  }
  [*(id *)(a1 + 32) _shutdownRequest];
}

uint64_t __60__SSVMediaContentTasteUpdateRequest_startWithResponseBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (NSArray)contentTasteItemUpdates
{
  return self->_contentTasteItemUpdates;
}

- (void)setContentTasteItemUpdates:(id)a3
{
}

- (BOOL)shouldInvalidateLocalCache
{
  return self->_shouldInvalidateLocalCache;
}

- (void)setShouldInvalidateLocalCache:(BOOL)a3
{
  self->_shouldInvalidateLocalCache = a3;
}

- (void).cxx_destruct
{
}

@end