@interface SBAppRepairTransaction
- (BOOL)_canBeInterrupted;
- (NSSet)appInfos;
- (SBAppRepairTransaction)initWithApplicationInfos:(id)a3;
- (void)_begin;
- (void)_completeRequest:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_didComplete;
- (void)_evaluateCompletion;
- (void)_startAppRepairs;
- (void)dealloc;
@end

@implementation SBAppRepairTransaction

- (SBAppRepairTransaction)initWithApplicationInfos:(id)a3
{
  id v4 = a3;
  v5 = [(SBTransaction *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    appInfos = v5->_appInfos;
    v5->_appInfos = (NSSet *)v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    repairRequests = v5->_repairRequests;
    v5->_repairRequests = v8;

    id v10 = objc_alloc(MEMORY[0x1E4FA9558]);
    v11 = [(id)SBApp systemStatusServer];
    uint64_t v12 = [v10 initWithServerHandle:v11];
    telephonyDomain = v5->_telephonyDomain;
    v5->_telephonyDomain = (STTelephonyStatusDomain *)v12;
  }
  return v5;
}

- (void)dealloc
{
  [(STTelephonyStatusDomain *)self->_telephonyDomain invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBAppRepairTransaction;
  [(SBAppRepairTransaction *)&v3 dealloc];
}

- (void)_begin
{
  [(id)SBApp noteKeybagRefetchTransactionIsActive:1];
  objc_super v3 = +[SBTelephonyManager sharedTelephonyManager];
  id v4 = [(STTelephonyStatusDomain *)self->_telephonyDomain data];
  v5 = [v4 primarySIMInfo];
  uint64_t v6 = [v5 dataNetworkType];

  if (v6 || ([v3 hasNonCellularNetworkConnection] & 1) != 0) {
    [(SBAppRepairTransaction *)self _startAppRepairs];
  }
  else {
    [(SBAppRepairTransaction *)self _failWithReason:@"appRepairRequiresNetwork" description:@"no data connection"];
  }
  v7.receiver = self;
  v7.super_class = (Class)SBAppRepairTransaction;
  [(SBAppRepairTransaction *)&v7 _begin];
}

- (void)_didComplete
{
  [(NSMutableSet *)self->_repairRequests removeAllObjects];
  [(id)SBApp noteKeybagRefetchTransactionIsActive:0];
  v3.receiver = self;
  v3.super_class = (Class)SBAppRepairTransaction;
  [(SBAppRepairTransaction *)&v3 _didComplete];
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_evaluateCompletion
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45__SBAppRepairTransaction__evaluateCompletion__block_invoke;
  v2[3] = &unk_1E6AF99E8;
  v2[4] = self;
  [(SBAppRepairTransaction *)self evaluateMilestone:@"appRepair" withEvaluator:v2];
}

BOOL __45__SBAppRepairTransaction__evaluateCompletion__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 160) count] == 0;
}

- (void)_completeRequest:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  if (!a4) {
    [(SBAppRepairTransaction *)self _failWithReason:@"appRepairFailed" description:@"refetch request failed" precipitatingError:a5];
  }
  [(NSMutableSet *)self->_repairRequests removeObject:v8];
  [(SBAppRepairTransaction *)self _evaluateCompletion];
}

- (void)_startAppRepairs
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  objc_super v3 = self->_appInfos;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v9 = [v8 purchaserDSID];
        if (v9)
        {
          id v10 = objc_alloc(MEMORY[0x1E4F4BCC0]);
          v11 = [v8 bundleIdentifier];
          uint64_t v12 = objc_msgSend(v10, "initWithBundleID:accountIdentifier:claimStyle:", v11, v9, objc_msgSend(v8, "type") == 2);

          [v12 setExitReason:16];
          if (v12) {
            [(NSMutableSet *)self->_repairRequests addObject:v12];
          }
        }
      }
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v5);
  }

  [(SBAppRepairTransaction *)self addMilestone:@"appRepair"];
  if (![(NSMutableSet *)self->_repairRequests count])
  {
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F4BCC0]) initWithBundleID:0 accountIdentifier:0 claimStyle:1];
    if (v13) {
      [(NSMutableSet *)self->_repairRequests addObject:v13];
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = self->_repairRequests;
  uint64_t v14 = [(NSMutableSet *)obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v24 + 1) + 8 * j);
        if ([(SBAppRepairTransaction *)self isAuditHistoryEnabled])
        {
          v19 = [v18 bundleID];
          v20 = [v18 accountDSID];
          [(SBAppRepairTransaction *)self _addAuditHistoryItem:@"Running app repair request %p for %@ (%@).", v18, v19, v20];
        }
        v21 = [MEMORY[0x1E4F4BCC8] defaultService];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __42__SBAppRepairTransaction__startAppRepairs__block_invoke;
        v23[3] = &unk_1E6AF5B68;
        v23[4] = self;
        v23[5] = v18;
        [v21 repairAppWithOptions:v18 replyHandler:v23];
      }
      uint64_t v15 = [(NSMutableSet *)obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v15);
  }

  [(SBAppRepairTransaction *)self _evaluateCompletion];
}

void __42__SBAppRepairTransaction__startAppRepairs__block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  objc_super v7 = [*(id *)(a1 + 32) queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__SBAppRepairTransaction__startAppRepairs__block_invoke_2;
  v9[3] = &unk_1E6AF5B18;
  long long v10 = *(_OWORD *)(a1 + 32);
  char v12 = a2;
  id v11 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

uint64_t __42__SBAppRepairTransaction__startAppRepairs__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isAuditHistoryEnabled])
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = NSStringFromBOOL();
    [v2 _addAuditHistoryItem:@"Got response for request %p with success: %@.", v3, v4];
  }
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 48);
  return [v5 _completeRequest:v6 success:v7 error:v8];
}

- (NSSet)appInfos
{
  return self->_appInfos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyDomain, 0);
  objc_storeStrong((id *)&self->_repairRequests, 0);
  objc_storeStrong((id *)&self->_appInfos, 0);
}

@end