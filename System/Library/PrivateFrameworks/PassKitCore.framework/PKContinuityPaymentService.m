@interface PKContinuityPaymentService
+ (id)sharedService;
- (BOOL)canMakePaymentsWithRemoteDevices;
- (BOOL)hasRemoteDevices;
- (NSArray)remoteDevices;
- (PKContinuityPaymentService)init;
- (PKContinuityPaymentServiceDelegate)delegate;
- (id)_remoteObjectProxy;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (id)_remoteObjectProxyWithFailureHandler:(id)a3;
- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)cancelRemotePaymentRequest:(id)a3 completion:(id)a4;
- (void)didReceiveCancellationForRemotePaymentRequest:(id)a3;
- (void)didReceivePayment:(id)a3 forRemotePaymentRequest:(id)a4;
- (void)didReceivePaymentClientUpdate:(id)a3 forRemotePaymentRequest:(id)a4;
- (void)didReceivePaymentHostUpdate:(id)a3 forRemotePaymentRequest:(id)a4;
- (void)didReceivePaymentResult:(id)a3 forRemotePaymentRequest:(id)a4;
- (void)didReceiveUpdatedPaymentDevices:(id)a3;
- (void)presentContinuityPaymentInterfaceWithRequestIdentifier:(id)a3 completion:(id)a4;
- (void)promptDetailsForVirtualCard:(id)a3 showNotification:(BOOL)a4 completion:(id)a5;
- (void)requestInstrumentThumbnail:(id)a3 forRemoteDevice:(id)a4 size:(CGSize)a5 completion:(id)a6;
- (void)sendPayment:(id)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5;
- (void)sendPaymentClientUpdate:(id)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5;
- (void)sendPaymentHostUpdate:(id)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5;
- (void)sendPaymentResult:(id)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5;
- (void)sendPaymentSetupRequest:(id)a3 appDisplayName:(id)a4 completion:(id)a5;
- (void)sendPaymentStatus:(int64_t)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5;
- (void)sendRemotePaymentRequest:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setRemoteDevices:(id)a3;
- (void)updatePaymentDevices;
@end

@implementation PKContinuityPaymentService

+ (id)sharedService
{
  if (qword_1EB402EE0 != -1) {
    dispatch_once(&qword_1EB402EE0, &__block_literal_global_119);
  }
  v2 = (void *)_MergedGlobals_237;
  return v2;
}

void __43__PKContinuityPaymentService_sharedService__block_invoke()
{
  v0 = objc_alloc_init(PKContinuityPaymentService);
  v1 = (void *)_MergedGlobals_237;
  _MergedGlobals_237 = (uint64_t)v0;
}

- (PKContinuityPaymentService)init
{
  v11.receiver = self;
  v11.super_class = (Class)PKContinuityPaymentService;
  v2 = [(PKContinuityPaymentService *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.passd.paymentcontinuityservice.delegate", 0);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v3;

    v2->_remoteDeviceLock._os_unfair_lock_opaque = 0;
    v5 = [PKXPCService alloc];
    v6 = PDContinuityPaymentServiceInterface();
    v7 = PKContinuityPaymentServiceInterface();
    uint64_t v8 = [(PKXPCService *)v5 initWithMachServiceName:@"com.apple.passd.payment-continuity" remoteObjectInterface:v6 exportedObjectInterface:v7 exportedObject:v2];
    remoteService = v2->_remoteService;
    v2->_remoteService = (PKXPCService *)v8;
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

- (void)updatePaymentDevices
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50__PKContinuityPaymentService_updatePaymentDevices__block_invoke;
  v2[3] = &unk_1E56DE608;
  v2[4] = self;
  v2[5] = a2;
  _os_activity_initiate(&dword_190E10000, "refresh remote payment devices", OS_ACTIVITY_FLAG_DEFAULT, v2);
}

void __50__PKContinuityPaymentService_updatePaymentDevices__block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__PKContinuityPaymentService_updatePaymentDevices__block_invoke_2;
  aBlock[3] = &unk_1E56DE608;
  long long v6 = *(_OWORD *)(a1 + 32);
  v2 = _Block_copy(aBlock);
  dispatch_queue_t v3 = [*(id *)(a1 + 32) _remoteObjectProxyWithFailureHandler:v2];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__PKContinuityPaymentService_updatePaymentDevices__block_invoke_13;
  v4[3] = &unk_1E56DB8E8;
  v4[4] = *(void *)(a1 + 32);
  [v3 updatePaymentDevicesWithHandler:v4];
}

void __50__PKContinuityPaymentService_updatePaymentDevices__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKContinuityService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

void __50__PKContinuityPaymentService_updatePaymentDevices__block_invoke_13(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    dispatch_queue_t v3 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Failed to discover remote payment devices", v4, 2u);
    }
  }
}

