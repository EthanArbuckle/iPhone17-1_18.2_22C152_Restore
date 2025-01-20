@interface PKIssuerProvisioningExtensionConsumerContext
- (PKIssuerProvisioningExtensionConsumerContext)init;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)connectWithCompletion:(id)a3;
- (void)dealloc;
- (void)generateRequestWithEntryIdentifier:(id)a3 configuration:(id)a4 certificateChain:(id)a5 nonce:(id)a6 nonceSignature:(id)a7 completionHandler:(id)a8;
- (void)passEntriesWithCompletion:(id)a3;
- (void)performWhenConnected:(id)a3;
- (void)remotePassEntriesWithCompletion:(id)a3;
- (void)statusWithCompletion:(id)a3;
@end

@implementation PKIssuerProvisioningExtensionConsumerContext

- (PKIssuerProvisioningExtensionConsumerContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKIssuerProvisioningExtensionConsumerContext;
  result = [(PKIssuerProvisioningExtensionConsumerContext *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_super v3 = self->_blocksQueuedForConnected;
  blocksQueuedForConnected = self->_blocksQueuedForConnected;
  self->_blocksQueuedForConnected = 0;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = v3;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)PKIssuerProvisioningExtensionConsumerContext;
  [(PKIssuerProvisioningExtensionConsumerContext *)&v10 dealloc];
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(PKIssuerProvisioningExtensionConsumerContext *)self _auxiliaryConnection];
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(PKIssuerProvisioningExtensionConsumerContext *)self _auxiliaryConnection];
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (void)connectWithCompletion:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4) {
    (*((void (**)(id))v4 + 2))(v4);
  }
  os_unfair_lock_lock(&self->_lock);
  if (!self->_connected)
  {
    self->_connected = 1;
    uint64_t v6 = [(PKIssuerProvisioningExtensionConsumerContext *)self _auxiliaryConnection];
    uint64_t v7 = v6;
    if (v6)
    {
      [v6 auditToken];
      uint64_t v8 = SecTaskCreateWithAuditToken(0, &token);
      if (v8)
      {
        uint64_t v9 = v8;
        objc_super v10 = (NSString *)SecTaskCopyValueForEntitlement(v8, @"com.apple.developer.team-identifier", 0);
        teamID = self->_teamID;
        self->_teamID = v10;

        long long v12 = (__CFString *)SecTaskCopySigningIdentifier(v9, 0);
        extensionIdentifier = self->_extensionIdentifier;
        self->_extensionIdentifier = &v12->isa;

        if ([(NSString *)self->_teamID length] != 10)
        {
          long long v14 = PKLogFacilityTypeGetObject(0x2BuLL);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = self->_extensionIdentifier;
            *(_DWORD *)buf = 138412290;
            v32 = v15;
            _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Ex<%@>: ConsumerContext: teamID is invalid", buf, 0xCu);
          }

          uint64_t v16 = self->_teamID;
          self->_teamID = 0;
        }
        v17 = (void *)SecTaskCopyValueForEntitlement(v9, @"com.apple.developer.payment-pass-provisioning", 0);
        self->_entitled = [v17 BOOLValue];
        CFRelease(v9);
      }
    }
  }
  if ([(NSMutableArray *)self->_blocksQueuedForConnected count]) {
    v18 = self->_blocksQueuedForConnected;
  }
  else {
    v18 = 0;
  }
  blocksQueuedForConnected = self->_blocksQueuedForConnected;
  self->_blocksQueuedForConnected = 0;

  os_unfair_lock_unlock(&self->_lock);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v20 = v18;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v25 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v25 + 1) + 8 * i));
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v22);
  }
}

- (void)performWhenConnected:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (v4)
  {
    aBlock = v4;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_connected)
    {
      os_unfair_lock_unlock(&self->_lock);
      aBlock[2]();
    }
    else
    {
      blocksQueuedForConnected = self->_blocksQueuedForConnected;
      if (!blocksQueuedForConnected)
      {
        uint64_t v7 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
        uint64_t v8 = self->_blocksQueuedForConnected;
        self->_blocksQueuedForConnected = v7;

        blocksQueuedForConnected = self->_blocksQueuedForConnected;
      }
      uint64_t v9 = _Block_copy(aBlock);
      [(NSMutableArray *)blocksQueuedForConnected addObject:v9];

      os_unfair_lock_unlock(p_lock);
    }
  }
}

