@interface RBProcess
+ (id)processStateApplicationQueue;
+ (id)testProcessWithPid:(int)a3;
+ (id)testProcessWithPid:(int)a3 andIdentity:(id)a4;
+ (id)testProcessWithPid:(int)a3 identity:(id)a4 launchdProps:(id)a5 andBundleProps:(id)a6;
+ (void)_runOnDiagnosticQueue:(uint64_t)a1;
- (BOOL)_sendSignal:(int)a3;
- (BOOL)isBeingPtraced;
- (BOOL)isContainerized;
- (BOOL)isJetsamCoalitionLeader;
- (BOOL)isJetsamManaged;
- (BOOL)isLifecycleManaged;
- (BOOL)isPlatformBinary;
- (BOOL)isReported;
- (BOOL)isSuspended;
- (BOOL)isSystem;
- (BOOL)isTerminating;
- (BOOL)isTestApp;
- (BOOL)matchesProcess:(id)a3;
- (BOOL)terminateWithContext:(id)a3;
- (NSDictionary)managedEndpointByLaunchIdentifier;
- (NSString)description;
- (NSString)environment;
- (NSString)homeDirectory;
- (NSString)shortDescription;
- (NSString)tmpDirectory;
- (NSString)underlyingAssertion;
- (RBBundleProperties)bundleProperties;
- (RBJetsamProperties)memoryLimits;
- (RBProcess)hostProcess;
- (RBProcess)init;
- (RBSAuditToken)auditToken;
- (RBSProcessExitContext)lastExitContext;
- (RBSProcessExitStatus)intendedExitStatus;
- (RBSProcessHandle)handle;
- (RBSProcessIdentifier)identifier;
- (RBSProcessIdentity)identity;
- (RBSProcessInstance)instance;
- (char)_initWithInstance:(void *)a3 auditToken:(void *)a4 bundleProperties:(void *)a5 jetsamProperties:(void *)a6 initialState:(void *)a7 hostProcess:(void *)a8 properties:(char)a9 systemPreventsIdleSleep:(char)a10 cache:;
- (double)processStartTime;
- (id)_allowedLockedFilePaths;
- (id)_initThinWithInstance:(id)a3 auditToken:(id)a4 bundleProperties:(id)a5 jetsamProperties:(id)a6 hostProcess:(id)a7 properties:(id)a8;
- (id)_initWithInstance:(id)a3 auditToken:(id)a4 bundleProperties:(id)a5 jetsamProperties:(id)a6 initialState:(id)a7 hostProcess:(id)a8 properties:(id)a9 systemPreventsIdleSleep:(BOOL)a10;
- (id)_lock_lockedFilePathsIgnoring:(uint64_t)a1;
- (id)createRBSTarget;
- (id)processPredicate;
- (int)pidversion;
- (int)rbs_pid;
- (uint64_t)_generateStackshotWithDescription:(int)a3 domain:(uint64_t)a4 code:(void *)a5 additionalPayload:;
- (uint64_t)_generateTailspin;
- (uint64_t)_lock_terminateWithContext:(uint64_t)a1;
- (uint64_t)_memoryStatusControl:(uint64_t)a1 flags:;
- (unint64_t)jetsamCoalitionID;
- (unint64_t)resourceCoalitionID;
- (void)_allowedLockedFilePaths;
- (void)_applyJetsamLenientModeState:(uint64_t)a1;
- (void)_applyState:(id)a3;
- (void)_generateTailspin;
- (void)_lock_applyCPULimits;
- (void)_lock_applyCarPlayMode;
- (void)_lock_applyCurrentStateIfPossible;
- (void)_lock_applyGPU;
- (void)_lock_applyJetsamLenientMode;
- (void)_lock_applyJetsamPriority;
- (void)_lock_applyMemoryLimits;
- (void)_lock_applyRole;
- (void)_lock_applySuspendState;
- (void)_lock_disableCPULimits;
- (void)_lock_logVisibility;
- (void)_lock_restoreCPULimitDefaults;
- (void)_lock_resume;
- (void)_lock_resumeCPUMonitoring;
- (void)_lock_setCPULimits:(uint64_t)a1 violationPolicy:(int *)a2;
- (void)_lock_shutdownSocketsAndLog:(uint64_t)a1;
- (void)_lock_suspend;
- (void)_setMemoryStatusFlags:(uint64_t)a1;
- (void)_systemPreventIdleSleepStateDidChange:(BOOL)a3;
- (void)collectDiagnostic:(unint64_t)a3 description:(id)a4 domain:(unsigned int)a5 code:(unint64_t)a6 additionalPayload:(id)a7 completion:(id)a8;
- (void)invalidate;
- (void)invokeHandlerOnProcessDeath:(id)a3 onQueue:(id)a4;
- (void)memoryLimits;
- (void)processStartTime;
- (void)setAuditToken:(id)a3;
- (void)setIntendedExitStatus:(id)a3;
- (void)setJetsamCoalitionID:(unint64_t)a3;
- (void)setJetsamCoalitionLeader:(BOOL)a3;
- (void)setLastExitContext:(id)a3;
- (void)setProcessStartTime:(double)a3;
- (void)setResourceCoalitionID:(unint64_t)a3;
- (void)setTerminating:(BOOL)a3;
@end

@implementation RBProcess

- (RBSProcessIdentity)identity
{
  return self->_identity;
}

- (void)_systemPreventIdleSleepStateDidChange:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_systemPreventsIdleSleep = a3;
  if (!self->_terminating && !a3 && self->_suspended && [(RBProcess *)self isLifecycleManaged]) {
    -[RBProcess _lock_shutdownSocketsAndLog:]((uint64_t)self, 0);
  }
  os_unfair_lock_unlock(p_lock);
}

- (RBSProcessIdentifier)identifier
{
  return self->_identifier;
}

- (BOOL)isReported
{
  return self->_manageFlags != 0;
}

- (BOOL)isTerminating
{
  return self->_terminating;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (id)_initThinWithInstance:(id)a3 auditToken:(id)a4 bundleProperties:(id)a5 jetsamProperties:(id)a6 hostProcess:(id)a7 properties:(id)a8
{
  return -[RBProcess _initWithInstance:auditToken:bundleProperties:jetsamProperties:initialState:hostProcess:properties:systemPreventsIdleSleep:cache:](self, a3, a4, a5, a6, 0, a7, a8, 0, 0);
}

- (RBSProcessHandle)handle
{
  return self->_handle;
}

- (void)_lock_applyCPULimits
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if ((*(unsigned char *)(a1 + 109) & 0x10) != 0)
    {
      int v4 = [*(id *)(a1 + 56) effectiveMaxCPUPercentage];
      int v5 = [*(id *)(a1 + 56) effectiveMaxCPUDuration];
      int v6 = [*(id *)(a1 + 56) effectiveMinCPUPercentage];
      int v7 = [*(id *)(a1 + 56) effectiveMinCPUDuration];
      if (v7 <= v5) {
        int v8 = v5;
      }
      else {
        int v8 = v7;
      }
      if (v6 <= v4) {
        int v9 = v4;
      }
      else {
        int v9 = v6;
      }
      int v10 = [*(id *)(a1 + 64) effectiveMaxCPUPercentage];
      unsigned int v11 = [*(id *)(a1 + 64) effectiveMaxCPUDuration];
      LODWORD(v12) = [*(id *)(a1 + 64) effectiveMinCPUPercentage];
      unsigned int v13 = [*(id *)(a1 + 64) effectiveMinCPUDuration];
      if ((int)v13 <= (int)v11) {
        uint64_t v14 = v11;
      }
      else {
        uint64_t v14 = v13;
      }
      if ((int)v12 <= v10) {
        uint64_t v12 = v10;
      }
      else {
        uint64_t v12 = v12;
      }
      uint64_t v15 = objc_msgSend(*(id *)(a1 + 56), "effectiveMaxCPUUsageViolationPolicy", v12 | (v14 << 32));
      uint64_t v16 = [*(id *)(a1 + 64) effectiveMaxCPUUsageViolationPolicy];
      BOOL v18 = v9 > 0 && v8 > 0;
      BOOL v19 = (int)v12 <= 0 || (int)v14 <= 0;
      int v20 = !v19;
      if (!v19) {
        BOOL v18 = 1;
      }
      if (v9 == v12 && v8 == v14 && v15 == v16) {
        BOOL v18 = 0;
      }
      if (v18 || !*(void *)(a1 + 56))
      {
        -[RBProcess _lock_disableCPULimits](a1);
        if (v20) {
          -[RBProcess _lock_setCPULimits:violationPolicy:](a1, v23);
        }
        else {
          -[RBProcess _lock_restoreCPULimitDefaults](a1);
        }
        -[RBProcess _lock_resumeCPUMonitoring](a1);
      }
    }
    else
    {
      v2 = rbs_process_log();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        uint64_t v3 = *(void *)(a1 + 32);
        v23[0] = 138543362;
        *(void *)&v23[1] = v3;
        _os_log_impl(&dword_226AB3000, v2, OS_LOG_TYPE_INFO, "%{public}@ Ignoring CPU limits because this process is not CPU limit managed", (uint8_t *)v23, 0xCu);
      }
    }
  }
}

- (void)_lock_resumeCPUMonitoring
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7_0(&dword_226AB3000, v0, v1, "%{public}@ Error resuming CPU monitoring: %d", v2, v3, v4, v5, v6);
}

- (void)_lock_restoreCPULimitDefaults
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7_0(&dword_226AB3000, v0, v1, "%{public}@ Error setting default CPU monitoring limits: %d", v2, v3, v4, v5, v6);
}

- (void)_lock_disableCPULimits
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7_0(&dword_226AB3000, v0, v1, "%{public}@ Error disabling CPU monitoring: %d", v2, v3, v4, v5, v6);
}

- (void)_applyState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[RBProcess processStateApplicationQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __25__RBProcess__applyState___block_invoke;
  v8[3] = &unk_2647C7B98;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v8);
  dispatch_async(v5, v7);
}

+ (id)processStateApplicationQueue
{
  if (processStateApplicationQueue_onceToken != -1) {
    dispatch_once(&processStateApplicationQueue_onceToken, &__block_literal_global_7);
  }
  uint64_t v2 = (void *)processStateApplicationQueue_queue;
  return v2;
}

- (BOOL)isSystem
{
  return 0;
}

- (NSString)shortDescription
{
  return self->_shortDescription;
}

- (NSString)description
{
  return self->_shortDescription;
}

