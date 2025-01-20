@interface SSVPushNotificationRequest
- (BOOL)start;
- (SSVPushNotificationParameters)pushNotificationParameters;
- (SSVPushNotificationRequest)initWithPushNotificationParameters:(id)a3;
- (SSVPushNotificationRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (void)setPushNotificationParameters:(id)a3;
- (void)startWithCompletionBlock:(id)a3;
- (void)startWithResponseBlock:(id)a3;
@end

@implementation SSVPushNotificationRequest

- (SSVPushNotificationRequest)initWithPushNotificationParameters:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSVPushNotificationRequest;
  v5 = [(SSRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    parameters = v5->_parameters;
    v5->_parameters = (SSVPushNotificationParameters *)v6;
  }
  return v5;
}

- (void)startWithResponseBlock:(id)a3
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
      v22 = "-[SSVPushNotificationRequest startWithResponseBlock:]";
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
  v19[2] = __53__SSVPushNotificationRequest_startWithResponseBlock___block_invoke;
  v19[3] = &unk_1E5BA6EE0;
  v19[4] = self;
  id v20 = v4;
  id v17 = v4;
  [(SSRequest *)self _startWithMessageID:127 messageBlock:v19];
}

void __53__SSVPushNotificationRequest_startWithResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E4F14520])
    {
      uint64_t v7 = SSError(@"SSErrorDomain", 121, 0, 0);
      uint64_t v10 = 0;
    }
    else
    {
      id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
      int v6 = xpc_dictionary_get_value(v4, "2");
      uint64_t v7 = [v5 initWithXPCEncoding:v6];

      v8 = [SSURLConnectionResponse alloc];
      int v9 = xpc_dictionary_get_value(v4, "1");
      uint64_t v10 = [(SSURLConnectionResponse *)v8 initWithXPCEncoding:v9];
    }
    if (!(v10 | v7))
    {
      uint64_t v7 = SSError(@"SSErrorDomain", 100, 0, 0);
    }
    uint64_t v11 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__SSVPushNotificationRequest_startWithResponseBlock___block_invoke_2;
    block[3] = &unk_1E5BA6EB8;
    id v12 = *(id *)(a1 + 40);
    id v17 = (id)v7;
    id v18 = v12;
    id v16 = (id)v10;
    id v13 = (id)v7;
    id v14 = (id)v10;
    dispatch_async(v11, block);
  }
  [*(id *)(a1 + 32) _shutdownRequest];
}

uint64_t __53__SSVPushNotificationRequest_startWithResponseBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)start
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__SSVPushNotificationRequest_start__block_invoke;
  v3[3] = &unk_1E5BAA080;
  v3[4] = self;
  [(SSVPushNotificationRequest *)self startWithResponseBlock:v3];
  return 1;
}

void __35__SSVPushNotificationRequest_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SSVPushNotificationRequest_start__block_invoke_2;
  block[3] = &unk_1E5BA7068;
  void block[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __35__SSVPushNotificationRequest_start__block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  if (*(void *)(a1 + 40))
  {
    char v2 = objc_opt_respondsToSelector();
    id v3 = v5;
    if ((v2 & 1) == 0) {
      goto LABEL_7;
    }
    [v5 requestDidFinish:*(void *)(a1 + 32)];
  }
  else
  {
    char v4 = objc_opt_respondsToSelector();
    id v3 = v5;
    if ((v4 & 1) == 0) {
      goto LABEL_7;
    }
    [v5 request:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 48)];
  }
  id v3 = v5;
LABEL_7:
}

- (void)startWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__SSVPushNotificationRequest_startWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E5BA9250;
  id v7 = v4;
  id v5 = v4;
  [(SSVPushNotificationRequest *)self startWithResponseBlock:v6];
}

uint64_t __55__SSVPushNotificationRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (SSVPushNotificationRequest)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v12.receiver = self;
    v12.super_class = (Class)SSVPushNotificationRequest;
    id v6 = [(SSRequest *)&v12 init];
    if (v6)
    {
      id v8 = [SSVPushNotificationParameters alloc];
      int v9 = xpc_dictionary_get_value(v5, "50");
      uint64_t v10 = [(SSVPushNotificationParameters *)v8 initWithXPCEncoding:v9];
      parameters = v6->_parameters;
      v6->_parameters = (SSVPushNotificationParameters *)v10;
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
  SSXPCDictionarySetCFObject(v3, "50", (__CFString *)self->_parameters);
  return v3;
}

- (SSVPushNotificationParameters)pushNotificationParameters
{
  return self->_parameters;
}

- (void)setPushNotificationParameters:(id)a3
{
}

- (void).cxx_destruct
{
}

@end