- (void)statusWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__47;
    v22[4] = __Block_byref_object_dispose__47;
    id v23 = _Block_copy(v4);
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    char v21 = 0;
    uint64_t v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    dispatch_time_t v7 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __69__PKIssuerProvisioningExtensionConsumerContext_statusWithCompletion___block_invoke;
    handler[3] = &unk_1E56E7C90;
    handler[4] = self;
    handler[5] = v20;
    handler[6] = v22;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v6);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __69__PKIssuerProvisioningExtensionConsumerContext_statusWithCompletion___block_invoke_16;
    v15[3] = &unk_1E56ECFD8;
    uint64_t v8 = v6;
    uint64_t v16 = v8;
    v17 = v20;
    v18 = v22;
    uint64_t v9 = [(PKIssuerProvisioningExtensionConsumerContext *)self remoteObjectProxyWithErrorHandler:v15];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__PKIssuerProvisioningExtensionConsumerContext_statusWithCompletion___block_invoke_2;
    v11[3] = &unk_1E56ED000;
    objc_super v10 = v8;
    long long v12 = v10;
    long long v13 = v20;
    long long v14 = v22;
    [v9 statusWithCompletion:v11];

    _Block_object_dispose(v20, 8);
    _Block_object_dispose(v22, 8);
  }
}

void __69__PKIssuerProvisioningExtensionConsumerContext_statusWithCompletion___block_invoke(void *a1)
{
  char v1 = 0;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(a1[5] + 8) + 24), (unsigned __int8 *)&v1, 1u);
  if (!v1)
  {
    objc_super v3 = PKLogFacilityTypeGetObject(0x2BuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = a1[4];
      uint64_t v5 = *(void *)(v4 + 40);
      uint64_t v6 = *(void *)(v4 + 48);
      int v9 = 138412546;
      uint64_t v10 = v5;
      __int16 v11 = 2114;
      uint64_t v12 = v6;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Ex<%@>: ConsumerContext: timeout trying to get status with extension for teamID: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    (*(void (**)(void))(*(void *)(*(void *)(a1[6] + 8) + 40) + 16))();
    uint64_t v7 = *(void *)(a1[6] + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
  }
}

void __69__PKIssuerProvisioningExtensionConsumerContext_statusWithCompletion___block_invoke_16(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  char v2 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 24), (unsigned __int8 *)&v2, 1u);
  if (!v2)
  {
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

void __69__PKIssuerProvisioningExtensionConsumerContext_statusWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  char v3 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 24), (unsigned __int8 *)&v3, 1u);
  if (!v3)
  {
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;
  }
}

- (void)passEntriesWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__47;
    v22[4] = __Block_byref_object_dispose__47;
    id v23 = _Block_copy(v4);
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    char v21 = 0;
    id v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    dispatch_time_t v7 = dispatch_time(0, 30000000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __74__PKIssuerProvisioningExtensionConsumerContext_passEntriesWithCompletion___block_invoke;
    handler[3] = &unk_1E56E7C90;
    handler[4] = self;
    handler[5] = v20;
    handler[6] = v22;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v6);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __74__PKIssuerProvisioningExtensionConsumerContext_passEntriesWithCompletion___block_invoke_19;
    v15[3] = &unk_1E56ECFD8;
    uint64_t v8 = v6;
    uint64_t v16 = v8;
    v17 = v20;
    v18 = v22;
    int v9 = [(PKIssuerProvisioningExtensionConsumerContext *)self remoteObjectProxyWithErrorHandler:v15];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__PKIssuerProvisioningExtensionConsumerContext_passEntriesWithCompletion___block_invoke_2;
    v11[3] = &unk_1E56ED028;
    uint64_t v10 = v8;
    uint64_t v12 = v10;
    uint64_t v13 = v20;
    long long v14 = v22;
    [v9 passEntriesWithCompletion:v11];

    _Block_object_dispose(v20, 8);
    _Block_object_dispose(v22, 8);
  }
}

void __74__PKIssuerProvisioningExtensionConsumerContext_passEntriesWithCompletion___block_invoke(void *a1)
{
  char v1 = 0;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(a1[5] + 8) + 24), (unsigned __int8 *)&v1, 1u);
  if (!v1)
  {
    char v3 = PKLogFacilityTypeGetObject(0x2BuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = a1[4];
      uint64_t v5 = *(void *)(v4 + 48);
      uint64_t v6 = *(void *)(v4 + 40);
      int v9 = 138412546;
      uint64_t v10 = v5;
      __int16 v11 = 2114;
      uint64_t v12 = v6;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Ex<%@>: ConsumerContext: timeout trying to get pass entries with extension for teamID: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    (*(void (**)(void))(*(void *)(*(void *)(a1[6] + 8) + 40) + 16))();
    uint64_t v7 = *(void *)(a1[6] + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
  }
}

void __74__PKIssuerProvisioningExtensionConsumerContext_passEntriesWithCompletion___block_invoke_19(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  char v2 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 24), (unsigned __int8 *)&v2, 1u);
  if (!v2)
  {
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

void __74__PKIssuerProvisioningExtensionConsumerContext_passEntriesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  if (PassEntriesValidateStructure(v7))
  {
    uint64_t v3 = v7;
  }
  else
  {

    uint64_t v3 = 0;
  }
  char v4 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 24), (unsigned __int8 *)&v4, 1u);
  if (!v4)
  {
    id v8 = v3;
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;

    uint64_t v3 = v8;
  }
}

