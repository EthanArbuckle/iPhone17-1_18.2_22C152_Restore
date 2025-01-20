@interface VSViewModel
- (BOOL)isInAuthenticationShareFlow;
- (BOOL)shouldPreValidate;
- (NSError)error;
- (NSString)title;
- (VSIdentityProvider)identityProvider;
- (VSViewModel)init;
- (int64_t)userInterfaceStyle;
- (unint64_t)validationState;
- (unint64_t)viewState;
- (void)configureWithRequest:(id)a3;
- (void)setAuthenticationShare:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setIdentityProvider:(id)a3;
- (void)setPreValidate:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
- (void)setValidationState:(unint64_t)a3;
- (void)setViewState:(unint64_t)a3;
@end

@implementation VSViewModel

- (VSViewModel)init
{
  v5.receiver = self;
  v5.super_class = (Class)VSViewModel;
  v2 = [(VSViewModel *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F1CB00] currentTraitCollection];
    v2->_userInterfaceStyle = [v3 userInterfaceStyle];
  }
  return v2;
}

- (void)configureWithRequest:(id)a3
{
  id v4 = [a3 accountProviderAuthenticationToken];
  [(VSViewModel *)self setAuthenticationShare:v4 != 0];
}

- (unint64_t)viewState
{
  return self->_viewState;
}

- (void)setViewState:(unint64_t)a3
{
  self->_viewState = a3;
}

- (BOOL)shouldPreValidate
{
  return self->_preValidate;
}

- (void)setPreValidate:(BOOL)a3
{
  self->_preValidate = a3;
}

- (BOOL)isInAuthenticationShareFlow
{
  return self->_authenticationShare;
}

- (void)setAuthenticationShare:(BOOL)a3
{
  self->_authenticationShare = a3;
}

- (unint64_t)validationState
{
  return self->_validationState;
}

- (void)setValidationState:(unint64_t)a3
{
  self->_validationState = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (VSIdentityProvider)identityProvider
{
  return self->_identityProvider;
}

- (void)setIdentityProvider:(id)a3
{
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityProvider, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end