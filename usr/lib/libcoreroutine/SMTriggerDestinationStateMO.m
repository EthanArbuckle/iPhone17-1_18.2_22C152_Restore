@interface SMTriggerDestinationStateMO
+ (id)fetchRequest;
+ (id)initWithTriggerDestinationState:(id)a3 inManagedObjectContext:(id)a4;
+ (id)managedObjectWithSessionIdentifier:(id)a3 lastLockDate:(id)a4 lastUnlockDate:(id)a5 predominantModeOfTransport:(unint64_t)a6 currentStatus:(unint64_t)a7 currentStatusDate:(id)a8 date:(id)a9 shouldRetryETAQuery:(BOOL)a10 numberOfETARetries:(unsigned __int16)a11 upperBoundEtaCrowFliesUpperBoundEta:(id)a12 upperBoundEtaMapsUpperBoundEta:(id)a13 roundTripReminderDate:(id)a14 timeToUpdateStatus:(id)a15 mapsExpectedTravelTime:(double)a16 remainingDistance:(double)a17 managedObjectContext:(id)a18;
@end

@implementation SMTriggerDestinationStateMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"SMTriggerDestinationStateMO"];
}

+ (id)initWithTriggerDestinationState:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v34 = 0;
    v19 = "Invalid parameter not satisfying: state";
    v20 = (uint8_t *)&v34;
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, v19, v20, 2u);
    goto LABEL_7;
  }
  if (v7)
  {
    v31 = [v6 sessionIdentifier];
    v30 = [v6 lastLockDate];
    v29 = [v6 lastUnlockDate];
    uint64_t v28 = [v6 predominantModeOfTransport];
    uint64_t v27 = [v6 currentStatus];
    v25 = [v6 currentStatusDate];
    v24 = [v6 date];
    char v32 = [v6 shouldRetryETAQuery];
    __int16 v9 = [v6 numberOfETARetries];
    v26 = [v6 upperBoundEta];
    v23 = [v26 crowFliesUpperBoundEta];
    v10 = [v6 upperBoundEta];
    v11 = [v10 mapsUpperBoundEta];
    v12 = [v6 roundTripReminderDate];
    v13 = [v6 timeToUpdateStatus];
    [v6 mapsExpectedTravelTime];
    double v15 = v14;
    [v6 remainingDistance];
    WORD1(v22) = v9;
    LOBYTE(v22) = v32;
    v17 = [a1 managedObjectWithSessionIdentifier:v31 lastLockDate:v30 lastUnlockDate:v29 predominantModeOfTransport:v28 currentStatus:v27 currentStatusDate:v25 date:v15 shouldRetryETAQuery:v24 numberOfETARetries:v23 upperBoundEtaCrowFliesUpperBoundEta:v11 upperBoundEtaMapsUpperBoundEta:v12 roundTripReminderDate:v13 mapsExpectedTravelTime:v8 managedObjectContext:v16];

    goto LABEL_8;
  }
  v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: managedObjectContext";
    v20 = buf;
    goto LABEL_12;
  }
LABEL_7:

  v17 = 0;
LABEL_8:

  return v17;
}

+ (id)managedObjectWithSessionIdentifier:(id)a3 lastLockDate:(id)a4 lastUnlockDate:(id)a5 predominantModeOfTransport:(unint64_t)a6 currentStatus:(unint64_t)a7 currentStatusDate:(id)a8 date:(id)a9 shouldRetryETAQuery:(BOOL)a10 numberOfETARetries:(unsigned __int16)a11 upperBoundEtaCrowFliesUpperBoundEta:(id)a12 upperBoundEtaMapsUpperBoundEta:(id)a13 roundTripReminderDate:(id)a14 timeToUpdateStatus:(id)a15 mapsExpectedTravelTime:(double)a16 remainingDistance:(double)a17 managedObjectContext:(id)a18
{
  id v23 = a3;
  id v24 = a4;
  id v25 = a5;
  id v41 = a8;
  id v26 = a9;
  id v27 = a12;
  id v28 = a13;
  id v29 = a14;
  id v30 = a15;
  id v31 = a18;
  char v32 = v31;
  v39 = v26;
  v40 = v23;
  if (v31)
  {
    uint64_t v60 = 0;
    v61 = &v60;
    uint64_t v62 = 0x3032000000;
    v63 = __Block_byref_object_copy__92;
    v64 = __Block_byref_object_dispose__92;
    id v65 = 0;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __367__SMTriggerDestinationStateMO_managedObjectWithSessionIdentifier_lastLockDate_lastUnlockDate_predominantModeOfTransport_currentStatus_currentStatusDate_date_shouldRetryETAQuery_numberOfETARetries_upperBoundEtaCrowFliesUpperBoundEta_upperBoundEtaMapsUpperBoundEta_roundTripReminderDate_timeToUpdateStatus_mapsExpectedTravelTime_remainingDistance_managedObjectContext___block_invoke;
    v42[3] = &unk_1E6B98AE0;
    v53 = &v60;
    id v43 = v31;
    id v44 = v23;
    id v45 = v26;
    v33 = v24;
    id v46 = v24;
    id v47 = v25;
    unint64_t v54 = a6;
    unint64_t v55 = a7;
    __int16 v34 = v41;
    id v48 = v41;
    BOOL v59 = a10;
    unsigned __int16 v58 = a11;
    id v49 = v27;
    id v50 = v28;
    id v51 = v29;
    id v52 = v30;
    double v56 = a16;
    double v57 = a17;
    [v43 performBlockAndWait:v42];
    id v35 = (id)v61[5];

    _Block_object_dispose(&v60, 8);
  }
  else
  {
    id v35 = 0;
    v33 = v24;
    __int16 v34 = v41;
  }

  return v35;
}

uint64_t __367__SMTriggerDestinationStateMO_managedObjectWithSessionIdentifier_lastLockDate_lastUnlockDate_predominantModeOfTransport_currentStatus_currentStatusDate_date_shouldRetryETAQuery_numberOfETARetries_upperBoundEtaCrowFliesUpperBoundEta_upperBoundEtaMapsUpperBoundEta_roundTripReminderDate_timeToUpdateStatus_mapsExpectedTravelTime_remainingDistance_managedObjectContext___block_invoke(uint64_t a1)
{
  v2 = [[SMTriggerDestinationStateMO alloc] initWithContext:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 112) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setSessionIdentifier_v2:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setDate:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setLastLockDate:*(void *)(a1 + 56)];
  [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setLastUnlockDate:*(void *)(a1 + 64)];
  [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setPredominantModeOfTransport_v2:*(void *)(a1 + 120)];
  [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setCurrentStatus:*(__int16 *)(a1 + 128)];
  [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setCurrentStatusDate:*(void *)(a1 + 72)];
  [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setShouldRetryETAQuery:*(unsigned __int8 *)(a1 + 154)];
  [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setNumberOfETARetries:*(__int16 *)(a1 + 152)];
  [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setUpperBoundEtaCrowFliesUpperBoundEta:*(void *)(a1 + 80)];
  [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setUpperBoundEtaMapsUpperBoundEta:*(void *)(a1 + 88)];
  [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setRoundTripReminderDate:*(void *)(a1 + 96)];
  [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setTimeToUpdateStatus:*(void *)(a1 + 104)];
  [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setMapsExpectedTravelTime:*(double *)(a1 + 136)];
  double v5 = *(double *)(a1 + 144);
  id v6 = *(void **)(*(void *)(*(void *)(a1 + 112) + 8) + 40);

  return [v6 setRemainingDistance:v5];
}

@end