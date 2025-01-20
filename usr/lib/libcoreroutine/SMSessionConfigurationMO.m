@interface SMSessionConfigurationMO
+ (SMSessionConfigurationMO)initWithSessionConfiguration:(id)a3 inManagedObjectContext:(id)a4;
+ (SMSessionConfigurationMO)initWithSessionConfiguration:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5;
+ (id)fetchRequest;
+ (id)managedObjectWithSessionIdentifier:(id)a3 sessionType:(unint64_t)a4 sessionStartDate:(id)a5 destinationLatitude:(double)a6 destinationLongitude:(double)a7 destinationReferenceFrame:(int)a8 destinationRadius:(double)a9 destinationType:(unint64_t)a10 expectedTravelTime:(double)a11 additionalTravelTime:(double)a12 transportType:(unint64_t)a13 sessionTimeBound:(id)a14 conversation:(id)a15 destinationMapItem:(id)a16 sessionSupportsHandoff:(BOOL)a17 sosReceivers:(id)a18 sessionWorkoutType:(unint64_t)a19 managedObject:(id)a20 managedObjectContext:(id)a21;
@end

@implementation SMSessionConfigurationMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"SMSessionConfigurationMO"];
}

+ (SMSessionConfigurationMO)initWithSessionConfiguration:(id)a3 inManagedObjectContext:(id)a4
{
  return (SMSessionConfigurationMO *)[a1 initWithSessionConfiguration:a3 managedObject:0 inManagedObjectContext:a4];
}

+ (SMSessionConfigurationMO)initWithSessionConfiguration:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (!v8)
  {
    v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    __int16 v58 = 0;
    v31 = "Invalid parameter not satisfying: sessionConfiguration";
    v32 = (uint8_t *)&v58;
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, v31, v32, 2u);
    goto LABEL_13;
  }
  if (!v10)
  {
    v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    __int16 v57 = 0;
    v31 = "Invalid parameter not satisfying: managedObjectContext";
    v32 = (uint8_t *)&v57;
    goto LABEL_12;
  }
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v55 = [v8 sessionID];
    uint64_t v46 = [v8 sessionType];
    v54 = [v8 sessionStartDate];
    v53 = [v8 destination];
    v52 = [v53 location];
    [v52 latitude];
    double v13 = v12;
    v51 = [v8 destination];
    v50 = [v51 location];
    [v50 longitude];
    double v15 = v14;
    v49 = [v8 destination];
    v48 = [v49 location];
    unsigned int v42 = [v48 referenceFrame];
    v47 = [v8 destination];
    [v47 radius];
    double v17 = v16;
    v45 = [v8 destination];
    uint64_t v39 = [v45 destinationType];
    v44 = [v8 destination];
    v43 = [v44 eta];
    [v43 expectedTravelTime];
    double v19 = v18;
    v41 = [v8 destination];
    v40 = [v41 eta];
    [v40 additionalTravelTime];
    double v21 = v20;
    v38 = [v8 destination];
    v37 = [v38 eta];
    uint64_t v35 = [v37 transportType];
    v36 = [v8 time];
    v22 = [v36 timeBound];
    v23 = [v8 conversation];
    v24 = [v8 destination];
    v25 = [v24 destinationMapItem];
    char v26 = [v8 sessionSupportsHandoff];
    [v8 sosReceivers];
    v28 = id v27 = v9;
    LOBYTE(v34) = v26;
    objc_msgSend(a1, "managedObjectWithSessionIdentifier:sessionType:sessionStartDate:destinationLatitude:destinationLongitude:destinationReferenceFrame:destinationRadius:destinationType:expectedTravelTime:additionalTravelTime:transportType:sessionTimeBound:conversation:destinationMapItem:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:managedObject:managedObjectContext:", v55, v46, v54, v42, v39, v35, v13, v15, v17, v19, v21, v22, v23, v25,
      v34,
      v28,
      [v8 sessionWorkoutType],
      v27,
    v29 = v11);

    id v9 = v27;
    goto LABEL_14;
  }
  v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: [managedObject isKindOfClass:[SMSessionConfigurationMO class]]";
    v32 = buf;
    goto LABEL_12;
  }
LABEL_13:

  v29 = 0;
LABEL_14:

  return (SMSessionConfigurationMO *)v29;
}

