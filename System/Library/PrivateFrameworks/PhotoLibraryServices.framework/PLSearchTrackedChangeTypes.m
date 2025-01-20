@interface PLSearchTrackedChangeTypes
+ (BOOL)isEntityIndexedBySearch:(id)a3;
+ (id)entityNamesIndexedBySearch;
- (BOOL)shouldUpdateSearchIndexForChange:(id)a3 entityName:(id)a4 photoLibrary:(id)a5;
- (PLSearchTrackedAttributes)searchTrackedAttributes;
- (id)_changesTrackedBySearchForEntity:(id)a3;
- (id)trackedEntityNameForChange:(id)a3 photoLibrary:(id)a4;
- (id)uuidForPersistentHistoryDeletionChange:(id)a3 photoLibrary:(id)a4;
- (void)setSearchTrackedAttributes:(id)a3;
@end

@implementation PLSearchTrackedChangeTypes

+ (BOOL)isEntityIndexedBySearch:(id)a3
{
  id v4 = a3;
  v5 = [a1 entityNamesIndexedBySearch];
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (id)entityNamesIndexedBySearch
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = +[PLManagedAsset entityName];
  v10[0] = v2;
  v3 = +[PLGenericAlbum entityName];
  v10[1] = v3;
  id v4 = +[PLFetchingAlbum entityName];
  v10[2] = v4;
  v5 = +[PLManagedAlbum entityName];
  v10[3] = v5;
  char v6 = +[PLPhotosHighlight entityName];
  v10[4] = v6;
  v7 = +[PLMemory entityName];
  v10[5] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

- (void).cxx_destruct
{
}

- (void)setSearchTrackedAttributes:(id)a3
{
}

- (id)uuidForPersistentHistoryDeletionChange:(id)a3 photoLibrary:(id)a4
{
  v34[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 changeType] != 2)
  {
    v25 = 0;
    goto LABEL_15;
  }
  v8 = [(PLSearchTrackedChangeTypes *)self trackedEntityNameForChange:v6 photoLibrary:v7];
  v9 = +[PLManagedAsset entityName];
  v34[0] = v9;
  v10 = +[PLManagedAlbum entityName];
  v34[1] = v10;
  v11 = +[PLMemory entityName];
  v34[2] = v11;
  v12 = +[PLPhotosHighlight entityName];
  v34[3] = v12;
  v13 = +[PLPerson entityName];
  v34[4] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:5];

  v15 = +[PLManagedAsset entityName];
  LODWORD(v10) = [v8 isEqualToString:v15];

  if (v10) {
    goto LABEL_6;
  }
  v16 = +[PLManagedAlbum entityName];
  int v17 = [v8 isEqualToString:v16];

  if (v17) {
    goto LABEL_6;
  }
  v18 = +[PLMemory entityName];
  int v19 = [v8 isEqualToString:v18];

  if (v19
    || (+[PLPhotosHighlight entityName],
        v20 = objc_claimAutoreleasedReturnValue(),
        int v21 = [v8 isEqualToString:v20],
        v20,
        v21))
  {
LABEL_6:
    v22 = [v6 tombstone];
    v23 = v22;
    v24 = @"uuid";
LABEL_7:
    v25 = [v22 objectForKeyedSubscript:v24];

    goto LABEL_8;
  }
  v28 = +[PLPerson entityName];
  int v29 = [v8 isEqualToString:v28];

  if (v29)
  {
    v22 = [v6 tombstone];
    v23 = v22;
    v24 = @"personUUID";
    goto LABEL_7;
  }
  v25 = 0;
LABEL_8:
  if ([v14 containsObject:v8] && !v25)
  {
    v26 = PLSearchBackendLibraryChangeTrackingGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      int v30 = 138412546;
      id v31 = v6;
      __int16 v32 = 2112;
      v33 = v8;
      _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "Unable to locate UUID from deletion change: %@ for entity: %@", (uint8_t *)&v30, 0x16u);
    }
  }
LABEL_15:

  return v25;
}

