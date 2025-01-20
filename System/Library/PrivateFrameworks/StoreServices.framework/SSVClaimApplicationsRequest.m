@interface SSVClaimApplicationsRequest
- (SSVClaimApplicationsRequest)initWithClaimStyle:(int64_t)a3;
- (SSVClaimApplicationsRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (int64_t)claimStyle;
- (void)startWithResponseBlock:(id)a3;
@end

@implementation SSVClaimApplicationsRequest

- (SSVClaimApplicationsRequest)initWithClaimStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SSVClaimApplicationsRequest;
  result = [(SSRequest *)&v5 init];
  if (result) {
    result->_claimStyle = a3;
  }
  return result;
}

- (void)startWithResponseBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    objc_super v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      objc_super v5 = +[SSLogConfig sharedConfig];
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
      v22 = "-[SSVClaimApplicationsRequest startWithResponseBlock:]";
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
  v19[2] = __54__SSVClaimApplicationsRequest_startWithResponseBlock___block_invoke;
  v19[3] = &unk_1E5BA6EE0;
  v19[4] = self;
  id v20 = v4;
  id v17 = v4;
  [(SSRequest *)self _startWithMessageID:138 messageBlock:v19];
}

void __54__SSVClaimApplicationsRequest_startWithResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E4F14520])
    {
      v8 = SSError(@"SSErrorDomain", 121, 0, 0);
      CFArrayRef v5 = 0;
      BOOL v9 = 0;
    }
    else
    {
      objc_opt_class();
      CFArrayRef v5 = SSXPCDictionaryCopyCFObjectWithClass(v4, "3");
      id v6 = objc_alloc(MEMORY[0x1E4F28C58]);
      int v7 = xpc_dictionary_get_value(v4, "2");
      v8 = (void *)[v6 initWithXPCEncoding:v7];

      BOOL v9 = xpc_dictionary_get_BOOL(v4, "1");
      if (v9)
      {
LABEL_8:
        v10 = dispatch_get_global_queue(0, 0);
        uint64_t v14 = MEMORY[0x1E4F143A8];
        uint64_t v15 = 3221225472;
        uint64_t v16 = __54__SSVClaimApplicationsRequest_startWithResponseBlock___block_invoke_2;
        id v17 = &unk_1E5BA8010;
        id v11 = *(id *)(a1 + 40);
        id v19 = v8;
        id v20 = v11;
        BOOL v21 = v9;
        CFArrayRef v18 = v5;
        id v12 = v8;
        CFArrayRef v13 = v5;
        dispatch_async(v10, &v14);

        goto LABEL_9;
      }
    }
    if (!v8)
    {
      v8 = SSError(@"SSErrorDomain", 100, 0, 0);
    }
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest", v14, v15, v16, v17);
}

uint64_t __54__SSVClaimApplicationsRequest_startWithResponseBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (SSVClaimApplicationsRequest)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  CFArrayRef v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v8.receiver = self;
    v8.super_class = (Class)SSVClaimApplicationsRequest;
    id v6 = [(SSRequest *)&v8 init];
    if (v6) {
      v6->_claimStyle = xpc_dictionary_get_int64(v5, "0");
    }
  }
  else
  {

    id v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "0", self->_claimStyle);
  return v3;
}

- (int64_t)claimStyle
{
  return self->_claimStyle;
}

@end