@interface SHSheetRemoteSceneSpecification
- (id)defaultExtensions;
- (id)uiSceneSessionRole;
@end

@implementation SHSheetRemoteSceneSpecification

- (id)uiSceneSessionRole
{
  return @"UISceneSessionRoleShareSheet";
}

- (id)defaultExtensions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v8[0] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v7.receiver = self;
  v7.super_class = (Class)SHSheetRemoteSceneSpecification;
  v4 = [(_UISceneHostingSceneSpecification *)&v7 defaultExtensions];
  v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

@end