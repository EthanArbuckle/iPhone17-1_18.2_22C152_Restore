@interface RTLearnedPlaceMO
+ (id)fetchRequest;
+ (id)fetchRequestSortedByCreation;
+ (id)managedObjectWithPlace:(id)a3 inManagedObjectContext:(id)a4;
+ (id)managedObjectWithPlace:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5;
- (void)didSave;
@end

@implementation RTLearnedPlaceMO

+ (id)fetchRequestSortedByCreation
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 fetchRequest];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"creationDate" ascending:1];
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v2 setSortDescriptors:v4];

  return v2;
}

+ (id)fetchRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"RTLearnedPlaceMO"];

  return v2;
}

+ (id)managedObjectWithPlace:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)[a1 managedObjectWithPlace:a3 managedObject:0 inManagedObjectContext:a4];
}

+ (id)managedObjectWithPlace:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: place";
LABEL_15:
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_16;
  }
  v10 = [v7 mapItem];

  if (!v10)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: place.mapItem";
    goto LABEL_15;
  }
  if (!v9)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: managedObjectContext";
    goto LABEL_15;
  }
  v11 = [v8 managedObjectContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_8:
    *(void *)buf = 0;
    v23 = buf;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__150;
    v26 = __Block_byref_object_dispose__150;
    id v27 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __80__RTLearnedPlaceMO_managedObjectWithPlace_managedObject_inManagedObjectContext___block_invoke;
    v17[3] = &unk_1E6B91CA8;
    v21 = buf;
    id v18 = v8;
    id v19 = v9;
    id v20 = v7;
    [v19 performBlockAndWait:v17];
    id v14 = *((id *)v23 + 5);

    _Block_object_dispose(buf, 8);
    goto LABEL_17;
  }
  v13 = [v8 managedObjectContext];
  if ((-[NSObject allowTombstones](v13, "allowTombstones") & 1) != 0 || ([v8 flags] & 1) == 0)
  {

    goto LABEL_8;
  }
LABEL_16:

  id v14 = 0;
LABEL_17:

  return v14;
}

void __80__RTLearnedPlaceMO_managedObjectWithPlace_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  v2 = *(RTLearnedPlaceMO **)(a1 + 32);
  v3 = v2;
  if (!v2) {
    v3 = [[RTLearnedPlaceMO alloc] initWithContext:*(void *)(a1 + 40)];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v3);
  if (!v2) {

  }
  v4 = [*(id *)(a1 + 48) customLabel];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCustomLabel:v4];

  v5 = [*(id *)(a1 + 48) identifier];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setIdentifier:v5];

  v6 = [NSNumber numberWithUnsignedInteger:[*(id *)(a1 + 48) type]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setType:v6];

  id v7 = [NSNumber numberWithUnsignedInteger:[*(id *)(a1 + 48) typeSource]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setTypeSource:v7];

  id v8 = [*(id *)(a1 + 48) creationDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCreationDate:v8];

  id v9 = [*(id *)(a1 + 48) expirationDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setExpirationDate:v9];

  v10 = +[RTMapItemMO fetchRequest];
  v11 = (void *)MEMORY[0x1E4F28F60];
  v12 = [*(id *)(a1 + 48) mapItem];
  v13 = [v12 identifier];
  id v14 = [v11 predicateWithFormat:@"%K == %@", @"identifier", v13];
  [v10 setPredicate:v14];

  v15 = *(void **)(a1 + 40);
  id v21 = 0;
  v16 = [v15 executeFetchRequest:v10 error:&v21];
  id v17 = v21;
  id v18 = [*(id *)(a1 + 48) mapItem];
  id v19 = [v16 firstObject];
  id v20 = +[RTMapItemMO managedObjectWithMapItem:v18 managedObject:v19 inManagedObjectContext:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMapItem:v20];
}

- (void)didSave
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v4 = [(RTLearnedPlaceMO *)self managedObjectContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [(RTLearnedPlaceMO *)self managedObjectContext];
    char v7 = [v6 options];

    uint64_t v8 = v7 & 1;
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = [(RTLearnedPlaceMO *)self managedObjectContext];
  v10 = [v9 transactionAuthor];
  if ([v10 hasPrefix:@"NSCloudKitMirroringDelegate"]) {
    goto LABEL_12;
  }
  v11 = [(RTLearnedPlaceMO *)self managedObjectContext];
  v12 = [v11 transactionAuthor];
  if (([v12 hasPrefix:@"RTPersistenceStoreImporter"] & 1) != 0 || v8)
  {

LABEL_12:
LABEL_13:

    goto LABEL_14;
  }
  v13 = [(RTLearnedPlaceMO *)self mapItem];

  if (!v13)
  {
    id v14 = NSString;
    v15 = [(RTCloudManagedObject *)self identifier];
    v16 = [(RTLearnedPlaceMO *)self managedObjectContext];
    id v17 = [v16 transactionAuthor];
    id v9 = [v14 stringWithFormat:@"map item is nil for place with identifier, %@, transactionAuthor, %@", v15, v17];

    id v18 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v9;
      _os_log_fault_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
    }

    id v19 = NSString;
    id v20 = (objc_class *)objc_opt_class();
    id v21 = NSStringFromClass(v20);
    v22 = NSStringFromSelector(a2);
    v23 = [v19 stringWithFormat:@"%@.%@.detectedNilMapItem", v21, v22];

    uint64_t v24 = [NSString stringWithFormat:@"This device detected an unexpected state in the learned location graph of CoreRoutine. Please file a radar to help diagnose the issue."];
    v25 = [NSString stringWithFormat:@"%@ - %@", v23, v9];
    v26 = NSString;
    id v27 = [MEMORY[0x1E4F1C9C8] date];
    v28 = [v27 stringFromDate];
    v29 = [v26 stringWithFormat:@"issue detected at %@", v28];

    +[RTRadarUtilities promptUserToCreateRadarForAssertionIdentifier:v23 alertMessage:v24 radarTitle:v25 radarDescription:v29 handler:0];
    goto LABEL_13;
  }
LABEL_14:
  v30.receiver = self;
  v30.super_class = (Class)RTLearnedPlaceMO;
  [(RTLearnedPlaceMO *)&v30 didSave];
}

@end