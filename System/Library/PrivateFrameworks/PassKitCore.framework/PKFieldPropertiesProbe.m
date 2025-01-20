@interface PKFieldPropertiesProbe
+ (id)createProbeForProperties:(id)a3 queue:(id)a4;
- (PKFieldPropertiesProbe)init;
- (id)_initWithProperties:(id)a3 queue:(id)a4;
- (void)_acceptSession:(id)a3;
- (void)_resolve;
- (void)beginWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)loyaltyAndPaymentSession:(id)a3 didEndTransaction:(id)a4;
- (void)loyaltyAndPaymentSession:(id)a3 didPerformValueAddedServiceTransactions:(id)a4;
- (void)loyaltyAndPaymentSessionDidEndUnexpectedly:(id)a3;
- (void)session:(id)a3 didEndTransaction:(id)a4;
- (void)sessionDidEndUnexpectedly:(id)a3;
@end

@implementation PKFieldPropertiesProbe

+ (id)createProbeForProperties:(id)a3 queue:(id)a4
{
  id v5 = a3;
  id result = a4;
  if (v5 && (id v7 = result) != 0)
  {
    id v8 = [[PKFieldPropertiesProbe alloc] _initWithProperties:v5 queue:result];

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (PKFieldPropertiesProbe)init
{
  return 0;
}

- (id)_initWithProperties:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKFieldPropertiesProbe;
  v9 = [(PKFieldPropertiesProbe *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    v10->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v10->_properties, a3);
    v10->_type = [(PKFieldProperties *)v10->_properties accessTerminalSubtype] == 2;
  }

  return v10;
}

- (void)dealloc
{
  [(PKFieldPropertiesProbe *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKFieldPropertiesProbe;
  [(PKFieldPropertiesProbe *)&v3 dealloc];
}

- (void)beginWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock(&self->_lock);
    if (!self->_started)
    {
      self->_started = 1;
      if (self->_invalidated)
      {
        os_unfair_lock_unlock(&self->_lock);
LABEL_20:

        return;
      }
      v6 = _Block_copy(v5);
      id completion = self->_completion;
      self->_id completion = v6;

      os_unfair_lock_unlock(&self->_lock);
      id v8 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKFieldPropertiesProbe: starting lookup session...", (uint8_t *)buf, 2u);
      }

      PKTimeProfileBegin((uint64_t)v8, @"field_detector_lookup");
      PKTimeProfileBegin((uint64_t)v8, @"field_detector_lookup_start");

      objc_initWeak(buf, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __46__PKFieldPropertiesProbe_beginWithCompletion___block_invoke;
      aBlock[3] = &unk_1E56F0B60;
      objc_copyWeak(&v23, buf);
      v9 = _Block_copy(aBlock);
      v10 = [PKGetClassNFHardwareManager() sharedHardwareManagerWithNoUI];
      v11 = v10;
      int64_t type = self->_type;
      if (type)
      {
        if (type != 1)
        {
          v14 = 0;
          goto LABEL_13;
        }
        uint64_t v13 = [v10 startDigitalCarKeySession:v9];
      }
      else
      {
        uint64_t v13 = [v10 startLoyaltyAndContactlessPaymentSession:v9];
      }
      v14 = (void *)v13;
LABEL_13:
      os_unfair_lock_lock(&self->_lock);
      if (self->_invalidated)
      {
        os_unfair_lock_unlock(&self->_lock);
        if (v14) {
          [v14 endSession];
        }
      }
      else
      {
        if (!self->_session) {
          objc_storeStrong((id *)&self->_startHandle, v14);
        }

        v15 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
        timeout = self->_timeout;
        self->_timeout = v15;

        v17 = self->_timeout;
        dispatch_time_t v18 = dispatch_time(0, 5000000000);
        dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
        v19 = self->_timeout;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __46__PKFieldPropertiesProbe_beginWithCompletion___block_invoke_168;
        v20[3] = &unk_1E56DD818;
        objc_copyWeak(&v21, buf);
        dispatch_source_set_event_handler(v19, v20);
        dispatch_resume((dispatch_object_t)self->_timeout);
        objc_destroyWeak(&v21);
        os_unfair_lock_unlock(&self->_lock);
        v14 = 0;
      }

      objc_destroyWeak(&v23);
      objc_destroyWeak(buf);
      goto LABEL_20;
    }
  }
  __break(1u);
}

void __46__PKFieldPropertiesProbe_beginWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__PKFieldPropertiesProbe_beginWithCompletion___block_invoke_2;
    block[3] = &unk_1E56D8AB8;
    id v11 = v5;
    id v12 = v6;
    uint64_t v13 = v8;
    dispatch_async(v9, block);
  }
  else
  {
    [v5 endSession];
  }
}

uint64_t __46__PKFieldPropertiesProbe_beginWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) && !*(void *)(a1 + 40))
  {
    id v5 = *(void **)(a1 + 48);
    return objc_msgSend(v5, "_acceptSession:");
  }
  else
  {
    v2 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v6 = 138412290;
      uint64_t v7 = v3;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "PKFieldPropertiesProbe: failed to start lookup session. Error: %@.", (uint8_t *)&v6, 0xCu);
    }

    [*(id *)(a1 + 32) endSession];
    return [*(id *)(a1 + 48) _resolve];
  }
}