- (id)trackedEntityNameForChange:(id)a3 photoLibrary:(id)a4
{
  id v5 = a4;
  id v6 = [a3 changedObjectID];
  id v7 = [v5 managedObjectContext];

  v8 = (void *)MEMORY[0x1E4F1C0A8];
  v9 = +[PLManagedAsset entityName];
  v10 = [v8 entityForName:v9 inManagedObjectContext:v7];

  v11 = (void *)MEMORY[0x1E4F1C0A8];
  v12 = +[PLMediaAnalysisAssetAttributes entityName];
  v44 = [v11 entityForName:v12 inManagedObjectContext:v7];

  v13 = (void *)MEMORY[0x1E4F1C0A8];
  v14 = +[PLManagedAlbum entityName];
  v43 = [v13 entityForName:v14 inManagedObjectContext:v7];

  v15 = (void *)MEMORY[0x1E4F1C0A8];
  v16 = +[PLMemory entityName];
  int v17 = [v15 entityForName:v16 inManagedObjectContext:v7];

  v18 = (void *)MEMORY[0x1E4F1C0A8];
  int v19 = +[PLPhotosHighlight entityName];
  v20 = [v18 entityForName:v19 inManagedObjectContext:v7];

  int v21 = (void *)MEMORY[0x1E4F1C0A8];
  v22 = +[PLPerson entityName];
  v23 = [v21 entityForName:v22 inManagedObjectContext:v7];

  v24 = (void *)MEMORY[0x1E4F1C0A8];
  v25 = +[PLDetectedFace entityName];
  v26 = [v24 entityForName:v25 inManagedObjectContext:v7];

  v27 = [v6 entity];
  LOBYTE(v13) = [v27 isEqual:v10];

  v28 = off_1E585EC88;
  if (v13) {
    goto LABEL_14;
  }
  int v29 = [v6 entity];
  char v30 = [v29 isEqual:v44];

  if (v30)
  {
    v28 = off_1E585ED08;
LABEL_14:
    v41 = [(__objc2_class *)*v28 entityName];
    goto LABEL_15;
  }
  id v31 = [v6 entity];
  char v32 = [v31 isEqual:v43];

  if (v32)
  {
    v28 = off_1E585EC78;
    goto LABEL_14;
  }
  v33 = [v6 entity];
  char v34 = [v33 isEqual:v17];

  if (v34)
  {
    v28 = off_1E585ED48;
    goto LABEL_14;
  }
  v35 = [v6 entity];
  char v36 = [v35 isEqual:v20];

  if (v36)
  {
    v28 = off_1E585F558;
    goto LABEL_14;
  }
  v37 = [v6 entity];
  char v38 = [v37 isEqual:v23];

  if (v38)
  {
    v28 = off_1E585F420;
    goto LABEL_14;
  }
  v39 = [v6 entity];
  int v40 = [v39 isEqual:v26];

  if (v40)
  {
    v28 = off_1E585E6B0;
    goto LABEL_14;
  }
  v41 = 0;
LABEL_15:

  return v41;
}

- (id)_changesTrackedBySearchForEntity:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[PLManagedAsset entityName];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    id v7 = [(PLSearchTrackedChangeTypes *)self searchTrackedAttributes];
    uint64_t v8 = [v7 assetAttributesTrackedForSearch];
