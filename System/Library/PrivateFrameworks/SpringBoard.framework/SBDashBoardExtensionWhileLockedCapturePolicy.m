@interface SBDashBoardExtensionWhileLockedCapturePolicy
+ (id)new;
+ (id)policyWithAuthenticationStatusProvider:(id)a3;
+ (id)policyWithAuthenticationStatusProvider:(id)a3 captureApplicationMonitor:(id)a4;
- (SBDashBoardExtensionWhileLockedCapturePolicy)init;
- (SBDashBoardExtensionWhileLockedCapturePolicy)initWithAuthenticationStatusProvider:(id)a3 captureApplicationMonitor:(id)a4;
- (id)prewarmingConfigurationForIdentifier:(id)a3 captureApplicationProvider:(id)a4;
- (id)resolveCameraDestinationLaunchOf:(id)a3 fromSource:(id)a4;
- (void)_notePolicyMayHaveChanged;
- (void)addLaunchPolicyObserver:(id)a3;
- (void)captureApplicationProvider:(id)a3 didUpdateKnownApplications:(id)a4;
- (void)removeLaunchPolicyObserver:(id)a3;
@end

@implementation SBDashBoardExtensionWhileLockedCapturePolicy

+ (id)new
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_launchDestinationWithPlacement_entity_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SBDashBoardExtensionWhileLockedCapturePolicy.m", 40, @"%s is unavailable; use %@ instead",
    "+[SBDashBoardExtensionWhileLockedCapturePolicy new]",
    v5);

  return 0;
}

- (SBDashBoardExtensionWhileLockedCapturePolicy)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithPlacement_entity_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBDashBoardExtensionWhileLockedCapturePolicy.m", 44, @"%s is unavailable; use %@ instead",
    "-[SBDashBoardExtensionWhileLockedCapturePolicy init]",
    v5);

  return 0;
}

+ (id)policyWithAuthenticationStatusProvider:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F73080];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [a1 policyWithAuthenticationStatusProvider:v5 captureApplicationMonitor:v6];

  return v7;
}

+ (id)policyWithAuthenticationStatusProvider:(id)a3 captureApplicationMonitor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithAuthenticationStatusProvider:v7 captureApplicationMonitor:v6];

  return v8;
}

- (SBDashBoardExtensionWhileLockedCapturePolicy)initWithAuthenticationStatusProvider:(id)a3 captureApplicationMonitor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBDashBoardExtensionWhileLockedCapturePolicy;
  v9 = [(SBDashBoardExtensionWhileLockedCapturePolicy *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_authenticationStatusProvider, a3);
    objc_storeStrong((id *)&v10->_applicationMonitor, a4);
    [(LCSCaptureApplicationMonitor *)v10->_applicationMonitor addObserver:v10];
    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v11;

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v10 selector:sel__authenticationStateDidChange_ name:*MEMORY[0x1E4FA6140] object:0];
  }
  return v10;
}

- (id)resolveCameraDestinationLaunchOf:(id)a3 fromSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 application];
  v9 = [v8 bundleIdentifier];

  v10 = [(LCSCaptureApplicationMonitor *)self->_applicationMonitor knownCaptureApplicationsByBundleIdentifier];
  int v11 = [(SBFAuthenticationStatusProvider *)self->_authenticationStatusProvider isAuthenticatedCached];
  v12 = &SBDashBoardCapturePlacementCameraPage;
  if (([v9 isEqualToString:@"com.apple.camera"] & 1) == 0)
  {
    if ([v7 isEqualToString:SBDashBoardCaptureLaunchSourceCaptureButton])
    {
      if (v11)
      {
        if (_os_feature_enabled_impl()) {
          v12 = &SBDashBoardCapturePlacementCaptureButtonCameraPage;
        }
      }
      else
      {
        v12 = &SBDashBoardCapturePlacementCameraOverlay;
      }
    }
    else
    {
      if (v11)
      {
        v13 = 0;
        goto LABEL_18;
      }
      v12 = &SBDashBoardCapturePlacementSecureApp;
    }
  }
  v13 = *v12;
  if (v13)
  {
    uint64_t v14 = [v10 objectForKeyedSubscript:v9];
    if (v14)
    {
      objc_super v15 = (void *)v14;
      v16 = (v11 & 1) != 0
          ? [[SBDashBoardApplicationHostableEntity alloc] initWithApplicationSceneEntity:v6]: (SBDashBoardApplicationHostableEntity *)[[SBDashBoardSecureCaptureExtensionHostableEntity alloc] initWithCaptureApplication:v14];
      v17 = v16;

      if (v17)
      {
        v18 = +[SBDashBoardCaptureLaunchDestination launchDestinationWithPlacement:v13 entity:v17];

        goto LABEL_19;
      }
    }
  }
LABEL_18:
  v18 = 0;
LABEL_19:

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
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 prewarmType];
  v9 = [v7 applicationBundleIdentifier];

  LODWORD(v7) = [(SBFAuthenticationStatusProvider *)self->_authenticationStatusProvider isAuthenticatedCached];
  v10 = [v6 captureApplicationForBundleIdentifier:v9];

  if (v7)
  {
    id v11 = v9;
    uint64_t v12 = 1;
  }
  else
  {
    v13 = [v10 extension];
    id v11 = [v13 bundleIdentifier];

    uint64_t v12 = 2;
  }
  if (v8 == 2)
  {
    uint64_t v12 = 0;
  }
  else if (v8 == 1)
  {
    id v14 = v9;

    uint64_t v12 = 0;
    id v11 = v14;
  }
  objc_super v15 = [[SBDashBoardCameraPrewarmConfiguration alloc] initWithPrewarmCameraHardware:1 prewarmForCaptureLaunch:1 backgroundLaunchTarget:v12 applicationBundleIdentifier:v9 prewarmingBundleIdentifier:v11];

  return v15;
}

- (void)captureApplicationProvider:(id)a3 didUpdateKnownApplications:(id)a4
{
}

uint64_t __102__SBDashBoardExtensionWhileLockedCapturePolicy_captureApplicationProvider_didUpdateKnownApplications___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notePolicyMayHaveChanged];
}

- (void)_notePolicyMayHaveChanged
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) captureLaunchPolicyDidUpdatePolicy:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_applicationMonitor, 0);
  objc_storeStrong((id *)&self->_authenticationStatusProvider, 0);
}

@end