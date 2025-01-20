@interface PKSecureElementConsistencyChecker
+ (BOOL)isCheckingConsistencyForSecureElementID:(id)a3;
- (PKPaymentWebService)paymentWebService;
- (PKSecureElementConsistencyChecker)initWithPaymentWebService:(id)a3 delegate:(id)a4;
- (PKSecureElementConsistencyChecker)initWithPaymentWebService:(id)a3 delegate:(id)a4 cloudStoreCoordinatorDelegate:(id)a5;
- (PKSecureElementConsistencyCheckerDelegate)delegate;
- (void)_downloadPassesWithCompletion:(id)a3;
- (void)_rescheduleCheckInTimeInterval:(double)a3 backoffLevel:(int64_t)a4;
- (void)_rescheduleWithBackoff;
- (void)_syncWithTSMCompletion:(id)a3;
- (void)invalidate;
- (void)queue_startWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPaymentWebService:(id)a3;
- (void)startWithCompletion:(id)a3;
@end

@implementation PKSecureElementConsistencyChecker

+ (BOOL)isCheckingConsistencyForSecureElementID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_275);
    v4 = [(id)qword_1EB403458 objectForKeyedSubscript:v3];
    uint64_t v5 = [v4 unsignedIntegerValue];

    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_275);
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (PKSecureElementConsistencyChecker)initWithPaymentWebService:(id)a3 delegate:(id)a4 cloudStoreCoordinatorDelegate:(id)a5
{
  id v9 = a3;
  v10 = (PKSecureElementConsistencyCheckerDelegate *)a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKSecureElementConsistencyChecker;
  v12 = [(PKSecureElementConsistencyChecker *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_paymentWebService, a3);
    v13->_delegate = v10;
    objc_storeStrong((id *)&v13->_cloudStoreCoordinatorDelegate, a5);
    dispatch_queue_t v14 = dispatch_queue_create("consistency checker", 0);
    processingQueue = v13->_processingQueue;
    v13->_processingQueue = (OS_dispatch_queue *)v14;
  }
  return v13;
}

- (void)invalidate
{
  id v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: invalidating", v4, 2u);
  }

  atomic_store(1u, (unsigned __int8 *)&self->_invalidated);
}

- (void)startWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)&self->_didStart);
  if (v6)
  {
    if (v4) {
      (*((void (**)(id))v4 + 2))(v4);
    }
  }
  else
  {
    atomic_store(1u, (unsigned __int8 *)&self->_didStart);
    v7 = [(PKPaymentWebService *)self->_paymentWebService context];
    v8 = [v7 secureElementID];

    if (v8)
    {
      id v9 = v8;
      os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_275);
      v10 = (void *)qword_1EB403458;
      if (!qword_1EB403458)
      {
        uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
        v12 = (void *)qword_1EB403458;
        qword_1EB403458 = v11;

        v10 = (void *)qword_1EB403458;
      }
      v13 = NSNumber;
      dispatch_queue_t v14 = [v10 objectForKeyedSubscript:v9];
      v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "unsignedIntegerValue") + 1);
      [(id)qword_1EB403458 setObject:v15 forKeyedSubscript:v9];

      v16 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Beginning consistency check...", buf, 2u);
      }

      os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_275);
    }
    processingQueue = self->_processingQueue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __57__PKSecureElementConsistencyChecker_startWithCompletion___block_invoke;
    v20[3] = &unk_1E56DEAA8;
    v20[4] = self;
    id v21 = v8;
    id v22 = v5;
    v18 = v20;
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __dispatch_async_ar_block_invoke_18;
    v26 = &unk_1E56D8360;
    id v27 = v18;
    id v19 = v8;
    dispatch_async(processingQueue, buf);
  }
}

void __57__PKSecureElementConsistencyChecker_startWithCompletion___block_invoke(uint64_t a1)
{
  if ((PKStoreDemoModeEnabled() & 1) != 0 || PKUIOnlyDemoModeEnabled())
  {
    BOOL v2 = 0;
  }
  else
  {
    unsigned __int8 v3 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 25));
    BOOL v2 = (v3 & 1) == 0;
  }
  if (objc_opt_respondsToSelector())
  {
    if (!v2 || ([*(id *)(*(void *)(a1 + 32) + 32) shouldStartConsistencyCheck] & 1) == 0) {
      goto LABEL_8;
    }
LABEL_14:
    unsigned __int8 v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__PKSecureElementConsistencyChecker_startWithCompletion___block_invoke_2;
    v7[3] = &unk_1E56D83D8;
    id v9 = *(id *)(a1 + 48);
    id v8 = *(id *)(a1 + 40);
    objc_msgSend(v6, "queue_startWithCompletion:", v7);

    return;
  }
  if (v2) {
    goto LABEL_14;
  }
