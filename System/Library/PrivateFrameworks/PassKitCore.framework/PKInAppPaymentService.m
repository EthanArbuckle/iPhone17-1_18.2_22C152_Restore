@interface PKInAppPaymentService
- (BOOL)secureElementStatus:(unint64_t *)a3;
- (PKInAppPaymentService)init;
- (id)_remoteObjectProxy;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (id)_remoteObjectProxyWithFailureHandler:(id)a3;
- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)paymentHardwareStatusWithType:(unint64_t)a3;
- (int64_t)cardsAvailableForAMPWithCountryCode:(id)a3;
- (void)cardDataForMerchantIdentifier:(id)a3 countryCode:(id)a4 completion:(id)a5;
- (void)cardsAvailableForAMPWithCountryCode:(id)a3 completion:(id)a4;
- (void)enrollPaymentPassWithUniqueIdentifier:(id)a3 merchantSession:(id)a4 completion:(id)a5;
- (void)hasValidSecurityConfigurationWithType:(unint64_t)a3 completion:(id)a4;
- (void)merchantStatusCheck:(id)a3 merchantDomain:(id)a4 sourceApplicationSecondaryIdentifier:(id)a5 completion:(id)a6;
- (void)paymentHardwareStatusWithType:(unint64_t)a3 completion:(id)a4;
- (void)paymentServicesMerchantURLForAPIType:(int64_t)a3 completion:(id)a4;
- (void)presentInAppPaymentInterfaceWithPaymentRequest:(id)a3 awaitingRemoteNetworkPaymentRequest:(BOOL)a4 forHostIdentifier:(id)a5 hostSceneIdentifier:(id)a6 hostSceneBundleIdentifier:(id)a7 orientation:(id)a8 omitPresentationTarget:(BOOL)a9 analyticsSubject:(id)a10 analyticsArchivedSessionToken:(id)a11 completion:(id)a12;
- (void)registerPaymentListenerEndpoint:(id)a3 forHostIdentifier:(id)a4 completion:(id)a5;
- (void)retrievePaymentListenerEndpointForHostIdentifier:(id)a3 completion:(id)a4;
- (void)secureElementStatusWithCompletion:(id)a3;
- (void)validatePayLaterMerchandisingConfiguration:(id)a3 type:(unint64_t)a4 completion:(id)a5;
@end

@implementation PKInAppPaymentService

- (PKInAppPaymentService)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKInAppPaymentService;
  v2 = [(PKInAppPaymentService *)&v8 init];
  if (v2)
  {
    v3 = [PKXPCService alloc];
    v4 = PDInAppPaymentServiceInterface();
    uint64_t v5 = [(PKXPCService *)v3 initWithMachServiceName:@"com.apple.passd.in-app-payment" remoteObjectInterface:v4 exportedObjectInterface:0 exportedObject:v2];
    remoteService = v2->_remoteService;
    v2->_remoteService = (PKXPCService *)v5;
  }
  return v2;
}

- (id)_remoteObjectProxy
{
  return [(PKXPCService *)self->_remoteService remoteObjectProxy];
}

- (id)_remoteObjectProxyWithFailureHandler:(id)a3
{
  return [(PKXPCService *)self->_remoteService remoteObjectProxyWithFailureHandler:a3];
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  return [(PKXPCService *)self->_remoteService remoteObjectProxyWithErrorHandler:a3];
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return [(PKXPCService *)self->_remoteService synchronousRemoteObjectProxyWithErrorHandler:a3];
}

- (void)registerPaymentListenerEndpoint:(id)a3 forHostIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__PKInAppPaymentService_registerPaymentListenerEndpoint_forHostIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v20 = a2;
  id v10 = v9;
  aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  v13 = _Block_copy(aBlock);
  v14 = [(PKInAppPaymentService *)self _remoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__PKInAppPaymentService_registerPaymentListenerEndpoint_forHostIdentifier_completion___block_invoke_11;
  v16[3] = &unk_1E56D8798;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 registerPaymentListenerEndpoint:v12 forHostIdentifier:v11 handler:v16];
}

