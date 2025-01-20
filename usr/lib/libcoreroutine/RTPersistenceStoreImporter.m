@interface RTPersistenceStoreImporter
- (BOOL)enumerateRelationshipsInEntityDescription:(id)a3 sourceObject:(id)a4 error:(id *)a5;
- (BOOL)establishEntityRelationships:(id *)a3;
- (BOOL)import:(id *)a3;
- (BOOL)importEntityRowsAndAttributes:(id *)a3;
- (BOOL)updateRelationshipWithEntity:(id)a3 relationshipDescription:(id)a4 relationshipIdentifiers:(id)a5 context:(id)a6 error:(id *)a7;
- (NSManagedObjectModel)model;
- (NSPersistentStoreCoordinator)destinationCoordinator;
- (NSPersistentStoreCoordinator)sourceCoordinator;
- (NSString)configuration;
- (RTPersistenceStore)destinationStore;
- (RTPersistenceStore)sourceStore;
- (RTPersistenceStoreImporter)init;
- (RTPersistenceStoreImporter)initWithManagedObjectModel:(id)a3 configuration:(id)a4 sourceStore:(id)a5 sourceCoordinator:(id)a6 destinationStore:(id)a7 destinationCoordinator:(id)a8;
- (id)entityDescriptions;
- (id)fetchDestinationObjectWithEntityDescription:(id)a3 predicate:(id)a4 context:(id)a5 error:(id *)a6;
- (id)managedObjectContextTargetingType:(int64_t)a3;
- (void)setConfiguration:(id)a3;
- (void)setDestinationCoordinator:(id)a3;
- (void)setDestinationStore:(id)a3;
- (void)setModel:(id)a3;
- (void)setSourceCoordinator:(id)a3;
- (void)setSourceStore:(id)a3;
@end

@implementation RTPersistenceStoreImporter

- (RTPersistenceStoreImporter)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithManagedObjectModel_configuration_sourceStore_sourceCoordinator_destinationStore_destinationCoordinator_);
}

- (RTPersistenceStoreImporter)initWithManagedObjectModel:(id)a3 configuration:(id)a4 sourceStore:(id)a5 sourceCoordinator:(id)a6 destinationStore:(id)a7 destinationCoordinator:(id)a8
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v38 = a6;
  id v37 = a7;
  id v18 = a8;
  v36 = v18;
  if (!v15)
  {
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: managedObjectModel";
LABEL_26:
    _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, v30, buf, 2u);
    goto LABEL_27;
  }
  if (!v17)
  {
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: sourceStore";
    goto LABEL_26;
  }
  if (!v38)
  {
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: sourceCoordinator";
    goto LABEL_26;
  }
  if (!v37)
  {
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: destinationStore";
    goto LABEL_26;
  }
  if (!v18)
  {
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v30 = "Invalid parameter not satisfying: destinationCoordinator";
      goto LABEL_26;
    }
LABEL_27:

    goto LABEL_28;
  }
  v43.receiver = self;
  v43.super_class = (Class)RTPersistenceStoreImporter;
  v19 = [(RTPersistenceStoreImporter *)&v43 init];
  self = v19;
  if (!v19) {
    goto LABEL_32;
  }
  id v33 = v17;
  id v34 = v16;
  id v35 = v15;
  objc_storeStrong((id *)&v19->_model, a3);
  objc_storeStrong((id *)&self->_configuration, a4);
  objc_storeStrong((id *)&self->_sourceStore, a5);
  objc_storeStrong((id *)&self->_sourceCoordinator, a6);
  objc_storeStrong((id *)&self->_destinationStore, a7);
  objc_storeStrong((id *)&self->_destinationCoordinator, a8);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v20 = [(NSPersistentStoreCoordinator *)self->_destinationCoordinator persistentStores];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v40 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v26 = [v25 URL:v33, v34, v35, v36];
        v27 = [(RTPersistenceStore *)self->_destinationStore URL];
        int v28 = [v26 isEqual:v27];

        if (v28)
        {
          objc_storeStrong((id *)&self->_affectedStore, v25);
          goto LABEL_31;
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }
LABEL_31:

  id v16 = v34;
  id v15 = v35;
  id v17 = v33;
  if (self->_affectedStore)
  {
LABEL_32:
    self = self;
    v31 = self;
    goto LABEL_29;
  }
