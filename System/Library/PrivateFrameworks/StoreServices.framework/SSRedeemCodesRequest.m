@interface SSRedeemCodesRequest
- (BOOL)cameraRecognized;
- (BOOL)headless;
- (NSArray)redeemCodes;
- (NSDictionary)params;
- (NSString)logCorrelationKey;
- (SSAuthenticationContext)authenticationContext;
- (SSRedeemCodesRequest)initWithRedeemCodes:(id)a3;
- (SSRedeemCodesRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (void)dealloc;
- (void)setAuthenticationContext:(id)a3;
- (void)setCameraRecognized:(BOOL)a3;
- (void)setHeadless:(BOOL)a3;
- (void)setLogCorrelationKey:(id)a3;
- (void)setParams:(id)a3;
- (void)startWithCompletionBlock:(id)a3;
- (void)startWithRedeemResponseBlock:(id)a3;
@end

@implementation SSRedeemCodesRequest

- (SSRedeemCodesRequest)initWithRedeemCodes:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSRedeemCodesRequest;
  v4 = [(SSRequest *)&v6 init];
  if (v4)
  {
    v4->_redeemCodes = (NSArray *)[a3 copy];
    v4->_headless = 1;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSRedeemCodesRequest;
  [(SSRequest *)&v3 dealloc];
}

- (SSAuthenticationContext)authenticationContext
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__47;
  v10 = __Block_byref_object_dispose__47;
  uint64_t v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__SSRedeemCodesRequest_authenticationContext__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_super v3 = (SSAuthenticationContext *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __45__SSRedeemCodesRequest_authenticationContext__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 96);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSArray)redeemCodes
{
  v2 = self->_redeemCodes;
  return v2;
}

- (void)setAuthenticationContext:(id)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__SSRedeemCodesRequest_setAuthenticationContext___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __49__SSRedeemCodesRequest_setAuthenticationContext___block_invoke(uint64_t result)
{
  v1 = *(void **)(*(void *)(result + 32) + 96);
  if (v1 != *(void **)(result + 40))
  {
    uint64_t v2 = result;

    id result = [*(id *)(v2 + 40) copy];
    *(void *)(*(void *)(v2 + 32) + 96) = result;
  }
  return result;
}

- (void)startWithRedeemResponseBlock:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
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
    if (os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      int v8 = v7;
    }
    else {
      int v8 = v7 & 2;
    }
    if (v8)
    {
      int v37 = 136446210;
      v38 = "-[SSRedeemCodesRequest startWithRedeemResponseBlock:]";
      LODWORD(v35) = 12;
      v34 = &v37;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v37, v35);
        free(v10);
        SSFileLog(v5, @"%@", v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  if (![(SSRedeemCodesRequest *)self logCorrelationKey]) {
    [(SSRedeemCodesRequest *)self setLogCorrelationKey:AMSGenerateLogCorrelationKey()];
  }
  id v18 = +[SSLogConfig sharedConfig];
  if (!v18) {
    id v18 = +[SSLogConfig sharedConfig];
  }
  int v19 = [v18 shouldLog];
  if ([v18 shouldLogToDisk]) {
    int v20 = v19 | 2;
  }
  else {
    int v20 = v19;
  }
  if (!os_log_type_enabled((os_log_t)[v18 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v20 &= 2u;
  }
  if (v20)
  {
    uint64_t v21 = objc_opt_class();
    v22 = [(SSRedeemCodesRequest *)self logCorrelationKey];
    v23 = [(SSRedeemCodesRequest *)self redeemCodes];
    int v37 = 138543874;
    v38 = (const char *)v21;
    __int16 v39 = 2114;
    v40 = v22;
    __int16 v41 = 2112;
    v42 = v23;
    LODWORD(v35) = 32;
    uint64_t v24 = _os_log_send_and_compose_impl();
    if (v24)
    {
      v25 = (void *)v24;
      uint64_t v26 = objc_msgSend(NSString, "stringWithCString:encoding:", v24, 4, &v37, v35);
      free(v25);
      SSFileLog(v18, @"%@", v27, v28, v29, v30, v31, v32, v26);
    }
  }
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_async(global_queue, &__block_literal_global_23);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __53__SSRedeemCodesRequest_startWithRedeemResponseBlock___block_invoke_2;
  v36[3] = &unk_1E5BAC7B8;
  v36[5] = global_queue;
  v36[6] = a3;
  v36[4] = self;
  [(SSRequest *)self _startWithMessageID:91 messageBlock:v36];
}

uint64_t __53__SSRedeemCodesRequest_startWithRedeemResponseBlock___block_invoke()
{
  v0 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  return [v0 postNotificationName:@"SSVNetworkingDidStartNotification" object:0];
}

void __53__SSRedeemCodesRequest_startWithRedeemResponseBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 48))
  {
    if (a2 == (void *)MEMORY[0x1E4F14520])
    {
      id v4 = (id)SSError(@"SSErrorDomain", 121, 0, 0);
      id v5 = 0;
    }
    else
    {
      id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
      id v5 = [[SSRedeemCodesResponse alloc] initWithXPCEncoding:xpc_dictionary_get_value(a2, "1")];
    }
    id v6 = +[SSLogConfig sharedConfig];
    id v7 = v6;
    if (v4)
    {
      if (!v6) {
        id v7 = +[SSLogConfig sharedConfig];
      }
      int v8 = [v7 shouldLog];
      if ([v7 shouldLogToDisk]) {
        int v9 = v8 | 2;
      }
      else {
        int v9 = v8;
      }
      if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v9 &= 2u;
      }
      if (!v9) {
        goto LABEL_26;
      }
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = [*(id *)(a1 + 32) logCorrelationKey];
      *(_DWORD *)uint64_t v26 = 138543874;
      *(void *)&v26[4] = v10;
      *(_WORD *)&v26[12] = 2114;
      *(void *)&v26[14] = v11;
      *(_WORD *)&v26[22] = 2114;
      uint64_t v27 = AMSLogableError();
      LODWORD(v25) = 32;
      uint64_t v24 = v26;
    }
    else
    {
      if (!v6) {
        id v7 = +[SSLogConfig sharedConfig];
      }
      int v12 = [v7 shouldLog];
      if ([v7 shouldLogToDisk]) {
        int v13 = v12 | 2;
      }
      else {
        int v13 = v12;
      }
      if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v13 &= 2u;
      }
      if (!v13) {
        goto LABEL_26;
      }
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = [*(id *)(a1 + 32) logCorrelationKey];
      *(_DWORD *)uint64_t v26 = 138543618;
      *(void *)&v26[4] = v14;
      *(_WORD *)&v26[12] = 2114;
      *(void *)&v26[14] = v15;
      LODWORD(v25) = 22;
      uint64_t v24 = v26;
    }
    uint64_t v16 = (void *)_os_log_send_and_compose_impl();
    if (v16)
    {
      uint64_t v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, v26, v25, *(_OWORD *)v26, *(void *)&v26[16]);
      free(v16);
      SSFileLog(v7, @"%@", v18, v19, v20, v21, v22, v23, v17);
    }
