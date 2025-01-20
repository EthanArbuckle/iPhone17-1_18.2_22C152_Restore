@interface SMSessionManagerStateMO
+ (id)fetchRequest;
+ (id)initWithSessionManagerState:(id)a3 inManagedObjectContext:(id)a4;
+ (id)managedObjectWithSessionManagerConfiguration:(id)a3 sessionState:(unint64_t)a4 triggerCateogry:(unint64_t)a5 updateReason:(unint64_t)a6 userTriggerResponse:(int64_t)a7 date:(id)a8 location:(id)a9 allowReadToken:(id)a10 safetyCacheKey:(id)a11 startMessageGUID:(id)a12 scheduledSendMessageGUID:(id)a13 scheduledSendMessageDate:(id)a14 activeDeviceIdentifier:(id)a15 estimatedEndDate:(id)a16 coarseEstimatedEndDate:(id)a17 estimatedEndDateStatus:(unint64_t)a18 sessionEndReason:(unint64_t)a19 sessionStateTransitionDate:(id)a20 activePairedDeviceIdentifier:(id)a21 managedObjectContext:(id)a22;
@end

@implementation SMSessionManagerStateMO

+ (id)initWithSessionManagerState:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v37 = 0;
    v16 = "Invalid parameter not satisfying: sessionManagerState";
    v17 = (uint8_t *)&v37;
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, v16, v17, 2u);
    goto LABEL_7;
  }
  if (v7)
  {
    v35 = [v6 configuration];
    uint64_t v30 = [v6 sessionState];
    v32 = [v6 monitorContext];
    uint64_t v29 = [v32 triggerCategory];
    v31 = [v6 monitorContext];
    uint64_t v28 = [v31 updateReason];
    uint64_t v27 = [v6 userTriggerResponse];
    v26 = [v6 date];
    v25 = [v6 location];
    v34 = [v6 allowReadToken];
    v24 = [v6 safetyCacheKey];
    v23 = [v6 startMessageGUID];
    v33 = [v6 scheduledSendMessageGUID];
    v22 = [v6 scheduledSendMessageDate];
    v9 = [v6 activeDeviceIdentifier];
    v21 = [v6 estimatedEndDate];
    v20 = [v6 coarseEstimatedEndDate];
    uint64_t v10 = [v6 estimatedEndDateStatus];
    id v19 = a1;
    uint64_t v11 = [v6 sessionEndReason];
    v12 = [v6 sessionStateTransitionDate];
    v13 = [v6 activePairedDeviceIdentifier];
    objc_msgSend(v19, "managedObjectWithSessionManagerConfiguration:sessionState:triggerCateogry:updateReason:userTriggerResponse:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:managedObjectContext:", v35, v30, v29, v28, v27, v26, v25, v34, v24, v23, v33, v22, v9, v21,
      v20,
      v10,
      v11,
      v12,
      v13,
    v14 = v8);

    goto LABEL_8;
  }
  v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: managedObjectContext";
    v17 = buf;
    goto LABEL_12;
  }
LABEL_7:

  v14 = 0;
LABEL_8:

  return v14;
}