void __46__PKFieldPropertiesProbe_beginWithCompletion___block_invoke_168(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _resolve];
    id WeakRetained = v2;
  }
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    v10 = 0;
    id v4 = 0;
  }
  else
  {
    self->_invalidated = 1;
    id completion = self->_completion;
    self->_id completion = 0;

    v10 = self->_startHandle;
    startHandle = self->_startHandle;
    self->_startHandle = 0;

    id v4 = self->_session;
    session = self->_session;
    self->_session = 0;

    timeout = self->_timeout;
    if (timeout)
    {
      dispatch_source_cancel(timeout);
      v9 = self->_timeout;
      self->_timeout = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);
  [(NFSession *)v10 endSession];
  if (v4)
  {
    if (self->_type <= 1uLL) {
      [(NFSession *)v4 setDelegate:0];
    }
    [(NFSession *)v4 endSession];
  }
}

- (void)_resolve
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_resolved)
  {
    os_unfair_lock_unlock(p_lock);
    int v6 = 0;
  }
  else
  {
    self->_resolved = 1;
    BOOL invalidated = self->_invalidated;
    if (self->_invalidated) {
      int v6 = 0;
    }
    else {
      int v6 = (void (**)(void))_Block_copy(self->_completion);
    }
    id completion = self->_completion;
    self->_id completion = 0;

    os_unfair_lock_unlock(p_lock);
    if (!invalidated && v6) {
      v6[2]();
    }
  }
  [(PKFieldPropertiesProbe *)self invalidate];
}

- (void)_acceptSession:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5) {
    __break(1u);
  }
  int v6 = v5;
  uint64_t v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v14 = v6;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKFieldPropertiesProbe: started lookup session %p.", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  startHandle = self->_startHandle;
  self->_startHandle = 0;

  if (!self->_invalidated)
  {
    objc_storeStrong((id *)&self->_session, a3);
    os_unfair_lock_unlock(&self->_lock);
    int64_t type = self->_type;
    if (type)
    {
      if (type == 1)
      {
        [v6 setDelegate:self];
        if (PKFieldPropertiesStartSecondaryLookup(self->_properties, v6, 0)) {
          goto LABEL_9;
        }
      }
    }
    else
    {
      [v6 setDelegate:self];
      if (PKFieldPropertiesStartSecondaryLookup(self->_properties, v6, 0))
      {
LABEL_9:
        id v11 = @"eventType";
        id v12 = @"cardEmulationStarted";
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
        +[PKAnalyticsReporter subject:@"fieldDetect" sendEvent:v10];

        goto LABEL_12;
      }
    }
    [(PKFieldPropertiesProbe *)self _resolve];
    goto LABEL_12;
  }
  os_unfair_lock_unlock(&self->_lock);
  [v6 endSession];
LABEL_12:
}

- (void)loyaltyAndPaymentSession:(id)a3 didPerformValueAddedServiceTransactions:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__PKFieldPropertiesProbe_loyaltyAndPaymentSession_didPerformValueAddedServiceTransactions___block_invoke;
  v8[3] = &unk_1E56D8A90;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __91__PKFieldPropertiesProbe_loyaltyAndPaymentSession_didPerformValueAddedServiceTransactions___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 74) || *(unsigned char *)(v2 + 73))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 16));
  }
  else
  {
    PKFieldPropertiesResolveSecondaryLookup(*(void **)(v2 + 24), *(void **)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
    uint64_t v3 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKFieldPropertiesProbe: lookup session performed VAS transaction.", v5, 2u);
    }

    id v4 = PKTimeProfileEnd(v3, @"field_detect_lookup", @"Field Detector Lookup Session");
    [*(id *)(a1 + 32) _resolve];
  }
}

- (void)loyaltyAndPaymentSessionDidEndUnexpectedly:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKFieldPropertiesProbe_loyaltyAndPaymentSessionDidEndUnexpectedly___block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __69__PKFieldPropertiesProbe_loyaltyAndPaymentSessionDidEndUnexpectedly___block_invoke(uint64_t a1)
{
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "PKFieldPropertiesProbe: lookup session terminated.", v4, 2u);
  }

  return [*(id *)(a1 + 32) _resolve];
}

- (void)loyaltyAndPaymentSession:(id)a3 didEndTransaction:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__PKFieldPropertiesProbe_loyaltyAndPaymentSession_didEndTransaction___block_invoke;
  v8[3] = &unk_1E56D8A90;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __69__PKFieldPropertiesProbe_loyaltyAndPaymentSession_didEndTransaction___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 74) || *(unsigned char *)(v2 + 73))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 16));
  }
  else
  {
    PKFieldPropertiesResolveSecondaryLookup(*(void **)(v2 + 24), *(void **)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
    uint64_t v3 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKFieldPropertiesProbe: lookup session performed transaction.", v5, 2u);
    }

    id v4 = PKTimeProfileEnd(v3, @"field_detect_lookup", @"Field Detector Lookup Session");
    [*(id *)(a1 + 32) _resolve];
  }
}

- (void)sessionDidEndUnexpectedly:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PKFieldPropertiesProbe_sessionDidEndUnexpectedly___block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __52__PKFieldPropertiesProbe_sessionDidEndUnexpectedly___block_invoke(uint64_t a1)
{
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "PKFieldPropertiesProbe: lookup session terminated.", v4, 2u);
  }

  return [*(id *)(a1 + 32) _resolve];
}

- (void)session:(id)a3 didEndTransaction:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__PKFieldPropertiesProbe_session_didEndTransaction___block_invoke;
  v8[3] = &unk_1E56D8A90;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __52__PKFieldPropertiesProbe_session_didEndTransaction___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 74) || *(unsigned char *)(v2 + 73))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 16));
  }
  else
  {
    PKFieldPropertiesResolveSecondaryLookup(*(void **)(v2 + 24), *(void **)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
    uint64_t v3 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKFieldPropertiesProbe: lookup session performed transaction.", v5, 2u);
    }

    id v4 = PKTimeProfileEnd(v3, @"field_detect_lookup", @"Field Detector Lookup Session");
    [*(id *)(a1 + 32) _resolve];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_startHandle, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end