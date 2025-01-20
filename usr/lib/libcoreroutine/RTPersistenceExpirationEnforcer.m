@interface RTPersistenceExpirationEnforcer
- (BOOL)removeExpiredRecordsBeforeDate:(id)a3 context:(id)a4 error:(id *)a5;
- (BOOL)removeExpiredRecordsWithObjectIDs:(id)a3 context:(id)a4 error:(id *)a5;
- (BOOL)removeRecordsOwnedByOtherDevicesExpiredBeforeDate:(id)a3 allowPropagation:(BOOL)a4 context:(id)a5 error:(id *)a6;
- (BOOL)removeRecordsOwnedByThisDeviceExpiredBeforeDate:(id)a3 context:(id)a4 error:(id *)a5;
- (BOOL)repairInvalidExpirationDatesWithContext:(id)a3 error:(id *)a4;
- (RTPersistenceExpirationEnforcer)init;
- (RTPersistenceExpirationEnforcer)initWithPersistenceManager:(id)a3;
- (id)collectRecordIDsByTypeExpiredBeforeDate:(id)a3 ownedByThisDevice:(BOOL)a4 context:(id)a5 error:(id *)a6;
- (id)entitiesWithDeviceAndExpirationProperty:(id)a3 ownedByThisDevice:(BOOL)a4;
- (id)objectIDsByTypeAffectedByDeletingObjectWithID:(id)a3 context:(id)a4 error:(id *)a5;
- (id)objectsWithLifetimeMatchingObjectWithID:(id)a3 context:(id)a4 error:(id *)a5;
- (void)mergeEntriesFromDictionary:(id)a3 intoDictionary:(id)a4;
- (void)mergeIdentifiersFromArray:(id)a3 entityName:(id)a4 intoDictionary:(id)a5;
@end

@implementation RTPersistenceExpirationEnforcer

- (RTPersistenceExpirationEnforcer)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPersistenceManager_);
}

- (RTPersistenceExpirationEnforcer)initWithPersistenceManager:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v29.receiver = self;
    v29.super_class = (Class)RTPersistenceExpirationEnforcer;
    v6 = [(RTPersistenceExpirationEnforcer *)&v29 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_persistenceManager, a3);
      v28 = (void *)MEMORY[0x1E4F1CAD0];
      v8 = +[RTAddressMO entity];
      v9 = [v8 name];
      v10 = +[RTDeviceMO entity];
      v11 = [v10 name];
      v12 = +[RTEntityDeletionRequestMO entity];
      v13 = [v12 name];
      v14 = +[RTMapItemMO entity];
      v15 = [v14 name];
      uint64_t v16 = [v28 setWithObjects:v9, v11, v13, v15, nil];
      v17 = (void *)_MergedGlobals_99;
      _MergedGlobals_99 = v16;

      v18 = (void *)MEMORY[0x1E4F1CAD0];
      v19 = +[RTDeviceMO entity];
      v20 = [v19 name];
      v21 = +[RTEntityDeletionRequestMO entity];
      v22 = [v21 name];
      uint64_t v23 = [v18 setWithObjects:v20, v22];
      v24 = (void *)qword_1EBE38868;
      qword_1EBE38868 = v23;
    }
    self = v7;
    v25 = self;
  }
  else
  {
    v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceManager", buf, 2u);
    }

    v25 = 0;
  }

  return v25;
}

- (id)entitiesWithDeviceAndExpirationProperty:(id)a3 ownedByThisDevice:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = [a3 persistentStoreCoordinator];
  v21 = [v5 managedObjectModel];

  v6 = objc_opt_new();
  uint64_t v7 = [[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.%K != nil", @"propertiesByName", @"expirationDate"];
  if (v7) {
    [v6 addObject:v7];
  }
  v20 = (void *)v7;
  v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.%K != nil", @"propertiesByName", @"device"];
  if (v8) {
    [v6 addObject:v8];
  }
  v9 = &_MergedGlobals_99;
  if (!v4) {
    v9 = &qword_1EBE38868;
  }
  id v10 = (id)*v9;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != %@", @"name", *(void *)(*((void *)&v22 + 1) + 8 * i)];
        if (v15) {
          [v6 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }
  uint64_t v16 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v6];
  v17 = [v21 entities];
  v18 = [v17 filteredArrayUsingPredicate:v16];

  return v18;
}

- (id)collectRecordIDsByTypeExpiredBeforeDate:(id)a3 ownedByThisDevice:(BOOL)a4 context:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a5;
  uint64_t v13 = v12;
  if (a6)
  {
    if (v11)
    {
      if (v12)
      {
        v14 = [MEMORY[0x1E4F1CA48] array];
        *(void *)buf = 0;
        v34 = buf;
        uint64_t v35 = 0x3032000000;
        v36 = __Block_byref_object_copy__91;
        v37 = __Block_byref_object_dispose__91;
        id v38 = 0;
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __107__RTPersistenceExpirationEnforcer_collectRecordIDsByTypeExpiredBeforeDate_ownedByThisDevice_context_error___block_invoke;
        v26[3] = &unk_1E6B98930;
        v26[4] = self;
        BOOL v32 = a4;
        id v27 = v13;
        v30 = buf;
        id v28 = v11;
        SEL v31 = a2;
        id v15 = v14;
        id v29 = v15;
        [v27 performBlockAndWait:v26];
        uint64_t v16 = _RTSafeArray();
        v17 = _RTMultiErrorCreate();

        v18 = _RTSafeArray();
        _RTMultiErrorCreate();
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        if (v17) {
          v19 = 0;
        }
        else {
          v19 = (void *)*((void *)v34 + 5);
        }
        id v21 = v19;

        _Block_object_dispose(buf, 8);
        goto LABEL_18;
      }
      long long v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
      }

      long long v23 = @"context";
    }
    else
    {
      long long v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceDate", buf, 2u);
      }

      long long v23 = @"referenceDate";
    }
    _RTErrorInvalidParameterCreate((uint64_t)v23);
    id v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    id v21 = 0;
  }
