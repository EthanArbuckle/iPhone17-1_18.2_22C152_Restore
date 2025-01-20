@interface PKPaymentVerificationObserver
- (BOOL)_handleVerificationCode:(id)a3 fromSource:(id)a4;
- (BOOL)skipSourceCheck;
- (NSString)identifier;
- (PKPaymentPass)pass;
- (PKPaymentVerificationObserver)initWithPaymentPass:(id)a3 verificationChannel:(id)a4 identifier:(id)a5;
- (PKPaymentVerificationObserverDelegate)delegate;
- (PKVerificationChannel)verificationChannel;
- (void)_queue_stop;
- (void)_startObserving;
- (void)_startObservingUsingLegacyObserver;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setSkipSourceCheck:(BOOL)a3;
- (void)startObservingVerificationSourceWithTimeout:(double)a3;
- (void)stop;
@end

@implementation PKPaymentVerificationObserver

- (PKPaymentVerificationObserver)initWithPaymentPass:(id)a3 verificationChannel:(id)a4 identifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentVerificationObserver;
  v12 = [(PKPaymentVerificationObserver *)&v16 init];
  if (v12)
  {
    dispatch_queue_t v13 = dispatch_queue_create("VerificationObserver", 0);
    internalQueue = v12->_internalQueue;
    v12->_internalQueue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v12->_pass, a3);
    objc_storeStrong((id *)&v12->_verificationChannel, a4);
    objc_storeStrong((id *)&v12->_identifier, a5);
  }

  return v12;
}

- (void)dealloc
{
  timer = self->_timer;
  if (timer) {
    dispatch_source_cancel(timer);
  }
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentVerificationObserver;
  [(PKPaymentVerificationObserver *)&v4 dealloc];
}

- (void)startObservingVerificationSourceWithTimeout:(double)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__PKPaymentVerificationObserver_startObservingVerificationSourceWithTimeout___block_invoke;
  v4[3] = &unk_1E56DE608;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_sync(internalQueue, v4);
}

void __77__PKPaymentVerificationObserver_startObservingVerificationSourceWithTimeout___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    *(unsigned char *)(v1 + 8) = 1;
    if ([*(id *)(*(void *)(a1 + 32) + 64) type] == 2)
    {
      v3 = PKLogFacilityTypeGetObject(0x25uLL);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 32);
        uint64_t v5 = *(void *)(a1 + 40);
        uint64_t v6 = *(void *)(v4 + 48);
        v7 = [*(id *)(v4 + 64) sourceAddress];
        *(_DWORD *)buf = 138412802;
        uint64_t v23 = v6;
        __int16 v24 = 2048;
        uint64_t v25 = v5;
        __int16 v26 = 2112;
        v27 = v7;
        _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Observer<%@>: Starting SMS verification observer with timeout: %f sourceAddress: %@", buf, 0x20u);
      }
      BOOL v8 = PKEnableUpdatedOneTimeCodeParsing();
      id v9 = *(void **)(a1 + 32);
      if (v8) {
        [v9 _startObserving];
      }
      else {
        [v9 _startObservingUsingLegacyObserver];
      }
    }
    if (*(double *)(a1 + 40) > 0.0)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = *(NSObject **)(v10 + 24);
      if (v11)
      {
        dispatch_source_cancel(v11);
        uint64_t v12 = *(void *)(a1 + 32);
        dispatch_queue_t v13 = *(void **)(v12 + 24);
        *(void *)(v12 + 24) = 0;

        uint64_t v10 = *(void *)(a1 + 32);
      }
      dispatch_source_t v14 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(v10 + 16));
      uint64_t v15 = *(void *)(a1 + 32);
      objc_super v16 = *(void **)(v15 + 24);
      *(void *)(v15 + 24) = v14;

      v17 = *(NSObject **)(*(void *)(a1 + 32) + 24);
      dispatch_time_t v18 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
      dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      v19 = *(NSObject **)(*(void *)(a1 + 32) + 24);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __77__PKPaymentVerificationObserver_startObservingVerificationSourceWithTimeout___block_invoke_52;
      v20[3] = &unk_1E56D9150;
      objc_copyWeak(&v21, (id *)buf);
      v20[4] = *(void *)(a1 + 32);
      dispatch_source_set_event_handler(v19, v20);
      dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __77__PKPaymentVerificationObserver_startObservingVerificationSourceWithTimeout___block_invoke_52(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && *((unsigned char *)WeakRetained + 8))
  {
    uint64_t v4 = PKLogFacilityTypeGetObject(0x25uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 48);
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Observer<%@>: Verification observer timed out", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(v3, "_queue_stop");
    id v6 = objc_loadWeakRetained(v3 + 9);
    [v6 verificationObserverDidTimeout:v3];
  }
}

- (void)_startObserving
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc((Class)getIMOneTimeCodeAcceleratorClass[0]());
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__PKPaymentVerificationObserver__startObserving__block_invoke;
  v6[3] = &unk_1E56F1738;
  v6[4] = self;
  objc_copyWeak(&v7, &location);
  uint64_t v4 = (IMOneTimeCodeAccelerator *)[v3 initWithBlockForUpdates:v6];
  oneTimeCodeObserver = self->_oneTimeCodeObserver;
  self->_oneTimeCodeObserver = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __48__PKPaymentVerificationObserver__startObserving__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PKPaymentVerificationObserver__startObserving__block_invoke_2;
  block[3] = &unk_1E56DD038;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v10);
}

