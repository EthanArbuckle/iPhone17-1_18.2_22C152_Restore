@interface RBEntitlementManager
+ (id)_hardCodedEntitlements;
- (NSString)debugDescription;
- (NSString)stateCaptureTitle;
- (RBEntitlementManager)initWithDomainAttributeEntitlements:(id)a3;
- (id)allEntitlements;
- (id)captureState;
- (id)entitlementsForProcess:(id)a3;
- (uint64_t)_secTask:(CFStringRef)entitlement hasEntitlement:;
- (void)_entitlementsForProcess:(void *)a1;
- (void)_removeRestrictedEntitlements:(void *)a3 forProcess:;
- (void)purgeEntitlementsForProcess:(id)a3;
@end

@implementation RBEntitlementManager

- (id)entitlementsForProcess:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && ![v4 isTerminating])
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    entitlementsByIdentifier = self->_entitlementsByIdentifier;
    v11 = [v5 identifier];
    id v8 = [(NSMapTable *)entitlementsByIdentifier objectForKey:v11];

    if (!v8)
    {
      v12 = [RBEntitlements alloc];
      v13 = -[RBEntitlementManager _entitlementsForProcess:](self, v5);
      id v8 = [(RBEntitlements *)v12 _initWithEntitlements:v13];

      v14 = self->_entitlementsByIdentifier;
      v15 = [v5 identifier];
      [(NSMapTable *)v14 setObject:v8 forKey:v15];
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v6 = [RBEntitlements alloc];
    v7 = [MEMORY[0x263EFFA08] set];
    id v8 = [(RBEntitlements *)v6 _initWithEntitlements:v7];
  }
  return v8;
}

void __48__RBEntitlementManager__entitlementsForProcess___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  if (-[RBEntitlementManager _secTask:hasEntitlement:](*(void *)(a1 + 32), *(SecTaskRef *)(a1 + 48), v3))[*(id *)(a1 + 40) addObject:v3]; {
}
  }

- (uint64_t)_secTask:(CFStringRef)entitlement hasEntitlement:
{
  if (!a1) {
    return 0;
  }
  CFErrorRef error = 0;
  v3 = (void *)SecTaskCopyValueForEntitlement(task, entitlement, &error);
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v4 = [v3 BOOLValue];
  }
  else {
    uint64_t v4 = 0;
  }
  CFErrorRef v5 = error;
  if (error)
  {
    uint64_t v6 = [(__CFError *)error code];
    v7 = rbs_general_log();
    id v8 = v7;
    if (v6 == 3)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_226AB3000, v8, OS_LOG_TYPE_INFO, "sectask entitlement check made for not-running process", v10, 2u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[RBEntitlementManager _secTask:hasEntitlement:]();
    }
  }
  return v4;
}

- (void)_entitlementsForProcess:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [MEMORY[0x263EFF9C0] set];
    CFErrorRef v5 = [v3 auditToken];
    uint64_t v6 = v5;
    if (v5)
    {
      memset(&v19, 0, sizeof(v19));
      [v5 realToken];
      audit_token_t token = v19;
      SecTaskRef v7 = SecTaskCreateWithAuditToken(0, &token);
      if (v7)
      {
        id v8 = v7;
        v9 = (void *)a1[3];
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __48__RBEntitlementManager__entitlementsForProcess___block_invoke;
        v15[3] = &unk_2647C7FD0;
        v15[4] = a1;
        SecTaskRef v17 = v7;
        id v10 = v4;
        id v16 = v10;
        [v9 enumerateObjectsUsingBlock:v15];
        if (([v10 containsObject:@"com.apple.assertiond.app-state-monitor"] & 1) == 0
          && ([v10 containsObject:@"com.apple.runningboard.testbinary"] & 1) == 0
          && (SecTaskGetCodeSignStatus(v8) & 0xC000001) == 0x4000001
          && ([v3 isTestApp] & 1) == 0)
        {
          [v10 addObject:@"com.apple.assertiond.app-state-monitor"];
        }
        CFRelease(v8);
      }
      else
      {
        v13 = rbs_general_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[RBEntitlementManager _entitlementsForProcess:]();
        }
      }
      -[RBEntitlementManager _removeRestrictedEntitlements:forProcess:]((uint64_t)a1, v4, v3);
      v12 = v4;
    }
    else
    {
      v11 = rbs_process_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[RBEntitlementManager _entitlementsForProcess:]();
      }

      v12 = [MEMORY[0x263EFFA08] set];
    }
    a1 = v12;
  }
  return a1;
}

- (void)_removeRestrictedEntitlements:(void *)a3 forProcess:
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  SecTaskRef v7 = v6;
  if (!a1) {
    goto LABEL_28;
  }
  id v8 = [v6 identity];
  int v23 = [v7 isTestApp];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (!v10)
  {

    v20 = 0;
    goto LABEL_27;
  }
  uint64_t v11 = v10;
  v21 = v7;
  id v22 = v5;
  v24 = 0;
  uint64_t v12 = *(void *)v26;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v26 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * v13);
      v15 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v14, v21, v22);
      id v16 = v15;
      if (v15 && ([v15 containsObject:v8] & 1) == 0)
      {
        if (!os_variant_has_internal_content()
          || ([v8 hasConsistentLaunchdJob] & 1) != 0
          || ([v8 isEmbeddedApplication] & 1) != 0)
        {
          if (v23) {
            goto LABEL_18;
          }
        }
        else if (([v8 isXPCService] ^ 1 | v23))
        {
          goto LABEL_18;
        }
        SecTaskRef v17 = rbs_process_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543618;
          v30 = v8;
          __int16 v31 = 2114;
          uint64_t v32 = v14;
          _os_log_fault_impl(&dword_226AB3000, v17, OS_LOG_TYPE_FAULT, "RunningBoard: Process %{public}@ does not have permission to have entitlement %{public}@", buf, 0x16u);
        }

        v18 = v24;
        if (!v24)
        {
          v18 = [MEMORY[0x263EFF9C0] set];
        }
        v24 = v18;
        [v18 addObject:v14];
      }
