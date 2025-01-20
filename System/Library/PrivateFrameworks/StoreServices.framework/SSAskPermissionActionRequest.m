@interface SSAskPermissionActionRequest
- (NSURL)URL;
- (SSAskPermissionActionRequest)initWithURL:(id)a3;
- (SSAskPermissionActionRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (void)startWithCompletionBlock:(id)a3;
@end

@implementation SSAskPermissionActionRequest

- (SSAskPermissionActionRequest)initWithURL:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SSAskPermissionActionRequest;
  result = [(SSRequest *)&v5 init];
  if (result) {
    result->_url = (NSURL *)a3;
  }
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
      v22 = "-[SSAskPermissionActionRequest startWithCompletionBlock:]";
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
  v20[2] = __57__SSAskPermissionActionRequest_startWithCompletionBlock___block_invoke;
  v20[3] = &unk_1E5BA7750;
  v20[4] = self;
  v20[5] = a3;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 140, v20, v18);
}

uint64_t __57__SSAskPermissionActionRequest_startWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 40))
  {
    if (a2 == (void *)MEMORY[0x1E4F14520]) {
      id v3 = (id)SSError(@"SSErrorDomain", 121, 0, 0);
    }
    else {
      id v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
    }
    v4 = v3;
    global_queue = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__SSAskPermissionActionRequest_startWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E5BA7728;
    uint64_t v6 = *(void *)(a1 + 40);
    v8[4] = v4;
    v8[5] = v6;
    dispatch_async(global_queue, v8);
  }
  return [*(id *)(a1 + 32) _shutdownRequest];
}

uint64_t __57__SSAskPermissionActionRequest_startWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->super._dispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__SSAskPermissionActionRequest_copyXPCEncoding__block_invoke;
  v6[3] = &unk_1E5BA7448;
  v6[4] = v3;
  v6[5] = self;
  dispatch_sync(dispatchQueue, v6);
  return v3;
}

void __47__SSAskPermissionActionRequest_copyXPCEncoding__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (__CFString *)[*(id *)(*(void *)(a1 + 40) + 96) absoluteString];
  SSXPCDictionarySetCFObject(v1, "1", v2);
}

- (SSAskPermissionActionRequest)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v8.receiver = self;
    v8.super_class = (Class)SSAskPermissionActionRequest;
    id v5 = [(SSRequest *)&v8 init];
    if (v5)
    {
      objc_opt_class();
      CFArrayRef v7 = SSXPCDictionaryCopyCFObjectWithClass(a3, "1");
      v5->_url = (NSURL *)[MEMORY[0x1E4F1CB10] URLWithString:v7];
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (NSURL)URL
{
  return self->_url;
}

@end