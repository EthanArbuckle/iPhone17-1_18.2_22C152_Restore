@interface SSVServerAuthenticateRequest
- (OS_xpc_object)encodedDialog;
- (SSAuthenticationContext)authenticationContext;
- (SSVServerAuthenticateRequest)initWithEncodedDialog:(id)a3;
- (SSVServerAuthenticateRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (void)setAuthenticationContext:(id)a3;
- (void)startWithAuthenticateResponse:(id)a3;
@end

@implementation SSVServerAuthenticateRequest

- (SSVServerAuthenticateRequest)initWithEncodedDialog:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSVServerAuthenticateRequest;
  v6 = [(SSRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dialog, a3);
  }

  return v7;
}

- (void)startWithAuthenticateResponse:(id)a3
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
      v22 = "-[SSVServerAuthenticateRequest startWithAuthenticateResponse:]";
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
  v19[2] = __62__SSVServerAuthenticateRequest_startWithAuthenticateResponse___block_invoke;
  v19[3] = &unk_1E5BA6EE0;
  v19[4] = self;
  id v20 = v4;
  id v17 = v4;
  [(SSRequest *)self _startWithMessageID:132 messageBlock:v19];
}

void __62__SSVServerAuthenticateRequest_startWithAuthenticateResponse___block_invoke(uint64_t a1, void *a2)
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

      v8 = [SSVServerAuthenticateResponse alloc];
      int v9 = xpc_dictionary_get_value(v4, "1");
      uint64_t v10 = [(SSVServerAuthenticateResponse *)v8 initWithXPCEncoding:v9];
    }
    if (!(v10 | v7))
    {
      uint64_t v7 = SSError(@"SSErrorDomain", 100, 0, 0);
    }
    uint64_t v11 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__SSVServerAuthenticateRequest_startWithAuthenticateResponse___block_invoke_2;
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

uint64_t __62__SSVServerAuthenticateRequest_startWithAuthenticateResponse___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (SSVServerAuthenticateRequest)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SSVServerAuthenticateRequest;
  id v5 = [(SSRequest *)&v13 init];
  if (v5)
  {
    int v6 = [SSAuthenticationContext alloc];
    uint64_t v7 = xpc_dictionary_get_value(v4, "0");
    uint64_t v8 = [(SSAuthenticationContext *)v6 initWithXPCEncoding:v7];
    authenticationContext = v5->_authenticationContext;
    v5->_authenticationContext = (SSAuthenticationContext *)v8;

    uint64_t v10 = xpc_dictionary_get_value(v4, "1");
    dialog = v5->_dialog;
    v5->_dialog = (OS_xpc_object *)v10;
  }
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_authenticationContext);
  xpc_dictionary_set_value(v3, "1", self->_dialog);
  return v3;
}

- (SSAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (void)setAuthenticationContext:(id)a3
{
}

- (OS_xpc_object)encodedDialog
{
  return self->_dialog;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

@end