LABEL_8:
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  uint64_t v5 = *(void **)(a1 + 40);
  EndTrackingConsistencyCheck(v5);
}

void __57__PKSecureElementConsistencyChecker_startWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  unsigned __int8 v3 = *(void **)(a1 + 32);
  EndTrackingConsistencyCheck(v3);
}

- (void)queue_startWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Getting device state for consistency check...", buf, 2u);
  }

  unsigned __int8 v6 = [(PKPaymentWebService *)self->_paymentWebService context];
  v7 = [v6 regions];
  id v8 = [v7 allKeys];

  delegate = self->_delegate;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke;
  v12[3] = &unk_1E56F2080;
  v12[4] = self;
  id v10 = v4;
  id v14 = v10;
  id v11 = v8;
  id v13 = v11;
  [(PKSecureElementConsistencyCheckerDelegate *)delegate deviceStateWithCompletion:v12];
  if ([(PKPaymentWebService *)self->_paymentWebService needsConfiguration])
  {
    [(PKPaymentWebService *)self->_paymentWebService configurePaymentServiceWithCompletion:&__block_literal_global_191];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: web service configuration does not need updating", buf, 2u);
    }
  }
}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_2;
  v7[3] = &unk_1E56F2058;
  void v7[4] = v4;
  id v10 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_2(id *a1)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)a1[4] + 25);
  if (v2)
  {
    id v14 = (void (*)(void))*((void *)a1[7] + 2);
    v14();
  }
  else
  {
    id v3 = a1[5];
    uint64_t v4 = PKLogFacilityTypeGetObject(6uLL);
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Got device state, beginning consistency check.", buf, 2u);
      }

      id v6 = CheckConsistencyWithDeviceState(a1[5], a1[6]);
      uint64_t v7 = [v6 cleanupActions];
      id v8 = [v6 requestedActions];
      uint64_t v24 = @"success";
      id v9 = [NSNumber numberWithBool:v7 == 0];
      v25[0] = v9;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
      AnalyticsSendEvent();

      if (v7)
      {
        char v11 = [v6 cleanupActions];
        v12 = objc_alloc_init(PKAsyncUnaryOperationComposer);
        if ([v8 count] && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_144;
          v21[3] = &unk_1E56F2008;
          v21[4] = a1[4];
          id v22 = v8;
          [(PKAsyncUnaryOperationComposer *)v12 addOperation:v21];
        }
        if (v11)
        {
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_3;
          v20[3] = &unk_1E56F2030;
          v20[4] = a1[4];
          [(PKAsyncUnaryOperationComposer *)v12 addOperation:v20];
        }
        if ((v11 & 2) != 0)
        {
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_5;
          v19[3] = &unk_1E56F2030;
          v19[4] = a1[4];
          [(PKAsyncUnaryOperationComposer *)v12 addOperation:v19];
        }
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_149;
        v18[3] = &unk_1E56F2030;
        v18[4] = a1[4];
        [(PKAsyncUnaryOperationComposer *)v12 addOperation:v18];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_3_151;
        v15[3] = &unk_1E56F20A8;
        v15[4] = a1[4];
        id v17 = a1[7];
        id v16 = a1[6];
        id v13 = [(PKAsyncUnaryOperationComposer *)v12 evaluateWithInput:MEMORY[0x1E4F1CC38] completion:v15];
      }
      else
      {
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Passbook and SE are consistent!", buf, 2u);
        }

        [a1[4] _rescheduleCheckInTimeInterval:0 backoffLevel:86400.0];
        (*((void (**)(void))a1[7] + 2))();
      }
    }
    else
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: failed to get device state. Aborting.", buf, 2u);
      }

      [a1[4] _rescheduleWithBackoff];
      (*((void (**)(void))a1[7] + 2))();
    }
  }
}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_144(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = v5;
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 25));
  if (v7)
  {
    (*((void (**)(id, void, uint64_t))v5 + 2))(v5, MEMORY[0x1E4F1CC28], 1);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = *(void **)(v8 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_2_145;
    v11[3] = &unk_1E56D8ED8;
    id v12 = v5;
    [v10 handleRequestedActions:v9 completion:v11];
  }
}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_2_145(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [NSNumber numberWithBool:a2];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, 0);
}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  unsigned __int8 v9 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 25));
  if (v9)
  {
    (*((void (**)(id, void, uint64_t))v7 + 2))(v7, MEMORY[0x1E4F1CC28], 1);
  }
  else
  {
    id v10 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_4;
    v11[3] = &unk_1E56D8798;
    id v13 = v7;
    id v12 = v6;
    [v10 _syncWithTSMCompletion:v11];
  }
}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "BOOLValue") & a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, 0);
}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  unsigned __int8 v11 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 25));
  if (v11)
  {
    (*((void (**)(id, void, uint64_t))v9 + 2))(v9, MEMORY[0x1E4F1CC28], 1);
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Downloading passes…", buf, 2u);
    }

    id v13 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_148;
    v14[3] = &unk_1E56D8798;
    id v16 = v10;
    id v15 = v8;
    [v13 _downloadPassesWithCompletion:v14];
  }
}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_148(uint64_t a1, int a2)
{
  uint64_t v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Done downloading passes.", v7, 2u);
  }

  AnalyticsSendEvent();
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "BOOLValue") & a2);
  (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, 0);
}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_149(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_2_150;
  v11[3] = &unk_1E56D83D8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, v11);
}

