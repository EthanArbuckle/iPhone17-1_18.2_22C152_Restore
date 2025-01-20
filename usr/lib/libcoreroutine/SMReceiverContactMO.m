@interface SMReceiverContactMO
+ (id)fetchRequest;
+ (id)managedObjectWithReceiverContact:(id)a3 inManagedObjectContext:(id)a4;
+ (id)managedObjectWithReceiverContact:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5;
@end

@implementation SMReceiverContactMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"SMReceiverContactMO"];
}

+ (id)managedObjectWithReceiverContact:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)[a1 managedObjectWithReceiverContact:a3 managedObject:0 inManagedObjectContext:a4];
}

+ (id)managedObjectWithReceiverContact:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
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
    v13 = "Invalid parameter not satisfying: receiverContact";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_7;
  }
  if (v9)
  {
    *(void *)buf = 0;
    v21 = buf;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__73;
    v24 = __Block_byref_object_dispose__73;
    id v25 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __93__SMReceiverContactMO_managedObjectWithReceiverContact_managedObject_inManagedObjectContext___block_invoke;
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

void __93__SMReceiverContactMO_managedObjectWithReceiverContact_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  v2 = *(SMReceiverContactMO **)(a1 + 32);
  v3 = v2;
  if (!v2) {
    v3 = [[SMReceiverContactMO alloc] initWithContext:*(void *)(a1 + 40)];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v3);
  if (!v2) {

  }
  v4 = [*(id *)(a1 + 48) identifier];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setIdentifier:v4];

  v5 = [*(id *)(a1 + 48) syncDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setSyncDate:v5];

  v6 = [*(id *)(a1 + 48) allowReadToken];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setAllowReadToken:v6];

  id v7 = [*(id *)(a1 + 48) safetyCacheKey];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setSafetyCacheKey:v7];

  id v8 = [*(id *)(a1 + 48) shareURL];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setShareURL:v8];

  id v9 = [*(id *)(a1 + 48) participantID];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setParticipantID:v9];

  v10 = [*(id *)(a1 + 48) sharingInvitationData];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setSharingInvitationData:v10];

  id v11 = [*(id *)(a1 + 48) sessionUUID];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setSessionUUID:v11];

  v12 = +[SMCacheMO fetchRequest];
  v13 = (void *)MEMORY[0x1E4F28F60];
  v14 = [*(id *)(a1 + 48) phoneCache];
  v15 = [v14 identifier];
  id v16 = [v13 predicateWithFormat:@"%K == %@", @"identifier", v15];
  v45 = v12;
  [v12 setPredicate:v16];

  id v17 = *(void **)(a1 + 40);
  id v48 = 0;
  v44 = [v17 executeFetchRequest:v12 error:&v48];
  id v18 = v48;
  v19 = [*(id *)(a1 + 48) phoneCache];
  v20 = [v44 firstObject];
  v21 = +[SMCacheMO managedObjectWithCache:v19 managedObject:v20 inManagedObjectContext:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setPhoneCache:v21];

  uint64_t v22 = +[SMCacheMO fetchRequest];
  v23 = (void *)MEMORY[0x1E4F28F60];
  v24 = [*(id *)(a1 + 48) watchCache];
  id v25 = [v24 identifier];
  v26 = [v23 predicateWithFormat:@"%K == %@", @"identifier", v25];
  [v22 setPredicate:v26];

  v27 = *(void **)(a1 + 40);
  id v47 = v18;
  v43 = [v27 executeFetchRequest:v22 error:&v47];
  id v28 = v47;

  v29 = [*(id *)(a1 + 48) watchCache];
  v30 = [v43 firstObject];
  v31 = +[SMCacheMO managedObjectWithCache:v29 managedObject:v30 inManagedObjectContext:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setWatchCache:v31];

  v32 = +[SMReceiverSessionStatusMO fetchRequest];
  v33 = (void *)MEMORY[0x1E4F28F60];
  v34 = [*(id *)(a1 + 48) sessionStatus];
  v35 = [v34 identifier];
  v36 = [v33 predicateWithFormat:@"%K == %@", @"identifier", v35];
  [v32 setPredicate:v36];

  v37 = *(void **)(a1 + 40);
  id v46 = v28;
  v38 = [v37 executeFetchRequest:v32 error:&v46];
  id v39 = v46;

  v40 = [*(id *)(a1 + 48) sessionStatus];
  v41 = [v38 firstObject];
  v42 = +[SMReceiverSessionStatusMO managedObjectWithReceiverSessionStatus:v40 managedObject:v41 inManagedObjectContext:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setSessionStatus:v42];

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMaxPhoneCacheSize:[*(id *)(a1 + 48) maxPhoneCacheSize]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMaxWatchCacheSize:[*(id *)(a1 + 48) maxWatchCacheSize]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMaxLocationsInPhoneCacheTrace:[*(id *)(a1 + 48) maxLocationsInPhoneCacheTrace]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMaxLocationsInWatchCacheTrace:[*(id *)(a1 + 48) maxLocationsInWatchCacheTrace]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setNumCacheDownloads:[*(id *)(a1 + 48) numCacheDownloads]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setNumSuccessfulCacheDownloads:[*(id *)(a1 + 48) numSuccessfulCacheDownloads]];
  [*(id *)(a1 + 48) timeTillCacheRelease];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setTimeTillCacheRelease:];
  [*(id *)(a1 + 48) timeTillFirstSuccessfulCacheDownload];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setTimeTillFirstSuccessfulCacheDownload:];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setFirstDetailViewSessionState:[*(id *)(a1 + 48) firstDetailViewSessionState]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLastDetailViewSessionState:[*(id *)(a1 + 48) lastDetailViewSessionState]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setPhoneMaxWorkoutEvents:[*(id *)(a1 + 48) phoneMaxWorkoutEvents]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setWatchMaxWorkoutEvents:[*(id *)(a1 + 48) watchMaxWorkoutEvents]];
}

@end