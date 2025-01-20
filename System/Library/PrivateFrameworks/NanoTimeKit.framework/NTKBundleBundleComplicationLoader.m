@interface NTKBundleBundleComplicationLoader
@end

@implementation NTKBundleBundleComplicationLoader

void __56___NTKBundleBundleComplicationLoader__enumerateBundles___block_invoke()
{
  v0 = objc_alloc_init(NTKBundleLoader);
  v1 = (void *)_enumerateBundles____complicationBundleLoader;
  _enumerateBundles____complicationBundleLoader = (uint64_t)v0;
}

uint64_t __56___NTKBundleBundleComplicationLoader__enumerateBundles___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isLoaded]) {
    goto LABEL_4;
  }
  uint64_t v4 = [v3 objectForInfoDictionaryKey:@"NSPrincipalClass"];
  if (v4)
  {
    v5 = (void *)v4;
    [v3 load];

LABEL_4:
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
    }
    uint64_t v7 = 1;
    goto LABEL_7;
  }
  v9 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    __41__NTKFaceBundleLoader__enumerateBundles___block_invoke_cold_1(v3, v9);
  }

  uint64_t v7 = 0;
LABEL_7:

  return v7;
}

void __61___NTKBundleBundleComplicationLoader__loadClassesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = NTKBundleComplicationDataSourceClassesFromBundle(a2);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

@end