LABEL_28:
  v31 = 0;
LABEL_29:

  return v31;
}

- (id)managedObjectContextTargetingType:(int64_t)a3
{
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
  v6 = [NSString stringWithFormat:@"%@.%ld", @"RTPersistenceStoreImporter", a3];
  [v5 setTransactionAuthor:v6];

  if (a3)
  {
    if (a3 != 1)
    {
      __break(1u);
      return result;
    }
    uint64_t v8 = 40;
  }
  else
  {
    uint64_t v8 = 24;
  }
  [v5 setPersistentStoreCoordinator:*(Class *)((char *)&self->super.isa + v8)];

  return v5;
}

- (id)entityDescriptions
{
  NSUInteger v3 = [(NSString *)self->_configuration length];
  model = self->_model;
  if (v3) {
    [(NSManagedObjectModel *)model entitiesForConfiguration:self->_configuration];
  }
  else {
  v5 = [(NSManagedObjectModel *)model entities];
  }

  return v5;
}

- (BOOL)importEntityRowsAndAttributes:(id *)a3
{
  v5 = [(RTPersistenceStoreImporter *)self managedObjectContextTargetingType:0];
  v6 = [(RTPersistenceStoreImporter *)self managedObjectContextTargetingType:1];
  v7 = objc_opt_new();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__RTPersistenceStoreImporter_importEntityRowsAndAttributes___block_invoke;
  v17[3] = &unk_1E6B96E10;
  v17[4] = self;
  id v8 = v5;
  id v18 = v8;
  id v9 = v7;
  id v19 = v9;
  id v10 = v6;
  id v20 = v10;
  [v8 performBlockAndWait:v17];
  if ([(NSString *)self->_configuration isEqual:@"Cloud"])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__RTPersistenceStoreImporter_importEntityRowsAndAttributes___block_invoke_63;
    v14[3] = &unk_1E6B92F80;
    v14[4] = self;
    id v15 = v10;
    id v16 = v9;
    [v15 performBlockAndWait:v14];
  }
  v11 = _RTSafeArray();
  v12 = _RTMultiErrorCreate();

  if (a3) {
    *a3 = v12;
  }

  return v12 == 0;
}

void __60__RTPersistenceStoreImporter_importEntityRowsAndAttributes___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = [*(id *)(a1 + 32) entityDescriptions];
  uint64_t v26 = [obj countByEnumeratingWithState:&v34 objects:v49 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v35;
    uint64_t v23 = *MEMORY[0x1E4F28568];
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v35 != v25) {
          objc_enumerationMutation(obj);
        }
        NSUInteger v3 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v4 = [v3 managedObjectClassName];
        char v5 = [NSClassFromString(v4) conformsToProtocol:&unk_1F3495310];

        if (v5)
        {
          v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            v7 = [v3 name];
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v7;
            _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "starting import for entity type, %@", (uint8_t *)&buf, 0xCu);
          }
          id v8 = objc_alloc(MEMORY[0x1E4F1C0D0]);
          id v9 = [v3 name];
          id v10 = (void *)[v8 initWithEntityName:v9];

          [v10 setResultType:2];
          [v10 setFetchLimit:100];
          v11 = 0;
          v12 = 0;
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v43 = 0x3032000000;
          v44 = __Block_byref_object_copy__153;
          v45 = __Block_byref_object_dispose__153;
          id v46 = 0;
          do
          {
            v13 = *(void **)(a1 + 40);
            id v33 = v11;
            v14 = [v13 executeFetchRequest:v10 error:&v33];
            id v15 = v33;

            if (v15)
            {
              id v16 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                id v18 = [v3 name];
                *(_DWORD *)id v38 = 138412546;
                long long v39 = v18;
                __int16 v40 = 2112;
                id v41 = v15;
                _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "error while fetching entities with type %@, to import, %@", v38, 0x16u);
              }
              [*(id *)(a1 + 48) addObject:v15];
            }
            else if ([v14 count])
            {
              id v17 = *(void **)(a1 + 56);
              v27[0] = MEMORY[0x1E4F143A8];
              v27[1] = 3221225472;
              v27[2] = __60__RTPersistenceStoreImporter_importEntityRowsAndAttributes___block_invoke_60;
              v27[3] = &unk_1E6B991D0;
              id v28 = v14;
              v29 = v3;
              id v30 = *(id *)(a1 + 56);
              p_long long buf = &buf;
              id v31 = *(id *)(a1 + 48);
              [v17 performBlockAndWait:v27];
            }
            [v10 setFetchOffset:[v10 fetchOffset] + [v14 count]];
            v11 = v15;
            v12 = v14;
          }
          while ([v14 count]);

          _Block_object_dispose(&buf, 8);
        }
        else
        {
          uint64_t v47 = v23;
          id v19 = NSString;
          id v20 = [v3 name];
          uint64_t v21 = [v19 stringWithFormat:@"Unable to import type %@ because it doesn't conform to RTPersistenceImportable.", v20];
          v48 = v21;
          id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];

          id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceStoreImporterErrorDomain" code:1 userInfo:v10];
          uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v15;
            _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
          }
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v34 objects:v49 count:16];
    }
    while (v26);
  }
}

