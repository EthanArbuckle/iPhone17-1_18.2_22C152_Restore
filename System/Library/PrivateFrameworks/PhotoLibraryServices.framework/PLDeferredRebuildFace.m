@interface PLDeferredRebuildFace
+ (id)deferredFacesWithAssetCloudGUID:(id)a3 inManagedObjectContext:(id)a4;
+ (id)entityName;
- (id)additionalDescription;
- (id)payloadForChangedKeys:(id)a3;
- (id)payloadID;
- (id)payloadIDForTombstone:(id)a3;
- (id)payloadIDsByPayloadClassIDToDeleteOnInsert;
@end

@implementation PLDeferredRebuildFace

- (id)additionalDescription
{
  return 0;
}

- (id)payloadIDsByPayloadClassIDToDeleteOnInsert
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = [(PLDeferredRebuildFace *)self faceUUID];
  v3 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v2];

  if (v3)
  {
    v4 = +[PLDetectedFaceJournalEntryPayload payloadClassID];
    v8 = v4;
    v5 = [MEMORY[0x1E4F1CAD0] setWithObject:v3];
    v9[0] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)payloadIDForTombstone:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"uuid"];
  v4 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v3];

  return v4;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4 = a3;
  v5 = [(PLDeferredRebuildFace *)self uuid];
  if (v5) {
    v6 = [(PLManagedObjectJournalEntryPayload *)[PLDeferredRebuildFaceJournalEntryPayload alloc] initWithManagedObject:self changedKeys:v4];
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (id)payloadID
{
  v2 = [(PLDeferredRebuildFace *)self uuid];
  v3 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v2];

  return v3;
}

+ (id)deferredFacesWithAssetCloudGUID:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v9 = v5;
    id v10 = v6;
    v7 = pl_result_with_autoreleasepool();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

id __80__PLDeferredRebuildFace_deferredFacesWithAssetCloudGUID_inManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  v3 = [*(id *)(a1 + 48) entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"assetCloudGUID", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];
  [v4 setReturnsObjectsAsFaults:0];
  [v4 setFetchBatchSize:100];
  id v6 = *(void **)(a1 + 40);
  id v11 = 0;
  v7 = [v6 executeFetchRequest:v4 error:&v11];
  id v8 = v11;
  if (!v7)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      id v9 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v8;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Error fetching rebuild faces: %@", buf, 0xCu);
      }
    }
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

+ (id)entityName
{
  return @"DeferredRebuildFace";
}

@end