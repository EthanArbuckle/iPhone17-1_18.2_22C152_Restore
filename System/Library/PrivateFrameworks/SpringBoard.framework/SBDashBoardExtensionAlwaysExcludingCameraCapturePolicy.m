@interface SBDashBoardExtensionAlwaysExcludingCameraCapturePolicy
- (SBDashBoardExtensionAlwaysExcludingCameraCapturePolicy)init;
- (SBDashBoardExtensionAlwaysExcludingCameraCapturePolicy)initWithCaptureApplicationMonitor:(id)a3;
- (id)prewarmingConfigurationForIdentifier:(id)a3 captureApplicationProvider:(id)a4;
- (id)resolveCameraDestinationLaunchOf:(id)a3 fromSource:(id)a4;
- (void)addLaunchPolicyObserver:(id)a3;
- (void)captureApplicationProvider:(id)a3 didUpdateKnownApplications:(id)a4;
- (void)removeLaunchPolicyObserver:(id)a3;
@end

@implementation SBDashBoardExtensionAlwaysExcludingCameraCapturePolicy

- (SBDashBoardExtensionAlwaysExcludingCameraCapturePolicy)initWithCaptureApplicationMonitor:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBDashBoardExtensionAlwaysExcludingCameraCapturePolicy;
  v6 = [(SBDashBoardExtensionAlwaysExcludingCameraCapturePolicy *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_applicationMonitor, a3);
    [(LCSCaptureApplicationMonitor *)v7->_applicationMonitor addObserver:v7];
    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;
  }
  return v7;
}

- (SBDashBoardExtensionAlwaysExcludingCameraCapturePolicy)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F73080]);
  v4 = [(SBDashBoardExtensionAlwaysExcludingCameraCapturePolicy *)self initWithCaptureApplicationMonitor:v3];

  return v4;
}

- (id)resolveCameraDestinationLaunchOf:(id)a3 fromSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 application];
  v9 = [v8 bundleIdentifier];

  v10 = [(LCSCaptureApplicationMonitor *)self->_applicationMonitor knownCaptureApplicationsByBundleIdentifier];
  int v11 = [v9 isEqualToString:@"com.apple.camera"];
  v12 = &SBDashBoardCapturePlacementCameraOverlay;
  if (v11) {
    v12 = &SBDashBoardCapturePlacementCameraPage;
  }
  v13 = *v12;
  if (_os_feature_enabled_impl()
    && [v7 isEqualToString:SBDashBoardCaptureLaunchSourceCaptureButton])
  {
    v14 = SBDashBoardCapturePlacementCaptureButtonCameraPage;

    v13 = v14;
  }
  v15 = [v10 objectForKeyedSubscript:v9];
  if (v15)
  {
    if (v11) {
      v16 = [[SBDashBoardApplicationHostableEntity alloc] initWithApplicationSceneEntity:v6];
    }
    else {
      v16 = [[SBDashBoardSecureCaptureExtensionHostableEntity alloc] initWithCaptureApplication:v15];
    }
    v17 = v16;
    if (v13) {
      BOOL v18 = v16 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    if (!v18)
    {
      v19 = +[SBDashBoardCaptureLaunchDestination launchDestinationWithPlacement:v13 entity:v16];
      goto LABEL_17;
    }
  }
  else
  {
    v17 = 0;
  }
  v19 = 0;
LABEL_17:

  return v19;
}

- (void)addLaunchPolicyObserver:(id)a3
{
}

- (void)removeLaunchPolicyObserver:(id)a3
{
}

- (id)prewarmingConfigurationForIdentifier:(id)a3 captureApplicationProvider:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 prewarmType];
  uint64_t v8 = [v6 applicationBundleIdentifier];

  int v9 = [v8 isEqualToString:@"com.apple.camera"];
  v10 = [v5 captureApplicationForBundleIdentifier:v8];

  if (v9)
  {
    id v11 = v8;
    uint64_t v12 = 1;
  }
  else
  {
    v13 = [v10 extension];
    id v11 = [v13 bundleIdentifier];

    uint64_t v12 = 2;
  }
  if (v7 == 2)
  {
    uint64_t v12 = 0;
  }
  else if (v7 == 1)
  {
    id v14 = v8;

    uint64_t v12 = 0;
    id v11 = v14;
  }
  v15 = [[SBDashBoardCameraPrewarmConfiguration alloc] initWithPrewarmCameraHardware:1 prewarmForCaptureLaunch:v9 ^ 1u backgroundLaunchTarget:v12 applicationBundleIdentifier:v8 prewarmingBundleIdentifier:v11];

  return v15;
}

- (void)captureApplicationProvider:(id)a3 didUpdateKnownApplications:(id)a4
{
}

void __112__SBDashBoardExtensionAlwaysExcludingCameraCapturePolicy_captureApplicationProvider_didUpdateKnownApplications___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "allObjects", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) captureLaunchPolicyDidUpdatePolicy:*(void *)(a1 + 32)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_applicationMonitor, 0);
}

@end