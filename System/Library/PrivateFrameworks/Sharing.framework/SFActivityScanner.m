@interface SFActivityScanner
- (NSUUID)identifier;
- (SFActivityScanner)init;
- (SFActivityScanner)initWithDelegate:(id)a3;
- (SFActivityScannerDelegate)delegate;
- (void)activityPayloadFromDevice:(id)a3 forAdvertisementPayload:(id)a4 command:(id)a5 timeout:(int64_t)a6 withCompletionHandler:(id)a7;
- (void)dealloc;
- (void)scanForTypes:(unint64_t)a3;
- (void)scanManager:(id)a3 foundDeviceWithDevice:(id)a4;
- (void)scanManager:(id)a3 lostDeviceWithDevice:(id)a4;
- (void)scanManager:(id)a3 pairedDevicesChanged:(id)a4;
- (void)scanManager:(id)a3 receivedAdvertisement:(id)a4;
- (void)setIdentifier:(id)a3;
@end

@implementation SFActivityScanner

- (SFActivityScanner)init
{
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"%s: should never be used.", "-[SFActivityScanner init]");

  return [(SFActivityScanner *)self initWithDelegate:0];
}

- (SFActivityScanner)initWithDelegate:(id)a3
{
  v4 = (SFActivityScannerDelegate *)a3;
  v5 = +[SFContinuityScanManager sharedManager];

  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)SFActivityScanner;
    v6 = [(SFActivityScanner *)&v10 init];
    v7 = v6;
    if (v6)
    {
      v6->_delegate = v4;
      v8 = +[SFContinuityScanManager sharedManager];
      [v8 addObserver:v7];
    }
    self = v7;
    v5 = self;
  }

  return v5;
}

- (void)dealloc
{
  v3 = +[SFContinuityScanManager sharedManager];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SFActivityScanner;
  [(SFActivityScanner *)&v4 dealloc];
}

- (SFActivityScannerDelegate)delegate
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_delegate;
  objc_sync_exit(v2);

  return v3;
}

- (void)scanForTypes:(unint64_t)a3
{
  id v4 = +[SFContinuityScanManager sharedManager];
  [v4 scanForTypes:a3];
}

- (void)activityPayloadFromDevice:(id)a3 forAdvertisementPayload:(id)a4 command:(id)a5 timeout:(int64_t)a6 withCompletionHandler:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = +[SFContinuityScanManager sharedManager];
  v16 = [v14 uniqueID];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __109__SFActivityScanner_activityPayloadFromDevice_forAdvertisementPayload_command_timeout_withCompletionHandler___block_invoke;
  v18[3] = &unk_1E5BBDEF8;
  id v19 = v11;
  id v17 = v11;
  [v15 activityPayloadFromDeviceUniqueID:v16 forAdvertisementPayload:v13 command:v12 timeout:a6 withCompletionHandler:v18];
}

void __109__SFActivityScanner_activityPayloadFromDevice_forAdvertisementPayload_command_timeout_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__SFActivityScanner_activityPayloadFromDevice_forAdvertisementPayload_command_timeout_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5BBD838;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __109__SFActivityScanner_activityPayloadFromDevice_forAdvertisementPayload_command_timeout_withCompletionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)scanManager:(id)a3 receivedAdvertisement:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SFActivityScanner_scanManager_receivedAdvertisement___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __55__SFActivityScanner_scanManager_receivedAdvertisement___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 8);
    return objc_msgSend(v3, "activityScanner:receivedAdvertisement:");
  }
  return result;
}

- (void)scanManager:(id)a3 foundDeviceWithDevice:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SFActivityScanner_scanManager_foundDeviceWithDevice___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __55__SFActivityScanner_scanManager_foundDeviceWithDevice___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 8);
    return objc_msgSend(v3, "activityScanner:foundDeviceWithDevice:");
  }
  return result;
}

- (void)scanManager:(id)a3 lostDeviceWithDevice:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SFActivityScanner_scanManager_lostDeviceWithDevice___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __54__SFActivityScanner_scanManager_lostDeviceWithDevice___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 8);
    return objc_msgSend(v3, "activityScanner:lostDeviceWithDevice:");
  }
  return result;
}

- (void)scanManager:(id)a3 pairedDevicesChanged:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SFActivityScanner_scanManager_pairedDevicesChanged___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __54__SFActivityScanner_scanManager_pairedDevicesChanged___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 8);
    return objc_msgSend(v3, "activityScanner:pairedDevicesChanged:");
  }
  return result;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end