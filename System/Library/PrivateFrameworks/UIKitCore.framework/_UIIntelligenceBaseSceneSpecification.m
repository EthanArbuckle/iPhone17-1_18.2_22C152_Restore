@interface _UIIntelligenceBaseSceneSpecification
- (id)defaultExtensions;
- (id)uiSceneSessionRole;
@end

@implementation _UIIntelligenceBaseSceneSpecification

- (id)uiSceneSessionRole
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_UIIntelligenceLightSourceSceneSpecification.m" lineNumber:22 description:@"Subclass must override uiSceneSessionRole"];

  v7.receiver = self;
  v7.super_class = (Class)_UIIntelligenceBaseSceneSpecification;
  v5 = [(UIApplicationSceneSpecification *)&v7 uiSceneSessionRole];
  return v5;
}

- (id)defaultExtensions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v7.receiver = self;
  v7.super_class = (Class)_UIIntelligenceBaseSceneSpecification;
  v4 = [(UIApplicationSceneSpecification *)&v7 defaultExtensions];
  v5 = [v4 arrayByAddingObjectsFromArray:v3];

  return v5;
}

@end