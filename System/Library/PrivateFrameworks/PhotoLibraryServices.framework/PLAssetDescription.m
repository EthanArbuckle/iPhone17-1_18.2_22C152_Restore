@interface PLAssetDescription
+ (id)entityName;
+ (id)listOfSyncedProperties;
- (BOOL)isSyncableChange;
- (id)duplicateSortPropertyNames;
- (id)duplicateSortPropertyNamesSkip;
- (id)payloadForChangedKeys:(id)a3;
- (id)payloadID;
- (void)prepareForDeletion;
- (void)willSave;
@end

@implementation PLAssetDescription

- (id)duplicateSortPropertyNamesSkip
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)duplicateSortPropertyNames
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"longDescription";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4 = a3;
  v5 = [(PLAssetDescription *)self assetAttributes];
  v6 = [v5 asset];
  if ([v6 isValidForJournalPersistence]) {
    v7 = [[PLAssetJournalEntryPayload alloc] initWithAssetDescription:self changedKeys:v4];
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (id)payloadID
{
  v2 = [(PLAssetDescription *)self assetAttributes];
  v3 = [v2 asset];
  id v4 = [v3 uuid];
  v5 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v4];

  return v5;
}

- (void)willSave
{
  v17.receiver = self;
  v17.super_class = (Class)PLAssetDescription;
  [(PLManagedObject *)&v17 willSave];
  v3 = [(PLAssetDescription *)self managedObjectContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_22;
  }
  id v4 = [(PLAssetDescription *)self assetAttributes];
  v5 = [v4 asset];

  if (([v5 isDeleted] & 1) == 0 && (-[PLAssetDescription isDeleted](self, "isDeleted") & 1) == 0)
  {
    v6 = [(PLAssetDescription *)self changedValues];
    BOOL v7 = [(PLAssetDescription *)self isSyncableChange];
    v8 = [v5 changedValues];
    v9 = [v8 objectForKeyedSubscript:@"modificationDate"];

    if (!v9 && v7)
    {
      v10 = [MEMORY[0x1E4F1C9C8] date];
      [v5 setModificationDate:v10];
    }
    if (![v5 isValidTypeForPersistence]) {
      goto LABEL_14;
    }
    v11 = [v5 persistedFileSystemAttributesFileURL];
    if (v11)
    {
      v12 = [v6 objectForKeyedSubscript:@"longDescription"];
      if (v12)
      {

LABEL_12:
        v13 = (void *)MEMORY[0x1E4F8B900];
        v14 = [(PLAssetDescription *)self longDescription];
        [v13 persistString:v14 forKey:*MEMORY[0x1E4F8C378] fileURL:v11];

        goto LABEL_13;
      }
      if ([(PLAssetDescription *)self isInserted]) {
        goto LABEL_12;
      }
    }
LABEL_13:

LABEL_14:
    if (+[PLDuplicateAsset isDuplicateAssetSortChangedObject:self])
    {
      v15 = [v5 duplicateAlbum];
      [v15 sortAssets];
    }
  }
  if (PLPlatformSearchSupported())
  {
    v16 = [v3 delayedSaveActions];
    [v16 recordAssetDescriptionForSearchIndexUpdate:self];
  }
  if (([(PLAssetDescription *)self isDeleted] & 1) == 0) {
    +[PLDelayedSearchIndexUpdates recordAssetDescriptionIfNeeded:self];
  }

LABEL_22:
}

- (void)prepareForDeletion
{
  v7.receiver = self;
  v7.super_class = (Class)PLAssetDescription;
  [(PLManagedObject *)&v7 prepareForDeletion];
  v3 = [(PLAssetDescription *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    +[PLDelayedSearchIndexUpdates recordAssetDescriptionIfNeeded:self];
    id v4 = [(PLAssetDescription *)self assetAttributes];
    v5 = [v4 asset];

    if (([v5 isDeleted] & 1) == 0 && objc_msgSend(v5, "isValidTypeForPersistence"))
    {
      v6 = [v5 persistedFileSystemAttributesFileURL];
      if (v6) {
        [MEMORY[0x1E4F8B900] persistString:0 forKey:*MEMORY[0x1E4F8C378] fileURL:v6];
      }
    }
  }
}

- (BOOL)isSyncableChange
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(PLAssetDescription *)self assetAttributes];
  id v4 = [v3 asset];

  if ([v4 savedAssetTypeIsSupportedForUpload])
  {
    v5 = [(PLAssetDescription *)self changedValues];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v6 = +[PLAssetDescription listOfSyncedProperties];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = [v5 objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * i)];

          if (v10)
          {
            LOBYTE(v7) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (id)listOfSyncedProperties
{
  pl_dispatch_once();
  v2 = (void *)listOfSyncedProperties_result_110466;
  return v2;
}

void __44__PLAssetDescription_listOfSyncedProperties__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = @"longDescription";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)listOfSyncedProperties_result_110466;
  listOfSyncedProperties_result_110466 = v0;
}

+ (id)entityName
{
  return @"AssetDescription";
}

@end