uint64_t __86__PKInAppPaymentService_registerPaymentListenerEndpoint_forHostIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_190E10000, v2, OS_LOG_TYPE_ERROR, "XPC Failure in -[PKInAppPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __86__PKInAppPaymentService_registerPaymentListenerEndpoint_forHostIdentifier_completion___block_invoke_11(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)retrievePaymentListenerEndpointForHostIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PKInAppPaymentService_retrievePaymentListenerEndpointForHostIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKInAppPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__PKInAppPaymentService_retrievePaymentListenerEndpointForHostIdentifier_completion___block_invoke_13;
  v13[3] = &unk_1E56E2EC0;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 retrievePaymentListenerEndpointForHostIdentifier:v9 handler:v13];
}

uint64_t __85__PKInAppPaymentService_retrievePaymentListenerEndpointForHostIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_190E10000, v2, OS_LOG_TYPE_ERROR, "XPC Failure in -[PKInAppPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __85__PKInAppPaymentService_retrievePaymentListenerEndpointForHostIdentifier_completion___block_invoke_13(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)presentInAppPaymentInterfaceWithPaymentRequest:(id)a3 awaitingRemoteNetworkPaymentRequest:(BOOL)a4 forHostIdentifier:(id)a5 hostSceneIdentifier:(id)a6 hostSceneBundleIdentifier:(id)a7 orientation:(id)a8 omitPresentationTarget:(BOOL)a9 analyticsSubject:(id)a10 analyticsArchivedSessionToken:(id)a11 completion:(id)a12
{
  BOOL v32 = a4;
  id v19 = a12;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __265__PKInAppPaymentService_presentInAppPaymentInterfaceWithPaymentRequest_awaitingRemoteNetworkPaymentRequest_forHostIdentifier_hostSceneIdentifier_hostSceneBundleIdentifier_orientation_omitPresentationTarget_analyticsSubject_analyticsArchivedSessionToken_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v37 = a2;
  id v20 = v19;
  aBlock[4] = self;
  id v36 = v20;
  id v30 = a11;
  id v21 = a10;
  id v22 = a8;
  id v23 = a7;
  id v24 = a6;
  id v25 = a5;
  id v26 = a3;
  v31 = _Block_copy(aBlock);
  v27 = [(PKInAppPaymentService *)self _remoteObjectProxyWithErrorHandler:v31];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __265__PKInAppPaymentService_presentInAppPaymentInterfaceWithPaymentRequest_awaitingRemoteNetworkPaymentRequest_forHostIdentifier_hostSceneIdentifier_hostSceneBundleIdentifier_orientation_omitPresentationTarget_analyticsSubject_analyticsArchivedSessionToken_completion___block_invoke_18;
  v33[3] = &unk_1E56D8928;
  v33[4] = self;
  id v34 = v20;
  id v28 = v20;
  LOBYTE(v29) = a9;
  [v27 presentInAppPaymentInterfaceWithPaymentRequest:v26 awaitingRemoteNetworkPaymentRequest:v32 forHostIdentifier:v25 hostSceneIdentifier:v24 hostSceneBundleIdentifier:v23 orientation:v22 omitPresentationTarget:v29 analyticsSubject:v21 analyticsArchivedSessionToken:v30 handler:v33];
}

