@interface SSMachineDataRequest
- (BOOL)allowsBootstrapCellularData;
- (BOOL)waitsForPurchaseOperations;
- (NSData)actionData;
- (NSNumber)accountIdentifier;
- (NSString)actionName;
- (NSString)userAgent;
- (SSMachineDataRequest)initWithURLResponse:(id)a3;
- (SSMachineDataRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (int64_t)protocolVersion;
- (void)setAccountIdentifier:(id)a3;
- (void)setActionData:(id)a3;
- (void)setActionName:(id)a3;
- (void)setAllowsBootstrapCellularData:(BOOL)a3;
- (void)setProtocolVersion:(int64_t)a3;
- (void)setUserAgent:(id)a3;
- (void)setWaitsForPurchaseOperations:(BOOL)a3;
- (void)startWithCompletionBlock:(id)a3;
- (void)startWithDetailedCompletionBlock:(id)a3;
@end

@implementation SSMachineDataRequest

- (SSMachineDataRequest)initWithURLResponse:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SSMachineDataRequest;
  v5 = [(SSRequest *)&v17 init];
  if (v5)
  {
    v6 = [v4 allHeaderFields];
    v7 = HeaderValueForKey(v6, @"X-Apple-MD-Action");
    v8 = @"X-Apple-MD-Data";
    if (![v7 length])
    {
      uint64_t v9 = HeaderValueForKey(v6, @"X-Apple-AMD-Action");

      v10 = @"X-Apple-AMD-Data";
      v5->_protocolVersion = 1;
      v7 = (void *)v9;
      v8 = v10;
    }
    if ([v7 length])
    {
      v11 = HeaderValueForKey(v6, v8);
      if ([v11 length])
      {
        uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v11 options:0];
        actionData = v5->_actionData;
        v5->_actionData = (NSData *)v12;
      }
      uint64_t v14 = [v7 copy];
      actionName = v5->_actionName;
      v5->_actionName = (NSString *)v14;
    }
    else
    {
      v11 = v5;
      v5 = 0;
    }
  }
  return v5;
}

- (NSNumber)accountIdentifier
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__64;
  v10 = __Block_byref_object_dispose__64;
  id v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__SSMachineDataRequest_accountIdentifier__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

void __41__SSMachineDataRequest_accountIdentifier__block_invoke(uint64_t a1)
{
}

- (NSData)actionData
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__64;
  v10 = __Block_byref_object_dispose__64;
  id v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__SSMachineDataRequest_actionData__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

void __34__SSMachineDataRequest_actionData__block_invoke(uint64_t a1)
{
}

- (NSString)actionName
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__64;
  v10 = __Block_byref_object_dispose__64;
  id v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__SSMachineDataRequest_actionName__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __34__SSMachineDataRequest_actionName__block_invoke(uint64_t a1)
{
}

- (BOOL)allowsBootstrapCellularData
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__SSMachineDataRequest_allowsBootstrapCellularData__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__SSMachineDataRequest_allowsBootstrapCellularData__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 120);
  return result;
}

- (int64_t)protocolVersion
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__SSMachineDataRequest_protocolVersion__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__SSMachineDataRequest_protocolVersion__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 128);
  return result;
}

- (void)setAccountIdentifier:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__SSMachineDataRequest_setAccountIdentifier___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __45__SSMachineDataRequest_setAccountIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 96) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 96);
    *(void *)(v5 + 96) = v4;
  }
}

- (void)setActionData:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__SSMachineDataRequest_setActionData___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __38__SSMachineDataRequest_setActionData___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 104) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 104);
    *(void *)(v5 + 104) = v4;
  }
}

- (void)setActionName:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__SSMachineDataRequest_setActionName___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __38__SSMachineDataRequest_setActionName___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 112) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 112);
    *(void *)(v5 + 112) = v4;
  }
}

- (void)setAllowsBootstrapCellularData:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__SSMachineDataRequest_setAllowsBootstrapCellularData___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __55__SSMachineDataRequest_setAllowsBootstrapCellularData___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 120) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setProtocolVersion:(int64_t)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__SSMachineDataRequest_setProtocolVersion___block_invoke;
  v4[3] = &unk_1E5BA8DA8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __43__SSMachineDataRequest_setProtocolVersion___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 128) = *(void *)(result + 40);
  return result;
}

- (void)setUserAgent:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__SSMachineDataRequest_setUserAgent___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __37__SSMachineDataRequest_setUserAgent___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 136) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 136);
    *(void *)(v5 + 136) = v4;
  }
}

- (void)setWaitsForPurchaseOperations:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__SSMachineDataRequest_setWaitsForPurchaseOperations___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __54__SSMachineDataRequest_setWaitsForPurchaseOperations___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 144) = *(unsigned char *)(result + 40);
  return result;
}

