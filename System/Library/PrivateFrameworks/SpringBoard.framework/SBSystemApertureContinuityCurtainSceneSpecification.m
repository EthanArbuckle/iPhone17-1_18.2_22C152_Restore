@interface SBSystemApertureContinuityCurtainSceneSpecification
- (Class)uiSceneMinimumClass;
- (id)defaultExtensions;
- (id)uiSceneSessionRole;
@end

@implementation SBSystemApertureContinuityCurtainSceneSpecification

- (id)defaultExtensions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)SBSystemApertureContinuityCurtainSceneSpecification;
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
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v7 = [v5 arrayByAddingObjectsFromArray:v6];

  return v7;
}

- (Class)uiSceneMinimumClass
{
  return (Class)self;
}

- (id)uiSceneSessionRole
{
  return @"SBWindowSceneSessionRoleSystemApertureContinuityCurtain";
}

@end