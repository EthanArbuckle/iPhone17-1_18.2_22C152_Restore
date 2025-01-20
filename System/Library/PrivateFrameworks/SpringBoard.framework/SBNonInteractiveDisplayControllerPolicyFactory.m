@interface SBNonInteractiveDisplayControllerPolicyFactory
- (SBNonInteractiveDisplayControllerPolicyFactory)initWithFBSceneManager:(id)a3 monitoredWindowScene:(id)a4 applicationController:(id)a5;
- (id)policyForConnectingDisplay:(id)a3;
- (void)transformDisplayConfiguration:(id)a3 forControllersWithBuilder:(id)a4;
@end

@implementation SBNonInteractiveDisplayControllerPolicyFactory

- (SBNonInteractiveDisplayControllerPolicyFactory)initWithFBSceneManager:(id)a3 monitoredWindowScene:(id)a4 applicationController:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBNonInteractiveDisplayControllerPolicyFactory.m", 28, @"Invalid parameter not satisfying: %@", @"monitoredWindowScene" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"SBNonInteractiveDisplayControllerPolicyFactory.m", 27, @"Invalid parameter not satisfying: %@", @"fbSceneManager" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"SBNonInteractiveDisplayControllerPolicyFactory.m", 29, @"Invalid parameter not satisfying: %@", @"applicationController" object file lineNumber description];

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)SBNonInteractiveDisplayControllerPolicyFactory;
  v13 = [(SBNonInteractiveDisplayControllerPolicyFactory *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_fbSceneManager, a3);
    objc_storeStrong((id *)&v14->_monitoredWindowScene, a4);
    objc_storeStrong((id *)&v14->_applicationController, a5);
  }

  return v14;
}

- (id)policyForConnectingDisplay:(id)a3
{
  v3 = [[SBNonInteractiveDisplayControllerPolicy alloc] initWithFBSceneManager:self->_fbSceneManager monitoredWindowScene:self->_monitoredWindowScene applicationController:self->_applicationController];
  return v3;
}

- (void)transformDisplayConfiguration:(id)a3 forControllersWithBuilder:(id)a4
{
  id v8 = a4;
  v5 = [a3 identity];
  int v6 = [v5 isRestrictedAirPlayDisplay];

  if (v6) {
    v7 = @"com.apple.springboard.noninteractive.PA2D";
  }
  else {
    v7 = @"com.apple.springboard.noninteractive";
  }
  [v8 setUniqueIdentifier:v7];
  [v8 setCloningSupported:v6 ^ 1u];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_monitoredWindowScene, 0);
  objc_storeStrong((id *)&self->_fbSceneManager, 0);
}

@end