@interface SBSCaptureButtonRestrictionService
- (SBSCaptureButtonRestrictionService)init;
- (id)acquireCaptureButtonSuppressionAssertionWithOptions:(unint64_t)a3 reason:(id)a4;
- (void)init;
- (void)invalidate;
@end

@implementation SBSCaptureButtonRestrictionService

- (SBSCaptureButtonRestrictionService)init
{
  v29.receiver = self;
  v29.super_class = (Class)SBSCaptureButtonRestrictionService;
  v3 = [(SBSCaptureButtonRestrictionService *)&v29 init];
  if (!v3) {
    return v3;
  }
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v4 = [MEMORY[0x1E4F28B50] mainBundle];
  v5 = [v4 bundleIdentifier];
  int v6 = [v5 isEqualToString:@"com.apple.springboard"];

  if (!v6)
  {
    v3->_isValid = 1;
    objc_initWeak(&location, v3);
    v7 = (void *)MEMORY[0x1E4F4F6E8];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __42__SBSCaptureButtonRestrictionService_init__block_invoke;
    v26[3] = &unk_1E566BAB8;
    objc_copyWeak(&v27, &location);
    uint64_t v8 = [v7 assertionWithIdentifier:@"CaptureButtonInhibitAction" stateDidChangeHandler:v26];
    inhibitActionAssertion = v3->_inhibitActionAssertion;
    v3->_inhibitActionAssertion = (BSCompoundAssertion *)v8;

    v10 = v3->_inhibitActionAssertion;
    v11 = SBLogCameraCaptureRestriction();
    [(BSCompoundAssertion *)v10 setLog:v11];

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v13 = BSDispatchQueueCreateWithQualityOfService();
    connectionQueue = v3->_connectionQueue;
    v3->_connectionQueue = (OS_dispatch_queue *)v13;

    v15 = (void *)MEMORY[0x1E4F50BB8];
    v16 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
    v17 = +[SBSCaptureButtonRestrictionServiceSpecification identifier];
    v18 = [v15 endpointForMachName:v16 service:v17 instance:0];

    uint64_t v19 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v18];
    connection = v3->_connection;
    v3->_connection = (BSServiceConnection *)v19;

    v21 = v3->_connection;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __42__SBSCaptureButtonRestrictionService_init__block_invoke_2;
    v24[3] = &unk_1E566B118;
    v25 = v3;
    [(BSServiceConnection *)v21 configureConnection:v24];
    [(BSServiceConnection *)v3->_connection activate];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    return v3;
  }
  v23 = [NSString stringWithFormat:@"Within SpringBoard, use SBCaptureButtonRestrictionCoordinator IPI directly."];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    [(SBSCaptureButtonRestrictionService *)a2 init];
  }
  [v23 UTF8String];
  result = (SBSCaptureButtonRestrictionService *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

void __42__SBSCaptureButtonRestrictionService_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v2);
  v4 = [WeakRetained[1] remoteTarget];
  v5 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v6 = [v3 isActive];

  v7 = [v5 numberWithBool:v6];
  [v4 setCaptureButtonActionInhibited:v7];
}

void __42__SBSCaptureButtonRestrictionService_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = +[SBSCaptureButtonRestrictionServiceSpecification interface];
  [v5 setInterface:v3];

  [v5 setInterfaceTarget:*(void *)(a1 + 32)];
  v4 = +[SBSCaptureButtonRestrictionServiceSpecification serviceQuality];
  [v5 setServiceQuality:v4];

  [v5 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  [v5 setInvalidationHandler:&__block_literal_global_10];
  [v5 setInterruptionHandler:&__block_literal_global_21];
}

void __42__SBSCaptureButtonRestrictionService_init__block_invoke_3()
{
  v0 = SBLogCameraCaptureRestriction();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __42__SBSCaptureButtonRestrictionService_init__block_invoke_3_cold_1(v0);
  }
}

void __42__SBSCaptureButtonRestrictionService_init__block_invoke_19(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = SBLogCameraCaptureRestriction();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __42__SBSCaptureButtonRestrictionService_init__block_invoke_19_cold_1(v3);
  }

  [v2 activate];
}

- (void)invalidate
{
  if (self->_isValid)
  {
    [(BSServiceConnection *)self->_connection invalidate];
    connection = self->_connection;
    self->_connection = 0;

    [(BSCompoundAssertion *)self->_inhibitActionAssertion invalidate];
    inhibitActionAssertion = self->_inhibitActionAssertion;
    self->_inhibitActionAssertion = 0;

    self->_isValid = 0;
  }
}

- (id)acquireCaptureButtonSuppressionAssertionWithOptions:(unint64_t)a3 reason:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    v7 = SBLogCameraCaptureRestriction();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SBSCaptureButtonRestrictionService acquireCaptureButtonSuppressionAssertionWithOptions:reason:](a3, v7);
    }
  }
  uint64_t v8 = [(BSCompoundAssertion *)self->_inhibitActionAssertion acquireForReason:v6];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inhibitActionAssertion, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"SBSCaptureButtonRestrictionService.m";
  __int16 v16 = 1024;
  int v17 = 45;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_18FBC5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

void __42__SBSCaptureButtonRestrictionService_init__block_invoke_3_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18FBC5000, log, OS_LOG_TYPE_ERROR, "SBSCaptureButtonRestrictionService connection invalidated remotely; Restriction service terminated. (Do you have the"
    " required entitlement?)",
    v1,
    2u);
}

void __42__SBSCaptureButtonRestrictionService_init__block_invoke_19_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18FBC5000, log, OS_LOG_TYPE_ERROR, "SBSCaptureButtonRestrictionService connection interrupted. Reactivating connection.", v1, 2u);
}

- (void)acquireCaptureButtonSuppressionAssertionWithOptions:(uint64_t)a1 reason:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = NSStringFromSBSCaptureButtonSuppressionOptions(a1);
  int v4 = 138543362;
  id v5 = v3;
}

@end