LABEL_18:

  return v21;
}

void __107__RTPersistenceExpirationEnforcer_collectRecordIDsByTypeExpiredBeforeDate_ownedByThisDevice_context_error___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) entitiesWithDeviceAndExpirationProperty:*(void *)(a1 + 40) ownedByThisDevice:*(unsigned __int8 *)(a1 + 80)];
  uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:[v2 count]];
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  int v6 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v7 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v8 = [*(id *)(a1 + 40) currentDevice];
  v9 = (void *)v8;
  if (v6) {
    id v10 = @"%K == %@ && %K <= %@";
  }
  else {
    id v10 = @"%K != %@ && %K <= %@";
  }
  uint64_t v11 = [v7 predicateWithFormat:v10, @"device", v8, @"expirationDate", *(void *)(a1 + 48)];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v12 = v2;
  uint64_t v13 = (void *)v11;
  id v14 = v12;
  uint64_t v36 = [v12 countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v36)
  {
    uint64_t v15 = *(void *)v39;
    id v34 = v14;
    uint64_t v35 = *(void *)v39;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(v14);
        }
        v17 = *(void **)(*((void *)&v38 + 1) + 8 * v16);
        id v18 = objc_alloc(MEMORY[0x1E4F1C0D0]);
        v19 = [v17 name];
        v20 = (void *)[v18 initWithEntityName:v19];

        [v20 setResultType:1];
        [v20 setPredicate:v13];
        id v21 = *(void **)(a1 + 40);
        id v37 = 0;
        long long v22 = [v21 executeFetchRequest:v20 error:&v37];
        id v23 = v37;
        if (v23)
        {
          long long v24 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            BOOL v32 = NSStringFromSelector(*(SEL *)(a1 + 72));
            v33 = [v17 name];
            *(_DWORD *)buf = 138412802;
            uint64_t v43 = (uint64_t)v32;
            __int16 v44 = 2112;
            v45 = v33;
            __int16 v46 = 2112;
            id v47 = v23;
            _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "%@, encountered error fetching expired %@s, error, %@", buf, 0x20u);

            uint64_t v15 = v35;
          }

          [*(id *)(a1 + 56) addObject:v23];
        }
        else if ([v22 count])
        {
          long long v25 = v13;
          v26 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            uint64_t v27 = [v22 count];
            id v28 = [v17 name];
            *(_DWORD *)buf = 134218242;
            uint64_t v43 = v27;
            __int16 v44 = 2112;
            v45 = v28;
            _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "adding %lu object IDs of type %@ to redaction map", buf, 0x16u);
          }
          id v29 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          v30 = [MEMORY[0x1E4F1CAD0] setWithArray:v22];
          SEL v31 = [v17 name];
          [v29 setObject:v30 forKey:v31];

          uint64_t v13 = v25;
          id v14 = v34;
          uint64_t v15 = v35;
        }

        ++v16;
      }
      while (v36 != v16);
      uint64_t v36 = [v14 countByEnumeratingWithState:&v38 objects:v48 count:16];
    }
    while (v36);
  }
}

- (BOOL)removeRecordsOwnedByOtherDevicesExpiredBeforeDate:(id)a3 allowPropagation:(BOOL)a4 context:(id)a5 error:(id *)a6
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  uint64_t v13 = v12;
  if (!a6)
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    goto LABEL_12;
  }
  if (!v11)
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceDate", buf, 2u);
    }

    v19 = @"referenceDate";
    goto LABEL_19;
  }
  if (!v12)
  {
    v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    v19 = @"context";
LABEL_19:
    _RTErrorInvalidParameterCreate((uint64_t)v19);
    BOOL v16 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  int64_t v14 = [(RTPersistenceManager *)self->_persistenceManager mirroringDelegateStateForStoreType:1];
  if (v14 == 2)
  {
    long long v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v39 = *MEMORY[0x1E4F28568];
    v40[0] = @"The mirroring request failed because the mirroring delegate failed setup.";
    id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    long long v24 = [v22 errorWithDomain:@"RTPersistenceMirroringManagerErrorDomain" code:7 userInfo:v23];

    id v25 = v24;
    *a6 = v25;

LABEL_12:
    BOOL v16 = 0;
    goto LABEL_20;
  }
  if (v14)
  {
    v26 = [MEMORY[0x1E4F1CA48] array];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __116__RTPersistenceExpirationEnforcer_removeRecordsOwnedByOtherDevicesExpiredBeforeDate_allowPropagation_context_error___block_invoke;
    v31[3] = &unk_1E6B97790;
    id v32 = v13;
    v33 = self;
    id v35 = v26;
    SEL v36 = a2;
    id v34 = v11;
    BOOL v37 = a4;
    id v27 = v26;
    [v32 performBlockAndWait:v31];
    id v28 = _RTSafeArray();
    id v29 = _RTMultiErrorCreate();

    id v30 = v29;
    *a6 = v30;
    BOOL v16 = v30 == 0;
  }
  else
  {
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Attempted to remove records from other device with RTPersistenceMirroringDelegateStateUnknown", buf, 2u);
    }

    *a6 = 0;
    BOOL v16 = 1;
  }
LABEL_20:

  return v16;
}

