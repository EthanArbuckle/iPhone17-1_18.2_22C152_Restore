@interface RBRequestManager
- (RBRequestManager)initWithContext:(id)a3;
- (id)acquireDroppedLaunchAssertion:(id)a3 requestor:(id)a4;
- (uint64_t)_checkAndAdjustLaunchRequest:(void *)a3 requestor:(void *)a4 entitlements:;
- (uint64_t)_checkExtensionLaunchFromRequstor:(id *)a3 AndAdjustRequest:;
- (uint64_t)_checkLaunchByAnyAndAdjustRequest:(uint64_t)a1;
- (void)_createAcquisitionContext:(void *)a3 requestor:(void *)a4 assertionIdentifier:(int)a5 isAbstractTarget:;
- (void)_executeLaunchRequestWithAssertion:(void *)a3 requestor:(void *)a4 completion:;
- (void)_finishLaunchRequestAfterAssertionAcquisition:(void *)a3 requestor:(void *)a4 identifier:(void *)a5 error:(void *)a6 completion:;
- (void)executeLaunchRequest:(id)a3 euid:(unsigned int)a4 requestor:(id)a5 entitlements:(id)a6 completion:(id)a7;
@end

@implementation RBRequestManager

- (void)executeLaunchRequest:(id)a3 euid:(unsigned int)a4 requestor:(id)a5 entitlements:(id)a6 completion:(id)a7
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = [v11 context];
  v16 = [v15 appID];

  if (v16)
  {
    v17 = [MEMORY[0x263F64598] identityForLSApplicationIdentity:v16];
    v18 = rbs_connection_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = [v16 identityString];
      *(_DWORD *)buf = 138543618;
      v35 = v19;
      __int16 v36 = 2114;
      v37 = v17;
      _os_log_impl(&dword_226AB3000, v18, OS_LOG_TYPE_INFO, "Resolved identity for launch request for %{public}@ to %{public}@", buf, 0x16u);
    }
    if (v17)
    {
      v20 = [v11 context];
      [v20 setIdentity:v17];
    }
  }
  id v33 = v11;
  char v21 = -[RBRequestManager _checkAndAdjustLaunchRequest:requestor:entitlements:]((uint64_t)self, &v33, v12, v13);
  id v22 = v33;

  if (v21)
  {
    v23 = [v22 context];
    v24 = [v23 attributes];
    if ([v24 count])
    {
      -[RBRequestManager _executeLaunchRequestWithAssertion:requestor:completion:]((uint64_t)self, v22, v12, v14);
    }
    else
    {
      v26 = (void *)MEMORY[0x263F64660];
      v27 = +[RBConnectionClient sharedLaunchWorkloop]();
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __80__RBRequestManager_executeLaunchRequest_euid_requestor_entitlements_completion___block_invoke;
      v28[3] = &unk_2647C8D10;
      v28[4] = self;
      id v29 = v22;
      id v30 = v23;
      id v31 = v12;
      id v32 = v14;
      [v26 handoffContextOnQueue:v27 block:v28];
    }
  }
  else
  {
    v25 = rbs_connection_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[RBRequestManager executeLaunchRequest:euid:requestor:entitlements:completion:]((uint64_t)v12, v25);
    }

    v23 = objc_msgSend(MEMORY[0x263F087E8], "rbs_errorClientNotAuthorized");
    (*((void (**)(id, void, void, void, void *))v14 + 2))(v14, 0, 0, 0, v23);
  }
}

- (uint64_t)_checkAndAdjustLaunchRequest:(void *)a3 requestor:(void *)a4 entitlements:
{
  id v7 = a3;
  id v8 = a4;
  if (!a1)
  {
    uint64_t v11 = 0;
    goto LABEL_12;
  }
  if (!a2) {
    -[RBRequestManager _checkAndAdjustLaunchRequest:requestor:entitlements:]();
  }
  v9 = [*a2 context];
  v10 = [v9 identity];
  if (([v10 isXPCService] & 1) != 0 || objc_msgSend(v9, "hostPid"))
  {
  }
  else
  {
    v15 = [v9 extensionOverlay];

    if (!v15)
    {
      v16 = [v9 identity];
      uint64_t v17 = [v16 isDext];

      if ((v17 & 1) == 0)
      {
        if ([v8 hasEntitlementDomain:2]) {
          goto LABEL_7;
        }
        uint64_t v13 = -[RBRequestManager _checkLaunchByAnyAndAdjustRequest:](a1, a2);
LABEL_10:
        uint64_t v11 = v13;
        goto LABEL_11;
      }
      id v12 = RBLaunchDextsEntitlement;
LABEL_9:
      uint64_t v13 = [v8 hasEntitlement:*v12];
      goto LABEL_10;
    }
  }
  if ((-[RBRequestManager _checkExtensionLaunchFromRequstor:AndAdjustRequest:](a1, v7, a2) & 1) == 0)
  {
    id v12 = RBLaunchExtensionsEntitlement;
    goto LABEL_9;
  }
LABEL_7:
  uint64_t v11 = 1;
LABEL_11:

LABEL_12:
  return v11;
}

