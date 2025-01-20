@interface SBDeviceOrientationUpdateDeferralAssertion
- (BOOL)isInvalidated;
- (NSString)description;
- (NSString)reason;
- (SBDeviceOrientationUpdateDeferralAssertion)init;
- (SBDeviceOrientationUpdateDeferralAssertion)initWithReason:(id)a3;
- (SBDeviceOrientationUpdateManager)hackyBackReference;
- (void)_setHackyBackReference:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation SBDeviceOrientationUpdateDeferralAssertion

- (SBDeviceOrientationUpdateDeferralAssertion)initWithReason:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBDeviceOrientationUpdateManager.m", 210, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SBDeviceOrientationUpdateDeferralAssertion;
  v6 = [(SBDeviceOrientationUpdateDeferralAssertion *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    reason = v6->_reason;
    v6->_reason = (NSString *)v7;
  }
  return v6;
}

- (void)_setHackyBackReference:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hackyBackReference);
  objc_storeStrong((id *)&self->_reason, 0);
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    v3 = SBLogCommon();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

    if (v4) {
      NSLog(&cfstr_YouShouldAlway.isa);
    }
    if (!self->_invalidated) {
      [(SBDeviceOrientationUpdateDeferralAssertion *)self invalidate];
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)SBDeviceOrientationUpdateDeferralAssertion;
  [(SBDeviceOrientationUpdateDeferralAssertion *)&v5 dealloc];
}

- (void)invalidate
{
  self->_invalidated = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hackyBackReference);
  id v6 = WeakRetained;
  if (!WeakRetained)
  {
    objc_super v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"SBDeviceOrientationUpdateManager.m" lineNumber:228 description:@"Invalidating an assert without a back-reference"];

    id WeakRetained = 0;
  }
  [WeakRetained _endDeferringOrientationUpdatesForAssertion:self];
}

- (NSString)reason
{
  return self->_reason;
}

- (SBDeviceOrientationUpdateDeferralAssertion)init
{
  return 0;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p reason='%@'>", objc_opt_class(), self, self->_reason];
}

- (SBDeviceOrientationUpdateManager)hackyBackReference
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hackyBackReference);
  return (SBDeviceOrientationUpdateManager *)WeakRetained;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

@end