uint64_t __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_2_150(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_3_151(id *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  if ([a4 isCanceled] & 1) != 0 || (unsigned __int8 v7 = atomic_load((unsigned __int8 *)a1[4] + 25), (v7))
  {
    id v10 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Canceled during first pass", buf, 2u);
    }

    goto LABEL_8;
  }
  if (([v6 BOOLValue] & 1) == 0)
  {
    unsigned __int8 v11 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Encountered an error when performing recovery actions. Rescheduling with backoff.", buf, 2u);
    }

    [a1[4] _rescheduleWithBackoff];
LABEL_8:
    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_9;
  }
  id v8 = a1[4];
  id v9 = (void *)v8[4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_152;
  v12[3] = &unk_1E56F2080;
  v12[4] = v8;
  id v14 = a1[6];
  id v13 = a1[5];
  [v9 deviceStateWithCompletion:v12];

LABEL_9:
}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_152(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_2_153;
  v7[3] = &unk_1E56F2058;
  void v7[4] = v4;
  id v10 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_2_153(uint64_t a1)
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 25));
  if (v2)
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v8();
  }
  else
  {
    id v3 = *(void **)(a1 + 40);
    if (v3)
    {
      uint64_t v4 = CheckConsistencyWithDeviceState(v3, *(void **)(a1 + 48));
      uint64_t v5 = [v4 cleanupActions];
      id v6 = PKLogFacilityTypeGetObject(6uLL);
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v7)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Notify Broker that our state is messed up.", buf, 2u);
        }

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_154;
        block[3] = &unk_1E56D89F0;
        block[4] = *(void *)(a1 + 32);
        id v11 = v4;
        id v12 = *(id *)(a1 + 56);
        dispatch_sync(MEMORY[0x1E4F14428], block);
        [*(id *)(a1 + 32) _rescheduleWithBackoff];
      }
      else
      {
        if (v7)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Passbook and SE are now consistent!", buf, 2u);
        }

        [*(id *)(a1 + 32) _rescheduleCheckInTimeInterval:0 backoffLevel:86400.0];
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
    }
    else
    {
      id v9 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: failed to get device state. Aborting.", buf, 2u);
      }

      [*(id *)(a1 + 32) _rescheduleWithBackoff];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_154(uint64_t a1)
{
  unsigned __int8 v2 = *(void **)(*(void *)(a1 + 32) + 40);
  id v3 = [v2 primaryBrokerURL];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_2_155;
  v5[3] = &unk_1E56EE970;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v2 registerDeviceAtBrokerURL:v3 consistencyCheckResults:v4 completion:v5];
}