void __116__RTPersistenceExpirationEnforcer_removeRecordsOwnedByOtherDevicesExpiredBeforeDate_allowPropagation_context_error___block_invoke(uint64_t a1)
{
  v105[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) transactionAuthor];
  [*v2 setTransactionAuthor:@"ExpirationEnforcer"];
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *v2;
  id v87 = 0;
  uint64_t v7 = [v4 collectRecordIDsByTypeExpiredBeforeDate:v5 ownedByThisDevice:0 context:v6 error:&v87];
  id v8 = v87;
  if (!v8)
  {
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v102 = __Block_byref_object_copy__91;
    v103 = __Block_byref_object_dispose__91;
    id v104 = 0;
    id v10 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v7];
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __116__RTPersistenceExpirationEnforcer_removeRecordsOwnedByOtherDevicesExpiredBeforeDate_allowPropagation_context_error___block_invoke_51;
    v83[3] = &unk_1E6B98958;
    int8x16_t v69 = *(int8x16_t *)(a1 + 32);
    id v11 = (id)v69.i64[0];
    int8x16_t v84 = vextq_s8(v69, v69, 8uLL);
    v86 = buf;
    id v12 = v10;
    id v85 = v12;
    [v7 enumerateKeysAndObjectsUsingBlock:v83];
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v45 = NSStringFromSelector(*(SEL *)(a1 + 64));
        uint64_t v46 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)v97 = 138412546;
        *(void *)&v97[4] = v45;
        *(_WORD *)&v97[12] = 2112;
        *(void *)&v97[14] = v46;
        _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@, encountered error while collecting matched lifetime records from other devices, error, %@", v97, 0x16u);
      }
      [*(id *)(a1 + 56) addObject:*(void *)(*(void *)&buf[8] + 40)];
      goto LABEL_33;
    }
    *(void *)v97 = 0;
    *(void *)&v97[8] = v97;
    *(void *)&v97[16] = 0x3032000000;
    v98 = __Block_byref_object_copy__91;
    v99 = __Block_byref_object_dispose__91;
    id v100 = 0;
    int64_t v14 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v12];
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __116__RTPersistenceExpirationEnforcer_removeRecordsOwnedByOtherDevicesExpiredBeforeDate_allowPropagation_context_error___block_invoke_53;
    v79[3] = &unk_1E6B98958;
    int8x16_t v70 = *(int8x16_t *)(a1 + 32);
    id v15 = (id)v70.i64[0];
    int8x16_t v80 = vextq_s8(v70, v70, 8uLL);
    v82 = v97;
    id v16 = v14;
    id v81 = v16;
    [v12 enumerateKeysAndObjectsUsingBlock:v79];
    if (*(void *)(*(void *)&v97[8] + 40))
    {
      v17 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v50 = NSStringFromSelector(*(SEL *)(a1 + 64));
        uint64_t v51 = *(void *)(*(void *)&v97[8] + 40);
        *(_DWORD *)v93 = 138412546;
        *(void *)&v93[4] = v50;
        *(_WORD *)&v93[12] = 2112;
        *(void *)&v93[14] = v51;
        _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "%@, encountered error while finding object IDs affected by deleting object, from other devices, error, %@", v93, 0x16u);
      }
      [*(id *)(a1 + 56) addObject:*(void *)(*(void *)&v97[8] + 40)];
      goto LABEL_32;
    }
    if (*(unsigned char *)(a1 + 72) || ![v7 count])
    {
LABEL_14:
      uint64_t v19 = *(void *)(a1 + 32);
      id v18 = *(void **)(a1 + 40);
      id v72 = 0;
      [v18 removeExpiredRecordsWithObjectIDs:v7 context:v19 error:&v72];
      id v20 = v72;
      if (v20)
      {
        id v21 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v55 = NSStringFromSelector(*(SEL *)(a1 + 64));
          *(_DWORD *)v93 = 138412546;
          *(void *)&v93[4] = v55;
          *(_WORD *)&v93[12] = 2112;
          *(void *)&v93[14] = v20;
          _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "%@, encountered error while removing expired records for other devices on this device, error, %@", v93, 0x16u);
        }
        [*(id *)(a1 + 56) addObject:v20];
      }
      else
      {
        uint64_t v43 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          __int16 v44 = NSStringFromSelector(*(SEL *)(a1 + 64));
          *(_DWORD *)v93 = 138412290;
          *(void *)&v93[4] = v44;
          _os_log_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_INFO, "%@, successfully removed expired records from other devices on this device", v93, 0xCu);
        }
      }
      [*(id *)(a1 + 32) setTransactionAuthor:v3];

      goto LABEL_32;
    }
    *(void *)v93 = 0;
    *(void *)&v93[8] = v93;
    *(void *)&v93[16] = 0x3032000000;
    v94 = __Block_byref_object_copy__91;
    v95 = __Block_byref_object_dispose__91;
    id v96 = 0;
    dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
    long long v24 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = [v16 count];
      *(_DWORD *)v88 = 134217984;
      *(void *)&v88[4] = v25;
      _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "submitting reset metadata request for %lu entity types", v88, 0xCu);
    }

    id v26 = objc_alloc(MEMORY[0x1E4F1C090]);
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __116__RTPersistenceExpirationEnforcer_removeRecordsOwnedByOtherDevicesExpiredBeforeDate_allowPropagation_context_error___block_invoke_55;
    v76[3] = &unk_1E6B98980;
    v78 = v93;
    v66 = v23;
    v77 = v66;
    v71 = (void *)[v26 initWithOptions:0 completionBlock:v76];
    id v27 = objc_opt_new();
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __116__RTPersistenceExpirationEnforcer_removeRecordsOwnedByOtherDevicesExpiredBeforeDate_allowPropagation_context_error___block_invoke_57;
    v74[3] = &unk_1E6B989A8;
    id v28 = v27;
    id v75 = v28;
    [v16 enumerateKeysAndObjectsUsingBlock:v74];
    id v29 = [MEMORY[0x1E4F1CAD0] setWithArray:v28];
    [v71 setObjectIDsToReset:v29];
    v63 = v28;

    id v30 = *(void **)(a1 + 32);
    id v73 = 0;
    v68 = [v30 executeRequest:v71 error:&v73];
    id v31 = v73;
    v67 = v31;
    if (!v68 || v31)
    {
      id v47 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v56 = NSStringFromSelector(*(SEL *)(a1 + 64));
        *(_DWORD *)v88 = 138412802;
        *(void *)&v88[4] = v56;
        __int16 v89 = 2112;
        uint64_t v90 = (uint64_t)v63;
        __int16 v91 = 2112;
        v92 = v67;
        _os_log_error_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_ERROR, "%@, encountered error during metadata reset request with object IDs %@s, error, %@", v88, 0x20u);
      }
      BOOL v48 = v67 != 0;

      if (v67)
      {
        [*(id *)(a1 + 56) addObject:v67];
        id v49 = 0;
LABEL_44:
        BOOL v48 = 0;
        goto LABEL_49;
      }
      id v49 = 0;
    }
    else
    {
      dsema = v66;
      v62 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v32 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(dsema, v32)) {
        goto LABEL_39;
      }
      v61 = [MEMORY[0x1E4F1C9C8] now];
      [v61 timeIntervalSinceDate:v62];
      double v34 = v33;
      v59 = objc_opt_new();
      v60 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_72];
      id v35 = [MEMORY[0x1E4F29060] callStackSymbols];
      SEL v36 = [v35 filteredArrayUsingPredicate:v60];
      BOOL v37 = [v36 firstObject];

      [v59 submitToCoreAnalytics:v37 type:1 duration:v34];
      long long v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v88 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v88, 2u);
      }

      uint64_t v39 = (void *)MEMORY[0x1E4F28C58];
      v105[0] = *MEMORY[0x1E4F28568];
      *(void *)v88 = @"semaphore wait timeout";
      long long v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v105 count:1];
      long long v41 = [v39 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v40];

      if (v41)
      {
        id v42 = v41;
      }
      else
      {
LABEL_39:
        id v42 = 0;
      }

      id v49 = v42;
      if (*(void *)(*(void *)&v93[8] + 40))
      {
        v52 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          v57 = NSStringFromSelector(*(SEL *)(a1 + 64));
          v58 = *(void **)(*(void *)&v93[8] + 40);
          *(_DWORD *)v88 = 138412802;
          *(void *)&v88[4] = v57;
          __int16 v89 = 2112;
          uint64_t v90 = (uint64_t)v63;
          __int16 v91 = 2112;
          v92 = v58;
          _os_log_error_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_ERROR, "%@, encountered error during metadata reset request with object IDs %@s, error, %@", v88, 0x20u);
        }
        [*(id *)(a1 + 56) addObject:*(void *)(*(void *)&v93[8] + 40)];
        goto LABEL_44;
      }
      v53 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        dispatch_semaphore_t dsemaa = (dispatch_semaphore_t)(id)objc_claimAutoreleasedReturnValue();
        uint64_t v54 = [v63 count];
        *(_DWORD *)v88 = 138412802;
        *(void *)&v88[4] = dsemaa;
        __int16 v89 = 2048;
        uint64_t v90 = v54;
        __int16 v91 = 2112;
        v92 = v63;
        _os_log_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_INFO, "%@, successfully submitted metadata reset request for %lu object IDs, %@", v88, 0x20u);
      }
      BOOL v48 = 1;
    }
