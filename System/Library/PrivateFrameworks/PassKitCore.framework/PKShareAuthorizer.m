@interface PKShareAuthorizer
+ (id)authorizeForRequest:(id)a3 presentationSceneIdentifier:(id)a4 authHandler:(id)a5 completion:(id)a6;
+ (void)_authorizeDeviceOwnerWithAuthHandler:(id)a3 completion:(id)a4 context:(id)a5 invalidateContext:(BOOL)a6;
+ (void)authorizeDeviceOwnerWithAuthHandler:(id)a3 completion:(id)a4;
- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3;
- (void)_authorizeForRequest:(id)a3 presentationSceneIdentifier:(id)a4 authHandler:(id)a5 completion:(id)a6;
- (void)_handleDidFinishIfNeeded;
- (void)dealloc;
- (void)invalidate;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeContextWithHandler:(id)a4;
- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3;
@end

@implementation PKShareAuthorizer

- (void)dealloc
{
  [(PKShareAuthorizer *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKShareAuthorizer;
  [(PKShareAuthorizer *)&v3 dealloc];
}

+ (id)authorizeForRequest:(id)a3 presentationSceneIdentifier:(id)a4 authHandler:(id)a5 completion:(id)a6
{
  id v9 = a6;
  if (v9)
  {
    id v10 = a5;
    id v11 = a4;
    id v12 = a3;
    v13 = objc_alloc_init(PKShareAuthorizer);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __92__PKShareAuthorizer_authorizeForRequest_presentationSceneIdentifier_authHandler_completion___block_invoke;
    v18[3] = &unk_1E56D8798;
    id v20 = v9;
    v14 = v13;
    v19 = v14;
    [(PKShareAuthorizer *)v14 _authorizeForRequest:v12 presentationSceneIdentifier:v11 authHandler:v10 completion:v18];

    v15 = v19;
    v16 = v14;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __92__PKShareAuthorizer_authorizeForRequest_presentationSceneIdentifier_authHandler_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 invalidate];
}

- (void)_authorizeForRequest:(id)a3 presentationSceneIdentifier:(id)a4 authHandler:(id)a5 completion:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a3;
  v14 = _Block_copy(a5);
  id authorizeHandler = self->_authorizeHandler;
  self->_id authorizeHandler = v14;

  v16 = _Block_copy(v12);
  id completion = self->_completion;
  self->_id completion = v16;

  objc_storeStrong((id *)&self->_presentationSceneIdentifier, a4);
  v18 = (LAContext *)objc_alloc_init(MEMORY[0x1E4F30B50]);
  context = self->_context;
  self->_context = v18;

  id v20 = [(LAContext *)self->_context externalizedContext];
  [v13 setExternalizedContext:v20];

  v21 = [[PKPaymentAuthorizationCoordinator alloc] initWithPaymentRequest:v13];
  authorizationCoordinator = self->_authorizationCoordinator;
  self->_authorizationCoordinator = v21;

  v23 = self->_authorizationCoordinator;
  if (v23)
  {
    [(PKPaymentAuthorizationCoordinator *)v23 setDelegate:self];
    [(PKPaymentAuthorizationCoordinator *)self->_authorizationCoordinator _setPrivateDelegate:self];
    v24 = self->_authorizationCoordinator;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __93__PKShareAuthorizer__authorizeForRequest_presentationSceneIdentifier_authHandler_completion___block_invoke;
    v25[3] = &unk_1E56DD7C8;
    v25[4] = self;
    [(PKPaymentAuthorizationCoordinator *)v24 presentWithCompletion:v25];
  }
  else
  {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
  }
}

void __93__PKShareAuthorizer__authorizeForRequest_presentationSceneIdentifier_authHandler_completion___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24);
    if (v3)
    {
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
      uint64_t v4 = *(void *)(a1 + 32);
      v5 = *(void **)(v4 + 24);
      *(void *)(v4 + 24) = 0;
    }
  }
}

