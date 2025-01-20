@interface PKProximityAdvertiser
- (BOOL)isAdvertising;
- (PKProximityAdvertiser)init;
- (id)_createAdvertisingActivationBlockWithName:(id)a3 duration:(double)a4 completion:(id)a5;
- (void)_queue_endAdvertising;
- (void)dealloc;
- (void)endAdvertising;
- (void)startAdvertisingForDuration:(double)a3 completion:(id)a4;
@end

@implementation PKProximityAdvertiser

- (PKProximityAdvertiser)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKProximityAdvertiser;
  v2 = [(PKProximityAdvertiser *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("PKProximityAdvertiserTimerQueue", 0);
    timerQueue = v2->_timerQueue;
    v2->_timerQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("PKProximityAdvertiserQueue", 0);
    advertiserQueue = v2->_advertiserQueue;
    v2->_advertiserQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)dealloc
{
  [(PKProximityAdvertiser *)self endAdvertising];
  v3.receiver = self;
  v3.super_class = (Class)PKProximityAdvertiser;
  [(PKProximityAdvertiser *)&v3 dealloc];
}

- (void)startAdvertisingForDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  if (self->_isAdvertising) {
    [(PKProximityAdvertiser *)self endAdvertising];
  }
  advertiserQueue = self->_advertiserQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKProximityAdvertiser_startAdvertisingForDuration_completion___block_invoke;
  block[3] = &unk_1E56D8B58;
  double v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(advertiserQueue, block);
}

void __64__PKProximityAdvertiser_startAdvertisingForDuration_completion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  id v2 = objc_alloc_init(_MergedGlobals_175());
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(*(void *)(a1 + 32) + 8) setAdvertiseRate:60];
  dispatch_queue_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
  id v6 = off_1EB402448();
  [v5 setIdentifier:v6];

  [*(id *)(*(void *)(a1 + 32) + 8) setOverrideScreenOff:1];
  v7 = *(void **)(a1 + 32);
  id v8 = (void *)v7[1];
  id v9 = [v7 _createAdvertisingActivationBlockWithName:@"NearbyInfo" duration:*(void *)(a1 + 40) completion:*(double *)(a1 + 48)];
  [v8 activateWithCompletion:v9];
}

- (id)_createAdvertisingActivationBlockWithName:(id)a3 duration:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __87__PKProximityAdvertiser__createAdvertisingActivationBlockWithName_duration_completion___block_invoke;
  v18 = &unk_1E56E53F0;
  v19 = self;
  id v20 = v8;
  double v22 = a4;
  id v21 = v9;
  id v10 = v9;
  id v11 = v8;
  v12 = _Block_copy(&v15);
  v13 = objc_msgSend(v12, "copy", v15, v16, v17, v18, v19);

  return v13;
}

void __87__PKProximityAdvertiser__createAdvertisingActivationBlockWithName_duration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PKProximityAdvertiser__createAdvertisingActivationBlockWithName_duration_completion___block_invoke_2;
  block[3] = &unk_1E56E43A8;
  id v9 = v3;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v6;
  uint64_t v13 = *(void *)(a1 + 56);
  id v12 = *(id *)(a1 + 48);
  id v7 = v3;
  dispatch_sync(v4, block);
}

void __87__PKProximityAdvertiser__createAdvertisingActivationBlockWithName_duration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = PKLogFacilityTypeGetObject(8uLL);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = [v2 localizedDescription];
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = v5;
      __int16 v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Error activating %@ sharing broadcast: %@", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 48), "_queue_endAdvertising");
  }
  else
  {
    if (v4)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v7;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Activated %@ sharing broadcast", buf, 0xCu);
    }

    dispatch_source_t v8 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 48) + 24));
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = *(void **)(v9 + 16);
    *(void *)(v9 + 16) = v8;

    uint64_t v11 = *(NSObject **)(*(void *)(a1 + 48) + 16);
    if (v11)
    {
      dispatch_time_t v12 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 64) * 1000000000.0));
      dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
      objc_initWeak((id *)buf, *(id *)(a1 + 48));
      uint64_t v13 = *(NSObject **)(*(void *)(a1 + 48) + 16);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __87__PKProximityAdvertiser__createAdvertisingActivationBlockWithName_duration_completion___block_invoke_15;
      handler[3] = &unk_1E56DD818;
      objc_copyWeak(&v20, (id *)buf);
      dispatch_source_set_event_handler(v13, handler);
      dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 48) + 16));
      objc_destroyWeak(&v20);
      objc_destroyWeak((id *)buf);
    }
  }
  v14 = *(void **)(a1 + 56);
  if (v14)
  {
    uint64_t v15 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__PKProximityAdvertiser__createAdvertisingActivationBlockWithName_duration_completion___block_invoke_2_16;
    block[3] = &unk_1E56D83D8;
    id v18 = v14;
    id v17 = *(id *)(a1 + 32);
    dispatch_async(v15, block);
  }
}

void __87__PKProximityAdvertiser__createAdvertisingActivationBlockWithName_duration_completion___block_invoke_15(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained endAdvertising];
    id WeakRetained = v2;
  }
}

uint64_t __87__PKProximityAdvertiser__createAdvertisingActivationBlockWithName_duration_completion___block_invoke_2_16(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_queue_endAdvertising
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_advertiserQueue);
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    BOOL v4 = self->_timer;
    self->_timer = 0;
  }
  self->_isAdvertising = 0;
  [(SFService *)self->_nearbyInfoSharingService invalidate];
  uint64_t v5 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Invalidated sharing broadcast", v6, 2u);
  }
}

- (void)endAdvertising
{
  advertiserQueue = self->_advertiserQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PKProximityAdvertiser_endAdvertising__block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_sync(advertiserQueue, block);
}

uint64_t __39__PKProximityAdvertiser_endAdvertising__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_endAdvertising");
}

- (BOOL)isAdvertising
{
  return self->_isAdvertising;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertiserQueue, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_nearbyInfoSharingService, 0);
}

@end