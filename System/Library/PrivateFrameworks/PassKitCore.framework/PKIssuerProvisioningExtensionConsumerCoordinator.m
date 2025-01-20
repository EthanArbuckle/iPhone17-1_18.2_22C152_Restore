@interface PKIssuerProvisioningExtensionConsumerCoordinator
+ (id)beginWithExtension:(id)a3 completion:(id)a4;
- (BOOL)isInvalidated;
- (NSExtension)extension;
- (PKIssuerProvisioningExtensionConsumerCoordinator)init;
- (id)_initWithExtension:(id)a3;
- (void)_performWhenConnected:(id)a3;
- (void)dealloc;
- (void)generateRequestWithEntryIdentifier:(id)a3 configuration:(id)a4 certificateChain:(id)a5 nonce:(id)a6 nonceSignature:(id)a7 completionHandler:(id)a8;
- (void)invalidate;
- (void)passEntriesWithCompletion:(id)a3;
- (void)remotePassEntriesWithCompletion:(id)a3;
- (void)statusWithCompletion:(id)a3;
@end

@implementation PKIssuerProvisioningExtensionConsumerCoordinator

+ (id)beginWithExtension:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__14;
    v21[4] = __Block_byref_object_dispose__14;
    id v22 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke;
    v18[3] = &unk_1E56DEFC0;
    v20 = v21;
    id v8 = v5;
    id v19 = v8;
    [(PKAsyncUnaryOperationComposer *)v7 addOperation:v18];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_2;
    v15[3] = &unk_1E56DEFC0;
    v17 = v21;
    id v16 = v8;
    [(PKAsyncUnaryOperationComposer *)v7 addOperation:v15];
    v9 = [MEMORY[0x1E4F1CA98] null];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_3_19;
    v12[3] = &unk_1E56DF088;
    id v13 = v6;
    v14 = v21;
    v10 = [(PKAsyncUnaryOperationComposer *)v7 evaluateWithInput:v9 completion:v12];

    _Block_object_dispose(v21, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    id v10 = [[PKIssuerProvisioningExtensionConsumerCoordinator alloc] _initWithExtension:*(void *)(a1 + 32)];
  }
  else {
    id v10 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v10);
  if (v9) {

  }
  v8[2](v8, v7, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) == 0);
}

void __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_3;
  v37[3] = &unk_1E56DEFE8;
  v37[4] = *(void *)(a1 + 40);
  [v7 addCancelAction:v37];
  id v10 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  dispatch_time_t v11 = dispatch_time(0, 3000000000);
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  char v36 = 0;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_4;
  handler[3] = &unk_1E56DF038;
  id v12 = v7;
  id v29 = v12;
  v33 = v35;
  id v13 = *(id *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  id v30 = v13;
  uint64_t v34 = v14;
  id v15 = v9;
  id v32 = v15;
  id v16 = v8;
  id v31 = v16;
  dispatch_source_set_event_handler(v10, handler);
  dispatch_resume(v10);
  v17 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_16;
  v22[3] = &unk_1E56DF060;
  v18 = v10;
  v23 = v18;
  id v19 = v12;
  id v24 = v19;
  v27 = v35;
  id v20 = v15;
  id v26 = v20;
  id v21 = v16;
  id v25 = v21;
  [v17 _performWhenConnected:v22];

  _Block_object_dispose(v35, 8);
}

uint64_t __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) invalidate];
}

