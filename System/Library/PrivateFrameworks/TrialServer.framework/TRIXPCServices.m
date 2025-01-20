@interface TRIXPCServices
+ (void)registerAllServicesWithPromise:(id)a3;
+ (void)registerSystemService;
@end

@implementation TRIXPCServices

+ (void)registerAllServicesWithPromise:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__TRIXPCServices_registerAllServicesWithPromise___block_invoke;
  block[3] = &unk_1E6BB82F8;
  id v7 = v3;
  uint64_t v4 = registerAllServicesWithPromise___pasOnceToken2;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&registerAllServicesWithPromise___pasOnceToken2, block);
  }
}

void __49__TRIXPCServices_registerAllServicesWithPromise___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E016E7F0]();
  id v3 = (void *)MEMORY[0x1E4F93BC8];
  uint64_t v4 = [[TRIXPCInternalServiceListener alloc] initWithServerContextPromise:*(void *)(a1 + 32)];
  [v3 registerForService:@"com.apple.triald.internal" delegate:v4];

  id v5 = (void *)MEMORY[0x1E4F93BC8];
  v6 = [[TRIXPCNamespaceManagementServiceListener alloc] initWithServerContextPromise:*(void *)(a1 + 32)];
  [v5 registerForService:@"com.apple.triald.namespace-management" delegate:v6];

  id v7 = (void *)MEMORY[0x1E4F93BC8];
  v8 = [[TRIXPCStatusServiceListener alloc] initWithPromise:*(void *)(a1 + 32)];
  [v7 registerForService:@"com.apple.trial.status" delegate:v8];
}

+ (void)registerSystemService
{
  if (registerSystemService__pasOnceToken3 != -1) {
    dispatch_once(&registerSystemService__pasOnceToken3, &__block_literal_global_17);
  }
}

void __39__TRIXPCServices_registerSystemService__block_invoke()
{
  v0 = (void *)MEMORY[0x1E016E7F0]();
  v1 = (void *)MEMORY[0x1E4F93BC8];
  v2 = objc_alloc_init(TRIXPCInternalSystemServiceListener);
  [v1 registerForService:@"com.apple.triald.system.internal" delegate:v2];
}

@end