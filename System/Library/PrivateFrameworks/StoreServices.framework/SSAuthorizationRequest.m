@interface SSAuthorizationRequest
- (BOOL)allowSilentAuthentication;
- (BOOL)shouldAddKeysToKeyBag;
- (BOOL)shouldPromptForCredentials;
- (BOOL)start;
- (NSNumber)accountIdentifier;
- (NSNumber)familyAccountIdentifier;
- (NSString)clientIdentifierHeader;
- (NSString)keybagPath;
- (NSString)reason;
- (NSString)userAgent;
- (SSAuthorizationRequest)init;
- (SSAuthorizationRequest)initWithAuthorizationToken:(id)a3 accountIdentifier:(id)a4;
- (SSAuthorizationRequest)initWithXPCEncoding:(id)a3;
- (id)_init;
- (id)authorizationToken;
- (id)copyXPCEncoding;
- (void)setAccountIdentifier:(id)a3;
- (void)setAllowSilentAuthentication:(BOOL)a3;
- (void)setClientIdentifierHeader:(id)a3;
- (void)setFamilyAccountIdentifier:(id)a3;
- (void)setKeybagPath:(id)a3;
- (void)setReason:(id)a3;
- (void)setShouldAddKeysToKeyBag:(BOOL)a3;
- (void)setShouldPromptForCredentials:(BOOL)a3;
- (void)setUserAgent:(id)a3;
- (void)startWithAuthorizationResponseBlock:(id)a3;
- (void)startWithCompletionBlock:(id)a3;
@end

@implementation SSAuthorizationRequest

- (SSAuthorizationRequest)init
{
  return [(SSAuthorizationRequest *)self initWithAuthorizationToken:0 accountIdentifier:0];
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)SSAuthorizationRequest;
  return [(SSRequest *)&v3 init];
}

- (SSAuthorizationRequest)initWithAuthorizationToken:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Must provide token"];
  if (!v8) {
LABEL_3:
  }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Must provide accountIdentifier"];
LABEL_4:
  v15.receiver = self;
  v15.super_class = (Class)SSAuthorizationRequest;
  v9 = [(SSRequest *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    accountIdentifier = v9->_accountIdentifier;
    v9->_accountIdentifier = (NSNumber *)v10;

    if ([v6 conformsToProtocol:&unk_1EF9AC4F0]) {
      id v12 = (id)[v6 copy];
    }
    else {
      id v12 = v6;
    }
    id token = v9->_token;
    v9->_id token = v12;
  }
  return v9;
}

- (id)authorizationToken
{
  return self->_token;
}

- (void)startWithAuthorizationResponseBlock:(id)a3
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
      v22 = "-[SSAuthorizationRequest startWithAuthorizationResponseBlock:]";
      LODWORD(v18) = 12;
      uint64_t v10 = (void *)_os_log_send_and_compose_impl();

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
  v19[2] = __62__SSAuthorizationRequest_startWithAuthorizationResponseBlock___block_invoke;
  v19[3] = &unk_1E5BA6EE0;
  v19[4] = self;
  id v20 = v4;
  id v17 = v4;
  [(SSRequest *)self _startWithMessageID:57 messageBlock:v19];
}

void __62__SSAuthorizationRequest_startWithAuthorizationResponseBlock___block_invoke(uint64_t a1, void *a2)
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
    block[2] = __62__SSAuthorizationRequest_startWithAuthorizationResponseBlock___block_invoke_2;
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

uint64_t __62__SSAuthorizationRequest_startWithAuthorizationResponseBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)start
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __31__SSAuthorizationRequest_start__block_invoke;
  v3[3] = &unk_1E5BAA080;
  v3[4] = self;
  [(SSAuthorizationRequest *)self startWithAuthorizationResponseBlock:v3];
  return 1;
}

void __31__SSAuthorizationRequest_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__SSAuthorizationRequest_start__block_invoke_2;
  block[3] = &unk_1E5BA7068;
  void block[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __31__SSAuthorizationRequest_start__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (*(void *)(a1 + 40))
  {
    if (objc_opt_respondsToSelector()) {
      [v2 authorizationRequest:*(void *)(a1 + 32) didReceiveResponse:*(void *)(a1 + 40)];
    }
    if (objc_opt_respondsToSelector()) {
      [v2 requestDidFinish:*(void *)(a1 + 32)];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    [v2 request:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 48)];
  }
}

- (void)startWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SSAuthorizationRequest_startWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E5BA9250;
  id v7 = v4;
  id v5 = v4;
  [(SSAuthorizationRequest *)self startWithAuthorizationResponseBlock:v6];
}

