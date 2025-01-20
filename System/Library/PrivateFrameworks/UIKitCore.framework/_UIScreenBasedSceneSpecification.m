@interface _UIScreenBasedSceneSpecification
- (BOOL)isInternal;
- (BOOL)isUIKitManaged;
- (Class)lifecycleMonitorClass;
- (Class)sceneSubstrateClass;
- (Class)uiSceneMinimumClass;
- (id)connectionHandlers;
- (id)coreSceneComponentClassDictionary;
- (id)disconnectionHandlers;
- (id)uiSceneSessionRole;
@end

@implementation _UIScreenBasedSceneSpecification

- (id)coreSceneComponentClassDictionary
{
  if ([(id)UIApp isFrontBoard])
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIScreenBasedSceneSpecification;
    v3 = [(UIApplicationSceneSpecification *)&v7 coreSceneComponentClassDictionary];
    v4 = (void *)[v3 mutableCopy];

    [v4 setObject:objc_opt_class() forKeyedSubscript:@"_UIHomeAffordanceSceneNotifierComponentKey"];
    v5 = (void *)[v4 copy];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIScreenBasedSceneSpecification;
    v5 = [(UIApplicationSceneSpecification *)&v8 coreSceneComponentClassDictionary];
  }
  return v5;
}

- (id)uiSceneSessionRole
{
  return @"_UIScreenBasedSceneSession";
}

- (id)connectionHandlers
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)disconnectionHandlers
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)isUIKitManaged
{
  return 1;
}

- (Class)lifecycleMonitorClass
{
  return 0;
}

- (Class)sceneSubstrateClass
{
  return (Class)self;
}

- (Class)uiSceneMinimumClass
{
  return (Class)self;
}

- (BOOL)isInternal
{
  return 1;
}

@end