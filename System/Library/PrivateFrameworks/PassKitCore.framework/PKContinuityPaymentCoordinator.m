@interface PKContinuityPaymentCoordinator
- (BOOL)isAwaitingReply;
- (PKContinuityPaymentCoordinator)initWithContinuityPaymentService:(id)a3;
- (PKContinuityPaymentCoordinatorDelegate)delegate;
- (PKRemotePaymentRequest)currentRemotePaymentRequest;
- (double)updatePaymentDeviceTimeout;
- (void)_deviceUpdateTimerDidTimeout;
- (void)_deviceUpdateTotalTimerDidTimeout;
- (void)_queue_sendPaymentResult:(id)a3 completion:(id)a4;
- (void)_resetRequest;
- (void)_send_didReceiveCancellation;
- (void)_send_didReceivePayment:(id)a3;
- (void)_send_didReceiveUpdatedPaymentDevice:(id)a3;
- (void)_send_didTimeoutTotalUpdatePaymentDevices;
- (void)_send_didTimeoutUpdatePaymentDevices;
- (void)cancelRemotePaymentRequestWithCompletion:(id)a3;
- (void)dealloc;
- (void)didReceiveCancellationForRemotePaymentRequest:(id)a3;
- (void)didReceivePayment:(id)a3 forRemotePaymentRequest:(id)a4;
- (void)didReceiveUpdatedPaymentDevices:(id)a3;
- (void)sendPaymentClientUpdate:(id)a3 completion:(id)a4;
- (void)sendPaymentResult:(id)a3 completion:(id)a4;
- (void)sendRemotePaymentRequest:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setUpdatePaymentDeviceTimeout:(double)a3;
- (void)updatePaymentDevices;
@end

@implementation PKContinuityPaymentCoordinator

- (PKContinuityPaymentCoordinator)initWithContinuityPaymentService:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKContinuityPaymentCoordinator;
  v6 = [(PKContinuityPaymentCoordinator *)&v25 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_continuityPaymentService, a3);
    [(PKContinuityPaymentService *)v7->_continuityPaymentService setDelegate:v7];
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.PassKit.PKContinuityPaymentCoordinator.internal", 0);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.PassKit.PKContinuityPaymentCoordinator.callback", 0);
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v10;

    v12 = (const dispatch_source_type_s *)MEMORY[0x1E4F14490];
    dispatch_source_t v13 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v7->_internalQueue);
    deviceUpdateTimeoutTimer = v7->_deviceUpdateTimeoutTimer;
    v7->_deviceUpdateTimeoutTimer = (OS_dispatch_source *)v13;

    dispatch_source_t v15 = dispatch_source_create(v12, 0, 0, (dispatch_queue_t)v7->_internalQueue);
    deviceTotalUpdateTimeoutTimer = v7->_deviceTotalUpdateTimeoutTimer;
    v7->_deviceTotalUpdateTimeoutTimer = (OS_dispatch_source *)v15;

    v7->_updatePaymentDeviceTimeout = 10.0;
    objc_initWeak(&location, v7);
    v17 = v7->_deviceUpdateTimeoutTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __67__PKContinuityPaymentCoordinator_initWithContinuityPaymentService___block_invoke;
    handler[3] = &unk_1E56DD818;
    objc_copyWeak(&v23, &location);
    dispatch_source_set_event_handler(v17, handler);
    v18 = v7->_deviceTotalUpdateTimeoutTimer;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __67__PKContinuityPaymentCoordinator_initWithContinuityPaymentService___block_invoke_2;
    v20[3] = &unk_1E56DD818;
    objc_copyWeak(&v21, &location);
    dispatch_source_set_event_handler(v18, v20);
    dispatch_resume((dispatch_object_t)v7->_deviceUpdateTimeoutTimer);
    dispatch_resume((dispatch_object_t)v7->_deviceTotalUpdateTimeoutTimer);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __67__PKContinuityPaymentCoordinator_initWithContinuityPaymentService___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192FDC630]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _deviceUpdateTimerDidTimeout];
}

void __67__PKContinuityPaymentCoordinator_initWithContinuityPaymentService___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192FDC630]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _deviceUpdateTotalTimerDidTimeout];
}

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->_deviceUpdateTimeoutTimer);
  dispatch_source_cancel((dispatch_source_t)self->_deviceTotalUpdateTimeoutTimer);
  [(PKContinuityPaymentService *)self->_continuityPaymentService setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PKContinuityPaymentCoordinator;
  [(PKContinuityPaymentCoordinator *)&v3 dealloc];
}

