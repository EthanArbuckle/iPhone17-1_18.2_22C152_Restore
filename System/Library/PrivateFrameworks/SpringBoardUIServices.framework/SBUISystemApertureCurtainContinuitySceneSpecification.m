@interface SBUISystemApertureCurtainContinuitySceneSpecification
+ (BOOL)isSupported;
- (Class)uiSceneMinimumClass;
- (id)defaultExtensions;
- (id)uiSceneSessionRole;
@end

@implementation SBUISystemApertureCurtainContinuitySceneSpecification

+ (BOOL)isSupported
{
  BOOL v2 = 1;
  uint64_t v3 = SBFEffectiveArtworkSubtype();
  if (v3 > 2795)
  {
    if (v3 != 2796 && v3 != 2868) {
      return 0;
    }
  }
  else if (v3 != 2556 && v3 != 2622)
  {
    return 0;
  }
  return v2;
}

- (id)defaultExtensions
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)SBUISystemApertureCurtainContinuitySceneSpecification;
  BOOL v2 = [(UIApplicationSceneSpecification *)&v9 defaultExtensions];
  uint64_t v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  }
  v5 = v4;

  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v7 = [v5 arrayByAddingObjectsFromArray:v6];

  return v7;
}

- (Class)uiSceneMinimumClass
{
  return NSClassFromString(&cfstr_Sbsystemapertu_0.isa);
}

- (id)uiSceneSessionRole
{
  return @"SBUIWindowSceneSessionRoleSystemApertureContinuityCurtain";
}

@end