void __60__RTPersistenceStoreImporter_importEntityRowsAndAttributes___block_invoke_60(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v13 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "inserting %lu entities", buf, 0xCu);
  }

  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C028]) initWithEntity:*(void *)(a1 + 40) objects:*(void *)(a1 + 32)];
  char v5 = *(void **)(a1 + 48);
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v6 + 40);
  id v7 = (id)[v5 executeRequest:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [*(id *)(a1 + 40) name];
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v13 = (uint64_t)v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "error while inserting entities with type %@, to import, %@", buf, 0x16u);
    }
    [*(id *)(a1 + 56) addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  }
}

void __60__RTPersistenceStoreImporter_importEntityRowsAndAttributes___block_invoke_63(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [*(id *)(a1 + 32) entityDescriptions];
  uint64_t v2 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v16;
    uint64_t v5 = *MEMORY[0x1E4F1BD90];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C038]) initWithEntity:*(void *)(*((void *)&v15 + 1) + 8 * v6)];
        uint64_t v19 = v5;
        id v8 = [MEMORY[0x1E4F1CA98] null];
        id v20 = v8;
        id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
        [v7 setPropertiesToUpdate:v9];

        uint64_t v10 = *(void **)(a1 + 40);
        id v14 = 0;
        id v11 = (id)[v10 executeRequest:v7 error:&v14];
        id v12 = v14;
        if (v12) {
          [*(id *)(a1 + 48) addObject:v12];
        }

        ++v6;
      }
      while (v3 != v6);
      uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v3);
  }
}

- (BOOL)enumerateRelationshipsInEntityDescription:(id)a3 sourceObject:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v8)
  {
    uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: entityDescription", buf, 2u);
    }

    if (a5)
    {
      id v20 = @"entityDescription";
LABEL_14:
      _RTErrorInvalidParameterCreate((uint64_t)v20);
      BOOL v18 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_15:
    BOOL v18 = 0;
    goto LABEL_16;
  }
  if (!v9)
  {
    uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sourceManagedObject", buf, 2u);
    }

    if (a5)
    {
      id v20 = @"sourceManagedObject";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  id v11 = [(RTPersistenceStoreImporter *)self managedObjectContextTargetingType:0];
  id v12 = [(RTPersistenceStoreImporter *)self managedObjectContextTargetingType:1];
  uint64_t v13 = objc_opt_new();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __91__RTPersistenceStoreImporter_enumerateRelationshipsInEntityDescription_sourceObject_error___block_invoke;
  v23[3] = &unk_1E6B957F8;
  id v24 = v10;
  id v25 = v8;
  id v26 = v12;
  v27 = self;
  id v14 = v13;
  id v28 = v14;
  id v15 = v12;
  [v11 performBlockAndWait:v23];
  long long v16 = _RTSafeArray();
  long long v17 = _RTMultiErrorCreate();

  if (a5) {
    *a5 = v17;
  }
  BOOL v18 = v17 == 0;

LABEL_16:
  return v18;
}

void __91__RTPersistenceStoreImporter_enumerateRelationshipsInEntityDescription_sourceObject_error___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = NSStringFromSelector(sel_identifier);
  uint64_t v4 = [v2 valueForKey:v3];

  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [*(id *)(a1 + 40) name];
    *(_DWORD *)long long buf = 138412546;
    long long v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "enumerating relationships for entity type, %@, entity ID, %@", buf, 0x16u);
  }
  id v7 = [*(id *)(a1 + 40) relationshipsByName];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__RTPersistenceStoreImporter_enumerateRelationshipsInEntityDescription_sourceObject_error___block_invoke_73;
  v9[3] = &unk_1E6B9C3B8;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 48);
  id v12 = v4;
  uint64_t v13 = *(void *)(a1 + 56);
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 64);
  id v8 = v4;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];
}

