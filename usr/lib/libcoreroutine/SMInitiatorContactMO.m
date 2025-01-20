@interface SMInitiatorContactMO
+ (id)fetchRequest;
+ (id)getLocationMOFromLocation:(id)a3 context:(id)a4;
+ (id)managedObjectWithInitiatorContact:(id)a3 inManagedObjectContext:(id)a4;
+ (id)managedObjectWithInitiatorContact:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5;
@end

@implementation SMInitiatorContactMO

+ (id)managedObjectWithInitiatorContact:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)[a1 managedObjectWithInitiatorContact:a3 managedObject:0 inManagedObjectContext:a4];
}

+ (id)managedObjectWithInitiatorContact:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
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
    v13 = "Invalid parameter not satisfying: initiatorContact";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_7;
  }
  if (v9)
  {
    *(void *)buf = 0;
    v21 = buf;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__12;
    v24 = __Block_byref_object_dispose__12;
    id v25 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __95__SMInitiatorContactMO_managedObjectWithInitiatorContact_managedObject_inManagedObjectContext___block_invoke;
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

void __95__SMInitiatorContactMO_managedObjectWithInitiatorContact_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  v2 = *(SMInitiatorContactMO **)(a1 + 32);
  v3 = v2;
  if (!v2) {
    v3 = [[SMInitiatorContactMO alloc] initWithContext:*(void *)(a1 + 40)];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v3);
  if (!v2) {

  }
  v4 = [*(id *)(a1 + 48) identifier];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setIdentifier:v4];

  v5 = [*(id *)(a1 + 48) shouldBeCleanedUpDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setShouldBeCleanedUpDate:v5];

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCloudkitShareZoneCleanedUpSuccessfully:[*(id *)(a1 + 48) cloudkitShareZoneCleanedUpSuccessfully]];
  v6 = [*(id *)(a1 + 48) keyReleaseMessageSendDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setKeyReleaseMessageSendDate:v6];

  id v7 = [*(id *)(a1 + 48) scheduledSendExpiryDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setScheduledSendExpiryDate:v7];

  id v8 = [*(id *)(a1 + 48) sessionUUID];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setSessionUUID:v8];

  id v9 = [*(id *)(a1 + 48) allowReadToken];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setAllowReadToken:v9];

  v10 = [*(id *)(a1 + 48) safetyCacheKey];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setSafetyCacheKey:v10];

  id v11 = [*(id *)(a1 + 48) syncDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setSyncDate:v11];

  v12 = [*(id *)(a1 + 48) scheduleSendMessageGUID];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setScheduleSendMessageGUID:v12];

  v13 = [*(id *)(a1 + 48) unlockLocation];
  v14 = +[SMInitiatorContactMO getLocationMOFromLocation:v13 context:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setUnlockLocation:v14];

  v15 = [*(id *)(a1 + 48) lockLocation];
  id v16 = +[SMInitiatorContactMO getLocationMOFromLocation:v15 context:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLockLocation:v16];

  id v17 = [*(id *)(a1 + 48) startingLocation];
  id v18 = +[SMInitiatorContactMO getLocationMOFromLocation:v17 context:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setStartingLocation:v18];

  v19 = [*(id *)(a1 + 48) offWristLocation];
  v20 = +[SMInitiatorContactMO getLocationMOFromLocation:v19 context:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setOffWristLocation:v20];

  v21 = [*(id *)(a1 + 48) parkedCarLocation];
  uint64_t v22 = +[SMInitiatorContactMO getLocationMOFromLocation:v21 context:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setParkedCarLocation:v22];

  v23 = [*(id *)(a1 + 48) destinationMapItem];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setDestinationMapItem:v23];

  v24 = [*(id *)(a1 + 48) timeCacheUploadCompletion];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setTimeCacheUploadCompletion:v24];

  [*(id *)(a1 + 48) maxCacheSize];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMaxCacheSize:];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMaxLocationsInTrace:*(__int16 *)(*(void *)(a1 + 48) + 1)];
  [*(id *)(a1 + 48) maxTimeBetweenCacheUpdates];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMaxTimeBetweenCacheUpdates:];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setNumCacheUpdates:[*(id *)(a1 + 48) numCacheUpdates]];
  [*(id *)(a1 + 48) timeTilCacheRelease];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setTimeTilCacheRelease:];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setNumberOfSuccessfulCacheUpdates:[*(id *)(a1 + 48) numberOfSuccessfulCacheUpdates]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setNumberOfMessageCancelling:[*(id *)(a1 + 48) numberOfMessageCancelling]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setNumberOfSuccessfulMessageCancelling:[*(id *)(a1 + 48) numberOfSuccessfulMessageCancelling]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setNumberOfMessageScheduling:*(__int16 *)(*(void *)(a1 + 48) + 2)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setNumberOfSuccessfulMessageScheduling:[*(id *)(a1 + 48) numberOfSuccessfulMessageScheduling]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setWasCacheReleased:[*(id *)(a1 + 48) wasCacheReleased]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setWasScheduledSendTriggered:*(id *)(a1 + 48)];
  id v25 = [*(id *)(a1 + 48) locationOfTrigger];
  v26 = [v25 date];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationOfTriggerDate:v26];

  v27 = [*(id *)(a1 + 48) locationOfTrigger];
  [v27 latitude];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationOfTriggerLatitude:];

  v28 = [*(id *)(a1 + 48) locationOfTrigger];
  [v28 longitude];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationOfTriggerLongitude:];

  v29 = [*(id *)(a1 + 48) locationOfTrigger];
  [v29 horizontalUncertainty];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationOfTriggerHorizontalUncertainty:];

  v30 = [*(id *)(a1 + 48) locationOfTrigger];
  [v30 altitude];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationOfTriggerAltitude:];

  v31 = [*(id *)(a1 + 48) locationOfTrigger];
  [v31 verticalUncertainty];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationOfTriggerVerticalUncertainty:];

  v32 = [*(id *)(a1 + 48) locationOfTrigger];
  [v32 speed];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationOfTriggerSpeed:];

  v33 = [*(id *)(a1 + 48) locationOfTrigger];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationOfTriggerSourceAccuracy:([v33 sourceAccuracy]);

  v34 = [*(id *)(a1 + 48) locationOfTrigger];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationOfTriggerReferenceFrame:([v34 referenceFrame]);

  v35 = [*(id *)(a1 + 48) triggerDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setTriggerDate:v35];

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLockState:[*(id *)(a1 + 48) lockState]];
  v36 = [*(id *)(a1 + 48) cacheUpdateBackstopExpiryDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCacheUpdateBackstopExpiryDate:v36];

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setNumberOfHandoffBecomingActive:[*(id *)(a1 + 48) numberOfHandoffBecomingActive]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setNumberOfHandoffBecomingNonActive:[*(id *)(a1 + 48) numberOfHandoffBecomingNonActive]];
  v37 = [*(id *)(a1 + 48) earliestActiveDeviceIdentifier];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setEarliestActiveDeviceIdentifier:v37];

  v38 = [*(id *)(a1 + 48) latestActiveDeviceIdentifier];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLatestActiveDeviceIdentifier:v38];

  v39 = +[SMCacheMO fetchRequest];
  v40 = (void *)MEMORY[0x1E4F28F60];
  v41 = [*(id *)(a1 + 48) phoneCache];
  v42 = [v41 identifier];
  v43 = [v40 predicateWithFormat:@"%K == %@", @"identifier", v42];
  [v39 setPredicate:v43];

  v44 = *(void **)(a1 + 40);
  id v76 = 0;
  v45 = [v44 executeFetchRequest:v39 error:&v76];
  id v46 = v76;
  v47 = [*(id *)(a1 + 48) phoneCache];
  v48 = [v45 firstObject];
  v49 = +[SMCacheMO managedObjectWithCache:v47 managedObject:v48 inManagedObjectContext:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setPhoneCache:v49];

  if (v46)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      v71 = [*(id *)(a1 + 48) sessionUUID];
      v65 = [*(id *)(a1 + 48) identifier];
      v73 = [*(id *)(a1 + 48) phoneCache];
      uint64_t v66 = [v73 identifier];
      *(_DWORD *)buf = 136316162;
      v78 = "+[SMInitiatorContactMO managedObjectWithInitiatorContact:managedObject:inManagedObjectContext:]_block_invoke";
      __int16 v79 = 2112;
      v80 = v71;
      __int16 v81 = 2112;
      v82 = v65;
      __int16 v83 = 2112;
      uint64_t v84 = v66;
      v67 = (void *)v66;
      __int16 v85 = 2112;
      id v86 = v46;
      _os_log_error_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_ERROR, "SMInitiatorContactMO,%s,sessionUUID,%@,initiatorContact.identifier,%@,phoneCache.identifier,%@,phone cache fetch error,%@", buf, 0x34u);
    }
  }
  v51 = +[SMCacheMO fetchRequest];
  v52 = (void *)MEMORY[0x1E4F28F60];
  v53 = [*(id *)(a1 + 48) watchCache];
  v54 = [v53 identifier];
  v55 = [v52 predicateWithFormat:@"%K == %@", @"identifier", v54];
  [v51 setPredicate:v55];

  v56 = *(void **)(a1 + 40);
  id v75 = 0;
  v57 = [v56 executeFetchRequest:v51 error:&v75];
  id v58 = v75;
  v59 = [*(id *)(a1 + 48) watchCache];
  v60 = [v57 firstObject];
  v61 = +[SMCacheMO managedObjectWithCache:v59 managedObject:v60 inManagedObjectContext:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setWatchCache:v61];

  if (v58)
  {
    v62 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      v72 = [*(id *)(a1 + 48) sessionUUID];
      v68 = [*(id *)(a1 + 48) identifier];
      v74 = [*(id *)(a1 + 48) watchCache];
      uint64_t v69 = [v74 identifier];
      *(_DWORD *)buf = 136316162;
      v78 = "+[SMInitiatorContactMO managedObjectWithInitiatorContact:managedObject:inManagedObjectContext:]_block_invoke";
      __int16 v79 = 2112;
      v80 = v72;
      __int16 v81 = 2112;
      v82 = v68;
      __int16 v83 = 2112;
      uint64_t v84 = v69;
      v70 = (void *)v69;
      __int16 v85 = 2112;
      id v86 = v58;
      _os_log_error_impl(&dword_1D9BFA000, v62, OS_LOG_TYPE_ERROR, "SMInitiatorContactMO,%s,sessionUUID,%@,initiatorContact.identifier,%@,watchCache.identifier,%@,watch cache fetch error,%@", buf, 0x34u);
    }
  }
  v63 = [*(id *)(a1 + 48) workoutEvents];
  v64 = +[SMWorkoutEventMO getWorkoutEventMOFromWorkoutEvents:v63 context:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setWorkoutEvents:v64];
}

+ (id)getLocationMOFromLocation:(id)a3 context:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    id v6 = a3;
    id v7 = +[SMLocationMO fetchRequest];
    id v8 = (void *)MEMORY[0x1E4F28F60];
    id v9 = [v6 identifier];
    v10 = [v8 predicateWithFormat:@"%K == %@", @"identifier", v9];
    [v7 setPredicate:v10];

    uint64_t v15 = 0;
    id v11 = [v5 executeFetchRequest:v7 error:&v15];
    v12 = [v11 firstObject];
    v13 = +[SMLocationMO managedObjectWithLocation:v6 managedObject:v12 inManagedObjectContext:v5];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"SMInitiatorContactMO"];
}

@end