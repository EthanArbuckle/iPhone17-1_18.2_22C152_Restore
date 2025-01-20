@interface SBApplicationHarmonyService
+ (id)sharedInstance;
- (SBApplicationHarmonyService)init;
- (void)applicationServer:(id)a3 client:(id)a4 fetchWhitePointAdaptivityStyleForDisplayId:(unsigned int)a5 withCompletion:(id)a6;
@end

@implementation SBApplicationHarmonyService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_39 != -1) {
    dispatch_once(&sharedInstance_onceToken_39, &__block_literal_global_279);
  }
  v2 = (void *)sharedInstance___sharedInstance_21;
  return v2;
}

void __45__SBApplicationHarmonyService_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBApplicationHarmonyService);
  v1 = (void *)sharedInstance___sharedInstance_21;
  sharedInstance___sharedInstance_21 = (uint64_t)v0;
}

- (SBApplicationHarmonyService)init
{
  v5.receiver = self;
  v5.super_class = (Class)SBApplicationHarmonyService;
  v2 = [(SBApplicationHarmonyService *)&v5 init];
  if (v2)
  {
    v3 = +[SBApplicationServer sharedInstance];
    [v3 setHarmonyDelegate:v2];
  }
  return v2;
}

- (void)applicationServer:(id)a3 client:(id)a4 fetchWhitePointAdaptivityStyleForDisplayId:(unsigned int)a5 withCompletion:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  if (v10)
  {
    v11 = [MEMORY[0x1E4F624B8] sharedUIAppClientAuthenticator];
    int v12 = [v11 authenticateClient:v9];

    if (v12)
    {
      id v13 = v10;
      BSDispatchMain();
    }
    else
    {
      (*((void (**)(id, uint64_t))v10 + 2))(v10, -1);
    }
  }
}

uint64_t __114__SBApplicationHarmonyService_applicationServer_client_fetchWhitePointAdaptivityStyleForDisplayId_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = objc_msgSend(MEMORY[0x1E4F39B60], "displays", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    BOOL v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 displayId] == *(_DWORD *)(a1 + 40))
        {
          id v9 = [MEMORY[0x1E4F39B60] mainDisplay];
          BOOL v5 = v9 == v8;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);

    if (v5)
    {
      id v10 = +[SBHarmonyController sharedInstance];
      [v10 whitePointAdaptivityStyle];
    }
  }
  else
  {
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end