@interface APSigningAuthorityPoolManager
+ (id)sharedInstance;
@end

@implementation APSigningAuthorityPoolManager

+ (id)sharedInstance
{
  id v2 = a1;
  objc_sync_enter(v2);
  v3 = +[APUniversalSingleton sharedInstance];
  id v4 = [v3 signingAuthorityPoolManager];

  if (!v4)
  {
    id v4 = [objc_alloc((Class)APSigningAuthorityPoolManager) initWithName:@"pcd_default_pool" poolSize:2 numberToStash:2 setupCompletion:&stru_10022E458];
    v5 = +[APUniversalSingleton sharedInstance];
    [v5 setSigningAuthorityPoolManager:v4];
  }
  objc_sync_exit(v2);

  return v4;
}

@end