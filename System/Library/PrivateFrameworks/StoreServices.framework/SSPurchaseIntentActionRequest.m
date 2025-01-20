@interface SSPurchaseIntentActionRequest
- (NSString)appBundleId;
- (SSPurchaseIntentActionRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (unint64_t)action;
- (void)setAction:(unint64_t)a3;
- (void)setAppBundleId:(id)a3;
- (void)startWithCompletionBlock:(id)a3;
@end

@implementation SSPurchaseIntentActionRequest

- (void)startWithCompletionBlock:(id)a3
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
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v21 = 136446210;
      v22 = "-[SSPurchaseIntentActionRequest startWithCompletionBlock:]";
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
  v19[2] = __58__SSPurchaseIntentActionRequest_startWithCompletionBlock___block_invoke;
  v19[3] = &unk_1E5BA6EE0;
  v19[4] = self;
  id v20 = v4;
  id v17 = v4;
  [(SSRequest *)self _startWithMessageID:198 messageBlock:v19];
}

void __58__SSPurchaseIntentActionRequest_startWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E4F14520])
    {
      int v7 = SSError(@"SSErrorDomain", 121, 0, 0);
    }
    else
    {
      id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
      int v6 = xpc_dictionary_get_value(v4, "1");
      int v7 = (void *)[v5 initWithXPCEncoding:v6];
    }
    v8 = dispatch_get_global_queue(0, 0);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __58__SSPurchaseIntentActionRequest_startWithCompletionBlock___block_invoke_2;
    uint64_t v14 = &unk_1E5BA7328;
    id v9 = *(id *)(a1 + 40);
    id v15 = v7;
    id v16 = v9;
    id v10 = v7;
    dispatch_async(v8, &v11);
  }
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest", v11, v12, v13, v14);
}

uint64_t __58__SSPurchaseIntentActionRequest_startWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->super._dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__SSPurchaseIntentActionRequest_copyXPCEncoding__block_invoke;
  v8[3] = &unk_1E5BA7018;
  id v5 = v3;
  id v9 = v5;
  id v10 = self;
  dispatch_sync(dispatchQueue, v8);
  id v6 = v5;

  return v6;
}

void __48__SSPurchaseIntentActionRequest_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "appBundleId", *(void *)(*(void *)(a1 + 40) + 96));
  v2 = *(void **)(a1 + 32);
  int64_t v3 = *(void *)(*(void *)(a1 + 40) + 104);
  xpc_dictionary_set_int64(v2, "action", v3);
}

- (SSPurchaseIntentActionRequest)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v11.receiver = self;
    v11.super_class = (Class)SSPurchaseIntentActionRequest;
    id v6 = [(SSRequest *)&v11 init];
    if (v6)
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = SSXPCDictionaryCopyObjectWithClass(v5, "appBundleId", v8);
      appBundleId = v6->_appBundleId;
      v6->_appBundleId = (NSString *)v9;

      v6->_action = xpc_dictionary_get_int64(v5, "action");
    }
  }
  else
  {

    id v6 = 0;
  }

  return v6;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
}

@end