LABEL_49:

    _Block_object_dispose(v93, 8);
    if (!v48)
    {
LABEL_32:

      _Block_object_dispose(v97, 8);
LABEL_33:

      _Block_object_dispose(buf, 8);
      goto LABEL_34;
    }
    goto LABEL_14;
  }
  v9 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    long long v22 = NSStringFromSelector(*(SEL *)(a1 + 64));
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v22;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "%@, encountered error while collecting expired records from other devices, error, %@", buf, 0x16u);
  }
  [*(id *)(a1 + 56) addObject:v8];
LABEL_34:
}

void __116__RTPersistenceExpirationEnforcer_removeRecordsOwnedByOtherDevicesExpiredBeforeDate_allowPropagation_context_error___block_invoke_51(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = (void *)[v7 copy];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        int64_t v14 = (void *)MEMORY[0x1E016D870]();
        id v15 = *(void **)(a1 + 32);
        uint64_t v16 = *(void *)(a1 + 40);
        uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
        id obj = *(id *)(v17 + 40);
        id v18 = [v15 objectsWithLifetimeMatchingObjectWithID:v13 context:v16 error:&obj];
        objc_storeStrong((id *)(v17 + 40), obj);
        if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
        {
          *a4 = 1;

          goto LABEL_11;
        }
        [*(id *)(a1 + 32) mergeEntriesFromDictionary:v18 intoDictionary:*(void *)(a1 + 48)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void __116__RTPersistenceExpirationEnforcer_removeRecordsOwnedByOtherDevicesExpiredBeforeDate_allowPropagation_context_error___block_invoke_53(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = (void *)[a3 copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v12 = *(void **)(a1 + 32);
        uint64_t v13 = *(void *)(a1 + 40);
        uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
        id obj = *(id *)(v14 + 40);
        id v15 = [v12 objectIDsByTypeAffectedByDeletingObjectWithID:v11 context:v13 error:&obj];
        objc_storeStrong((id *)(v14 + 40), obj);
        if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
        {
          *a4 = 1;

          goto LABEL_11;
        }
        [*(id *)(a1 + 32) mergeEntriesFromDictionary:v15 intoDictionary:*(void *)(a1 + 48)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void __116__RTPersistenceExpirationEnforcer_removeRecordsOwnedByOtherDevicesExpiredBeforeDate_allowPropagation_context_error___block_invoke_55(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [v3 request];
    id v6 = [v5 requestIdentifier];
    uint64_t v7 = [v6 UUIDString];
    int v8 = [v3 madeChanges];
    int v9 = [v3 success];
    uint64_t v10 = [v3 error];
    int v14 = 138413058;
    id v15 = v7;
    __int16 v16 = 1024;
    int v17 = v8;
    __int16 v18 = 1024;
    int v19 = v9;
    __int16 v20 = 2112;
    long long v21 = v10;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "result for metadata reset request, CD request identifier, %@, made changes, %d, success, %d, error, %@", (uint8_t *)&v14, 0x22u);
  }
  uint64_t v11 = [v3 error];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __116__RTPersistenceExpirationEnforcer_removeRecordsOwnedByOtherDevicesExpiredBeforeDate_allowPropagation_context_error___block_invoke_57(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 allObjects];
  [v3 addObjectsFromArray:v4];
}

- (id)objectsWithLifetimeMatchingObjectWithID:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (a5)
  {
    if (v8)
    {
      if (v9)
      {
        uint64_t v11 = objc_opt_new();
        *(void *)buf = 0;
        id v27 = buf;
        uint64_t v28 = 0x3032000000;
        id v29 = __Block_byref_object_copy__91;
        id v30 = __Block_byref_object_dispose__91;
        id v31 = 0;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __89__RTPersistenceExpirationEnforcer_objectsWithLifetimeMatchingObjectWithID_context_error___block_invoke;
        v20[3] = &unk_1E6B94D30;
        id v21 = v10;
        uint64_t v25 = buf;
        id v22 = v8;
        long long v23 = self;
        id v12 = v11;
        id v24 = v12;
        [v21 performBlockAndWait:v20];
        *a5 = *((id *)v27 + 5);
        uint64_t v13 = v24;
        id v14 = v12;

        _Block_object_dispose(buf, 8);
        goto LABEL_15;
      }
      __int16 v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
      }

      int v17 = @"context";
    }
    else
    {
      __int16 v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: objectID", buf, 2u);
      }

      int v17 = @"objectID";
    }
    _RTErrorInvalidParameterCreate((uint64_t)v17);
    id v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    id v14 = 0;
  }
LABEL_15:

  return v14;
}

