@interface SBDataRecoveryController
- (BOOL)dataRecoveryRequired;
- (SBDataRecoveryController)init;
- (SBDataRecoveryController)initWithMobileKeyBag:(id)a3;
- (void)performDataRecovery;
@end

@implementation SBDataRecoveryController

- (SBDataRecoveryController)init
{
  v3 = [MEMORY[0x1E4FA5F80] sharedInstance];
  v4 = [(SBDataRecoveryController *)self initWithMobileKeyBag:v3];

  return v4;
}

- (SBDataRecoveryController)initWithMobileKeyBag:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBDataRecoveryController;
  v6 = [(SBDataRecoveryController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mobileKeyBag, a3);
    v8 = [(SBFMobileKeyBag *)v7->_mobileKeyBag state];
    int v9 = [v8 recoveryEnabled];

    if (v9) {
      ADClientSetValueForScalarKey();
    }
  }

  return v7;
}

- (BOOL)dataRecoveryRequired
{
  v2 = [(SBFMobileKeyBag *)self->_mobileKeyBag state];
  char v3 = [v2 recoveryRequired];

  return v3;
}

- (void)performDataRecovery
{
  [(SBFMobileKeyBag *)self->_mobileKeyBag lockSkippingGracePeriod:1];
  MEMORY[0x1F41173D8](@"Force data recovery");
}

- (void).cxx_destruct
{
}

@end