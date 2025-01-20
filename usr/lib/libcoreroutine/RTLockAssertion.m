@interface RTLockAssertion
- (RTLockAssertion)init;
- (void)dealloc;
@end

@implementation RTLockAssertion

- (RTLockAssertion)init
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)RTLockAssertion;
  v2 = [(RTLockAssertion *)&v7 init];
  if (v2)
  {
    v3 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "acquiring lock assertion", buf, 2u);
    }

    v9 = @"MKBAssertionKey";
    v10[0] = @"SBTransient";
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    v2->_lockAssertion = (__MKBAssertion *)MKBDeviceLockAssertion();
  }
  v5 = v2;

  return v5;
}

- (void)dealloc
{
  if (self->_lockAssertion)
  {
    v3 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "releasing lock assertion", buf, 2u);
    }

    CFRelease(self->_lockAssertion);
    self->_lockAssertion = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)RTLockAssertion;
  [(RTLockAssertion *)&v4 dealloc];
}

@end