@interface UIMutableApplicationSceneSettings(PGTransientLocal)
- (uint64_t)pg_hasVisiblePIPContent;
- (void)setPg_hasVisiblePIPContent:()PGTransientLocal;
@end

@implementation UIMutableApplicationSceneSettings(PGTransientLocal)

- (uint64_t)pg_hasVisiblePIPContent
{
  v1 = [a1 transientLocalSettings];
  v2 = [v1 objectForSetting:4821];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (void)setPg_hasVisiblePIPContent:()PGTransientLocal
{
  id v5 = [a1 transientLocalSettings];
  v4 = [NSNumber numberWithBool:a3];
  [v5 setObject:v4 forSetting:4821];
}

@end