- (PKContinuityPaymentCoordinatorDelegate)delegate
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__77;
  dispatch_queue_t v10 = __Block_byref_object_dispose__77;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__PKContinuityPaymentCoordinator_delegate__block_invoke;
  v5[3] = &unk_1E56DC5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PKContinuityPaymentCoordinatorDelegate *)v3;
}

void __42__PKContinuityPaymentCoordinator_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PKContinuityPaymentCoordinator_setDelegate___block_invoke;
  v7[3] = &unk_1E56D8A90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

id __46__PKContinuityPaymentCoordinator_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 80), *(id *)(a1 + 40));
}

- (double)updatePaymentDeviceTimeout
{
  uint64_t v6 = 0;
  v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__PKContinuityPaymentCoordinator_updatePaymentDeviceTimeout__block_invoke;
  v5[3] = &unk_1E56DC5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __60__PKContinuityPaymentCoordinator_updatePaymentDeviceTimeout__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 88);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setUpdatePaymentDeviceTimeout:(double)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__PKContinuityPaymentCoordinator_setUpdatePaymentDeviceTimeout___block_invoke;
  v4[3] = &unk_1E56DE608;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_sync(internalQueue, v4);
}

double __64__PKContinuityPaymentCoordinator_setUpdatePaymentDeviceTimeout___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 88) = result;
  return result;
}

- (PKRemotePaymentRequest)currentRemotePaymentRequest
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__77;
  dispatch_queue_t v10 = __Block_byref_object_dispose__77;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__PKContinuityPaymentCoordinator_currentRemotePaymentRequest__block_invoke;
  v5[3] = &unk_1E56DC5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PKRemotePaymentRequest *)v3;
}

void __61__PKContinuityPaymentCoordinator_currentRemotePaymentRequest__block_invoke(uint64_t a1)
{
}

- (BOOL)isAwaitingReply
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__PKContinuityPaymentCoordinator_isAwaitingReply__block_invoke;
  v5[3] = &unk_1E56DC5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__PKContinuityPaymentCoordinator_isAwaitingReply__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 64) != *(void *)(*(void *)(result + 32) + 72);
  return result;
}

- (void)updatePaymentDevices
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PKContinuityPaymentCoordinator_updatePaymentDevices__block_invoke;
  block[3] = &unk_1E56D8AE0;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __54__PKContinuityPaymentCoordinator_updatePaymentDevices__block_invoke(uint64_t result)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 48))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 48) = 1;
    double v3 = *(double *)(*(void *)(result + 32) + 88);
    id v4 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      double v10 = v3;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Updating remote payment devices with timeout: %g", (uint8_t *)&v9, 0xCu);
    }

    id v5 = *(NSObject **)(*(void *)(v2 + 32) + 32);
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    v7 = *(NSObject **)(*(void *)(v2 + 32) + 40);
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    return [*(id *)(*(void *)(v2 + 32) + 8) updatePaymentDevices];
  }
  return result;
}

- (void)sendRemotePaymentRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__77;
  v22[4] = __Block_byref_object_dispose__77;
  id v23 = 0;
  dispatch_group_t v8 = dispatch_group_create();
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PKContinuityPaymentCoordinator_sendRemotePaymentRequest_completion___block_invoke;
  block[3] = &unk_1E56F3A58;
  block[4] = self;
  id v10 = v6;
  id v18 = v10;
  uint64_t v11 = v8;
  v19 = v11;
  v20 = v22;
  id v21 = v24;
  dispatch_sync(internalQueue, block);
  if (v7)
  {
    callbackQueue = self->_callbackQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__PKContinuityPaymentCoordinator_sendRemotePaymentRequest_completion___block_invoke_20;
    v13[3] = &unk_1E56DF6D0;
    id v14 = v7;
    dispatch_source_t v15 = v24;
    v16 = v22;
    dispatch_group_notify(v11, callbackQueue, v13);
  }
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(v24, 8);
}