+ (id)managedObjectWithSessionManagerConfiguration:(id)a3 sessionState:(unint64_t)a4 triggerCateogry:(unint64_t)a5 updateReason:(unint64_t)a6 userTriggerResponse:(int64_t)a7 date:(id)a8 location:(id)a9 allowReadToken:(id)a10 safetyCacheKey:(id)a11 startMessageGUID:(id)a12 scheduledSendMessageGUID:(id)a13 scheduledSendMessageDate:(id)a14 activeDeviceIdentifier:(id)a15 estimatedEndDate:(id)a16 coarseEstimatedEndDate:(id)a17 estimatedEndDateStatus:(unint64_t)a18 sessionEndReason:(unint64_t)a19 sessionStateTransitionDate:(id)a20 activePairedDeviceIdentifier:(id)a21 managedObjectContext:(id)a22
{
  id v53 = a3;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v52 = a11;
  id v26 = a12;
  id v27 = a13;
  id v28 = a14;
  id v29 = a15;
  id v30 = a16;
  id v51 = a17;
  id v31 = a20;
  id v32 = a21;
  id v33 = a22;
  v49 = v25;
  v47 = v29;
  v48 = v28;
  v50 = v32;
  if (v33)
  {
    uint64_t v76 = 0;
    v77 = &v76;
    uint64_t v78 = 0x3032000000;
    v79 = __Block_byref_object_copy__0;
    v80 = __Block_byref_object_dispose__0;
    id v81 = 0;
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __425__SMSessionManagerStateMO_managedObjectWithSessionManagerConfiguration_sessionState_triggerCateogry_updateReason_userTriggerResponse_date_location_allowReadToken_safetyCacheKey_startMessageGUID_scheduledSendMessageGUID_scheduledSendMessageDate_activeDeviceIdentifier_estimatedEndDate_coarseEstimatedEndDate_estimatedEndDateStatus_sessionEndReason_sessionStateTransitionDate_activePairedDeviceIdentifier_managedObjectContext___block_invoke;
    v54[3] = &unk_1E6B90638;
    v69 = &v76;
    id v41 = v33;
    id v42 = v23;
    id v55 = v33;
    unint64_t v70 = a4;
    unint64_t v71 = a5;
    unint64_t v72 = a6;
    int64_t v73 = a7;
    id v56 = v23;
    id v57 = v24;
    id v58 = v25;
    v34 = v52;
    id v59 = v52;
    id v60 = v26;
    id v61 = v27;
    id v62 = v28;
    id v63 = v29;
    id v64 = v30;
    id v65 = v51;
    unint64_t v74 = a18;
    unint64_t v75 = a19;
    id v66 = v31;
    id v67 = v32;
    v35 = v53;
    id v68 = v53;
    [v55 performBlockAndWait:v54];
    v36 = v42;
    __int16 v37 = v27;
    v38 = v51;
    id v39 = (id)v77[5];

    _Block_object_dispose(&v76, 8);
    id v33 = v41;
  }
  else
  {
    id v39 = 0;
    v36 = v23;
    v34 = v52;
    v35 = v53;
    __int16 v37 = v27;
    v38 = v51;
  }

  return v39;
}

void __425__SMSessionManagerStateMO_managedObjectWithSessionManagerConfiguration_sessionState_triggerCateogry_updateReason_userTriggerResponse_date_location_allowReadToken_safetyCacheKey_startMessageGUID_scheduledSendMessageGUID_scheduledSendMessageDate_activeDeviceIdentifier_estimatedEndDate_coarseEstimatedEndDate_estimatedEndDateStatus_sessionEndReason_sessionStateTransitionDate_activePairedDeviceIdentifier_managedObjectContext___block_invoke(uint64_t a1)
{
  v2 = [[SMSessionManagerStateMO alloc] initWithContext:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 144) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) setSessionState:*(__int16 *)(a1 + 152)];
  [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) setTriggerCategory:*(__int16 *)(a1 + 160)];
  [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) setUpdateReason:*(__int16 *)(a1 + 168)];
  [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) setUserTriggerResponse:*(__int16 *)(a1 + 176)];
  [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) setDate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) coordinate];
  [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) setLocationLatitude:];
  [*(id *)(a1 + 48) coordinate];
  [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) setLocationLongitude:v5];
  [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) setAllowReadToken:*(void *)(a1 + 56)];
  [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) setSafetyCacheKey:*(void *)(a1 + 64)];
  [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) setStartMessageGUID:*(void *)(a1 + 72)];
  [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) setScheduledSendMessageGUID:*(void *)(a1 + 80)];
  [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) setScheduledSendMessageDate:*(void *)(a1 + 88)];
  [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) setActiveDeviceIdentifier:*(void *)(a1 + 96)];
  [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) setEstimatedEndDate:*(void *)(a1 + 104)];
  [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) setCoarseEstimatedEndDate:*(void *)(a1 + 112)];
  [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) setEstimatedEndDateStatus:*(__int16 *)(a1 + 184)];
  [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) setSessionEndReason:*(__int16 *)(a1 + 192)];
  [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) setSessionStateTransitionDate:*(void *)(a1 + 120)];
  [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) setActivePairedDeviceIdentifier:*(void *)(a1 + 128)];
  uint64_t v6 = *(void *)(a1 + 136);
  if (v6)
  {
    id v7 = +[SMSessionConfigurationMO initWithSessionConfiguration:v6 inManagedObjectContext:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) setSessionConfiguration:v7];
  }
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"SMSessionManagerStateMO"];
}

@end