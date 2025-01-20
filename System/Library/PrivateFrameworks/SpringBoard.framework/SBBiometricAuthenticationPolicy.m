@interface SBBiometricAuthenticationPolicy
- (BOOL)shouldRelockAfterBioUnlock;
- (SBBiometricAuthenticationPolicy)initWithLockOutProvider:(id)a3;
@end

@implementation SBBiometricAuthenticationPolicy

- (SBBiometricAuthenticationPolicy)initWithLockOutProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBBiometricAuthenticationPolicy;
  v6 = [(SBBiometricAuthenticationPolicy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_lockOutStatusProvider, a3);
  }

  return v7;
}

- (BOOL)shouldRelockAfterBioUnlock
{
  return [(SBFLockOutStatusProvider *)self->_lockOutStatusProvider isBlocked];
}

- (void).cxx_destruct
{
}

@end