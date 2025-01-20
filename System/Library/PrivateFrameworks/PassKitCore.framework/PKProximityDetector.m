@interface PKProximityDetector
- (BOOL)isDetecting;
- (NSUUID)advertisingDeviceUUID;
- (PKProximityDetector)initWithAdvertisingDeviceUUID:(id)a3;
- (id)_createDeviceFoundBlockWithName:(id)a3;
- (id)_createDeviceLostBlockWithName:(id)a3;
- (id)_createDiscoveryActivationBlockWithName:(id)a3 duration:(double)a4 completion:(id)a5;
- (id)handler;
- (void)_createPowerAssertion;
- (void)_endPowerAssertion;
- (void)_queue_endDetecting;
- (void)dealloc;
- (void)endDetecting;
- (void)setHandler:(id)a3;
- (void)startDetectingWithDuration:(double)a3 completion:(id)a4;
@end

@implementation PKProximityDetector

- (PKProximityDetector)initWithAdvertisingDeviceUUID:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKProximityDetector;
  v6 = [(PKProximityDetector *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_advertisingDeviceUUID, a3);
    v7->_advertisingDeviceNearby = 0;
    dispatch_queue_t v8 = dispatch_queue_create("PKProximityDetectorTimerQueue", 0);
    timerQueue = v7->_timerQueue;
    v7->_timerQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("PKProximityDetectorQueue", 0);
    discoveryQueue = v7->_discoveryQueue;
    v7->_discoveryQueue = (OS_dispatch_queue *)v10;

    v7->_powerAssertionIdentifier = 0;
  }

  return v7;
}

- (void)dealloc
{
  [(PKProximityDetector *)self endDetecting];
  v3.receiver = self;
  v3.super_class = (Class)PKProximityDetector;
  [(PKProximityDetector *)&v3 dealloc];
}

- (void)startDetectingWithDuration:(double)a3 completion:(id)a4
{
  id v16 = a4;
  if (self->_isDetecting) {
    [(PKProximityDetector *)self endDetecting];
  }
  [(PKProximityDetector *)self _createPowerAssertion];
  v6 = (SFDeviceDiscovery *)objc_alloc_init((Class)getSFDeviceDiscoveryClass[0]());
  nearbyInfoDiscovery = self->_nearbyInfoDiscovery;
  self->_nearbyInfoDiscovery = v6;

  if (self->_advertisingDeviceUUID)
  {
    dispatch_queue_t v8 = self->_nearbyInfoDiscovery;
    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:");
    [(SFDeviceDiscovery *)v8 setDeviceFilter:v9];
  }
  [(SFDeviceDiscovery *)self->_nearbyInfoDiscovery setDiscoveryFlags:1];
  [(SFDeviceDiscovery *)self->_nearbyInfoDiscovery setScanRate:50];
  dispatch_queue_t v10 = self->_nearbyInfoDiscovery;
  v11 = [(PKProximityDetector *)self _createDeviceFoundBlockWithName:@"NearbyInfo"];
  [(SFDeviceDiscovery *)v10 setDeviceFoundHandler:v11];

  v12 = self->_nearbyInfoDiscovery;
  objc_super v13 = [(PKProximityDetector *)self _createDeviceLostBlockWithName:@"NearbyInfo"];
  [(SFDeviceDiscovery *)v12 setDeviceLostHandler:v13];

  [(SFDeviceDiscovery *)self->_nearbyInfoDiscovery setOverrideScreenOff:1];
  self->_isDetecting = 1;
  v14 = self->_nearbyInfoDiscovery;
  v15 = [(PKProximityDetector *)self _createDiscoveryActivationBlockWithName:@"NearbyInfo" duration:v16 completion:a3];
  [(SFDeviceDiscovery *)v14 activateWithCompletion:v15];
}

- (id)_createDeviceFoundBlockWithName:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __55__PKProximityDetector__createDeviceFoundBlockWithName___block_invoke;
  v12 = &unk_1E56EF048;
  objc_copyWeak(&v15, &location);
  objc_super v13 = self;
  id v5 = v4;
  id v14 = v5;
  v6 = _Block_copy(&v9);
  v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v7;
}

void __55__PKProximityDetector__createDeviceFoundBlockWithName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = [WeakRetained advertisingDeviceUUID];
  v6 = [v3 identifier];
  int v7 = [v5 isEqual:v6];

  if (v7 && !*(unsigned char *)(*(void *)(a1 + 32) + 16) && *((void *)WeakRetained + 8))
  {
    dispatch_queue_t v8 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = [v3 name];
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "%@ device discovery detected device nearby: %@", (uint8_t *)&v11, 0x16u);
    }
    (*(void (**)(void))(*((void *)WeakRetained + 8) + 16))();
    *((unsigned char *)WeakRetained + 16) = 1;
  }
}

- (id)_createDeviceLostBlockWithName:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  int v11 = __54__PKProximityDetector__createDeviceLostBlockWithName___block_invoke;
  uint64_t v12 = &unk_1E56EF048;
  objc_copyWeak(&v15, &location);
  __int16 v13 = self;
  id v5 = v4;
  id v14 = v5;
  v6 = _Block_copy(&v9);
  int v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v7;
}

void __54__PKProximityDetector__createDeviceLostBlockWithName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = [WeakRetained advertisingDeviceUUID];
  v6 = [v3 identifier];
  int v7 = [v5 isEqual:v6];

  if (v7 && *(unsigned char *)(*(void *)(a1 + 32) + 16) && *((void *)WeakRetained + 8))
  {
    dispatch_queue_t v8 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = [v3 name];
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "%@ device discovery lost device nearby: %@", (uint8_t *)&v11, 0x16u);
    }
    (*(void (**)(void))(*((void *)WeakRetained + 8) + 16))();
    *((unsigned char *)WeakRetained + 16) = 0;
  }
}

