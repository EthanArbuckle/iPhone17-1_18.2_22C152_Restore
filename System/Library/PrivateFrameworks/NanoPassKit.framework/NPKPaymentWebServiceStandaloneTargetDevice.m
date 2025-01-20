@interface NPKPaymentWebServiceStandaloneTargetDevice
+ (id)standalonePaymentWebServiceWithDelegate:(id)a3;
- (NPKPaymentWebServiceStandaloneTargetDeviceDelegate)delegate;
- (void)endRequiringUpgradedPasscodeIfNecessary;
- (void)enforceUpgradedPasscodePolicyWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:(BOOL)a3;
@end

@implementation NPKPaymentWebServiceStandaloneTargetDevice

+ (id)standalonePaymentWebServiceWithDelegate:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F5C0A8];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [v5 sharedPaymentWebServiceContext];
  v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x263F5C138]);
  }
  v9 = v8;

  v10 = objc_alloc_init(NPKPaymentWebServiceStandaloneTargetDevice);
  [(NPKPaymentWebServiceStandaloneTargetDevice *)v10 setDelegate:v4];

  id v11 = objc_alloc(MEMORY[0x263F5C128]);
  v12 = [MEMORY[0x263F5C248] sharedPaymentWebServiceArchiver];
  v13 = (void *)[v11 initWithContext:v9 targetDevice:v10 archiver:v12];

  return v13;
}

- (void)enforceUpgradedPasscodePolicyWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = [(NPKPaymentWebServiceStandaloneTargetDevice *)self delegate];

  if (v5)
  {
    v6 = [(NPKPaymentWebServiceStandaloneTargetDevice *)self delegate];
    [v6 standaloneTargetDevice:self requestsEnforceUpgradedPasscodePolicyWithCompletion:v4];
  }
  else
  {
    v7 = pk_Payment_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      v9 = pk_Payment_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Warning: Target device: No delegate to enforce upgraded passcode policy!", v11, 2u);
      }
    }
    if (v4)
    {
      v10 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.NPKErrorDomain" code:-1000 userInfo:0];
      v4[2](v4, 0, v10);
    }
  }
}

- (void)startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NPKPaymentWebServiceStandaloneTargetDevice *)self delegate];

  if (v5)
  {
    id v9 = [(NPKPaymentWebServiceStandaloneTargetDevice *)self delegate];
    [v9 standaloneTargetDevice:self requestsStartRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:v3];
  }
  else
  {
    v6 = pk_Payment_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      BOOL v8 = pk_Payment_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Warning: Target device: No delegate to start requiring upgraded passcode!", buf, 2u);
      }
    }
  }
}

- (void)endRequiringUpgradedPasscodeIfNecessary
{
  BOOL v3 = [(NPKPaymentWebServiceStandaloneTargetDevice *)self delegate];

  if (v3)
  {
    id v7 = [(NPKPaymentWebServiceStandaloneTargetDevice *)self delegate];
    [v7 standaloneTargetDeviceRequestsEndRequiringUpgradedPasscodeIfNecessary:self];
  }
  else
  {
    id v4 = pk_Payment_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      v6 = pk_Payment_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Warning: Target device: No delegate to end requiring upgraded passcode!", buf, 2u);
      }
    }
  }
}

- (NPKPaymentWebServiceStandaloneTargetDeviceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKPaymentWebServiceStandaloneTargetDeviceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end