@interface SBSystemShellExtendedDisplayControllerPolicyFactory
- (SBSystemShellExtendedDisplayControllerPolicyFactory)initWithExternalDisplayService:(id)a3 externalDisplayDefaults:(id)a4 appSwitcherDefaults:(id)a5 mousePointerManager:(id)a6 runtimeAvailabilitySettings:(id)a7 sceneManager:(id)a8 windowSceneManager:(id)a9;
- (id)policyForConnectingDisplay:(id)a3;
- (void)transformDisplayConfiguration:(id)a3 forControllersWithBuilder:(id)a4;
@end

@implementation SBSystemShellExtendedDisplayControllerPolicyFactory

- (SBSystemShellExtendedDisplayControllerPolicyFactory)initWithExternalDisplayService:(id)a3 externalDisplayDefaults:(id)a4 appSwitcherDefaults:(id)a5 mousePointerManager:(id)a6 runtimeAvailabilitySettings:(id)a7 sceneManager:(id)a8 windowSceneManager:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id obj = a6;
  id v18 = a6;
  id v32 = a7;
  id v19 = a7;
  id v33 = a8;
  id v34 = a8;
  id v20 = a9;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"SBSystemShellExtendedDisplayControllerPolicyFactory.m", 34, @"Invalid parameter not satisfying: %@", @"externalDisplayService" object file lineNumber description];

    if (v16)
    {
LABEL_3:
      if (v17) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"SBSystemShellExtendedDisplayControllerPolicyFactory.m", 35, @"Invalid parameter not satisfying: %@", @"externalDisplayDefaults" object file lineNumber description];

  if (v17)
  {
LABEL_4:
    if (v18) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"SBSystemShellExtendedDisplayControllerPolicyFactory.m", 36, @"Invalid parameter not satisfying: %@", @"appSwitcherDefaults" object file lineNumber description];

  if (v18)
  {
LABEL_5:
    if (v19) {
      goto LABEL_6;
    }
LABEL_14:
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"SBSystemShellExtendedDisplayControllerPolicyFactory.m", 38, @"Invalid parameter not satisfying: %@", @"runtimeAvailabilitySettings" object file lineNumber description];

    if (v20) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_13:
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"SBSystemShellExtendedDisplayControllerPolicyFactory.m", 37, @"Invalid parameter not satisfying: %@", @"mousePointerManager" object file lineNumber description];

  if (!v19) {
    goto LABEL_14;
  }
LABEL_6:
  if (v20) {
    goto LABEL_7;
  }
LABEL_15:
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"SBSystemShellExtendedDisplayControllerPolicyFactory.m", 39, @"Invalid parameter not satisfying: %@", @"windowSceneManager" object file lineNumber description];

LABEL_7:
  v36.receiver = self;
  v36.super_class = (Class)SBSystemShellExtendedDisplayControllerPolicyFactory;
  v21 = [(SBSystemShellExtendedDisplayControllerPolicyFactory *)&v36 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_externalDisplayService, a3);
    objc_storeStrong((id *)&v22->_externalDisplayDefaults, a4);
    objc_storeStrong((id *)&v22->_appSwitcherDefaults, a5);
    objc_storeStrong((id *)&v22->_mousePointerManager, obj);
    objc_storeStrong((id *)&v22->_runtimeAvailabilitySettings, v32);
    objc_storeStrong((id *)&v22->_sceneManager, v33);
    objc_storeStrong((id *)&v22->_windowSceneManager, a9);
  }

  return v22;
}

- (id)policyForConnectingDisplay:(id)a3
{
  v3 = [[SBSystemShellExtendedDisplayControllerPolicy alloc] initWithExternalDisplayDefaults:self->_externalDisplayDefaults appSwitcherDefaults:self->_appSwitcherDefaults externalDisplayService:self->_externalDisplayService mousePointerManager:self->_mousePointerManager runtimeAvailabilitySettings:self->_runtimeAvailabilitySettings sceneManager:self->_sceneManager windowSceneManager:self->_windowSceneManager];
  return v3;
}

- (void)transformDisplayConfiguration:(id)a3 forControllersWithBuilder:(id)a4
{
  id v4 = a4;
  [v4 setUniqueIdentifier:@"com.apple.springboard.shellui"];
  [v4 setUIKitMainLike];
  [v4 setCloningSupported:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowSceneManager, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_runtimeAvailabilitySettings, 0);
  objc_storeStrong((id *)&self->_mousePointerManager, 0);
  objc_storeStrong((id *)&self->_appSwitcherDefaults, 0);
  objc_storeStrong((id *)&self->_externalDisplayDefaults, 0);
  objc_storeStrong((id *)&self->_externalDisplayService, 0);
}

@end