- (RBSProcessInstance)instance
{
  return self->_instance;
}

- (BOOL)isPlatformBinary
{
  return self->_platformBinary;
}

void __25__RBProcess__applyState___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
  -[RBProcess _lock_applyCurrentStateIfPossible](*(void *)(a1 + 32));
  uint64_t v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 48);
  os_unfair_lock_unlock(v2);
}

- (void)_lock_applyCurrentStateIfPossible
{
  OUTLINED_FUNCTION_12(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  _os_log_debug_impl(&dword_226AB3000, v0, OS_LOG_TYPE_DEBUG, "%{public}@ ignoring process state change because process is terminating", v1, 0xCu);
}

- (void)_lock_logVisibility
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 64) inheritances];
    uint64_t v3 = [v2 allNamespaces];
    int v4 = [v3 containsObject:*MEMORY[0x263F646F0]];

    if (*(unsigned __int8 *)(a1 + 108) != v4)
    {
      uint64_t v5 = rbs_ttl_log();
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      if (v4)
      {
        if (v6)
        {
          uint64_t v7 = *(void *)(a1 + 32);
          int v10 = 138543362;
          uint64_t v11 = v7;
          int v8 = "%{public}@ visiblity is yes";
LABEL_8:
          _os_log_impl(&dword_226AB3000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0xCu);
        }
      }
      else if (v6)
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v10 = 138543362;
        uint64_t v11 = v9;
        int v8 = "%{public}@ visiblity is no";
        goto LABEL_8;
      }

      *(unsigned char *)(a1 + 108) = v4;
    }
  }
}

- (void)_lock_applySuspendState
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (*(unsigned char *)(a1 + 109))
    {
      int v4 = *(void **)(a1 + 56);
      if (v4) {
        int v5 = [v4 preventSuspend];
      }
      else {
        int v5 = 0;
      }
      int v6 = [*(id *)(a1 + 64) preventSuspend];
      if (!*(void *)(a1 + 56) || v5 != v6)
      {
        if (v6)
        {
          -[RBProcess _lock_resume](a1);
        }
        else
        {
          -[RBProcess _lock_suspend](a1);
        }
      }
    }
    else
    {
      uint64_t v2 = rbs_process_log();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v3 = *(void *)(a1 + 32);
        int v7 = 138543362;
        uint64_t v8 = v3;
        _os_log_impl(&dword_226AB3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring suspend because this process is not lifecycle managed", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (void)_lock_applyRole
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  __error();
  int v5 = __error();
  strerror(*v5);
  OUTLINED_FUNCTION_14();
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  __int16 v10 = 2080;
  uint64_t v11 = v6;
  _os_log_error_impl(&dword_226AB3000, a3, OS_LOG_TYPE_ERROR, "%{public}@ Error %d setting priority to %{public}@: %s", v7, 0x26u);
}

- (void)_lock_applyMemoryLimits
{
  uint64_t v1 = [a1 shortDescription];
  uint64_t v2 = __error();
  strerror(*v2);
  __error();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_3(&dword_226AB3000, v3, v4, "Could not get Memory Limits for %{public}@ - failed with error: %s (%d)", v5, v6, v7, v8, v9);
}

- (int)rbs_pid
{
  return [(RBSProcessIdentifier *)self->_identifier pid];
}

- (void)_lock_applyJetsamLenientMode
{
  if (a1)
  {
    int v2 = [*(id *)(a1 + 56) effectiveJetsamLenientMode];
    int v3 = [*(id *)(a1 + 64) effectiveJetsamLenientMode];
    if (v2 != v3)
    {
      -[RBProcess _applyJetsamLenientModeState:](a1, v3);
    }
  }
}

- (void)_lock_applyGPU
{
  os_log_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1_3(&dword_226AB3000, v1, v2, "%d Error setting Darwin GPU to \"%{public}s\": %s", v3, v4, v5, v6, 2u);
}

- (void)_lock_applyCarPlayMode
{
  __error();
  os_log_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_18(&dword_226AB3000, v1, v2, "%{public}@ Error %d setting Carplay mode to %{public}d: %s", v3, v4, v5, v6, v7);
}

- (void)_lock_applyJetsamPriority
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if ((*(unsigned char *)(a1 + 109) & 8) == 0)
    {
      uint64_t v2 = rbs_process_log();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v3 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v14 = v3;
        uint64_t v4 = "%{public}@ Ignoring jetsam update because this process is not memory-managed";
        uint64_t v5 = v2;
        uint32_t v6 = 12;
LABEL_13:
        _os_log_impl(&dword_226AB3000, v5, OS_LOG_TYPE_DEFAULT, v4, buf, v6);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
    int v7 = [*(id *)(a1 + 64) explicitJetsamBand];
    if (!*(void *)(a1 + 56) || *(_DWORD *)(a1 + 72) != v7)
    {
      *(_DWORD *)(a1 + 72) = v7;
      int v12 = v7;
      if (memorystatus_control())
      {
        if (*__error() == 3) {
          return;
        }
        uint64_t v2 = rbs_process_log();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = *(void *)(a1 + 32);
          uint8_t v9 = __error();
          __int16 v10 = strerror(*v9);
          *(_DWORD *)buf = 138544130;
          uint64_t v14 = v8;
          __int16 v15 = 1024;
          int v16 = v12;
          __int16 v17 = 2048;
          uint64_t v18 = 0;
          __int16 v19 = 2080;
          int v20 = v10;
          _os_log_error_impl(&dword_226AB3000, v2, OS_LOG_TYPE_ERROR, "%{public}@ Error setting jetsam priority to %d [%#llx]: %s", buf, 0x26u);
        }
        goto LABEL_14;
      }
      uint64_t v2 = rbs_process_log();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138544130;
        uint64_t v14 = v11;
        __int16 v15 = 1024;
        int v16 = v12;
        __int16 v17 = 2048;
        uint64_t v18 = 0;
        __int16 v19 = 1024;
        LODWORD(v20) = 1;
        uint64_t v4 = "%{public}@ Set jetsam priority to %d [%#llx] flag[%d]";
        uint64_t v5 = v2;
        uint32_t v6 = 34;
        goto LABEL_13;
      }
LABEL_14:
    }
  }
}

- (BOOL)isLifecycleManaged
{
  return self->_manageFlags & 1;
}

- (void)_lock_resume
{
  OUTLINED_FUNCTION_12(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "%{public}@ spd_client_stop_monitoring_all_sockets_for_pid() returned KERN_FAILURE", v2, v3, v4, v5, v6);
}

- (NSDictionary)managedEndpointByLaunchIdentifier
{
  return self->_managedEndpointByLaunchIdentifier;
}

- (RBBundleProperties)bundleProperties
{
  return self->_bundleProperties;
}

- (void)setTerminating:(BOOL)a3
{
  if (!a3)
  {
    uint64_t v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"RBProcess.m", 543, @"Cannot set a RBProcess terminating to NO, once terminating has started it cannot be stopped" object file lineNumber description];
  }
  self->_terminating = 1;
}

- (void)_lock_suspend
{
  OUTLINED_FUNCTION_12(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "%{public}@ spd_client_start_monitoring_all_sockets_for_pid() failed", v2, v3, v4, v5, v6);
}

- (void)_lock_shutdownSocketsAndLog:(uint64_t)a1
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (pid_shutdown_sockets())
    {
      if (*__error() == 3) {
        return;
      }
      uint64_t v4 = rbs_process_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        -[RBProcess _lock_shutdownSocketsAndLog:](a1, v4);
      }
    }
    else
    {
      if (!a2) {
        return;
      }
      uint64_t v4 = rbs_process_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        uint8_t v6 = "SVC";
        if (!*(unsigned char *)(a1 + 78)) {
          uint8_t v6 = "ALL";
        }
        int v7 = 138543618;
        uint64_t v8 = v5;
        __int16 v9 = 2080;
        __int16 v10 = v6;
        _os_log_impl(&dword_226AB3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Shutdown sockets (%s)", (uint8_t *)&v7, 0x16u);
      }
    }
  }
}

- (RBJetsamProperties)memoryLimits
{
  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  if (!self->_memoryLimits)
  {
    if ((self->_manageFlags & 8) != 0)
    {
      uint8_t v6 = rbs_assertion_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        [(RBProcess *)(uint64_t)self memoryLimits];
      }
    }
    else
    {
      uint64_t v4 = (RBJetsamProperties *)objc_opt_new();
      memoryLimits = self->_memoryLimits;
      self->_memoryLimits = v4;
    }
  }
  os_unfair_lock_unlock(p_dataLock);
  int v7 = self->_memoryLimits;
  return v7;
}

- (NSString)environment
{
  return 0;
}

- (RBSAuditToken)auditToken
{
  return self->_auditToken;
}

- (BOOL)isTestApp
{
  int isTestApp = self->_isTestApp;
  if (!isTestApp)
  {
    if (os_variant_has_internal_content())
    {
      [(RBProcess *)self rbs_pid];
      uint64_t v4 = RBSExecutablePathForPID();
      if ([v4 hasPrefix:@"/AppleInternal/Tests/RunningBoard/"]) {
        int v5 = 1;
      }
      else {
        int v5 = -1;
      }
      self->_int isTestApp = v5;

      int isTestApp = self->_isTestApp;
    }
    else
    {
      int isTestApp = -1;
      self->_int isTestApp = -1;
    }
  }
  return isTestApp == 1;
}

- (NSString)underlyingAssertion
{
  return self->_underlyingAssertion;
}

- (char)_initWithInstance:(void *)a3 auditToken:(void *)a4 bundleProperties:(void *)a5 jetsamProperties:(void *)a6 initialState:(void *)a7 hostProcess:(void *)a8 properties:(char)a9 systemPreventsIdleSleep:(char)a10 cache:
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v18 = a2;
  id obj = a3;
  id v19 = a3;
  id v20 = a4;
  id v80 = a5;
  id v79 = a6;
  id v78 = a7;
  id v21 = a8;
  if (!a1)
  {
    v23 = 0;
LABEL_36:
    v69 = v79;
    v68 = v80;
    v70 = v78;
    goto LABEL_37;
  }
  if (v18)
  {
    if (v19) {
      goto LABEL_4;
    }
  }
  else
  {
    v74 = [MEMORY[0x263F08690] currentHandler];
    [v74 handleFailureInMethod:sel__initWithInstance_auditToken_bundleProperties_jetsamProperties_initialState_hostProcess_properties_systemPreventsIdleSleep_cache_, a1, @"RBProcess.m", 252, @"Invalid parameter not satisfying: %@", @"instance" object file lineNumber description];

    if (v19) {
      goto LABEL_4;
    }
  }
  v75 = [MEMORY[0x263F08690] currentHandler];
  [v75 handleFailureInMethod:sel__initWithInstance_auditToken_bundleProperties_jetsamProperties_initialState_hostProcess_properties_systemPreventsIdleSleep_cache_, a1, @"RBProcess.m", 253, @"Invalid parameter not satisfying: %@", @"auditToken" object file lineNumber description];