void __76__RBRequestManager__executeLaunchRequestWithAssertion_requestor_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x263F64660];
  v5 = +[RBConnectionClient sharedLaunchWorkloop]();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__RBRequestManager__executeLaunchRequestWithAssertion_requestor_completion___block_invoke_2;
  v8[3] = &unk_2647C8C98;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v6;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v12 = v3;
  id v14 = *(id *)(a1 + 72);
  id v13 = *(id *)(a1 + 64);
  id v7 = v3;
  [v4 handoffContextOnQueue:v5 block:v8];
}

- (uint64_t)_checkExtensionLaunchFromRequstor:(id *)a3 AndAdjustRequest:
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (a1)
  {
    v6 = [*a3 context];
    id v7 = [v6 identity];
    if (![v7 isExtension])
    {
      a1 = 0;
LABEL_21:

      goto LABEL_22;
    }
    id v8 = [v7 hostIdentifier];
    id v9 = [v5 identifier];
    if (v8 == v9)
    {
    }
    else
    {
      id v10 = v9;
      if (!v8 || !v9)
      {

LABEL_13:
        id v14 = rbs_process_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          id v31 = v5;
          __int16 v32 = 2114;
          id v33 = v7;
          _os_log_impl(&dword_226AB3000, v14, OS_LOG_TYPE_INFO, "Not mutating extension launch from %{public}@ for %{public}@ since requestor is not the host", buf, 0x16u);
        }
        a1 = 0;
LABEL_20:

        goto LABEL_21;
      }
      char v11 = [v8 isEqual:v9];

      if ((v11 & 1) == 0) {
        goto LABEL_13;
      }
    }
    id v12 = (void *)MEMORY[0x263F644E0];
    id v13 = [v6 identity];
    id v14 = [v12 contextWithIdentity:v13];

    v15 = [v6 attributes];
    [v14 setAttributes:v15];

    v16 = [v6 explanation];
    [v14 setExplanation:v16];

    uint64_t v17 = [v6 oneShotUUID];
    [v14 setOneShotUUID:v17];

    v18 = [v5 handle];
    [v14 setRequestorHandle:v18];

    v19 = [v5 identifier];
    -[NSObject setHostPid:](v14, "setHostPid:", objc_msgSend(v19, "rbs_pid"));

    v20 = [v6 managedEndpointLaunchIdentifiers];
    [v14 setManagedEndpointLaunchIdentifiers:v20];

    char v21 = [v6 requiredExistingProcess];
    [v14 setRequiredExistingProcess:v21];

    id v22 = [*(id *)(a1 + 8) extensionDataProvider];
    id v29 = 0;
    a1 = [v22 configureLaunchContext:v14 error:&v29];
    id v23 = v29;

    if (a1)
    {
      v24 = [v6 attributes];
      [v14 setAttributes:v24];

      v25 = [v6 managedEndpointLaunchIdentifiers];
      [v14 setManagedEndpointLaunchIdentifiers:v25];

      v26 = [v6 requiredExistingProcess];
      [v14 setRequiredExistingProcess:v26];

      *a3 = (id)[objc_alloc(MEMORY[0x263F644F0]) initWithContext:v14];
    }
    else
    {
      v27 = rbs_process_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v31 = v5;
        __int16 v32 = 2114;
        id v33 = v7;
        __int16 v34 = 2114;
        id v35 = v23;
        _os_log_impl(&dword_226AB3000, v27, OS_LOG_TYPE_DEFAULT, "Extension launch from %{public}@ for %{public}@ failed with error %{public}@", buf, 0x20u);
      }
    }
    goto LABEL_20;
  }
LABEL_22:

  return a1;
}

