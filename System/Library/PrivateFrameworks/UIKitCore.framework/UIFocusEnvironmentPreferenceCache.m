@interface UIFocusEnvironmentPreferenceCache
@end

@implementation UIFocusEnvironmentPreferenceCache

uint64_t __82___UIFocusEnvironmentPreferenceCache_preferredEnvironmentsForEnvironment_isFinal___block_invoke(uint64_t a1, void *a2)
{
  return [a2 environment];
}

_UIFocusEnvironmentPreferenceCacheNode *__78___UIFocusEnvironmentPreferenceCache_setPreferredEnvironments_forEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(id *)(a1 + 32) == v3)
  {
    v5 = 0;
  }
  else
  {
    v4 = [*(id *)(a1 + 40) environmentsMap];
    v5 = [v4 objectForKey:v3];

    if (!v5)
    {
      v5 = [[_UIFocusEnvironmentPreferenceCacheNode alloc] initWithEnvironment:v3];
      v6 = [*(id *)(a1 + 40) environmentsMap];
      [v6 setObject:v5 forKey:v3];
    }
  }

  return v5;
}

@end