void __265__PKInAppPaymentService_presentInAppPaymentInterfaceWithPaymentRequest_awaitingRemoteNetworkPaymentRequest_forHostIdentifier_hostSceneIdentifier_hostSceneBundleIdentifier_orientation_omitPresentationTarget_analyticsSubject_analyticsArchivedSessionToken_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138412290;
    id v12 = v8;
    _os_log_error_impl(&dword_190E10000, v4, OS_LOG_TYPE_ERROR, "XPC Failure in -[PKInAppPaymentService %@];",
      buf,
      0xCu);
  }
  if (*(void *)(a1 + 40))
  {
    int v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28A50];
    id v10 = v3;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    uint64_t v7 = [v5 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v6];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __265__PKInAppPaymentService_presentInAppPaymentInterfaceWithPaymentRequest_awaitingRemoteNetworkPaymentRequest_forHostIdentifier_hostSceneIdentifier_hostSceneBundleIdentifier_orientation_omitPresentationTarget_analyticsSubject_analyticsArchivedSessionToken_completion___block_invoke_18(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)merchantStatusCheck:(id)a3 merchantDomain:(id)a4 sourceApplicationSecondaryIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__PKInAppPaymentService_merchantStatusCheck_merchantDomain_sourceApplicationSecondaryIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v39 = a2;
  id v15 = v14;
  aBlock[4] = self;
  id v38 = v15;
  id v16 = _Block_copy(aBlock);
  SEL v17 = [(PKInAppPaymentService *)self _remoteObjectProxyWithErrorHandler:v16];
  v33 = v16;
  if (v12) {
    BOOL v18 = [v12 length] == 0;
  }
  else {
    BOOL v18 = 1;
  }
  id v19 = objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceAndNewlineCharacterSet", v33);
  id v20 = v11;
  id v21 = [v11 stringByTrimmingCharactersInSet:v19];

  id v22 = [v21 lowercaseString];

  if (v22) {
    BOOL v23 = [v22 length] == 0;
  }
  else {
    BOOL v23 = 1;
  }
  if (([v22 isEqualToString:@"null"] & 1) != 0
    || ([v22 isEqualToString:@"undefined"] & 1) != 0
    || ([v22 isEqualToString:@"example.com.store"] & 1) != 0)
  {
    BOOL v24 = 1;
  }
  else
  {
    uint64_t v32 = [v22 rangeOfString:@"^[A-Za-z0-9~_+&@$!|,.;-]+$" options:1024];
    BOOL v24 = v32 == 0x7FFFFFFFFFFFFFFFLL;
    if (!v18 && !v23 && v32 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __108__PKInAppPaymentService_merchantStatusCheck_merchantDomain_sourceApplicationSecondaryIdentifier_completion___block_invoke_33;
      v35[3] = &unk_1E56D8928;
      v35[4] = self;
      id v36 = v15;
      id v28 = v20;
      [v17 merchantStatusCheck:v20 merchantDomain:v12 sourceApplicationSecondaryIdentifier:v13 handler:v35];
      id v30 = v36;
      uint64_t v29 = v34;
      goto LABEL_22;
    }
  }
  if (v18)
  {
    id v25 = PKLogFacilityTypeGetObject(7uLL);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v41 = v26;
      v27 = "%@ called with empty domainName";
LABEL_17:
      _os_log_impl(&dword_190E10000, v25, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (v23)
  {
    id v25 = PKLogFacilityTypeGetObject(7uLL);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v41 = v26;
      v27 = "%@ called with empty merchantIdentifier";
      goto LABEL_17;
    }
LABEL_18:
    id v28 = v20;
    uint64_t v29 = v34;
LABEL_19:

    goto LABEL_20;
  }
  id v28 = v20;
  uint64_t v29 = v34;
  if (v24)
  {
    id v25 = PKLogFacilityTypeGetObject(7uLL);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v31 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v41 = v31;
      _os_log_impl(&dword_190E10000, v25, OS_LOG_TYPE_DEFAULT, "%@ called with invalid merchantIdentifier", buf, 0xCu);
    }
    goto LABEL_19;
  }
LABEL_20:
  if (v15)
  {
    id v30 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:0];
    (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v30);
LABEL_22:
  }
}

void __108__PKInAppPaymentService_merchantStatusCheck_merchantDomain_sourceApplicationSecondaryIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138412290;
    id v13 = v9;
    _os_log_error_impl(&dword_190E10000, v4, OS_LOG_TYPE_ERROR, "XPC Failure in -[PKInAppPaymentService %@];",
      buf,
      0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v10 = *MEMORY[0x1E4F28A50];
    id v11 = v3;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    id v8 = (void *)[v6 initWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v7];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v8);
  }
}

uint64_t __108__PKInAppPaymentService_merchantStatusCheck_merchantDomain_sourceApplicationSecondaryIdentifier_completion___block_invoke_33(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)paymentServicesMerchantURLForAPIType:(int64_t)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKInAppPaymentService_paymentServicesMerchantURLForAPIType_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v16 = a2;
  id v8 = v7;
  aBlock[4] = self;
  id v15 = v8;
  uint64_t v9 = _Block_copy(aBlock);
  uint64_t v10 = [(PKInAppPaymentService *)self _remoteObjectProxyWithFailureHandler:v9];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__PKInAppPaymentService_paymentServicesMerchantURLForAPIType_completion___block_invoke_34;
  v12[3] = &unk_1E56E2EE8;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 paymentServicesMerchantURLForAPIType:a3 handler:v12];
}

uint64_t __73__PKInAppPaymentService_paymentServicesMerchantURLForAPIType_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    id v6 = v4;
    _os_log_error_impl(&dword_190E10000, v2, OS_LOG_TYPE_ERROR, "XPC Failure in -[PKInAppPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __73__PKInAppPaymentService_paymentServicesMerchantURLForAPIType_completion___block_invoke_34(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PKLogFacilityTypeGetObject(7uLL);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      id v8 = [v5 description];
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Returned payment services merchant URL: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (v7)
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Received no payment services merchant URL. This is an error.", (uint8_t *)&v10, 2u);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
  }
}

