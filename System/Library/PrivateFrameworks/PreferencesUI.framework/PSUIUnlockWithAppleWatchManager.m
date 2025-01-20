@interface PSUIUnlockWithAppleWatchManager
+ (id)sharedInstance;
- (void)canUseWatchToUnlockWithCompletionHandler:(id)a3;
@end

@implementation PSUIUnlockWithAppleWatchManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__PSUIUnlockWithAppleWatchManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_2;
  return v2;
}

uint64_t __49__PSUIUnlockWithAppleWatchManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_2 = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x270F9A758]();
}

- (void)canUseWatchToUnlockWithCompletionHandler:(id)a3
{
  id v3 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v4 = (void *)getNRPairedDeviceRegistryClass_softClass;
  uint64_t v24 = getNRPairedDeviceRegistryClass_softClass;
  if (!getNRPairedDeviceRegistryClass_softClass)
  {
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __getNRPairedDeviceRegistryClass_block_invoke;
    v19 = &unk_264E95420;
    v20 = &v21;
    __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)&v16);
    v4 = (void *)v22[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v21, 8);
  v6 = [v5 sharedInstance];
  int v7 = [v6 isPaired];

  if (v7)
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    v8 = (void *)getSFUnlockManagerClass_softClass;
    uint64_t v24 = getSFUnlockManagerClass_softClass;
    if (!getSFUnlockManagerClass_softClass)
    {
      uint64_t v16 = MEMORY[0x263EF8330];
      uint64_t v17 = 3221225472;
      v18 = __getSFUnlockManagerClass_block_invoke;
      v19 = &unk_264E95420;
      v20 = &v21;
      __getSFUnlockManagerClass_block_invoke((uint64_t)&v16);
      v8 = (void *)v22[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v21, 8);
    v10 = [v9 sharedUnlockManager];
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    v11 = (uint64_t *)getIDSDefaultPairedDeviceSymbolLoc_ptr;
    uint64_t v24 = getIDSDefaultPairedDeviceSymbolLoc_ptr;
    if (!getIDSDefaultPairedDeviceSymbolLoc_ptr)
    {
      uint64_t v16 = MEMORY[0x263EF8330];
      uint64_t v17 = 3221225472;
      v18 = __getIDSDefaultPairedDeviceSymbolLoc_block_invoke;
      v19 = &unk_264E95420;
      v20 = &v21;
      __getIDSDefaultPairedDeviceSymbolLoc_block_invoke((uint64_t)&v16);
      v11 = (uint64_t *)v22[3];
    }
    _Block_object_dispose(&v21, 8);
    if (!v11)
    {
      v13 = (_Unwind_Exception *)-[PSUITouchIDPasscodeController enrollResult:bkIdentity:]();
      _Block_object_dispose(&v21, 8);
      _Unwind_Resume(v13);
    }
    uint64_t v12 = *v11;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __76__PSUIUnlockWithAppleWatchManager_canUseWatchToUnlockWithCompletionHandler___block_invoke;
    v14[3] = &unk_264E95628;
    id v15 = v3;
    [v10 unlockEnabledWithDevice:v12 completionHandler:v14];
  }
  else
  {
    (*((void (**)(id, void))v3 + 2))(v3, 0);
  }
}

uint64_t __76__PSUIUnlockWithAppleWatchManager_canUseWatchToUnlockWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    id v5 = NSNumber;
    id v6 = a3;
    int v7 = [v5 numberWithBool:a2];
    NSLog(&cfstr_UnlockUsingWat.isa, v7, v6);
  }
  v8 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v8();
}

@end