void __80__RBRequestManager_executeLaunchRequest_euid_requestor_entitlements_completion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) processManager];
  if (v2)
  {
    id v3 = rbs_ttl_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [*(id *)(a1 + 40) context];
      id v5 = [v4 identity];
      v6 = [v5 shortDescription];
      id v7 = [*(id *)(a1 + 48) explanation];
      uint64_t v8 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      v19 = v6;
      __int16 v20 = 2114;
      char v21 = v7;
      __int16 v22 = 2114;
      uint64_t v23 = v8;
      _os_log_impl(&dword_226AB3000, v3, OS_LOG_TYPE_DEFAULT, "Executing launch request for %{public}@ (%{public}@) from requestor: %{public}@", buf, 0x20u);
    }
    uint64_t v9 = *(void *)(a1 + 40);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __80__RBRequestManager_executeLaunchRequest_euid_requestor_entitlements_completion___block_invoke_22;
    v14[3] = &unk_2647C8CE8;
    id v15 = *(id *)(a1 + 64);
    [v2 executeLaunchRequest:v9 withCompletion:v14];
    id v10 = v15;
  }
  else
  {
    char v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F646A8];
    uint64_t v16 = *MEMORY[0x263F08338];
    uint64_t v17 = @"Unable to execute launch request";
    id v13 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v10 = [v11 errorWithDomain:v12 code:5 userInfo:v13];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __104__RBRequestManager__finishLaunchRequestAfterAssertionAcquisition_requestor_identifier_error_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8 = a4;
  if (!a2)
  {
    v6 = *(void **)(a1 + 40);
    id v7 = [*(id *)(a1 + 48) identifier];
    [v6 invalidateAssertionFromOriginator:v7 withIdentifier:*(void *)(a1 + 32)];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __80__RBRequestManager_executeLaunchRequest_euid_requestor_entitlements_completion___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__RBRequestManager__executeLaunchRequestWithAssertion_requestor_completion___block_invoke_2(uint64_t a1)
{
  -[RBRequestManager _finishLaunchRequestAfterAssertionAcquisition:requestor:identifier:error:completion:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64), *(void **)(a1 + 80));
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) processMonitor];
  [v2 unsuppressUpdatesForIdentity:*(void *)(a1 + 72)];
}

- (void)_executeLaunchRequestWithAssertion:(void *)a3 requestor:(void *)a4 completion:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = [v7 context];
    char v11 = [v10 identity];

    uint64_t v12 = objc_msgSend(MEMORY[0x263F64418], "identifierWithClientPid:", objc_msgSend(v8, "rbs_pid"));
    id v13 = -[RBRequestManager _createAcquisitionContext:requestor:assertionIdentifier:isAbstractTarget:]((void *)a1, v7, v8, v12, 1);
    id v14 = [*(id *)(a1 + 8) processMonitor];
    [v14 suppressUpdatesForIdentity:v11];

    id v15 = [*(id *)(a1 + 8) assertionManager];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __76__RBRequestManager__executeLaunchRequestWithAssertion_requestor_completion___block_invoke;
    v18[3] = &unk_2647C8CC0;
    v18[4] = a1;
    id v19 = v7;
    id v20 = v8;
    id v21 = v12;
    id v22 = v11;
    id v23 = v9;
    id v16 = v11;
    id v17 = v12;
    [v15 acquireAssertionWithContext:v13 completion:v18];
  }
}

- (void)_finishLaunchRequestAfterAssertionAcquisition:(void *)a3 requestor:(void *)a4 identifier:(void *)a5 error:(void *)a6 completion:
{
  v35[1] = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (a1)
  {
    if (v14)
    {
      id v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = *MEMORY[0x263F646A8];
      uint64_t v18 = *MEMORY[0x263F08608];
      v32[0] = *MEMORY[0x263F08338];
      v32[1] = v18;
      v33[0] = @"Unable to execute launch request";
      v33[1] = v14;
      id v19 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
      uint64_t v20 = [v16 errorWithDomain:v17 code:5 userInfo:v19];

      (*((void (**)(id, void, void, void, uint64_t))v15 + 2))(v15, 0, 0, 0, v20);
      id v14 = (id)v20;
    }
    else
    {
      id v21 = [*(id *)(a1 + 8) processManager];
      id v22 = [*(id *)(a1 + 8) assertionManager];
      if (v21)
      {
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __104__RBRequestManager__finishLaunchRequestAfterAssertionAcquisition_requestor_identifier_error_completion___block_invoke;
        v27[3] = &unk_2647C8C70;
        id v31 = v15;
        id v28 = v13;
        id v29 = v22;
        id v30 = v12;
        [v21 executeLaunchRequest:v11 withCompletion:v27];

        id v14 = 0;
      }
      else
      {
        id v23 = (void *)MEMORY[0x263F087E8];
        uint64_t v24 = *MEMORY[0x263F646A8];
        uint64_t v34 = *MEMORY[0x263F08338];
        v35[0] = @"Unable to execute launch request";
        v25 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
        id v14 = [v23 errorWithDomain:v24 code:5 userInfo:v25];

        v26 = [v12 identifier];
        [v22 invalidateAssertionFromOriginator:v26 withIdentifier:v13];

        (*((void (**)(id, void, void, void, id))v15 + 2))(v15, 0, 0, 0, v14);
      }
    }
  }
}

