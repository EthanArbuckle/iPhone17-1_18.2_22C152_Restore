@interface SMSessionConfiguration
@end

@implementation SMSessionConfiguration

void __86__SMSessionConfiguration_RTCoreDataTransformable__createWithSMSessionConfigurationMO___block_invoke(uint64_t a1)
{
  v64[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) conversation];

  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F99838];
    v4 = [*(id *)(a1 + 32) conversation];
    v5 = [v3 createWithManagedObject:v4];
  }
  else
  {
    v6 = [*(id *)(a1 + 32) primaryHandle];

    if (!v6) {
      goto LABEL_9;
    }
    v4 = [*(id *)(a1 + 32) primaryHandle];
    uint64_t v7 = [*(id *)(a1 + 32) secondaryHandles];
    v8 = (void *)v7;
    v9 = (void *)MEMORY[0x1E4F1CBF0];
    if (v7) {
      v9 = (void *)v7;
    }
    id v10 = v9;

    v11 = (void *)[objc_alloc(MEMORY[0x1E4F99888]) initWithPrimaryHandle:v4 secondaryHandles:v10];
    id v12 = objc_alloc(MEMORY[0x1E4F99838]);
    v64[0] = v11;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:1];
    v5 = (void *)[v12 initWithReceiverHandles:v13 identifier:0 displayName:0];
  }
  if (v5)
  {
    char v14 = 0;
    goto LABEL_12;
  }
LABEL_9:
  v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    uint64_t v58 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v61 = "+[SMSessionConfiguration(RTCoreDataTransformable) createWithSMSessionConfigurationMO:]_block_invoke";
    __int16 v62 = 2112;
    uint64_t v63 = v58;
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "%s, no conversation from SMSessionConfigurationMO, %@", buf, 0x16u);
  }

  v5 = 0;
  char v14 = 1;
LABEL_12:
  v16 = [*(id *)(a1 + 32) sosReceivers];

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E4F99838];
    v18 = [*(id *)(a1 + 32) sosReceivers];
    id v19 = [v17 createWithManagedObject:v18];

    if (v19) {
      goto LABEL_20;
    }
  }
  else if ((v14 & 1) == 0)
  {
    id v19 = v5;
    if (v19) {
      goto LABEL_20;
    }
  }
  v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    uint64_t v57 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v61 = "+[SMSessionConfiguration(RTCoreDataTransformable) createWithSMSessionConfigurationMO:]_block_invoke";
    __int16 v62 = 2112;
    uint64_t v63 = v57;
    _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "%s, no sosReceivers from SMSessionConfigurationMO, %@", buf, 0x16u);
  }

  id v19 = 0;
LABEL_20:
  int v21 = [*(id *)(a1 + 32) sessionType];
  if ((v21 - 2) < 2)
  {
    [*(id *)(a1 + 32) destinationLatitude];
    CLLocationDegrees v32 = v31;
    [*(id *)(a1 + 32) destinationLongitude];
    CLLocationCoordinate2D v34 = CLLocationCoordinate2DMake(v32, v33);
    id v35 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    v36 = [MEMORY[0x1E4F1C9C8] date];
    v24 = [v35 initWithCoordinate:v36 altitude:objc_msgSend(*(id *)(a1 + 32), "destinationReferenceFrame") horizontalAccuracy:v34.latitude verticalAccuracy:v34.longitude timestamp:0.0 referenceFrame:-1.0];

    id v37 = objc_alloc(MEMORY[0x1E4F99930]);
    [*(id *)(a1 + 32) expectedTravelTime];
    double v39 = v38;
    [*(id *)(a1 + 32) additionalTravelTime];
    v26 = [v37 initWithExpectedTravelTime:(int)[*(id *)(a1 + 32) transportType] additionalTravelTime:v39 transportType:v40];
    id v41 = objc_alloc(MEMORY[0x1E4F99928]);
    [*(id *)(a1 + 32) destinationRadius];
    double v43 = v42;
    uint64_t v44 = (int)[*(id *)(a1 + 32) destinationType];
    v45 = [*(id *)(a1 + 32) destinationMapItem];
    v27 = (void *)[v41 initWithCLLocation:v24 eta:v26 radius:v44 destinationType:v45 destinationMapItem:v43];

    id v46 = objc_alloc(MEMORY[0x1E4F99918]);
    v47 = [*(id *)(a1 + 32) sessionIdentifier];
    v48 = [*(id *)(a1 + 32) sessionStartDate];
    v49 = [*(id *)(a1 + 32) userResponseSafeDate];
    uint64_t v50 = [v46 initDestinationBoundSessionConfigurationWithConversation:v5 sessionID:v47 destination:v27 sessionStartDate:v48 userResponseSafeDate:v49 sessionSupportsHandoff:[*(id *)(a1 + 32) sessionSupportsHandoff] sosReceivers:v19];
    uint64_t v51 = *(void *)(*(void *)(a1 + 40) + 8);
    v52 = *(void **)(v51 + 40);
    *(void *)(v51 + 40) = v50;

    goto LABEL_28;
  }
  if (v21 == 4)
  {
    id v53 = objc_alloc(MEMORY[0x1E4F99918]);
    v24 = [*(id *)(a1 + 32) sessionIdentifier];
    v26 = [*(id *)(a1 + 32) sessionStartDate];
    uint64_t v54 = [v53 initWorkoutBoundSessionConfigurationWithConversation:v5 sessionID:v24 sessionStartDate:v26 sessionSupportsHandoff:[*(id *)(a1 + 32) sessionSupportsHandoff] sosReceivers:v19 sessionWorkoutType:[*(id *)(a1 + 32) sessionWorkoutType]];
LABEL_27:
    uint64_t v56 = *(void *)(*(void *)(a1 + 40) + 8);
    v27 = *(void **)(v56 + 40);
    *(void *)(v56 + 40) = v54;
    goto LABEL_28;
  }
  if (v21 != 1)
  {
    id v55 = objc_alloc(MEMORY[0x1E4F99918]);
    v24 = [*(id *)(a1 + 32) sessionIdentifier];
    v26 = [*(id *)(a1 + 32) sessionStartDate];
    LOBYTE(v59) = [*(id *)(a1 + 32) sessionSupportsHandoff];
    uint64_t v54 = [v55 initWithConversation:v5 sessionID:v24 sessionStartDate:v26 sessionType:0 time:0 destination:0 userResponseSafeDate:0 sessionSupportsHandoff:v59 sosReceivers:v19 sessionWorkoutType:0];
    goto LABEL_27;
  }
  id v22 = objc_alloc(MEMORY[0x1E4F999B0]);
  v23 = [*(id *)(a1 + 32) sessionTimeBound];
  v24 = (void *)[v22 initWithTimeBound:v23];

  id v25 = objc_alloc(MEMORY[0x1E4F99918]);
  v26 = [*(id *)(a1 + 32) sessionIdentifier];
  v27 = [*(id *)(a1 + 32) sessionStartDate];
  uint64_t v28 = [v25 initTimeBoundSessionConfigurationWithConversation:v5 sessionID:v26 time:v24 sessionStartDate:v27 sessionSupportsHandoff:[*(id *)(a1 + 32) sessionSupportsHandoff] sosReceivers:v19];
  uint64_t v29 = *(void *)(*(void *)(a1 + 40) + 8);
  v30 = *(void **)(v29 + 40);
  *(void *)(v29 + 40) = v28;

LABEL_28:
}

@end