- (void)invalidate
{
  [(PKPaymentAuthorizationCoordinator *)self->_authorizationCoordinator dismissWithCompletion:0];
  authorizationCoordinator = self->_authorizationCoordinator;
  self->_authorizationCoordinator = 0;

  context = self->_context;
  [(LAContext *)context invalidate];
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PKLogFacilityTypeGetObject(0x21uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_resultSuccess) {
      v6 = @"Yes";
    }
    else {
      v6 = @"No";
    }
    *(_DWORD *)buf = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "PKShareAuthorizer: Authorization did finish with success: %@", buf, 0xCu);
  }

  [v4 dismissWithCompletion:0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKShareAuthorizer_paymentAuthorizationCoordinatorDidFinish___block_invoke;
  block[3] = &unk_1E56D8AE0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __62__PKShareAuthorizer_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 50) = 1;
  return [*(id *)(a1 + 32) _handleDidFinishIfNeeded];
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeContextWithHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = PKLogFacilityTypeGetObject(0x21uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKShareAuthorizer: Got authorization starting to share.", buf, 2u);
  }

  self->_isAuthorizationHandlerRunning = 1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PKShareAuthorizer_paymentAuthorizationCoordinator_didAuthorizeContextWithHandler___block_invoke;
  aBlock[3] = &unk_1E56D86A8;
  aBlock[4] = self;
  id v9 = v7;
  id v16 = v9;
  uint64_t v10 = _Block_copy(aBlock);
  if (self->_authorizeHandler)
  {
    id v11 = [(LAContext *)self->_context externalizedContext];
    if (v11)
    {
      id authorizeHandler = (void (**)(id, void *, void *))self->_authorizeHandler;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __84__PKShareAuthorizer_paymentAuthorizationCoordinator_didAuthorizeContextWithHandler___block_invoke_21;
      v13[3] = &unk_1E56D86A8;
      v13[4] = self;
      id v14 = v10;
      authorizeHandler[2](authorizeHandler, v11, v13);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKShareAuthorizer: Error! Unable to get externalized auth", buf, 2u);
      }

      (*((void (**)(void *, void))v10 + 2))(v10, 0);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKShareAuthorizer: Error! No authorizeHandler completion provided!", buf, 2u);
    }

    (*((void (**)(void *, void))v10 + 2))(v10, 0);
  }
}

void __84__PKShareAuthorizer_paymentAuthorizationCoordinator_didAuthorizeContextWithHandler___block_invoke(uint64_t a1, int a2)
{
  char v2 = a2;
  id v4 = [[PKPaymentAuthorizationResult alloc] initWithStatus:a2 ^ 1u errors:0];
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = v2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  *(unsigned char *)(*(void *)(a1 + 32) + 49) = 0;
  [*(id *)(a1 + 32) _handleDidFinishIfNeeded];
}

void __84__PKShareAuthorizer_paymentAuthorizationCoordinator_didAuthorizeContextWithHandler___block_invoke_21(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PKShareAuthorizer_paymentAuthorizationCoordinator_didAuthorizeContextWithHandler___block_invoke_2;
  block[3] = &unk_1E56D8A68;
  uint64_t v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  char v6 = a2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __84__PKShareAuthorizer_paymentAuthorizationCoordinator_didAuthorizeContextWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  return self->_presentationSceneIdentifier;
}

- (void)_handleDidFinishIfNeeded
{
  id completion = (void (**)(id, BOOL))self->_completion;
  if (completion && self->_didFinish)
  {
    if (self->_isAuthorizationHandlerRunning)
    {
      id v4 = PKLogFacilityTypeGetObject(0x21uLL);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v6 = 0;
        _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "PKShareAuthorizer: deferring didFinish while authorization handler runs", v6, 2u);
      }
    }
    else
    {
      completion[2](completion, self->_resultSuccess);
      id v5 = self->_completion;
      self->_id completion = 0;
    }
  }
}

+ (void)authorizeDeviceOwnerWithAuthHandler:(id)a3 completion:(id)a4
{
  char v6 = (objc_class *)MEMORY[0x1E4F30B50];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [a1 _authorizeDeviceOwnerWithAuthHandler:v8 completion:v7 context:v9 invalidateContext:1];
}

