@interface REEngineDefaults
@end

@implementation REEngineDefaults

uint64_t __35___REEngineDefaults_globalDefaults__block_invoke()
{
  globalDefaults_GlobalDefaults = [[_REEngineDefaults alloc] initWithDomain:@"com.apple.RelevanceEngine"];
  return MEMORY[0x270F9A758]();
}

void __46___REEngineDefaults__registerCallback_forKey___block_invoke(void *a1)
{
  int v2 = [*(id *)(a1[4] + 24) containsObject:a1[5]];
  uint64_t v4 = a1[4];
  uint64_t v3 = a1[5];
  if (v2)
  {
    id v10 = [*(id *)(v4 + 32) objectForKeyedSubscript:v3];
    v5 = (void *)MEMORY[0x223C31700](a1[6]);
    [v10 addObject:v5];
  }
  else
  {
    [*(id *)(v4 + 24) addObject:v3];
    v6 = (void *)MEMORY[0x263EFF980];
    v7 = (void *)MEMORY[0x223C31700](a1[6]);
    v8 = [v6 arrayWithObject:v7];
    [*(id *)(a1[4] + 32) setObject:v8 forKeyedSubscript:a1[5]];

    v9 = *(void **)(a1[4] + 16);
    objc_msgSend(v9, "addObserver:forKeyPath:options:context:");
  }
}

void __68___REEngineDefaults_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  v1 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(void *)(a1 + 40), 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5++) + 16))();
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

@end