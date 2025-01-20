@interface BYXPCActivityRegistrar
+ (id)sharedInstance;
- (void)registerActivityWithIdentifier:(const char *)a3 criteria:(id)a4 handler:(id)a5;
- (void)unregisterActivityWithIdentifier:(const char *)a3;
@end

@implementation BYXPCActivityRegistrar

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __40__BYXPCActivityRegistrar_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(BYXPCActivityRegistrar);
  return MEMORY[0x1F41817F8]();
}

- (void)registerActivityWithIdentifier:(const char *)a3 criteria:(id)a4 handler:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  v9 = _BYLoggingFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = a3;
    _os_log_impl(&dword_1A7DED000, v9, OS_LOG_TYPE_DEFAULT, "Registering activity: %s", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__BYXPCActivityRegistrar_registerActivityWithIdentifier_criteria_handler___block_invoke;
  v11[3] = &unk_1E5D2BB80;
  id v12 = v7;
  v13 = a3;
  id v10 = v7;
  xpc_activity_register(a3, v8, v11);
}

void __74__BYXPCActivityRegistrar_registerActivityWithIdentifier_criteria_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 136315138;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_DEFAULT, "Running activity handler: %s", (uint8_t *)&v7, 0xCu);
  }

  v6 = +[BYXPCActivity activityWithXPCActivity:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unregisterActivityWithIdentifier:(const char *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = a3;
    _os_log_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_DEFAULT, "Unregistering activity: %s", (uint8_t *)&v5, 0xCu);
  }

  xpc_activity_unregister(a3);
}

@end