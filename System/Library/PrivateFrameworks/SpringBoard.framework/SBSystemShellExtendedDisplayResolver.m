@interface SBSystemShellExtendedDisplayResolver
- (BOOL)isWindowingModeAvailable;
- (FBSDisplayIdentity)rootDisplayIdentity;
- (SBDisplayWindowingModeResolverDelegate)delegate;
- (SBSystemShellExtendedDisplayResolver)initWithRootDisplay:(id)a3;
- (int64_t)displayWindowingMode;
- (void)setDelegate:(id)a3;
@end

@implementation SBSystemShellExtendedDisplayResolver

- (SBSystemShellExtendedDisplayResolver)initWithRootDisplay:(id)a3
{
  id v6 = a3;
  if (([v6 isRootIdentity] & 1) == 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBSystemShellExtendedDisplayResolver.m", 24, @"Invalid parameter not satisfying: %@", @"[rootDisplayIdentity isRootIdentity]" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SBSystemShellExtendedDisplayResolver;
  v7 = [(SBSystemShellExtendedDisplayResolver *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_rootDisplayIdentity, a3);
  }

  return v8;
}

- (FBSDisplayIdentity)rootDisplayIdentity
{
  return self->_rootDisplayIdentity;
}

- (int64_t)displayWindowingMode
{
  return 1;
}

- (BOOL)isWindowingModeAvailable
{
  return 1;
}

- (SBDisplayWindowingModeResolverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBDisplayWindowingModeResolverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rootDisplayIdentity, 0);
}

@end