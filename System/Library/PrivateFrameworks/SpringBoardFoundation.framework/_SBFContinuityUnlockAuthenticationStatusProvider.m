@interface _SBFContinuityUnlockAuthenticationStatusProvider
- (BOOL)hasAuthenticatedAtLeastOnceSinceBoot;
- (BOOL)hasPasscodeSet;
- (BOOL)isAuthenticated;
- (BOOL)isAuthenticatedCached;
- (_SBFContinuityUnlockAuthenticationStatusProvider)initWithMobileKeyBag:(id)a3 underlyingProvider:(id)a4;
- (uint64_t)_isContinuityUnlocked;
- (void)revokeAuthenticationIfNecessaryForPublicReason:(id)a3;
- (void)revokeAuthenticationImmediatelyForPublicReason:(id)a3;
- (void)revokeAuthenticationImmediatelyIfNecessaryForPublicReason:(id)a3;
@end

@implementation _SBFContinuityUnlockAuthenticationStatusProvider

- (_SBFContinuityUnlockAuthenticationStatusProvider)initWithMobileKeyBag:(id)a3 underlyingProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_SBFContinuityUnlockAuthenticationStatusProvider;
  v9 = [(_SBFContinuityUnlockAuthenticationStatusProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keybag, a3);
    objc_storeStrong((id *)&v10->_underlyingProvider, a4);
  }

  return v10;
}

- (BOOL)isAuthenticated
{
  if ([(SBFAuthenticationStatusProvider *)self->_underlyingProvider isAuthenticated]) {
    return 1;
  }
  keybag = self->_keybag;
  return [(SBFMobileKeyBag *)keybag isContinuityUnlocked];
}

- (uint64_t)_isContinuityUnlocked
{
  if (result) {
    return [*(id *)(result + 8) isContinuityUnlocked];
  }
  return result;
}

- (BOOL)isAuthenticatedCached
{
  if ([(SBFAuthenticationStatusProvider *)self->_underlyingProvider isAuthenticatedCached]) {
    return 1;
  }
  keybag = self->_keybag;
  return [(SBFMobileKeyBag *)keybag isContinuityUnlocked];
}

- (BOOL)hasPasscodeSet
{
  return [(SBFAuthenticationStatusProvider *)self->_underlyingProvider hasPasscodeSet];
}

- (BOOL)hasAuthenticatedAtLeastOnceSinceBoot
{
  return [(SBFAuthenticationStatusProvider *)self->_underlyingProvider hasAuthenticatedAtLeastOnceSinceBoot];
}

- (void)revokeAuthenticationImmediatelyForPublicReason:(id)a3
{
}

- (void)revokeAuthenticationIfNecessaryForPublicReason:(id)a3
{
}

- (void)revokeAuthenticationImmediatelyIfNecessaryForPublicReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingProvider, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
}

@end