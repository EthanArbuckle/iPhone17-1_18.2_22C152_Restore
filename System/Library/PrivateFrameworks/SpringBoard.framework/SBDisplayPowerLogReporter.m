@interface SBDisplayPowerLogReporter
- (SBDisplayPowerLogReporter)init;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (void)reportPowerLogEntry:(id)a3;
@end

@implementation SBDisplayPowerLogReporter

- (SBDisplayPowerLogReporter)init
{
  v13.receiver = self;
  v13.super_class = (Class)SBDisplayPowerLogReporter;
  v2 = [(SBDisplayPowerLogReporter *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    displayNameToPowerLogEntry = v2->_displayNameToPowerLogEntry;
    v2->_displayNameToPowerLogEntry = (NSMutableDictionary *)v3;

    uint64_t SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
    powerLogSendQueue = v2->_powerLogSendQueue;
    v2->_powerLogSendQueue = (OS_dispatch_queue *)SerialWithQoS;

    objc_initWeak(&location, v2);
    id v7 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v11, &location);
    uint64_t v8 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureAssertion = v2->_stateCaptureAssertion;
    v2->_stateCaptureAssertion = (BSInvalidatable *)v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __33__SBDisplayPowerLogReporter_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained description];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)reportPowerLogEntry:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v5 = (__CFString *)a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = [NSString stringWithUTF8String:"-[SBDisplayPowerLogReporter reportPowerLogEntry:]"];
    [v18 handleFailureInFunction:v19 file:@"SBDisplayPowerLogReporter.m" lineNumber:50 description:@"this call must be made on the main thread"];
  }
  v6 = [(__CFString *)v5 displayName];

  if (!v6)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SBDisplayPowerLogReporter.m", 51, @"Invalid parameter not satisfying: %@", @"[powerLogEntry displayName]" object file lineNumber description];
  }
  id v7 = [(__CFString *)v5 displayName];
  uint64_t v8 = [(__CFString *)v5 windowingMode];
  v9 = [(NSMutableDictionary *)self->_displayNameToPowerLogEntry objectForKey:v7];
  v10 = v9;
  if (v8)
  {
    if ([v9 isEqual:v5])
    {

      goto LABEL_16;
    }
    [(NSMutableDictionary *)self->_displayNameToPowerLogEntry setObject:v5 forKey:v7];
  }
  else
  {

    if (v10)
    {
      id v11 = SBLogDisplayControlling();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v17 = _SBFLoggingMethodProem();
        *(_DWORD *)buf = 138543618;
        v25 = v17;
        __int16 v26 = 2114;
        v27 = v5;
        _os_log_debug_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ incoming entry has .Invalid windowing mode. evicting from cache: %{public}@", buf, 0x16u);
      }
      [(NSMutableDictionary *)self->_displayNameToPowerLogEntry removeObjectForKey:v7];
    }
  }
  v12 = [(__CFString *)v5 logPayload];
  objc_super v13 = SBLogDisplayControlling();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v16 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138543874;
    v25 = v16;
    __int16 v26 = 2114;
    v27 = @"WindowMode";
    __int16 v28 = 2114;
    v29 = v12;
    _os_log_debug_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEBUG, "%{public}@ reporting to powerlog. eventName: %{public}@; payload: %{public}@",
      buf,
      0x20u);
  }
  powerLogSendQueue = self->_powerLogSendQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SBDisplayPowerLogReporter_reportPowerLogEntry___block_invoke;
  block[3] = &unk_1E6AF4A70;
  id v22 = v12;
  v23 = @"WindowMode";
  id v15 = v12;
  dispatch_async(powerLogSendQueue, block);

LABEL_16:
}

uint64_t __49__SBDisplayPowerLogReporter_reportPowerLogEntry___block_invoke()
{
  uint64_t result = PLShouldLogRegisteredEvent();
  if (result)
  {
    return PLLogRegisteredEvent();
  }
  return result;
}

- (id)description
{
  return [(SBDisplayPowerLogReporter *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBDisplayPowerLogReporter *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v4 appendDictionarySection:self->_displayNameToPowerLogEntry withName:@"map" skipIfEmpty:0];
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerLogSendQueue, 0);
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_displayNameToPowerLogEntry, 0);
}

@end