LABEL_4:
  v22 = [v18 identity];
  if ([v22 osServiceType] == 1) {
    -[RBProcess _initWithInstance:auditToken:bundleProperties:jetsamProperties:initialState:hostProcess:properties:systemPreventsIdleSleep:cache:]();
  }

  v82.receiver = a1;
  v82.super_class = (Class)RBProcess;
  v23 = (char *)objc_msgSendSuper2(&v82, sel_init);
  if (!v23) {
    goto LABEL_36;
  }
  *((_DWORD *)v23 + 2) = objc_msgSend(v18, "rbs_pid");
  objc_storeStrong((id *)v23 + 18, a2);
  uint64_t v24 = [v18 identifier];
  v25 = (void *)*((void *)v23 + 17);
  *((void *)v23 + 17) = v24;

  uint64_t v26 = [v18 identity];
  v27 = (void *)*((void *)v23 + 2);
  *((void *)v23 + 2) = v26;

  *((void *)v23 + 15) = 0;
  uint64_t v28 = [v21 homeDirectory];
  v29 = (void *)*((void *)v23 + 25);
  *((void *)v23 + 25) = v28;

  uint64_t v30 = [v21 tmpDirectory];
  v31 = (void *)*((void *)v23 + 26);
  *((void *)v23 + 26) = v30;

  *((_DWORD *)v23 + 21) = [v19 pidversion];
  v32 = (void **)(v23 + 88);
  objc_storeStrong((id *)v23 + 11, a5);
  id v77 = v19;
  if ([v21 doesOverrideManagement])
  {
    v33 = v20;
    char v34 = [v21 overrideManageFlags];
LABEL_13:
    v23[109] = v34;
    goto LABEL_18;
  }
  if (![*((id *)v23 + 2) isExtension])
  {
    v33 = v20;
    char v34 = [*((id *)v23 + 2) defaultManageFlags];
    goto LABEL_13;
  }
  v35 = [v20 extensionPointIdentifier];
  if (v35)
  {
    if ([MEMORY[0x263F64598] shouldManageExtensionWithExtensionPoint:v35]) {
      v23[109] = -1;
    }
  }
  else
  {
    v73 = rbs_process_log();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
      -[RBProcess _initWithInstance:auditToken:bundleProperties:jetsamProperties:initialState:hostProcess:properties:systemPreventsIdleSleep:cache:]();
    }
  }
  v33 = v20;

  char v34 = v23[109];
LABEL_18:
  if ((v34 & 8) == 0)
  {
    uint64_t v36 = objc_opt_new();
    v37 = *v32;
    *v32 = (void *)v36;
  }
  v38 = [v21 managedEndpointByLaunchIdentifier];
  uint64_t v39 = [v38 copy];
  v40 = (void *)*((void *)v23 + 27);
  *((void *)v23 + 27) = v39;

  objc_storeStrong((id *)v23 + 21, a4);
  v23[77] = [v33 usesSocketMonitoring];
  id v41 = objc_alloc_init(MEMORY[0x263F64558]);
  v42 = (void *)*((void *)v23 + 19);
  *((void *)v23 + 19) = v41;

  *((void *)v23 + 6) = 0;
  v23[78] = a9;
  objc_storeStrong((id *)v23 + 5, a7);
  id v43 = objc_alloc(MEMORY[0x263F64570]);
  uint64_t v44 = *((void *)v23 + 18);
  uint64_t v45 = v23[109];
  v46 = [v21 beforeTranslocationBundlePath];
  v47 = [v21 executablePath];
  LOBYTE(v72) = a10;
  uint64_t v48 = [v43 initWithInstance:v44 auditToken:v77 bundleData:v33 manageFlags:v45 beforeTranslocationBundlePath:v46 executablePath:v47 cache:v72];
  v49 = (void *)*((void *)v23 + 3);
  *((void *)v23 + 3) = v48;

  v50 = (id *)(v23 + 176);
  objc_storeStrong((id *)v23 + 22, obj);
  id v51 = [NSString alloc];
  v52 = [*((id *)v23 + 2) shortDescription];
  uint64_t v53 = [v51 initWithFormat:@"[%@:%d]", v52, objc_msgSend(*((id *)v23 + 17), "rbs_pid")];
  v54 = (void *)*((void *)v23 + 4);
  *((void *)v23 + 4) = v53;

  uint64_t v55 = [v21 underlyingAssertion];
  v56 = (void *)*((void *)v23 + 23);
  *((void *)v23 + 23) = v55;

  char v81 = 2;
  int v57 = [*((id *)v23 + 11) memoryLimitForCategory:*MEMORY[0x263F64690] strength:&v81];
  char v81 = 2;
  int v58 = [*((id *)v23 + 11) memoryLimitForCategory:*MEMORY[0x263F64698] strength:&v81];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v60 = rbs_process_log();
  BOOL v61 = os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT);
  if (isKindOfClass)
  {
    if (v61)
    {
      uint64_t v62 = *((void *)v23 + 4);
      *(_DWORD *)buf = 138543362;
      uint64_t v84 = v62;
      v63 = "%{public}@ is not RunningBoard jetsam managed.";
      v64 = v60;
      uint32_t v65 = 12;
LABEL_25:
      _os_log_impl(&dword_226AB3000, v64, OS_LOG_TYPE_DEFAULT, v63, buf, v65);
    }
  }
  else if (v61)
  {
    uint64_t v66 = *((void *)v23 + 4);
    uint64_t v67 = *((void *)v23 + 11);
    *(_DWORD *)buf = 138544130;
    uint64_t v84 = v66;
    __int16 v85 = 1024;
    int v86 = v57;
    __int16 v87 = 1024;
    int v88 = v58;
    __int16 v89 = 2112;
    uint64_t v90 = v67;
    v63 = "%{public}@ Memory Limits: active %d inactive %d\n %@";
    v64 = v60;
    uint32_t v65 = 34;
    goto LABEL_25;
  }

  id v20 = v33;
  id v19 = v77;
  if (*v50)
  {
    [*v50 realToken];
    v23[76] = RBSAuditTokenRepresentsPlatformBinary();
  }
  -[RBProcess _setMemoryStatusFlags:]((uint64_t)v23, v21);
  v69 = v79;
  v68 = v80;
  v70 = v78;
  if (v79 && *((void *)v23 + 23) && ![*((id *)v23 + 8) memoryLimit]) {
    [v23 _applyState:v79];
  }
LABEL_37:

  return v23;
}

- (void)_setMemoryStatusFlags:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    char v4 = *(unsigned char *)(a1 + 109);
    int v5 = rbs_process_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if ((v4 & 8) != 0)
    {
      if (v6)
      {
        uint64_t v8 = *(void *)(a1 + 32);
        int v12 = 138543362;
        uint64_t v13 = v8;
        _os_log_impl(&dword_226AB3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ This process will be managed.", (uint8_t *)&v12, 0xCu);
      }

      -[RBProcess _memoryStatusControl:flags:](a1);
      if (([*(id *)(a1 + 88) isFreezerEligible] & 1) == 0)
      {
        __int16 v9 = rbs_process_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 138412290;
          uint64_t v13 = a1;
          _os_log_impl(&dword_226AB3000, v9, OS_LOG_TYPE_DEFAULT, "%@ is not freezer eligible, disabling freezing.", (uint8_t *)&v12, 0xCu);
        }

        -[RBProcess _memoryStatusControl:flags:](a1);
      }
      if ((_deviceSupportsAppSwapping & 1) == 0
        && [*(id *)(a1 + 16) isApplication]
        && -[RBProcess _memoryStatusControl:flags:](a1) == 45)
      {
        __int16 v10 = rbs_process_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = *(void *)(a1 + 32);
          int v12 = 138543362;
          uint64_t v13 = v11;
          _os_log_impl(&dword_226AB3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Device does not support app swapping - will not attempt again.", (uint8_t *)&v12, 0xCu);
        }

        _deviceSupportsAppSwapping = 1;
      }
    }
    else
    {
      if (v6)
      {
        uint64_t v7 = *(void *)(a1 + 32);
        int v12 = 138543362;
        uint64_t v13 = v7;
        _os_log_impl(&dword_226AB3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ This process will not be managed.", (uint8_t *)&v12, 0xCu);
      }
    }
  }
}

- (uint64_t)_memoryStatusControl:(uint64_t)a1 flags:
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = memorystatus_control();
  if (v1 && *__error() != 3 && *__error() != 45)
  {
    uint64_t v2 = rbs_process_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      -[RBProcess _memoryStatusControl:flags:]();
    }
  }
  return v1;
}