uint64_t __51__SSAuthorizationRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->super._dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__SSAuthorizationRequest_copyXPCEncoding__block_invoke;
  v8[3] = &unk_1E5BA7018;
  id v5 = v3;
  id v9 = v5;
  id v10 = self;
  dispatch_sync(dispatchQueue, v8);
  id v6 = v5;

  return v6;
}

uint64_t __41__SSAuthorizationRequest_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "50", *(void *)(*(void *)(a1 + 40) + 96));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "59", *(unsigned char *)(*(void *)(a1 + 40) + 104));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "52", *(void *)(*(void *)(a1 + 40) + 152));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "53", *(void *)(*(void *)(a1 + 40) + 112));
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "54", *(__CFString **)(*(void *)(a1 + 40) + 120));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "55", *(void *)(*(void *)(a1 + 40) + 128));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "56", *(unsigned char *)(*(void *)(a1 + 40) + 136));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "57", *(unsigned char *)(*(void *)(a1 + 40) + 137));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 160);
  return SSXPCDictionarySetObject(v2, "58", v3);
}

- (SSAuthorizationRequest)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v27.receiver = self;
    v27.super_class = (Class)SSAuthorizationRequest;
    id v6 = [(SSRequest *)&v27 init];
    if (v6)
    {
      objc_opt_class();
      CFArrayRef v8 = SSXPCDictionaryCopyCFObjectWithClass(v5, "50");
      accountIdentifier = v6->_accountIdentifier;
      v6->_accountIdentifier = (NSNumber *)v8;

      v6->_allowSilentAuthentication = xpc_dictionary_get_BOOL(v5, "59");
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = SSXPCDictionaryCopyObjectWithClass(v5, "53", v10);
      clientIdentifierHeader = v6->_clientIdentifierHeader;
      v6->_clientIdentifierHeader = (NSString *)v11;

      uint64_t v13 = objc_opt_class();
      uint64_t v14 = SSXPCDictionaryCopyObjectWithClass(v5, "52", v13);
      familyAccountIdentifier = v6->_familyAccountIdentifier;
      v6->_familyAccountIdentifier = (NSNumber *)v14;

      uint64_t v16 = objc_opt_class();
      uint64_t v17 = SSXPCDictionaryCopyObjectWithClass(v5, "53", v16);
      keybagPath = v6->_keybagPath;
      v6->_keybagPath = (NSString *)v17;

      CFArrayRef v19 = SSXPCDictionaryCopyCFObject(v5, "54");
      id token = v6->_token;
      v6->_id token = v19;

      uint64_t v21 = objc_opt_class();
      uint64_t v22 = SSXPCDictionaryCopyObjectWithClass(v5, "55", v21);
      reason = v6->_reason;
      v6->_reason = (NSString *)v22;

      v6->_shouldAddKeysToKeyBag = xpc_dictionary_get_BOOL(v5, "56");
      v6->_shouldPromptForCredentials = xpc_dictionary_get_BOOL(v5, "57");
      uint64_t v24 = objc_opt_class();
      uint64_t v25 = SSXPCDictionaryCopyObjectWithClass(v5, "58", v24);
      userAgent = v6->_userAgent;
      v6->_userAgent = (NSString *)v25;
    }
  }
  else
  {

    id v6 = 0;
  }

  return v6;
}

- (NSNumber)accountIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAccountIdentifier:(id)a3
{
}

- (BOOL)allowSilentAuthentication
{
  return self->_allowSilentAuthentication;
}

- (void)setAllowSilentAuthentication:(BOOL)a3
{
  self->_allowSilentAuthentication = a3;
}

- (NSString)clientIdentifierHeader
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setClientIdentifierHeader:(id)a3
{
}

- (NSNumber)familyAccountIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFamilyAccountIdentifier:(id)a3
{
}

- (NSString)keybagPath
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setKeybagPath:(id)a3
{
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setReason:(id)a3
{
}

- (BOOL)shouldAddKeysToKeyBag
{
  return self->_shouldAddKeysToKeyBag;
}

- (void)setShouldAddKeysToKeyBag:(BOOL)a3
{
  self->_shouldAddKeysToKeyBag = a3;
}

- (BOOL)shouldPromptForCredentials
{
  return self->_shouldPromptForCredentials;
}

- (void)setShouldPromptForCredentials:(BOOL)a3
{
  self->_shouldPromptForCredentials = a3;
}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setUserAgent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_familyAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifierHeader, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong(&self->_token, 0);
  objc_storeStrong((id *)&self->_keybagPath, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end