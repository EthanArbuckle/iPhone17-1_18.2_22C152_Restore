@interface PGPIPRemoteObjectSceneSpecification
- (BOOL)affectsAppLifecycleIfInternal;
- (BOOL)affectsScreenOrientation;
- (BOOL)isInternal;
- (id)baseSceneComponentClassDictionary;
- (id)uiSceneSessionRole;
@end

@implementation PGPIPRemoteObjectSceneSpecification

- (BOOL)isInternal
{
  return 1;
}

- (BOOL)affectsAppLifecycleIfInternal
{
  return 0;
}

- (id)uiSceneSessionRole
{
  return @"PGPictureInPictureSceneSessionRole";
}

- (id)baseSceneComponentClassDictionary
{
  v9.receiver = self;
  v9.super_class = (Class)PGPIPRemoteObjectSceneSpecification;
  v2 = [(UIApplicationSceneSpecification *)&v9 baseSceneComponentClassDictionary];
  v3 = (void *)[v2 mutableCopy];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v6 = v5;

  [v6 setObject:objc_opt_class() forKeyedSubscript:@"PGPIPProxySceneComponent"];
  v7 = (void *)[v6 copy];

  return v7;
}

- (BOOL)affectsScreenOrientation
{
  return 0;
}

@end