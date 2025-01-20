@interface RMSPowerAssertion
- (RMSPowerAssertion)initWithName:(id)a3;
- (void)dealloc;
- (void)refresh;
@end

@implementation RMSPowerAssertion

- (RMSPowerAssertion)initWithName:(id)a3
{
  v13[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RMSPowerAssertion;
  v5 = [(RMSPowerAssertion *)&v9 init];
  if (v5)
  {
    v12[0] = @"AssertName";
    v12[1] = @"TimeoutSeconds";
    v13[0] = v4;
    v13[1] = &unk_26F08F990;
    v12[2] = @"TimeoutAction";
    v12[3] = @"AssertType";
    v13[2] = @"TimeoutActionTurnOff";
    v13[3] = @"PreventUserIdleSystemSleep";
    CFDictionaryRef v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];
    IOPMAssertionCreateWithProperties(v6, &v5->_assertionID);
    v7 = RMSLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_23C83A000, v7, OS_LOG_TYPE_DEFAULT, "Power assertion created for %@", buf, 0xCu);
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
  v3.super_class = (Class)RMSPowerAssertion;
  [(RMSPowerAssertion *)&v3 dealloc];
}

@end