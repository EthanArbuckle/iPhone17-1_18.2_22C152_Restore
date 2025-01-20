@interface PSIMemoryTranslator
+ (id)_endDateForMemory:(id)a3;
+ (id)_fetchCuratedAssetsForMemory:(id)a3 sortedAscending:(BOOL)a4;
+ (id)_psiAssetForMemory:(id)a3 calendar:(id)a4;
+ (id)_startDateForMemory:(id)a3;
+ (id)psiCollectionFromMemory:(id)a3 indexingContext:(id)a4;
@end

@implementation PSIMemoryTranslator

+ (id)_fetchCuratedAssetsForMemory:(id)a3 sortedAscending:(BOOL)a4
{
  BOOL v4 = a4;
  v18[1] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F1C0D0];
  id v6 = a3;
  v7 = +[PLManagedAsset entityName];
  v8 = [v5 fetchRequestWithEntityName:v7];

  [v8 setPropertiesToFetch:&unk_1EEBF1D00];
  v9 = (void *)MEMORY[0x1E4F28F60];
  v10 = [v6 objectID];
  v11 = [v9 predicateWithFormat:@"memoriesBeingCuratedAssets CONTAINS %@", v10];
  [v8 setPredicate:v11];

  v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:v4];
  v18[0] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [v8 setSortDescriptors:v13];

  [v8 setFetchLimit:1];
  v14 = [v6 managedObjectContext];

  uint64_t v17 = 0;
  v15 = [v14 executeFetchRequest:v8 error:&v17];

  return v15;
}

+ (id)_endDateForMemory:(id)a3
{
  v3 = [a1 _fetchCuratedAssetsForMemory:a3 sortedAscending:0];
  BOOL v4 = [v3 firstObject];
  v5 = [v4 dateCreated];

  return v5;
}

+ (id)_startDateForMemory:(id)a3
{
  v3 = [a1 _fetchCuratedAssetsForMemory:a3 sortedAscending:1];
  BOOL v4 = [v3 firstObject];
  v5 = [v4 dateCreated];

  return v5;
}

+ (id)_psiAssetForMemory:(id)a3 calendar:(id)a4
{
  id v5 = a4;
  id v6 = [a3 keyAsset];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 uuid];
    v9 = [v7 dateCreated];
    if ([v8 length] || v9)
    {
      v11 = [[PSIDate alloc] initWithUniversalDate:v9 calendar:v5];
      v10 = [[PSIAsset alloc] initWithUUID:v8 creationDate:v11];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)psiCollectionFromMemory:(id)a3 indexingContext:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 uuid];
  char valid = PLIsValidUUIDString();

  if (valid)
  {
    v10 = [v7 calendar];
    v11 = [a1 _psiAssetForMemory:v6 calendar:v10];
    if (v11)
    {
      v12 = [v6 curatedAssets];
      uint64_t v13 = [v12 count];

      v14 = [v6 title];
      v15 = [v14 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1EEB2EB80];

      v16 = [a1 _startDateForMemory:v6];
      v28 = [a1 _endDateForMemory:v6];
      id v29 = v7;
      uint64_t v17 = [[PSIDate alloc] initWithUniversalDate:v16 calendar:v10];
      v18 = [[PSIDate alloc] initWithUniversalDate:v28 calendar:v10];
      v19 = [PSICollection alloc];
      [v6 uuid];
      v21 = v20 = v11;
      v22 = v19;
      id v7 = v29;
      v23 = [(PSICollection *)v22 initWithUUID:v21 startDate:v17 endDate:v18 title:v15 subtitle:0 keyAssetPrivate:v20 keyAssetShared:0 type:2 assetsCountPrivate:v13 assetsCountShared:v13 sortDate:v16];

      v11 = v20;
      [(PSIObject *)v23 addContentString:v15 category:1401 owningCategory:0];
    }
    else
    {
      v25 = PLSearchBackendModelTranslationGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = [v6 uuid];
        *(_DWORD *)buf = 138412290;
        v31 = v26;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "No key asset found for Memory. Not translating Memory: %@", buf, 0xCu);
      }
      v23 = 0;
    }
  }
  else
  {
    v10 = PLSearchBackendModelTranslationGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v24 = [v6 uuid];
      *(_DWORD *)buf = 138543362;
      v31 = v24;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Invalid Memory UUID: %{public}@. Not inserting Memory into PSI.", buf, 0xCu);
    }
    v23 = 0;
  }

  return v23;
}

@end