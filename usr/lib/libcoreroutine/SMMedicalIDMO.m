@interface SMMedicalIDMO
+ (id)fetchRequest;
+ (id)managedObjectWithMedicalID:(id)a3 inManagedObjectContext:(id)a4;
+ (id)managedObjectWithMedicalID:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5;
@end

@implementation SMMedicalIDMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"SMMedicalIDMO"];
}

+ (id)managedObjectWithMedicalID:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)[a1 managedObjectWithMedicalID:a3 managedObject:0 inManagedObjectContext:a4];
}

+ (id)managedObjectWithMedicalID:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
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
    v13 = "Invalid parameter not satisfying: medicalID";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_7;
  }
  if (v9)
  {
    *(void *)buf = 0;
    v21 = buf;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__157;
    v24 = __Block_byref_object_dispose__157;
    id v25 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __81__SMMedicalIDMO_managedObjectWithMedicalID_managedObject_inManagedObjectContext___block_invoke;
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

void __81__SMMedicalIDMO_managedObjectWithMedicalID_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v2 = *(SMMedicalIDMO **)(a1 + 32);
  v3 = v2;
  if (!v2) {
    v3 = [[SMMedicalIDMO alloc] initWithContext:*(void *)(a1 + 40)];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v3);
  if (!v2) {

  }
  v4 = [*(id *)(a1 + 48) identifier];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setIdentifier:v4];

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setAge:((__int16)[*(id *)(a1 + 48) age])];
  v5 = [*(id *)(a1 + 48) allergiesAndRestrictions];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setAllergiesAndRestrictions:v5];

  v6 = [*(id *)(a1 + 48) bloodType];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setBloodType:v6];

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setHeight:*(__int16 *)(*(void *)(a1 + 48) + 4)];
  id v7 = [*(id *)(a1 + 48) medicalConditions];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMedicalConditions:v7];

  id v8 = [*(id *)(a1 + 48) medicalNotes];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMedicalNotes:v8];

  id v9 = [*(id *)(a1 + 48) name];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setName:v9];

  v10 = [*(id *)(a1 + 48) primaryLanguage];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setPrimaryLanguage:v10];

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setWeight:*(__int16 *)(*(void *)(a1 + 48) + 8)];
  id v11 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v12 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) emergencyContacts];
  v27 = [v11 initWithCapacity:[v12 count]];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v29 = a1;
  id obj = [*(id *)(a1 + 48) emergencyContacts];
  uint64_t v13 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v28 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v32 != v28) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v17 = +[SMEmergencyContactMO fetchRequest];
        id v18 = (void *)MEMORY[0x1E4F28F60];
        v19 = [v16 identifier];
        v20 = [v18 predicateWithFormat:@"%K == %@", @"identifier", v19];
        [v17 setPredicate:v20];

        v21 = *(void **)(v29 + 40);
        id v30 = 0;
        uint64_t v22 = [v21 executeFetchRequest:v17 error:&v30];
        id v23 = v30;
        v24 = [v22 firstObject];
        id v25 = +[SMEmergencyContactMO managedObjectWithEmergencyContact:v16 managedObject:v24 inManagedObjectContext:*(void *)(v29 + 40)];

        if (v25) {
          [v27 addObject:v25];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v14);
  }

  [*(id *)(*(void *)(*(void *)(v29 + 56) + 8) + 40) setEmergencyContacts:v27];
}

@end