- (id)_createDiscoveryActivationBlockWithName:(id)a3 duration:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __83__PKProximityDetector__createDiscoveryActivationBlockWithName_duration_completion___block_invoke;
  v18 = &unk_1E56EF098;
  v19 = self;
  id v10 = v8;
  id v20 = v10;
  objc_copyWeak(v22, &location);
  v22[1] = *(id *)&a4;
  id v11 = v9;
  id v21 = v11;
  uint64_t v12 = _Block_copy(&v15);
  __int16 v13 = objc_msgSend(v12, "copy", v15, v16, v17, v18, v19);

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

  return v13;
}

void __83__PKProximityDetector__createDiscoveryActivationBlockWithName_duration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__PKProximityDetector__createDiscoveryActivationBlockWithName_duration_completion___block_invoke_2;
  v6[3] = &unk_1E56EF070;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  objc_copyWeak(v11, (id *)(a1 + 56));
  uint64_t v9 = *(void *)(a1 + 32);
  v11[1] = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 48);
  dispatch_async(v4, v6);

  objc_destroyWeak(v11);
}

void __83__PKProximityDetector__createDiscoveryActivationBlockWithName_duration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v3 = PKLogFacilityTypeGetObject(8uLL);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      v6 = [v2 localizedDescription];
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = v5;
      __int16 v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Failed to activate %@ proximate device discovery: %@", buf, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_queue_endDetecting");
  }
  else
  {
    if (v4)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void **)(*(void *)(a1 + 48) + 56);
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = v8;
      __int16 v25 = 2112;
      v26 = v9;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Activated %@ proximate device discovery for paired device: %@", buf, 0x16u);
    }

    dispatch_source_t v10 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 48) + 32));
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = *(void **)(v11 + 24);
    *(void *)(v11 + 24) = v10;

    __int16 v13 = *(NSObject **)(*(void *)(a1 + 48) + 24);
    if (v13)
    {
      dispatch_time_t v14 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 72) * 1000000000.0));
      dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
      objc_initWeak((id *)buf, *(id *)(a1 + 48));
      uint64_t v15 = *(NSObject **)(*(void *)(a1 + 48) + 24);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __83__PKProximityDetector__createDiscoveryActivationBlockWithName_duration_completion___block_invoke_18;
      handler[3] = &unk_1E56DD818;
      objc_copyWeak(&v22, (id *)buf);
      dispatch_source_set_event_handler(v15, handler);
      dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 48) + 24));
      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
  }
  uint64_t v16 = *(void **)(a1 + 56);
  if (v16)
  {
    v17 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__PKProximityDetector__createDiscoveryActivationBlockWithName_duration_completion___block_invoke_2_20;
    block[3] = &unk_1E56D83D8;
    id v20 = v16;
    id v19 = *(id *)(a1 + 32);
    dispatch_async(v17, block);
  }
}

void __83__PKProximityDetector__createDiscoveryActivationBlockWithName_duration_completion___block_invoke_18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained endDetecting];
    id WeakRetained = v2;
  }
}

uint64_t __83__PKProximityDetector__createDiscoveryActivationBlockWithName_duration_completion___block_invoke_2_20(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_queue_endDetecting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_discoveryQueue);
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    BOOL v4 = self->_timer;
    self->_timer = 0;
  }
  if (self->_powerAssertionIdentifier) {
    [(PKProximityDetector *)self _endPowerAssertion];
  }
  [(SFDeviceDiscovery *)self->_nearbyInfoDiscovery invalidate];
  id handler = self->_handler;
  self->_id handler = 0;

  self->_isDetecting = 0;
  v6 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Deactivated proximate device discovery", v7, 2u);
  }
}

- (void)endDetecting
{
  discoveryQueue = self->_discoveryQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__PKProximityDetector_endDetecting__block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_sync(discoveryQueue, block);
}

uint64_t __35__PKProximityDetector_endDetecting__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_endDetecting");
}

- (void)_createPowerAssertion
{
  v9[4] = *MEMORY[0x1E4F143B8];
  IOPMAssertionID AssertionID = 0;
  v8[0] = @"AssertType";
  v8[1] = @"AssertLevel";
  v9[0] = @"PreventUserIdleSystemSleep";
  v9[1] = &unk_1EE22C2F0;
  v9[2] = @"Apple Pay Discovery Request: BT";
  v8[2] = @"AssertName";
  v8[3] = @"TimeoutSeconds";
  id v3 = [NSNumber numberWithInteger:30];
  v9[3] = v3;
  CFDictionaryRef v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  if (!IOPMAssertionCreateWithProperties(v4, &AssertionID))
  {
    self->_powerAssertionIdentifier = AssertionID;
    uint64_t v5 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Created power assertion for sharing broadcast", v6, 2u);
    }
  }
}

- (void)_endPowerAssertion
{
  IOPMAssertionID powerAssertionIdentifier = self->_powerAssertionIdentifier;
  if (powerAssertionIdentifier) {
    IOPMAssertionRelease(powerAssertionIdentifier);
  }
}

- (NSUUID)advertisingDeviceUUID
{
  return self->_advertisingDeviceUUID;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (BOOL)isDetecting
{
  return self->_isDetecting;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_advertisingDeviceUUID, 0);
  objc_storeStrong((id *)&self->_discoveryQueue, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_nearbyInfoDiscovery, 0);
}

@end