void __91__RTPersistenceStoreImporter_enumerateRelationshipsInEntityDescription_sourceObject_error___block_invoke_73(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v43 = v5;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "processing relationship %@ name", buf, 0xCu);
  }

  int v8 = [v6 isToMany];
  id v9 = [*(id *)(a1 + 32) valueForKey:v5];
  id v10 = v9;
  if (v8)
  {
    if ([v9 count])
    {
      id v11 = NSString;
      id v12 = NSStringFromSelector(sel_identifier);
      id v13 = [v11 stringWithFormat:@"@distinctUnionOfObjects.%@", v12];

      id v14 = [v10 valueForKeyPath:v13];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __91__RTPersistenceStoreImporter_enumerateRelationshipsInEntityDescription_sourceObject_error___block_invoke_77;
      v34[3] = &unk_1E6B9C390;
      id v15 = *(void **)(a1 + 40);
      id v16 = *(id *)(a1 + 48);
      uint64_t v17 = *(void *)(a1 + 56);
      __int16 v18 = *(void **)(a1 + 64);
      id v35 = v16;
      uint64_t v36 = v17;
      id v37 = v18;
      id v38 = *(id *)(a1 + 40);
      id v39 = *(id *)(a1 + 72);
      id v40 = v6;
      id v41 = v14;
      id v19 = v14;
      [v15 performBlockAndWait:v34];

LABEL_8:
    }
  }
  else if (v9)
  {
    uint64_t v20 = NSStringFromSelector(sel_identifier);
    uint64_t v21 = [v10 valueForKey:v20];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __91__RTPersistenceStoreImporter_enumerateRelationshipsInEntityDescription_sourceObject_error___block_invoke_2;
    v26[3] = &unk_1E6B9C390;
    uint64_t v22 = *(void **)(a1 + 40);
    id v23 = *(id *)(a1 + 48);
    uint64_t v24 = *(void *)(a1 + 56);
    id v25 = *(void **)(a1 + 64);
    id v27 = v23;
    uint64_t v28 = v24;
    id v29 = v25;
    id v30 = *(id *)(a1 + 40);
    id v31 = *(id *)(a1 + 72);
    id v32 = v21;
    id v33 = v6;
    id v13 = v21;
    [v22 performBlockAndWait:v26];

    id v19 = v27;
    goto LABEL_8;
  }
}

void __91__RTPersistenceStoreImporter_enumerateRelationshipsInEntityDescription_sourceObject_error___block_invoke_77(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v3 = NSStringFromSelector(sel_identifier);
  uint64_t v4 = [v2 predicateWithFormat:@"%K = %@", v3, *(void *)(a1 + 32)];

  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v17 = 0;
  int v8 = [v5 fetchDestinationObjectWithEntityDescription:v6 predicate:v4 context:v7 error:&v17];
  id v9 = v17;
  if (v8)
  {
    id v10 = v9;
    if (v9)
    {
      [*(id *)(a1 + 64) addObject:v9];
    }
    else
    {
      id v11 = *(void **)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 72);
      uint64_t v13 = *(void *)(a1 + 80);
      uint64_t v14 = *(void *)(a1 + 56);
      id v16 = 0;
      [v11 updateRelationshipWithEntity:v8 relationshipDescription:v12 relationshipIdentifiers:v13 context:v14 error:&v16];
      id v15 = v16;
      if (v15) {
        [*(id *)(a1 + 64) addObject:v15];
      }
    }
  }
  else
  {
    __break(1u);
  }
}