- (RBProcess)hostProcess
{
  return self->_hostProcess;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedEndpointByLaunchIdentifier, 0);
  objc_storeStrong((id *)&self->_tmpDirectory, 0);
  objc_storeStrong((id *)&self->_homeDirectory, 0);
  objc_storeStrong((id *)&self->_underlyingAssertion, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_bundleProperties, 0);
  objc_storeStrong((id *)&self->_intendedExitStatus, 0);
  objc_storeStrong((id *)&self->_lastExitContext, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_procSource, 0);
  objc_storeStrong((id *)&self->_memoryLimits, 0);
  objc_storeStrong((id *)&self->_lock_state, 0);
  objc_storeStrong((id *)&self->_lock_appliedState, 0);
  objc_storeStrong((id *)&self->_hostProcess, 0);
  objc_storeStrong((id *)&self->_shortDescription, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (id)_initWithInstance:(id)a3 auditToken:(id)a4 bundleProperties:(id)a5 jetsamProperties:(id)a6 initialState:(id)a7 hostProcess:(id)a8 properties:(id)a9 systemPreventsIdleSleep:(BOOL)a10
{
  return -[RBProcess _initWithInstance:auditToken:bundleProperties:jetsamProperties:initialState:hostProcess:properties:systemPreventsIdleSleep:cache:](self, a3, a4, a5, a6, a7, a8, a9, a10, 1);
}

- (void)setLastExitContext:(id)a3
{
  char v4 = (RBSProcessExitContext *)a3;
  os_unfair_lock_lock(&self->_dataLock);
  lastExitContext = self->_lastExitContext;
  self->_lastExitContext = v4;

  os_unfair_lock_unlock(&self->_dataLock);
}

- (RBSProcessExitContext)lastExitContext
{
  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  if (self->_intendedExitStatus)
  {
    char v4 = (RBSProcessExitContext *)-[RBSProcessExitContext copyWithStatus:](self->_lastExitContext, "copyWithStatus:");
    lastExitContext = self->_lastExitContext;
    self->_lastExitContext = v4;
  }
  if (![(RBSProcessExitContext *)self->_lastExitContext type])
  {
    BOOL v6 = [(RBSProcessIdentity *)self->_identity consistentLaunchdJobLabel];
    if (v6)
    {
      uint64_t v7 = +[RBLaunchdJobManager lastExitStatusForLabel:v6 error:0];
      uint64_t v8 = (RBSProcessExitContext *)[(RBSProcessExitContext *)self->_lastExitContext copyWithStatus:v7];
      __int16 v9 = self->_lastExitContext;
      self->_lastExitContext = v8;
    }
  }
  __int16 v10 = self->_lastExitContext;
  os_unfair_lock_unlock(p_dataLock);
  return v10;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(RBProcessState *)self->_lock_state jetsamLenientMode]) {
    -[RBProcess _applyJetsamLenientModeState:]((uint64_t)self, 0);
  }
  os_unfair_lock_lock(&self->_dataLock);
  lastExitContext = self->_lastExitContext;
  int v5 = [MEMORY[0x263EFF910] date];
  BOOL v6 = (RBSProcessExitContext *)[(RBSProcessExitContext *)lastExitContext copyWithTimestamp:v5];
  uint64_t v7 = self->_lastExitContext;
  self->_lastExitContext = v6;

  os_unfair_lock_unlock(&self->_dataLock);
  self->_appliedJetsamPriority = -1;
  self->_terminating = 1;
  os_unfair_lock_unlock(p_lock);
  uint64_t v8 = [MEMORY[0x263F64650] sharedBackgroundWorkloop];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__RBProcess_invalidate__block_invoke;
  block[3] = &unk_2647C7CC8;
  block[4] = self;
  dispatch_async(v8, block);
}

void __23__RBProcess_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(*(void *)(a1 + 32) + 112);
  if (v1)
  {
    dispatch_source_cancel(v1);
    uint64_t v2 = rbs_process_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __23__RBProcess_invalidate__block_invoke_cold_1();
    }
  }
}

void __26__RBProcess__lock_suspend__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v1 = (uint64_t *)(a1 + 32);
  uint64_t v2 = -[RBProcess _allowedLockedFilePaths](*(void *)(a1 + 32));
  os_unfair_lock_lock((os_unfair_lock_t)(*v1 + 48));
  id v3 = (os_unfair_lock_s *)*v1;
  if (*(unsigned char *)(*v1 + 129) && !LOBYTE(v3[32]._os_unfair_lock_opaque))
  {
    char v4 = rbs_process_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(void **)(*v1 + 32);
      *(_DWORD *)buf = 138543362;
      v25 = v5;
      _os_log_impl(&dword_226AB3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ check if suspended process is holding locks", buf, 0xCu);
    }

    BOOL v6 = -[RBProcess _lock_lockedFilePathsIgnoring:](*v1, v2);
    if ([v6 count])
    {
      uint64_t v7 = [v6 allObjects];
      uint64_t v8 = [v7 componentsJoinedByString:@"\n"];

      __int16 v9 = [v2 allObjects];
      __int16 v10 = [v9 componentsJoinedByString:@"\n"];

      uint64_t v11 = rbs_process_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __26__RBProcess__lock_suspend__block_invoke_cold_2();
      }

      int v12 = rbs_process_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __26__RBProcess__lock_suspend__block_invoke_cold_1();
      }

      if ([*(id *)(*v1 + 16) platform] == 6)
      {
        uint64_t v13 = rbs_process_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = *(void **)(*v1 + 16);
          *(_DWORD *)buf = 138412290;
          v25 = v14;
          _os_log_impl(&dword_226AB3000, v13, OS_LOG_TYPE_DEFAULT, "Not emitting 0xdead10cc error for process %@ suspended with locked system files because it is a Mac Catalyst app. Mac Catalyst apps should always be terminated on suspension, regardless of whether the app holds a shared file lock.", buf, 0xCu);
        }
      }
      else
      {
        id v15 = objc_alloc(MEMORY[0x263F64638]);
        int v16 = [NSString stringWithFormat:@"%@ was suspended with locked system files:\n%@\nnot in allowed directories:\n%@", *(void *)(*v1 + 32), v8, v10];
        uint64_t v13 = [v15 initWithExplanation:v16];

        [v13 setExceptionCode:3735883980];
        [v13 setExceptionDomain:15];
        [v13 setMaximumTerminationResistance:50];
        [v13 setReportType:1];
        __int16 v17 = rbs_sp_telemetry_log();
        if (os_signpost_enabled(v17))
        {
          uint64_t v18 = [*(id *)(*v1 + 16) embeddedApplicationIdentifier];
          id v19 = (void *)v18;
          if (v18)
          {
            int v20 = 0;
            id v21 = (void *)v18;
          }
          else
          {
            uint64_t v22 = [*(id *)(*v1 + 16) xpcServiceIdentifier];
            if (v22)
            {
              int v20 = 0;
              v23 = (void *)v22;
              id v21 = (void *)v22;
            }
            else
            {
              id v21 = [*(id *)(*v1 + 16) consistentLaunchdJobLabel];
              v23 = 0;
              int v20 = 1;
            }
          }
          *(_DWORD *)buf = 138543362;
          v25 = v21;
          _os_signpost_emit_with_name_impl(&dword_226AB3000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SuspendedWithLockedFiles", "BundleIdOverride=%{public, signpost.description:attribute}@ enableTelemetry=YES ", buf, 0xCu);
          if (v20) {

          }
          if (!v19) {
        }
          }

        -[RBProcess _lock_terminateWithContext:](*v1, v13);
      }
    }
    id v3 = (os_unfair_lock_s *)*v1;
  }
  os_unfair_lock_unlock(v3 + 12);
}

- (id)_allowedLockedFilePaths
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v2 = (os_unfair_lock_s *)(a1 + 48);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    id v3 = *(id *)(a1 + 16);
    id v4 = *(id *)(a1 + 200);
    id v5 = *(id *)(a1 + 208);
    id v6 = *(id *)(a1 + 168);
    id v7 = *(id *)(a1 + 32);
    int v8 = *(_DWORD *)(a1 + 8);
    os_unfair_lock_unlock(v2);
    if ([v3 isXPCService])
    {
      __int16 v9 = 0;
LABEL_61:

      goto LABEL_62;
    }
    __int16 v10 = [MEMORY[0x263EFF980] array];
    if (v4)
    {
      uint64_t v11 = rbs_process_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[RBProcess _allowedLockedFilePaths].cold.7();
      }

      [v10 addObject:v4];
    }
    if (v5)
    {
      int v12 = rbs_process_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[RBProcess _allowedLockedFilePaths].cold.6();
      }

      [v10 addObject:v5];
    }
    uint64_t v13 = [v6 environmentVariables];
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __36__RBProcess__allowedLockedFilePaths__block_invoke;
    v61[3] = &unk_2647C8248;
    id v14 = v10;
    id v62 = v14;
    [v13 enumerateKeysAndObjectsUsingBlock:v61];

    if (([v3 isEmbeddedApplication] & 1) == 0 && !objc_msgSend(v3, "isAngel"))
    {
LABEL_53:
      id v56 = v3;
      id v43 = v6;
      id v44 = v5;
      id v45 = v4;
      id v46 = v7;
      __int16 v9 = objc_msgSend(MEMORY[0x263EFF9C0], "set", v54);
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v47 = v14;
      uint64_t v48 = [v47 countByEnumeratingWithState:&v57 objects:v63 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v49; ++i)
          {
            if (*(void *)v58 != v50) {
              objc_enumerationMutation(v47);
            }
            v52 = [*(id *)(*((void *)&v57 + 1) + 8 * i) stringByStandardizingPath];
            [v9 addObject:v52];
          }
          uint64_t v49 = [v47 countByEnumeratingWithState:&v57 objects:v63 count:16];
        }
        while (v49);
      }

      id v7 = v46;
      id v4 = v45;
      id v5 = v44;
      id v6 = v43;
      id v3 = v56;
      goto LABEL_61;
    }
    id v15 = [v6 dataContainerURL];
    int v16 = [v15 path];

    if (v16 && [v16 length])
    {
      [v14 addObject:v16];
      __int16 v17 = rbs_process_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[RBProcess _allowedLockedFilePaths].cold.5();
      }

      goto LABEL_52;
    }
    uint64_t v78 = 0;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long buffer = 0u;
    long long v71 = 0u;
    if (proc_pidinfo(*(_DWORD *)(a1 + 8), 3, 0, &buffer, 136) != 136)
    {
      v27 = rbs_process_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v65) = v8;
        _os_log_impl(&dword_226AB3000, v27, OS_LOG_TYPE_DEFAULT, "Could not get proc_pidinfo for pid %d to get ruid/euid", buf, 8u);
      }

      uint64_t v28 = [@"/var/root" stringByAppendingPathComponent:@"/Library/Caches/"];
      v29 = [v3 embeddedApplicationIdentifier];
      uint64_t v30 = [v28 stringByAppendingPathComponent:v29];

      if (v30 && [v30 length])
      {
        [v14 addObject:v30];
        v31 = rbs_process_log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
          -[RBProcess _allowedLockedFilePaths]();
        }
      }
      v32 = [@"/var/mobile" stringByAppendingPathComponent:@"/Library/Caches/"];
      v33 = [v3 embeddedApplicationIdentifier];
      int v16 = [v32 stringByAppendingPathComponent:v33];

      if (!v16 || ![v16 length]) {
        goto LABEL_52;
      }
      [v14 addObject:v16];
      char v34 = rbs_process_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        -[RBProcess _allowedLockedFilePaths]();
      }
      goto LABEL_51;
    }
    uid_t v18 = HIDWORD(v71);
    *__error() = 0;
    id v19 = getpwuid(v18);
    v54 = v14;
    uid_t v55 = v18;
    if (v19)
    {
      int v20 = [NSString stringWithUTF8String:v19->pw_dir];
      id v21 = [v20 stringByAppendingPathComponent:@"/Library/Caches/"];
      uint64_t v22 = [v3 embeddedApplicationIdentifier];
      v23 = [v21 stringByAppendingPathComponent:v22];

      uint64_t v24 = v23;
      if (!v23)
      {
        id v14 = v54;
        goto LABEL_41;
      }
      uint64_t v25 = [v23 length];
      id v14 = v54;
      if (!v25)
      {
LABEL_41:
        uid_t v36 = DWORD1(v71);
        if (DWORD1(v71) == v55)
        {
          int v16 = v24;
          goto LABEL_52;
        }
        v37 = v24;
        *__error() = 0;
        v38 = getpwuid(v36);
        if (v38)
        {
          uint64_t v39 = [NSString stringWithUTF8String:v38->pw_dir];
          v40 = [v39 stringByAppendingPathComponent:@"/Library/Caches/"];
          id v41 = [v3 embeddedApplicationIdentifier];
          int v16 = [v40 stringByAppendingPathComponent:v41];

          if (!v16)
          {
            id v14 = v54;
            goto LABEL_52;
          }
          id v14 = v54;
          if (![v16 length])
          {
LABEL_52:

            goto LABEL_53;
          }
          [v54 addObject:v16];
          char v34 = rbs_process_log();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
            -[RBProcess _allowedLockedFilePaths]();
          }
        }
        else
        {
          char v34 = rbs_process_log();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            int v42 = *__error();
            *(_DWORD *)buf = 138543874;
            id v65 = v7;
            __int16 v66 = 1024;
            uid_t v67 = v36;
            __int16 v68 = 1024;
            int v69 = v42;
            _os_log_impl(&dword_226AB3000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: no passwd data for euid %d (errno %d)", buf, 0x18u);
          }
          int v16 = v37;
          id v14 = v54;
        }
LABEL_51:

        goto LABEL_52;
      }
      [v54 addObject:v24];
      uint64_t v26 = rbs_process_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[RBProcess _allowedLockedFilePaths]();
      }
    }
    else
    {
      uint64_t v26 = rbs_process_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v35 = *__error();
        *(_DWORD *)buf = 138543874;
        id v65 = v7;
        __int16 v66 = 1024;
        uid_t v67 = v18;
        __int16 v68 = 1024;
        int v69 = v35;
        _os_log_impl(&dword_226AB3000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: no passwd data for ruid %d (errno %d)", buf, 0x18u);
      }
      uint64_t v24 = v16;
    }

    goto LABEL_41;
  }
  __int16 v9 = 0;