uint64_t __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_2_155(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_3_159(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PKLogFacilityTypeGetObject(6uLL);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2 == 1)
  {
    if (v6)
    {
      LOWORD(v10) = 0;
      BOOL v7 = "PKSecureElementConsistencyChecker: Successfully updated payment service server-side config data";
      id v8 = v5;
      uint32_t v9 = 2;
LABEL_6:
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v6)
  {
    int v10 = 138412290;
    id v11 = v4;
    BOOL v7 = "PKSecureElementConsistencyChecker: Failed to update payment service server-side config with error %@";
    id v8 = v5;
    uint32_t v9 = 12;
    goto LABEL_6;
  }
}

- (void)_downloadPassesWithCompletion:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PKPaymentWebService *)self->_paymentWebService context];
  char v6 = [v5 isRegistered];

  if (v6)
  {
    BOOL v7 = [(PKSecureElementConsistencyCheckerDelegate *)self->_delegate paymentPasses];
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v42 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          id v14 = [v13 uniqueID];
          [v8 setObject:v13 forKey:v14];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v10);
    }

    *(void *)buf = 0;
    v36 = buf;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__70;
    v39 = __Block_byref_object_dispose__70;
    id v40 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke;
    aBlock[3] = &unk_1E56F2118;
    aBlock[4] = self;
    v34 = buf;
    id v33 = v4;
    id v15 = _Block_copy(aBlock);
    dispatch_source_t v16 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    id v17 = (void *)*((void *)v36 + 5);
    *((void *)v36 + 5) = v16;

    v18 = *((void *)v36 + 5);
    dispatch_time_t v19 = dispatch_time(0, 900000000000);
    dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    v20 = *((void *)v36 + 5);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_3;
    handler[3] = &unk_1E56D8360;
    id v21 = v15;
    id v31 = v21;
    dispatch_source_set_event_handler(v20, handler);
    dispatch_resume(*((dispatch_object_t *)v36 + 5));
    paymentWebService = self->_paymentWebService;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_4;
    v26[3] = &unk_1E56F2190;
    id v23 = v8;
    id v27 = v23;
    v28 = self;
    id v24 = v21;
    id v29 = v24;
    [(PKPaymentWebService *)paymentWebService devicePassesSinceLastUpdatedTag:0 withCompletion:v26];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v25 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v25, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Device needs to register; we will not sync passes with server",
        buf,
        2u);
    }

    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke(uint64_t a1, char a2)
{
  unsigned __int8 v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_2;
  block[3] = &unk_1E56F20F0;
  char v7 = a2;
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  dispatch_async(v2, block);
}

NSObject *__67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  result = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    if (!result) {
      goto LABEL_6;
    }
  }
  else if (!result)
  {
    return result;
  }
  dispatch_source_cancel(result);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

LABEL_6:
  long long v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v6();
}

uint64_t __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v6 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  if (a2 == 1)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obuint64_t j = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v12 = *(void **)(a1 + 32);
          id v13 = [v11 uniqueID];
          [v12 removeObjectForKey:v13];

          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_5;
          v30[3] = &unk_1E56E1DD0;
          v30[4] = *(void *)(a1 + 40);
          v30[5] = v11;
          [(PKAsyncUnaryOperationComposer *)v6 addOperation:v30];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v8);
    }
  }
  long long v29 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  id v14 = [*(id *)(a1 + 32) allValues];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * j);
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        void v25[2] = __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_164;
        v25[3] = &unk_1E56E1DD0;
        v25[4] = *(void *)(a1 + 40);
        v25[5] = v19;
        [(PKAsyncUnaryOperationComposer *)v6 addOperation:v25];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v16);
  }

  v20 = [MEMORY[0x1E4F1CA98] null];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_3_168;
  v23[3] = &unk_1E56E3B10;
  id v24 = *(id *)(a1 + 48);
  id v21 = [(PKAsyncUnaryOperationComposer *)v6 evaluateWithInput:v20 completion:v23];
}

void __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[PKDownloadRemoteAssetConfiguration configurationWithCloudStoreDelegate:*(void *)(*(void *)(a1 + 32) + 8)];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_6;
  v12[3] = &unk_1E56F2140;
  uint64_t v9 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  void v12[5] = v9;
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  [v9 downloadRemoteAssetsWithConfiguration:v8 completion:v12];
}

