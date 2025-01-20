@interface SBNonInteractiveDisplayModeResolverFactory
- (SBNonInteractiveDisplayModeResolverFactory)initWithApplicationController:(id)a3 userAuthenticationProvider:(id)a4 monitoredWindowScene:(id)a5;
- (id)resolverForPhysicalDisplay:(id)a3;
- (int64_t)displayWindowingMode;
@end

@implementation SBNonInteractiveDisplayModeResolverFactory

- (SBNonInteractiveDisplayModeResolverFactory)initWithApplicationController:(id)a3 userAuthenticationProvider:(id)a4 monitoredWindowScene:(id)a5
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
    [v17 handleFailureInMethod:a2, self, @"SBNonInteractiveDisplayModeResolverFactory.m", 32, @"Invalid parameter not satisfying: %@", @"userAuthenticationProvider" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"SBNonInteractiveDisplayModeResolverFactory.m", 31, @"Invalid parameter not satisfying: %@", @"applicationController" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"SBNonInteractiveDisplayModeResolverFactory.m", 33, @"Invalid parameter not satisfying: %@", @"monitoredWindowScene" object file lineNumber description];

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)SBNonInteractiveDisplayModeResolverFactory;
  v13 = [(SBNonInteractiveDisplayModeResolverFactory *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_applicationController, a3);
    objc_storeStrong((id *)&v14->_userAuthenticationProvider, a4);
    objc_storeStrong((id *)&v14->_monitoredWindowScene, a5);
  }

  return v14;
}

- (int64_t)displayWindowingMode
{
  return 2;
}

- (id)resolverForPhysicalDisplay:(id)a3
{
  v5 = [a3 identity];
  if (([v5 isRootIdentity] & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBNonInteractiveDisplayModeResolverFactory.m", 48, @"Invalid parameter not satisfying: %@", @"[rootDisplayIdentity isRootIdentity]" object file lineNumber description];
  }
  if (objc_msgSend(v5, "sb_physicalDisplaySupportingNonInteractiveDisplayMode")) {
    v6 = [[SBNonInteractiveDisplayModeResolver alloc] initWithRootDisplay:v5 applicationController:self->_applicationController userAuthenticationProvider:self->_userAuthenticationProvider monitoredWindowScene:self->_monitoredWindowScene];
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoredWindowScene, 0);
  objc_storeStrong((id *)&self->_userAuthenticationProvider, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
}

@end