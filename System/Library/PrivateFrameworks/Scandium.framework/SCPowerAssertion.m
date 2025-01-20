@interface SCPowerAssertion
- (SCPowerAssertion)initWithName:(id)a3;
- (void)dealloc;
@end

@implementation SCPowerAssertion

- (SCPowerAssertion)initWithName:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v5 = (__CFString *)a3;
  v13.receiver = self;
  v13.super_class = (Class)SCPowerAssertion;
  v6 = [(SCPowerAssertion *)&v13 init];
  if (v6)
  {
    v7 = sc_get_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v5;
      _os_log_impl(&dword_25BA34000, v7, OS_LOG_TYPE_DEFAULT, "creating %{public}@ power assertion", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_name, a3);
    IOReturn v8 = IOPMAssertionCreateWithDescription(@"PreventUserIdleSystemSleep", v5, @"keeping AP awake for Scandium", 0, 0, 300.0, @"TimeoutActionTurnOff", &v6->_powerAssertion);
    if (v8)
    {
      int v9 = v8;
      v10 = sc_get_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[SCPowerAssertion initWithName:](v9, v10);
      }

      v11 = 0;
      v6->_powerAssertion = 0;
    }
    else
    {
      v11 = v6;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (self->_powerAssertion)
  {
    v3 = sc_get_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      *(_DWORD *)buf = 138543362;
      v7 = name;
      _os_log_impl(&dword_25BA34000, v3, OS_LOG_TYPE_DEFAULT, "releasing %{public}@ power assertion", buf, 0xCu);
    }

    IOPMAssertionRelease(self->_powerAssertion);
  }
  v5.receiver = self;
  v5.super_class = (Class)SCPowerAssertion;
  [(SCPowerAssertion *)&v5 dealloc];
}

- (void).cxx_destruct
{
}

- (void)initWithName:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_25BA34000, a2, OS_LOG_TYPE_FAULT, "failed to create power assertion: 0x%x", (uint8_t *)v2, 8u);
}

@end