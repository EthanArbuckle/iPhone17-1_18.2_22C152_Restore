@interface SBUISystemApertureSceneSpecification
- (BOOL)affectsAppLifecycleIfInternal;
- (BOOL)allowsConfigurationByAppDelegate;
- (BOOL)isInternal;
- (id)baseSceneComponentClassDictionary;
- (id)uiSceneSessionRole;
@end

@implementation SBUISystemApertureSceneSpecification

- (BOOL)isInternal
{
  return 1;
}

- (BOOL)affectsAppLifecycleIfInternal
{
  return 1;
}

- (BOOL)allowsConfigurationByAppDelegate
{
  return 0;
}

- (id)baseSceneComponentClassDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)SBUISystemApertureSceneSpecification;
  v2 = [(UIApplicationSceneSpecification *)&v7 baseSceneComponentClassDictionary];
  v3 = v2;
  if (v2) {
    id v4 = (id)[v2 mutableCopy];
  }
  else {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v5 = v4;
  [v4 setObject:objc_opt_class() forKey:@"SBUISystemApertureElementSourceKey"];

  return v5;
}

- (id)uiSceneSessionRole
{
  return @"SBUISystemApertureSceneSessionRole";
}

@end