@interface SBRecentlyUsedSceneIdentityCache
@end

@implementation SBRecentlyUsedSceneIdentityCache

id __66___SBRecentlyUsedSceneIdentityCache_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) count];
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    id v4 = (id)[v3 appendObject:*(void *)(*(void *)(a1 + 32) + 16) withName:@"recentPIDs"];
    return (id)[*(id *)(a1 + 40) appendObject:*(void *)(*(void *)(a1 + 32) + 8) withName:@"recentSceneIdentityTokensByPID"];
  }
  else
  {
    return (id)[v3 appendString:@"empty" withName:0];
  }
}

void __50___SBRecentlyUsedSceneIdentityCache_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 mutableCopy];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v6 forKey:v5];
}

@end