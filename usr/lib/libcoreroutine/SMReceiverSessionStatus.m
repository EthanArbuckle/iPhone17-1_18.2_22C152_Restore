@interface SMReceiverSessionStatus
@end

@implementation SMReceiverSessionStatus

void __86__SMReceiverSessionStatus_RTCoreDataTransformable__createWithReceiverSessionStatusMO___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F99888]);
  v3 = [*(id *)(a1 + 32) initiatorPrimaryHandle];
  v4 = [*(id *)(a1 + 32) initiatorSecondaryHandles];
  id v37 = (id)[v2 initWithPrimaryHandle:v3 secondaryHandles:v4];

  id v5 = objc_alloc(MEMORY[0x1E4F5CE00]);
  [*(id *)(a1 + 32) locationOfTriggerLatitude];
  double v7 = v6;
  [*(id *)(a1 + 32) locationOfTriggerLongitude];
  double v9 = v8;
  [*(id *)(a1 + 32) locationOfTriggerHorizontalUncertainty];
  double v11 = v10;
  [*(id *)(a1 + 32) locationOfTriggerAltitude];
  double v13 = v12;
  [*(id *)(a1 + 32) locationOfTriggerVerticalUncertainty];
  double v15 = v14;
  v16 = [*(id *)(a1 + 32) locationOfTriggerDate];
  uint64_t v17 = [*(id *)(a1 + 32) locationOfTriggerReferenceFrame];
  [*(id *)(a1 + 32) locationOfTriggerSpeed];
  v19 = [v5 initWithLatitude:v16 longitude:v17 horizontalUncertainty:(int)objc_msgSend(*(id *)(a1 + 32), "locationOfTriggerSourceAccuracy") altitude:v7 verticalUncertainty:v9 date:v11 referenceFrame:v13 speed:v15 sourceAccuracy:v18];

  id v20 = objc_alloc(MEMORY[0x1E4F998F8]);
  v21 = [*(id *)(a1 + 32) identifier];
  v22 = [*(id *)(a1 + 32) sessionID];
  uint64_t v23 = [v20 initWithIdentifier:v21 sessionID:v22 initiatorHandle:v37];
  uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
  v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;

  v26 = [*(id *)(a1 + 32) receiverHandle];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setReceiverHandle:v26];

  v27 = [*(id *)(a1 + 32) lastUpdateDate];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLastUpdateDate:v27];

  v28 = [*(id *)(a1 + 32) cacheExpiryDate];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setCacheExpiryDate:v28];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setSessionEndReason:[*(id *)(a1 + 32) sessionEndReason]];
  v29 = [*(id *)(a1 + 32) cacheRequestDate];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setCacheRequestDate:v29];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setTriggerType:[*(id *)(a1 + 32) triggerType]];
  v30 = [*(id *)(a1 + 32) triggerDate];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setTriggerDate:v30];

  v31 = [*(id *)(a1 + 32) destinationMapItem];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDestinationMapItem:v31];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDestinationType:*(int *)(*(void *)(a1 + 32) + 4)];
  v32 = [*(id *)(a1 + 32) estimatedEndDate];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setEstimatedEndDate:v32];

  v33 = [*(id *)(a1 + 32) coarseEstimatedEndDate];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setCoarseEstimatedEndDate:v33];

  v34 = [*(id *)(a1 + 32) sessionStartDate];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setSessionStartDate:v34];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setSessionType:objc_msgSend(*(id *)(a1 + 32), "sessionType")];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setZoneShareAccepted:[*(id *)(a1 + 32) zoneShareAccepted]];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setSessionState:[*(id *)(a1 + 32) sessionState]];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLocationOfTrigger:v19];
  v35 = [*(id *)(a1 + 32) lastSessionStartInfoRequestDate];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLastSessionStartInfoRequestDate:v35];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setSessionStartInfoRequestCount:*(int *)(*(void *)(a1 + 32) + 40)];
  v36 = [*(id *)(a1 + 32) lastKeyReleaseInfoRequestDate];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLastKeyReleaseInfoRequestDate:v36];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setKeyReleaseInfoRequestCount:[*(id *)(a1 + 32) keyReleaseInfoRequestCount]];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setIsSOSTrigger:[*(id *)(a1 + 32) isSOSTrigger]];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLowPowerModeWarningState:[*(id *)(a1 + 32) lowPowerModeWarningState]];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setCacheDownloadError:[*(id *)(a1 + 32) cacheDownloadError]];
}

@end