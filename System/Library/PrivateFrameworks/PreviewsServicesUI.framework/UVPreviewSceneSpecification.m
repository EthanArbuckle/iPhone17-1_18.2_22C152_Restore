@interface UVPreviewSceneSpecification
- (Class)settingsClass;
- (id)newTransitionContextOfAppropriateClass;
@end

@implementation UVPreviewSceneSpecification

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

- (id)newTransitionContextOfAppropriateClass
{
  v2 = [(UIApplicationSceneSpecification *)self transitionContextClass];

  return (id)MEMORY[0x270F9A540](v2);
}

@end