@interface SBUIContinuitySceneSpecification
- (Class)uiSceneMinimumClass;
- (id)baseSceneComponentClassDictionary;
- (id)defaultExtensions;
- (id)uiSceneSessionRole;
@end

@implementation SBUIContinuitySceneSpecification

- (id)defaultExtensions
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)SBUIContinuitySceneSpecification;
  v2 = [(UIApplicationSceneSpecification *)&v9 defaultExtensions];
  v3 = v2;
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
  return NSClassFromString(&cfstr_Sbwindowscene.isa);
}

- (id)baseSceneComponentClassDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)SBUIContinuitySceneSpecification;
  v2 = [(UIApplicationSceneSpecification *)&v6 baseSceneComponentClassDictionary];
  v3 = (void *)[v2 mutableCopy];

  Class v4 = NSClassFromString(&cfstr_Sbwindowscenes.isa);
  if (v4) {
    [v3 setObject:v4 forKey:*MEMORY[0x1E4F44190]];
  }
  return v3;
}

- (id)uiSceneSessionRole
{
  return @"SBUIWindowSceneSessionRoleContinuity";
}

@end