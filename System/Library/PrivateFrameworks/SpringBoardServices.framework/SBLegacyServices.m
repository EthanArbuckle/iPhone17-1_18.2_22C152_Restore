@interface SBLegacyServices
+ (id)workloop;
+ (void)_configure;
+ (void)checkInPorts;
+ (void)setFunction:(void *)a3 forSymbol:(const char *)a4;
+ (void)start;
@end

@implementation SBLegacyServices

+ (void)_configure
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__SBLegacyServices__configure__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_configure_onceToken != -1) {
    dispatch_once(&_configure_onceToken, block);
  }
}

uint64_t __30__SBLegacyServices__configure__block_invoke(uint64_t a1)
{
  dispatch_workloop_t inactive = dispatch_workloop_create_inactive("SBMigServices");
  v3 = (void *)__SharedWorkloop;
  __SharedWorkloop = (uint64_t)inactive;

  dispatch_workloop_set_autorelease_frequency((dispatch_workloop_t)__SharedWorkloop, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)__SharedWorkloop);
  [*(id *)(a1 + 32) checkInPorts];
  __FunctionMap = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:770 valueOptions:258];
  return MEMORY[0x1F41817F8]();
}

+ (void)checkInPorts
{
  if (checkInPorts_onceToken != -1) {
    dispatch_once(&checkInPorts_onceToken, &__block_literal_global_57);
  }
}

void __32__SBLegacyServices_checkInPorts__block_invoke()
{
  long long v3 = 0u;
  *(void *)&long long v1 = 0;
  v0 = "com.apple.springboard.services";
  bootstrap_check_in2();
  *((void *)&v2 + 1) = SpringBoardUser_server;
  *((void *)&v1 + 1) = 2112;
  *(void *)&long long v2 = _SBMigSpringBoardUser_subsystem;
  __copy_assignment_8_8_t0w40_s40_s48((uint64_t)&__ForegroundMigService, (long long *)&v0);

  long long v2 = 0u;
  long long v3 = 0u;
  long long v1 = 0u;
  v0 = "com.apple.springboard.blockableservices";
  bootstrap_check_in2();
  *(void *)&long long v2 = _SBMigSpringBoardUser_subsystem;
  *((void *)&v2 + 1) = SpringBoardUser_server;
  *((void *)&v1 + 1) = 2112;
  __copy_assignment_8_8_t0w40_s40_s48((uint64_t)&__ForegroundBlockableMigService, (long long *)&v0);

  long long v2 = 0u;
  long long v3 = 0u;
  long long v1 = 0u;
  v0 = "com.apple.springboard.backgroundappservices";
  bootstrap_check_in2();
  *((void *)&v2 + 1) = SpringBoardUtility_server;
  *((void *)&v1 + 1) = 2096;
  *(void *)&long long v2 = _SBMigSpringBoardUtility_subsystem;
  __copy_assignment_8_8_t0w40_s40_s48((uint64_t)&__BackgroundMigService, (long long *)&v0);
}

+ (void)start
{
  [a1 _configure];
  long long v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long v3 = 0;
    _os_log_impl(&dword_18FBC5000, v2, OS_LOG_TYPE_INFO, "[SBMig] Starting services.", v3, 2u);
  }

  dispatch_async((dispatch_queue_t)__SharedWorkloop, &__block_literal_global_9_1);
}

void __25__SBLegacyServices_start__block_invoke()
{
  SBMachServiceInitialize((uint64_t)&__ForegroundMigService);
  SBMachServiceInitialize((uint64_t)&__ForegroundBlockableMigService);
  SBMachServiceInitialize((uint64_t)&__BackgroundMigService);
}

+ (id)workloop
{
  [a1 _configure];
  long long v2 = (void *)__SharedWorkloop;
  return v2;
}

+ (void)setFunction:(void *)a3 forSymbol:(const char *)a4
{
  [a1 _configure];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__SBLegacyServices_setFunction_forSymbol___block_invoke;
  v6[3] = &__block_descriptor_48_e5_v8__0l;
  v6[4] = a4;
  v6[5] = a3;
  dispatch_async((dispatch_queue_t)__SharedWorkloop, v6);
}

void __42__SBLegacyServices_setFunction_forSymbol___block_invoke(uint64_t a1)
{
  long long v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __42__SBLegacyServices_setFunction_forSymbol___block_invoke_cold_1(a1, v2);
  }

  NSMapInsert((NSMapTable *)__FunctionMap, *(const void **)(a1 + 32), *(const void **)(a1 + 40));
}

void __42__SBLegacyServices_setFunction_forSymbol___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 136446466;
  uint64_t v5 = v2;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_18FBC5000, a2, OS_LOG_TYPE_DEBUG, "[SBMig] Host caching implementation of %{public}s at %p", (uint8_t *)&v4, 0x16u);
}

@end