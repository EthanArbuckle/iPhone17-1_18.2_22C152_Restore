@interface PKAppProtectionShieldConfiguration
- (BOOL)showAuthOnAppear;
- (BOOL)showDismiss;
- (PKAppProtectionShieldConfiguration)init;
- (PKAppProtectionShieldViewControllerDelegate)delegate;
- (unint64_t)shieldType;
- (void)setDelegate:(id)a3;
- (void)setShieldType:(unint64_t)a3;
- (void)setShowAuthOnAppear:(BOOL)a3;
- (void)setShowDismiss:(BOOL)a3;
@end

@implementation PKAppProtectionShieldConfiguration

- (PKAppProtectionShieldConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKAppProtectionShieldConfiguration;
  result = [(PKAppProtectionShieldConfiguration *)&v3 init];
  if (result) {
    result->_showAuthOnAppear = 1;
  }
  return result;
}

- (PKAppProtectionShieldViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKAppProtectionShieldViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showDismiss
{
  return self->_showDismiss;
}

- (void)setShowDismiss:(BOOL)a3
{
  self->_showDismiss = a3;
}

- (BOOL)showAuthOnAppear
{
  return self->_showAuthOnAppear;
}

- (void)setShowAuthOnAppear:(BOOL)a3
{
  self->_showAuthOnAppear = a3;
}

- (unint64_t)shieldType
{
  return self->_shieldType;
}

- (void)setShieldType:(unint64_t)a3
{
  self->_shieldType = a3;
}

- (void).cxx_destruct
{
}

@end