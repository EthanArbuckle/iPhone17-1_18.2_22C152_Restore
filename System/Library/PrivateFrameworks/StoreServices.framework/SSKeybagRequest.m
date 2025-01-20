@interface SSKeybagRequest
- (NSNumber)accountID;
- (SSKeybagRequest)initWithAccountIdentifier:(id)a3;
- (SSKeybagRequest)initWithXPCEncoding:(id)a3;
- (id)accountIdentifier;
- (id)contentIdentifier;
- (id)copyXPCEncoding;
- (int64_t)keybagOptions;
- (void)dealloc;
- (void)setContentIdentifier:(id)a3;
- (void)setKeybagOptions:(int64_t)a3;
- (void)startWithCompletionBlock:(id)a3;
@end

@implementation SSKeybagRequest

- (SSKeybagRequest)initWithAccountIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSKeybagRequest;
  v4 = [(SSRequest *)&v6 init];
  if (v4) {
    v4->_accountID = (NSNumber *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSKeybagRequest;
  [(SSRequest *)&v3 dealloc];
}

- (id)accountIdentifier
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__45;
  v10 = __Block_byref_object_dispose__45;
  uint64_t v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__SSKeybagRequest_accountIdentifier__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __36__SSKeybagRequest_accountIdentifier__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 96);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)contentIdentifier
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__45;
  v10 = __Block_byref_object_dispose__45;
  uint64_t v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__SSKeybagRequest_contentIdentifier__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__SSKeybagRequest_contentIdentifier__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 104) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (int64_t)keybagOptions
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__SSKeybagRequest_keybagOptions__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__SSKeybagRequest_keybagOptions__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 112);
  return result;
}

- (void)setContentIdentifier:(id)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__SSKeybagRequest_setContentIdentifier___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

void *__40__SSKeybagRequest_setContentIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (*(void **)(v3 + 104) != result)
  {
    uint64_t result = (void *)[result copy];
    *(void *)(*(void *)(a1 + 32) + 104) = result;
  }
  return result;
}

- (void)setKeybagOptions:(int64_t)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__SSKeybagRequest_setKeybagOptions___block_invoke;
  v4[3] = &unk_1E5BA84B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __36__SSKeybagRequest_setKeybagOptions___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 112) = *(void *)(result + 40);
  return result;
}

- (void)startWithCompletionBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5) {
      id v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_FAULT)) {
      int v8 = v7;
    }
    else {
      int v8 = v7 & 2;
    }
    if (v8)
    {
      int v21 = 136446210;
      v22 = "-[SSKeybagRequest startWithCompletionBlock:]";
      LODWORD(v19) = 12;
      v18 = &v21;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v21, v19);
        free(v10);
        SSFileLog(v5, @"%@", v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __44__SSKeybagRequest_startWithCompletionBlock___block_invoke;
  v20[3] = &unk_1E5BA7750;
  v20[4] = self;
  v20[5] = a3;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 86, v20, v18);
}

uint64_t __44__SSKeybagRequest_startWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 40))
  {
    if (a2 == (void *)MEMORY[0x1E4F14520])
    {
      id v4 = (id)SSError(@"SSErrorDomain", 121, 0, 0);
    }
    else
    {
      id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
      if (xpc_dictionary_get_BOOL(a2, "1"))
      {
LABEL_8:
        global_queue = dispatch_get_global_queue(0, 0);
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __44__SSKeybagRequest_startWithCompletionBlock___block_invoke_2;
        v8[3] = &unk_1E5BA7728;
        uint64_t v6 = *(void *)(a1 + 40);
        v8[4] = v4;
        v8[5] = v6;
        dispatch_async(global_queue, v8);

        return [*(id *)(a1 + 32) _shutdownRequest];
      }
    }
    if (!v4) {
      id v4 = (id)SSError(@"SSErrorDomain", 100, 0, 0);
    }
    goto LABEL_8;
  }
  return [*(id *)(a1 + 32) _shutdownRequest];
}

uint64_t __44__SSKeybagRequest_startWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->super._dispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__SSKeybagRequest_copyXPCEncoding__block_invoke;
  v6[3] = &unk_1E5BA7448;
  v6[4] = v3;
  v6[5] = self;
  dispatch_sync(dispatchQueue, v6);
  return v3;
}

void __34__SSKeybagRequest_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "50", *(__CFString **)(*(void *)(a1 + 40) + 96));
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "52", *(__CFString **)(*(void *)(a1 + 40) + 104));
  v2 = *(void **)(a1 + 32);
  int64_t v3 = *(void *)(*(void *)(a1 + 40) + 112);
  xpc_dictionary_set_int64(v2, "51", v3);
}

- (SSKeybagRequest)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSKeybagRequest;
    id v5 = [(SSRequest *)&v7 init];
    if (v5)
    {
      objc_opt_class();
      v5->_accountID = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass(a3, "50");
      objc_opt_class();
      v5->_contentIdentifier = SSXPCDictionaryCopyCFObjectWithClass(a3, "52");
      v5->_options = xpc_dictionary_get_int64(a3, "51");
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (NSNumber)accountID
{
  return self->_accountID;
}

@end