- (BOOL)secureElementStatus:(unint64_t *)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v4 = [(PKInAppPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__PKInAppPaymentService_secureElementStatus___block_invoke;
  v6[3] = &unk_1E56E2F10;
  v6[4] = &v7;
  v6[5] = a3;
  [v4 secureElementStatusWithCompletion:v6];
  LOBYTE(a3) = *((unsigned char *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return (char)a3;
}

uint64_t __45__PKInAppPaymentService_secureElementStatus___block_invoke(uint64_t result, char a2, uint64_t a3)
{
  id v3 = *(void **)(result + 40);
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  if (v3) {
    void *v3 = a3;
  }
  return result;
}

- (void)secureElementStatusWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKInAppPaymentService_secureElementStatusWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  uint64_t v7 = _Block_copy(aBlock);
  id v8 = [(PKInAppPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__PKInAppPaymentService_secureElementStatusWithCompletion___block_invoke_37;
  v10[3] = &unk_1E56E2F38;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 secureElementStatusWithCompletion:v10];
}

uint64_t __59__PKInAppPaymentService_secureElementStatusWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    id v6 = v4;
    _os_log_error_impl(&dword_190E10000, v2, OS_LOG_TYPE_ERROR, "XPC Failure in -[PKInAppPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __59__PKInAppPaymentService_secureElementStatusWithCompletion___block_invoke_37(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)paymentHardwareStatusWithType:(unint64_t)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__21;
  uint64_t v12 = __Block_byref_object_dispose__21;
  id v13 = 0;
  v4 = [(PKInAppPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__PKInAppPaymentService_paymentHardwareStatusWithType___block_invoke;
  v7[3] = &unk_1E56E2F60;
  v7[4] = &v8;
  [v4 paymentHardwareStatusWithType:a3 completion:v7];
  id v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return v5;
}

void __55__PKInAppPaymentService_paymentHardwareStatusWithType___block_invoke(uint64_t a1, void *a2)
{
}

- (void)paymentHardwareStatusWithType:(unint64_t)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKInAppPaymentService_paymentHardwareStatusWithType_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v16 = a2;
  id v8 = v7;
  aBlock[4] = self;
  id v15 = v8;
  id v9 = _Block_copy(aBlock);
  uint64_t v10 = [(PKInAppPaymentService *)self _remoteObjectProxyWithFailureHandler:v9];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__PKInAppPaymentService_paymentHardwareStatusWithType_completion___block_invoke_39;
  v12[3] = &unk_1E56E2F88;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 paymentHardwareStatusWithType:a3 completion:v12];
}

uint64_t __66__PKInAppPaymentService_paymentHardwareStatusWithType_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    id v6 = v4;
    _os_log_error_impl(&dword_190E10000, v2, OS_LOG_TYPE_ERROR, "XPC Failure in -[PKInAppPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __66__PKInAppPaymentService_paymentHardwareStatusWithType_completion___block_invoke_39(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)hasValidSecurityConfigurationWithType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  uint64_t v7 = [(PKInAppPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__PKInAppPaymentService_hasValidSecurityConfigurationWithType_completion___block_invoke;
  v9[3] = &unk_1E56E2FD8;
  id v11 = v13;
  uint64_t v12 = v15;
  id v8 = v6;
  id v10 = v8;
  [v7 paymentHardwareStatusWithType:a3 completion:v9];

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v15, 8);
}

void __74__PKInAppPaymentService_hasValidSecurityConfigurationWithType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PKInAppPaymentService_hasValidSecurityConfigurationWithType_completion___block_invoke_2;
  block[3] = &unk_1E56E2FB0;
  uint64_t v4 = *(void *)(a1 + 48);
  id v9 = v3;
  uint64_t v11 = v4;
  long long v7 = *(_OWORD *)(a1 + 32);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __74__PKInAppPaymentService_hasValidSecurityConfigurationWithType_completion___block_invoke_2(void *a1)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  *(void *)(*(void *)(a1[7] + 8) + 24) = 0;
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], *(void *)(*(void *)(a1[7] + 8) + 24), *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24));
}