+ (void)_authorizeDeviceOwnerWithAuthHandler:(id)a3 completion:(id)a4 context:(id)a5 invalidateContext:(BOOL)a6
{
  v30[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v29[0] = &unk_1EE22C440;
  id v12 = PKLocalizedShareableCredentialString(&cfstr_LocalAuthentic.isa, 0);
  v30[0] = v12;
  v29[1] = &unk_1EE22C458;
  id v13 = PKLocalizedString(&cfstr_Wallet_1.isa, 0);
  v29[2] = &unk_1EE22C470;
  v30[1] = v13;
  v30[2] = MEMORY[0x1E4F1CC38];
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__PKShareAuthorizer__authorizeDeviceOwnerWithAuthHandler_completion_context_invalidateContext___block_invoke;
  aBlock[3] = &unk_1E56D8798;
  id v28 = v10;
  id v15 = v11;
  id v27 = v15;
  id v16 = v10;
  v17 = _Block_copy(aBlock);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __95__PKShareAuthorizer__authorizeDeviceOwnerWithAuthHandler_completion_context_invalidateContext___block_invoke_34;
  v21[3] = &unk_1E56F1CC8;
  id v22 = v15;
  id v23 = v17;
  BOOL v25 = a6;
  id v24 = v9;
  id v18 = v9;
  id v19 = v17;
  id v20 = v15;
  [v20 evaluatePolicy:2 options:v14 reply:v21];
}

uint64_t __95__PKShareAuthorizer__authorizeDeviceOwnerWithAuthHandler_completion_context_invalidateContext___block_invoke(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = PKLogFacilityTypeGetObject(0x21uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = @"No";
    if (a2) {
      id v5 = @"Yes";
    }
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "PKShareAuthorizer: Authorization did finish with success: %@", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __95__PKShareAuthorizer__authorizeDeviceOwnerWithAuthHandler_completion_context_invalidateContext___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  id v8 = 0;
  if (v5 && !v6)
  {
    id v8 = [*(id *)(a1 + 32) externalizedContext];
  }
  uint64_t v9 = PKLogFacilityTypeGetObject(0x21uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = @"Y";
    if (!v8) {
      id v10 = @"N";
    }
    *(_DWORD *)buf = 138412290;
    v26 = v10;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKShareAuthorizer: Obtained externalized auth: %@", buf, 0xCu);
  }

  if (v8)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __95__PKShareAuthorizer__authorizeDeviceOwnerWithAuthHandler_completion_context_invalidateContext___block_invoke_2;
    aBlock[3] = &unk_1E56F1C78;
    char v22 = *(unsigned char *)(a1 + 56);
    id v11 = &v20;
    id v20 = *(id *)(a1 + 32);
    id v21 = *(id *)(a1 + 40);
    id v12 = _Block_copy(aBlock);
    id v13 = v12;
    id v14 = *(void **)(a1 + 48);
    if (v14)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __95__PKShareAuthorizer__authorizeDeviceOwnerWithAuthHandler_completion_context_invalidateContext___block_invoke_4;
      block[3] = &unk_1E56F1CA0;
      id v17 = v14;
      id v16 = v8;
      id v18 = v13;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      (*((void (**)(void *, uint64_t))v12 + 2))(v12, 1);
    }
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __95__PKShareAuthorizer__authorizeDeviceOwnerWithAuthHandler_completion_context_invalidateContext___block_invoke_41;
    v23[3] = &unk_1E56D8360;
    id v11 = &v24;
    id v24 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], v23);
  }
}

uint64_t __95__PKShareAuthorizer__authorizeDeviceOwnerWithAuthHandler_completion_context_invalidateContext___block_invoke_41(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __95__PKShareAuthorizer__authorizeDeviceOwnerWithAuthHandler_completion_context_invalidateContext___block_invoke_2(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__PKShareAuthorizer__authorizeDeviceOwnerWithAuthHandler_completion_context_invalidateContext___block_invoke_3;
  block[3] = &unk_1E56F1C50;
  char v7 = *(unsigned char *)(a1 + 48);
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  char v8 = a2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __95__PKShareAuthorizer__authorizeDeviceOwnerWithAuthHandler_completion_context_invalidateContext___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) invalidate];
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

uint64_t __95__PKShareAuthorizer__authorizeDeviceOwnerWithAuthHandler_completion_context_invalidateContext___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationSceneIdentifier, 0);
  objc_storeStrong(&self->_authorizeHandler, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_authorizationCoordinator, 0);
}

@end