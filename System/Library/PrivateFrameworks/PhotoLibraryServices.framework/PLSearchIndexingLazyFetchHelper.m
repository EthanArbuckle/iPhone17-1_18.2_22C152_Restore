@interface PLSearchIndexingLazyFetchHelper
- (PLSearchIndexingLazyFetchHelper)initWithObject:(id)a3 libraryIdentifier:(int64_t)a4 managedObjectContext:(id)a5;
- (id)albumsEligibleForSearchIndexing;
- (id)allDetectedFaces;
- (id)allSceneClassifications;
- (id)memoriesEligibleForSearchIndexing;
- (void)enumerateMomentSearchEntitiesWithBlock:(id)a3;
- (void)enumerateSearchEntityRelationsForPerson:(id)a3 block:(id)a4;
@end

@implementation PLSearchIndexingLazyFetchHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationsByPersonUUID, 0);
  objc_storeStrong((id *)&self->_momentSearchEntities, 0);
  objc_storeStrong((id *)&self->_albumsEligibleForSearchIndexing, 0);
  objc_storeStrong((id *)&self->_memoriesBeingCuratedAssets, 0);
  objc_storeStrong((id *)&self->_allSceneClasifications, 0);
  objc_storeStrong((id *)&self->_allDetectedFaces, 0);
  objc_storeStrong((id *)&self->_moc, 0);
  objc_storeStrong((id *)&self->_object, 0);
}

- (void)enumerateSearchEntityRelationsForPerson:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 fullName];
  if ([v8 length])
  {
  }
  else
  {
    v9 = [v6 displayName];
    uint64_t v10 = [v9 length];

    if (!v10) {
      goto LABEL_8;
    }
  }
  relationsByPersonUUID = self->_relationsByPersonUUID;
  v12 = [v6 personUUID];
  v13 = [(NSMutableDictionary *)relationsByPersonUUID objectForKeyedSubscript:v12];

  if (v13)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __81__PLSearchIndexingLazyFetchHelper_enumerateSearchEntityRelationsForPerson_block___block_invoke_2;
    v18[3] = &unk_1E586F290;
    id v19 = v7;
    [v13 enumerateObjectsUsingBlock:v18];
    id v14 = v19;
  }
  else
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __81__PLSearchIndexingLazyFetchHelper_enumerateSearchEntityRelationsForPerson_block___block_invoke;
    v20[3] = &unk_1E586F268;
    id v21 = v15;
    id v22 = v7;
    id v14 = v15;
    [v6 enumerateAssetSearchEntityPersonRelationsWithBlock:v20];
    v16 = self->_relationsByPersonUUID;
    v17 = [v6 personUUID];
    [(NSMutableDictionary *)v16 setObject:v14 forKeyedSubscript:v17];
  }
LABEL_8:
}

void __81__PLSearchIndexingLazyFetchHelper_enumerateSearchEntityRelationsForPerson_block___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void (**)(uint64_t, id, uint64_t))(v5 + 16);
  id v7 = a2;
  v6(v5, v7, a3);
  [*(id *)(a1 + 32) addObject:v7];
}

uint64_t __81__PLSearchIndexingLazyFetchHelper_enumerateSearchEntityRelationsForPerson_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateMomentSearchEntitiesWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  momentSearchEntities = self->_momentSearchEntities;
  if (momentSearchEntities)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __74__PLSearchIndexingLazyFetchHelper_enumerateMomentSearchEntitiesWithBlock___block_invoke_2;
    v15[3] = &unk_1E586F240;
    v16 = (PLManagedObject *)v4;
    [(NSArray *)momentSearchEntities enumerateObjectsUsingBlock:v15];
    id v7 = v16;
  }
  else
  {
    v8 = self->_object;
    v9 = [(PLManagedObject *)v8 moment];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __74__PLSearchIndexingLazyFetchHelper_enumerateMomentSearchEntitiesWithBlock___block_invoke;
    v17[3] = &unk_1E586F218;
    id v18 = v9;
    id v19 = v8;
    id v21 = v5;
    v11 = (NSArray *)v10;
    v20 = v11;
    id v7 = v8;
    id v12 = v9;
    [v12 enumerateAssetSearchEntitiesWithBlock:v17];
    v13 = self->_momentSearchEntities;
    self->_momentSearchEntities = v11;
    id v14 = v11;
  }
}

void __74__PLSearchIndexingLazyFetchHelper_enumerateMomentSearchEntitiesWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 dateIntervalForMoment:*(void *)(a1 + 32)];
  id v4 = [*(id *)(a1 + 40) dateCreated];
  char v5 = [v3 containsDate:v4];

  if ((v5 & 1) != 0 || !v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [*(id *)(a1 + 48) addObject:v6];
  }
}