void __89__RTPersistenceExpirationEnforcer_objectsWithLifetimeMatchingObjectWithID_context_error___block_invoke(uint64_t a1)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v64 = 0;
  id v4 = [v2 existingObjectWithID:v3 error:&v64];
  id v5 = v64;
  if (v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v48 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      int8x16_t v69 = v48;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "unable to return an object for ID, %@", buf, 0xCu);
    }

    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    id v8 = v5;
    id v9 = *(NSObject **)(v7 + 40);
    *(void *)(v7 + 40) = v8;
    goto LABEL_34;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_34:

      goto LABEL_35;
    }
    int v17 = *(void **)(a1 + 40);
    __int16 v18 = (objc_class *)objc_opt_class();
    int v19 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138412546;
    int8x16_t v69 = v17;
    __int16 v70 = 2112;
    v71 = v19;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "object with ID, %@, is not of type RTCloudManagedObject, is %@", buf, 0x16u);
LABEL_14:

    goto LABEL_34;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    uint64_t v10 = [v4 inbound];
    uint64_t v11 = [v10 objectID];

    if (v11) {
      [v9 addObject:v11];
    }
    id v12 = [v4 outbound];
    uint64_t v13 = [v12 objectID];

    if (v13) {
      [v9 addObject:v13];
    }
    id v14 = *(void **)(a1 + 48);
    id v15 = +[RTLearnedTransitionMO entity];
    __int16 v16 = [v15 name];
    [v14 mergeIdentifiersFromArray:v9 entityName:v16 intoDictionary:*(void *)(a1 + 56)];

    goto LABEL_34;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v20 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    id v21 = [v4 mapItem];
    uint64_t v22 = [v21 objectID];

    if (v22) {
      [v20 addObject:v22];
    }
    long long v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    id v24 = [v4 mapItem];
    uint64_t v25 = [v24 address];
    uint64_t v26 = [v25 objectID];

    if (v26) {
      [v23 addObject:v26];
    }
    v57 = v20;
    v58 = v23;
    id v27 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v28 = [v4 visits];
    id v29 = [v27 initWithCapacity:[v28 count]];

    v59 = v4;
    uint64_t v30 = [v4 objectIDsForRelationshipNamed:@"visits"];
    if (v30) {
      [v29 addObjectsFromArray:v30];
    }
    v53 = (void *)v30;
    v55 = (void *)v26;
    v56 = (void *)v22;
    uint64_t v54 = v29;
    id v31 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:2 * [v29 count]];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    dispatch_time_t v32 = [v59 visits];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v60 objects:v67 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v61 != v35) {
            objc_enumerationMutation(v32);
          }
          BOOL v37 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          long long v38 = [v37 inbound];
          uint64_t v39 = [v38 objectID];

          if (v39) {
            [v31 addObject:v39];
          }
          long long v40 = [v37 outbound];
          long long v41 = [v40 objectID];

          if (v41) {
            [v31 addObject:v41];
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v60 objects:v67 count:16];
      }
      while (v34);
    }

    v52 = +[RTMapItemMO entity];
    uint64_t v51 = [v52 name];
    v65[0] = v51;
    id v9 = v57;
    v66[0] = v57;
    v50 = +[RTAddressMO entity];
    id v49 = [v50 name];
    v65[1] = v49;
    v66[1] = v58;
    id v42 = +[RTLearnedVisitMO entity];
    uint64_t v43 = [v42 name];
    v65[2] = v43;
    v66[2] = v54;
    __int16 v44 = +[RTLearnedTransitionMO entity];
    v45 = [v44 name];
    v65[3] = v45;
    v66[3] = v31;
    uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:4];

    [*(id *)(a1 + 48) mergeEntriesFromDictionary:v46 intoDictionary:*(void *)(a1 + 56)];
    id v4 = v59;
    goto LABEL_34;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v9 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
              goto LABEL_34;
            }
            id v47 = (objc_class *)objc_opt_class();
            int v19 = NSStringFromClass(v47);
            *(_DWORD *)buf = 138412290;
            int8x16_t v69 = v19;
            _os_log_fault_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_FAULT, "Unhandled entity type, %@", buf, 0xCu);
            goto LABEL_14;
          }
        }
      }
    }
  }
