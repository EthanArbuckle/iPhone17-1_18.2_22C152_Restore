@interface VSIdentityProviderRequestContext
- (BOOL)attemptedVerificationStateReset;
- (VSIdentityProviderRequest)request;
- (void)setAttemptedVerificationStateReset:(BOOL)a3;
- (void)setRequest:(id)a3;
@end

@implementation VSIdentityProviderRequestContext

- (VSIdentityProviderRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (BOOL)attemptedVerificationStateReset
{
  return self->_attemptedVerificationStateReset;
}

- (void)setAttemptedVerificationStateReset:(BOOL)a3
{
  self->_attemptedVerificationStateReset = a3;
}

- (void).cxx_destruct
{
}

@end