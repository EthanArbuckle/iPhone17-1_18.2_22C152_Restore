@interface UISMutableApplicationInitializationContext
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCompatibilityContext:(id)a3;
- (void)setDefaultSceneToken:(id)a3;
- (void)setDeviceContext:(id)a3;
- (void)setLaunchDisplayContext:(id)a3;
- (void)setMainDisplayContext:(id)a3;
- (void)setPersistedSceneIdentifiers:(id)a3;
- (void)setSupportAppSceneRequests:(BOOL)a3;
@end

@implementation UISMutableApplicationInitializationContext

- (void)setDefaultSceneToken:(id)a3
{
  self->super._defaultSceneToken = (FBSSceneIdentityToken *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setMainDisplayContext:(id)a3
{
  self->super._mainDisplayContext = (UISDisplayContext *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setLaunchDisplayContext:(id)a3
{
  self->super._launchDisplayContext = (UISDisplayContext *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setDeviceContext:(id)a3
{
  self->super._deviceContext = (UISDeviceContext *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setCompatibilityContext:(id)a3
{
  self->super._compatibilityContext = (UISCompatibilityContext *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPersistedSceneIdentifiers:(id)a3
{
  self->super._persistedSceneIdentifiers = (NSSet *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setSupportAppSceneRequests:(BOOL)a3
{
  self->super._supportAppSceneRequests = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [UISApplicationInitializationContext alloc];
  return [(UISApplicationInitializationContext *)v4 initWithUISApplicationInitializationContext:self];
}

@end