LABEL_35:
}

- (id)objectIDsByTypeAffectedByDeletingObjectWithID:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (a5)
  {
    if (v8)
    {
      if (v9)
      {
        *(void *)buf = 0;
        uint64_t v26 = buf;
        uint64_t v27 = 0x3032000000;
        uint64_t v28 = __Block_byref_object_copy__91;
        id v29 = __Block_byref_object_dispose__91;
        id v30 = 0;
        uint64_t v11 = objc_opt_new();
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __95__RTPersistenceExpirationEnforcer_objectIDsByTypeAffectedByDeletingObjectWithID_context_error___block_invoke;
        v19[3] = &unk_1E6B94D30;
        id v20 = v10;
        id v21 = v8;
        id v24 = buf;
        id v12 = v11;
        id v22 = v12;
        long long v23 = self;
        [v20 performBlockAndWait:v19];
        *a5 = *((id *)v26 + 5);
        id v13 = v12;

        _Block_object_dispose(buf, 8);
        goto LABEL_15;
      }
      int v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
      }

      __int16 v16 = @"context";
    }
    else
    {
      id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: objectID", buf, 2u);
      }

      __int16 v16 = @"objectID";
    }
    _RTErrorInvalidParameterCreate((uint64_t)v16);
    id v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    id v13 = 0;
  }
LABEL_15:

  return v13;
}

void __95__RTPersistenceExpirationEnforcer_objectIDsByTypeAffectedByDeletingObjectWithID_context_error___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v25 = 0;
  id v4 = [v2 existingObjectWithID:v3 error:&v25];
  id v5 = v25;
  if (v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v17;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "unable to return an object for ID, %@", buf, 0xCu);
    }

    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    id v8 = v5;
    id v9 = *(NSObject **)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v10);
      uint64_t v11 = (void *)MEMORY[0x1E4F1CA80];
      id v12 = [v4 objectID];
      id v13 = [v11 setWithObjects:v12];

      [*(id *)(a1 + 48) setValue:v13 forKey:v9];
      id v14 = [v4 entity];
      id v15 = [v14 relationshipsByName];

      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __95__RTPersistenceExpirationEnforcer_objectIDsByTypeAffectedByDeletingObjectWithID_context_error___block_invoke_69;
      v22[3] = &unk_1E6B989D0;
      id v23 = v4;
      int8x16_t v21 = *(int8x16_t *)(a1 + 48);
      id v16 = (id)v21.i64[0];
      int8x16_t v24 = vextq_s8(v21, v21, 8uLL);
      [v15 enumerateKeysAndObjectsUsingBlock:v22];
    }
    else
    {
      id v9 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *(void *)(a1 + 40);
        int v19 = (objc_class *)objc_opt_class();
        id v20 = NSStringFromClass(v19);
        *(_DWORD *)buf = 138412546;
        uint64_t v27 = v18;
        __int16 v28 = 2112;
        id v29 = v20;
        _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "object with ID, %@, is not of type RTCloudManagedObject, is %@", buf, 0x16u);
      }
    }
  }
}

void __95__RTPersistenceExpirationEnforcer_objectIDsByTypeAffectedByDeletingObjectWithID_context_error___block_invoke_69(void *a1, uint64_t a2, void *a3)
{
  id v5 = (void *)a1[4];
  id v6 = a3;
  id v10 = [v5 objectIDsForRelationshipNamed:a2];
  uint64_t v7 = (void *)a1[5];
  id v8 = [v6 destinationEntity];

  id v9 = [v8 name];
  [v7 mergeIdentifiersFromArray:v10 entityName:v9 intoDictionary:a1[6]];
}

- (void)mergeIdentifiersFromArray:(id)a3 entityName:(id)a4 intoDictionary:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 objectForKey:v8];
  id v11 = (id)[v10 mutableCopy];

  if (v11)
  {
    [v11 addObjectsFromArray:v9];
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1CA80] setWithArray:v9];
  }

  [v7 setObject:v11 forKey:v8];
}

- (void)mergeEntriesFromDictionary:(id)a3 intoDictionary:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__RTPersistenceExpirationEnforcer_mergeEntriesFromDictionary_intoDictionary___block_invoke;
  v8[3] = &unk_1E6B989F8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 enumerateKeysAndObjectsUsingBlock:v8];
}

void __77__RTPersistenceExpirationEnforcer_mergeEntriesFromDictionary_intoDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [a3 allObjects];
  [v5 mergeIdentifiersFromArray:v7 entityName:v6 intoDictionary:*(void *)(a1 + 40)];
}

