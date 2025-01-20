@interface FBSMutableSceneSettings(SBTransientLocal)
- (id)sb_displayConfigurationForSceneManagers;
- (id)sb_displayIdentityForSceneManagers;
- (void)sb_setDisplayConfigurationForSceneManagers:()SBTransientLocal;
@end

@implementation FBSMutableSceneSettings(SBTransientLocal)

- (id)sb_displayIdentityForSceneManagers
{
  v1 = objc_msgSend(a1, "sb_displayConfigurationForSceneManagers");
  v2 = [v1 identity];

  return v2;
}

- (id)sb_displayConfigurationForSceneManagers
{
  v2 = [a1 transientLocalSettings];
  v3 = [v2 objectForSetting:5796];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [a1 displayConfiguration];
  }
  v6 = v5;

  return v6;
}

- (void)sb_setDisplayConfigurationForSceneManagers:()SBTransientLocal
{
  id v4 = a3;
  id v5 = [a1 transientLocalSettings];
  [v5 setObject:v4 forSetting:5796];
}

@end