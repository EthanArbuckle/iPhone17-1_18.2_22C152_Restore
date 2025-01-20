@interface SSVApplicationCapabilitiesRequest
- (NSString)bundleID;
- (SSVApplicationCapabilitiesRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (void)setBundleID:(id)a3;
- (void)startWithCapabilitiesResponseBlock:(id)a3;
- (void)startWithCompletionBlock:(id)a3;
@end

@implementation SSVApplicationCapabilitiesRequest

- (void)startWithCapabilitiesResponseBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v21 = 136446210;
      v22 = "-[SSVApplicationCapabilitiesRequest startWithCapabilitiesResponseBlock:]";
      LODWORD(v18) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v21, v18);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __72__SSVApplicationCapabilitiesRequest_startWithCapabilitiesResponseBlock___block_invoke;
  v19[3] = &unk_1E5BA6EE0;
  v19[4] = self;
  id v20 = v4;
  id v17 = v4;
  [(SSRequest *)self _startWithMessageID:164 messageBlock:v19];
}

void __72__SSVApplicationCapabilitiesRequest_startWithCapabilitiesResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E4F14520])
    {
      uint64_t v5 = 121;
    }
    else
    {
      if (v3 && MEMORY[0x1A62689E0](v3) == MEMORY[0x1E4F14590])
      {
        BOOL v7 = xpc_dictionary_get_BOOL(v4, "1");
        int v6 = 0;
        if (v7)
        {
LABEL_10:
          v8 = dispatch_get_global_queue(0, 0);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __72__SSVApplicationCapabilitiesRequest_startWithCapabilitiesResponseBlock___block_invoke_2;
          block[3] = &unk_1E5BAB848;
          id v9 = *(id *)(a1 + 40);
          BOOL v14 = v7;
          id v12 = v6;
          id v13 = v9;
          id v10 = v6;
          dispatch_async(v8, block);

          goto LABEL_11;
        }
LABEL_8:
        if (!v6)
        {
          int v6 = SSError(@"SSErrorDomain", 100, 0, 0);
        }
        goto LABEL_10;
      }
      uint64_t v5 = 111;
    }
    int v6 = SSError(@"SSErrorDomain", v5, 0, 0);
    BOOL v7 = 0;
    goto LABEL_8;
  }
LABEL_11:
  [*(id *)(a1 + 32) _shutdownRequest];
}

uint64_t __72__SSVApplicationCapabilitiesRequest_startWithCapabilitiesResponseBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)startWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__SSVApplicationCapabilitiesRequest_startWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E5BA9C28;
  id v7 = v4;
  id v5 = v4;
  [(SSVApplicationCapabilitiesRequest *)self startWithCapabilitiesResponseBlock:v6];
}

uint64_t __62__SSVApplicationCapabilitiesRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (SSVApplicationCapabilitiesRequest)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v11.receiver = self;
    v11.super_class = (Class)SSVApplicationCapabilitiesRequest;
    int v6 = [(SSRequest *)&v11 init];
    if (v6)
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
      bundleID = v6->_bundleID;
      v6->_bundleID = (NSString *)v9;
    }
  }
  else
  {

    int v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_bundleID);
  return v3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end