- (BOOL)removeRecordsOwnedByThisDeviceExpiredBeforeDate:(id)a3 context:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (a5)
  {
    if (v9)
    {
      if (v10)
      {
        id v12 = [MEMORY[0x1E4F1CA48] array];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __97__RTPersistenceExpirationEnforcer_removeRecordsOwnedByThisDeviceExpiredBeforeDate_context_error___block_invoke;
        v23[3] = &unk_1E6B90F80;
        v23[4] = self;
        id v24 = v9;
        id v26 = v12;
        SEL v27 = a2;
        id v25 = v11;
        id v13 = v12;
        [v25 performBlockAndWait:v23];
        id v14 = _RTSafeArray();
        id v15 = _RTMultiErrorCreate();

        id v16 = v15;
        *a5 = v16;
        BOOL v17 = v16 == 0;

        goto LABEL_15;
      }
      int8x16_t v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
      }

      id v20 = @"context";
    }
    else
    {
      int v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceDate", buf, 2u);
      }

      id v20 = @"referenceDate";
    }
    _RTErrorInvalidParameterCreate((uint64_t)v20);
    BOOL v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  BOOL v17 = 0;
LABEL_15:

  return v17;
}

void __97__RTPersistenceExpirationEnforcer_removeRecordsOwnedByThisDeviceExpiredBeforeDate_context_error___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v17 = 0;
  id v5 = [v2 collectRecordIDsByTypeExpiredBeforeDate:v3 ownedByThisDevice:1 context:v4 error:&v17];
  id v6 = v17;
  if (v6)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v14 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412546;
      int v19 = v14;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@, encountered error while collecting expired records from this device, error, %@", buf, 0x16u);
    }
    [*(id *)(a1 + 56) addObject:v6];
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 48);
    id v16 = 0;
    [v8 removeExpiredRecordsWithObjectIDs:v5 context:v9 error:&v16];
    id v10 = v16;
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    id v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v15 = NSStringFromSelector(*(SEL *)(a1 + 64));
        *(_DWORD *)buf = 138412546;
        int v19 = v15;
        __int16 v20 = 2112;
        id v21 = v10;
        _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "%@, encountered error while removing expired records from this device, error, %@", buf, 0x16u);
      }
      [*(id *)(a1 + 56) addObject:v10];
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v13 = NSStringFromSelector(*(SEL *)(a1 + 64));
        *(_DWORD *)buf = 138412290;
        int v19 = v13;
        _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@, successfully removed expired records from this device", buf, 0xCu);
      }
    }
  }
}

- (BOOL)removeExpiredRecordsWithObjectIDs:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (a5)
  {
    if (v9)
    {
      id v11 = [MEMORY[0x1E4F1CA48] array];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __83__RTPersistenceExpirationEnforcer_removeExpiredRecordsWithObjectIDs_context_error___block_invoke;
      v20[3] = &unk_1E6B917F0;
      id v21 = v10;
      id v23 = v11;
      SEL v24 = a2;
      id v22 = v8;
      id v12 = v11;
      [v21 performBlockAndWait:v20];
      id v13 = _RTSafeArray();
      id v14 = _RTMultiErrorCreate();

      id v15 = v14;
      *a5 = v15;
      BOOL v16 = v15 == 0;
    }
    else
    {
      uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
      }

      _RTErrorInvalidParameterCreate(@"context");
      BOOL v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    BOOL v16 = 0;
  }

  return v16;
}

void __83__RTPersistenceExpirationEnforcer_removeExpiredRecordsWithObjectIDs_context_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) transactionAuthor];
  [*(id *)(a1 + 32) setTransactionAuthor:@"ExpirationEnforcer"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__RTPersistenceExpirationEnforcer_removeExpiredRecordsWithObjectIDs_context_error___block_invoke_2;
  v6[3] = &unk_1E6B98A20;
  uint64_t v3 = *(void **)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  long long v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  [*(id *)(a1 + 32) setTransactionAuthor:v2];
}

void __83__RTPersistenceExpirationEnforcer_removeExpiredRecordsWithObjectIDs_context_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = (objc_class *)MEMORY[0x1E4F1C018];
  id v7 = a3;
  id v8 = [v6 alloc];
  id v9 = [v7 allObjects];

  id v10 = (void *)[v8 initWithObjectIDs:v9];
  [v10 setResultType:2];
  id v11 = *(void **)(a1 + 32);
  id v19 = 0;
  id v12 = [v11 executeRequest:v10 error:&v19];
  id v13 = v19;
  id v14 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  id v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412802;
      id v21 = v18;
      __int16 v22 = 2112;
      id v23 = v5;
      __int16 v24 = 2112;
      id v25 = v13;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "%@, encountered error while removing expired %@s, error, %@", buf, 0x20u);
    }
    [*(id *)(a1 + 40) addObject:v13];
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      BOOL v16 = NSStringFromSelector(*(SEL *)(a1 + 48));
      id v17 = [v12 result];
      *(_DWORD *)buf = 138412802;
      id v21 = v16;
      __int16 v22 = 2112;
      id v23 = v17;
      __int16 v24 = 2112;
      id v25 = v5;
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%@, successfully deleted %@ expired %@s", buf, 0x20u);
    }
  }
}