void __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_5;
  v5[3] = &unk_1E56DF010;
  v5[4] = *(void *)(a1 + 64);
  v5[5] = &v6;
  [v2 performAction:v5];
  if (*((unsigned char *)v7 + 24))
  {
    v3 = PKLogFacilityTypeGetObject(0x2BuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [*(id *)(a1 + 40) identifier];
      *(_DWORD *)buf = 138412290;
      dispatch_time_t v11 = v4;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Ex<%@>: extension did not connect in time...timing out.", buf, 0xCu);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) invalidate];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  _Block_object_dispose(&v6, 8);
}

uint64_t __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_5(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

void __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_16(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v2 = *(void **)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_2_17;
  v3[3] = &unk_1E56DF010;
  v3[4] = *(void *)(a1 + 64);
  v3[5] = &v4;
  [v2 performAction:v3];
  if (*((unsigned char *)v5 + 24)) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  _Block_object_dispose(&v4, 8);
}

uint64_t __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_2_17(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

void __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_3_19(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  char v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v9 = a4;
  if ([v7 isInvalidated]) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v8, v9);
}

- (PKIssuerProvisioningExtensionConsumerCoordinator)init
{
  return 0;
}

- (id)_initWithExtension:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v23.receiver = self;
    v23.super_class = (Class)PKIssuerProvisioningExtensionConsumerCoordinator;
    uint64_t v6 = [(PKIssuerProvisioningExtensionConsumerCoordinator *)&v23 init];
    char v7 = v6;
    if (v6)
    {
      v6->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v6->_extension, a3);
      extension = v7->_extension;
      id v22 = 0;
      uint64_t v9 = [(NSExtension *)extension beginExtensionRequestWithOptions:1 inputItems:0 error:&v22];
      id v10 = v22;
      requestIdentifier = v7->_requestIdentifier;
      v7->_requestIdentifier = (NSCopying *)v9;

      BOOL v12 = v10 != 0;
      id v13 = v7->_requestIdentifier;
      if (v13) {
        BOOL v14 = v10 == 0;
      }
      else {
        BOOL v14 = 0;
      }
      if (v14)
      {
        id v15 = -[NSExtension _extensionContextForUUID:](v7->_extension, "_extensionContextForUUID:");
        if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_storeStrong((id *)&v7->_context, v15);
          BOOL v12 = 0;
        }
        else
        {
          BOOL v12 = 1;
        }

        id v13 = v7->_requestIdentifier;
      }
      if (v13) {
        BOOL v17 = !v12;
      }
      else {
        BOOL v17 = 1;
      }
      if (!v17)
      {
        -[NSExtension cancelExtensionRequestWithIdentifier:](v7->_extension, "cancelExtensionRequestWithIdentifier:");
        v18 = v7->_requestIdentifier;
        v7->_requestIdentifier = 0;

        id v13 = v7->_requestIdentifier;
      }
      if (!v13)
      {
        v7->_invalidated = 1;
        id v19 = PKLogFacilityTypeGetObject(0x2BuLL);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = [v5 identifier];
          *(_DWORD *)buf = 138412546;
          id v25 = v20;
          __int16 v26 = 2112;
          id v27 = v10;
          _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "Ex<%@>: PKIssuerProvisioningExtensionConsumerCoordinator: failed to begin extension request with error %@.", buf, 0x16u);
        }
      }
    }
    self = v7;
    id v16 = self;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (void)dealloc
{
  [(PKIssuerProvisioningExtensionConsumerCoordinator *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKIssuerProvisioningExtensionConsumerCoordinator;
  [(PKIssuerProvisioningExtensionConsumerCoordinator *)&v3 dealloc];
}

- (BOOL)isInvalidated
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    if (self->_requestIdentifier)
    {
      -[NSExtension cancelExtensionRequestWithIdentifier:](self->_extension, "cancelExtensionRequestWithIdentifier:");
      requestIdentifier = self->_requestIdentifier;
      self->_requestIdentifier = 0;
    }
    context = self->_context;
    self->_context = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_performWhenConnected:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  if (v4)
  {
    char v7 = v4;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    uint64_t v6 = self->_context;
    os_unfair_lock_unlock(p_lock);
    if (v6) {
      [(PKIssuerProvisioningExtensionConsumerContext *)v6 performWhenConnected:v7];
    }
    else {
      v7[2]();
    }

    uint64_t v4 = v7;
  }
}

- (void)statusWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  if (v4)
  {
    char v7 = v4;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    uint64_t v6 = self->_context;
    os_unfair_lock_unlock(p_lock);
    if (v6) {
      [(PKIssuerProvisioningExtensionConsumerContext *)v6 statusWithCompletion:v7];
    }
    else {
      v7[2](v7, 0);
    }

    uint64_t v4 = v7;
  }
}

- (void)passEntriesWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  if (v4)
  {
    char v7 = v4;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    uint64_t v6 = self->_context;
    os_unfair_lock_unlock(p_lock);
    if (v6) {
      [(PKIssuerProvisioningExtensionConsumerContext *)v6 passEntriesWithCompletion:v7];
    }
    else {
      v7[2](v7, 0);
    }

    uint64_t v4 = v7;
  }
}

- (void)remotePassEntriesWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  if (v4)
  {
    char v7 = v4;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    uint64_t v6 = self->_context;
    os_unfair_lock_unlock(p_lock);
    if (v6) {
      [(PKIssuerProvisioningExtensionConsumerContext *)v6 remotePassEntriesWithCompletion:v7];
    }
    else {
      v7[2](v7, 0);
    }

    uint64_t v4 = v7;
  }
}

- (void)generateRequestWithEntryIdentifier:(id)a3 configuration:(id)a4 certificateChain:(id)a5 nonce:(id)a6 nonceSignature:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (v19)
  {
    os_unfair_lock_lock(&self->_lock);
    id v20 = self->_context;
    os_unfair_lock_unlock(&self->_lock);
    if (v20)
    {
      id v21 = self->_extension;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __157__PKIssuerProvisioningExtensionConsumerCoordinator_generateRequestWithEntryIdentifier_configuration_certificateChain_nonce_nonceSignature_completionHandler___block_invoke;
      v23[3] = &unk_1E56DF0B0;
      id v24 = v21;
      id v25 = v19;
      id v22 = v21;
      [(PKIssuerProvisioningExtensionConsumerContext *)v20 generateRequestWithEntryIdentifier:v14 configuration:v15 certificateChain:v16 nonce:v17 nonceSignature:v18 completionHandler:v23];
    }
    else
    {
      (*((void (**)(id, void))v19 + 2))(v19, 0);
    }
  }
}

void __157__PKIssuerProvisioningExtensionConsumerCoordinator_generateRequestWithEntryIdentifier_configuration_certificateChain_nonce_nonceSignature_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 _plugIn];
  id v8 = [v5 bundleInfoDictionary];

  uint64_t v6 = [*(id *)(a1 + 32) identifier];
  char v7 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1CC70]];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    char v7 = 0;
  }
  [v4 setHostApplicationIdentifier:v6];
  [v4 setHostApplicationVersion:v7];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end