LABEL_62:
  return v9;
}

- (id)_lock_lockedFilePathsIgnoring:(uint64_t)a1
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v70 = a2;
  if (a1)
  {
    int v3 = *(_DWORD *)(a1 + 8);
    unsigned int v4 = proc_pidinfo(v3, 1, 0, 0, 0);
    if ((v4 & 0x80000000) == 0)
    {
      int v5 = v4;
      uint64_t v69 = a1;
      int pid = v3;
      v64 = malloc_type_malloc(v4, 0xEE1CEF11uLL);
      int v6 = proc_pidinfo(v3, 1, 0, v64, v5);
      id v7 = [MEMORY[0x263EFF9C0] set];
      id v65 = [MEMORY[0x263F08850] defaultManager];
      if (v6 >= 8)
      {
        uint64_t v8 = v6 >> 3;
        __int16 v9 = (int *)v64;
        while (v9[1] != 1)
        {
LABEL_19:
          v9 += 2;
          if (!--v8) {
            goto LABEL_20;
          }
        }
        long long v90 = 0u;
        memset(v91, 0, 336);
        long long v89 = 0u;
        memset(&buffer, 0, sizeof(buffer));
        unsigned int v10 = proc_pidfdinfo(v3, *v9, 2, &buffer, 1200);
        if (v10)
        {
          unsigned int v11 = v10;
          if (v10 > 0x4AF)
          {
            size_t v21 = strlen(v91);
            if (v21)
            {
              uint64_t v22 = [v65 stringWithFileSystemRepresentation:v91 length:v21];
              int v12 = v22;
              if (v22)
              {
                v23 = [v22 stringByStandardizingPath];
                [v7 addObject:v23];
              }
              goto LABEL_18;
            }
            int v12 = rbs_process_log();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              uint64_t v24 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v24;
              id v15 = v12;
              int v16 = "%{public}@ nodeFDInfo.pvip.vip_path is empty for one fd";
              uint32_t v17 = 12;
              goto LABEL_17;
            }
          }
          else
          {
            int v12 = rbs_process_log();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              uint64_t v13 = *(void *)(a1 + 32);
              int v14 = *v9;
              *(_DWORD *)buf = 138544130;
              *(void *)&uint8_t buf[4] = v13;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v11;
              *(_WORD *)&buf[18] = 2048;
              *(void *)&buf[20] = 1200;
              *(_WORD *)&buf[28] = 1024;
              *(_DWORD *)&buf[30] = v14;
              id v15 = v12;
              int v16 = "%{public}@ Weird size (%d != %lu) for fd %d";
              uint32_t v17 = 34;
LABEL_17:
              _os_log_error_impl(&dword_226AB3000, v15, OS_LOG_TYPE_ERROR, v16, buf, v17);
            }
          }
        }
        else
        {
          int v12 = rbs_process_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v18 = *(void *)(a1 + 32);
            int v19 = *v9;
            int v20 = *__error();
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v18;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v19;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = v20;
            id v15 = v12;
            int v16 = "%{public}@ proc_pidfdinfo failed for fd %d with errno %d";
            uint32_t v17 = 24;
            goto LABEL_17;
          }
        }
LABEL_18:

        goto LABEL_19;
      }
LABEL_20:
      id v66 = [MEMORY[0x263EFF9C0] set];
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id obj = v7;
      uint64_t v25 = [obj countByEnumeratingWithState:&v77 objects:v86 count:16];
      if (!v25) {
        goto LABEL_72;
      }
      uint64_t v26 = v25;
      uint64_t v71 = *(void *)v78;
LABEL_22:
      uint64_t v27 = 0;
      while (1)
      {
        if (*(void *)v78 != v71) {
          objc_enumerationMutation(obj);
        }
        id v28 = *(id *)(*((void *)&v77 + 1) + 8 * v27);
        v29 = (const char *)[v28 UTF8String];
        memset(&buffer, 0, sizeof(buffer));
        if (stat(v29, &buffer)) {
          break;
        }
        if ((buffer.st_mode & 0xF000) == 0x8000) {
          goto LABEL_30;
        }
        v37 = rbs_process_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          uint64_t v44 = *(void *)(v69 + 32);
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v44;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v28;
          uint64_t v39 = v37;
          v40 = "%{public}@ Not checking lock on special file: %{public}@";
          goto LABEL_49;
        }
LABEL_50:

LABEL_51:
        if (++v27 == v26)
        {
          uint64_t v61 = [obj countByEnumeratingWithState:&v77 objects:v86 count:16];
          uint64_t v26 = v61;
          if (!v61)
          {
LABEL_72:
            id v62 = obj;

            free(v64);
            goto LABEL_76;
          }
          goto LABEL_22;
        }
      }
      uint64_t v30 = rbs_process_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v46 = *(void *)(v69 + 32);
        id v47 = __error();
        uint64_t v48 = strerror(*v47);
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v46;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v28;
        *(_WORD *)&buf[22] = 2082;
        *(void *)&buf[24] = v48;
        _os_log_error_impl(&dword_226AB3000, v30, OS_LOG_TYPE_ERROR, "%{public}@ Could not stat %{public}@: %{public}s", buf, 0x20u);
      }

LABEL_30:
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v31 = v70;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v73 objects:v85 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v74;
LABEL_32:
        uint64_t v35 = 0;
        while (1)
        {
          if (*(void *)v74 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v36 = *(void *)(*((void *)&v73 + 1) + 8 * v35);
          if ([v28 hasPrefix:v36]) {
            break;
          }
          if (v33 == ++v35)
          {
            uint64_t v33 = [v31 countByEnumeratingWithState:&v73 objects:v85 count:16];
            if (v33) {
              goto LABEL_32;
            }
            goto LABEL_38;
          }
        }
        id v41 = rbs_process_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          uint64_t v42 = *(void *)(v69 + 32);
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v42;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v28;
          *(_WORD *)&buf[22] = 2114;
          *(void *)&buf[24] = v36;
          _os_log_impl(&dword_226AB3000, v41, OS_LOG_TYPE_INFO, "%{public}@: Ignoring file %{public}@ because it is in an allowed path:  %{public}@", buf, 0x20u);
        }

        v37 = rbs_process_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          uint64_t v43 = *(void *)(v69 + 32);
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v43;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v28;
          uint64_t v39 = v37;
          v40 = "%{public}@: Ignoring file because it is in an allowed path: %{public}@";
          goto LABEL_49;
        }
        goto LABEL_50;
      }