LABEL_18:

      ++v13;
    }
    while (v11 != v13);
    uint64_t v19 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
    uint64_t v11 = v19;
  }
  while (v19);

  v20 = v24;
  if (v24) {
    [v9 minusSet:v24];
  }
  SecTaskRef v7 = v21;
  id v5 = v22;
LABEL_27:

LABEL_28:
}

- (RBEntitlementManager)initWithDomainAttributeEntitlements:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"RBEntitlementManager.m", 141, @"Invalid parameter not satisfying: %@", @"entitlements" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)RBEntitlementManager;
  id v6 = [(RBEntitlementManager *)&v17 init];
  SecTaskRef v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    entitlementsByIdentifier = v7->_entitlementsByIdentifier;
    v7->_entitlementsByIdentifier = (NSMapTable *)v8;

    uint64_t v10 = +[RBEntitlementManager _hardCodedEntitlements]();
    uint64_t v11 = [v5 setByAddingObjectsFromSet:v10];
    availableEntitlements = v7->_availableEntitlements;
    v7->_availableEntitlements = (NSSet *)v11;

    uint64_t v13 = restrictedEntitlementsFromPlist();
    restrictedEntitlements = v7->_restrictedEntitlements;
    v7->_restrictedEntitlements = (NSDictionary *)v13;
  }
  return v7;
}

+ (id)_hardCodedEntitlements
{
  self;
  if (_hardCodedEntitlements_onceToken != -1) {
    dispatch_once(&_hardCodedEntitlements_onceToken, &__block_literal_global_5);
  }
  v0 = (void *)_hardCodedEntitlements_hardCodedEntitlements;
  return v0;
}

- (NSString)debugDescription
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = self->_entitlementsByIdentifier;
  uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = [(NSMapTable *)self->_entitlementsByIdentifier objectForKey:v9];
        uint64_t v11 = [v9 description];
        [v3 appendFormat:@"%@=%@\n\t", v11, v10];
      }
      uint64_t v6 = [(NSMapTable *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  id v12 = [NSString alloc];
  uint64_t v13 = [(id)objc_opt_class() description];
  uint64_t v14 = [(NSSet *)self->_availableEntitlements allObjects];
  v15 = [v14 componentsJoinedByString:@",\n\t\t"];
  id v16 = (void *)[v12 initWithFormat:@"<%@|  availableEntitlements:[\n\t\t%@\n\t] entitlementsByIdentifier:[\n\t%@\n\t\t]>", v13, v15, v3];

  return (NSString *)v16;
}

- (id)allEntitlements
{
  v2 = (void *)[(NSSet *)self->_availableEntitlements copy];
  return v2;
}

- (void)purgeEntitlementsForProcess:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  entitlementsByIdentifier = self->_entitlementsByIdentifier;
  uint64_t v7 = [v5 identifier];

  [(NSMapTable *)entitlementsByIdentifier removeObjectForKey:v7];
  os_unfair_lock_unlock(p_lock);
}

- (NSString)stateCaptureTitle
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)captureState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(RBEntitlementManager *)self debugDescription];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

uint64_t __46__RBEntitlementManager__hardCodedEntitlements__block_invoke()
{
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.runningboard.primitiveattribute", @"com.apple.runningboard.endowment-originator", @"com.apple.runningboard.invalidateanyassertion", @"com.apple.runningboard.launchprocess", @"com.apple.runningboard.listallassertions", @"com.apple.runningboard.process-state", @"com.apple.runningboard.statecapture", @"com.apple.runningboard.targetidentities", @"com.apple.runningboard.terminateprocess", @"com.apple.runningboard.terminatemanagedprocesses", @"com.apple.runningboard.performancetest", @"com.apple.runningboard.launch_extensions", @"com.apple.runningboard.launch_dexts", @"com.apple.runningboard.trustedtarget", @"com.apple.runningboard.testbinary", @"com.apple.developer.kernel.increased-memory-limit", @"com.apple.private.security.container-required",
    @"com.apple.backboard.client",
    @"com.apple.assertiond.background-view-services",
    @"com.apple.multitasking.newsstandassertions",
    @"com.apple.assertiond.system-shell",
    @"com.apple.multitasking.systemappassertions",
    @"com.apple.multitasking.termination",
    @"com.apple.multitasking.unlimitedassertions",
    @"com.apple.UIKit.vends-view-services",
    @"com.apple.multitasking.voipassertions",
    @"com.apple.assertiond.app-state-monitor",
    @"com.apple.private.xpc.launchd.app-server",
    @"com.apple.backboardd.debugapplications",
    @"com.apple.springboard.debugapplications",
  _hardCodedEntitlements_hardCodedEntitlements = 0);
  return MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedEntitlements, 0);
  objc_storeStrong((id *)&self->_availableEntitlements, 0);
  objc_storeStrong((id *)&self->_entitlementsByIdentifier, 0);
}

- (void)_entitlementsForProcess:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Unable to load defaults for %{public}@: no audit token", v2, v3, v4, v5, v6);
}

- (void)_entitlementsForProcess:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "SecTaskCreateWithAuditToken failed for %{public}@", v2, v3, v4, v5, v6);
}

- (void)_secTask:hasEntitlement:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "SecTaskCopyValueForEntitlement failed with error %{public}@", v2, v3, v4, v5, v6);
}

@end