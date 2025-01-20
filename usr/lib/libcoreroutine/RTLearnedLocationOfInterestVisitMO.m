@interface RTLearnedLocationOfInterestVisitMO
+ (id)fetchRequest;
+ (id)managedObjectWithVisit:(id)a3 inManagedObjectContext:(id)a4;
+ (id)managedObjectWithVisit:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5;
@end

@implementation RTLearnedLocationOfInterestVisitMO

+ (id)fetchRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"RTLearnedLocationOfInterestVisitMO"];

  return v2;
}

+ (id)managedObjectWithVisit:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)[a1 managedObjectWithVisit:a3 managedObject:0 inManagedObjectContext:a4];
}

+ (id)managedObjectWithVisit:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
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
    v13 = "Invalid parameter not satisfying: visit";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_7;
  }
  if (v9)
  {
    *(void *)buf = 0;
    v21 = buf;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__60;
    v24 = __Block_byref_object_dispose__60;
    id v25 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __98__RTLearnedLocationOfInterestVisitMO_managedObjectWithVisit_managedObject_inManagedObjectContext___block_invoke;
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

void __98__RTLearnedLocationOfInterestVisitMO_managedObjectWithVisit_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  v2 = *(RTLearnedLocationOfInterestVisitMO **)(a1 + 32);
  v3 = v2;
  if (!v2) {
    v3 = [[RTLearnedLocationOfInterestVisitMO alloc] initWithContext:*(void *)(a1 + 40)];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v3);
  if (!v2) {

  }
  v4 = NSNumber;
  v5 = [*(id *)(a1 + 48) location];
  [v5 confidence];
  v6 = [v4 numberWithDouble:];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setConfidence:v6];

  id v7 = NSNumber;
  id v8 = [*(id *)(a1 + 48) location];
  id v9 = [v7 numberWithUnsignedInteger:[v8 dataPointCount]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setDataPointCount:v9];

  v10 = [*(id *)(a1 + 48) entryDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setEntryDate:v10];

  id v11 = [*(id *)(a1 + 48) exitDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setExitDate:v11];

  v12 = [*(id *)(a1 + 48) identifier];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setIdentifier:v12];

  v13 = [*(id *)(a1 + 48) creationDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCreationDate:v13];

  v14 = [*(id *)(a1 + 48) expirationDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setExpirationDate:v14];

  v15 = NSNumber;
  id v16 = [*(id *)(a1 + 48) location];
  id v17 = [v16 location];
  [v17 latitude];
  id v18 = [v15 numberWithDouble:x0];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationLatitude:v18];

  v19 = NSNumber;
  v20 = [*(id *)(a1 + 48) location];
  v21 = [v20 location];
  [v21 longitude];
  uint64_t v22 = [v19 numberWithDouble:];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationLongitude:v22];

  v23 = NSNumber;
  v24 = [*(id *)(a1 + 48) location];
  id v25 = [v24 location];
  [v25 horizontalUncertainty];
  v26 = [v23 numberWithDouble:];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationHorizontalUncertainty:v26];

  v27 = NSNumber;
  v28 = [*(id *)(a1 + 48) location];
  v29 = [v28 location];
  [v29 altitude];
  v30 = [v27 numberWithDouble:x0];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationAltitude:v30];

  v31 = NSNumber;
  v32 = [*(id *)(a1 + 48) location];
  v33 = [v32 location];
  [v33 verticalUncertainty];
  v34 = [v31 numberWithDouble:];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationVerticalUncertainty:v34];

  v35 = NSNumber;
  v36 = [*(id *)(a1 + 48) location];
  v37 = [v36 location];
  v38 = [v35 numberWithUnsignedInteger:[v37 sourceAccuracy]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationSourceAccuracy:v38];

  v39 = NSNumber;
  v40 = [*(id *)(a1 + 48) location];
  v41 = [v40 location];
  v42 = [v39 numberWithUnsignedInt:[v41 referenceFrame]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationReferenceFrame:v42];

  v43 = NSNumber;
  [*(id *)(a1 + 48) placeConfidence];
  v44 = [v43 numberWithDouble:];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationOfInterestConfidence:v44];

  [NSNumber numberWithUnsignedInteger:[*(id *)(a1 + 48) placeSource]];
  id v45 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationOfInterestSource:v45];
}

@end