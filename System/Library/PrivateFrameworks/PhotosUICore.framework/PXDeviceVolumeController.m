@interface PXDeviceVolumeController
+ (PXDeviceVolumeController)sharedInstance;
- (PXDeviceVolumeController)initWithIsInSilentMode:(BOOL)a3;
- (id)_initAsSharedInstance;
- (void)_handleSystemVolumeChange:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation PXDeviceVolumeController

- (void).cxx_destruct
{
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = NSStringFromSelector(sel_simulateSilentMode);
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__PXDeviceVolumeController_settings_changedValueForKey___block_invoke;
    v11[3] = &unk_1E5DC9948;
    v13 = self;
    SEL v14 = a2;
    id v12 = v7;
    [(PXVolumeController *)self performChanges:v11];
  }
}

void __56__PXDeviceVolumeController_settings_changedValueForKey___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setIsInSilentMode:", objc_msgSend(v4, "simulateSilentMode"));
}

- (void)_handleSystemVolumeChange:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 userInfo];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138412290;
    v17 = v4;
    _os_log_debug_impl(&dword_1A9AE7000, log, OS_LOG_TYPE_DEBUG, "volume changed %@", (uint8_t *)&v16, 0xCu);
  }
  v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F74AF0]];
  [v6 floatValue];
  float v8 = v7;

  v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F74AE0]];
  char v10 = [v9 isEqual:@"ExplicitVolumeChange"];

  if (v10)
  {
    v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      v17 = v4;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "explicit volume change %@", (uint8_t *)&v16, 0xCu);
    }
    float lastKnownVolume = self->_lastKnownVolume;
    if (v8 == 1.0 || v8 > lastKnownVolume)
    {
      SEL v14 = &__block_literal_global_21_238828;
LABEL_18:
      [(PXVolumeController *)self performChanges:v14];
      goto LABEL_19;
    }
    if (v8 == 0.0 || v8 < lastKnownVolume)
    {
      SEL v14 = &__block_literal_global_23_238829;
      goto LABEL_18;
    }
  }
LABEL_19:
  self->_float lastKnownVolume = v8;
}

uint64_t __54__PXDeviceVolumeController__handleSystemVolumeChange___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 decreaseVolume];
}

uint64_t __54__PXDeviceVolumeController__handleSystemVolumeChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 increaseVolume];
}

- (id)_initAsSharedInstance
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v4 = objc_claimAutoreleasedReturnValue();
  v5 = (const char *)[v4 UTF8String];

  v6 = os_log_create((const char *)*MEMORY[0x1E4F8C518], v5);
  float v7 = [MEMORY[0x1E4F74F68] sharedInstance];
  float v35 = 0.0;
  id v34 = 0;
  int v8 = [v7 getActiveCategoryVolume:&v35 andName:&v34];
  id v9 = v34;
  if (v8)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(double *)&buf[4] = v35;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "active category volume %f name %{public}@", buf, 0x16u);
    }
    float v10 = v35;
  }
  else
  {
    float v10 = 0.0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "failed to get active category volume", buf, 2u);
    }
  }
  v11 = +[PXKitSettings sharedInstance];
  if (([v11 honorSilentMode] & 1) == 0)
  {
    uint64_t v12 = 0;
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    v13 = "ignoring silent mode";
    goto LABEL_14;
  }
  if ([v11 simulateSilentMode])
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "simulated silent mode", buf, 2u);
    }
    uint64_t v12 = 1;
    goto LABEL_21;
  }
  if (PLPhysicalDeviceIsIPad())
  {
    uint64_t v12 = 0;
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    v13 = "device has no physical ringer switch";
LABEL_14:
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
    uint64_t v12 = 0;
    goto LABEL_21;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  int v39 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PXDeviceVolumeController__initAsSharedInstance__block_invoke;
  aBlock[3] = &unk_1E5DC98B8;
  v33 = buf;
  SEL v14 = v6;
  v32 = v14;
  v15 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  uint64_t v16 = *(void *)&buf[8];
  id v17 = MEMORY[0x1E4F14428];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __49__PXDeviceVolumeController__initAsSharedInstance__block_invoke_10;
  handler[3] = &unk_1E5DC9900;
  uint64_t v18 = v15;
  id v28 = v18;
  v19 = v14;
  v27 = v19;
  objc_copyWeak(&v29, &location);
  notify_register_dispatch("com.apple.springboard.ringerstate", (int *)(v16 + 24), MEMORY[0x1E4F14428], handler);

  uint64_t v12 = v18[2](v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v36 = 67109120;
    int v37 = v12;
    _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_DEFAULT, "ringer muted %i", v36, 8u);
  }
  objc_destroyWeak(&v29);

  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);
LABEL_21:
  v25.receiver = self;
  v25.super_class = (Class)PXDeviceVolumeController;
  v20 = [(PXVolumeController *)&v25 initWithIsInSilentMode:v12];
  v21 = v20;
  if (v20)
  {
    log = v20->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v12;
      *(_WORD *)&buf[8] = 2048;
      *(double *)&buf[10] = v10;
      _os_log_impl(&dword_1A9AE7000, log, OS_LOG_TYPE_DEFAULT, "initialized muted %i volume %f", buf, 0x12u);
    }
    objc_storeStrong((id *)&v21->_log, v6);
    v21->_float lastKnownVolume = v10;
    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v21 selector:sel__handleSystemVolumeChange_ name:*MEMORY[0x1E4F74ED8] object:v7];

    [v11 addDeferredKeyObserver:v21];
  }

  return v21;
}

BOOL __49__PXDeviceVolumeController__initAsSharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), &state64);
  if (state)
  {
    uint32_t v3 = state;
    id v4 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v11 = v3;
      _os_log_error_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_ERROR, "failed to get ringer state %i", buf, 8u);
    }
    return 0;
  }
  else
  {
    uint64_t v6 = state64;
    BOOL v5 = state64 == 0;
    float v7 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v11 = v6 == 0;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "ringer state is on mute %i", buf, 8u);
    }
  }
  return v5;
}

void __49__PXDeviceVolumeController__initAsSharedInstance__block_invoke_10(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  uint32_t v3 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v8 = v2;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "ringer changed to muted %i", buf, 8u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__PXDeviceVolumeController__initAsSharedInstance__block_invoke_11;
  v5[3] = &__block_descriptor_33_e37_v16__0___PXMutableVolumeController__8l;
  char v6 = v2;
  [WeakRetained performChanges:v5];
}

uint64_t __49__PXDeviceVolumeController__initAsSharedInstance__block_invoke_11(uint64_t a1, void *a2)
{
  return [a2 setIsInSilentMode:*(unsigned __int8 *)(a1 + 32)];
}

- (PXDeviceVolumeController)initWithIsInSilentMode:(BOOL)a3
{
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXDeviceVolumeController.m", 48, @"%s is not available as initializer", "-[PXDeviceVolumeController initWithIsInSilentMode:]");

  abort();
}

+ (PXDeviceVolumeController)sharedInstance
{
  if (sharedInstance_onceToken_238866 != -1) {
    dispatch_once(&sharedInstance_onceToken_238866, &__block_literal_global_238867);
  }
  int v2 = (void *)sharedInstance_sharedInstance_238868;
  return (PXDeviceVolumeController *)v2;
}

void __42__PXDeviceVolumeController_sharedInstance__block_invoke()
{
  id v0 = [[PXDeviceVolumeController alloc] _initAsSharedInstance];
  v1 = (void *)sharedInstance_sharedInstance_238868;
  sharedInstance_sharedInstance_238868 = (uint64_t)v0;
}

@end