LABEL_38:

      if (([v28 hasSuffix:@"-shm"] & 1) != 0
        || ([v28 hasSuffix:@"-wal"] & 1) != 0
        || [v28 hasSuffix:@"-journal"])
      {
        v37 = rbs_process_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          uint64_t v38 = *(void *)(v69 + 32);
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v38;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v28;
          uint64_t v39 = v37;
          v40 = "%{public}@ Ignoring SQLite journal file: %{public}@";
LABEL_49:
          _os_log_impl(&dword_226AB3000, v39, OS_LOG_TYPE_INFO, v40, buf, 0x16u);
          goto LABEL_50;
        }
      }
      else
      {
        char value = 0;
        if (getxattr(v29, "com.apple.runningboard.can-suspend-locked", 0, 0, 0, 0) == 1) {
          getxattr(v29, "com.apple.runningboard.can-suspend-locked", &value, 1uLL, 0, 0);
        }
        if (value)
        {
          v37 = rbs_process_log();
          if (!os_log_type_enabled(v37, OS_LOG_TYPE_INFO)) {
            goto LABEL_50;
          }
          uint64_t v45 = *(void *)(v69 + 32);
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v45;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v28;
          uint64_t v39 = v37;
          v40 = "%{public}@ Ignoring file with can-suspend-locked: %{public}@";
          goto LABEL_49;
        }
        int v49 = _sqlite3_lockstate();
        if (v49)
        {
          if (v49 == 1)
          {
            uint64_t v50 = rbs_process_log();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              uint64_t v51 = *(void *)(v69 + 32);
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v51;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v28;
              v52 = buf;
              uint64_t v53 = v50;
              os_log_type_t v54 = OS_LOG_TYPE_INFO;
              uid_t v55 = "%{public}@ Found locked SQLite database: %{public}@";
              goto LABEL_62;
            }
          }
          else
          {
            *(void *)&buf[8] = 0;
            *(_DWORD *)&buf[20] = 3;
            *(void *)buf = 0;
            *(_DWORD *)&buf[16] = pid;
            int v57 = open(v29, 0x20000);
            if (v57 < 1) {
              goto LABEL_51;
            }
            int v58 = v57;
            int v59 = fcntl(v57, 66, buf);
            close(v58);
            if (v59 == -1 || (*(_WORD *)&buf[20] & 0xFFFD) != 1) {
              goto LABEL_51;
            }
            uint64_t v50 = rbs_process_log();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v60 = *(void *)(v69 + 32);
              int v81 = 138543618;
              uint64_t v82 = v60;
              __int16 v83 = 2114;
              id v84 = v28;
              v52 = (uint8_t *)&v81;
              uint64_t v53 = v50;
              os_log_type_t v54 = OS_LOG_TYPE_DEFAULT;
              uid_t v55 = "%{public}@ Found locked file lock: %{public}@";
LABEL_62:
              _os_log_impl(&dword_226AB3000, v53, v54, v55, v52, 0x16u);
            }
          }

          [v66 addObject:v28];
          goto LABEL_51;
        }
        v37 = rbs_process_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          uint64_t v56 = *(void *)(v69 + 32);
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v56;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v28;
          uint64_t v39 = v37;
          v40 = "%{public}@ Ignoring unlocked SQLite database: %{public}@";
          goto LABEL_49;
        }
      }
      goto LABEL_50;
    }
    id v62 = rbs_process_log();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      -[RBProcess _lock_lockedFilePathsIgnoring:]();
    }
    id v66 = 0;
LABEL_76:
  }
  else
  {
    id v66 = 0;
  }

  return v66;
}

void __41__RBProcess_processStateApplicationQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.runningboardservices.rbprocess-state-application", v2);
  uint64_t v1 = (void *)processStateApplicationQueue_queue;
  processStateApplicationQueue_queue = (uint64_t)v0;
}

+ (id)testProcessWithPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int v4 = objc_msgSend(MEMORY[0x263F64580], "identifierWithPid:");
  int v5 = [MEMORY[0x263F64598] identityForExecutablePath:@"/test" pid:v3 auid:0];
  int v6 = [MEMORY[0x263F645A8] instanceWithIdentifier:v4 identity:v5];
  id v7 = [MEMORY[0x263F64508] portForSelf];
  uint64_t v8 = [RBProcess alloc];
  __int16 v9 = [v7 auditToken];
  unsigned int v10 = +[RBJetsamPropertyManager testJetsamProperties];
  LOBYTE(v13) = 0;
  id v11 = [(RBProcess *)v8 _initWithInstance:v6 auditToken:v9 bundleProperties:0 jetsamProperties:v10 initialState:0 hostProcess:0 properties:0 systemPreventsIdleSleep:v13];

  return v11;
}

+ (id)testProcessWithPid:(int)a3 andIdentity:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  int v5 = (void *)MEMORY[0x263F64580];
  id v6 = a4;
  id v7 = [v5 identifierWithPid:v4];
  uint64_t v8 = [MEMORY[0x263F645A8] instanceWithIdentifier:v7 identity:v6];

  __int16 v9 = [MEMORY[0x263F64508] portForSelf];
  unsigned int v10 = [RBProcess alloc];
  id v11 = [v9 auditToken];
  int v12 = +[RBJetsamPropertyManager testJetsamProperties];
  LOBYTE(v15) = 0;
  id v13 = [(RBProcess *)v10 _initWithInstance:v8 auditToken:v11 bundleProperties:0 jetsamProperties:v12 initialState:0 hostProcess:0 properties:0 systemPreventsIdleSleep:v15];

  return v13;
}

+ (id)testProcessWithPid:(int)a3 identity:(id)a4 launchdProps:(id)a5 andBundleProps:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  __int16 v9 = (void *)MEMORY[0x263F64580];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [v9 identifierWithPid:v8];
  int v14 = [MEMORY[0x263F645A8] instanceWithIdentifier:v13 identity:v12];

  uint64_t v15 = [MEMORY[0x263F64508] portForSelf];
  int v16 = [RBProcess alloc];
  uint32_t v17 = [v15 auditToken];
  uint64_t v18 = +[RBJetsamPropertyManager testJetsamProperties];
  LOBYTE(v21) = 0;
  id v19 = [(RBProcess *)v16 _initWithInstance:v14 auditToken:v17 bundleProperties:v10 jetsamProperties:v18 initialState:0 hostProcess:0 properties:v11 systemPreventsIdleSleep:v21];

  return v19;
}

+ (void)_runOnDiagnosticQueue:(uint64_t)a1
{
  dispatch_block_t block = a2;
  self;
  if (_runOnDiagnosticQueue__onceToken != -1) {
    dispatch_once(&_runOnDiagnosticQueue__onceToken, &__block_literal_global_12);
  }
  uint64_t v2 = [MEMORY[0x263F64660] currentContext];
  uint64_t v3 = v2;
  if (v2) {
    [v2 handoffToQueue:_runOnDiagnosticQueue__diagnosticQ block:block];
  }
  else {
    dispatch_async((dispatch_queue_t)_runOnDiagnosticQueue__diagnosticQ, block);
  }
}

void __35__RBProcess__runOnDiagnosticQueue___block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.runningboardservices.diagnostics", v2);
  uint64_t v1 = (void *)_runOnDiagnosticQueue__diagnosticQ;
  _runOnDiagnosticQueue__diagnosticQ = (uint64_t)v0;
}

- (RBProcess)init
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RBProcess.m" lineNumber:206 description:@"-init is not allowed on RBProcess"];

  return 0;
}

- (void)setAuditToken:(id)a3
{
  uint64_t v4 = (RBSAuditToken *)a3;
  int v5 = v4;
  if (v4) {
    [(RBSAuditToken *)v4 realToken];
  }
  char v6 = RBSAuditTokenRepresentsPlatformBinary();
  os_unfair_lock_lock(&self->_dataLock);
  auditToken = self->_auditToken;
  self->_auditToken = v5;

  self->_platformBinary = v6;
  os_unfair_lock_unlock(&self->_dataLock);
}

- (double)processStartTime
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  double result = self->_cachedProcessStartTime;
  if (result == 0.0)
  {
    unint64_t v21 = 0;
    long long v20 = 0u;
    memset(buffer, 0, sizeof(buffer));
    p_int pid = &self->_pid;
    if (proc_pidinfo(self->_pid, 3, 0, buffer, 136) == 136)
    {
      int v5 = [MEMORY[0x263F08AB0] processInfo];
      [v5 systemUptime];
      double v7 = v6;

      self->_double cachedProcessStartTime = v7
                                    - (CFAbsoluteTimeGetCurrent()
                                     + *MEMORY[0x263EFFAF8])
                                    + (double)*((unint64_t *)&v20 + 1)
                                    + (double)v21 / 1000000.0;
      RBSMachAbsoluteTime();
      double v9 = v8;
      id v10 = rbs_assertion_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        double cachedProcessStartTime = self->_cachedProcessStartTime;
        int v13 = 134218496;
        double v14 = cachedProcessStartTime;
        __int16 v15 = 2048;
        double v16 = v9;
        __int16 v17 = 2048;
        double v18 = v9 - cachedProcessStartTime;
        _os_log_impl(&dword_226AB3000, v10, OS_LOG_TYPE_DEFAULT, "processStartTime calculated start is %f (now:%f, diff%f)", (uint8_t *)&v13, 0x20u);
      }

      return self->_cachedProcessStartTime;
    }
    else
    {
      id v12 = rbs_assertion_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(RBProcess *)p_pid processStartTime];
      }

      self->_double cachedProcessStartTime = 0.0001;
      return 0.0001;
    }
  }
  return result;
}

- (void)setProcessStartTime:(double)a3
{
  self->_double cachedProcessStartTime = a3;
}

- (BOOL)isJetsamManaged
{
  return (self->_manageFlags >> 3) & 1;
}

- (BOOL)isBeingPtraced
{
  return MEMORY[0x270F5BE40](self->_pid, a2);
}

- (BOOL)isContainerized
{
  auditToken = self->_auditToken;
  if (auditToken) {
    [(RBSAuditToken *)auditToken realToken];
  }
  int v4 = sandbox_check_by_audit_token();
  if (v4)
  {
    int v5 = self->_auditToken;
    if (v5) {
      [(RBSAuditToken *)v5 realToken];
    }
    LOBYTE(v4) = sandbox_container_path_for_audit_token() == 0;
  }
  return v4;
}

- (void)_applyJetsamLenientModeState:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if ((*(unsigned char *)(a1 + 109) & 8) == 0)
    {
      uint64_t v3 = rbs_process_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 32);
        int v15 = 138543362;
        uint64_t v16 = v4;
        int v5 = "%{public}@ Ignoring jetsam lenient mode because this process is not memory-managed";
LABEL_5:
        double v6 = v3;
        os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
        uint32_t v8 = 12;
LABEL_18:
        _os_log_impl(&dword_226AB3000, v6, v7, v5, (uint8_t *)&v15, v8);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
    os_unfair_lock_lock((os_unfair_lock_t)&_applyJetsamLenientModeState__lock);
    uint64_t v10 = _applyJetsamLenientModeState__count;
    if (!a2)
    {
      --_applyJetsamLenientModeState__count;
      os_unfair_lock_unlock((os_unfair_lock_t)&_applyJetsamLenientModeState__lock);
      if (v10 == 1)
      {
        if (memorystatus_control())
        {
          if (*__error() == 3) {
            return;
          }
          uint64_t v3 = rbs_process_log();
          if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
            -[RBProcess _applyJetsamLenientModeState:]();
          }
          goto LABEL_19;
        }
        uint64_t v3 = rbs_process_log();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = *(void *)(a1 + 32);
          int v15 = 138543362;
          uint64_t v16 = v13;
          int v5 = "%{public}@ Disabled jetsam lenient mode";
          goto LABEL_5;
        }
