@interface TSUserInPurchaseFlowAssertion
+ (id)sharedInstance;
- (TSUserInPurchaseFlowAssertion)init;
- (void)assertUserInPurchaseFlowStartOver:(BOOL)a3 caller:(id)a4;
- (void)deassertUserInPurchaseFlowWithForce:(BOOL)a3 caller:(id)a4;
@end

@implementation TSUserInPurchaseFlowAssertion

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_8);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __47__TSUserInPurchaseFlowAssertion_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_alloc_init(TSUserInPurchaseFlowAssertion);
  return MEMORY[0x270F9A758]();
}

- (TSUserInPurchaseFlowAssertion)init
{
  v3.receiver = self;
  v3.super_class = (Class)TSUserInPurchaseFlowAssertion;
  result = [(TSUserInPurchaseFlowAssertion *)&v3 init];
  if (result) {
    result->_assertionCounter = 0;
  }
  return result;
}

- (void)assertUserInPurchaseFlowStartOver:(BOOL)a3 caller:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (a3) {
    int v7 = 1;
  }
  else {
    int v7 = self->_assertionCounter + 1;
  }
  self->_int assertionCounter = v7;
  v8 = _TSLogDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int assertionCounter = self->_assertionCounter;
    v11[0] = 67109634;
    v11[1] = assertionCounter;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2080;
    v15 = "-[TSUserInPurchaseFlowAssertion assertUserInPurchaseFlowStartOver:caller:]";
    _os_log_impl(&dword_227A17000, v8, OS_LOG_TYPE_DEFAULT, "_assertionCounter: %d, caller:%@ @%s", (uint8_t *)v11, 0x1Cu);
  }

  if (self->_assertionCounter >= 1)
  {
    v10 = [MEMORY[0x263F31978] sharedManager];
    [v10 setUserInPurchaseFlow:1];
  }
}

- (void)deassertUserInPurchaseFlowWithForce:(BOOL)a3 caller:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = _TSLogDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int assertionCounter = self->_assertionCounter;
    v12[0] = 67109634;
    v12[1] = assertionCounter;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2080;
    uint64_t v16 = "-[TSUserInPurchaseFlowAssertion deassertUserInPurchaseFlowWithForce:caller:]";
    _os_log_impl(&dword_227A17000, v7, OS_LOG_TYPE_DEFAULT, "_assertionCounter: %d, caller:%@ @%s", (uint8_t *)v12, 0x1Cu);
  }

  int v9 = self->_assertionCounter;
  if (v9)
  {
    int v10 = v9 - 1;
    self->_int assertionCounter = v10;
    if (!v10 || v4)
    {
      v11 = [MEMORY[0x263F31978] sharedManager];
      [v11 setUserInPurchaseFlow:0];
    }
  }
}

@end