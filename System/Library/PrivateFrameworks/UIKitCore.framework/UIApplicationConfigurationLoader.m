@interface UIApplicationConfigurationLoader
@end

@implementation UIApplicationConfigurationLoader

id __70___UIApplicationConfigurationLoader_startPreloadInitializationContext__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) _loadInitializationContext];
}

void __49___UIApplicationConfigurationLoader_sharedLoader__block_invoke()
{
  id v0 = [[_UIApplicationConfigurationLoader alloc] _init];
  v1 = (void *)qword_1EB2613C8;
  qword_1EB2613C8 = (uint64_t)v0;

  v2 = *(void **)(qword_1EB2613C8 + 8);
  *(void *)(qword_1EB2613C8 + 8) = 0;
}

uint64_t __63___UIApplicationConfigurationLoader__loadInitializationContext__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __63___UIApplicationConfigurationLoader__loadInitializationContext__block_invoke_2;
  v2[3] = &unk_1E52D9CD0;
  long long v3 = *(_OWORD *)(a1 + 32);
  return __UIAPPLICATION_IS_LOADING_INITIALIZATION_INFO_FROM_THE_SYSTEM__((uint64_t)v2);
}

void __63___UIApplicationConfigurationLoader__loadInitializationContext__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) usesLocalInitializationContext])
  {
    v2 = [*(id *)(a1 + 32) _appInitializationContextFactoryClass];
    long long v3 = v2;
    if (v2)
    {
      Class v4 = NSClassFromString(v2);
      if (v4 && (objc_opt_respondsToSelector() & 1) == 0)
      {
        v5 = [MEMORY[0x1E4F28B00] currentHandler];
        [v5 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"_UIApplicationConfigurationLoader.m", 116, @"If specified to be non-null, the factory class must conform to _UIApplicationInitializationContextFactory." object file lineNumber description];
      }
    }
    else
    {
      Class v4 = 0;
    }
    uint64_t v7 = [(objc_class *)v4 _newApplicationInitializationContext];
    if (!v7)
    {
      uint64_t v7 = [MEMORY[0x1E4FB3390] defaultContext];
    }
    uint64_t v6 = v7;
  }
  else
  {
    long long v3 = (NSString *)objc_alloc_init(MEMORY[0x1E4FB33A8]);
    uint64_t v6 = [(NSString *)v3 applicationInitializationContextWithParameters:0];
    [(NSString *)v3 invalidate];
  }

  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 8);
  *(void *)(v8 + 8) = v6;
}

void __74___UIApplicationConfigurationLoader__appInitializationContextFactoryClass__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28B50] mainBundle];
  id v0 = [v3 infoDictionary];
  uint64_t v1 = [v0 objectForKey:@"UIApplicationInitializationContextFactoryClass"];
  v2 = (void *)qword_1EB2613D8;
  qword_1EB2613D8 = v1;
}

@end