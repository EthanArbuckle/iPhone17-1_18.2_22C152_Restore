@interface LTDLanguageAssetCache
@end

@implementation LTDLanguageAssetCache

uint64_t __32___LTDLanguageAssetCache_shared__block_invoke()
{
  shared__cache = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

uint64_t __44___LTDLanguageAssetCache_setRequiredAssets___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

BOOL __46___LTDLanguageAssetCache_assetsFilteredUsing___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = [v3 ltIdentifier];
  if ([v4 containsObject:v5])
  {
    v6 = [v3 progress];
    BOOL v7 = [v6 offlineState] == 2;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __46___LTDLanguageAssetCache_assetsFilteredUsing___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 ltIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

id __45___LTDLanguageAssetCache__multicastObservers__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F1C0E8];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 locale];
  v6 = [v3 progress];
  [v6 fractionCompleted];
  double v8 = v7;
  uint64_t v9 = [v3 state];

  v10 = (void *)[v4 initWithLocale:v5 progress:v9 status:v8];
  return v10;
}

id __45___LTDLanguageAssetCache__multicastObservers__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F1C0E8];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 locale];
  uint64_t v6 = [v3 status];

  double v7 = (void *)[v4 initWithLocale:v5 progress:v6 status:0.0];
  return v7;
}

@end