- (BOOL)removeExpiredRecordsBeforeDate:(id)a3 context:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (a5)
  {
    if (v9)
    {
      if (v10)
      {
        id v33 = 0;
        BOOL v12 = [(RTPersistenceExpirationEnforcer *)self repairInvalidExpirationDatesWithContext:v10 error:&v33];
        id v13 = v33;
        id v32 = 0;
        BOOL v14 = [(RTPersistenceExpirationEnforcer *)self removeRecordsOwnedByThisDeviceExpiredBeforeDate:v9 context:v11 error:&v32];
        id v15 = v32;
        id v31 = 0;
        BOOL v16 = [(RTPersistenceExpirationEnforcer *)self removeRecordsOwnedByOtherDevicesExpiredBeforeDate:v9 allowPropagation:0 context:v11 error:&v31];
        id v17 = v31;
        uint64_t v18 = v17;
        if (!v12 || v13 || !v16 || !v14 || v15 || v17)
        {
          id v19 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            __int16 v20 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412290;
            uint64_t v35 = v20;
            id v21 = "%@, failed";
            goto LABEL_20;
          }
        }
        else
        {
          id v19 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            __int16 v20 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412290;
            uint64_t v35 = v20;
            id v21 = "%@, successful";
LABEL_20:
            _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, v21, buf, 0xCu);
          }
        }

        uint64_t v26 = _RTSafeArray();
        SEL v27 = _RTMultiErrorCreate();

        id v28 = v27;
        *a5 = v28;
        BOOL v23 = v28 == 0;

        goto LABEL_26;
      }
      id v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
      }

      id v25 = @"context";
    }
    else
    {
      __int16 v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceDate", buf, 2u);
      }

      id v25 = @"referenceDate";
    }
    _RTErrorInvalidParameterCreate((uint64_t)v25);
    BOOL v23 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  __int16 v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  BOOL v23 = 0;
LABEL_26:

  return v23;
}

- (BOOL)repairInvalidExpirationDatesWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4)
  {
    if (v6)
    {
      id v8 = objc_opt_new();
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __81__RTPersistenceExpirationEnforcer_repairInvalidExpirationDatesWithContext_error___block_invoke;
      v17[3] = &unk_1E6B91220;
      id v19 = v8;
      SEL v20 = a2;
      id v18 = v7;
      id v9 = v8;
      [v18 performBlockAndWait:v17];
      id v10 = _RTSafeArray();
      id v11 = _RTMultiErrorCreate();

      id v12 = v11;
      *a4 = v12;
      BOOL v13 = v12 == 0;
    }
    else
    {
      id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
      }

      _RTErrorInvalidParameterCreate(@"context");
      BOOL v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    BOOL v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    BOOL v13 = 0;
  }

  return v13;
}

void __81__RTPersistenceExpirationEnforcer_repairInvalidExpirationDatesWithContext_error___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  uint64_t v3 = [v2 managedObjectModel];

  id v4 = objc_opt_new();
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.%K != nil", @"propertiesByName", @"expirationDate"];
  if (v5) {
    [v4 addObject:v5];
  }
  uint64_t v36 = (void *)v5;
  BOOL v37 = v4;
  uint64_t v6 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v4];
  long long v38 = v3;
  id v7 = [v3 entitiesForConfiguration:@"Cloud"];
  uint64_t v35 = (void *)v6;
  id v8 = [v7 filteredArrayUsingPredicate:v6];
  id v9 = (void *)[v8 mutableCopy];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v10 = (void *)[v9 copy];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v47 objects:v60 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        BOOL v16 = [v15 propertiesByName];
        id v17 = [v16 objectForKey:@"expirationDate"];

        if ([v17 attributeType] != 900) {
          [v9 removeObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v47 objects:v60 count:16];
    }
    while (v12);
  }

  long long v41 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
  long long v40 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:4838400.0];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v9;
  uint64_t v18 = [obj countByEnumeratingWithState:&v43 objects:v59 count:16];
  unint64_t v19 = 0x1E4F28000uLL;
  if (v18)
  {
    uint64_t v20 = v18;
    uint64_t v21 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v44 != v21) {
          objc_enumerationMutation(obj);
        }
        BOOL v23 = (void *)[objc_alloc(MEMORY[0x1E4F1C038]) initWithEntity:*(void *)(*((void *)&v43 + 1) + 8 * j)];
        __int16 v24 = [*(id *)(v19 + 3936) predicateWithFormat:@"%K == nil || %K == %@", @"expirationDate", @"expirationDate", v41];
        [v23 setPredicate:v24];

        v57 = @"expirationDate";
        v58 = v40;
        id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        [v23 setPropertiesToUpdate:v25];

        [v23 setResultType:1];
        uint64_t v26 = *(void **)(a1 + 32);
        id v42 = 0;
        SEL v27 = [v26 executeRequest:v23 error:&v42];
        id v28 = v42;
        if (v28)
        {
          id v29 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            uint64_t v34 = NSStringFromSelector(*(SEL *)(a1 + 48));
            *(_DWORD *)buf = 138412546;
            v52 = v34;
            __int16 v53 = 2112;
            uint64_t v54 = (uint64_t)v28;
            _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "%@, encountered error updating expiration dates that were invalid, error, %@", buf, 0x16u);
          }
          [*(id *)(a1 + 40) addObject:v28];
        }
        else
        {
          uint64_t v30 = [v27 result];
          id v31 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            id v32 = NSStringFromSelector(*(SEL *)(a1 + 48));
            uint64_t v33 = [v30 count];
            *(_DWORD *)buf = 138412802;
            v52 = v32;
            __int16 v53 = 2048;
            uint64_t v54 = v33;
            __int16 v55 = 2112;
            v56 = v30;
            _os_log_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_INFO, "%@, updated %lu expiration dates, object IDs, %@", buf, 0x20u);

            unint64_t v19 = 0x1E4F28000;
          }
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v43 objects:v59 count:16];
    }
    while (v20);
  }
}

- (void).cxx_destruct
{
}

@end