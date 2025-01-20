@interface PowerUIBrightnessController
+ (id)sharedInstance;
- (BOOL)mitigationEngaged;
- (BrightnessSystemClient)bClient;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (PowerUIBrightnessController)init;
- (void)engageMitigation;
- (void)resetMitigation;
- (void)setBClient:(id)a3;
- (void)setLog:(id)a3;
- (void)setMitigationEngaged:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)start;
@end

@implementation PowerUIBrightnessController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_9);
  }
  v2 = (void *)sharedInstance_brightnessController;
  return v2;
}

uint64_t __45__PowerUIBrightnessController_sharedInstance__block_invoke()
{
  sharedInstance_brightnessController = objc_alloc_init(PowerUIBrightnessController);
  return MEMORY[0x270F9A758]();
}

- (PowerUIBrightnessController)init
{
  v9.receiver = self;
  v9.super_class = (Class)PowerUIBrightnessController;
  v2 = [(PowerUIBrightnessController *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.powerui.brightnessController", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    os_log_t v6 = os_log_create("com.apple.powerui", "brightnessController");
    log = v2->_log;
    v2->_log = (OS_os_log *)v6;
  }
  return v2;
}

- (void)start
{
  self->_bClient = (BrightnessSystemClient *)objc_opt_new();
  MEMORY[0x270F9A758]();
}

- (void)resetMitigation
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__PowerUIBrightnessController_resetMitigation__block_invoke;
  block[3] = &unk_2645A5CF0;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __46__PowerUIBrightnessController_resetMitigation__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 8))
  {
    uint64_t v2 = result;
    [*(id *)(v1 + 32) setProperty:&unk_26D385DE0 forKey:@"EcoModeFactorUpdate"];
    result = [*(id *)(*(void *)(v2 + 32) + 32) setProperty:MEMORY[0x263EFFA80] forKey:@"EcoMode"];
    uint64_t v1 = *(void *)(v2 + 32);
  }
  *(unsigned char *)(v1 + 8) = 0;
  return result;
}

- (void)engageMitigation
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__PowerUIBrightnessController_engageMitigation__block_invoke;
  block[3] = &unk_2645A5CF0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __47__PowerUIBrightnessController_engageMitigation__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) copyPropertyForKey:@"DisplayBrightness"];
  v3 = [v2 objectForKeyedSubscript:@"Brightness"];

  uint64_t v4 = *(void *)(a1 + 32);
  if (!v3)
  {
    objc_super v9 = [(id)v4 log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __47__PowerUIBrightnessController_engageMitigation__block_invoke_cold_1(v9);
    }
    goto LABEL_18;
  }
  if (!*(unsigned char *)(v4 + 8))
  {
    *(unsigned char *)(v4 + 8) = 1;
    uint64_t v4 = *(void *)(a1 + 32);
  }
  int v5 = [*(id *)(v4 + 32) setProperty:&unk_26D385DF0 forKey:@"EcoModeFactorUpdate"];
  os_log_t v6 = [*(id *)(a1 + 32) log];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7) {
      goto LABEL_12;
    }
    int v14 = 138412290;
    v15 = &unk_26D385DF0;
    v8 = "Success: Setting brightness reduction factor to %@";
  }
  else
  {
    if (!v7) {
      goto LABEL_12;
    }
    int v14 = 138412290;
    v15 = &unk_26D385DF0;
    v8 = "Failed: Setting brightness reduction factor to %@";
  }
  _os_log_impl(&dword_22135E000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, 0xCu);
LABEL_12:

  v10 = (void *)MEMORY[0x263EFFA88];
  int v11 = [*(id *)(*(void *)(a1 + 32) + 32) setProperty:MEMORY[0x263EFFA88] forKey:@"EcoMode"];
  objc_super v9 = [*(id *)(a1 + 32) log];
  BOOL v12 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v12)
    {
      int v14 = 138412290;
      v15 = v10;
      v13 = "Success: Setting EcodMode to %@";
LABEL_17:
      _os_log_impl(&dword_22135E000, v9, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v14, 0xCu);
    }
  }
  else if (v12)
  {
    int v14 = 138412290;
    v15 = v10;
    v13 = "Failed: Setting EcodMode to %@";
    goto LABEL_17;
  }
LABEL_18:
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (BrightnessSystemClient)bClient
{
  return self->_bClient;
}

- (void)setBClient:(id)a3
{
}

- (BOOL)mitigationEngaged
{
  return self->_mitigationEngaged;
}

- (void)setMitigationEngaged:(BOOL)a3
{
  self->_mitigationEngaged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bClient, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __47__PowerUIBrightnessController_engageMitigation__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_22135E000, log, OS_LOG_TYPE_ERROR, "Brightness string is null", v1, 2u);
}

@end