void __91__RTPersistenceStoreImporter_enumerateRelationshipsInEntityDescription_sourceObject_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v3 = NSStringFromSelector(sel_identifier);
  uint64_t v4 = [v2 predicateWithFormat:@"%K = %@", v3, *(void *)(a1 + 32)];

  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v17 = 0;
  int v8 = [v5 fetchDestinationObjectWithEntityDescription:v6 predicate:v4 context:v7 error:&v17];
  id v9 = v17;
  if (v8)
  {
    id v10 = v9;
    if (v9)
    {
      [*(id *)(a1 + 64) addObject:v9];
    }
    else
    {
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:*(void *)(a1 + 72), 0];
      uint64_t v12 = *(void **)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 80);
      uint64_t v14 = *(void *)(a1 + 56);
      id v16 = 0;
      [v12 updateRelationshipWithEntity:v8 relationshipDescription:v13 relationshipIdentifiers:v11 context:v14 error:&v16];
      id v15 = v16;
      if (v15) {
        [*(id *)(a1 + 64) addObject:v15];
      }
    }
  }
  else
  {
    __break(1u);
  }
}

- (BOOL)updateRelationshipWithEntity:(id)a3 relationshipDescription:(id)a4 relationshipIdentifiers:(id)a5 context:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = v15;
  if (!v12)
  {
    uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: entity", buf, 2u);
    }

    if (!a7) {
      goto LABEL_25;
    }
    id v23 = @"entity";
    goto LABEL_24;
  }
  if (!v13)
  {
    uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: relationshipDescription", buf, 2u);
    }

    if (!a7) {
      goto LABEL_25;
    }
    id v23 = @"relationshipDescription";
    goto LABEL_24;
  }
  if (!v14)
  {
    id v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: relationshipIdentifiers", buf, 2u);
    }

    if (!a7) {
      goto LABEL_25;
    }
    id v23 = @"relationshipIdentifiers";
LABEL_24:
    _RTErrorInvalidParameterCreate((uint64_t)v23);
    BOOL v21 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  if (!v15)
  {
    id v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    if (a7)
    {
      id v23 = @"context";
      goto LABEL_24;
    }
LABEL_25:
    BOOL v21 = 0;
    goto LABEL_26;
  }
  id v17 = objc_opt_new();
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __121__RTPersistenceStoreImporter_updateRelationshipWithEntity_relationshipDescription_relationshipIdentifiers_context_error___block_invoke;
  v28[3] = &unk_1E6B9C3E0;
  id v29 = v13;
  id v30 = v14;
  id v31 = self;
  id v32 = v16;
  id v18 = v17;
  id v33 = v18;
  id v34 = v12;
  [v32 performBlockAndWait:v28];
  id v19 = _RTSafeArray();
  uint64_t v20 = _RTMultiErrorCreate();

  if (a7) {
    *a7 = v20;
  }
  BOOL v21 = v20 == 0;

LABEL_26:
  return v21;
}

void __121__RTPersistenceStoreImporter_updateRelationshipWithEntity_relationshipDescription_relationshipIdentifiers_context_error___block_invoke(uint64_t a1)
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1C0D0]);
  uint64_t v3 = [*(id *)(a1 + 32) destinationEntity];
  uint64_t v4 = [v3 name];
  id v5 = (void *)[v2 initWithEntityName:v4];

  uint64_t v6 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v7 = NSStringFromSelector(sel_identifier);
  int v8 = [v6 predicateWithFormat:@"%K IN (%@)", v7, *(void *)(a1 + 40)];
  [v5 setPredicate:v8];

  v51[0] = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
  [v5 setAffectedStores:v9];

  id v10 = *(void **)(a1 + 56);
  id v43 = 0;
  id v11 = [v10 executeFetchRequest:v5 error:&v43];
  id v12 = v43;
  if (v12)
  {
    [*(id *)(a1 + 64) addObject:v12];
LABEL_20:

    return;
  }
  id v37 = v5;
  if ([*(id *)(a1 + 32) isToMany])
  {
    uint64_t v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
LABEL_7:
    id v14 = (void *)v13;
    id v15 = *(void **)(a1 + 72);
    id v16 = [*(id *)(a1 + 32) name];
    id v35 = v14;
    [v15 setValue:v14 forKey:v16];

    id v17 = [*(id *)(a1 + 32) inverseRelationship];
    id v18 = [v17 name];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v36 = v11;
    id v19 = v11;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v40 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          id v25 = (void *)MEMORY[0x1E016D870]();
          id v26 = [*(id *)(a1 + 32) inverseRelationship];
          int v27 = [v26 isToMany];

          if (v27)
          {
            uint64_t v28 = [v24 valueForKey:v18];
            id v29 = (void *)[v28 mutableCopy];
            [v29 addObject:*(void *)(a1 + 72)];
            [v24 setValue:v29 forKey:v18];
          }
          else
          {
            [v24 setValue:*(void *)(a1 + 72) forKey:v18];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v21);
    }

    id v30 = *(void **)(a1 + 56);
    id v38 = 0;
    [v30 save:&v38];
    id v31 = v38;
    if (v31) {
      [*(id *)(a1 + 64) addObject:v31];
    }

    id v12 = 0;
    id v5 = v37;
    id v11 = v36;
    goto LABEL_20;
  }
  if ((unint64_t)[v11 count] < 2)
  {
    uint64_t v13 = [v11 firstObject];
    goto LABEL_7;
  }
  id v32 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    id v33 = [v5 entityName];
    id v34 = [v5 predicate];
    *(_DWORD *)long long buf = 138412802;
    id v46 = v33;
    __int16 v47 = 2112;
    v48 = v34;
    __int16 v49 = 2112;
    uint64_t v50 = v11;
    _os_log_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_INFO, "%@ %@ %@", buf, 0x20u);
  }
  __break(1u);
}

