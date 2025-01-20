@interface SMSuggestionMO
+ (id)fetchRequest;
+ (id)initWithSuggestion:(id)a3 managedObjectContext:(id)a4;
+ (id)managedObjectWithSuggestionTrigger:(unint64_t)a3 suggestionUserType:(unint64_t)a4 suppressionReason:(unint64_t)a5 sessionType:(unint64_t)a6 sourceLocationLatitude:(double)a7 sourceLocationLongitude:(double)a8 destinationLocationLatitude:(double)a9 destinationLocationLongitude:(double)a10 buddyEmail:(id)a11 buddyPhoneNumber:(id)a12 startDate:(id)a13 endDate:(id)a14 creationDate:(id)a15 managedObjectContext:(id)a16;
@end

@implementation SMSuggestionMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"SMSuggestionMO"];
}

+ (id)initWithSuggestion:(id)a3 managedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v40 = 0;
    v26 = "Invalid parameter not satisfying: suggestion";
    v27 = (uint8_t *)&v40;
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, v26, v27, 2u);
    goto LABEL_7;
  }
  if (v6)
  {
    uint64_t v35 = [v5 suggestionTrigger];
    uint64_t v34 = [v5 suggestionUserType];
    uint64_t v32 = [v5 suppressionReason];
    uint64_t v31 = [v5 sessionType];
    v38 = [v5 sourceLocation];
    [v38 latitude];
    double v9 = v8;
    v37 = [v5 sourceLocation];
    [v37 longitude];
    double v11 = v10;
    v36 = [v5 destinationLocation];
    [v36 latitude];
    double v13 = v12;
    v33 = [v5 destinationLocation];
    [v33 longitude];
    double v15 = v14;
    v30 = [v5 buddy];
    uint64_t v16 = [v30 email];
    v29 = [v5 buddy];
    v17 = [v29 phoneNumber];
    v18 = [v5 dateInterval];
    v19 = [v18 startDate];
    v20 = [v5 dateInterval];
    v21 = [v20 endDate];
    v22 = [v5 creationDate];
    v23 = (void *)v16;
    v24 = +[SMSuggestionMO managedObjectWithSuggestionTrigger:v35 suggestionUserType:v34 suppressionReason:v32 sessionType:v31 sourceLocationLatitude:v16 sourceLocationLongitude:v17 destinationLocationLatitude:v9 destinationLocationLongitude:v11 buddyEmail:v13 buddyPhoneNumber:v15 startDate:v19 endDate:v21 creationDate:v22 managedObjectContext:v7];

    goto LABEL_8;
  }
  v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: managedObjectContext";
    v27 = buf;
    goto LABEL_12;
  }
LABEL_7:

  v24 = 0;
LABEL_8:

  return v24;
}

+ (id)managedObjectWithSuggestionTrigger:(unint64_t)a3 suggestionUserType:(unint64_t)a4 suppressionReason:(unint64_t)a5 sessionType:(unint64_t)a6 sourceLocationLatitude:(double)a7 sourceLocationLongitude:(double)a8 destinationLocationLatitude:(double)a9 destinationLocationLongitude:(double)a10 buddyEmail:(id)a11 buddyPhoneNumber:(id)a12 startDate:(id)a13 endDate:(id)a14 creationDate:(id)a15 managedObjectContext:(id)a16
{
  id v24 = a11;
  id v25 = a12;
  id v26 = a13;
  id v27 = a14;
  id v28 = a15;
  id v29 = a16;
  v30 = v29;
  if (v29)
  {
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__80;
    v54 = __Block_byref_object_dispose__80;
    id v55 = 0;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __286__SMSuggestionMO_managedObjectWithSuggestionTrigger_suggestionUserType_suppressionReason_sessionType_sourceLocationLatitude_sourceLocationLongitude_destinationLocationLatitude_destinationLocationLongitude_buddyEmail_buddyPhoneNumber_startDate_endDate_creationDate_managedObjectContext___block_invoke;
    v34[3] = &unk_1E6B97860;
    v41 = &v50;
    id v35 = v29;
    unint64_t v42 = a3;
    unint64_t v43 = a4;
    unint64_t v44 = a5;
    unint64_t v45 = a6;
    double v46 = a7;
    double v47 = a8;
    double v48 = a9;
    double v49 = a10;
    id v36 = v24;
    id v37 = v25;
    id v38 = v26;
    id v39 = v27;
    id v40 = v28;
    [v35 performBlockAndWait:v34];
    id v31 = (id)v51[5];

    _Block_object_dispose(&v50, 8);
  }
  else
  {
    id v31 = 0;
  }

  return v31;
}

uint64_t __286__SMSuggestionMO_managedObjectWithSuggestionTrigger_suggestionUserType_suppressionReason_sessionType_sourceLocationLatitude_sourceLocationLongitude_destinationLocationLatitude_destinationLocationLongitude_buddyEmail_buddyPhoneNumber_startDate_endDate_creationDate_managedObjectContext___block_invoke(uint64_t a1)
{
  v2 = [[SMSuggestionMO alloc] initWithContext:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 80) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setSuggestionTrigger:*(__int16 *)(a1 + 88)];
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setSuggestionUserType:*(__int16 *)(a1 + 96)];
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setSuppressionReason:*(__int16 *)(a1 + 104)];
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setSessionType:*(__int16 *)(a1 + 112)];
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setSourceLocationLatitude:*(double *)(a1 + 120)];
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setSourceLocationLongitude:*(double *)(a1 + 128)];
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setDestinationLocationLatitude:*(double *)(a1 + 136)];
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setDestinationLocationLongitude:*(double *)(a1 + 144)];
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setBuddyEmail:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setBuddyPhoneNumber:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setStartDate:*(void *)(a1 + 56)];
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setEndDate:*(void *)(a1 + 64)];
  uint64_t v5 = *(void *)(a1 + 72);
  id v6 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);

  return [v6 setCreationDate:v5];
}

@end