LABEL_19:

        return;
      }
      uint64_t v3 = rbs_process_log();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
        goto LABEL_19;
      }
      uint64_t v12 = *(void *)(a1 + 32);
      int v15 = 138543618;
      uint64_t v16 = v12;
      __int16 v17 = 2048;
      uint64_t v18 = _applyJetsamLenientModeState__count;
      int v5 = "%{public}@ Tried to disable jetsam lenient mode but it is still in use (count %lu)";
LABEL_17:
      double v6 = v3;
      os_log_type_t v7 = OS_LOG_TYPE_INFO;
      uint32_t v8 = 22;
      goto LABEL_18;
    }
    ++_applyJetsamLenientModeState__count;
    os_unfair_lock_unlock((os_unfair_lock_t)&_applyJetsamLenientModeState__lock);
    if (v10)
    {
      uint64_t v3 = rbs_process_log();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
        goto LABEL_19;
      }
      uint64_t v11 = *(void *)(a1 + 32);
      int v15 = 138543618;
      uint64_t v16 = v11;
      __int16 v17 = 2048;
      uint64_t v18 = _applyJetsamLenientModeState__count;
      int v5 = "%{public}@ Tried to enable jetsam lenient mode but it is already enabled (count %lu)";
      goto LABEL_17;
    }
    if (!memorystatus_control())
    {
      uint64_t v3 = rbs_process_log();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = 138543362;
      uint64_t v16 = v14;
      int v5 = "%{public}@ Enabled jetsam lenient mode";
      goto LABEL_5;
    }
    if (*__error() != 3)
    {
      uint64_t v3 = rbs_process_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        -[RBProcess _applyJetsamLenientModeState:]();
      }
      goto LABEL_19;
    }
  }
}

- (void)collectDiagnostic:(unint64_t)a3 description:(id)a4 domain:(unsigned int)a5 code:(unint64_t)a6 additionalPayload:(id)a7 completion:(id)a8
{
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  os_unfair_lock_lock(&self->_lock);
  self->_terminating = 1;
  BOOL diagnosticsStarted = self->_diagnosticsStarted;
  self->_BOOL diagnosticsStarted = 1;
  os_unfair_lock_unlock(&self->_lock);
  if (diagnosticsStarted)
  {
    (*((void (**)(id, void, void))v16 + 2))(v16, 0, 0);
  }
  else
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __84__RBProcess_collectDiagnostic_description_domain_code_additionalPayload_completion___block_invoke;
    v32[3] = &unk_2647C81F8;
    v32[4] = self;
    id v33 = v16;
    uint64_t v18 = (void *)MEMORY[0x22A6611D0](v32);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __84__RBProcess_collectDiagnostic_description_domain_code_additionalPayload_completion___block_invoke_2;
    v25[3] = &unk_2647C8220;
    unint64_t v29 = a3;
    v25[4] = self;
    unsigned int v31 = a5;
    id v26 = v14;
    unint64_t v30 = a6;
    id v27 = v15;
    id v19 = v18;
    id v28 = v19;
    +[RBProcess _runOnDiagnosticQueue:]((uint64_t)RBProcess, v25);
    dispatch_time_t v20 = dispatch_time(0, 5000000000);
    unint64_t v21 = dispatch_get_global_queue(25, 0);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __84__RBProcess_collectDiagnostic_description_domain_code_additionalPayload_completion___block_invoke_54;
    v23[3] = &unk_2647C7F40;
    id v24 = v19;
    id v22 = v19;
    dispatch_after(v20, v21, v23);
  }
}

void __84__RBProcess_collectDiagnostic_description_domain_code_additionalPayload_completion___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48));
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 80);
  *(unsigned char *)(v2 + 80) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48));
  if (!v3)
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

uint64_t __84__RBProcess_collectDiagnostic_description_domain_code_additionalPayload_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2 == 3)
  {
    int v3 = rbs_process_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 32);
      int v10 = 138543362;
      uint64_t v11 = v4;
      _os_log_impl(&dword_226AB3000, v3, OS_LOG_TYPE_INFO, "%{public}@ Taking tailspin...", (uint8_t *)&v10, 0xCu);
    }

    int v5 = -[RBProcess _generateTailspin](*(void *)(a1 + 32));
    double v6 = rbs_process_log();
    os_log_type_t v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 32);
        int v10 = 138543362;
        uint64_t v11 = v8;
        _os_log_impl(&dword_226AB3000, v7, OS_LOG_TYPE_INFO, "%{public}@ Tailspin complete", (uint8_t *)&v10, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __84__RBProcess_collectDiagnostic_description_domain_code_additionalPayload_completion___block_invoke_2_cold_1();
      }
    }
  }
  else if (v2 == 2)
  {
    -[RBProcess _generateStackshotWithDescription:domain:code:additionalPayload:](*(void **)(a1 + 32), *(void **)(a1 + 40), *(_DWORD *)(a1 + 80), *(void *)(a1 + 72), *(void **)(a1 + 48));
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (uint64_t)_generateStackshotWithDescription:(int)a3 domain:(uint64_t)a4 code:(void *)a5 additionalPayload:
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a5;
  if (!a1)
  {
    uint64_t v14 = 0;
    goto LABEL_13;
  }
  uint64_t v11 = rbs_process_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = a1[4];
    *(_DWORD *)buf = 138543362;
    uint64_t v21 = v12;
    _os_log_impl(&dword_226AB3000, v11, OS_LOG_TYPE_INFO, "%{public}@ Taking stackshot...", buf, 0xCu);
  }

  uint64_t v22 = 0;
  *(_DWORD *)buf = a3;
  uint64_t v21 = a4;
  [a1 _sendSignal:17];
  if (v10)
  {
    if (WriteCrashReportWithStackshotWithPayload()) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v13 = rbs_process_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = a1[4];
      int v18 = 138543362;
      uint64_t v19 = v16;
      _os_log_impl(&dword_226AB3000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Stackshot generation skipped", (uint8_t *)&v18, 0xCu);
    }
    uint64_t v14 = 0;
    goto LABEL_12;
  }
  if (!WriteCrashReportWithStackshot()) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v13 = rbs_process_log();
  uint64_t v14 = 1;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = a1[4];
    int v18 = 138543362;
    uint64_t v19 = v15;
    _os_log_impl(&dword_226AB3000, v13, OS_LOG_TYPE_INFO, "%{public}@ Stackshot complete", (uint8_t *)&v18, 0xCu);
  }
LABEL_12:

LABEL_13:
  return v14;
}

- (uint64_t)_generateTailspin
{
  uint64_t v1 = 0;
  if (a1 && MEMORY[0x263F8C860])
  {
    int v3 = [NSString stringWithFormat:@"/tmp/com.apple.runningboardd/"];
    uint64_t v4 = [MEMORY[0x263F08850] defaultManager];
    if ([v4 fileExistsAtPath:v3])
    {
      id v5 = 0;
    }
    else
    {
      double v6 = rbs_general_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        [(RBProcess *)(uint64_t)v3 _generateTailspin];
      }

      id v34 = 0;
      [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v34];
      id v5 = v34;
    }
    if (([v4 fileExistsAtPath:v3] & 1) == 0)
    {
      uint64_t v13 = rbs_general_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        [(RBProcess *)(uint64_t)v5 _generateTailspin];
      }
      uint64_t v1 = 0;
      goto LABEL_23;
    }
    uint64_t v13 = objc_alloc_init(MEMORY[0x263F08790]);
    [v13 setDateFormat:@"yyyy-MM-dd-HHmmss"];
    uint64_t v14 = NSString;
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = [MEMORY[0x263EFF910] date];
    __int16 v17 = [v13 stringFromDate:v16];
    int v18 = [v14 stringWithFormat:@"ts-%@-%@.tailspin", v15, v17];

    id v19 = [v3 stringByAppendingPathComponent:v18];
    dispatch_time_t v20 = (const char *)[v19 cStringUsingEncoding:1];

    int v21 = open(v20, 514, 420);
    if (v21 == -1)
    {
      unsigned int v31 = rbs_process_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[RBProcess _generateTailspin]();
      }
    }
    else
    {
      int v22 = v21;
      uint64_t v23 = tailspin_config_create_with_default_config();
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v1 = 1;
        tailspin_enabled_set();
        tailspin_dump_output_sync();
        MEMORY[0x22A661740](v24);
        close(v22);
LABEL_22:

LABEL_23:
        return v1;
      }
      uint64_t v32 = rbs_process_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[RBProcess _generateTailspin]();
      }

      close(v22);
    }
    uint64_t v1 = 0;
    goto LABEL_22;
  }
  return v1;
}

uint64_t __84__RBProcess_collectDiagnostic_description_domain_code_additionalPayload_completion___block_invoke_54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)terminateWithContext:(id)a3
{
  int v3 = self;
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  LOBYTE(v3) = -[RBProcess _lock_terminateWithContext:]((uint64_t)v3, v5);

  os_unfair_lock_unlock(p_lock);
  return (char)v3;
}

- (uint64_t)_lock_terminateWithContext:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = rbs_process_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v5;
      __int16 v18 = 2114;
      id v19 = v3;
      _os_log_impl(&dword_226AB3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Terminating with context: %{public}@", buf, 0x16u);
    }

    *(unsigned char *)(a1 + 128) = 1;
    if (!v3)
    {
      id v3 = objc_alloc_init(MEMORY[0x263F64638]);
      [v3 setReportType:0];
      [v3 setMaximumTerminationResistance:40];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 52));
    uint64_t v6 = [*(id *)(a1 + 152) copyWithTerminationContext:v3];
    uint64_t v7 = *(void **)(a1 + 152);
    *(void *)(a1 + 152) = v6;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 52));
    [v3 reportType];
    [v3 exceptionDomain];
    [v3 exceptionCode];
    id v8 = [v3 description];
    [v8 UTF8String];
    int v9 = terminate_with_reason();

    uint64_t v10 = rbs_process_log();
    uint64_t v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[RBProcess _lock_terminateWithContext:]();
      }

      char v12 = [(id)a1 _sendSignal:9];
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v17 = v13;
        _os_log_impl(&dword_226AB3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ terminate_with_reason() success", buf, 0xCu);
      }

      char v12 = 1;
    }
    unsigned __int8 v15 = v12;
  }
  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (BOOL)_sendSignal:(int)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = rbs_process_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    shortDescription = self->_shortDescription;
    int v9 = 138543618;
    uint64_t v10 = shortDescription;
    __int16 v11 = 1024;
    int v12 = a3;
    _os_log_impl(&dword_226AB3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Sending kill(%d)", (uint8_t *)&v9, 0x12u);
  }

  if (!kill(self->_pid, a3) || *__error() == 3) {
    return 1;
  }
  id v8 = rbs_process_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[RBProcess _sendSignal:]();
  }

  return 0;
}

