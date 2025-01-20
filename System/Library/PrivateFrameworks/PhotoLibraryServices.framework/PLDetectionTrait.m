@interface PLDetectionTrait
+ (BOOL)isPetDetectionType:(signed __int16)a3;
+ (id)entityName;
+ (id)fetchDetectionTraitByFaceUUIDWithFaceUUIDs:(id)a3 library:(id)a4 error:(id *)a5;
+ (id)insertIntoManagedObjectContext:(id)a3 type:(signed __int16)a4 value:(signed __int16)a5 score:(double)a6 startTime:(double)a7 duration:(double)a8;
- (id)debugLogDescription;
- (void)_touchPersonForPersistenceIfNeeded;
- (void)willSave;
@end

@implementation PLDetectionTrait

- (id)debugLogDescription
{
  v3 = +[PLDescriptionBuilder plainDescriptionBuilder];
  unsigned int v4 = [(PLDetectionTrait *)self type] - 1;
  if (v4 > 3) {
    v5 = @"unknown";
  }
  else {
    v5 = off_1E5868D90[v4];
  }
  [v3 appendName:@"type" object:v5];
  objc_msgSend(v3, "appendName:integerValue:", @"value", (int)-[PLDetectionTrait value](self, "value"));
  [(PLDetectionTrait *)self score];
  objc_msgSend(v3, "appendName:doubleValue:", @"score");
  [(PLDetectionTrait *)self startTime];
  objc_msgSend(v3, "appendName:doubleValue:", @"startTime");
  [(PLDetectionTrait *)self duration];
  objc_msgSend(v3, "appendName:doubleValue:", @"duration");
  v6 = [v3 build];

  return v6;
}

- (void)_touchPersonForPersistenceIfNeeded
{
  v3 = [(PLManagedObject *)self pathManager];
  int v4 = [v3 isDCIM];

  if (v4)
  {
    id v6 = [(PLDetectionTrait *)self detection];
    v5 = [v6 associatedPersonForFaceOrTorso:1 orTemporal:0];
    if (([v5 isInserted] & 1) == 0 && (objc_msgSend(v5, "isUpdated") & 1) == 0) {
      objc_msgSend(v5, "setEffectiveVerifiedType:", objc_msgSend(v5, "verifiedType"));
    }
  }
}

- (void)willSave
{
  v4.receiver = self;
  v4.super_class = (Class)PLDetectionTrait;
  [(PLManagedObject *)&v4 willSave];
  v3 = [(PLDetectionTrait *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    PLPlatformSearchSupported();
    [(PLDetectionTrait *)self _touchPersonForPersistenceIfNeeded];
  }
}

+ (BOOL)isPetDetectionType:(signed __int16)a3
{
  int v3 = a3;
  if (a3 == 2)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, a1, @"PLDetectionTrait.m", 127, @"Invalid parameter not satisfying: %@", @"detectionType != PLDetectionTypePet" object file lineNumber description];
  }
  return v3 > 2;
}

+ (id)fetchDetectionTraitByFaceUUIDWithFaceUUIDs:(id)a3 library:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__34909;
  v31 = __Block_byref_object_dispose__34910;
  id v32 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__34909;
  v25 = __Block_byref_object_dispose__34910;
  id v26 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__PLDetectionTrait_fetchDetectionTraitByFaceUUIDWithFaceUUIDs_library_error___block_invoke;
  v16[3] = &unk_1E5874900;
  id v9 = v8;
  id v17 = v9;
  id v10 = v7;
  id v18 = v10;
  v19 = &v21;
  v20 = &v27;
  [v9 performBlockAndWait:v16];
  uint64_t v11 = v28[5];
  id v12 = (id)v22[5];
  v13 = v12;
  if (!v11 && a5) {
    *a5 = v12;
  }

  id v14 = (id)v28[5];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v14;
}

void __77__PLDetectionTrait_fetchDetectionTraitByFaceUUIDWithFaceUUIDs_library_error___block_invoke(uint64_t a1)
{
  v35[2] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  int v3 = (void *)MEMORY[0x1E4F1C0D0];
  objc_super v4 = +[PLDetectedFace entityName];
  v5 = [v3 fetchRequestWithEntityName:v4];

  v35[0] = @"%K";
  v35[1] = @"detectionTraits";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  [v5 setRelationshipKeyPathsForPrefetching:v6];

  id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"uuid", *(void *)(a1 + 40)];
  [v5 setPredicate:v7];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v8 + 40);
  id v9 = [v2 executeFetchRequest:v5 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v23 = v7;
      v24 = v2;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v16 = [v15 uuid];
          id v17 = [v15 detectionTraits];
          id v18 = [v17 allObjects];

          if (v16) {
            BOOL v19 = v18 == 0;
          }
          else {
            BOOL v19 = 1;
          }
          if (!v19) {
            [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v18 forKeyedSubscript:v16];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v12);
      id v7 = v23;
      v2 = v24;
    }
  }
  else
  {
    v20 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 136315394;
      v31 = "+[PLDetectionTrait fetchDetectionTraitByFaceUUIDWithFaceUUIDs:library:error:]_block_invoke";
      __int16 v32 = 2112;
      uint64_t v33 = v21;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "%s: Failed to execute face fetch: %@", buf, 0x16u);
    }

    uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(id *)(v22 + 40);
    *(void *)(v22 + 40) = 0;
  }
}

+ (id)insertIntoManagedObjectContext:(id)a3 type:(signed __int16)a4 value:(signed __int16)a5 score:(double)a6 startTime:(double)a7 duration:(double)a8
{
  uint64_t v11 = a5;
  uint64_t v12 = a4;
  id v15 = a3;
  if (v15)
  {
    v16 = [a1 entityName];
    [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:v16 inManagedObjectContext:v15];
  }
  else
  {
    BOOL v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PLDetectionTrait.m", 55, @"Invalid parameter not satisfying: %@", @"moc" object file lineNumber description];

    v16 = [a1 entityName];
    PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v16, 0, 0);
  id v17 = };

  [v17 setType:v12];
  [v17 setValue:v11];
  [v17 setScore:a6];
  [v17 setStartTime:a7];
  [v17 setDuration:a8];

  return v17;
}

+ (id)entityName
{
  return @"DetectionTrait";
}

@end