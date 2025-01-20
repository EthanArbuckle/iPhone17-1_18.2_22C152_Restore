@interface SSVSubscriptionStatusRequest
+ (BOOL)_allowMultipleCallbacks;
+ (int64_t)requestMessage;
- (BOOL)authenticatesIfNecessary;
- (NSString)localizedAuthenticationReason;
- (NSString)reason;
- (SSAuthenticationContext)authenticationContext;
- (SSVSubscriptionStatusRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (int64_t)carrierBundleProvisioningStyle;
- (void)setAuthenticatesIfNecessary:(BOOL)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setCarrierBundleProvisioningStyle:(int64_t)a3;
- (void)setLocalizedAuthenticationReason:(id)a3;
- (void)setReason:(id)a3;
- (void)startWithCompletionBlock:(id)a3;
- (void)startWithStatusResponseBlock:(id)a3;
@end

@implementation SSVSubscriptionStatusRequest

- (void)startWithStatusResponseBlock:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
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
      int v22 = 136446210;
      v23 = "-[SSVSubscriptionStatusRequest startWithStatusResponseBlock:]";
      LODWORD(v19) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v22, v19);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  uint64_t v17 = [(id)objc_opt_class() requestMessage];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __61__SSVSubscriptionStatusRequest_startWithStatusResponseBlock___block_invoke;
  v20[3] = &unk_1E5BA6EE0;
  v20[4] = self;
  id v21 = v4;
  id v18 = v4;
  [(SSRequest *)self _startWithMessageID:v17 messageBlock:v20];
}

void __61__SSVSubscriptionStatusRequest_startWithStatusResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(void *)(a1 + 40)) {
    goto LABEL_9;
  }
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v5 = 121;
    goto LABEL_7;
  }
  if (!v3 || MEMORY[0x1A62689E0](v3) != MEMORY[0x1E4F14590])
  {
    uint64_t v5 = 111;
LABEL_7:
    int v6 = SSError(@"SSErrorDomain", v5, 0, 0);
    int v7 = 0;
    BOOL v8 = 1;
    goto LABEL_8;
  }
  id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v14 = xpc_dictionary_get_value(v4, "2");
  int v6 = (void *)[v13 initWithXPCEncoding:v14];

  BOOL v8 = xpc_dictionary_get_BOOL(v4, "3");
  uint64_t v15 = [SSVSubscriptionStatus alloc];
  uint64_t v16 = xpc_dictionary_get_value(v4, "4");
  int v7 = [(SSVSubscriptionStatus *)v15 initWithXPCEncoding:v16];

LABEL_8:
  int v9 = dispatch_get_global_queue(0, 0);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __61__SSVSubscriptionStatusRequest_startWithStatusResponseBlock___block_invoke_2;
  v20 = &unk_1E5BA8010;
  id v10 = *(id *)(a1 + 40);
  id v22 = v6;
  id v23 = v10;
  BOOL v24 = v8;
  id v21 = v7;
  id v11 = v6;
  uint64_t v12 = v7;
  dispatch_async(v9, &v17);

  if (v8) {
LABEL_9:
  }
    objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest", v17, v18, v19, v20);
}

uint64_t __61__SSVSubscriptionStatusRequest_startWithStatusResponseBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
}

- (void)startWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__SSVSubscriptionStatusRequest_startWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E5BACDC0;
  id v7 = v4;
  id v5 = v4;
  [(SSVSubscriptionStatusRequest *)self startWithStatusResponseBlock:v6];
}

uint64_t __57__SSVSubscriptionStatusRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    BOOL v5 = a3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  }
  return result;
}

+ (BOOL)_allowMultipleCallbacks
{
  return 1;
}

+ (int64_t)requestMessage
{
  return 149;
}

- (SSVSubscriptionStatusRequest)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v18.receiver = self;
    v18.super_class = (Class)SSVSubscriptionStatusRequest;
    int v6 = [(SSRequest *)&v18 init];
    if (v6)
    {
      v6->_authenticatesIfNecessary = xpc_dictionary_get_BOOL(v5, "3");
      BOOL v8 = [SSAuthenticationContext alloc];
      int v9 = xpc_dictionary_get_value(v5, "0");
      uint64_t v10 = [(SSAuthenticationContext *)v8 initWithXPCEncoding:v9];
      authenticationContext = v6->_authenticationContext;
      v6->_authenticationContext = (SSAuthenticationContext *)v10;

      v6->_carrierBundleProvisioningStyle = xpc_dictionary_get_int64(v5, "1");
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = SSXPCDictionaryCopyObjectWithClass(v5, "4", v12);
      localizedAuthenticationReason = v6->_localizedAuthenticationReason;
      v6->_localizedAuthenticationReason = (NSString *)v13;

      uint64_t v15 = objc_opt_class();
      uint64_t v16 = SSXPCDictionaryCopyObjectWithClass(v5, "2", v15);
      reason = v6->_reason;
      v6->_reason = (NSString *)v16;
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
  xpc_dictionary_set_BOOL(v3, "3", self->_authenticatesIfNecessary);
  SSXPCDictionarySetObject(v3, "0", self->_authenticationContext);
  xpc_dictionary_set_int64(v3, "1", self->_carrierBundleProvisioningStyle);
  SSXPCDictionarySetObject(v3, "4", self->_localizedAuthenticationReason);
  SSXPCDictionarySetObject(v3, "2", self->_reason);
  return v3;
}

- (BOOL)authenticatesIfNecessary
{
  return self->_authenticatesIfNecessary;
}

- (void)setAuthenticatesIfNecessary:(BOOL)a3
{
  self->_authenticatesIfNecessary = a3;
}

- (SSAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (void)setAuthenticationContext:(id)a3
{
}

- (int64_t)carrierBundleProvisioningStyle
{
  return self->_carrierBundleProvisioningStyle;
}

- (void)setCarrierBundleProvisioningStyle:(int64_t)a3
{
  self->_carrierBundleProvisioningStyle = a3;
}

- (NSString)localizedAuthenticationReason
{
  return self->_localizedAuthenticationReason;
}

- (void)setLocalizedAuthenticationReason:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_localizedAuthenticationReason, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

@end