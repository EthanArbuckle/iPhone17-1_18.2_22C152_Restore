@interface UIWindowSceneSpecification
- (Class)clientSettingsClass;
- (Class)settingsClass;
- (Class)transitionContextClass;
- (id)coreSceneComponentClassDictionary;
@end

@implementation UIWindowSceneSpecification

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

- (Class)clientSettingsClass
{
  return (Class)objc_opt_class();
}

- (Class)transitionContextClass
{
  return (Class)objc_opt_class();
}

- (id)coreSceneComponentClassDictionary
{
  v5.receiver = self;
  v5.super_class = (Class)UIWindowSceneSpecification;
  v2 = [(FBSSceneSpecification *)&v5 coreSceneComponentClassDictionary];
  v3 = (void *)[v2 mutableCopy];

  [v3 setObject:objc_opt_class() forKeyedSubscript:_UIFocusSystemSceneComponentKey];
  [v3 setObject:objc_opt_class() forKeyedSubscript:0x1ED130B40];
  [v3 setObject:objc_opt_class() forKeyedSubscript:0x1ED130B20];
  return v3;
}

@end