void __70__PKContinuityPaymentCoordinator_sendRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 56)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Request already sent"];
  }
  uint64_t v2 = [*(id *)(a1 + 40) identifier];
  double v3 = [*(id *)(a1 + 40) device];
  id v4 = [v3 deviceName];

  id v5 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 40) identifier];
    *(_DWORD *)buf = 138412546;
    id v21 = v4;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Sending remote payment request to '%@' with identifier: %@", buf, 0x16u);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
  ++*(void *)(*(void *)(a1 + 32) + 64);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
  uint64_t v7 = *(void *)(a1 + 32);
  dispatch_group_t v8 = *(void **)(a1 + 40);
  int v9 = *(void **)(v7 + 8);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__PKContinuityPaymentCoordinator_sendRemotePaymentRequest_completion___block_invoke_18;
  v15[3] = &unk_1E56F3A30;
  v15[4] = v7;
  id v16 = v2;
  id v10 = v8;
  uint64_t v11 = *(void *)(a1 + 64);
  id v17 = v10;
  uint64_t v19 = v11;
  long long v14 = *(_OWORD *)(a1 + 48);
  id v12 = (id)v14;
  long long v18 = v14;
  id v13 = v2;
  [v9 sendRemotePaymentRequest:v10 completion:v15];
}

void __70__PKContinuityPaymentCoordinator_sendRemotePaymentRequest_completion___block_invoke_18(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__PKContinuityPaymentCoordinator_sendRemotePaymentRequest_completion___block_invoke_2;
  v8[3] = &unk_1E56F3A08;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = *(id *)(a1 + 48);
  id v12 = v3;
  long long v13 = *(_OWORD *)(a1 + 64);
  id v7 = v3;
  dispatch_sync(v4, v8);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __70__PKContinuityPaymentCoordinator_sendRemotePaymentRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 56) identifier];
  int v4 = [v2 isEqualToString:v3];

  id v5 = PKLogFacilityTypeGetObject(8uLL);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      id v7 = [*(id *)(a1 + 48) identifier];
      uint64_t v8 = *(void *)(a1 + 56);
      int v11 = 138412546;
      id v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Received sendRemotePaymentRequest identifier %@ completion with error: %@", (uint8_t *)&v11, 0x16u);
    }
    if (*(void *)(a1 + 56))
    {
      [*(id *)(a1 + 40) _resetRequest];
    }
    else
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = 0;

      ++*(void *)(*(void *)(a1 + 40) + 72);
    }
  }
  else
  {
    if (v6)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Received sendRemotePaymentRequest completion, discarding", (uint8_t *)&v11, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
}

uint64_t __70__PKContinuityPaymentCoordinator_sendRemotePaymentRequest_completion___block_invoke_20(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)sendPaymentClientUpdate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__77;
  v22[4] = __Block_byref_object_dispose__77;
  id v23 = 0;
  dispatch_group_t v8 = dispatch_group_create();
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKContinuityPaymentCoordinator_sendPaymentClientUpdate_completion___block_invoke;
  block[3] = &unk_1E56F3A58;
  block[4] = self;
  uint64_t v10 = v8;
  long long v18 = v10;
  id v11 = v6;
  id v19 = v11;
  v20 = v22;
  id v21 = v24;
  dispatch_sync(internalQueue, block);
  if (v7)
  {
    callbackQueue = self->_callbackQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__PKContinuityPaymentCoordinator_sendPaymentClientUpdate_completion___block_invoke_22;
    v13[3] = &unk_1E56DF6D0;
    id v14 = v7;
    uint64_t v15 = v24;
    id v16 = v22;
    dispatch_group_notify(v10, callbackQueue, v13);
  }
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(v24, 8);
}

void __69__PKContinuityPaymentCoordinator_sendPaymentClientUpdate_completion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) device];
  id v3 = [v2 deviceName];

  int v4 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 56) identifier];
    *(_DWORD *)buf = 138412546;
    id v17 = v3;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Sending payment client update to '%@' with identifier: %@", buf, 0x16u);
  }
  ++*(void *)(*(void *)(a1 + 32) + 64);
  id v6 = [*(id *)(*(void *)(a1 + 32) + 56) identifier];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  uint64_t v7 = *(void *)(a1 + 32);
  dispatch_group_t v8 = *(void **)(v7 + 8);
  uint64_t v9 = *(void *)(v7 + 56);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__PKContinuityPaymentCoordinator_sendPaymentClientUpdate_completion___block_invoke_21;
  v12[3] = &unk_1E56F3A80;
  v12[4] = v7;
  id v13 = v6;
  long long v15 = *(_OWORD *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 48);
  id v14 = *(id *)(a1 + 40);
  id v11 = v6;
  [v8 sendPaymentClientUpdate:v10 forRemotePaymentRequest:v9 completion:v12];
}

