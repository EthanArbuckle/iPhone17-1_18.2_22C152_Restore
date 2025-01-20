@interface PVThermalMonitor
+ (id)sharedInstance;
- (BOOL)_disabledThermalTracking;
- (BOOL)_updateThermalLevelsWithToken:(int)a3;
- (BOOL)enabled;
- (BOOL)hasGoneAboveNominal;
- (BOOL)thermalLevelExceededNominal;
- (OS_dispatch_queue)queue;
- (PVThermalMonitor)init;
- (id)thermalLevelLabel;
- (int)currentThermalLevel;
- (int)highestThermalLevel;
- (int)highestThermalLevelReached;
- (int)thermalLevel;
- (void)_postNotificationPrevious:(int)a3 new:(int)a4;
- (void)_setCurrentThermalLevel:(int)a3;
- (void)setCurrentThermalLevel:(int)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHasGoneAboveNominal:(BOOL)a3;
- (void)setHighestThermalLevel:(int)a3;
- (void)setQueue:(id)a3;
@end

@implementation PVThermalMonitor

- (PVThermalMonitor)init
{
  v19.receiver = self;
  v19.super_class = (Class)PVThermalMonitor;
  v2 = [(PVThermalMonitor *)&v19 init];
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v3 bundleIdentifier];

  v5 = [NSString stringWithFormat:@"%@.PVThermalMonitor", v4];
  [(PVThermalMonitor *)v2 setHighestThermalLevel:0];
  [(PVThermalMonitor *)v2 setCurrentThermalLevel:0];
  id v6 = v5;
  dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);
  [(PVThermalMonitor *)v2 setQueue:v7];

  v2->_enabled = 1;
  v8 = [(PVThermalMonitor *)v2 queue];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = *(void *)"";
  handler[2] = __24__PVThermalMonitor_init__block_invoke;
  handler[3] = &unk_1E6169358;
  v9 = v2;
  v18 = v9;
  uint32_t v10 = notify_register_dispatch("com.apple.system.thermalpressurelevel", &-[PVThermalMonitor init]::s_token, v8, handler);

  if (v10)
  {
    v11 = 0;
  }
  else
  {
    v12 = [(PVThermalMonitor *)v9 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = *(void *)"";
    block[2] = __24__PVThermalMonitor_init__block_invoke_2;
    block[3] = &unk_1E61689B0;
    v13 = v9;
    v16 = v13;
    dispatch_async(v12, block);

    v11 = v13;
  }

  return v11;
}

uint64_t __24__PVThermalMonitor_init__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) currentThermalLevel];
  uint64_t result = [*(id *)(a1 + 32) _updateThermalLevelsWithToken:a2];
  if (result)
  {
    uint64_t v6 = [*(id *)(a1 + 32) currentThermalLevel];
    dispatch_queue_t v7 = *(void **)(a1 + 32);
    return [v7 _postNotificationPrevious:v4 new:v6];
  }
  return result;
}

uint64_t __24__PVThermalMonitor_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateThermalLevelsWithToken:-[PVThermalMonitor init]::s_token];
}

+ (id)sharedInstance
{
  if (+[PVThermalMonitor sharedInstance]::onceToken != -1) {
    dispatch_once(&+[PVThermalMonitor sharedInstance]::onceToken, &__block_literal_global_6);
  }
  v2 = (void *)+[PVThermalMonitor sharedInstance]::s_sharedInstance;

  return v2;
}

void __34__PVThermalMonitor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PVThermalMonitor);
  v1 = (void *)+[PVThermalMonitor sharedInstance]::s_sharedInstance;
  +[PVThermalMonitor sharedInstance]::s_sharedInstance = (uint64_t)v0;
}