- (NSString)userAgent
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__64;
  v10 = __Block_byref_object_dispose__64;
  id v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__SSMachineDataRequest_userAgent__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __33__SSMachineDataRequest_userAgent__block_invoke(uint64_t a1)
{
}

- (BOOL)waitsForPurchaseOperations
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__SSMachineDataRequest_waitsForPurchaseOperations__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__SSMachineDataRequest_waitsForPurchaseOperations__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 144);
  return result;
}

- (void)startWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__SSMachineDataRequest_startWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E5BAD840;
  id v7 = v4;
  id v5 = v4;
  [(SSMachineDataRequest *)self startWithDetailedCompletionBlock:v6];
}

uint64_t __49__SSMachineDataRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (void)startWithDetailedCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SSViTunesStoreFramework();
  uint64_t v6 = objc_msgSend(objc_alloc((Class)SSVWeakLinkedClassForString(&cfstr_Ismachinedataa.isa, v5)), "initWithMachineDataRequest:", self);
  id v7 = [(SSMachineDataRequest *)self userAgent];

  if (v7)
  {
    uint64_t v8 = [(SSMachineDataRequest *)self userAgent];
    [v6 setUserAgent:v8];
  }
  else
  {
    uint64_t v8 = +[SSDevice currentDevice];
    char v9 = [v8 userAgent];
    [v6 setUserAgent:v9];
  }
  objc_initWeak(&location, v6);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __57__SSMachineDataRequest_startWithDetailedCompletionBlock___block_invoke;
  objc_super v17 = &unk_1E5BA9D48;
  objc_copyWeak(&v20, &location);
  id v10 = v4;
  v18 = self;
  id v19 = v10;
  [v6 setCompletionBlock:&v14];
  uint64_t v11 = SSViTunesStoreFramework();
  id v12 = SSVWeakLinkedClassForString(&cfstr_Isoperationque.isa, v11);
  v13 = objc_msgSend(v12, "mainQueue", v14, v15, v16, v17);
  [v13 addOperation:v6];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __57__SSMachineDataRequest_startWithDetailedCompletionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    char v3 = [WeakRetained syncState];
    id v4 = [WeakRetained error];
    (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);
  }
  [*(id *)(a1 + 32) _shutdownRequest];
}

- (SSMachineDataRequest)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v20.receiver = self;
    v20.super_class = (Class)SSMachineDataRequest;
    uint64_t v6 = [(SSRequest *)&v20 init];
    if (v6)
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = SSXPCDictionaryCopyObjectWithClass(v5, "50", v8);
      accountID = v6->_accountID;
      v6->_accountID = (NSNumber *)v9;

      uint64_t v11 = objc_opt_class();
      uint64_t v12 = SSXPCDictionaryCopyObjectWithClass(v5, "51", v11);
      actionData = v6->_actionData;
      v6->_actionData = (NSData *)v12;

      uint64_t v14 = objc_opt_class();
      uint64_t v15 = SSXPCDictionaryCopyObjectWithClass(v5, "52", v14);
      actionName = v6->_actionName;
      v6->_actionName = (NSString *)v15;

      v6->_allowsBootstrapCellularData = xpc_dictionary_get_BOOL(v5, "54");
      v6->_protocolVersion = xpc_dictionary_get_int64(v5, "55");
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = SSXPCDictionaryCopyObjectWithClass(v5, "56", v17);
      userAgent = v6->_userAgent;
      v6->_userAgent = (NSString *)v18;

      v6->_waitsForPurchaseOperations = xpc_dictionary_get_BOOL(v5, "53");
    }
  }
  else
  {

    uint64_t v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->super._dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__SSMachineDataRequest_copyXPCEncoding__block_invoke;
  v8[3] = &unk_1E5BA7018;
  id v5 = v3;
  id v9 = v5;
  id v10 = self;
  dispatch_sync(dispatchQueue, v8);
  id v6 = v5;

  return v6;
}

void __39__SSMachineDataRequest_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "50", *(void *)(*(void *)(a1 + 40) + 96));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "51", *(void *)(*(void *)(a1 + 40) + 104));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "52", *(void *)(*(void *)(a1 + 40) + 112));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "54", *(unsigned char *)(*(void *)(a1 + 40) + 120));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "55", *(void *)(*(void *)(a1 + 40) + 128));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "56", *(void *)(*(void *)(a1 + 40) + 136));
  uint64_t v2 = *(void **)(a1 + 32);
  char v3 = *(unsigned char *)(*(void *)(a1 + 40) + 144);
  xpc_dictionary_set_BOOL(v2, "53", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
  objc_storeStrong((id *)&self->_actionData, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end