@interface TVRMSPowerAssertion
- (TVRMSPowerAssertion)initWithName:(id)a3;
- (void)dealloc;
- (void)refresh;
@end

@implementation TVRMSPowerAssertion

- (TVRMSPowerAssertion)initWithName:(id)a3
{
  v13[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVRMSPowerAssertion;
  v5 = [(TVRMSPowerAssertion *)&v9 init];
  if (v5)
  {
    v12[0] = @"AssertName";
    v12[1] = @"TimeoutSeconds";
    v13[0] = v4;
    v13[1] = &unk_26DA62D90;
    v12[2] = @"TimeoutAction";
    v12[3] = @"AssertType";
    v13[2] = @"TimeoutActionTurnOff";
    v13[3] = @"PreventUserIdleSystemSleep";
    CFDictionaryRef v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];
    IOPMAssertionCreateWithProperties(v6, &v5->_assertionID);
    v7 = _TVRCRMSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "Power assertion created for %@", buf, 0xCu);
    }
  }
  return v5;
}

- (void)refresh
{
}

- (void)dealloc
{
  IOPMAssertionRelease(self->_assertionID);
  self->_assertionID = 0;
  v3.receiver = self;
  v3.super_class = (Class)TVRMSPowerAssertion;
  [(TVRMSPowerAssertion *)&v3 dealloc];
}

@end