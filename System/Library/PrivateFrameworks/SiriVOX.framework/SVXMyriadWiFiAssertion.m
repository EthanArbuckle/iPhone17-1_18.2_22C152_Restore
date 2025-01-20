@interface SVXMyriadWiFiAssertion
- (AFWatchdogTimer)assertionWaitTimer;
- (BOOL)wifiAssertionAcquired;
- (OS_dispatch_queue)workQueue;
- (SVXMyriadWiFiAssertion)initWithQueue:(id)a3 delegate:(id)a4;
- (SVXMyriadWiFiAssertionProtocol)delegate;
- (void)_releaseAssertion;
- (void)acquireHomeKitAccessoryWiFiAssertionWithTimeout:(double)a3;
- (void)releaseHomeKitAccessoryWiFiAssertion;
- (void)setAssertionWaitTimer:(id)a3;
@end

@implementation SVXMyriadWiFiAssertion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionWaitTimer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setAssertionWaitTimer:(id)a3
{
}

- (AFWatchdogTimer)assertionWaitTimer
{
  return self->_assertionWaitTimer;
}

- (BOOL)wifiAssertionAcquired
{
  return self->_wifiAssertionAcquired;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (SVXMyriadWiFiAssertionProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SVXMyriadWiFiAssertionProtocol *)WeakRetained;
}

- (void)releaseHomeKitAccessoryWiFiAssertion
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__SVXMyriadWiFiAssertion_releaseHomeKitAccessoryWiFiAssertion__block_invoke;
  block[3] = &unk_2645548A0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __62__SVXMyriadWiFiAssertion_releaseHomeKitAccessoryWiFiAssertion__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _releaseAssertion];
}

- (void)acquireHomeKitAccessoryWiFiAssertionWithTimeout:(double)a3
{
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __74__SVXMyriadWiFiAssertion_acquireHomeKitAccessoryWiFiAssertionWithTimeout___block_invoke;
  v4[3] = &unk_264554548;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(workQueue, v4);
}

void __74__SVXMyriadWiFiAssertion_acquireHomeKitAccessoryWiFiAssertionWithTimeout___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _releaseAssertion];
  v2 = *MEMORY[0x263F28370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28370], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    v15 = "-[SVXMyriadWiFiAssertion acquireHomeKitAccessoryWiFiAssertionWithTimeout:]_block_invoke";
    __int16 v16 = 2048;
    uint64_t v17 = v3;
    _os_log_impl(&dword_220062000, v2, OS_LOG_TYPE_INFO, "%s Acquiring assertion with timeout time: %f seconds", buf, 0x16u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  id v4 = objc_alloc(MEMORY[0x263F286E8]);
  double v5 = *(double *)(a1 + 40);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 24);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__SVXMyriadWiFiAssertion_acquireHomeKitAccessoryWiFiAssertionWithTimeout___block_invoke_3;
  v12[3] = &unk_264554968;
  objc_copyWeak(&v13, (id *)buf);
  uint64_t v7 = [v4 initWithTimeoutInterval:v6 onQueue:v12 timeoutHandler:v5];
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = v7;

  [*(id *)(*(void *)(a1 + 32) + 32) start];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    [v11 myriadWiFiAssertionDidAcquireAssertion:*(void *)(a1 + 32)];
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __74__SVXMyriadWiFiAssertion_acquireHomeKitAccessoryWiFiAssertionWithTimeout___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _releaseAssertion];
}

- (void)_releaseAssertion
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_wifiAssertionAcquired)
  {
    uint64_t v3 = *MEMORY[0x263F28370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28370], OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      v9 = "-[SVXMyriadWiFiAssertion _releaseAssertion]";
      _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
    }
    self->_wifiAssertionAcquired = 0;
    [(AFWatchdogTimer *)self->_assertionWaitTimer cancelIfNotAlreadyCanceled];
    assertionWaitTimer = self->_assertionWaitTimer;
    self->_assertionWaitTimer = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      [v7 myriadWiFiAssertionDidReleaseAssertion:self];
    }
  }
}

- (SVXMyriadWiFiAssertion)initWithQueue:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SVXMyriadWiFiAssertion;
  id v7 = [(SVXMyriadWiFiAssertion *)&v10 init];
  int v8 = v7;
  if (v7)
  {
    v7->_workQueue = (OS_dispatch_queue *)a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
  }

  return v8;
}

@end