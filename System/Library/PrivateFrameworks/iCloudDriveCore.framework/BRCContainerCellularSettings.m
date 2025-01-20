@interface BRCContainerCellularSettings
+ (id)containerCellularSettings;
- (BOOL)isCellularEnabled;
- (BRCContainerCellularSettings)initWithPersonaID:(id)a3;
- (void)_accountDidChangeForPersona:(id)a3;
- (void)dealloc;
@end

@implementation BRCContainerCellularSettings

- (void)_accountDidChangeForPersona:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__BRCContainerCellularSettings__accountDidChangeForPersona___block_invoke;
  v7[3] = &unk_26507ED98;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __60__BRCContainerCellularSettings__accountDidChangeForPersona___block_invoke()
{
  return BRPerformWithPersonaAndError();
}

void __60__BRCContainerCellularSettings__accountDidChangeForPersona___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs();
    v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
      __60__BRCContainerCellularSettings__accountDidChangeForPersona___block_invoke_2_cold_3((uint64_t)v3, (uint64_t)v4, v5);
    }
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    __brc_create_section(0, (uint64_t)"-[BRCContainerCellularSettings _accountDidChangeForPersona:]_block_invoke", 44, v12);
    id v6 = brc_bread_crumbs();
    v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __60__BRCContainerCellularSettings__accountDidChangeForPersona___block_invoke_2_cold_2();
    }

    id v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __60__BRCContainerCellularSettings__accountDidChangeForPersona___block_invoke_2_cold_1((uint64_t)v8, v9);
    }

    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void **)(v10 + 24);
    *(void *)(v10 + 24) = 0;

    __brc_leave_section(v12);
  }
}

- (BRCContainerCellularSettings)initWithPersonaID:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BRCContainerCellularSettings;
  v5 = [(BRCContainerCellularSettings *)&v22 init];
  if (v5)
  {
    id v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(v6, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.bird.cellular-settings", v7);

    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = objc_opt_new();
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = (NSOperationQueue *)v10;

    objc_initWeak(&location, v5);
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v13 = *MEMORY[0x263F32300];
    v14 = v5->_operationQueue;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __50__BRCContainerCellularSettings_initWithPersonaID___block_invoke;
    v18[3] = &unk_2650867F8;
    objc_copyWeak(&v20, &location);
    id v19 = v4;
    uint64_t v15 = [v12 addObserverForName:v13 object:0 queue:v14 usingBlock:v18];
    accountDidChangeNotificationObserver = v5->_accountDidChangeNotificationObserver;
    v5->_accountDidChangeNotificationObserver = v15;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __50__BRCContainerCellularSettings_initWithPersonaID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _accountDidChangeForPersona:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self->_accountDidChangeNotificationObserver];

  v4.receiver = self;
  v4.super_class = (Class)BRCContainerCellularSettings;
  [(BRCContainerCellularSettings *)&v4 dealloc];
}

+ (id)containerCellularSettings
{
  if (containerCellularSettings_onceToken != -1) {
    dispatch_once(&containerCellularSettings_onceToken, &__block_literal_global_62);
  }
  v2 = [MEMORY[0x263F841B0] sharedManager];
  id v3 = objc_msgSend(v2, "br_currentPersonaID");

  id v4 = (id)containerCellularSettings_cellularSettingsByPersonaID;
  objc_sync_enter(v4);
  v5 = [(id)containerCellularSettings_cellularSettingsByPersonaID objectForKeyedSubscript:v3];
  if (!v5)
  {
    v5 = [[BRCContainerCellularSettings alloc] initWithPersonaID:v3];
    [(id)containerCellularSettings_cellularSettingsByPersonaID setObject:v5 forKeyedSubscript:v3];
  }
  objc_sync_exit(v4);

  return v5;
}

void __57__BRCContainerCellularSettings_containerCellularSettings__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)containerCellularSettings_cellularSettingsByPersonaID;
  containerCellularSettings_cellularSettingsByPersonaID = v0;
}

- (BOOL)isCellularEnabled
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__BRCContainerCellularSettings_isCellularEnabled__block_invoke;
  block[3] = &unk_26507ED70;
  block[4] = self;
  dispatch_sync(queue, block);
  return [(NSNumber *)self->_isCellularEnabledForDocumentsAndData BOOLValue];
}

void __49__BRCContainerCellularSettings_isCellularEnabled__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 24))
  {
    memset(v12, 0, sizeof(v12));
    __brc_create_section(0, (uint64_t)"-[BRCContainerCellularSettings isCellularEnabled]_block_invoke", 108, v12);
    v2 = brc_bread_crumbs();
    id v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __49__BRCContainerCellularSettings_isCellularEnabled__block_invoke_cold_2();
    }

    id v4 = [MEMORY[0x263EFB210] defaultStore];
    v5 = objc_msgSend(v4, "br_accountForCurrentPersona");
    uint64_t v6 = objc_msgSend(v5, "aa_useCellularForDataclass:", *MEMORY[0x263EFB4C0]);
    uint64_t v7 = [NSNumber numberWithBool:v6];
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 24);
    *(void *)(v8 + 24) = v7;

    uint64_t v10 = brc_bread_crumbs();
    v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __49__BRCContainerCellularSettings_isCellularEnabled__block_invoke_cold_1();
    }

    __brc_leave_section(v12);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountDidChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_isCellularEnabledForDocumentsAndData, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __60__BRCContainerCellularSettings__accountDidChangeForPersona___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_23FA42000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] forcing refresh of cellular switch%@", (uint8_t *)&v2, 0xCu);
}

void __60__BRCContainerCellularSettings__accountDidChangeForPersona___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx account properties changed%@");
}

void __60__BRCContainerCellularSettings__accountDidChangeForPersona___block_invoke_2_cold_3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_23FA42000, log, (os_log_type_t)0x90u, "[ERROR] Failed to adopt persona: %@%@", (uint8_t *)&v3, 0x16u);
}

void __49__BRCContainerCellularSettings_isCellularEnabled__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] cellular is %@ for D&D%@");
}

void __49__BRCContainerCellularSettings_isCellularEnabled__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx checking if cellular is enabled for D&D%@");
}

@end