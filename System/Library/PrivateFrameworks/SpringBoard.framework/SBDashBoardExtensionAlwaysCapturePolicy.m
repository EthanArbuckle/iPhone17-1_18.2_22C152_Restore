@interface SBDashBoardExtensionAlwaysCapturePolicy
- (SBDashBoardExtensionAlwaysCapturePolicy)init;
- (SBDashBoardExtensionAlwaysCapturePolicy)initWithCaptureApplicationMonitor:(id)a3;
- (id)prewarmingConfigurationForIdentifier:(id)a3 captureApplicationProvider:(id)a4;
- (id)resolveCameraDestinationLaunchOf:(id)a3 fromSource:(id)a4;
- (void)addLaunchPolicyObserver:(id)a3;
- (void)captureApplicationProvider:(id)a3 didUpdateKnownApplications:(id)a4;
- (void)removeLaunchPolicyObserver:(id)a3;
@end

@implementation SBDashBoardExtensionAlwaysCapturePolicy

- (SBDashBoardExtensionAlwaysCapturePolicy)initWithCaptureApplicationMonitor:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBDashBoardExtensionAlwaysCapturePolicy;
  v6 = [(SBDashBoardExtensionAlwaysCapturePolicy *)&v11 init];
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

- (SBDashBoardExtensionAlwaysCapturePolicy)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F73080]);
  v4 = [(SBDashBoardExtensionAlwaysCapturePolicy *)self initWithCaptureApplicationMonitor:v3];

  return v4;
}

- (id)resolveCameraDestinationLaunchOf:(id)a3 fromSource:(id)a4
{
  id v6 = a4;
  v7 = [a3 application];
  uint64_t v8 = [v7 bundleIdentifier];

  v9 = [(LCSCaptureApplicationMonitor *)self->_applicationMonitor knownCaptureApplicationsByBundleIdentifier];
  int v10 = [v8 isEqualToString:@"com.apple.camera"];
  objc_super v11 = &SBDashBoardCapturePlacementCameraOverlay;
  if (v10) {
    objc_super v11 = &SBDashBoardCapturePlacementCameraPage;
  }
  v12 = *v11;
  if (_os_feature_enabled_impl()
    && [v6 isEqualToString:SBDashBoardCaptureLaunchSourceCaptureButton])
  {
    v13 = SBDashBoardCapturePlacementCaptureButtonCameraPage;

    v12 = v13;
  }
  v14 = [v9 objectForKeyedSubscript:v8];
  if (v14)
  {
    v15 = [[SBDashBoardSecureCaptureExtensionHostableEntity alloc] initWithCaptureApplication:v14];
    v16 = v15;
    if (v12) {
      BOOL v17 = v15 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    if (!v17)
    {
      v18 = +[SBDashBoardCaptureLaunchDestination launchDestinationWithPlacement:v12 entity:v15];
      goto LABEL_14;
    }
  }
  else
  {
    v16 = 0;
  }
  v18 = 0;
LABEL_14:

  return v18;
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

  v9 = [v5 captureApplicationForBundleIdentifier:v8];

  int v10 = [v9 extension];
  objc_super v11 = [v10 bundleIdentifier];

  if (v7 == 2)
  {
    uint64_t v13 = 0;
  }
  else if (v7 == 1)
  {
    id v12 = v8;

    uint64_t v13 = 0;
    objc_super v11 = v12;
  }
  else
  {
    uint64_t v13 = 2;
  }
  v14 = [[SBDashBoardCameraPrewarmConfiguration alloc] initWithPrewarmCameraHardware:1 prewarmForCaptureLaunch:1 backgroundLaunchTarget:v13 applicationBundleIdentifier:v8 prewarmingBundleIdentifier:v11];

  return v14;
}

- (void)captureApplicationProvider:(id)a3 didUpdateKnownApplications:(id)a4
{
}

void __97__SBDashBoardExtensionAlwaysCapturePolicy_captureApplicationProvider_didUpdateKnownApplications___block_invoke(uint64_t a1)
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