- (BOOL)thermalLevelExceededNominal
{
  if ([(PVThermalMonitor *)self _disabledThermalTracking]) {
    return 0;
  }
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v4 = [(PVThermalMonitor *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = *(void *)"";
  v6[2] = __47__PVThermalMonitor_thermalLevelExceededNominal__block_invoke;
  v6[3] = &unk_1E6169380;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  BOOL v3 = *((unsigned char *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __47__PVThermalMonitor_thermalLevelExceededNominal__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) highestThermalLevel];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (int)thermalLevel
{
  if ([(PVThermalMonitor *)self _disabledThermalTracking]) {
    return 0;
  }
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  uint64_t v4 = [(PVThermalMonitor *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = *(void *)"";
  v6[2] = __32__PVThermalMonitor_thermalLevel__block_invoke;
  v6[3] = &unk_1E6169380;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  int v3 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __32__PVThermalMonitor_thermalLevel__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) currentThermalLevel];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)highestThermalLevelReached
{
  if ([(PVThermalMonitor *)self _disabledThermalTracking]) {
    return 0;
  }
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  uint64_t v4 = [(PVThermalMonitor *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = *(void *)"";
  v6[2] = __46__PVThermalMonitor_highestThermalLevelReached__block_invoke;
  v6[3] = &unk_1E6169380;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  int v3 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __46__PVThermalMonitor_highestThermalLevelReached__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) highestThermalLevel];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)thermalLevelLabel
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  int v3 = [(PVThermalMonitor *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = *(void *)"";
  v6[2] = __37__PVThermalMonitor_thermalLevelLabel__block_invoke;
  v6[3] = &unk_1E6169380;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __37__PVThermalMonitor_thermalLevelLabel__block_invoke(uint64_t a1)
{
  v2 = NSString;
  uint64_t v3 = [*(id *)(a1 + 32) currentThermalLevel];
  int v4 = [*(id *)(a1 + 32) _disabledThermalTracking];
  v5 = &stru_1F119C770;
  if (v4) {
    v5 = @"*";
  }
  uint64_t v6 = [v2 stringWithFormat:@"T %d%@", v3, v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (BOOL)_updateThermalLevelsWithToken:(int)a3
{
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(a3, &state64);
  if (!state) {
    [(PVThermalMonitor *)self _setCurrentThermalLevel:state64];
  }
  return state == 0;
}

- (void)_setCurrentThermalLevel:(int)a3
{
  [(PVThermalMonitor *)self setCurrentThermalLevel:*(void *)&a3];
  int v4 = [(PVThermalMonitor *)self currentThermalLevel];
  if (v4 > [(PVThermalMonitor *)self highestThermalLevel])
  {
    uint64_t v5 = [(PVThermalMonitor *)self currentThermalLevel];
    [(PVThermalMonitor *)self setHighestThermalLevel:v5];
  }
}

- (void)_postNotificationPrevious:(int)a3 new:(int)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *(void *)"";
  block[2] = __50__PVThermalMonitor__postNotificationPrevious_new___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  int v5 = a3;
  int v6 = a4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __50__PVThermalMonitor__postNotificationPrevious_new___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"PVThermalMonitorLevelChangedPreviousLevelKey";
  v2 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 32)];
  v6[1] = @"PVThermalMonitorLevelChangedNewLevelKey";
  v7[0] = v2;
  uint64_t v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 36)];
  v7[1] = v3;
  int v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"PVThermalMonitorLevelChangedNotification" object:0 userInfo:v4];
}

- (BOOL)_disabledThermalTracking
{
  return ![(PVThermalMonitor *)self enabled];
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)hasGoneAboveNominal
{
  return self->_hasGoneAboveNominal;
}

- (void)setHasGoneAboveNominal:(BOOL)a3
{
  self->_hasGoneAboveNominal = a3;
}

- (int)currentThermalLevel
{
  return self->_currentThermalLevel;
}

- (void)setCurrentThermalLevel:(int)a3
{
  self->_currentThermalLevel = a3;
}

- (int)highestThermalLevel
{
  return self->_highestThermalLevel;
}

- (void)setHighestThermalLevel:(int)a3
{
  self->_highestThermalLevel = a3;
}

- (void).cxx_destruct
{
}

@end