LABEL_17:
    v23 = (void *)v8;

    goto LABEL_18;
  }
  v9 = +[PLMediaAnalysisAssetAttributes entityName];
  int v10 = [v4 isEqualToString:v9];

  if (v10)
  {
    id v7 = [(PLSearchTrackedChangeTypes *)self searchTrackedAttributes];
    uint64_t v8 = [v7 mediaAnalysisAssetAttributesTrackedForSearch];
    goto LABEL_17;
  }
  v11 = +[PLManagedAlbum entityName];
  int v12 = [v4 isEqualToString:v11];

  if (v12)
  {
    id v7 = [(PLSearchTrackedChangeTypes *)self searchTrackedAttributes];
    uint64_t v8 = [v7 managedAlbumAttributesTrackedForSearch];
    goto LABEL_17;
  }
  v13 = +[PLFetchingAlbum entityName];
  int v14 = [v4 isEqualToString:v13];

  if (v14)
  {
    id v7 = [(PLSearchTrackedChangeTypes *)self searchTrackedAttributes];
    uint64_t v8 = [v7 fetchingAlbumAttributesTrackedForSearch];
    goto LABEL_17;
  }
  v15 = +[PLMemory entityName];
  int v16 = [v4 isEqualToString:v15];

  if (v16)
  {
    id v7 = [(PLSearchTrackedChangeTypes *)self searchTrackedAttributes];
    uint64_t v8 = [v7 memoryAttributesTrackedForSearch];
    goto LABEL_17;
  }
  int v17 = +[PLPhotosHighlight entityName];
  int v18 = [v4 isEqualToString:v17];

  if (v18)
  {
    id v7 = [(PLSearchTrackedChangeTypes *)self searchTrackedAttributes];
    uint64_t v8 = [v7 highlightAttributesTrackedForSearch];
    goto LABEL_17;
  }
  int v19 = +[PLPerson entityName];
  int v20 = [v4 isEqualToString:v19];

  if (v20)
  {
    id v7 = [(PLSearchTrackedChangeTypes *)self searchTrackedAttributes];
    uint64_t v8 = [v7 personAttributesTrackedForSearch];
    goto LABEL_17;
  }
  int v21 = +[PLDetectedFace entityName];
  int v22 = [v4 isEqualToString:v21];

  if (v22)
  {
    id v7 = [(PLSearchTrackedChangeTypes *)self searchTrackedAttributes];
    uint64_t v8 = [v7 detectedFaceAttributesTrackedForSearch];
    goto LABEL_17;
  }
  v25 = PLSearchBackendLibraryChangeTrackingGetLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    int v26 = 138412290;
    id v27 = v4;
    _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Changes for entity: %@ are not tracked by Photos Search", (uint8_t *)&v26, 0xCu);
  }

  v23 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_18:

  return v23;
}

- (BOOL)shouldUpdateSearchIndexForChange:(id)a3 entityName:(id)a4 photoLibrary:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PLSearchTrackedChangeTypes.m", 42, @"Invalid parameter not satisfying: %@", @"change" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    id v12 = [(PLSearchTrackedChangeTypes *)self trackedEntityNameForChange:v9 photoLibrary:v11];
    goto LABEL_6;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  id v12 = v10;
LABEL_6:
  int v14 = v12;
  if (![v12 length]) {
    goto LABEL_18;
  }
  uint64_t v15 = [v9 changeType];
  if ((v15 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    BOOL v25 = 1;
    goto LABEL_24;
  }
  if (v15 == 1)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    int v16 = [v9 updatedProperties];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      id v27 = v11;
      id v28 = v10;
      uint64_t v19 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v16);
          }
          int v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          int v22 = [(PLSearchTrackedChangeTypes *)self _changesTrackedBySearchForEntity:v14];
          v23 = [v21 name];
          char v24 = [v22 containsObject:v23];

          if (v24)
          {
            BOOL v25 = 1;
            goto LABEL_21;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v18) {
          continue;
        }
        break;
      }
      BOOL v25 = 0;
LABEL_21:
      id v11 = v27;
      id v10 = v28;
    }
    else
    {
      BOOL v25 = 0;
    }
  }
  else
  {
LABEL_18:
    BOOL v25 = 0;
  }
LABEL_24:

  return v25;
}

- (PLSearchTrackedAttributes)searchTrackedAttributes
{
  searchTrackedAttributes = self->_searchTrackedAttributes;
  if (!searchTrackedAttributes)
  {
    id v4 = objc_alloc_init(PLSearchTrackedAttributes);
    id v5 = self->_searchTrackedAttributes;
    self->_searchTrackedAttributes = v4;

    searchTrackedAttributes = self->_searchTrackedAttributes;
  }
  return searchTrackedAttributes;
}

@end