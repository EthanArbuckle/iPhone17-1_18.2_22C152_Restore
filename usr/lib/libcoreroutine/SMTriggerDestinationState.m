@interface SMTriggerDestinationState
@end

@implementation SMTriggerDestinationState

void __92__SMTriggerDestinationState_RTCoreDataTransformable__createWithSMTriggerDestinationStateMO___block_invoke(uint64_t a1)
{
  id v24 = objc_alloc(MEMORY[0x1E4F999D0]);
  [*(id *)(a1 + 32) sessionIdentifier_v2];
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = (int)[*(id *)(a1 + 32) currentStatus];
  v22 = [*(id *)(a1 + 32) currentStatusDate];
  v21 = [*(id *)(a1 + 32) lastLockDate];
  v2 = [*(id *)(a1 + 32) lastUnlockDate];
  uint64_t v20 = [*(id *)(a1 + 32) predominantModeOfTransport_v2];
  __int16 v3 = [*(id *)(a1 + 32) numberOfETARetries];
  char v4 = [*(id *)(a1 + 32) shouldRetryETAQuery];
  v5 = [*(id *)(a1 + 32) roundTripReminderDate];
  v6 = [*(id *)(a1 + 32) timeToUpdateStatus];
  id v7 = objc_alloc(MEMORY[0x1E4F999D8]);
  v8 = [*(id *)(a1 + 32) upperBoundEtaMapsUpperBoundEta];
  v9 = [*(id *)(a1 + 32) upperBoundEtaCrowFliesUpperBoundEta];
  v10 = (void *)[v7 initWithMapsUpperBoundEta:v8 crowFliesUpperBoundEta:v9];
  [*(id *)(a1 + 32) mapsExpectedTravelTime];
  double v12 = v11;
  [*(id *)(a1 + 32) remainingDistance];
  double v14 = v13;
  v15 = [*(id *)(a1 + 32) date];
  BYTE2(v19) = v4;
  LOWORD(v19) = v3;
  uint64_t v16 = [v24 initWithSessionIdentifier:v25 currentStatus:v23 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate:v21 lastUnlockDate:v2 currentStatusDate:v22 lastLockDate
  uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
  v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;
}

@end