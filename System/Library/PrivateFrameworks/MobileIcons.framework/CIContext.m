@interface CIContext
@end

@implementation CIContext

void __67__CIContext_IconServicesAdditions___MI_sharedIconCompositorContext__block_invoke()
{
  v11[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F00808];
  v10[0] = *MEMORY[0x263F00810];
  v10[1] = v0;
  v11[0] = MEMORY[0x263EFFA88];
  v11[1] = MEMORY[0x263EFFA80];
  uint64_t v1 = *MEMORY[0x263F00830];
  v10[2] = *MEMORY[0x263F00818];
  v10[3] = v1;
  v11[2] = &unk_26C30C648;
  v11[3] = @"MobileIcons-Scaler";
  v2 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  v3 = (void *)[objc_alloc(MEMORY[0x263F00628]) initWithOptions:v2];
  v4 = getenv("HOLD_OS_TRANSACTION_UNTIL_CICONTEXT_CACHE_CLEAR");
  if (v4 && atoi(v4))
  {
    if (_LIDefaultLog_onceToken_0 != -1) {
      dispatch_once(&_LIDefaultLog_onceToken_0, &__block_literal_global_93);
    }
    v5 = _LIDefaultLog_log_0;
    uint64_t v6 = 1;
    if (os_log_type_enabled((os_log_t)_LIDefaultLog_log_0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_210A5A000, v5, OS_LOG_TYPE_INFO, "iconservicesagent will hold an os_transaction while the scheduled CIContext cache clear is pending.", v9, 2u);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  v7 = [[LICacheClearScheduler alloc] initWithObject:v3 delay:v6 holdTransaction:&__block_literal_global_86 clearHandler:5.0];
  v8 = (void *)_MI_sharedIconCompositorContext_contextCacheClearScheduler;
  _MI_sharedIconCompositorContext_contextCacheClearScheduler = (uint64_t)v7;
}

uint64_t __67__CIContext_IconServicesAdditions___MI_sharedIconCompositorContext__block_invoke_83(uint64_t a1, void *a2)
{
  return [a2 clearCaches];
}

@end