void __69__PKContinuityPaymentCoordinator_sendPaymentClientUpdate_completion___block_invoke_21(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKContinuityPaymentCoordinator_sendPaymentClientUpdate_completion___block_invoke_2;
  block[3] = &unk_1E56F3A58;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = v3;
  long long v12 = *(_OWORD *)(a1 + 56);
  id v7 = v3;
  dispatch_sync(v4, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __69__PKContinuityPaymentCoordinator_sendPaymentClientUpdate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 56) identifier];
  int v4 = [v2 isEqualToString:v3];

  id v5 = PKLogFacilityTypeGetObject(8uLL);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 48);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Received sendPaymentClientUpdate complete with error: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 48));
    ++*(void *)(*(void *)(a1 + 40) + 72);
  }
  else
  {
    if (v6)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Received sendPaymentClientUpdate completion, discarding", (uint8_t *)&v8, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
}

uint64_t __69__PKContinuityPaymentCoordinator_sendPaymentClientUpdate_completion___block_invoke_22(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)sendPaymentResult:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKContinuityPaymentCoordinator_sendPaymentResult_completion___block_invoke;
  block[3] = &unk_1E56D89F0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(internalQueue, block);
}

uint64_t __63__PKContinuityPaymentCoordinator_sendPaymentResult_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_sendPaymentResult:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)cancelRemotePaymentRequestWithCompletion:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__PKContinuityPaymentCoordinator_cancelRemotePaymentRequestWithCompletion___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

void __75__PKContinuityPaymentCoordinator_cancelRemotePaymentRequestWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 56);
  id v3 = [v2 device];
  id v4 = [v3 deviceName];

  if (v2)
  {
    id v5 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v2 identifier];
      *(_DWORD *)buf = 138412546;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Sending cancel remote payment request to '%@' with identifier: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) _resetRequest];
    id v7 = *(void **)(*(void *)(a1 + 32) + 8);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __75__PKContinuityPaymentCoordinator_cancelRemotePaymentRequestWithCompletion___block_invoke_23;
    v9[3] = &unk_1E56F28E0;
    id v10 = v2;
    id v8 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = v8;
    [v7 cancelRemotePaymentRequest:v10 completion:v9];
  }
}

void __75__PKContinuityPaymentCoordinator_cancelRemotePaymentRequestWithCompletion___block_invoke_23(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) identifier];
    *(_DWORD *)buf = 138412546;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Canceled remote payment request with identifier: %@; error: %@",
      buf,
      0x16u);
  }
  id v6 = *(void **)(a1 + 48);
  if (v6)
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 40) + 24);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __75__PKContinuityPaymentCoordinator_cancelRemotePaymentRequestWithCompletion___block_invoke_24;
    v8[3] = &unk_1E56D83D8;
    id v10 = v6;
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __75__PKContinuityPaymentCoordinator_cancelRemotePaymentRequestWithCompletion___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)didReceiveUpdatedPaymentDevices:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PKContinuityPaymentCoordinator_didReceiveUpdatedPaymentDevices___block_invoke;
  v7[3] = &unk_1E56D8A90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

uint64_t __66__PKContinuityPaymentCoordinator_didReceiveUpdatedPaymentDevices___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 32), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  id v2 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 40) count];
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Received device update with %tu payment devices: %@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_send_didReceiveUpdatedPaymentDevice:", *(void *)(a1 + 40));
}

- (void)didReceivePayment:(id)a3 forRemotePaymentRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PKContinuityPaymentCoordinator_didReceivePayment_forRemotePaymentRequest___block_invoke;
  block[3] = &unk_1E56D8AB8;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(internalQueue, block);
}

