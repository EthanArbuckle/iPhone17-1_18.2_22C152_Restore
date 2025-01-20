@interface SBDisplayProfileRegistry
- (id)_modifyParameters:(id)a3 orientation:(int64_t)a4 interfaceOrientationMode:(int64_t)a5 chamoisEnabled:(BOOL)a6;
- (uint64_t)activate;
- (void)_registerEmbeddedDisplayProfile;
- (void)_registerExtendedProfile;
- (void)_registerMirroringProfile;
- (void)embeddedFactory:(id)a3 modifyInitialSceneParameters:(id)a4;
- (void)extendedFactory:(id)a3 modifyInitialSceneParameters:(id)a4;
- (void)initWithStartupOrientation:(void *)a1;
- (void)windowingModeForDisplay:(void *)a1;
@end

@implementation SBDisplayProfileRegistry

- (void)initWithStartupOrientation:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v13.receiver = a1;
  v13.super_class = (Class)SBDisplayProfileRegistry;
  v3 = objc_msgSendSuper2(&v13, sel_init);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F9F780]);
    v5 = +[SBDisplayTransformerRegistry sharedInstance];
    uint64_t v6 = [v4 initWithDisplayTransformerRegistry:v5];
    v7 = (void *)v3[1];
    v3[1] = v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:1282 capacity:4];
    v9 = (void *)v3[6];
    v3[6] = v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:1282 capacity:4];
    v11 = (void *)v3[7];
    v3[7] = v10;

    v3[5] = a2;
    [v3 _registerEmbeddedDisplayProfile];
    [v3 _registerMirroringProfile];
    [v3 _registerExtendedProfile];
  }
  return v3;
}

- (uint64_t)activate
{
  if (result) {
    return [*(id *)(result + 8) activate];
  }
  return result;
}

- (void)windowingModeForDisplay:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    value = 0;
    if (!NSMapMember(*((NSMapTable **)a1 + 7), v3, 0, &value))
    {
      id v4 = [*((id *)a1 + 1) displayProfileForIdentity:v3];
      if (v4)
      {
        value = NSMapGet(*((NSMapTable **)a1 + 6), v4);
        NSMapInsert(*((NSMapTable **)a1 + 7), v3, value);
      }
    }
    a1 = value;
  }

  return a1;
}

- (void)embeddedFactory:(id)a3 modifyInitialSceneParameters:(id)a4
{
  id v9 = a4;
  int64_t startupEmbeddedOrientation = self->_startupEmbeddedOrientation;
  uint64_t v6 = +[SBDefaults localDefaults];
  v7 = [v6 appSwitcherDefaults];
  id v8 = -[SBDisplayProfileRegistry _modifyParameters:orientation:interfaceOrientationMode:chamoisEnabled:](self, "_modifyParameters:orientation:interfaceOrientationMode:chamoisEnabled:", v9, startupEmbeddedOrientation, 100, [v7 chamoisWindowingEnabled]);
}

- (void)extendedFactory:(id)a3 modifyInitialSceneParameters:(id)a4
{
  id v4 = [(SBDisplayProfileRegistry *)self _modifyParameters:a4 orientation:1 interfaceOrientationMode:2 chamoisEnabled:1];
}

- (void)_registerEmbeddedDisplayProfile
{
  id v3 = (SBEmbeddedDisplayProfileFactory *)-[SBEmbeddedDisplayProfileFactory initWithDelegate:]((id *)[SBEmbeddedDisplayProfileFactory alloc], self);
  embeddedDisplayProfileFactory = self->_embeddedDisplayProfileFactory;
  self->_embeddedDisplayProfileFactory = v3;

  -[SBEmbeddedDisplayProfileFactory createProfile](self->_embeddedDisplayProfileFactory);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  NSMapInsert(self->_profileToWindowingMode, v5, (const void *)1);
  [(SSKDisplayProfileRegistry *)self->_displayProfileRegistry registerDisplayProfile:v5];
}