- (void)cardsAvailableForAMPWithCountryCode:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKInAppPaymentService_cardsAvailableForAMPWithCountryCode_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  long long v10 = _Block_copy(aBlock);
  uint64_t v11 = [(PKInAppPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__PKInAppPaymentService_cardsAvailableForAMPWithCountryCode_completion___block_invoke_40;
  void v13[3] = &unk_1E56DE070;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 cardsAvailableForAMPWithCountryCode:v9 completion:v13];
}

uint64_t __72__PKInAppPaymentService_cardsAvailableForAMPWithCountryCode_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    id v6 = v4;
    _os_log_error_impl(&dword_190E10000, v2, OS_LOG_TYPE_ERROR, "XPC Failure in -[PKInAppPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __72__PKInAppPaymentService_cardsAvailableForAMPWithCountryCode_completion___block_invoke_40(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (int64_t)cardsAvailableForAMPWithCountryCode:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  int v5 = [(PKInAppPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__PKInAppPaymentService_cardsAvailableForAMPWithCountryCode___block_invoke;
  v8[3] = &unk_1E56E3000;
  v8[4] = &v9;
  [v5 cardsAvailableForAMPWithCountryCode:v4 completion:v8];
  int64_t v6 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __61__PKInAppPaymentService_cardsAvailableForAMPWithCountryCode___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)cardDataForMerchantIdentifier:(id)a3 countryCode:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__PKInAppPaymentService_cardDataForMerchantIdentifier_countryCode_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v20 = a2;
  id v10 = v9;
  aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = _Block_copy(aBlock);
  id v14 = [(PKInAppPaymentService *)self _remoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__PKInAppPaymentService_cardDataForMerchantIdentifier_countryCode_completion___block_invoke_42;
  v16[3] = &unk_1E56E3028;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 cardDataForMerchantIdentifier:v12 countryCode:v11 completion:v16];
}

uint64_t __78__PKInAppPaymentService_cardDataForMerchantIdentifier_countryCode_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    int64_t v6 = v4;
    _os_log_error_impl(&dword_190E10000, v2, OS_LOG_TYPE_ERROR, "XPC Failure in -[PKInAppPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __78__PKInAppPaymentService_cardDataForMerchantIdentifier_countryCode_completion___block_invoke_42(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)enrollPaymentPassWithUniqueIdentifier:(id)a3 merchantSession:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__PKInAppPaymentService_enrollPaymentPassWithUniqueIdentifier_merchantSession_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v20 = a2;
  id v10 = v9;
  aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = _Block_copy(aBlock);
  id v14 = [(PKInAppPaymentService *)self _remoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__PKInAppPaymentService_enrollPaymentPassWithUniqueIdentifier_merchantSession_completion___block_invoke_44;
  v16[3] = &unk_1E56E3050;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 enrollPaymentPassWithUniqueIdentifier:v12 merchantSession:v11 completion:v16];
}

uint64_t __90__PKInAppPaymentService_enrollPaymentPassWithUniqueIdentifier_merchantSession_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    int64_t v6 = v4;
    _os_log_error_impl(&dword_190E10000, v2, OS_LOG_TYPE_ERROR, "XPC Failure in -[PKInAppPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __90__PKInAppPaymentService_enrollPaymentPassWithUniqueIdentifier_merchantSession_completion___block_invoke_44(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)validatePayLaterMerchandisingConfiguration:(id)a3 type:(unint64_t)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PKInAppPaymentService_validatePayLaterMerchandisingConfiguration_type_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v19 = a2;
  id v10 = v9;
  aBlock[4] = self;
  id v18 = v10;
  id v11 = a3;
  id v12 = _Block_copy(aBlock);
  id v13 = [(PKInAppPaymentService *)self _remoteObjectProxyWithFailureHandler:v12];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__PKInAppPaymentService_validatePayLaterMerchandisingConfiguration_type_completion___block_invoke_46;
  v15[3] = &unk_1E56E3078;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 validatePayLaterMerchandisingConfiguration:v11 type:a4 completion:v15];
}

uint64_t __84__PKInAppPaymentService_validatePayLaterMerchandisingConfiguration_type_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    int64_t v6 = v4;
    _os_log_error_impl(&dword_190E10000, v2, OS_LOG_TYPE_ERROR, "XPC Failure in -[PKInAppPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __84__PKInAppPaymentService_validatePayLaterMerchandisingConfiguration_type_completion___block_invoke_46(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void).cxx_destruct
{
}

@end