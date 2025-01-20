@interface SBApplicationSceneSpecification
- (Class)uiSceneMinimumClass;
- (id)baseSceneComponentClassDictionary;
- (id)defaultExtensions;
@end

@implementation SBApplicationSceneSpecification

- (id)defaultExtensions
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)SBApplicationSceneSpecification;
  v2 = [(UIApplicationSceneSpecification *)&v10 defaultExtensions];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  }
  v5 = v4;

  v11[0] = objc_opt_class();
  v6 = self;
  v11[1] = v6;
  v11[2] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];

  v8 = [v5 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (Class)uiSceneMinimumClass
{
  return (Class)self;
}

- (id)baseSceneComponentClassDictionary
{
  v5.receiver = self;
  v5.super_class = (Class)SBApplicationSceneSpecification;
  v2 = [(UIApplicationSceneSpecification *)&v5 baseSceneComponentClassDictionary];
  v3 = (void *)[v2 mutableCopy];

  [v3 setObject:objc_opt_class() forKey:*MEMORY[0x1E4F44190]];
  return v3;
}

@end