void __76__PKContinuityPaymentCoordinator_didReceivePayment_forRemotePaymentRequest___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) identifier];
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  int v4 = [v2 isEqualToString:v3];

  if (!v4)
  {
    PKLogFacilityTypeGetObject(8uLL);
    uint64_t v11 = (PKPaymentAuthorizationResult *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [*(id *)(a1 + 40) identifier];
      int v14 = 138412290;
      uint64_t v15 = v12;
      _os_log_impl(&dword_190E10000, &v11->super, OS_LOG_TYPE_DEFAULT, "Received payment for unknown payment request with identifier: %@, discarding", (uint8_t *)&v14, 0xCu);
    }
    goto LABEL_11;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = *(void *)(v5 + 72);
  __int16 v8 = PKLogFacilityTypeGetObject(8uLL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6 != v7)
  {
    if (v9)
    {
      id v13 = [*(id *)(a1 + 40) identifier];
      int v14 = 138412290;
      uint64_t v15 = v13;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Received unexpected payment for request with identifier: %@, try again", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v11 = objc_alloc_init(PKPaymentAuthorizationResult);
    [(PKPaymentAuthorizationResult *)v11 setStatus:1000];
    objc_msgSend(*(id *)(a1 + 32), "_queue_sendPaymentResult:completion:", v11, 0);
LABEL_11:

    return;
  }
  if (v9)
  {
    id v10 = [*(id *)(a1 + 40) identifier];
    int v14 = 138412290;
    uint64_t v15 = v10;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Received payment for request with identifier: %@", (uint8_t *)&v14, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_send_didReceivePayment:", *(void *)(a1 + 48));
}

- (void)didReceiveCancellationForRemotePaymentRequest:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__PKContinuityPaymentCoordinator_didReceiveCancellationForRemotePaymentRequest___block_invoke;
  v7[3] = &unk_1E56D8A90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

void __80__PKContinuityPaymentCoordinator_didReceiveCancellationForRemotePaymentRequest___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) identifier];
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  int v4 = [v2 isEqualToString:v3];

  uint64_t v5 = PKLogFacilityTypeGetObject(8uLL);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 134349056;
      uint64_t v9 = v7;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "PKContinuityPaymentCoordinator (%{public}p): Received cancel for current payment request; will cancel",
        (uint8_t *)&v8,
        0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_send_didReceiveCancellation");
  }
  else
  {
    if (v6)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Received cancellation for unknown payment request, discarding", (uint8_t *)&v8, 2u);
    }
  }
}

- (void)_queue_sendPaymentResult:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  char v31 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__77;
  v28[4] = __Block_byref_object_dispose__77;
  id v29 = 0;
  int v8 = dispatch_group_create();
  uint64_t v9 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v6 status];
    uint64_t v11 = [(PKRemotePaymentRequest *)self->_currentRemotePaymentRequest device];
    id v12 = [v11 deviceName];
    id v13 = [(PKRemotePaymentRequest *)self->_currentRemotePaymentRequest identifier];
    *(_DWORD *)buf = 134218498;
    uint64_t v33 = v10;
    __int16 v34 = 2112;
    id v35 = v12;
    __int16 v36 = 2112;
    v37 = v13;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Sending payment status %ld to '%@' for request with identifier: %@", buf, 0x20u);
  }
  currentRemotePaymentRequest = self->_currentRemotePaymentRequest;
  ++self->_messageSendCount;
  uint64_t v15 = [(PKRemotePaymentRequest *)currentRemotePaymentRequest identifier];
  continuityPaymentService = self->_continuityPaymentService;
  uint64_t v17 = self->_currentRemotePaymentRequest;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __70__PKContinuityPaymentCoordinator__queue_sendPaymentResult_completion___block_invoke;
  void v24[3] = &unk_1E56F3AA8;
  v24[4] = self;
  id v18 = v15;
  id v25 = v18;
  v26 = v28;
  v27 = v30;
  [(PKContinuityPaymentService *)continuityPaymentService sendPaymentResult:v6 forRemotePaymentRequest:v17 completion:v24];
  if (v7)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__PKContinuityPaymentCoordinator__queue_sendPaymentResult_completion___block_invoke_26;
    block[3] = &unk_1E56DF6D0;
    id v21 = v7;
    __int16 v22 = v30;
    id v23 = v28;
    dispatch_group_notify(v8, callbackQueue, block);
  }
  _Block_object_dispose(v28, 8);

  _Block_object_dispose(v30, 8);
}

void __70__PKContinuityPaymentCoordinator__queue_sendPaymentResult_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PKContinuityPaymentCoordinator__queue_sendPaymentResult_completion___block_invoke_2;
  block[3] = &unk_1E56F3A58;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = v3;
  long long v12 = *(_OWORD *)(a1 + 48);
  id v7 = v3;
  dispatch_sync(v4, block);
}

