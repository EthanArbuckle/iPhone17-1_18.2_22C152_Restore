@interface _SBActiveRemoteTransientOverlayViewProviderRegistry
+ (id)sharedInstance;
- (_SBActiveRemoteTransientOverlayViewProviderRegistry)init;
- (void)registerViewProvider:(id)a3;
- (void)unregisterViewProvider:(id)a3;
@end

@implementation _SBActiveRemoteTransientOverlayViewProviderRegistry

- (void)registerViewProvider:(id)a3
{
  id v7 = a3;
  v4 = [v7 sceneHandle];
  v5 = [v4 sceneIdentifier];

  v6 = [(NSMapTable *)self->_viewProviderAdapterForSceneIdentifier objectForKey:v5];
  if (!v6)
  {
    v6 = objc_alloc_init(_SBActiveRemoteTransientOverlayViewProviderAdapter);
    [(NSMapTable *)self->_viewProviderAdapterForSceneIdentifier setObject:v6 forKey:v5];
    [(id)SBApp registerRemoteAlertSceneViewProvider:v6];
  }
  if ([v7 handlesSceneBackedRemoteTransientOverlaysOnly]) {
    [(_SBActiveRemoteTransientOverlayViewProviderAdapter *)v6 setSceneBackedProvider:v7];
  }
  else {
    [(_SBActiveRemoteTransientOverlayViewProviderAdapter *)v6 setViewServiceProvider:v7];
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_50 != -1) {
    dispatch_once(&sharedInstance_onceToken_50, &__block_literal_global_213_0);
  }
  v2 = (void *)sharedInstance___registry;
  return v2;
}

- (_SBActiveRemoteTransientOverlayViewProviderRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)_SBActiveRemoteTransientOverlayViewProviderRegistry;
  v2 = [(_SBActiveRemoteTransientOverlayViewProviderRegistry *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    viewProviderAdapterForSceneIdentifier = v2->_viewProviderAdapterForSceneIdentifier;
    v2->_viewProviderAdapterForSceneIdentifier = (NSMapTable *)v3;
  }
  return v2;
}

- (void)unregisterViewProvider:(id)a3
{
  id v10 = a3;
  v4 = [v10 sceneHandle];
  v5 = [v4 sceneIdentifier];

  objc_super v6 = [(NSMapTable *)self->_viewProviderAdapterForSceneIdentifier objectForKey:v5];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 sceneBackedProvider];
    uint64_t v9 = [v7 viewServiceProvider];
    if ((id)v8 == v10)
    {
      [v7 setSceneBackedProvider:0];
    }
    else if ((id)v9 == v10)
    {
      [v7 setViewServiceProvider:0];
    }
    if (!(v8 | v9))
    {
      [(id)SBApp unregisterRemoteAlertSceneViewProvider:v7];
      [(NSMapTable *)self->_viewProviderAdapterForSceneIdentifier removeObjectForKey:v5];
    }
  }
}

- (void).cxx_destruct
{
}

@end