- (void)_createAcquisitionContext:(void *)a3 requestor:(void *)a4 assertionIdentifier:(int)a5 isAbstractTarget:
{
  id v5 = a1;
  if (a1)
  {
    id v9 = a4;
    id v10 = a3;
    id v11 = [a2 context];
    id v12 = [v11 attributes];
    id v13 = [v11 identity];
    id v14 = [MEMORY[0x263F64630] targetWithProcessIdentity:v13];
    id v15 = [v11 explanation];
    id v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v17 = [NSString stringWithFormat:@"RBSLaunchRequest for %@", v14];
    }
    uint64_t v18 = v17;

    id v19 = [MEMORY[0x263F64410] descriptorWithIdentifier:v9 target:v14 explanation:v18 attributes:v12];

    id v5 = +[RBAssertionAcquisitionContext contextForProcess:v10 withDescriptor:v19 daemonContext:v5[1]];

    if (a5) {
      [v5 setAllowAbstractTarget:1];
    }
    [v5 setAcquisitionPolicy:1];
  }
  return v5;
}

- (RBRequestManager)initWithContext:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBRequestManager;
  v6 = [(RBRequestManager *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_daemonContext, a3);
    id v8 = v7;
  }

  return v7;
}

- (uint64_t)_checkLaunchByAnyAndAdjustRequest:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  id v3 = [*a2 context];
  v4 = [v3 identity];
  if ([v4 osServiceType] == 3) {
    goto LABEL_3;
  }
  if (![v4 isApplication]) {
    goto LABEL_7;
  }
  id v13 = [v4 embeddedApplicationIdentifier];

  if (!v13) {
    goto LABEL_7;
  }
  id v14 = (void *)MEMORY[0x263F01868];
  id v15 = [v4 embeddedApplicationIdentifier];
  id v16 = [v14 applicationProxyForIdentifier:v15];

  id v17 = [v16 entitlementValueForKey:@"com.apple.runningboard.trustedtarget" ofClass:objc_opt_class()];
  int v18 = [v17 BOOLValue];

  if (v18)
  {
LABEL_3:
    id v5 = (void *)MEMORY[0x263F644E0];
    v6 = [v3 identity];
    id v7 = [v5 contextWithIdentity:v6];

    id v8 = [v3 attributes];
    [v7 setAttributes:v8];

    id v9 = [v3 explanation];
    [v7 setExplanation:v9];

    objc_super v10 = [v3 managedEndpointLaunchIdentifiers];
    [v7 setManagedEndpointLaunchIdentifiers:v10];

    id v11 = [v3 requiredExistingProcess];
    [v7 setRequiredExistingProcess:v11];

    *a2 = (id)[objc_alloc(MEMORY[0x263F644F0]) initWithContext:v7];
    uint64_t v12 = 1;
  }
  else
  {
LABEL_7:
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)acquireDroppedLaunchAssertion:(id)a3 requestor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 context];
  id v9 = [v8 identity];

  objc_super v10 = objc_msgSend(MEMORY[0x263F64418], "identifierWithClientPid:", objc_msgSend(v6, "rbs_pid"));
  id v11 = -[RBRequestManager _createAcquisitionContext:requestor:assertionIdentifier:isAbstractTarget:](self, v7, v6, v10, 0);

  uint64_t v12 = [(RBDaemonContextProviding *)self->_daemonContext processMonitor];
  [v12 suppressUpdatesForIdentity:v9];

  id v13 = [(RBDaemonContextProviding *)self->_daemonContext assertionManager];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __60__RBRequestManager_acquireDroppedLaunchAssertion_requestor___block_invoke;
  v18[3] = &unk_2647C8270;
  id v19 = v9;
  id v14 = v10;
  id v20 = v14;
  id v21 = self;
  id v15 = v9;
  [v13 acquireAssertionWithContext:v11 completion:v18];

  id v16 = v14;
  return v16;
}

void __60__RBRequestManager_acquireDroppedLaunchAssertion_requestor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = rbs_assertion_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60__RBRequestManager_acquireDroppedLaunchAssertion_requestor___block_invoke_cold_1(a1, (uint64_t)v3, v4);
    }
  }
  id v5 = [*(id *)(*(void *)(a1 + 48) + 8) processMonitor];
  [v5 unsuppressUpdatesForIdentity:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
}

- (void)_checkAndAdjustLaunchRequest:requestor:entitlements:.cold.1()
{
}

void __60__RBRequestManager_acquireDroppedLaunchAssertion_requestor___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_226AB3000, log, OS_LOG_TYPE_ERROR, "Error acquiring launch assertion for target: %@: identifier %{public}@ error: <%{public}@>", (uint8_t *)&v5, 0x20u);
}

- (void)executeLaunchRequest:(uint64_t)a1 euid:(NSObject *)a2 requestor:entitlements:completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "Rejecting launch request because %{public}@ is not entitled to launch processes", (uint8_t *)&v2, 0xCu);
}

@end