LABEL_26:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest", v24);
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), &__block_literal_global_17);
}

uint64_t __53__SSRedeemCodesRequest_startWithRedeemResponseBlock___block_invoke_15()
{
  v0 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  return [v0 postNotificationName:@"SSVNetworkingDidStopNotification" object:0];
}

- (void)startWithCompletionBlock:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__SSRedeemCodesRequest_startWithCompletionBlock___block_invoke;
  v3[3] = &unk_1E5BAC7E0;
  v3[4] = a3;
  [(SSRedeemCodesRequest *)self startWithRedeemResponseBlock:v3];
}

uint64_t __49__SSRedeemCodesRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (SSRedeemCodesRequest)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSRedeemCodesRequest;
    id v5 = [(SSRequest *)&v7 init];
    if (v5)
    {
      v5->_authenticationContext = [[SSAuthenticationContext alloc] initWithXPCEncoding:xpc_dictionary_get_value(a3, "0")];
      objc_opt_class();
      v5->_redeemCodes = (NSArray *)SSXPCDictionaryCopyCFObjectWithClass(a3, "1");
      v5->_headless = xpc_dictionary_get_BOOL(a3, "2");
      v5->_cameraRecognized = xpc_dictionary_get_BOOL(a3, "3");
      objc_opt_class();
      v5->_logCorrelationKey = (NSString *)SSXPCDictionaryCopyCFObjectWithClass(a3, "4");
      objc_opt_class();
      v5->_params = (NSDictionary *)SSXPCDictionaryCopyCFObjectWithClass(a3, "5");
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_authenticationContext);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_redeemCodes);
  xpc_dictionary_set_BOOL(v3, "2", self->_headless);
  xpc_dictionary_set_BOOL(v3, "3", self->_cameraRecognized);
  SSXPCDictionarySetCFObject(v3, "4", (__CFString *)self->_logCorrelationKey);
  SSXPCDictionarySetCFObject(v3, "5", (__CFString *)self->_params);
  return v3;
}

- (BOOL)headless
{
  return self->_headless;
}

- (void)setHeadless:(BOOL)a3
{
  self->_headless = a3;
}

- (BOOL)cameraRecognized
{
  return self->_cameraRecognized;
}

- (void)setCameraRecognized:(BOOL)a3
{
  self->_cameraRecognized = a3;
}

- (NSString)logCorrelationKey
{
  return self->_logCorrelationKey;
}

- (void)setLogCorrelationKey:(id)a3
{
}

- (NSDictionary)params
{
  return self->_params;
}

- (void)setParams:(id)a3
{
}

@end