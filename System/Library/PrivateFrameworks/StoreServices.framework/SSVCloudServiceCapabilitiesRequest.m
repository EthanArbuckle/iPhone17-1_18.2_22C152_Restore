@interface SSVCloudServiceCapabilitiesRequest
- (BOOL)allowsPromptingForPrivacyAcknowledgement;
- (SSVCloudServiceCapabilitiesRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (void)setAllowsPromptingForPrivacyAcknowledgement:(BOOL)a3;
- (void)startWithCompletionBlock:(id)a3;
- (void)startWithResponseBlock:(id)a3;
@end

@implementation SSVCloudServiceCapabilitiesRequest

- (void)startWithResponseBlock:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
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
      int v38 = 136446210;
      v39 = "-[SSVCloudServiceCapabilitiesRequest startWithResponseBlock:]";
      LODWORD(v35) = 12;
      v34 = &v38;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v38, v35);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v17 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v17)
  {
    v17 = +[SSLogConfig sharedConfig];
  }
  int v18 = [v17 shouldLog];
  if ([v17 shouldLogToDisk]) {
    int v19 = v18 | 2;
  }
  else {
    int v19 = v18;
  }
  v20 = [v17 OSLogObject];
  if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
    v19 &= 2u;
  }
  if (!v19) {
    goto LABEL_26;
  }
  v21 = objc_opt_class();
  int v22 = *((unsigned __int8 *)&self->super._usesTaskCompletionAssertions + 1);
  v23 = (void *)MEMORY[0x1E4F29060];
  id v24 = v21;
  v25 = [v23 callStackSymbols];
  int v38 = 138543874;
  v39 = (const char *)v21;
  __int16 v40 = 1024;
  int v41 = v22;
  __int16 v42 = 2114;
  v43 = v25;
  LODWORD(v35) = 28;
  v26 = (void *)_os_log_send_and_compose_impl();

  if (v26)
  {
    v20 = objc_msgSend(NSString, "stringWithCString:encoding:", v26, 4, &v38, v35);
    free(v26);
    SSFileLog(v17, @"%@", v27, v28, v29, v30, v31, v32, (uint64_t)v20);
LABEL_26:
  }
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __61__SSVCloudServiceCapabilitiesRequest_startWithResponseBlock___block_invoke;
  v36[3] = &unk_1E5BA6EE0;
  v36[4] = self;
  id v37 = v4;
  id v33 = v4;
  [(SSRequest *)self _startWithMessageID:175 messageBlock:v36];
}

void __61__SSVCloudServiceCapabilitiesRequest_startWithResponseBlock___block_invoke(uint64_t a1, void *a2)
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
        id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v13 = xpc_dictionary_get_value(v4, "2");
        int v6 = (void *)[v12 initWithXPCEncoding:v13];

        uint64_t v14 = [SSVCloudServiceCapabilitiesResponse alloc];
        uint64_t v15 = xpc_dictionary_get_value(v4, "3");
        int v7 = [(SSVCloudServiceCapabilitiesResponse *)v14 initWithXPCEncoding:v15];

        goto LABEL_8;
      }
      uint64_t v5 = 111;
    }
    int v6 = SSError(@"SSErrorDomain", v5, 0, 0);
    int v7 = 0;
LABEL_8:
    v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__SSVCloudServiceCapabilitiesRequest_startWithResponseBlock___block_invoke_2;
    block[3] = &unk_1E5BA6EB8;
    id v9 = *(id *)(a1 + 40);
    id v18 = v6;
    id v19 = v9;
    v17 = v7;
    id v10 = v6;
    uint64_t v11 = v7;
    dispatch_async(v8, block);
  }
  [*(id *)(a1 + 32) _shutdownRequest];
}

uint64_t __61__SSVCloudServiceCapabilitiesRequest_startWithResponseBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)startWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__SSVCloudServiceCapabilitiesRequest_startWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E5BADF90;
  id v7 = v4;
  id v5 = v4;
  [(SSVCloudServiceCapabilitiesRequest *)self startWithResponseBlock:v6];
}

uint64_t __63__SSVCloudServiceCapabilitiesRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (SSVCloudServiceCapabilitiesRequest)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v8.receiver = self;
    v8.super_class = (Class)SSVCloudServiceCapabilitiesRequest;
    int v6 = [(SSRequest *)&v8 init];
    if (v6) {
      *(&v6->super._usesTaskCompletionAssertions + 1) = xpc_dictionary_get_BOOL(v5, "0");
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
  xpc_dictionary_set_BOOL(v3, "0", *(&self->super._usesTaskCompletionAssertions + 1));
  return v3;
}

- (BOOL)allowsPromptingForPrivacyAcknowledgement
{
  return *(&self->super._usesTaskCompletionAssertions + 1);
}

- (void)setAllowsPromptingForPrivacyAcknowledgement:(BOOL)a3
{
  *(&self->super._usesTaskCompletionAssertions + 1) = a3;
}

@end