+ (id)managedObjectWithSessionIdentifier:(id)a3 sessionType:(unint64_t)a4 sessionStartDate:(id)a5 destinationLatitude:(double)a6 destinationLongitude:(double)a7 destinationReferenceFrame:(int)a8 destinationRadius:(double)a9 destinationType:(unint64_t)a10 expectedTravelTime:(double)a11 additionalTravelTime:(double)a12 transportType:(unint64_t)a13 sessionTimeBound:(id)a14 conversation:(id)a15 destinationMapItem:(id)a16 sessionSupportsHandoff:(BOOL)a17 sosReceivers:(id)a18 sessionWorkoutType:(unint64_t)a19 managedObject:(id)a20 managedObjectContext:(id)a21
{
  id v28 = a3;
  id v29 = a5;
  id v30 = a14;
  id v31 = a15;
  id v32 = a16;
  id v33 = a18;
  id v34 = a20;
  id v35 = a21;
  if (v35)
  {
    uint64_t v62 = 0;
    v63 = &v62;
    uint64_t v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__173;
    v66 = __Block_byref_object_dispose__173;
    id v67 = 0;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __386__SMSessionConfigurationMO_managedObjectWithSessionIdentifier_sessionType_sessionStartDate_destinationLatitude_destinationLongitude_destinationReferenceFrame_destinationRadius_destinationType_expectedTravelTime_additionalTravelTime_transportType_sessionTimeBound_conversation_destinationMapItem_sessionSupportsHandoff_sosReceivers_sessionWorkoutType_managedObject_managedObjectContext___block_invoke;
    v41[3] = &unk_1E6B9D1B8;
    v50 = &v62;
    id v42 = v34;
    id v43 = v35;
    id v44 = v28;
    unint64_t v51 = a4;
    id v45 = v29;
    double v52 = a6;
    double v53 = a7;
    int v60 = a8;
    double v54 = a9;
    unint64_t v55 = a10;
    double v56 = a11;
    double v57 = a12;
    unint64_t v58 = a13;
    id v46 = v30;
    id v47 = v31;
    id v48 = v32;
    BOOL v61 = a17;
    id v49 = v33;
    unint64_t v59 = a19;
    [v43 performBlockAndWait:v41];
    id v36 = (id)v63[5];

    _Block_object_dispose(&v62, 8);
  }
  else
  {
    id v36 = 0;
  }

  return v36;
}

uint64_t __386__SMSessionConfigurationMO_managedObjectWithSessionIdentifier_sessionType_sessionStartDate_destinationLatitude_destinationLongitude_destinationReferenceFrame_destinationRadius_destinationType_expectedTravelTime_additionalTravelTime_transportType_sessionTimeBound_conversation_destinationMapItem_sessionSupportsHandoff_sosReceivers_sessionWorkoutType_managedObject_managedObjectContext___block_invoke(uint64_t a1)
{
  v2 = *(SMSessionConfigurationMO **)(a1 + 32);
  v3 = v2;
  if (!v2) {
    v3 = [[SMSessionConfigurationMO alloc] initWithContext:*(void *)(a1 + 40)];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), v3);
  if (!v2) {

  }
  [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setSessionIdentifier:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setSessionType:*(__int16 *)(a1 + 104)];
  [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setSessionStartDate:*(void *)(a1 + 56)];
  [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setDestinationLatitude:*(double *)(a1 + 112)];
  [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setDestinationLongitude:*(double *)(a1 + 120)];
  [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setDestinationReferenceFrame:*(__int16 *)(a1 + 176)];
  [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setDestinationRadius:*(double *)(a1 + 128)];
  [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setDestinationType:*(__int16 *)(a1 + 136)];
  [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setExpectedTravelTime:*(double *)(a1 + 144)];
  [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setAdditionalTravelTime:*(double *)(a1 + 152)];
  [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setTransportType:*(__int16 *)(a1 + 160)];
  [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setSessionTimeBound:*(void *)(a1 + 64)];
  v4 = +[SMConversationMO managedObjectWithSMConversation:*(void *)(a1 + 72) inManagedObjectContext:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setConversation:v4];

  [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setDestinationMapItem:*(void *)(a1 + 80)];
  [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setSessionSupportsHandoff:*(unsigned __int8 *)(a1 + 180)];
  v5 = +[SMConversationMO managedObjectWithSMConversation:*(void *)(a1 + 88) inManagedObjectContext:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setSosReceivers:v5];

  uint64_t v6 = *(unsigned int *)(a1 + 168);
  v7 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);

  return [v7 setSessionWorkoutType:v6];
}

@end