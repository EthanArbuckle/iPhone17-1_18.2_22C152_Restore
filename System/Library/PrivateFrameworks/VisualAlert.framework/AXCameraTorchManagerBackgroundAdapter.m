@interface AXCameraTorchManagerBackgroundAdapter
- (AXCameraTorchManager)synchronousTorchManager;
- (AXCameraTorchManagerBackgroundAdapter)initWithCameraTorchManager:(id)a3;
- (void)closeTorchDeviceWithCompletion:(id)a3;
- (void)openTorchDeviceWithCompletion:(id)a3;
- (void)turnTorchOffWithCompletion:(id)a3;
- (void)turnTorchOnWithCompletion:(id)a3;
@end

@implementation AXCameraTorchManagerBackgroundAdapter

- (AXCameraTorchManagerBackgroundAdapter)initWithCameraTorchManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AXCameraTorchManagerBackgroundAdapter;
  v6 = [(AXCameraTorchManagerBackgroundAdapter *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_synchronousManager, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.accessibility.AXCameraTorchManagerBackgroundAdapter", 0);
    q = v7->_q;
    v7->_q = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (void)openTorchDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  q = self->_q;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__AXCameraTorchManagerBackgroundAdapter_openTorchDeviceWithCompletion___block_invoke;
  v7[3] = &unk_2649A6DA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(q, v7);
}

uint64_t __71__AXCameraTorchManagerBackgroundAdapter_openTorchDeviceWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) openTorchDevice];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)closeTorchDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  q = self->_q;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__AXCameraTorchManagerBackgroundAdapter_closeTorchDeviceWithCompletion___block_invoke;
  v7[3] = &unk_2649A6DA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(q, v7);
}

uint64_t __72__AXCameraTorchManagerBackgroundAdapter_closeTorchDeviceWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) closeTorchDevice];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)turnTorchOnWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F22988] sharedInstance];
  char v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    v7 = [MEMORY[0x263F22988] identifier];
    id v8 = AXLoggerForFacility();

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = AXColorizeFormatLog();
      objc_super v11 = _AXStringForArgs();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v11;
        _os_log_impl(&dword_22D39A000, v8, v9, "%{public}@", buf, 0xCu);
      }
    }
  }
  q = self->_q;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __67__AXCameraTorchManagerBackgroundAdapter_turnTorchOnWithCompletion___block_invoke;
  v14[3] = &unk_2649A6DA0;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  dispatch_async(q, v14);
}

uint64_t __67__AXCameraTorchManagerBackgroundAdapter_turnTorchOnWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) turnTorchOn];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)turnTorchOffWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F22988] sharedInstance];
  char v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    v7 = [MEMORY[0x263F22988] identifier];
    id v8 = AXLoggerForFacility();

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = AXColorizeFormatLog();
      objc_super v11 = _AXStringForArgs();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v11;
        _os_log_impl(&dword_22D39A000, v8, v9, "%{public}@", buf, 0xCu);
      }
    }
  }
  q = self->_q;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__AXCameraTorchManagerBackgroundAdapter_turnTorchOffWithCompletion___block_invoke;
  v14[3] = &unk_2649A6DA0;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  dispatch_async(q, v14);
}

uint64_t __68__AXCameraTorchManagerBackgroundAdapter_turnTorchOffWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) turnTorchOff];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (AXCameraTorchManager)synchronousTorchManager
{
  return self->_synchronousManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronousManager, 0);
  objc_storeStrong((id *)&self->_q, 0);
}

@end