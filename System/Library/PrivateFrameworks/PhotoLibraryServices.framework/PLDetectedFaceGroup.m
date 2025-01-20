@interface PLDetectedFaceGroup
+ (id)detectedFaceGroupWithUUID:(id)a3 inManagedObjectContext:(id)a4;
+ (id)entityName;
+ (void)batchFetchFaceGroupByFaceUUIDWithFaceUUIDs:(id)a3 predicate:(id)a4 library:(id)a5 completion:(id)a6;
- (id)mutableDetectedFaces;
- (void)awakeFromInsert;
- (void)willSave;
@end

@implementation PLDetectedFaceGroup

+ (id)entityName
{
  return @"DetectedFaceGroup";
}

- (id)mutableDetectedFaces
{
  return (id)[(PLDetectedFaceGroup *)self mutableSetValueForKey:@"detectedFaces"];
}

- (void)willSave
{
  v4.receiver = self;
  v4.super_class = (Class)PLDetectedFaceGroup;
  [(PLManagedObject *)&v4 willSave];
  if (([(PLDetectedFaceGroup *)self isDeleted] & 1) == 0)
  {
    v3 = [(PLDetectedFaceGroup *)self associatedPerson];

    if (!v3) {
      +[PLPerson createAssociatedPersonForFaceGroup:self];
    }
  }
}

- (void)awakeFromInsert
{
  v4.receiver = self;
  v4.super_class = (Class)PLDetectedFaceGroup;
  [(PLDetectedFaceGroup *)&v4 awakeFromInsert];
  v3 = [MEMORY[0x1E4F8BA08] UUIDString];
  [(PLDetectedFaceGroup *)self setUuid:v3];
}

+ (void)batchFetchFaceGroupByFaceUUIDWithFaceUUIDs:(id)a3 predicate:(id)a4 library:(id)a5 completion:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __95__PLDetectedFaceGroup_batchFetchFaceGroupByFaceUUIDWithFaceUUIDs_predicate_library_completion___block_invoke;
  v14[3] = &unk_1E5874868;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  [v13 performBlockAndWait:v14];
}

void __95__PLDetectedFaceGroup_batchFetchFaceGroupByFaceUUIDWithFaceUUIDs_predicate_library_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  v3 = (void *)MEMORY[0x1E4F1C0D0];
  objc_super v4 = +[PLDetectedFace entityName];
  v5 = [v3 fetchRequestWithEntityName:v4];

  [v5 setRelationshipKeyPathsForPrefetching:&unk_1EEBF1610];
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", *(void *)(v1 + 40)];
  [v5 setPredicate:v6];
  id v30 = 0;
  v7 = [v2 executeFetchRequest:v5 error:&v30];
  id v8 = v30;
  id v9 = v8;
  if (v7)
  {
    id v22 = v8;
    v23 = v6;
    uint64_t v24 = v1;
    v25 = v2;
    id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v17 = [v16 uuid];
          v18 = [v16 faceGroup];
          v19 = v18;
          if (v17) {
            BOOL v20 = v18 == 0;
          }
          else {
            BOOL v20 = 1;
          }
          if (!v20)
          {
            v21 = [v18 uuid];

            if (v21) {
              [v10 setObject:v19 forKeyedSubscript:v17];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v13);
    }

    uint64_t v1 = v24;
    v2 = v25;
    id v9 = v22;
    v6 = v23;
  }
  else
  {
    id v10 = 0;
  }
  (*(void (**)(void))(*(void *)(v1 + 48) + 16))();
}

+ (id)detectedFaceGroupWithUUID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = (void *)MEMORY[0x19F38D3B0]();
    id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"uuid", v6];
    id v10 = (void *)MEMORY[0x1E4F1C0D0];
    id v11 = [a1 entityName];
    uint64_t v12 = [v10 fetchRequestWithEntityName:v11];

    [v12 setPredicate:v9];
    uint64_t v16 = 0;
    uint64_t v13 = [v7 executeFetchRequest:v12 error:&v16];
    uint64_t v14 = [v13 firstObject];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

@end