- (void)_registerExtendedProfile
{
  id v3 = [SBExtendedDisplayProfileFactory alloc];
  id v4 = +[SBDefaults localDefaults];
  id v5 = [v4 externalDisplayDefaults];
  uint64_t v6 = (SBExtendedDisplayProfileFactory *)-[SBExtendedDisplayProfileFactory initWithDefaults:delegate:]((id *)&v3->super.isa, v5, self);
  extendedDisplayProfileFactory = self->_extendedDisplayProfileFactory;
  self->_extendedDisplayProfileFactory = v6;

  -[SBExtendedDisplayProfileFactory createProfile](self->_extendedDisplayProfileFactory);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  NSMapInsert(self->_profileToWindowingMode, v8, (const void *)1);
  [(SSKDisplayProfileRegistry *)self->_displayProfileRegistry registerDisplayProfile:v8];
}

- (void)_registerMirroringProfile
{
  id v3 = objc_alloc_init(SBMirroringDisplayProfileFactory);
  mirroringDisplayProfileFactory = self->_mirroringDisplayProfileFactory;
  self->_mirroringDisplayProfileFactory = v3;

  id v5 = [(SBMirroringDisplayProfileFactory *)self->_mirroringDisplayProfileFactory createProfile];
  NSMapInsert(self->_profileToWindowingMode, v5, 0);
  [(SSKDisplayProfileRegistry *)self->_displayProfileRegistry registerDisplayProfile:v5];
}

- (id)_modifyParameters:(id)a3 orientation:(int64_t)a4 interfaceOrientationMode:(int64_t)a5 chamoisEnabled:(BOOL)a6
{
  id v9 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __98__SBDisplayProfileRegistry__modifyParameters_orientation_interfaceOrientationMode_chamoisEnabled___block_invoke;
  v12[3] = &__block_descriptor_41_e33_v16__0__FBSMutableSceneSettings_8l;
  v12[4] = a5;
  BOOL v13 = a6;
  [v9 updateSettingsWithBlock:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __98__SBDisplayProfileRegistry__modifyParameters_orientation_interfaceOrientationMode_chamoisEnabled___block_invoke_2;
  v11[3] = &__block_descriptor_40_e39_v16__0__FBSMutableSceneClientSettings_8l;
  v11[4] = a4;
  [v9 updateClientSettingsWithBlock:v11];
  return v9;
}

void __98__SBDisplayProfileRegistry__modifyParameters_orientation_interfaceOrientationMode_chamoisEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [v7 setInterfaceOrientation:1];
  if ([v7 isUISubclass])
  {
    id v3 = v7;
    [v3 setTargetOfEventDeferringEnvironments:0];
    [v3 setInterfaceOrientationMode:*(void *)(a1 + 32)];
    id v4 = [(id)SBApp userInterfaceStyleProviderForDisplay:0];
    objc_msgSend(v3, "setUserInterfaceStyle:", objc_msgSend(v4, "currentStyle"));

    id v5 = objc_msgSend(MEMORY[0x1E4FB33B0], "sb_thisDeviceDisplayEdgeInfo");
    objc_msgSend(v5, "sb_applyDisplayEdgeInfoToSceneSettings:", v3);
    [v3 setEnhancedWindowingEnabled:*(unsigned __int8 *)(a1 + 40)];
  }
  uint64_t v6 = [v7 ignoreOcclusionReasons];
  [v6 addObject:@"SystemApp"];
}

void __98__SBDisplayProfileRegistry__modifyParameters_orientation_interfaceOrientationMode_chamoisEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 isUISubclass])
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = v5;
    [v4 setInterfaceOrientation:v3];
    [v4 setStatusBarStyle:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayToWindowingMode, 0);
  objc_storeStrong((id *)&self->_profileToWindowingMode, 0);
  objc_storeStrong((id *)&self->_mirroringDisplayProfileFactory, 0);
  objc_storeStrong((id *)&self->_extendedDisplayProfileFactory, 0);
  objc_storeStrong((id *)&self->_embeddedDisplayProfileFactory, 0);
  objc_storeStrong((id *)&self->_displayProfileRegistry, 0);
}

@end