- (void)remotePassEntriesWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__47;
    v22[4] = __Block_byref_object_dispose__47;
    id v23 = _Block_copy(v4);
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    char v21 = 0;
    uint64_t v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    dispatch_time_t v7 = dispatch_time(0, 30000000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __80__PKIssuerProvisioningExtensionConsumerContext_remotePassEntriesWithCompletion___block_invoke;
    handler[3] = &unk_1E56E7C90;
    handler[4] = self;
    handler[5] = v20;
    handler[6] = v22;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v6);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __80__PKIssuerProvisioningExtensionConsumerContext_remotePassEntriesWithCompletion___block_invoke_21;
    v15[3] = &unk_1E56ECFD8;
    id v8 = v6;
    uint64_t v16 = v8;
    v17 = v20;
    v18 = v22;
    int v9 = [(PKIssuerProvisioningExtensionConsumerContext *)self remoteObjectProxyWithErrorHandler:v15];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __80__PKIssuerProvisioningExtensionConsumerContext_remotePassEntriesWithCompletion___block_invoke_2;
    v11[3] = &unk_1E56ED028;
    uint64_t v10 = v8;
    uint64_t v12 = v10;
    uint64_t v13 = v20;
    long long v14 = v22;
    [v9 remotePassEntriesWithCompletion:v11];

    _Block_object_dispose(v20, 8);
    _Block_object_dispose(v22, 8);
  }
}

void __80__PKIssuerProvisioningExtensionConsumerContext_remotePassEntriesWithCompletion___block_invoke(void *a1)
{
  char v1 = 0;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(a1[5] + 8) + 24), (unsigned __int8 *)&v1, 1u);
  if (!v1)
  {
    uint64_t v3 = PKLogFacilityTypeGetObject(0x2BuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = a1[4];
      uint64_t v5 = *(void *)(v4 + 40);
      uint64_t v6 = *(void *)(v4 + 48);
      int v9 = 138412546;
      uint64_t v10 = v5;
      __int16 v11 = 2114;
      uint64_t v12 = v6;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Ex<%@>: ConsumerContext: timeout trying to get remote pass entries with extension for teamID: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    (*(void (**)(void))(*(void *)(*(void *)(a1[6] + 8) + 40) + 16))();
    uint64_t v7 = *(void *)(a1[6] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
  }
}

void __80__PKIssuerProvisioningExtensionConsumerContext_remotePassEntriesWithCompletion___block_invoke_21(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  char v2 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 24), (unsigned __int8 *)&v2, 1u);
  if (!v2)
  {
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

void __80__PKIssuerProvisioningExtensionConsumerContext_remotePassEntriesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  if (PassEntriesValidateStructure(v7))
  {
    uint64_t v3 = v7;
  }
  else
  {

    uint64_t v3 = 0;
  }
  char v4 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 24), (unsigned __int8 *)&v4, 1u);
  if (!v4)
  {
    id v8 = v3;
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;

    uint64_t v3 = v8;
  }
}