void __70__PKContinuityPaymentCoordinator__queue_sendPaymentResult_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 56) identifier];
  int v4 = [v2 isEqualToString:v3];

  id v5 = PKLogFacilityTypeGetObject(8uLL);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 48);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Received sendPaymentStatus complete with error: %@", (uint8_t *)&v8, 0xCu);
    }

    ++*(void *)(*(void *)(a1 + 40) + 72);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 48));
  }
  else
  {
    if (v6)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Received sendPaymentStatus completion, discarding", (uint8_t *)&v8, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
}

uint64_t __70__PKContinuityPaymentCoordinator__queue_sendPaymentResult_completion___block_invoke_26(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)_resetRequest
{
  currentRemotePaymentRequest = self->_currentRemotePaymentRequest;
  self->_currentRemotePaymentRequest = 0;

  self->_messageSendCount = 0;
  self->_messageSendCompleteCount = 0;
}

- (void)_deviceUpdateTimerDidTimeout
{
  id v3 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Continuity payment service timed out", v4, 2u);
  }

  [(PKContinuityPaymentCoordinator *)self _send_didTimeoutUpdatePaymentDevices];
}

- (void)_deviceUpdateTotalTimerDidTimeout
{
  id v3 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Continuity payment service timed out - total", v4, 2u);
  }

  [(PKContinuityPaymentCoordinator *)self _send_didTimeoutTotalUpdatePaymentDevices];
}

- (void)_send_didTimeoutUpdatePaymentDevices
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  callbackQueue = self->_callbackQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__PKContinuityPaymentCoordinator__send_didTimeoutUpdatePaymentDevices__block_invoke;
  v6[3] = &unk_1E56D8A90;
  id v7 = WeakRetained;
  int v8 = self;
  id v5 = WeakRetained;
  dispatch_async(callbackQueue, v6);
}

uint64_t __70__PKContinuityPaymentCoordinator__send_didTimeoutUpdatePaymentDevices__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) continuityPaymentCoordinatorDidTimeoutUpdatePaymentDevices:*(void *)(a1 + 40)];
}

- (void)_send_didTimeoutTotalUpdatePaymentDevices
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  callbackQueue = self->_callbackQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__PKContinuityPaymentCoordinator__send_didTimeoutTotalUpdatePaymentDevices__block_invoke;
  v6[3] = &unk_1E56D8A90;
  id v7 = WeakRetained;
  int v8 = self;
  id v5 = WeakRetained;
  dispatch_async(callbackQueue, v6);
}

void __75__PKContinuityPaymentCoordinator__send_didTimeoutTotalUpdatePaymentDevices__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(v2 + 8) remoteDevices];
  [v1 continuityPaymentCoordinator:v2 didTimeoutTotalWithPaymentDevices:v3];
}

- (void)_send_didReceiveUpdatedPaymentDevice:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PKContinuityPaymentCoordinator__send_didReceiveUpdatedPaymentDevice___block_invoke;
  block[3] = &unk_1E56D8AB8;
  id v10 = WeakRetained;
  id v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = WeakRetained;
  dispatch_async(callbackQueue, block);
}

uint64_t __71__PKContinuityPaymentCoordinator__send_didReceiveUpdatedPaymentDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) continuityPaymentCoordinator:*(void *)(a1 + 40) didReceiveUpdatedPaymentDevices:*(void *)(a1 + 48)];
}

- (void)_send_didReceivePayment:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PKContinuityPaymentCoordinator__send_didReceivePayment___block_invoke;
  block[3] = &unk_1E56D8AB8;
  id v10 = WeakRetained;
  id v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = WeakRetained;
  dispatch_async(callbackQueue, block);
}

uint64_t __58__PKContinuityPaymentCoordinator__send_didReceivePayment___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) continuityPaymentCoordinator:*(void *)(a1 + 40) didReceivePayment:*(void *)(a1 + 48)];
}

- (void)_send_didReceiveCancellation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  callbackQueue = self->_callbackQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__PKContinuityPaymentCoordinator__send_didReceiveCancellation__block_invoke;
  v6[3] = &unk_1E56D8A90;
  id v7 = WeakRetained;
  id v8 = self;
  id v5 = WeakRetained;
  dispatch_async(callbackQueue, v6);
}

uint64_t __62__PKContinuityPaymentCoordinator__send_didReceiveCancellation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) continuityPaymentCoordinatorDidReceiveCancellation:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentRemotePaymentRequest, 0);
  objc_storeStrong((id *)&self->_deviceTotalUpdateTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_deviceUpdateTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_continuityPaymentService, 0);
}

@end