- (void)sendRemotePaymentRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__PKContinuityPaymentService_sendRemotePaymentRequest_completion___block_invoke;
  v11[3] = &unk_1E56D8A40;
  v11[4] = self;
  id v12 = v7;
  id v13 = v8;
  SEL v14 = a2;
  id v9 = v8;
  id v10 = v7;
  _os_activity_initiate(&dword_190E10000, "send remote payment request", OS_ACTIVITY_FLAG_DEFAULT, v11);
}

void __66__PKContinuityPaymentService_sendRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKContinuityPaymentService_sendRemotePaymentRequest_completion___block_invoke_2;
  aBlock[3] = &unk_1E56DE608;
  uint64_t v2 = *(void *)(a1 + 56);
  void aBlock[4] = *(void *)(a1 + 32);
  aBlock[5] = v2;
  dispatch_queue_t v3 = _Block_copy(aBlock);
  int v4 = [*(id *)(a1 + 32) _remoteObjectProxyWithFailureHandler:v3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PKContinuityPaymentService_sendRemotePaymentRequest_completion___block_invoke_15;
  v7[3] = &unk_1E56D8770;
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  [v4 sendRemotePaymentRequest:v5 handler:v7];
}

void __66__PKContinuityPaymentService_sendRemotePaymentRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKContinuityService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