- (void)generateRequestWithEntryIdentifier:(id)a3 configuration:(id)a4 certificateChain:(id)a5 nonce:(id)a6 nonceSignature:(id)a7 completionHandler:(id)a8
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v14 = a4;
  id v40 = a5;
  id v15 = a6;
  id v41 = a7;
  id v16 = a8;
  if (v16)
  {
    v17 = [v14 encryptionScheme];
    v18 = self->_teamID;
    if (self->_entitled)
    {
      long long v60 = 0u;
      long long v61 = 0u;
      v19 = [(PKIssuerProvisioningExtensionConsumerContext *)self _auxiliaryConnection];
      v20 = v19;
      if (v19)
      {
        [v19 auditToken];
      }
      else
      {
        long long v60 = 0u;
        long long v61 = 0u;
      }

      uint64_t v59 = 0;
      unsigned int v58 = 0;
      id v22 = v15;
      V0YaM92nP0Xx19HNvczPJ((uint64_t)&v60, 32, [v22 bytes], objc_msgSend(v22, "length"), (uint64_t)&v59, (uint64_t)&v58);
      int v24 = v23;
      if (!v23 && v59 && v58)
      {
        id v25 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        uint64_t v21 = [v25 initWithBytes:v59 length:v58];
      }
      else
      {
        long long v26 = PKLogFacilityTypeGetObject(0x2BuLL);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          extensionIdentifier = self->_extensionIdentifier;
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = extensionIdentifier;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v24;
          *(_WORD *)&buf[18] = 2112;
          *(void *)&buf[20] = v42;
          *(_WORD *)&buf[28] = 2114;
          *(void *)&buf[30] = v18;
          _os_log_impl(&dword_190E10000, v26, OS_LOG_TYPE_DEFAULT, "Ex<%@>: ConsumerContext: Proceeding with provisioning without fairplay data: %d for identifier: %@ and teamID: %{public}@", buf, 0x26u);
        }

        uint64_t v21 = 0;
      }
      if (v59) {
        jEHf8Xzsv8K(v59);
      }
    }
    else
    {
      uint64_t v21 = 0;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__47;
    *(void *)&buf[32] = __Block_byref_object_dispose__47;
    long long v28 = _Block_copy(v16);
    id v39 = v16;
    v29 = (void *)v21;
    id v63 = v28;
    *(void *)&long long v60 = 0;
    *((void *)&v60 + 1) = &v60;
    *(void *)&long long v61 = 0x2020000000;
    BYTE8(v61) = 0;
    v30 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    dispatch_time_t v31 = dispatch_time(0, 20000000000);
    dispatch_source_set_timer(v30, v31, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __153__PKIssuerProvisioningExtensionConsumerContext_generateRequestWithEntryIdentifier_configuration_certificateChain_nonce_nonceSignature_completionHandler___block_invoke;
    handler[3] = &unk_1E56ED050;
    v56 = &v60;
    handler[4] = self;
    id v32 = v42;
    id v55 = v32;
    v57 = buf;
    dispatch_source_set_event_handler(v30, handler);
    dispatch_resume(v30);
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __153__PKIssuerProvisioningExtensionConsumerContext_generateRequestWithEntryIdentifier_configuration_certificateChain_nonce_nonceSignature_completionHandler___block_invoke_30;
    v50[3] = &unk_1E56ECFD8;
    uint64_t v33 = v30;
    v51 = v33;
    v52 = &v60;
    v53 = buf;
    v34 = [(PKIssuerProvisioningExtensionConsumerContext *)self remoteObjectProxyWithErrorHandler:v50];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __153__PKIssuerProvisioningExtensionConsumerContext_generateRequestWithEntryIdentifier_configuration_certificateChain_nonce_nonceSignature_completionHandler___block_invoke_2;
    v43[3] = &unk_1E56ED078;
    v35 = v33;
    v44 = v35;
    v48 = &v60;
    id v36 = v17;
    id v45 = v36;
    v37 = v18;
    v46 = v37;
    id v38 = v29;
    id v47 = v38;
    v49 = buf;
    [v34 generateRequestWithEntryIdentifier:v32 configuration:v14 certificateChain:v40 nonce:v15 nonceSignature:v41 completionHandler:v43];

    id v16 = v39;
    _Block_object_dispose(&v60, 8);
    _Block_object_dispose(buf, 8);
  }
}

void __153__PKIssuerProvisioningExtensionConsumerContext_generateRequestWithEntryIdentifier_configuration_certificateChain_nonce_nonceSignature_completionHandler___block_invoke(void *a1)
{
  char v1 = 0;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(a1[6] + 8) + 24), (unsigned __int8 *)&v1, 1u);
  if (!v1)
  {
    uint64_t v3 = PKLogFacilityTypeGetObject(0x2BuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = a1[4];
      uint64_t v5 = a1[5];
      uint64_t v6 = *(void *)(v4 + 40);
      uint64_t v7 = *(void *)(v4 + 48);
      int v10 = 138412802;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v5;
      __int16 v14 = 2114;
      uint64_t v15 = v7;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Ex<%@>: ConsumerContext: timeout trying to generate request with entry identifier: %@ for teamID: %{public}@", (uint8_t *)&v10, 0x20u);
    }

    AnalyticsSendEvent();
    (*(void (**)(void))(*(void *)(*(void *)(a1[7] + 8) + 40) + 16))();
    uint64_t v8 = *(void *)(a1[7] + 8);
    int v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
}

void __153__PKIssuerProvisioningExtensionConsumerContext_generateRequestWithEntryIdentifier_configuration_certificateChain_nonce_nonceSignature_completionHandler___block_invoke_30(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  char v2 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 24), (unsigned __int8 *)&v2, 1u);
  if (!v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

void __153__PKIssuerProvisioningExtensionConsumerContext_generateRequestWithEntryIdentifier_configuration_certificateChain_nonce_nonceSignature_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  char v3 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 64) + 8) + 24), (unsigned __int8 *)&v3, 1u);
  if (!v3)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
    [v6 setEncryptionVersion:*(void *)(a1 + 40)];
    [v6 setIssuerIdentifier:*(void *)(a1 + 48)];
    [v6 setFPInfo:*(void *)(a1 + 56)];
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) + 16))();
    uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_blocksQueuedForConnected, 0);
}

@end