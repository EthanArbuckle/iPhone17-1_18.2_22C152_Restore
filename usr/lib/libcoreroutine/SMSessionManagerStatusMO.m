@interface SMSessionManagerStatusMO
+ (id)fetchRequest;
+ (id)managedObjectWithSessionManagerStatus:(id)a3 inManagedObjectContext:(id)a4;
+ (id)managedObjectWithSessionManagerStatus:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5;
@end

@implementation SMSessionManagerStatusMO

+ (id)managedObjectWithSessionManagerStatus:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)[a1 managedObjectWithSessionManagerStatus:a3 managedObject:0 inManagedObjectContext:a4];
}

+ (id)managedObjectWithSessionManagerStatus:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
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
    v13 = "Invalid parameter not satisfying: sessionManagerStatus";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_7;
  }
  if (v9)
  {
    *(void *)buf = 0;
    v21 = buf;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__40;
    v24 = __Block_byref_object_dispose__40;
    id v25 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __103__SMSessionManagerStatusMO_managedObjectWithSessionManagerStatus_managedObject_inManagedObjectContext___block_invoke;
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

void __103__SMSessionManagerStatusMO_managedObjectWithSessionManagerStatus_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  v2 = *(SMSessionManagerStatusMO **)(a1 + 32);
  v3 = v2;
  if (!v2) {
    v3 = [[SMSessionManagerStatusMO alloc] initWithContext:*(void *)(a1 + 40)];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v3);
  if (!v2) {

  }
  v4 = [*(id *)(a1 + 48) identifier];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setIdentifier:v4];

  v5 = [*(id *)(a1 + 48) stateQueryDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setStateQueryDate:v5];

  v6 = [*(id *)(a1 + 48) lastSessionIDDuringMagnetBreak];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLastSessionIDDuringMagnetBreak:v6];

  id v8 = [*(id *)(a1 + 48) state];
  id v7 = +[SMSessionManagerStateMO initWithSessionManagerState:v8 inManagedObjectContext:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setState:v7];
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"SMSessionManagerStatusMO"];
}

@end