- (void)_lock_setCPULimits:(uint64_t)a1 violationPolicy:(int *)a2
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a1)
  {
    *__error() = 0;
    if ([*(id *)(a1 + 64) effectiveMaxCPUUsageViolationPolicy] == 2)
    {
      if (proc_set_cpumon_params_fatal())
      {
LABEL_4:
        if (*__error() == 3) {
          return;
        }
        uint64_t v4 = rbs_process_log();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          -[RBProcess _lock_setCPULimits:violationPolicy:]();
        }
        goto LABEL_10;
      }
    }
    else if (proc_set_cpumon_params())
    {
      goto LABEL_4;
    }
    uint64_t v4 = rbs_process_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = *a2;
      int v7 = a2[1];
      int v8 = 138543874;
      uint64_t v9 = v5;
      __int16 v10 = 1024;
      int v11 = v6;
      __int16 v12 = 1024;
      int v13 = v7;
      _os_log_impl(&dword_226AB3000, v4, OS_LOG_TYPE_INFO, "%{public}@ Enabled CPU monitoring %d%%/%ds", (uint8_t *)&v8, 0x18u);
    }
LABEL_10:
  }
}

void __36__RBProcess__allowedLockedFilePaths__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (([v6 isEqualToString:@"CFFIXED_USER_HOME"] & 1) != 0
    || ([v6 isEqualToString:@"HOME"] & 1) != 0
    || [v6 isEqualToString:@"TMPDIR"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(a1 + 32) addObject:v5];
    }
  }
}

- (void)invokeHandlerOnProcessDeath:(id)a3 onQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_procSource) {
    -[RBProcess invokeHandlerOnProcessDeath:onQueue:]();
  }
  int v8 = v7;
  uintptr_t pid = self->_pid;
  __int16 v10 = [MEMORY[0x263F64650] sharedBackgroundWorkloop];
  int v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83E0], pid, 0xA0000000uLL, v10);
  procSource = self->_procSource;
  self->_procSource = v11;

  dispatch_set_qos_class_fallback();
  int v13 = self->_procSource;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __49__RBProcess_invokeHandlerOnProcessDeath_onQueue___block_invoke;
  handler[3] = &unk_2647C7F68;
  handler[4] = self;
  id v17 = v8;
  id v18 = v6;
  id v14 = v6;
  id v15 = v8;
  dispatch_source_set_event_handler(v13, handler);
  dispatch_activate((dispatch_object_t)self->_procSource);
}

void __49__RBProcess_invokeHandlerOnProcessDeath_onQueue___block_invoke(uint64_t a1)
{
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __49__RBProcess_invokeHandlerOnProcessDeath_onQueue___block_invoke_2;
  activity_block[3] = &unk_2647C7F68;
  uint64_t v2 = *(void **)(a1 + 40);
  activity_block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  _os_activity_initiate(&dword_226AB3000, "Process Event", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __49__RBProcess_invokeHandlerOnProcessDeath_onQueue___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int data = dispatch_source_get_data(*(dispatch_source_t *)(*(void *)(a1 + 32) + 112));
  if ((data & 0x20000000) != 0)
  {
    RBSMachAbsoluteTime();
    double v4 = v3;
    [*(id *)(a1 + 32) processStartTime];
    double v6 = v5;
    id v7 = rbs_general_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 32);
      int v14 = 138543618;
      uint64_t v15 = v13;
      __int16 v16 = 2048;
      double v17 = v4 - v6;
      _os_log_error_impl(&dword_226AB3000, v7, OS_LOG_TYPE_ERROR, "NOTE: unexpected exec event for %{public}@ after %f seconds - hoping it is a delayed xpcproxy exec notification", (uint8_t *)&v14, 0x16u);
    }
  }
  if (data < 0)
  {
    int v8 = rbs_process_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 32);
      int v14 = 138543362;
      uint64_t v15 = v9;
      _os_log_impl(&dword_226AB3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ termination reported by proc_exit", (uint8_t *)&v14, 0xCu);
    }

    dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 112));
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void **)(v10 + 112);
    *(void *)(v10 + 112) = 0;

    dispatch_time_t v12 = dispatch_time(0, 100000000);
    dispatch_after(v12, *(dispatch_queue_t *)(a1 + 40), *(dispatch_block_t *)(a1 + 48));
  }
}

- (BOOL)matchesProcess:(id)a3
{
  return [(RBSProcessHandle *)self->_handle matchesProcess:a3];
}

- (id)processPredicate
{
  return (id)[MEMORY[0x263F645D8] predicateMatchingIdentifier:self->_instance];
}

- (id)createRBSTarget
{
  uint64_t v2 = (void *)MEMORY[0x263F64630];
  uint64_t v3 = [(RBProcess *)self rbs_pid];
  return (id)[v2 targetWithPid:v3];
}

- (RBSProcessExitStatus)intendedExitStatus
{
  return self->_intendedExitStatus;
}

- (void)setIntendedExitStatus:(id)a3
{
}

- (int)pidversion
{
  return self->_pidversion;
}

- (NSString)homeDirectory
{
  return self->_homeDirectory;
}

- (NSString)tmpDirectory
{
  return self->_tmpDirectory;
}

- (unint64_t)resourceCoalitionID
{
  return self->_resourceCoalitionID;
}

- (void)setResourceCoalitionID:(unint64_t)a3
{
  self->_resourceCoalitionID = a3;
}

- (unint64_t)jetsamCoalitionID
{
  return self->_jetsamCoalitionID;
}

- (void)setJetsamCoalitionID:(unint64_t)a3
{
  self->_jetsamCoalitionID = a3;
}

- (BOOL)isJetsamCoalitionLeader
{
  return self->_jetsamCoalitionLeader;
}

- (void)setJetsamCoalitionLeader:(BOOL)a3
{
  self->_jetsamCoalitionLeader = a3;
}

- (void)_memoryStatusControl:flags:.cold.1()
{
  dispatch_queue_t v0 = __error();
  strerror(*v0);
  __error();
  OUTLINED_FUNCTION_1_3(&dword_226AB3000, v1, v2, "%{public}@ Memorystatus failed with unexpected error: %s (%d)", v3, v4, v5, v6, 2u);
}

- (void)_initWithInstance:auditToken:bundleProperties:jetsamProperties:initialState:hostProcess:properties:systemPreventsIdleSleep:cache:.cold.1()
{
  __assert_rtn("-[RBProcess _initWithInstance:auditToken:bundleProperties:jetsamProperties:initialState:hostProcess:properties:systemPreventsIdleSleep:cache:]", "RBProcess.m", 254, "[[instance identity] osServiceType] != RBSOSServiceProcessIdentityTypeUnknown");
}

- (void)_initWithInstance:auditToken:bundleProperties:jetsamProperties:initialState:hostProcess:properties:systemPreventsIdleSleep:cache:.cold.2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "could not find extension point for %@", v2, v3, v4, v5, v6);
}

- (void)memoryLimits
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_226AB3000, a2, OS_LOG_TYPE_FAULT, "Memory Limits for process:%{public}@ unknown", (uint8_t *)&v2, 0xCu);
}

- (void)processStartTime
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "Could not get proc_pidinfo for pid %d, using defaults", (uint8_t *)v3, 8u);
}

- (void)_lock_shutdownSocketsAndLog:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = OUTLINED_FUNCTION_16();
  uint64_t v5 = strerror(*v4);
  int v6 = 138543618;
  uint64_t v7 = v2;
  __int16 v8 = 2080;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "%{public}@ pid_shutdown_sockets() failed with error: %s", (uint8_t *)&v6, 0x16u);
}

- (void)_applyJetsamLenientModeState:.cold.1()
{
  OUTLINED_FUNCTION_13();
  dispatch_queue_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_226AB3000, v1, v2, "%{public}@ Error %d enabling jetsam lenient mode: %s", v3, v4, v5, v6, v7);
}

- (void)_applyJetsamLenientModeState:.cold.2()
{
  OUTLINED_FUNCTION_13();
  dispatch_queue_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_226AB3000, v1, v2, "%{public}@ Error %d disabling jetsam lenient mode: %s", v3, v4, v5, v6, v7);
}

void __23__RBProcess_invalidate__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "RBProcess %{public}@ invalidated before invokeHandlerOnProcessDeath handler was invoked", v2, v3, v4, v5, v6);
}

void __84__RBProcess_collectDiagnostic_description_domain_code_additionalPayload_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "%{public}@ Tailspin generation failed!", v2, v3, v4, v5, v6);
}

- (void)_generateTailspin
{
}

- (void)_lock_terminateWithContext:.cold.1()
{
  OUTLINED_FUNCTION_12(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_226AB3000, v0, v1, "%{public}@ terminate_with_reason() failed with error: %d");
}

- (void)_sendSignal:.cold.1()
{
  uint64_t v0 = __error();
  strerror(*v0);
  __error();
  OUTLINED_FUNCTION_18(&dword_226AB3000, v1, v2, "%{public}@ kill(%d) failed. Error: %s (%d)", v3, v4, v5, v6, 2u);
}

void __26__RBProcess__lock_suspend__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "%{public}@ locked files not in allowed directories: %{public}@");
}

void __26__RBProcess__lock_suspend__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "%{public}@ suspended with locked system files:\n%{public}@\n");
}

- (void)_allowedLockedFilePaths
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_226AB3000, v0, v1, "%{public}@: home directory '%{public}@' allowed");
}

- (void)_lock_lockedFilePathsIgnoring:.cold.1()
{
  OUTLINED_FUNCTION_13();
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_226AB3000, v1, v2, "%{public}@ Could not get file descriptor count: %d/%s", v3, v4, v5, v6, v7);
}

- (void)_lock_setCPULimits:violationPolicy:.cold.1()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7_0(&dword_226AB3000, v0, v1, "%{public}@ Error enabling CPU monitoring: %d", v2, v3, v4, v5, v6);
}

- (void)invokeHandlerOnProcessDeath:onQueue:.cold.1()
{
  __assert_rtn("-[RBProcess invokeHandlerOnProcessDeath:onQueue:]", "RBProcess.m", 1750, "_procSource == nil");
}

@end