- (BOOL)establishEntityRelationships:(id *)a3
{
  id v5 = objc_opt_new();
  uint64_t v6 = [(RTPersistenceStoreImporter *)self managedObjectContextTargetingType:0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__RTPersistenceStoreImporter_establishEntityRelationships___block_invoke;
  v12[3] = &unk_1E6B92F80;
  v12[4] = self;
  id v13 = v6;
  id v7 = v5;
  id v14 = v7;
  id v8 = v6;
  [v8 performBlockAndWait:v12];
  id v9 = _RTSafeArray();
  id v10 = _RTMultiErrorCreate();

  if (a3) {
    *a3 = v10;
  }

  return v10 == 0;
}

void __59__RTPersistenceStoreImporter_establishEntityRelationships___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v2 = [*(id *)(a1 + 32) entityDescriptions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v37;
    uint64_t v29 = *MEMORY[0x1E4F28568];
    uint64_t v27 = *(void *)v37;
    uint64_t v28 = v2;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v37 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v8 = [v7 managedObjectClassName];
        char v9 = [NSClassFromString(v8) conformsToProtocol:&unk_1F3495310];

        if (v9)
        {
          id v10 = objc_alloc(MEMORY[0x1E4F1C0D0]);
          id v11 = [v7 name];
          id v12 = (void *)[v10 initWithEntityName:v11];

          [v12 setFetchBatchSize:100];
          id v13 = *(void **)(a1 + 40);
          id v35 = 0;
          id v14 = [v13 executeFetchRequest:v12 error:&v35];
          id v15 = v35;
          if (v15)
          {
            id v16 = v15;
            [*(id *)(a1 + 48) addObject:v15];
          }
          else
          {
            long long v33 = 0u;
            long long v34 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            id v14 = v14;
            uint64_t v20 = [v14 countByEnumeratingWithState:&v31 objects:v40 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v32;
              do
              {
                for (uint64_t j = 0; j != v21; ++j)
                {
                  if (*(void *)v32 != v22) {
                    objc_enumerationMutation(v14);
                  }
                  uint64_t v24 = *(void *)(*((void *)&v31 + 1) + 8 * j);
                  id v25 = *(void **)(a1 + 32);
                  id v30 = 0;
                  [v25 enumerateRelationshipsInEntityDescription:v7 sourceObject:v24 error:&v30];
                  id v26 = v30;
                  if (v26) {
                    [*(id *)(a1 + 48) addObject:v26];
                  }
                }
                uint64_t v21 = [v14 countByEnumeratingWithState:&v31 objects:v40 count:16];
              }
              while (v21);
            }

            id v16 = 0;
            uint64_t v5 = v27;
            id v2 = v28;
          }
        }
        else
        {
          uint64_t v43 = v29;
          id v17 = NSString;
          id v18 = [v7 name];
          id v19 = [v17 stringWithFormat:@"Unable to re-establish entity relationships for type %@ because it doesn't conform to RTPersistenceImportable.", v18];
          uint64_t v44 = v19;
          id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];

          id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceStoreImporterErrorDomain" code:1 userInfo:v12];
          id v14 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            long long v42 = v16;
            _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v4);
  }
}