void __66__PKContinuityPaymentService_sendRemotePaymentRequest_completion___block_invoke_15(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Failed to send payment request", v6, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)sendPaymentHostUpdate:(id)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __87__PKContinuityPaymentService_sendPaymentHostUpdate_forRemotePaymentRequest_completion___block_invoke;
  activity_block[3] = &unk_1E56E43A8;
  id v18 = v11;
  SEL v19 = a2;
  activity_block[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  _os_activity_initiate(&dword_190E10000, "send remote payment request update", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __87__PKContinuityPaymentService_sendPaymentHostUpdate_forRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PKContinuityPaymentService_sendPaymentHostUpdate_forRemotePaymentRequest_completion___block_invoke_2;
  aBlock[3] = &unk_1E56DE608;
  uint64_t v2 = *(void *)(a1 + 64);
  void aBlock[4] = *(void *)(a1 + 32);
  aBlock[5] = v2;
  id v3 = _Block_copy(aBlock);
  int v4 = [*(id *)(a1 + 32) _remoteObjectProxyWithFailureHandler:v3];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__PKContinuityPaymentService_sendPaymentHostUpdate_forRemotePaymentRequest_completion___block_invoke_16;
  v8[3] = &unk_1E56D8770;
  id v7 = *(id *)(a1 + 56);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  [v4 sendPaymentHostUpdate:v5 forRemotePaymentRequest:v6 handler:v8];
}

void __87__PKContinuityPaymentService_sendPaymentHostUpdate_forRemotePaymentRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKContinuityService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

void __87__PKContinuityPaymentService_sendPaymentHostUpdate_forRemotePaymentRequest_completion___block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Failed to send update payment request", v6, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)sendPaymentClientUpdate:(id)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __89__PKContinuityPaymentService_sendPaymentClientUpdate_forRemotePaymentRequest_completion___block_invoke;
  activity_block[3] = &unk_1E56E43A8;
  id v18 = v11;
  SEL v19 = a2;
  activity_block[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  _os_activity_initiate(&dword_190E10000, "send remote payment request update response", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __89__PKContinuityPaymentService_sendPaymentClientUpdate_forRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKContinuityPaymentService_sendPaymentClientUpdate_forRemotePaymentRequest_completion___block_invoke_2;
  aBlock[3] = &unk_1E56DE608;
  uint64_t v2 = *(void *)(a1 + 64);
  void aBlock[4] = *(void *)(a1 + 32);
  aBlock[5] = v2;
  id v3 = _Block_copy(aBlock);
  int v4 = [*(id *)(a1 + 32) _remoteObjectProxyWithFailureHandler:v3];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__PKContinuityPaymentService_sendPaymentClientUpdate_forRemotePaymentRequest_completion___block_invoke_17;
  v8[3] = &unk_1E56D8770;
  id v7 = *(id *)(a1 + 56);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  [v4 sendPaymentClientUpdate:v5 forRemotePaymentRequest:v6 handler:v8];
}

void __89__PKContinuityPaymentService_sendPaymentClientUpdate_forRemotePaymentRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKContinuityService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

uint64_t __89__PKContinuityPaymentService_sendPaymentClientUpdate_forRemotePaymentRequest_completion___block_invoke_17(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)sendPayment:(id)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __77__PKContinuityPaymentService_sendPayment_forRemotePaymentRequest_completion___block_invoke;
  activity_block[3] = &unk_1E56E43A8;
  id v18 = v11;
  SEL v19 = a2;
  activity_block[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  _os_activity_initiate(&dword_190E10000, "send remote payment", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __77__PKContinuityPaymentService_sendPayment_forRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PKContinuityPaymentService_sendPayment_forRemotePaymentRequest_completion___block_invoke_2;
  aBlock[3] = &unk_1E56DE608;
  uint64_t v2 = *(void *)(a1 + 64);
  void aBlock[4] = *(void *)(a1 + 32);
  aBlock[5] = v2;
  id v3 = _Block_copy(aBlock);
  int v4 = [*(id *)(a1 + 32) _remoteObjectProxyWithFailureHandler:v3];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__PKContinuityPaymentService_sendPayment_forRemotePaymentRequest_completion___block_invoke_18;
  v8[3] = &unk_1E56D8770;
  id v7 = *(id *)(a1 + 56);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  [v4 sendPayment:v5 forRemotePaymentRequest:v6 handler:v8];
}

void __77__PKContinuityPaymentService_sendPayment_forRemotePaymentRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKContinuityService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

void __77__PKContinuityPaymentService_sendPayment_forRemotePaymentRequest_completion___block_invoke_18(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Failed to send payment", v6, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)sendPaymentResult:(id)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __83__PKContinuityPaymentService_sendPaymentResult_forRemotePaymentRequest_completion___block_invoke;
  activity_block[3] = &unk_1E56E43A8;
  id v18 = v11;
  SEL v19 = a2;
  activity_block[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  _os_activity_initiate(&dword_190E10000, "send payment result", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __83__PKContinuityPaymentService_sendPaymentResult_forRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKContinuityPaymentService_sendPaymentResult_forRemotePaymentRequest_completion___block_invoke_2;
  aBlock[3] = &unk_1E56DE608;
  uint64_t v2 = *(void *)(a1 + 64);
  void aBlock[4] = *(void *)(a1 + 32);
  aBlock[5] = v2;
  id v3 = _Block_copy(aBlock);
  int v4 = [*(id *)(a1 + 32) _remoteObjectProxyWithFailureHandler:v3];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__PKContinuityPaymentService_sendPaymentResult_forRemotePaymentRequest_completion___block_invoke_19;
  v8[3] = &unk_1E56D8770;
  id v7 = *(id *)(a1 + 56);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  [v4 sendPaymentResult:v5 forRemotePaymentRequest:v6 handler:v8];
}

void __83__PKContinuityPaymentService_sendPaymentResult_forRemotePaymentRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKContinuityService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

uint64_t __83__PKContinuityPaymentService_sendPaymentResult_forRemotePaymentRequest_completion___block_invoke_19(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)sendPaymentStatus:(int64_t)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_alloc_init(PKPaymentAuthorizationResult);
  [(PKPaymentAuthorizationResult *)v10 setStatus:a3];
  [(PKContinuityPaymentService *)self sendPaymentResult:v10 forRemotePaymentRequest:v9 completion:v8];
}

- (void)requestInstrumentThumbnail:(id)a3 forRemoteDevice:(id)a4 size:(CGSize)a5 completion:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  id v12 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKContinuityPaymentService_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke;
  aBlock[3] = &unk_1E56DE608;
  void aBlock[4] = self;
  aBlock[5] = a2;
  id v13 = a4;
  id v14 = a3;
  v15 = _Block_copy(aBlock);
  id v16 = [(PKContinuityPaymentService *)self _remoteObjectProxyWithFailureHandler:v15];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __89__PKContinuityPaymentService_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_21;
  v18[3] = &unk_1E56DE7B8;
  v18[4] = self;
  id v19 = v12;
  id v17 = v12;
  objc_msgSend(v16, "requestInstrumentThumbnail:forRemoteDevice:size:handler:", v14, v13, v18, width, height);
}

void __89__PKContinuityPaymentService_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKContinuityService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

void __89__PKContinuityPaymentService_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    CGImageRef v6 = PKCreateCGImage(v9);
    if (v6)
    {
      CGImageRef v7 = v6;
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      CFRelease(v7);
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (void)presentContinuityPaymentInterfaceWithRequestIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96__PKContinuityPaymentService_presentContinuityPaymentInterfaceWithRequestIdentifier_completion___block_invoke;
  v11[3] = &unk_1E56D8A40;
  v11[4] = self;
  id v12 = v7;
  id v13 = v8;
  SEL v14 = a2;
  id v9 = v8;
  id v10 = v7;
  _os_activity_initiate(&dword_190E10000, "present remote payment interface", OS_ACTIVITY_FLAG_DEFAULT, v11);
}

void __96__PKContinuityPaymentService_presentContinuityPaymentInterfaceWithRequestIdentifier_completion___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PKContinuityPaymentService_presentContinuityPaymentInterfaceWithRequestIdentifier_completion___block_invoke_2;
  aBlock[3] = &unk_1E56DE608;
  uint64_t v2 = *(void *)(a1 + 56);
  void aBlock[4] = *(void *)(a1 + 32);
  aBlock[5] = v2;
  id v3 = _Block_copy(aBlock);
  int v4 = [*(id *)(a1 + 32) _remoteObjectProxyWithFailureHandler:v3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __96__PKContinuityPaymentService_presentContinuityPaymentInterfaceWithRequestIdentifier_completion___block_invoke_24;
  v7[3] = &unk_1E56D8770;
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  [v4 presentContinuityPaymentInterfaceWithRequestIdentifier:v5 handler:v7];
}

void __96__PKContinuityPaymentService_presentContinuityPaymentInterfaceWithRequestIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKContinuityService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

void __96__PKContinuityPaymentService_presentContinuityPaymentInterfaceWithRequestIdentifier_completion___block_invoke_24(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Failed to present interface", v6, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)cancelRemotePaymentRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__PKContinuityPaymentService_cancelRemotePaymentRequest_completion___block_invoke;
  v11[3] = &unk_1E56D8A40;
  v11[4] = self;
  id v12 = v7;
  id v13 = v8;
  SEL v14 = a2;
  id v9 = v8;
  id v10 = v7;
  _os_activity_initiate(&dword_190E10000, "cancel remote payment request", OS_ACTIVITY_FLAG_DEFAULT, v11);
}

void __68__PKContinuityPaymentService_cancelRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKContinuityPaymentService_cancelRemotePaymentRequest_completion___block_invoke_2;
  aBlock[3] = &unk_1E56DE608;
  uint64_t v2 = *(void *)(a1 + 56);
  void aBlock[4] = *(void *)(a1 + 32);
  aBlock[5] = v2;
  id v3 = _Block_copy(aBlock);
  int v4 = [*(id *)(a1 + 32) _remoteObjectProxyWithFailureHandler:v3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__PKContinuityPaymentService_cancelRemotePaymentRequest_completion___block_invoke_25;
  v7[3] = &unk_1E56D8770;
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  [v4 cancelRemotePaymentRequest:v5 handler:v7];
}

void __68__PKContinuityPaymentService_cancelRemotePaymentRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKContinuityService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

void __68__PKContinuityPaymentService_cancelRemotePaymentRequest_completion___block_invoke_25(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Failed to cancel request", v6, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (BOOL)hasRemoteDevices
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(PKContinuityPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PKContinuityPaymentService_hasRemoteDevices__block_invoke;
  v5[3] = &unk_1E56E9838;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 hasRemoteDevicesWithHandler:v5];
  LOBYTE(v2) = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __46__PKContinuityPaymentService_hasRemoteDevices__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Failed to retrieve registered host device status", v7, 2u);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)canMakePaymentsWithRemoteDevices
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v2 = [(PKContinuityPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__PKContinuityPaymentService_canMakePaymentsWithRemoteDevices__block_invoke;
  v5[3] = &unk_1E56E9860;
  v5[4] = &v6;
  [v2 canMakePaymentsWithRemoteDevicesWithHandler:v5];
  char v3 = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

void __62__PKContinuityPaymentService_canMakePaymentsWithRemoteDevices__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Failed to retrieve registered host device status: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (NSArray)remoteDevices
{
  p_remoteDeviceLock = &self->_remoteDeviceLock;
  os_unfair_lock_lock(&self->_remoteDeviceLock);
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__38;
  id v13 = __Block_byref_object_dispose__38;
  id v14 = (id)[(NSArray *)self->_remoteDevices copy];
  os_unfair_lock_unlock(p_remoteDeviceLock);
  int v4 = (void *)v10[5];
  if (!v4)
  {
    id v5 = [(PKContinuityPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__PKContinuityPaymentService_remoteDevices__block_invoke;
    v8[3] = &unk_1E56E9888;
    v8[4] = self;
    void v8[5] = &v9;
    [v5 fetchRemoteDevicesWithHandler:v8];
    [(PKContinuityPaymentService *)self setRemoteDevices:v10[5]];

    int v4 = (void *)v10[5];
  }
  id v6 = v4;
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v6;
}

void __43__PKContinuityPaymentService_remoteDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Failed to retrieve remote devices", v10, 2u);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

- (void)setRemoteDevices:(id)a3
{
  p_remoteDeviceLock = &self->_remoteDeviceLock;
  id v5 = a3;
  os_unfair_lock_lock(p_remoteDeviceLock);
  id v6 = (NSArray *)[v5 copy];

  remoteDevices = self->_remoteDevices;
  self->_remoteDevices = v6;

  os_unfair_lock_unlock(p_remoteDeviceLock);
}

- (void)sendPaymentSetupRequest:(id)a3 appDisplayName:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PKContinuityPaymentService_sendPaymentSetupRequest_appDisplayName_completion___block_invoke;
  aBlock[3] = &unk_1E56DE608;
  void aBlock[4] = self;
  aBlock[5] = a2;
  id v10 = a4;
  id v11 = a3;
  id v12 = _Block_copy(aBlock);
  id v13 = [(PKContinuityPaymentService *)self _remoteObjectProxyWithFailureHandler:v12];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__PKContinuityPaymentService_sendPaymentSetupRequest_appDisplayName_completion___block_invoke_28;
  v15[3] = &unk_1E56D8770;
  v15[4] = self;
  id v16 = v9;
  id v14 = v9;
  [v13 sendPaymentSetupRequest:v11 appDisplayName:v10 handler:v15];
}

void __80__PKContinuityPaymentService_sendPaymentSetupRequest_appDisplayName_completion___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    char v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKContinuityService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

void __80__PKContinuityPaymentService_sendPaymentSetupRequest_appDisplayName_completion___block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 description];
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Failed to send payment setup request: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

- (void)promptDetailsForVirtualCard:(id)a3 showNotification:(BOOL)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __86__PKContinuityPaymentService_promptDetailsForVirtualCard_showNotification_completion___block_invoke;
  activity_block[3] = &unk_1E56DE970;
  activity_block[4] = self;
  id v14 = v9;
  BOOL v17 = a4;
  id v15 = v10;
  SEL v16 = a2;
  id v11 = v10;
  id v12 = v9;
  _os_activity_initiate(&dword_190E10000, "prompt details for virtual card", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __86__PKContinuityPaymentService_promptDetailsForVirtualCard_showNotification_completion___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__PKContinuityPaymentService_promptDetailsForVirtualCard_showNotification_completion___block_invoke_2;
  aBlock[3] = &unk_1E56DE608;
  uint64_t v2 = *(void *)(a1 + 56);
  void aBlock[4] = *(void *)(a1 + 32);
  aBlock[5] = v2;
  id v3 = _Block_copy(aBlock);
  int v4 = [*(id *)(a1 + 32) _remoteObjectProxyWithFailureHandler:v3];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 64);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__PKContinuityPaymentService_promptDetailsForVirtualCard_showNotification_completion___block_invoke_29;
  v8[3] = &unk_1E56D8770;
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  [v4 promptDetailsForVirtualCard:v6 showNotification:v5 handler:v8];
}

void __86__PKContinuityPaymentService_promptDetailsForVirtualCard_showNotification_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKContinuityService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

void __86__PKContinuityPaymentService_promptDetailsForVirtualCard_showNotification_completion___block_invoke_29(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [v3 description];
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Failed to prompt details for virtual card: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

- (void)didReceiveUpdatedPaymentDevices:(id)a3
{
  id v7 = a3;
  -[PKContinuityPaymentService setRemoteDevices:](self, "setRemoteDevices:");
  int v4 = [(PKContinuityPaymentService *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(PKContinuityPaymentService *)self delegate];
    [v6 didReceiveUpdatedPaymentDevices:v7];
  }
}

- (void)didReceivePaymentHostUpdate:(id)a3 forRemotePaymentRequest:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(PKContinuityPaymentService *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(PKContinuityPaymentService *)self delegate];
    [v9 didReceivePaymentHostUpdate:v10 forRemotePaymentRequest:v6];
  }
}

- (void)didReceivePaymentClientUpdate:(id)a3 forRemotePaymentRequest:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(PKContinuityPaymentService *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(PKContinuityPaymentService *)self delegate];
    [v9 didReceivePaymentClientUpdate:v10 forRemotePaymentRequest:v6];
  }
}

- (void)didReceivePayment:(id)a3 forRemotePaymentRequest:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(PKContinuityPaymentService *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(PKContinuityPaymentService *)self delegate];
    [v9 didReceivePayment:v10 forRemotePaymentRequest:v6];
  }
}

- (void)didReceivePaymentResult:(id)a3 forRemotePaymentRequest:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(PKContinuityPaymentService *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(PKContinuityPaymentService *)self delegate];
    [v9 didReceivePaymentResult:v10 forRemotePaymentRequest:v6];
  }
}

- (void)didReceiveCancellationForRemotePaymentRequest:(id)a3
{
  id v7 = a3;
  int v4 = [(PKContinuityPaymentService *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(PKContinuityPaymentService *)self delegate];
    [v6 didReceiveCancellationForRemotePaymentRequest:v7];
  }
}

- (PKContinuityPaymentServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKContinuityPaymentServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteDevices, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_remoteService, 0);
}

@end