uint64_t __74__PLSearchIndexingLazyFetchHelper_enumerateMomentSearchEntitiesWithBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)albumsEligibleForSearchIndexing
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  albumsEligibleForSearchIndexing = self->_albumsEligibleForSearchIndexing;
  if (!albumsEligibleForSearchIndexing)
  {
    id v4 = [(PLManagedObject *)self->_object objectID];
    char v5 = +[PLGenericAlbum fetchAlbumsForAssetObjectID:v4 libraryIdentifier:self->_libraryIdentifier managedObjectContext:self->_moc];

    if ([v5 isSuccess])
    {
      id v6 = [v5 result];
      id v7 = self->_albumsEligibleForSearchIndexing;
      self->_albumsEligibleForSearchIndexing = v6;
    }
    else
    {
      v8 = PLSearchBackendModelTranslationGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = [(PLManagedObject *)self->_object objectID];
        id v10 = [v5 error];
        int v12 = 138543618;
        v13 = v9;
        __int16 v14 = 2112;
        id v15 = v10;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Error fetching albums for asset: %{public}@, error: %@", (uint8_t *)&v12, 0x16u);
      }
    }

    albumsEligibleForSearchIndexing = self->_albumsEligibleForSearchIndexing;
  }
  return albumsEligibleForSearchIndexing;
}

- (id)memoriesEligibleForSearchIndexing
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  memoriesBeingCuratedAssets = self->_memoriesBeingCuratedAssets;
  if (!memoriesBeingCuratedAssets)
  {
    id v4 = self->_object;
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = [(PLManagedObject *)v4 memoriesBeingCuratedAssets];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v11 isEligibleForSearchIndexing]) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    int v12 = (NSArray *)[v5 copy];
    v13 = self->_memoriesBeingCuratedAssets;
    self->_memoriesBeingCuratedAssets = v12;

    memoriesBeingCuratedAssets = self->_memoriesBeingCuratedAssets;
  }
  return memoriesBeingCuratedAssets;
}

- (id)allSceneClassifications
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  allSceneClasifications = self->_allSceneClasifications;
  if (!allSceneClasifications)
  {
    id v4 = self->_object;
    id v5 = [(PLManagedObject *)v4 additionalAttributes];
    id v6 = +[PLSceneClassification fetchSceneClassificationsForAdditionalAttributes:v5 managedObjectContext:self->_moc];

    if ([v6 isSuccess])
    {
      uint64_t v7 = [v6 result];
      uint64_t v8 = self->_allSceneClasifications;
      self->_allSceneClasifications = v7;
    }
    else
    {
      uint64_t v9 = PLSearchBackendModelTranslationGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = [(PLManagedObject *)self->_object objectID];
        v11 = [v6 error];
        int v13 = 138543618;
        __int16 v14 = v10;
        __int16 v15 = 2112;
        long long v16 = v11;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Error fetching scenes for asset: %{public}@, error: %@", (uint8_t *)&v13, 0x16u);
      }
    }

    allSceneClasifications = self->_allSceneClasifications;
  }
  return allSceneClasifications;
}

- (id)allDetectedFaces
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  allDetectedFaces = self->_allDetectedFaces;
  if (!allDetectedFaces)
  {
    id v4 = [(PLManagedObject *)self->_object objectID];
    id v5 = +[PLDetectedFace fetchDetectedFacesForAssetObjectID:v4 managedObjectContext:self->_moc];

    if ([v5 isSuccess])
    {
      id v6 = [v5 result];
      uint64_t v7 = self->_allDetectedFaces;
      self->_allDetectedFaces = v6;
    }
    else
    {
      uint64_t v8 = PLSearchBackendModelTranslationGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = [(PLManagedObject *)self->_object objectID];
        id v10 = [v5 error];
        int v12 = 138543618;
        int v13 = v9;
        __int16 v14 = 2112;
        __int16 v15 = v10;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Error fetching detected faces for asset: %{public}@, error: %@", (uint8_t *)&v12, 0x16u);
      }
    }

    allDetectedFaces = self->_allDetectedFaces;
  }
  return allDetectedFaces;
}

- (PLSearchIndexingLazyFetchHelper)initWithObject:(id)a3 libraryIdentifier:(int64_t)a4 managedObjectContext:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PLSearchIndexingLazyFetchHelper;
  v11 = [(PLSearchIndexingLazyFetchHelper *)&v16 init];
  int v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_object, a3);
    v12->_libraryIdentifier = a4;
    objc_storeStrong((id *)&v12->_moc, a5);
    int v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    relationsByPersonUUID = v12->_relationsByPersonUUID;
    v12->_relationsByPersonUUID = v13;
  }
  return v12;
}

@end