void __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_6(void *a1, int a2, void *a3, float a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (a2)
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109634;
      v9[1] = 1;
      __int16 v10 = 2048;
      double v11 = a4;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Download of remote assets during consistency check, called completion handler with finished=%i progress=%f error=%@", (uint8_t *)v9, 0x1Cu);
    }

    if (!v7) {
      [*(id *)(a1[4] + 32) didDownloadPaymentPass:a1[5]];
    }
    (*(void (**)(void))(a1[7] + 16))();
  }
}

void __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_164(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v9 = [*(id *)(a1 + 40) passTypeIdentifier];
  __int16 v10 = [*(id *)(a1 + 40) serialNumber];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_2_165;
  v13[3] = &unk_1E56F2168;
  id v14 = v6;
  id v15 = v7;
  id v11 = v6;
  id v12 = v7;
  [v8 passWithPassTypeIdentifier:v9 serialNumber:v10 completion:v13];
}

uint64_t __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_2_165(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_3_168(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_syncWithTSMCompletion:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Syncing with TSM…", buf, 2u);
  }

  char v6 = [(PKSecureElementConsistencyCheckerDelegate *)self->_delegate synchronizeWithTSM];
  dispatch_time_t v7 = dispatch_time(0, 30000000000);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __60__PKSecureElementConsistencyChecker__syncWithTSMCompletion___block_invoke;
  v9[3] = &unk_1E56D8680;
  id v10 = v4;
  char v11 = v6;
  id v8 = v4;
  dispatch_after(v7, MEMORY[0x1E4F14428], v9);
}

uint64_t __60__PKSecureElementConsistencyChecker__syncWithTSMCompletion___block_invoke(uint64_t a1)
{
  int v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Done syncing with TSM.", v4, 2u);
  }

  AnalyticsSendEvent();
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_rescheduleWithBackoff
{
  id v3 = [(PKPaymentWebService *)self->_paymentWebService context];
  id v4 = [v3 primaryRegion];

  if (v4)
  {
    uint64_t v5 = [v4 consistencyCheckBackoffLevel];
  }
  else
  {
    char v6 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: reschedule consistency check with maximum backoff delay due to lack of primary region.", v10, 2u);
    }

    uint64_t v5 = 12;
  }
  uint64_t v7 = 12;
  if (v5 < 12) {
    uint64_t v7 = v5;
  }
  double v8 = ConsistencyCheckBackoffLevels[v7];
  uint64_t v9 = 11;
  if (v5 < 11) {
    uint64_t v9 = v5;
  }
  [(PKSecureElementConsistencyChecker *)self _rescheduleCheckInTimeInterval:v9 + 1 backoffLevel:v8];
}

- (void)_rescheduleCheckInTimeInterval:(double)a3 backoffLevel:(int64_t)a4
{
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if (v4) {
    return;
  }
  char v8 = objc_opt_respondsToSelector();
  delegate = self->_delegate;
  if (v8)
  {
    id v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a3];
    id v10 = objc_msgSend(NSNumber, "numberWithInteger:", a4, 28800.0);
    [(PKSecureElementConsistencyCheckerDelegate *)delegate scheduleConsistencyCheck:v13 pluggedIn:a3 > 28800.0 backoffLevel:v10];

LABEL_6:

    return;
  }
  if (objc_opt_respondsToSelector())
  {
    char v11 = self->_delegate;
    id v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a3];
    [(PKSecureElementConsistencyCheckerDelegate *)v11 scheduleConsistencyCheck:v13 pluggedIn:a3 > 28800.0];
    goto LABEL_6;
  }
  id v12 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: unable to reschedule check, delegate doesn't response to any scheduleConsistencyCheck selector", buf, 2u);
  }
}

- (PKSecureElementConsistencyCheckerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (PKSecureElementConsistencyCheckerDelegate *)a3;
}

- (PKPaymentWebService)paymentWebService
{
  return self->_paymentWebService;
}

- (void)setPaymentWebService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_cloudStoreCoordinatorDelegate, 0);
}

- (PKSecureElementConsistencyChecker)initWithPaymentWebService:(id)a3 delegate:(id)a4
{
  return [(PKSecureElementConsistencyChecker *)self initWithPaymentWebService:a3 delegate:a4 cloudStoreCoordinatorDelegate:0];
}

@end