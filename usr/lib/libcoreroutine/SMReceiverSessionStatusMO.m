@interface SMReceiverSessionStatusMO
+ (id)fetchRequest;
+ (id)managedObjectWithReceiverSessionStatus:(id)a3 inManagedObjectContext:(id)a4;
+ (id)managedObjectWithReceiverSessionStatus:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5;
@end

@implementation SMReceiverSessionStatusMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"SMReceiverSessionStatusMO"];
}

+ (id)managedObjectWithReceiverSessionStatus:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)[a1 managedObjectWithReceiverSessionStatus:a3 managedObject:0 inManagedObjectContext:a4];
}

+ (id)managedObjectWithReceiverSessionStatus:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (!v7)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: sessionStatus";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_7;
  }
  if (v9)
  {
    *(void *)buf = 0;
    v21 = buf;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__51;
    v24 = __Block_byref_object_dispose__51;
    id v25 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __105__SMReceiverSessionStatusMO_managedObjectWithReceiverSessionStatus_managedObject_inManagedObjectContext___block_invoke;
    v15[3] = &unk_1E6B91CA8;
    v19 = buf;
    id v16 = v8;
    id v17 = v10;
    id v18 = v7;
    [v17 performBlockAndWait:v15];
    id v11 = *((id *)v21 + 5);

    _Block_object_dispose(buf, 8);
    goto LABEL_8;
  }
  v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: managedObjectContext";
    goto LABEL_12;
  }
LABEL_7:

  id v11 = 0;
LABEL_8:

  return v11;
}

uint64_t __105__SMReceiverSessionStatusMO_managedObjectWithReceiverSessionStatus_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  v2 = *(SMReceiverSessionStatusMO **)(a1 + 32);
  v3 = v2;
  if (!v2) {
    v3 = [[SMReceiverSessionStatusMO alloc] initWithContext:*(void *)(a1 + 40)];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v3);
  if (!v2) {

  }
  v4 = [*(id *)(a1 + 48) identifier];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setIdentifier:v4];

  v5 = [*(id *)(a1 + 48) lastUpdateDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLastUpdateDate:v5];

  v6 = [*(id *)(a1 + 48) sessionID];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setSessionID:v6];

  id v7 = [*(id *)(a1 + 48) initiatorHandle];
  id v8 = [v7 primaryHandle];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setInitiatorPrimaryHandle:v8];

  id v9 = [*(id *)(a1 + 48) initiatorHandle];
  v10 = [v9 secondaryHandles];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setInitiatorSecondaryHandles:v10];

  id v11 = [*(id *)(a1 + 48) receiverHandle];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setReceiverHandle:v11];

  v12 = [*(id *)(a1 + 48) cacheExpiryDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCacheExpiryDate:v12];

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setSessionEndReason:[*(id *)(a1 + 48) sessionEndReason]];
  v13 = [*(id *)(a1 + 48) cacheRequestDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCacheRequestDate:v13];

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setTriggerType:[*(id *)(a1 + 48) triggerType]];
  v14 = [*(id *)(a1 + 48) triggerDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setTriggerDate:v14];

  v15 = [*(id *)(a1 + 48) destinationMapItem];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setDestinationMapItem:v15];

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setDestinationType:[*(id *)(a1 + 48) destinationType]];
  id v16 = [*(id *)(a1 + 48) estimatedEndDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setEstimatedEndDate:v16];

  id v17 = [*(id *)(a1 + 48) coarseEstimatedEndDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCoarseEstimatedEndDate:v17];

  id v18 = [*(id *)(a1 + 48) sessionStartDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setSessionStartDate:v18];

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setSessionType:*(__int16 *)(*(void *)(a1 + 48) + 0)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setZoneShareAccepted:[*(id *)(a1 + 48) zoneShareAccepted]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setSessionState:*(__int16 *)(*(void *)(a1 + 48) + 1)];
  v19 = [*(id *)(a1 + 48) locationOfTrigger];
  v20 = [v19 date];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationOfTriggerDate:v20];

  v21 = [*(id *)(a1 + 48) locationOfTrigger];
  [v21 latitude];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationOfTriggerLatitude:];

  uint64_t v22 = [*(id *)(a1 + 48) locationOfTrigger];
  [v22 longitude];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationOfTriggerLongitude:];

  v23 = [*(id *)(a1 + 48) locationOfTrigger];
  [v23 horizontalUncertainty];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationOfTriggerHorizontalUncertainty:];

  v24 = [*(id *)(a1 + 48) locationOfTrigger];
  [v24 altitude];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationOfTriggerAltitude:];

  id v25 = [*(id *)(a1 + 48) locationOfTrigger];
  [v25 verticalUncertainty];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationOfTriggerVerticalUncertainty:];

  v26 = [*(id *)(a1 + 48) locationOfTrigger];
  [v26 speed];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationOfTriggerSpeed:];

  v27 = [*(id *)(a1 + 48) locationOfTrigger];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationOfTriggerSourceAccuracy:objc_msgSend(v27, "sourceAccuracy")];

  v28 = [*(id *)(a1 + 48) locationOfTrigger];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationOfTriggerReferenceFrame:((__int16)[v28 referenceFrame])];

  v29 = [*(id *)(a1 + 48) lastSessionStartInfoRequestDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLastSessionStartInfoRequestDate:v29];

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setSessionStartInfoRequestCount:[*(id *)(a1 + 48) sessionStartInfoRequestCount]];
  v30 = [*(id *)(a1 + 48) lastKeyReleaseInfoRequestDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLastKeyReleaseInfoRequestDate:v30];

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setKeyReleaseInfoRequestCount:[*(id *)(a1 + 48) keyReleaseInfoRequestCount]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setIsSOSTrigger:[*(id *)(a1 + 48) isSOSTrigger]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLowPowerModeWarningState:[*(id *)(a1 + 48) lowPowerModeWarningState]];
  uint64_t v31 = (__int16)[*(id *)(a1 + 48) cacheDownloadError];
  v32 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);

  return [v32 setCacheDownloadError:v31];
}

@end