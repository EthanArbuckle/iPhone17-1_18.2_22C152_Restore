@interface SMSessionManagerState
@end

@implementation SMSessionManagerState

void __84__SMSessionManagerState_RTCoreDataTransformable__createWithSMSessionManagerStateMO___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F99968]);
  uint64_t v3 = (int)[*(id *)(a1 + 32) updateReason];
  uint64_t v4 = (int)[*(id *)(a1 + 32) triggerCategory];
  v5 = (void *)MEMORY[0x1E4F99918];
  v6 = [*(id *)(a1 + 32) sessionConfiguration];
  v7 = [v5 createWithManagedObject:v6];
  v8 = [v7 sessionID];
  v36 = (void *)[v2 initWithUpdateReason:v3 triggerCategory:v4 sessionID:v8];

  id v33 = objc_alloc(MEMORY[0x1E4F99950]);
  uint64_t v32 = (int)[*(id *)(a1 + 32) sessionState];
  v9 = (void *)MEMORY[0x1E4F99918];
  v34 = [*(id *)(a1 + 32) sessionConfiguration];
  v31 = [v9 createWithManagedObject:v34];
  uint64_t v30 = (int)[*(id *)(a1 + 32) userTriggerResponse];
  v29 = [*(id *)(a1 + 32) date];
  id v10 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  [*(id *)(a1 + 32) locationLatitude];
  double v12 = v11;
  [*(id *)(a1 + 32) locationLongitude];
  v28 = (void *)[v10 initWithLatitude:v12 longitude:v13];
  v35 = [*(id *)(a1 + 32) allowReadToken];
  v25 = [*(id *)(a1 + 32) safetyCacheKey];
  v27 = [*(id *)(a1 + 32) startMessageGUID];
  v24 = [*(id *)(a1 + 32) scheduledSendMessageGUID];
  v26 = [*(id *)(a1 + 32) scheduledSendMessageDate];
  v23 = [*(id *)(a1 + 32) activeDeviceIdentifier];
  v14 = [*(id *)(a1 + 32) estimatedEndDate];
  v15 = [*(id *)(a1 + 32) coarseEstimatedEndDate];
  uint64_t v16 = (int)[*(id *)(a1 + 32) estimatedEndDateStatus];
  uint64_t v17 = (int)[*(id *)(a1 + 32) sessionEndReason];
  v18 = [*(id *)(a1 + 32) sessionStateTransitionDate];
  v19 = [*(id *)(a1 + 32) activePairedDeviceIdentifier];
  uint64_t v20 = objc_msgSend(v33, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", v32, v31, v30, v36, v29, v28, v35, v25, v27, v24, v26, v23, v14, v15, v16,
          v17,
          v18,
          v19);
  uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
  v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;
}

@end