void __48__PKPaymentVerificationObserver__startObserving__block_invoke_2(id *a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && *((unsigned char *)WeakRetained + 8))
  {
    v19 = WeakRetained;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = a1[4];
    uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v22 != v5) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v8 = PKLogFacilityTypeGetObject(0x25uLL);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v9 = *((void *)a1[5] + 6);
            *(_DWORD *)buf = 138412547;
            uint64_t v26 = v9;
            __int16 v27 = 2113;
            uint64_t v28 = v7;
            _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Observer<%@>: Detected potential verification code: %{private}@", buf, 0x16u);
          }

          id v10 = _MergedGlobals_183();
          id v11 = [v7 PKStringForKey:v10];
          uint64_t v12 = v11;
          if (v11)
          {
            id v13 = v11;
          }
          else
          {
            dispatch_source_t v14 = off_1EB4024F8();
            id v13 = [v7 PKStringForKey:v14];
          }
          uint64_t v15 = off_1EB402500();
          objc_super v16 = [v7 PKStringForKey:v15];

          v17 = off_1EB402508();
          dispatch_time_t v18 = [v7 PKStringForKey:v17];

          if (v13 && v16 && v18 && [a1[5] _handleVerificationCode:v13 fromSource:v16])
          {
            [v19[4] consumeCodeWithGuid:v18];
            objc_msgSend(v19, "_queue_stop");

            goto LABEL_21;
          }
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_21:

    WeakRetained = v19;
  }
}

- (void)_startObservingUsingLegacyObserver
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  HSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifier();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

void __67__PKPaymentVerificationObserver__startObservingUsingLegacyObserver__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  id v8 = a2;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(NSObject **)(v9 + 16);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__PKPaymentVerificationObserver__startObservingUsingLegacyObserver__block_invoke_2;
  v13[3] = &unk_1E56D9370;
  v13[4] = v9;
  id v14 = v7;
  id v11 = v7;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  id v15 = v8;
  id v12 = v8;
  dispatch_async(v10, v13);

  objc_destroyWeak(&v16);
}

void __67__PKPaymentVerificationObserver__startObservingUsingLegacyObserver__block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0x25uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 48);
    int v6 = 138412547;
    uint64_t v7 = v4;
    __int16 v8 = 2113;
    uint64_t v9 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Observer<%@>: Detected candidate verification code: %{private}@", (uint8_t *)&v6, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handleVerificationCode:*(void *)(a1 + 40) fromSource:*(void *)(a1 + 48)];
}

- (BOOL)_handleVerificationCode:(id)a3 fromSource:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v6 length] > 4)
  {
    __int16 v8 = [(PKVerificationChannel *)self->_verificationChannel sourceAddress];
    id v11 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v8];
    id v12 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v7];
    if (self->_skipSourceCheck || !v11 || ([v11 isLikePhoneNumber:v12] & 1) != 0)
    {
      id v13 = PKLogFacilityTypeGetObject(0x25uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        identifier = self->_identifier;
        int v21 = 138412547;
        long long v22 = identifier;
        __int16 v23 = 2113;
        id v24 = v6;
        _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Observer<%@>: handling valid code %{private}@", (uint8_t *)&v21, 0x16u);
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (!WeakRetained)
      {
        BOOL v10 = 1;
LABEL_17:

        goto LABEL_18;
      }
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      [v16 verificationObserver:self didObserveVerificationCode:v6];
      BOOL v10 = 1;
    }
    else
    {
      id v16 = PKLogFacilityTypeGetObject(0x25uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = self->_identifier;
        dispatch_time_t v18 = [v12 stringValue];
        v19 = [v11 stringValue];
        int v21 = 138413059;
        long long v22 = v17;
        __int16 v23 = 2113;
        id v24 = v6;
        __int16 v25 = 2112;
        uint64_t v26 = v18;
        __int16 v27 = 2112;
        uint64_t v28 = v19;
        _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Observer<%@>: Verification code %{private}@ source address %@ does not match expected source address: %@ -- ignoring", (uint8_t *)&v21, 0x2Au);
      }
      BOOL v10 = 0;
    }

    goto LABEL_17;
  }
  __int16 v8 = PKLogFacilityTypeGetObject(0x25uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = self->_identifier;
    int v21 = 138412803;
    long long v22 = v9;
    __int16 v23 = 2113;
    id v24 = v6;
    __int16 v25 = 1024;
    LODWORD(v26) = 5;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Observer<%@>: Verification code %{private}@ is not of minimum length %d -- ignoring.", (uint8_t *)&v21, 0x1Cu);
  }
  BOOL v10 = 0;
LABEL_18:

  return v10;
}

- (void)stop
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__PKPaymentVerificationObserver_stop__block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __37__PKPaymentVerificationObserver_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_stop");
}

- (void)_queue_stop
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PKLogFacilityTypeGetObject(0x25uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    int v9 = 138412290;
    BOOL v10 = identifier;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Observer<%@>: Stopping verification observer", (uint8_t *)&v9, 0xCu);
  }

  if (self->_observing)
  {
    self->_observing = 0;
    timer = self->_timer;
    if (timer)
    {
      dispatch_source_cancel(timer);
      id v6 = self->_timer;
      self->_timer = 0;
    }
    if (self->_identifier)
    {
      HSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifier();
      id v7 = self->_identifier;
      self->_identifier = 0;
    }
    oneTimeCodeObserver = self->_oneTimeCodeObserver;
    self->_oneTimeCodeObserver = 0;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (PKVerificationChannel)verificationChannel
{
  return self->_verificationChannel;
}

- (PKPaymentVerificationObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKPaymentVerificationObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)skipSourceCheck
{
  return self->_skipSourceCheck;
}

- (void)setSkipSourceCheck:(BOOL)a3
{
  self->_skipSourceCheck = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_verificationChannel, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_oneTimeCodeObserver, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end