- (id)fetchDestinationObjectWithEntityDescription:(id)a3 predicate:(id)a4 context:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v12;
  if (!v10)
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: entityDescription", buf, 2u);
    }

    if (a6)
    {
      id v16 = @"entityDescription";
LABEL_14:
      _RTErrorInvalidParameterCreate((uint64_t)v16);
      id v14 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_15:
    id v14 = 0;
    goto LABEL_16;
  }
  if (!v12)
  {
    id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    if (a6)
    {
      id v16 = @"context";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  *(void *)long long buf = 0;
  long long v33 = buf;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__153;
  long long v36 = __Block_byref_object_dispose__153;
  id v37 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__153;
  id v30 = __Block_byref_object_dispose__153;
  id v31 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __98__RTPersistenceStoreImporter_fetchDestinationObjectWithEntityDescription_predicate_context_error___block_invoke;
  v19[3] = &unk_1E6B971E8;
  id v20 = v10;
  id v21 = v11;
  uint64_t v22 = self;
  id v23 = v13;
  uint64_t v24 = &v26;
  id v25 = buf;
  [v23 performBlockAndWait:v19];
  if (a6) {
    *a6 = (id) v27[5];
  }
  id v14 = *((id *)v33 + 5);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(buf, 8);

LABEL_16:

  return v14;
}

void __98__RTPersistenceStoreImporter_fetchDestinationObjectWithEntityDescription_predicate_context_error___block_invoke(uint64_t a1)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1C0D0]);
  uint64_t v3 = [*(id *)(a1 + 32) name];
  uint64_t v4 = (void *)[v2 initWithEntityName:v3];

  [v4 setPredicate:*(void *)(a1 + 40)];
  v25[0] = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  [v4 setAffectedStores:v5];

  uint64_t v6 = *(void **)(a1 + 56);
  id v18 = 0;
  id v7 = [v6 executeFetchRequest:v4 error:&v18];
  id v8 = v18;
  id v9 = v18;
  if ([v7 count] != 1)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      uint64_t v14 = [v7 count];
      id v15 = [v4 entityName];
      id v16 = [v4 predicate];
      id v17 = [v16 predicateFormat];
      *(_DWORD *)long long buf = 134218498;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      uint64_t v22 = v15;
      __int16 v23 = 2112;
      uint64_t v24 = v17;
      _os_log_fault_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_FAULT, "%lu objects returned for fetch request. type %@, predicate %@", buf, 0x20u);
    }
    __break(1u);
  }
  if (v9) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v8);
  }
  uint64_t v10 = [v7 firstObject];
  uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (BOOL)import:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v17 = 0;
  BOOL v5 = [(RTPersistenceStoreImporter *)self importEntityRowsAndAttributes:&v17];
  id v6 = v17;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v19 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "error while importing entities, %@", buf, 0xCu);
    }
    id v10 = 0;
    goto LABEL_10;
  }
  id v16 = 0;
  BOOL v8 = [(RTPersistenceStoreImporter *)self establishEntityRelationships:&v16];
  id v9 = v16;
  id v10 = v9;
  if (!v8 || (uint64_t v11 = 0, v9))
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v19 = v10;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "error while re-establishing relationships during import, %@", buf, 0xCu);
    }
LABEL_10:

    uint64_t v11 = v10;
  }
  id v13 = _RTSafeArray();
  uint64_t v14 = _RTMultiErrorCreate();

  if (a3) {
    *a3 = v14;
  }

  return v14 == 0;
}

- (RTPersistenceStore)sourceStore
{
  return self->_sourceStore;
}

- (void)setSourceStore:(id)a3
{
}

- (NSPersistentStoreCoordinator)sourceCoordinator
{
  return self->_sourceCoordinator;
}

- (void)setSourceCoordinator:(id)a3
{
}

- (RTPersistenceStore)destinationStore
{
  return self->_destinationStore;
}

- (void)setDestinationStore:(id)a3
{
}

- (NSPersistentStoreCoordinator)destinationCoordinator
{
  return self->_destinationCoordinator;
}

- (void)setDestinationCoordinator:(id)a3
{
}

- (NSManagedObjectModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_destinationCoordinator, 0);
  objc_storeStrong((id *)&self->_destinationStore, 0);
  objc_storeStrong((id *)&self->_sourceCoordinator, 0);
  objc_storeStrong((id *)&self->_sourceStore, 0);

  objc_storeStrong((id *)&self->_affectedStore, 0);
}

@end