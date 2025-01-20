@interface MRDSleepAssertion
- (MRDSleepAssertion)initWithName:(id)a3 timeout:(double)a4;
- (void)invalidate;
@end

@implementation MRDSleepAssertion

- (MRDSleepAssertion)initWithName:(id)a3 timeout:(double)a4
{
  v7 = (__CFString *)a3;
  v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Initialization sleep assertion %@", buf, 0xCu);
  }

  v18.receiver = self;
  v18.super_class = (Class)MRDSleepAssertion;
  v9 = [(MRDSleepAssertion *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    v10->_unsigned int assertionID = 0;
    IOReturn v11 = IOPMAssertionCreateWithDescription(@"PreventUserIdleSystemSleep", @"com.apple.mediaremote.powerassertion", 0, v7, 0, a4, @"TimeoutActionRelease", &v10->_assertionID);
    unsigned int assertionID = v10->_assertionID;
    p_super = _MRLogForCategory();
    BOOL v14 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
    if (assertionID) {
      BOOL v15 = v11 == 0;
    }
    else {
      BOOL v15 = 0;
    }
    if (v15)
    {
      if (v14)
      {
        name = v10->_name;
        *(_DWORD *)buf = 138412546;
        v20 = (__CFString *)name;
        __int16 v21 = 2048;
        double v22 = a4;
        _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "Taking sleep assertion %@ for a max of %lf seconds", buf, 0x16u);
      }
    }
    else
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "Could not take sleep assertion", buf, 2u);
      }

      p_super = &v10->super;
      v10 = 0;
    }
  }
  return v10;
}

- (void)invalidate
{
  IOReturn v3 = IOPMAssertionRelease(self->_assertionID);
  v4 = _MRLogForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      name = self->_name;
      int v9 = 138412290;
      v10 = name;
      v7 = "Could not release sleep assertion %@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v5)
  {
    v8 = self->_name;
    int v9 = 138412290;
    v10 = v8;
    v7 = "Releasing sleep assertion %@";
    goto LABEL_6;
  }
}

- (void).cxx_destruct
{
}

@end