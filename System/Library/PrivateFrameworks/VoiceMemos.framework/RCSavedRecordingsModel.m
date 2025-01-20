@interface RCSavedRecordingsModel
+ (id)_copyFileIntoRecordingsDirectory:(id)a3;
+ (id)_dateFormatterComponentFormatting;
+ (id)recordingsModelForContext:(id)a3;
+ (id)savedRecordingsDirectory;
+ (id)standardNameForRecordingWithCreationDate:(id)a3 uniqueID:(id)a4;
+ (id)standardPathForRecordingWithCreationDate:(id)a3 uniqueID:(id)a4 fileExtension:(id)a5;
+ (id)standardURLForRecordingWithCreationDate:(id)a3 fileExtension:(id)a4;
+ (void)_determineImportabilityOfRecordingWithAudioAsset:(id)a3 preferredFormat:(unsigned int)a4 completionHandler:(id)a5;
+ (void)determineImportabilityOfRecordingWithAudioURL:(id)a3 completionHandler:(id)a4;
+ (void)importRecordingWithSourceAudioURL:(id)a3 name:(id)a4 date:(id)a5 completionHandler:(id)a6;
+ (void)importRecordingWithSourceAudioURL:(id)a3 name:(id)a4 date:(id)a5 userInfo:(id)a6 completionHandler:(id)a7;
- (BOOL)__saveManagedObjectContext:(id *)a3;
- (BOOL)_mergeDuplicateNameFoldersWithName:(id)a3;
- (BOOL)_mergeDuplicateUUIDFolders:(id)a3;
- (BOOL)encryptedFieldsMigrationExists;
- (BOOL)exportToCloudForStore:(id)a3 completionHandler:(id)a4;
- (BOOL)fetchExportProgress:(id)a3 forStore:(id)a4 completionHandler:(id)a5;
- (BOOL)fetchObjectsFromCloud:(id)a3 entityToAttributesToFetch:(id)a4 forStore:(id)a5 completionHandler:(id)a6;
- (BOOL)importFromCloudForStore:(id)a3 completionHandler:(id)a4;
- (BOOL)resetCloudForStore:(id)a3 completionHandler:(id)a4;
- (BOOL)saveIfNecessary:(id *)a3;
- (NSArray)allRecordings;
- (NSSet)audioProperties;
- (RCSavedRecordingsModel)init;
- (RCSavedRecordingsModel)initWithContext:(id)a3;
- (id)_allTitles;
- (id)_foldersWithUUID:(id)a3;
- (id)_recordingsFetchRequestForFolder:(id)a3;
- (id)_recordingsForFolderUUID:(id)a3;
- (id)_recordingsWithFetchRequest:(id)a3;
- (id)_recordingsWithFetchRequest:(id)a3 error:(id *)a4;
- (id)_recordingsWithUniqueID:(id)a3;
- (id)_transactionHistorySinceToken:(id)a3 forStore:(id)a4;
- (id)_transactionsAndChangesForObjectIDs:(id)a3;
- (id)_transactionsAndChangesWithPredicate:(id)a3;
- (id)_transactionsAndChangesWithRequest:(id)a3;
- (id)_userDefinedFolders:(id)a3 searchOption:(int)a4;
- (id)_userFolderFetchRequest;
- (id)cacheDeletedRecordings;
- (id)context;
- (id)createEncryptedFieldsMigration:(int)a3;
- (id)duplicateRecording:(id)a3 copyingResources:(BOOL)a4 creationDate:(id)a5 error:(id *)a6;
- (id)duplicateRecording:(id)a3 error:(id *)a4;
- (id)encryptedFieldMigrations;
- (id)enumerateChangeHistorySinceToken:(id)a3 forStore:(id)a4 usingBlock:(id)a5;
- (id)existingFolderWithName:(id)a3;
- (id)existingFolderWithUUID:(id)a3;
- (id)existingFoldersWithName:(id)a3 searchOption:(int)a4;
- (id)existingRecordingsWithName:(id)a3 searchOption:(int)a4 error:(id *)a5;
- (id)folderWithName:(id)a3;
- (id)insertRecordingWithAudioFile:(id)a3 duration:(double)a4 date:(id)a5;
- (id)insertRecordingWithAudioFile:(id)a3 duration:(double)a4 date:(id)a5 customLabelBase:(id)a6;
- (id)insertRecordingWithAudioFile:(id)a3 duration:(double)a4 date:(id)a5 customTitleBase:(id)a6 uniqueID:(id)a7;
- (id)nextRecordingDefaultLabelWithCustomTitleBase:(id)a3;
- (id)objectIDsForRecordingsNeedingAssetExport;
- (id)recordingWithFileName:(id)a3;
- (id)recordingWithID:(id)a3;
- (id)recordingWithURIRepresentation:(id)a3;
- (id)recordingWithUniqueID:(id)a3;
- (id)recordingsWithNilAudioFutures;
- (id)recordingsWithNilEncryptedTitleOrCustomLabel;
- (id)recordingsWithPredicate:(id)a3;
- (id)recordingsWithTitle:(id)a3;
- (id)recordingsWithUniqueIDs:(id)a3;
- (id)transactionForToken:(id)a3 forStore:(id)a4;
- (id)transactionsAndChangesForObjectID:(id)a3;
- (id)unencryptedTitleDateFormatter;
- (id)unencryptedTitleDateStringFromDate:(id)a3;
- (id)userFolders;
- (id)userFoldersFetchedResultsController;
- (id)visibleRecordingsFetchedResultsController;
- (int64_t)isSavingDisabledCount;
- (unint64_t)_countForFetchRequest:(id)a3;
- (unint64_t)fetchPlayableRecordingsCount;
- (unint64_t)playableCountForFolder:(id)a3;
- (unint64_t)userFolderCount;
- (void)_copyPropertiesFromOriginalRecording:(id)a3 newRecording:(id)a4;
- (void)_enumerateFetchedRecordingTitles:(id)a3;
- (void)_importImportableRecordingWithAudioAsset:(id)a3 name:(id)a4 date:(id)a5 uniqueID:(id)a6 presetName:(id)a7 outputFileType:(id)a8 completionHandler:(id)a9;
- (void)_importRecordingWithSourceAudioURL:(id)a3 name:(id)a4 date:(id)a5 uniqueID:(id)a6 preferredFormat:(unsigned int)a7 completionHandler:(id)a8;
- (void)_insertRecordingWithImportableAudioURL:(id)a3 name:(id)a4 date:(id)a5 uniqueID:(id)a6 completionHandler:(id)a7;
- (void)_mergeFolders:(id)a3 intoTargetFolder:(id)a4;
- (void)_rerankFolders;
- (void)_synchronizeRecordingsMetadata;
- (void)addRecording:(id)a3 toFolder:(id)a4;
- (void)addRecordings:(id)a3 toFolder:(id)a4;
- (void)deleteFolder:(id)a3;
- (void)deleteRecording:(id)a3;
- (void)deleteRecordings:(id)a3;
- (void)enumerateExistingRecordingsWithBlock:(id)a3;
- (void)enumerateExistingRecordingsWithProperties:(id)a3 sortDescriptors:(id)a4 block:(id)a5;
- (void)eraseAllDeleted;
- (void)eraseRecording:(id)a3;
- (void)eraseRecordings:(id)a3;
- (void)eraseRecordingsDeletedBeforeDate:(id)a3;
- (void)importRecordingWithSourceAudioURL:(id)a3 name:(id)a4 date:(id)a5 xpcConnection:(id)a6 userInfo:(id)a7 completionHandler:(id)a8;
- (void)mergeRecordings:(id)a3;
- (void)performBlock:(id)a3;
- (void)performBlockAndWait:(id)a3;
- (void)performWithSavingDisabled:(id)a3;
- (void)reconcileChangedFolder:(id)a3 change:(id)a4;
- (void)removeRecording:(id)a3 fromFolder:(id)a4;
- (void)renameFolder:(id)a3 toName:(id)a4;
- (void)restoreDeletedRecording:(id)a3;
- (void)restoreDeletedRecordings:(id)a3;
- (void)saveIfNecessary;
- (void)setEnhanced:(BOOL)a3 ofRecording:(id)a4;
- (void)setFavorite:(BOOL)a3 ofRecording:(id)a4;
- (void)setIsSavingDisabledCount:(int64_t)a3;
- (void)setTitle:(id)a3 ofRecording:(id)a4;
@end

@implementation RCSavedRecordingsModel

+ (id)savedRecordingsDirectory
{
  v2 = RCRecordingsDirectoryURL();
  v3 = [v2 path];

  return v3;
}

- (id)context
{
  return self->_context;
}

void __41__RCSavedRecordingsModel_audioProperties__block_invoke(uint64_t a1)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(*(void *)(a1 + 32) + 8) persistentStoreCoordinator];
  v2 = [v1 managedObjectModel];

  v3 = [v2 entitiesByName];
  v4 = [v3 objectForKeyedSubscript:@"CloudRecording"];
  v5 = [v4 propertiesByName];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  v7 = [v5 objectForKeyedSubscript:@"audioDigest"];
  v12[0] = v7;
  v8 = [v5 objectForKeyedSubscript:@"localDuration"];
  v12[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  uint64_t v10 = [v6 setWithArray:v9];
  v11 = (void *)audioProperties_audioProperties;
  audioProperties_audioProperties = v10;
}

void __90__RCSavedRecordingsModel_enumerateExistingRecordingsWithProperties_sortDescriptors_block___block_invoke(void *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"CloudRecording"];
  v3 = v2;
  if (a1[4])
  {
    objc_msgSend(v2, "setPropertiesToFetch:");
  }
  else
  {
    v4 = +[RCQueryManager defaultFetchedProperties];
    [v3 setPropertiesToFetch:v4];
  }
  if (a1[5])
  {
    objc_msgSend(v3, "setSortDescriptors:");
  }
  else
  {
    v5 = +[RCQueryManager defaultSortDescriptors];
    [v3 setSortDescriptors:v5];
  }
  v6 = *(void **)(a1[6] + 8);
  id v23 = 0;
  v7 = [v6 executeFetchRequest:v3 error:&v23];
  id v8 = v23;
  if (v7)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (!v10) {
      goto LABEL_24;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    while (1)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
        if (a1[4])
        {
          id v15 = v14;
          if (!v15) {
            goto LABEL_16;
          }
LABEL_15:
          (*(void (**)(void))(a1[7] + 16))();
          goto LABEL_16;
        }
        v16 = *(void **)(a1[6] + 8);
        v17 = objc_msgSend(v14, "objectID", (void)v19);
        id v15 = [v16 existingObjectWithID:v17 error:0];

        if (v15) {
          goto LABEL_15;
        }
LABEL_16:

        ++v13;
      }
      while (v11 != v13);
      uint64_t v18 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      uint64_t v11 = v18;
      if (!v18) {
        goto LABEL_24;
      }
    }
  }
  v9 = OSLogForCategory(@"Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    __90__RCSavedRecordingsModel_enumerateExistingRecordingsWithProperties_sortDescriptors_block___block_invoke_cold_1();
  }
LABEL_24:
}

void __42__RCSavedRecordingsModel_initWithContext___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) userInfo];
  [v2 setObject:v1 forKeyedSubscript:@"RCAssociatedRecordingsModel"];
}

- (void)performBlockAndWait:(id)a3
{
}

- (void)performBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unencryptedTitleDateFormatter, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)enumerateExistingRecordingsWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = +[RCQueryManager defaultFetchedProperties];
  [(RCSavedRecordingsModel *)self enumerateExistingRecordingsWithProperties:v5 sortDescriptors:0 block:v4];
}

- (void)enumerateExistingRecordingsWithProperties:(id)a3 sortDescriptors:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  context = self->_context;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__RCSavedRecordingsModel_enumerateExistingRecordingsWithProperties_sortDescriptors_block___block_invoke;
  v15[3] = &unk_1E6496440;
  id v16 = v8;
  id v17 = v9;
  uint64_t v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(NSManagedObjectContext *)context performBlockAndWait:v15];
}

- (void)eraseRecordingsDeletedBeforeDate:(id)a3
{
  id v4 = a3;
  context = self->_context;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__RCSavedRecordingsModel_eraseRecordingsDeletedBeforeDate___block_invoke;
  v7[3] = &unk_1E6496350;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(NSManagedObjectContext *)context performBlockAndWait:v7];
}

- (RCSavedRecordingsModel)initWithContext:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RCSavedRecordingsModel;
  id v6 = [(RCSavedRecordingsModel *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    id v8 = +[RCWeakReferenceWrapper withReference:v7];
    context = v7->_context;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __42__RCSavedRecordingsModel_initWithContext___block_invoke;
    void v12[3] = &unk_1E6496350;
    id v13 = v7;
    id v14 = v8;
    id v10 = v8;
    [(NSManagedObjectContext *)context performBlockAndWait:v12];
  }
  return v7;
}

- (id)recordingWithUniqueID:(id)a3
{
  v3 = [(RCSavedRecordingsModel *)self _recordingsWithUniqueID:a3];
  id v4 = [v3 firstObject];

  return v4;
}

- (id)_recordingsWithUniqueID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[RCQueryManager recordingsWithUniqueIDFetchRequest:v4];
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = __Block_byref_object_copy__1;
    id v17 = __Block_byref_object_dispose__1;
    id v18 = 0;
    context = self->_context;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__RCSavedRecordingsModel__recordingsWithUniqueID___block_invoke;
    v10[3] = &unk_1E64963C8;
    id v12 = &v13;
    v10[4] = self;
    id v7 = v5;
    id v11 = v7;
    [(NSManagedObjectContext *)context performBlockAndWait:v10];
    id v8 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __59__RCSavedRecordingsModel_eraseRecordingsDeletedBeforeDate___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = +[RCQueryManager evictionDateBeforeFetchRequest:*(void *)(a1 + 32)];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = [*(id *)(*(void *)(a1 + 40) + 8) executeFetchRequest:v2 error:0];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = [v8 url];
        +[RCComposition deleteFromFilesystem:v9];

        [*(id *)(*(void *)(a1 + 40) + 8) deleteObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  id v10 = *(void **)(a1 + 40);
  id v14 = 0;
  char v11 = [v10 saveIfNecessary:&v14];
  id v12 = v14;
  if ((v11 & 1) == 0)
  {
    uint64_t v13 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __59__RCSavedRecordingsModel_eraseRecordingsDeletedBeforeDate___block_invoke_cold_1();
    }
  }
}

- (BOOL)saveIfNecessary:(id *)a3
{
  if (self->_isSavingDisabledCount || ![(NSManagedObjectContext *)self->_context hasChanges]) {
    return 0;
  }
  return [(RCSavedRecordingsModel *)self __saveManagedObjectContext:a3];
}

- (NSSet)audioProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__RCSavedRecordingsModel_audioProperties__block_invoke;
  block[3] = &unk_1E64963A0;
  block[4] = self;
  if (audioProperties_onceToken != -1) {
    dispatch_once(&audioProperties_onceToken, block);
  }
  return (NSSet *)(id)audioProperties_audioProperties;
}

- (RCSavedRecordingsModel)init
{
  return 0;
}

+ (id)recordingsModelForContext:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__1;
  id v14 = __Block_byref_object_dispose__1;
  id v15 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__RCSavedRecordingsModel_recordingsModelForContext___block_invoke;
  v7[3] = &unk_1E6496378;
  id v4 = v3;
  id v8 = v4;
  id v9 = &v10;
  [v4 performBlockAndWait:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __52__RCSavedRecordingsModel_recordingsModelForContext___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v6 = [v2 objectForKeyedSubscript:@"RCAssociatedRecordingsModel"];

  uint64_t v3 = [v6 weakReference];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (id)_dateFormatterComponentFormatting
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
  [v2 setLocale:v3];

  return v2;
}

+ (id)standardNameForRecordingWithCreationDate:(id)a3 uniqueID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _dateFormatterComponentFormatting];
  [v8 setDateFormat:@"YMMdd HHmmss"];
  id v9 = [v8 stringFromDate:v7];

  uint64_t v10 = [v6 substringToIndex:8];

  char v11 = [NSString stringWithFormat:@"%@-%@", v9, v10];

  return v11;
}

+ (id)standardPathForRecordingWithCreationDate:(id)a3 uniqueID:(id)a4 fileExtension:(id)a5
{
  id v8 = a5;
  id v9 = [a1 standardNameForRecordingWithCreationDate:a3 uniqueID:a4];
  uint64_t v10 = +[RCSavedRecordingsModel savedRecordingsDirectory];
  char v11 = [NSString stringWithFormat:@"%@.%@", v9, v8];

  uint64_t v12 = [v10 stringByAppendingPathComponent:v11];

  return v12;
}

+ (id)standardURLForRecordingWithCreationDate:(id)a3 fileExtension:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _dateFormatterComponentFormatting];
  [v8 setDateFormat:@"YMMdd HHmmss"];
  id v9 = [v8 stringFromDate:v7];

  uint64_t v10 = +[RCSavedRecordingsModel savedRecordingsDirectory];
  char v11 = [NSString stringWithFormat:@"%@.%@", v9, v6];

  uint64_t v12 = [v10 stringByAppendingPathComponent:v11];

  uint64_t v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];

  return v13;
}

- (id)unencryptedTitleDateFormatter
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__RCSavedRecordingsModel_unencryptedTitleDateFormatter__block_invoke;
  v4[3] = &unk_1E64963A0;
  v4[4] = self;
  [(RCSavedRecordingsModel *)self performBlockAndWait:v4];
  return self->_unencryptedTitleDateFormatter;
}

uint64_t __55__RCSavedRecordingsModel_unencryptedTitleDateFormatter__block_invoke(uint64_t result)
{
  if (!*(void *)(*(void *)(result + 32) + 16))
  {
    *(void *)(*(void *)(result + 32) + 16) = objc_alloc_init(MEMORY[0x1E4F28D48]);
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (id)unencryptedTitleDateStringFromDate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__1;
  long long v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__RCSavedRecordingsModel_unencryptedTitleDateStringFromDate___block_invoke;
    v9[3] = &unk_1E64963C8;
    char v11 = &v12;
    v9[4] = self;
    id v10 = v4;
    [(RCSavedRecordingsModel *)self performBlockAndWait:v9];

    id v6 = (void *)v13[5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __61__RCSavedRecordingsModel_unencryptedTitleDateStringFromDate___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) unencryptedTitleDateFormatter];
  uint64_t v2 = [v5 stringFromDate:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)allRecordings
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__1;
  id v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  context = self->_context;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__RCSavedRecordingsModel_allRecordings__block_invoke;
  v5[3] = &unk_1E64963F0;
  v5[4] = self;
  v5[5] = &v6;
  [(NSManagedObjectContext *)context performBlockAndWait:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __39__RCSavedRecordingsModel_allRecordings__block_invoke(uint64_t a1)
{
  id v7 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"CloudRecording"];
  uint64_t v2 = +[RCQueryManager defaultFetchedProperties];
  [v7 setPropertiesToFetch:v2];

  id v3 = +[RCQueryManager defaultSortDescriptors];
  [v7 setSortDescriptors:v3];

  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) executeFetchRequest:v7 error:0];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)recordingWithID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v6 = 0;
    goto LABEL_12;
  }
  context = self->_context;
  id v11 = 0;
  uint64_t v6 = [(NSManagedObjectContext *)context existingObjectWithID:v4 error:&v11];
  id v7 = v11;
  uint64_t v8 = v7;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_11;
    }
  }
  else if (v7)
  {
    id v9 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[RCSavedRecordingsModel recordingWithID:]();
    }
  }
  uint64_t v6 = 0;
LABEL_11:

LABEL_12:
  return v6;
}

- (id)recordingWithURIRepresentation:(id)a3
{
  if (a3)
  {
    context = self->_context;
    id v5 = a3;
    uint64_t v6 = [(NSManagedObjectContext *)context persistentStoreCoordinator];
    id v7 = [v6 managedObjectIDForURIRepresentation:v5];

    if (v7)
    {
      uint64_t v8 = [(RCSavedRecordingsModel *)self recordingWithID:v7];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)recordingWithFileName:(id)a3
{
  id v4 = a3;
  id v5 = +[RCQueryManager recordingsForFileNameFetchRequest:v4];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__1;
  id v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  context = self->_context;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__RCSavedRecordingsModel_recordingWithFileName___block_invoke;
  v10[3] = &unk_1E64963C8;
  uint64_t v12 = &v13;
  v10[4] = self;
  id v7 = v5;
  id v11 = v7;
  [(NSManagedObjectContext *)context performBlockAndWait:v10];
  uint64_t v8 = [(id)v14[5] lastObject];

  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __48__RCSavedRecordingsModel_recordingWithFileName___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 8) executeFetchRequest:a1[5] error:0];
  return MEMORY[0x1F41817F8]();
}

uint64_t __50__RCSavedRecordingsModel__recordingsWithUniqueID___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 8) executeFetchRequest:a1[5] error:0];
  return MEMORY[0x1F41817F8]();
}

- (id)recordingsWithUniqueIDs:(id)a3
{
  id v4 = a3;
  id v5 = +[RCQueryManager recordingsWithUniqueIDsFetchRequest:v4];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__1;
  id v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  context = self->_context;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__RCSavedRecordingsModel_recordingsWithUniqueIDs___block_invoke;
  v10[3] = &unk_1E64963C8;
  uint64_t v12 = &v13;
  v10[4] = self;
  id v7 = v5;
  id v11 = v7;
  [(NSManagedObjectContext *)context performBlockAndWait:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __50__RCSavedRecordingsModel_recordingsWithUniqueIDs___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 8) executeFetchRequest:a1[5] error:0];
  return MEMORY[0x1F41817F8]();
}

- (id)cacheDeletedRecordings
{
  id v3 = +[RCQueryManager cacheDeletedOnWatchPredicate];
  id v4 = [(RCSavedRecordingsModel *)self recordingsWithPredicate:v3];

  return v4;
}

- (id)recordingsWithPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__1;
  id v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  context = self->_context;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__RCSavedRecordingsModel_recordingsWithPredicate___block_invoke;
  v9[3] = &unk_1E6496418;
  id v6 = v4;
  id v11 = self;
  uint64_t v12 = &v13;
  id v10 = v6;
  [(NSManagedObjectContext *)context performBlockAndWait:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __50__RCSavedRecordingsModel_recordingsWithPredicate___block_invoke(void *a1)
{
  id v6 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"CloudRecording"];
  [v6 setPredicate:a1[4]];
  uint64_t v2 = +[RCQueryManager defaultFetchedProperties];
  [v6 setPropertiesToFetch:v2];

  [v6 setFetchBatchSize:100];
  uint64_t v3 = [*(id *)(a1[5] + 8) executeFetchRequest:v6 error:0];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_allTitles
{
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__RCSavedRecordingsModel__allTitles__block_invoke;
  v6[3] = &unk_1E6496468;
  id v4 = v3;
  id v7 = v4;
  [(RCSavedRecordingsModel *)self _enumerateFetchedRecordingTitles:v6];

  return v4;
}

void __36__RCSavedRecordingsModel__allTitles__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = [a2 deletionDate];

  id v6 = v7;
  if (v7 && !v5)
  {
    [*(id *)(a1 + 32) addObject:v7];
    id v6 = v7;
  }
}

- (void)_enumerateFetchedRecordingTitles:(id)a3
{
  id v4 = a3;
  id v5 = +[RCQueryManager allCustomLabelsFetchRequest];
  context = self->_context;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__RCSavedRecordingsModel__enumerateFetchedRecordingTitles___block_invoke;
  v9[3] = &unk_1E6496490;
  void v9[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [(NSManagedObjectContext *)context performBlockAndWait:v9];
}

void __59__RCSavedRecordingsModel__enumerateFetchedRecordingTitles___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1[4] + 8) executeFetchRequest:a1[5] error:0];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = [*(id *)(*((void *)&v7 + 1) + 8 * i) title];
        if (v6)
        {
          (*(void (**)(void))(a1[6] + 16))();
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (id)_transactionHistorySinceToken:(id)a3 forStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__1;
  long long v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  context = self->_context;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__RCSavedRecordingsModel__transactionHistorySinceToken_forStore___block_invoke;
  v13[3] = &unk_1E64964B8;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  long long v16 = self;
  id v17 = &v18;
  id v15 = v10;
  [(NSManagedObjectContext *)context performBlockAndWait:v13];
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __65__RCSavedRecordingsModel__transactionHistorySinceToken_forStore___block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F1C160] fetchHistoryAfterToken:*(void *)(a1 + 32)];
  [v5 setResultType:5];
  objc_msgSend(v5, "rc_setAffectedStore:", *(void *)(a1 + 40));
  [v5 setFetchBatchSize:100];
  uint64_t v2 = [*(id *)(a1 + 48) _transactionsAndChangesWithRequest:v5];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)enumerateChangeHistorySinceToken:(id)a3 forStore:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  id v27 = v8;
  context = self->_context;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__RCSavedRecordingsModel_enumerateChangeHistorySinceToken_forStore_usingBlock___block_invoke;
  v17[3] = &unk_1E64964E0;
  v17[4] = self;
  id v12 = v27;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  id v14 = v10;
  id v20 = v14;
  long long v21 = &v22;
  [(NSManagedObjectContext *)context performBlockAndWait:v17];
  id v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

void __79__RCSavedRecordingsModel_enumerateChangeHistorySinceToken_forStore_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _transactionHistorySinceToken:*(void *)(a1 + 40) forStore:*(void *)(a1 + 48)];
  uint64_t v3 = v2;
  if (v2 && [v2 count])
  {
    char v17 = 0;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
LABEL_5:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56));
        uint64_t v10 = objc_msgSend(v9, "token", (void)v13);
        uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
        id v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;

        if (v17) {
          break;
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
          if (v6) {
            goto LABEL_5;
          }
          break;
        }
      }
    }
  }
}

- (id)transactionForToken:(id)a3 forStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__1;
  uint64_t v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  context = self->_context;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__RCSavedRecordingsModel_transactionForToken_forStore___block_invoke;
  v13[3] = &unk_1E64964B8;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  long long v16 = self;
  char v17 = &v18;
  id v15 = v10;
  [(NSManagedObjectContext *)context performBlockAndWait:v13];
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __55__RCSavedRecordingsModel_transactionForToken_forStore___block_invoke(uint64_t a1)
{
  id v6 = [MEMORY[0x1E4F1C160] fetchHistoryTransactionForToken:*(void *)(a1 + 32)];
  [v6 setResultType:5];
  objc_msgSend(v6, "rc_setAffectedStore:", *(void *)(a1 + 40));
  [v6 setFetchBatchSize:100];
  uint64_t v2 = [*(id *)(a1 + 48) _transactionsAndChangesWithRequest:v6];
  uint64_t v3 = [v2 firstObject];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)transactionsAndChangesForObjectID:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"changedObjectID", a3];
  uint64_t v5 = [(RCSavedRecordingsModel *)self _transactionsAndChangesWithPredicate:v4];

  return v5;
}

- (id)_transactionsAndChangesForObjectIDs:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"changedObjectID", a3];
  uint64_t v5 = [(RCSavedRecordingsModel *)self _transactionsAndChangesWithPredicate:v4];

  return v5;
}

- (id)_transactionsAndChangesWithPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__1;
  char v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  context = self->_context;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__RCSavedRecordingsModel__transactionsAndChangesWithPredicate___block_invoke;
  v9[3] = &unk_1E6496418;
  id v6 = v4;
  id v11 = self;
  id v12 = &v13;
  id v10 = v6;
  [(NSManagedObjectContext *)context performBlockAndWait:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __63__RCSavedRecordingsModel__transactionsAndChangesWithPredicate___block_invoke(uint64_t a1)
{
  id v6 = [MEMORY[0x1E4F1C158] fetchRequest];
  [v6 setPredicate:*(void *)(a1 + 32)];
  uint64_t v2 = [MEMORY[0x1E4F1C160] fetchHistoryWithFetchRequest:v6];
  [v2 setResultType:5];
  uint64_t v3 = [*(id *)(a1 + 40) _transactionsAndChangesWithRequest:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_transactionsAndChangesWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__1;
  char v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  context = self->_context;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__RCSavedRecordingsModel__transactionsAndChangesWithRequest___block_invoke;
  v10[3] = &unk_1E6496508;
  v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  id v12 = &v13;
  [(NSManagedObjectContext *)context performBlockAndWait:v10];
  id v7 = (void *)v14[5];
  if (!v7) {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = v7;

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __61__RCSavedRecordingsModel__transactionsAndChangesWithRequest___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void **)(a1[4] + 8);
  id v10 = 0;
  id v4 = [v3 executeRequest:v2 error:&v10];
  id v5 = v10;
  if (v4 && [v4 resultType] == 5)
  {
    id v6 = [v4 result];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = *(void *)(a1[6] + 8);
      id v8 = v6;
      id v9 = *(NSObject **)(v7 + 40);
      *(void *)(v7 + 40) = v8;
    }
    else
    {
      id v9 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __61__RCSavedRecordingsModel__transactionsAndChangesWithRequest___block_invoke_cold_2();
      }
    }
  }
  else
  {
    id v6 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __61__RCSavedRecordingsModel__transactionsAndChangesWithRequest___block_invoke_cold_1();
    }
  }
}

- (id)nextRecordingDefaultLabelWithCustomTitleBase:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__1;
  char v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  context = self->_context;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__RCSavedRecordingsModel_nextRecordingDefaultLabelWithCustomTitleBase___block_invoke;
  v9[3] = &unk_1E6496508;
  id v6 = v4;
  id v10 = v6;
  id v11 = self;
  id v12 = &v13;
  [(NSManagedObjectContext *)context performBlockAndWait:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __71__RCSavedRecordingsModel_nextRecordingDefaultLabelWithCustomTitleBase___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) length])
  {
    id v2 = *(id *)(a1 + 32);
  }
  else
  {
    RCLocalizedFrameworkString(@"UNTITLED_NEW_RECORDING_LABEL");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__RCSavedRecordingsModel_nextRecordingDefaultLabelWithCustomTitleBase___block_invoke_2;
  v13[3] = &unk_1E6496530;
  id v3 = v2;
  id v14 = v3;
  id v4 = (void (**)(void, void))MEMORY[0x1C8778060](v13);
  id v5 = [*(id *)(a1 + 40) _allTitles];
  uint64_t v6 = v4[2](v4, 1);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if ([v5 containsObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)])
  {
    uint64_t v9 = 2;
    do
    {
      uint64_t v10 = v4[2](v4, v9);
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      ++v9;
    }
    while (([v5 containsObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)] & 1) != 0);
  }
}

id __71__RCSavedRecordingsModel_nextRecordingDefaultLabelWithCustomTitleBase___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    id v2 = *(id *)(a1 + 32);
  }
  else
  {
    id v3 = NSString;
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = RCLocalizedInteger(a2, 1);
    id v2 = [v3 stringWithFormat:@"%@ %@", v4, v5];
  }
  return v2;
}

- (id)insertRecordingWithAudioFile:(id)a3 duration:(double)a4 date:(id)a5 customLabelBase:(id)a6
{
  return [(RCSavedRecordingsModel *)self insertRecordingWithAudioFile:a3 duration:a5 date:a6 customTitleBase:0 uniqueID:a4];
}

- (id)insertRecordingWithAudioFile:(id)a3 duration:(double)a4 date:(id)a5 customTitleBase:(id)a6 uniqueID:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  long long v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (!v13)
  {
    id v13 = [MEMORY[0x1E4F1C9C8] date];
  }
  id v17 = [v12 stringByStandardizingPath];
  if (!v17) {
    goto LABEL_17;
  }
  id v18 = RCRecordingsDirectoryURL();
  uint64_t v19 = [v18 path];
  char v20 = objc_msgSend(v16, "rc_path:isSubpathOf:", v17, v19);

  if ((v20 & 1) != 0
    || (uint64_t v21 = [(id)objc_opt_class() _copyFileIntoRecordingsDirectory:v12],
        v17,
        (id v17 = (id)v21) != 0))
  {
LABEL_17:
    if ([v16 fileExistsAtPath:v17])
    {
      uint64_t v22 = (void *)MEMORY[0x1E4F166C8];
      id v23 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v17];
      uint64_t v24 = objc_msgSend(v22, "rc_preciseTimingAssetWithURL:", v23);
    }
    else
    {
      uint64_t v24 = 0;
    }
    if (a4 == -1.0)
    {
      objc_msgSend(v24, "rc_durationInSeconds");
      a4 = v25;
    }
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__1;
    v40 = __Block_byref_object_dispose__1;
    id v41 = 0;
    context = self->_context;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __94__RCSavedRecordingsModel_insertRecordingWithAudioFile_duration_date_customTitleBase_uniqueID___block_invoke;
    v29[3] = &unk_1E6496558;
    v29[4] = self;
    v34 = &v36;
    id v30 = v13;
    id v27 = v17;
    id v31 = v27;
    double v35 = a4;
    id v32 = v14;
    id v33 = v15;
    [(NSManagedObjectContext *)context performBlockAndWait:v29];
    id v17 = (id)v37[5];

    _Block_object_dispose(&v36, 8);
  }

  return v17;
}

uint64_t __94__RCSavedRecordingsModel_insertRecordingWithAudioFile_duration_date_customTitleBase_uniqueID___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) hasChanges]) {
    [*(id *)(a1 + 32) saveIfNecessary];
  }
  id v2 = [[RCCloudRecording alloc] initWithContext:*(void *)(*(void *)(a1 + 32) + 8) andCreationDate:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(a1 + 48) lastPathComponent];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setFileName:v5];

  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setLength:*(double *)(a1 + 80)];
  uint64_t v6 = [*(id *)(a1 + 32) nextRecordingDefaultLabelWithCustomTitleBase:*(void *)(a1 + 56)];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setTitle:v6];

  if (*(void *)(a1 + 64))
  {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "setUuid:");
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    id v8 = [v7 UUIDString];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setUuid:v8];
  }
  if (*(double *)(a1 + 80) > 0.0)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setPlayable:1];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) synchronizeRecordingMetadata];
  }
  uint64_t v9 = *(void **)(a1 + 32);
  return [v9 saveIfNecessary];
}

+ (void)_determineImportabilityOfRecordingWithAudioAsset:(id)a3 preferredFormat:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v7 URL];
  uint64_t v10 = [v9 pathExtension];
  if (!v10)
  {
    id v12 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = [v9 path];
      *(_DWORD *)buf = 136315394;
      uint64_t v21 = "+[RCSavedRecordingsModel _determineImportabilityOfRecordingWithAudioAsset:preferredFormat:completionHandler:]";
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_impl(&dword_1C3964000, v12, OS_LOG_TYPE_INFO, "%s -- NOTE: import disallowed because audioURL '%@' has no extension", buf, 0x16u);
    }
    goto LABEL_7;
  }
  objc_msgSend(v7, "rc_durationInSeconds");
  if (v11 == 0.0)
  {
    id v12 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[RCSavedRecordingsModel _determineImportabilityOfRecordingWithAudioAsset:preferredFormat:completionHandler:](v9);
    }
LABEL_7:

    (*((void (**)(id, uint64_t, id, void, void))v8 + 2))(v8, -1, v7, 0, 0);
    goto LABEL_8;
  }
  if (+[RCCaptureFormat supportsFileExtension:v10])
  {
    (*((void (**)(id, uint64_t, id, void, void))v8 + 2))(v8, 1, v7, 0, 0);
  }
  else
  {
    id v14 = @"m4a";
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __109__RCSavedRecordingsModel__determineImportabilityOfRecordingWithAudioAsset_preferredFormat_completionHandler___block_invoke;
    v15[3] = &unk_1E6496580;
    long long v16 = v14;
    id v17 = v9;
    id v19 = v8;
    id v18 = v7;
    +[RCCaptureFormat AVAssetExportDetermineSettingsForExportingAsset:v18 preferredOutputExtension:v14 preferredFormat:v6 completionHandler:v15];
  }
LABEL_8:
}

void __109__RCSavedRecordingsModel__determineImportabilityOfRecordingWithAudioAsset_preferredFormat_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if ([a2 isEqual:*(void *)(a1 + 32)])
  {
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    uint64_t v10 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __109__RCSavedRecordingsModel__determineImportabilityOfRecordingWithAudioAsset_preferredFormat_completionHandler___block_invoke_cold_1(a1);
    }

    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v9();
}

+ (void)determineImportabilityOfRecordingWithAudioURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F166C8] assetWithURL:v6];
  uint64_t v9 = v8;
  if (v8
    && [v8 isPlayable]
    && (objc_msgSend(v9, "rc_audioTracks"),
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 count],
        v10,
        v11))
  {
    id v12 = [MEMORY[0x1E4F1CB18] sharedSettingsUserDefaults];
    if (objc_msgSend(v12, "rc_audioQuality") == 1) {
      uint64_t v13 = 1634492771;
    }
    else {
      uint64_t v13 = 1633772320;
    }

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __90__RCSavedRecordingsModel_determineImportabilityOfRecordingWithAudioURL_completionHandler___block_invoke;
    v16[3] = &unk_1E64965A8;
    id v17 = v7;
    id v14 = (void *)MEMORY[0x1C8778060](v16);
    [a1 _determineImportabilityOfRecordingWithAudioAsset:v9 preferredFormat:v13 completionHandler:v14];
  }
  else
  {
    id v15 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[RCSavedRecordingsModel determineImportabilityOfRecordingWithAudioURL:completionHandler:]();
    }

    (*((void (**)(id, uint64_t))v7 + 2))(v7, -1);
  }
}

uint64_t __90__RCSavedRecordingsModel_determineImportabilityOfRecordingWithAudioURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)importRecordingWithSourceAudioURL:(id)a3 name:(id)a4 date:(id)a5 xpcConnection:(id)a6 userInfo:(id)a7 completionHandler:(id)a8
{
  uint64_t v13 = 1634492771;
  id v34 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = [v17 objectForKeyedSubscript:@"uniqueID"];
  char v20 = [MEMORY[0x1E4F1CB18] sharedSettingsUserDefaults];
  if (objc_msgSend(v20, "rc_audioQuality") == 1) {
    uint64_t v21 = 1634492771;
  }
  else {
    uint64_t v21 = 1633772320;
  }

  __int16 v22 = objc_msgSend(v16, "rcs_applicationIdentifier");
  int v23 = [@"F3LWYJ7GM7.com.apple.musicmemos" isEqualToString:v22];

  uint64_t v24 = &unk_1C39B1000;
  if (!v23)
  {
    uint64_t v13 = v21;
    goto LABEL_12;
  }
  if (!v19)
  {
LABEL_12:
    id v30 = v34;
    goto LABEL_13;
  }
  id v25 = v19;
  v26 = self;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 1;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __isUniqueMusicMemo_block_invoke;
  v41[3] = &unk_1E6496508;
  id v27 = v26;
  v42 = v27;
  id v19 = v25;
  id v43 = v19;
  v44 = &v45;
  [(RCSavedRecordingsModel *)v27 performBlockAndWait:v41];
  int v28 = *((unsigned __int8 *)v46 + 24);

  _Block_object_dispose(&v45, 8);
  if (!v28)
  {
    v29 = OSLogForCategory(@"Service");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[RCSavedRecordingsModel importRecordingWithSourceAudioURL:name:date:xpcConnection:userInfo:completionHandler:]();
    }

    id v19 = 0;
  }
  id v30 = v34;
  uint64_t v24 = (void *)&unk_1C39B1000;
LABEL_13:
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = v24[249];
  v36[2] = __111__RCSavedRecordingsModel_importRecordingWithSourceAudioURL_name_date_xpcConnection_userInfo_completionHandler___block_invoke;
  v36[3] = &unk_1E64965F8;
  char v40 = v23;
  v36[4] = self;
  id v37 = v14;
  id v38 = v17;
  id v39 = v18;
  id v31 = v18;
  id v32 = v17;
  id v33 = v14;
  [(RCSavedRecordingsModel *)self _importRecordingWithSourceAudioURL:v30 name:v33 date:v15 uniqueID:v19 preferredFormat:v13 completionHandler:v36];
}

void __111__RCSavedRecordingsModel_importRecordingWithSourceAudioURL_name_date_xpcConnection_userInfo_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __111__RCSavedRecordingsModel_importRecordingWithSourceAudioURL_name_date_xpcConnection_userInfo_completionHandler___block_invoke_2;
  v11[3] = &unk_1E64965D0;
  v11[4] = v7;
  id v12 = v5;
  char v17 = *(unsigned char *)(a1 + 64);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v15 = v6;
  id v16 = v8;
  id v9 = v6;
  id v10 = v5;
  [v7 performBlockAndWait:v11];
}

void __111__RCSavedRecordingsModel_importRecordingWithSourceAudioURL_name_date_xpcConnection_userInfo_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) recordingWithID:*(void *)(a1 + 40)];
  if (v2 && *(unsigned char *)(a1 + 80))
  {
    uint64_t v3 = *(void **)(a1 + 56);
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = *(id *)(a1 + 48);
    id v6 = v3;
    id v7 = v4;
    [v2 setMusicMemo:1];
    [v2 setTitle:v5];
    [v7 saveIfNecessary];
    id v8 = RCLocalizedFrameworkString(@"MUSIC_MEMOS_FOLDER_NAME");
    id v9 = [v7 folderWithName:v8];

    [v7 addRecording:v2 toFolder:v9];
    id v10 = [v2 uuid];
    uint64_t v11 = [v2 creationDate];
    uint64_t v12 = +[RCCaptureFormat AVAssetAuthoringMetadataWithCreationDate:v11 title:v5 uniqueID:v10 musicMemoMetadata:v6];

    id v13 = (void *)MEMORY[0x1E4F16330];
    id v14 = [v2 url];
    id v41 = 0;
    uint64_t v36 = (void *)v12;
    LOBYTE(v13) = objc_msgSend(v13, "rc_updateMetadataInFile:withMetadata:error:", v14, v12, &v41);
    id v15 = v41;

    if ((v13 & 1) == 0)
    {
      id v16 = OSLogForCategory(@"Service");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __111__RCSavedRecordingsModel_importRecordingWithSourceAudioURL_name_date_xpcConnection_userInfo_completionHandler___block_invoke_2_cold_1();
      }
    }
    double v35 = v15;
    char v17 = [v2 objectID];
    id v18 = [v7 recordingsWithUniqueID:v10];
    if ((unint64_t)[v18 count] >= 2)
    {
      id v30 = v10;
      id v31 = v9;
      id v32 = v6;
      id v33 = v5;
      id v34 = v2;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      v29 = v18;
      id v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v38 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            id v25 = objc_msgSend(v24, "objectID", v29, v30, v31, v32, v33, v34);
            if ([v25 isEqual:v17])
            {
            }
            else
            {
              int v26 = [v24 musicMemo];

              if (v26) {
                [v7 eraseRecording:v24];
              }
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v21);
      }

      id v5 = v33;
      id v2 = v34;
      id v9 = v31;
      id v6 = v32;
      id v18 = v29;
      id v10 = v30;
    }
  }
  uint64_t v27 = *(void *)(a1 + 72);
  int v28 = objc_msgSend(v2, "URIRepresentation", v29, v30, v31, v32, v33, v34);
  (*(void (**)(uint64_t, void *, void))(v27 + 16))(v27, v28, *(void *)(a1 + 64));
}

+ (void)importRecordingWithSourceAudioURL:(id)a3 name:(id)a4 date:(id)a5 completionHandler:(id)a6
{
}

+ (void)importRecordingWithSourceAudioURL:(id)a3 name:(id)a4 date:(id)a5 userInfo:(id)a6 completionHandler:(id)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a3;
  id v15 = a7;
  id v16 = v14;
  [v16 fileSystemRepresentation];
  char v17 = (const char *)sandbox_extension_issue_file();
  if (v17)
  {
    id v18 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v17 length:strlen(v17) + 1 freeWhenDone:1];
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4F28FF8]) initWithURL:v16 readonly:1 scope:v18];
    uint64_t v20 = +[RCSSavedRecordingService sharedService];

    [v20 importRecordingWithSourceAudioURL:v19 name:v11 date:v12 userInfo:v13 importCompletionBlock:v15];
  }
  else
  {
    uint64_t v21 = *MEMORY[0x1E4F289D0];
    v22[0] = v16;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    id v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RCSavedRecordingsImportErrorDomain" code:200 userInfo:v18];

    (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v19);
  }
}

- (void)_importRecordingWithSourceAudioURL:(id)a3 name:(id)a4 date:(id)a5 uniqueID:(id)a6 preferredFormat:(unsigned int)a7 completionHandler:(id)a8
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v43 = (void (**)(id, void, void *))a8;
  id v16 = v12;
  if (!v15)
  {
    char v17 = [MEMORY[0x1E4F29128] UUID];
    id v15 = [v17 UUIDString];
  }
  id v18 = v16;
  if (![v16 startAccessingSecurityScopedResource]) {
    goto LABEL_8;
  }
  id v40 = v13;
  id v19 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v20 = [(id)objc_opt_class() standardNameForRecordingWithCreationDate:v14 uniqueID:v15];
  uint64_t v21 = [v16 pathExtension];
  uint64_t v22 = [v20 stringByAppendingPathExtension:v21];

  int v23 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v24 = NSTemporaryDirectory();
  id v25 = [v23 fileURLWithPath:v24];
  int v26 = [v25 URLByAppendingPathComponent:v22];

  uint64_t v27 = objc_msgSend(v19, "rc_uniqueFileSystemURLWithPreferredURL:", v26);

  id v55 = 0;
  int v28 = [v19 copyItemAtURL:v16 toURL:v27 error:&v55];
  id v29 = v55;
  [v16 stopAccessingSecurityScopedResource];
  if (v28)
  {
    id v18 = v27;
    id v30 = v16;
  }
  else
  {
    uint64_t v56 = *MEMORY[0x1E4F28A50];
    v57[0] = v29;
    id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
    id v31 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RCSavedRecordingsImportErrorDomain" code:200 userInfo:v30];
    v43[2](v43, 0, v31);

    id v18 = v16;
  }

  id v13 = v40;
  if (v28)
  {
LABEL_8:
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __114__RCSavedRecordingsModel__importRecordingWithSourceAudioURL_name_date_uniqueID_preferredFormat_completionHandler___block_invoke;
    v51[3] = &unk_1E6496620;
    id v32 = v16;
    id v52 = v32;
    id v18 = v18;
    id v53 = v18;
    v54 = v43;
    id v33 = (void (**)(void, void, void))MEMORY[0x1C8778060](v51);
    id v34 = [MEMORY[0x1E4F166C8] assetWithURL:v18];
    double v35 = v34;
    if (v34
      && [v34 isPlayable]
      && (objc_msgSend(v35, "rc_audioTracks"),
          uint64_t v36 = objc_claimAutoreleasedReturnValue(),
          uint64_t v37 = [v36 count],
          v36,
          v37))
    {
      long long v38 = objc_opt_class();
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __114__RCSavedRecordingsModel__importRecordingWithSourceAudioURL_name_date_uniqueID_preferredFormat_completionHandler___block_invoke_97;
      v44[3] = &unk_1E6496648;
      id v45 = v32;
      v50 = v33;
      v46 = self;
      id v47 = v13;
      id v48 = v14;
      id v49 = v15;
      [v38 _determineImportabilityOfRecordingWithAudioAsset:v35 preferredFormat:a7 completionHandler:v44];

      long long v39 = v45;
    }
    else
    {
      long long v39 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RCSavedRecordingsImportErrorDomain" code:200 userInfo:0];
      ((void (**)(void, void, void *))v33)[2](v33, 0, v39);
    }
  }
}

void __114__RCSavedRecordingsModel__importRecordingWithSourceAudioURL_name_date_uniqueID_preferredFormat_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) isEqual:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v8 = *(void *)(a1 + 40);
    id v12 = 0;
    char v9 = [v7 removeItemAtURL:v8 error:&v12];
    id v10 = v12;

    if ((v9 & 1) == 0)
    {
      id v11 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __114__RCSavedRecordingsModel__importRecordingWithSourceAudioURL_name_date_uniqueID_preferredFormat_completionHandler___block_invoke_cold_1();
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __114__RCSavedRecordingsModel__importRecordingWithSourceAudioURL_name_date_uniqueID_preferredFormat_completionHandler___block_invoke_97(uint64_t a1, unint64_t a2, void *a3, void *a4, void *a5)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a2 != 0 && a2 < 0xFFFFFFFFFFFFFFFELL)
  {
    [*(id *)(a1 + 40) _importImportableRecordingWithAudioAsset:v9 name:*(void *)(a1 + 48) date:*(void *)(a1 + 56) uniqueID:*(void *)(a1 + 64) presetName:v10 outputFileType:v11 completionHandler:*(void *)(a1 + 72)];
  }
  else
  {
    uint64_t v12 = qword_1C39B1818[a2 + 2];
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v17 = *MEMORY[0x1E4F289D0];
    v18[0] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v16 = [v13 errorWithDomain:@"RCSavedRecordingsImportErrorDomain" code:v12 userInfo:v15];

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

- (void)_importImportableRecordingWithAudioAsset:(id)a3 name:(id)a4 date:(id)a5 uniqueID:(id)a6 presetName:(id)a7 outputFileType:(id)a8 completionHandler:(id)a9
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v38 = a4;
  id v39 = a5;
  id v40 = a6;
  id v37 = a7;
  id v36 = a8;
  id v15 = a9;
  id v16 = [v14 URL];
  uint64_t v17 = [v16 pathExtension];
  if (v17
    && ([v16 pathExtension],
        id v18 = objc_claimAutoreleasedReturnValue(),
        BOOL v19 = +[RCCaptureFormat supportsFileExtension:v18],
        v18,
        v19))
  {
    [(RCSavedRecordingsModel *)self _insertRecordingWithImportableAudioURL:v16 name:v38 date:v39 uniqueID:v40 completionHandler:v15];
  }
  else
  {
    uint64_t v20 = RCRecordingsDirectoryURL();
    uint64_t v21 = [v16 lastPathComponent];
    uint64_t v22 = [v21 stringByDeletingPathExtension];
    int v23 = [v20 URLByAppendingPathComponent:v22];
    uint64_t v24 = [v23 URLByAppendingPathExtension:@"m4a"];

    id v25 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v26 = objc_msgSend(v25, "rc_uniqueFileSystemURLWithPreferredURL:", v24);

    uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F16360]) initWithAsset:v14 presetName:v37];
    int v28 = v27;
    if (v27)
    {
      [v27 setOutputFileType:v36];
      [v28 setOutputURL:v26];
      id v29 = +[RCCaptureFormat AVAssetAuthoringMetadataWithCreationDate:v39 title:v38 uniqueID:v40];
      [v28 setMetadata:v29];

      id v30 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        id v31 = [v16 path];
        -[RCSavedRecordingsModel _importImportableRecordingWithAudioAsset:name:date:uniqueID:presetName:outputFileType:completionHandler:](v31, (uint64_t)v26, buf, v30);
      }

      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __130__RCSavedRecordingsModel__importImportableRecordingWithAudioAsset_name_date_uniqueID_presetName_outputFileType_completionHandler___block_invoke;
      v41[3] = &unk_1E6496670;
      id v42 = v16;
      id v43 = v26;
      id v44 = v28;
      id v45 = self;
      id v46 = v38;
      id v47 = v39;
      id v48 = v40;
      id v49 = v15;
      [v44 exportAsynchronouslyWithCompletionHandler:v41];
    }
    else
    {
      id v32 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v51 = *MEMORY[0x1E4F28588];
      v52[0] = @"unsupported format";
      id v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
      id v34 = [v32 errorWithDomain:@"RCSavedRecordingsImportErrorDomain" code:300 userInfo:v33];
      (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v34);
    }
  }
}

void __130__RCSavedRecordingsModel__importImportableRecordingWithAudioAsset_name_date_uniqueID_presetName_outputFileType_completionHandler___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v2 = OSLogForCategory(@"Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __130__RCSavedRecordingsModel__importImportableRecordingWithAudioAsset_name_date_uniqueID_presetName_outputFileType_completionHandler___block_invoke_cold_2(a1, v2);
  }

  uint64_t v3 = (id *)(a1 + 48);
  if ([*(id *)(a1 + 48) status] == 3)
  {
    [*(id *)(a1 + 56) _insertRecordingWithImportableAudioURL:*(void *)(a1 + 40) name:*(void *)(a1 + 64) date:*(void *)(a1 + 72) uniqueID:*(void *)(a1 + 80) completionHandler:*(void *)(a1 + 88)];
  }
  else
  {
    uint64_t v4 = [*v3 error];
    if (v4)
    {
      uint64_t v10 = *MEMORY[0x1E4F28A50];
      id v5 = [*v3 error];
      v11[0] = v5;
      id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    }
    else
    {
      id v6 = 0;
    }

    id v7 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __130__RCSavedRecordingsModel__importImportableRecordingWithAudioAsset_name_date_uniqueID_presetName_outputFileType_completionHandler___block_invoke_cold_1((id *)(a1 + 48), (uint64_t)v6, v7);
    }

    uint64_t v8 = *(void *)(a1 + 88);
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RCSavedRecordingsImportErrorDomain" code:300 userInfo:v6];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
}

void __130__RCSavedRecordingsModel__importImportableRecordingWithAudioAsset_name_date_uniqueID_presetName_outputFileType_completionHandler___block_invoke_102(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RCSavedRecordingsImportErrorDomain" code:300 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)_insertRecordingWithImportableAudioURL:(id)a3 name:(id)a4 date:(id)a5 uniqueID:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a3;
  uint64_t v17 = [(id)objc_opt_class() savedRecordingsDirectory];
  id v18 = [v16 path];

  BOOL v19 = [v18 stringByStandardizingPath];
  if (v19)
  {
    uint64_t v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v21 = objc_msgSend(v20, "rc_path:isSubpathOf:", v19, v17);

    if ((v21 & 1) == 0)
    {
      uint64_t v22 = [(id)objc_opt_class() _copyFileIntoRecordingsDirectory:v18];

      BOOL v19 = (void *)v22;
    }
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __102__RCSavedRecordingsModel__insertRecordingWithImportableAudioURL_name_date_uniqueID_completionHandler___block_invoke;
  v28[3] = &unk_1E64966C0;
  v28[4] = self;
  id v29 = v19;
  id v30 = v13;
  id v31 = v12;
  id v32 = v14;
  id v33 = v15;
  id v23 = v15;
  id v24 = v14;
  id v25 = v12;
  id v26 = v13;
  id v27 = v19;
  [(RCSavedRecordingsModel *)self performBlockAndWait:v28];
}

void __102__RCSavedRecordingsModel__insertRecordingWithImportableAudioURL_name_date_uniqueID_completionHandler___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) insertRecordingWithAudioFile:*(void *)(a1 + 40) duration:*(void *)(a1 + 48) date:*(void *)(a1 + 56) customTitleBase:*(void *)(a1 + 64) uniqueID:-1.0];
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = [v4 objectID];
  (*(void (**)(uint64_t, void *, void))(v2 + 16))(v2, v3, 0);
}

- (void)setTitle:(id)a3 ofRecording:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  context = self->_context;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __47__RCSavedRecordingsModel_setTitle_ofRecording___block_invoke;
  v11[3] = &unk_1E64966E8;
  id v12 = v7;
  id v13 = v6;
  id v14 = self;
  id v9 = v6;
  id v10 = v7;
  [(NSManagedObjectContext *)context performBlockAndWait:v11];
}

uint64_t __47__RCSavedRecordingsModel_setTitle_ofRecording___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTitle:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setManuallyRenamed:1];
  uint64_t v2 = *(void **)(a1 + 48);
  return [v2 saveIfNecessary];
}

- (void)setFavorite:(BOOL)a3 ofRecording:(id)a4
{
  id v6 = a4;
  context = self->_context;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__RCSavedRecordingsModel_setFavorite_ofRecording___block_invoke;
  v9[3] = &unk_1E6496710;
  BOOL v12 = a3;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  [(NSManagedObjectContext *)context performBlockAndWait:v9];
}

uint64_t __50__RCSavedRecordingsModel_setFavorite_ofRecording___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setFavorite:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 saveIfNecessary];
}

- (void)setEnhanced:(BOOL)a3 ofRecording:(id)a4
{
  id v6 = a4;
  context = self->_context;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__RCSavedRecordingsModel_setEnhanced_ofRecording___block_invoke;
  v9[3] = &unk_1E6496710;
  BOOL v12 = a3;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  [(NSManagedObjectContext *)context performBlockAndWait:v9];
}

uint64_t __50__RCSavedRecordingsModel_setEnhanced_ofRecording___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setEnhanced:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 saveIfNecessary];
}

- (id)_userDefinedFolders:(id)a3 searchOption:(int)a4
{
  if (a3)
  {
    id v5 = +[RCQueryManager foldersWithNameFetchRequest:a3 searchOption:*(void *)&a4];
    id v6 = [(NSManagedObjectContext *)self->_context executeFetchRequest:v5 error:0];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)existingRecordingsWithName:(id)a3 searchOption:(int)a4 error:(id *)a5
{
  id v7 = +[RCQueryManager recordingWithNameFetchRequest:a3 searchOption:*(void *)&a4];
  id v8 = [(NSManagedObjectContext *)self->_context executeFetchRequest:v7 error:a5];

  return v8;
}

- (id)_foldersWithUUID:(id)a3
{
  id v3 = (id)MEMORY[0x1E4F1CBF0];
  if (a3)
  {
    id v5 = +[RCQueryManager foldersWithUUIDFetchRequest:](RCQueryManager, "foldersWithUUIDFetchRequest:");
    uint64_t v6 = [(NSManagedObjectContext *)self->_context executeFetchRequest:v5 error:0];
    id v7 = (void *)v6;
    if (v6) {
      id v8 = (void *)v6;
    }
    else {
      id v8 = v3;
    }
    id v3 = v8;
  }
  return v3;
}

- (id)folderWithName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__1;
  id v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  context = self->_context;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__RCSavedRecordingsModel_folderWithName___block_invoke;
  v9[3] = &unk_1E6496508;
  void v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [(NSManagedObjectContext *)context performBlockAndWait:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __41__RCSavedRecordingsModel_folderWithName___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _userDefinedFolders:*(void *)(a1 + 40) searchOption:0];
  uint64_t v3 = [v2 firstObject];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v6 = -[RCRecordingsFolder initWithContext:name:rank:uuid:]([RCRecordingsFolder alloc], "initWithContext:name:rank:uuid:", *(void *)(*(void *)(a1 + 32) + 8), *(void *)(a1 + 40), [*(id *)(a1 + 32) _rankForFolderInsert], 0);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v9 = *(void **)(*(void *)(a1 + 32) + 8);
    v15[0] = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v14 = 0;
    char v11 = [v9 obtainPermanentIDsForObjects:v10 error:&v14];
    id v12 = v14;

    if ((v11 & 1) == 0)
    {
      id v13 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __41__RCSavedRecordingsModel_folderWithName___block_invoke_cold_1();
      }
    }
    [*(id *)(a1 + 32) saveIfNecessary];
  }
}

- (id)_recordingsFetchRequestForFolder:(id)a3
{
  id v3 = a3;
  switch([v3 folderType])
  {
    case 0:
      uint64_t v4 = +[RCQueryManager playableRecordingsFetchRequestWithSubPredicate:0];
      goto LABEL_8;
    case 1:
      uint64_t v6 = +[RCQueryManager favoritePredicate];
      goto LABEL_6;
    case 2:
      uint64_t v6 = +[RCQueryManager watchOSPredicate];
LABEL_6:
      uint64_t v7 = (void *)v6;
      id v5 = +[RCQueryManager playableRecordingsFetchRequestWithSubPredicate:v6];
      goto LABEL_10;
    case 3:
      uint64_t v4 = +[RCQueryManager deletedRecordingsFetchRequest];
LABEL_8:
      id v5 = (void *)v4;
      break;
    case 4:
      uint64_t v7 = [v3 uuid];
      id v8 = +[RCQueryManager recordingsInFolderPredicate:v7];
      id v5 = +[RCQueryManager playableRecordingsFetchRequestWithSubPredicate:v8];

LABEL_10:
      break;
    default:
      id v5 = 0;
      break;
  }

  return v5;
}

- (id)_userFolderFetchRequest
{
  return +[RCQueryManager userDefinedFoldersFetchRequest];
}

- (unint64_t)userFolderCount
{
  id v3 = [(RCSavedRecordingsModel *)self _userFolderFetchRequest];
  unint64_t v4 = [(RCSavedRecordingsModel *)self _countForFetchRequest:v3];

  return v4;
}

- (unint64_t)_countForFetchRequest:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  context = self->_context;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__RCSavedRecordingsModel__countForFetchRequest___block_invoke;
  v9[3] = &unk_1E64963C8;
  char v11 = &v12;
  void v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [(NSManagedObjectContext *)context performBlockAndWait:v9];
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __48__RCSavedRecordingsModel__countForFetchRequest___block_invoke(void *a1)
{
  id v3 = a1 + 5;
  uint64_t v2 = a1[5];
  id v4 = *(void **)(a1[4] + 8);
  id v8 = 0;
  uint64_t v5 = [v4 countForFetchRequest:v2 error:&v8];
  id v6 = v8;
  *(void *)(*(void *)(v3[1] + 8) + 24) = v5;
  if (*(void *)(*(void *)(v3[1] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __48__RCSavedRecordingsModel__countForFetchRequest___block_invoke_cold_1();
    }

    *(void *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
}

- (id)userFolders
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__1;
  id v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  context = self->_context;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__RCSavedRecordingsModel_userFolders__block_invoke;
  v5[3] = &unk_1E6496378;
  v5[4] = self;
  v5[5] = &v6;
  [(NSManagedObjectContext *)context performBlockAndWait:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __37__RCSavedRecordingsModel_userFolders__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[1];
  id v4 = [v2 _userFolderFetchRequest];
  id v10 = 0;
  uint64_t v5 = [v3 executeFetchRequest:v4 error:&v10];
  id v6 = v10;

  if (!v5)
  {
    unint64_t v7 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __37__RCSavedRecordingsModel_userFolders__block_invoke_cold_1();
    }

    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = MEMORY[0x1E4F1CBF0];
  }
}

- (unint64_t)playableCountForFolder:(id)a3
{
  id v4 = [(RCSavedRecordingsModel *)self _recordingsFetchRequestForFolder:a3];
  unint64_t v5 = [(RCSavedRecordingsModel *)self _countForFetchRequest:v4];

  return v5;
}

- (id)existingFolderWithName:(id)a3
{
  id v3 = [(RCSavedRecordingsModel *)self existingFoldersWithName:a3 searchOption:0];
  id v4 = [v3 firstObject];

  return v4;
}

- (id)existingFoldersWithName:(id)a3 searchOption:(int)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__1;
  BOOL v19 = __Block_byref_object_dispose__1;
  id v20 = 0;
  context = self->_context;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __63__RCSavedRecordingsModel_existingFoldersWithName_searchOption___block_invoke;
  v11[3] = &unk_1E6496738;
  id v13 = &v15;
  void v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  int v14 = a4;
  [(NSManagedObjectContext *)context performBlockAndWait:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __63__RCSavedRecordingsModel_existingFoldersWithName_searchOption___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _userDefinedFolders:*(void *)(a1 + 40) searchOption:*(unsigned int *)(a1 + 56)];
  return MEMORY[0x1F41817F8]();
}

- (id)existingFolderWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__1;
  uint64_t v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  context = self->_context;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__RCSavedRecordingsModel_existingFolderWithUUID___block_invoke;
  v9[3] = &unk_1E6496508;
  id v6 = v4;
  id v10 = v6;
  id v11 = self;
  id v12 = &v13;
  [(NSManagedObjectContext *)context performBlockAndWait:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __49__RCSavedRecordingsModel_existingFolderWithUUID___block_invoke(void *a1)
{
  uint64_t v2 = +[RCQueryManager foldersWithUUIDFetchRequest:a1[4]];
  id v3 = [*(id *)(a1[5] + 8) executeFetchRequest:v2 error:0];
  if (!v3)
  {
    id v4 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __49__RCSavedRecordingsModel_existingFolderWithUUID___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  uint64_t v12 = [v3 firstObject];
  uint64_t v13 = *(void *)(a1[6] + 8);
  int v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

- (void)deleteFolder:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"RCSavedRecordingsModel.m", 987, @"Invalid parameter not satisfying: %@", @"folder != nil" object file lineNumber description];
  }
  if ([v5 folderType] != 4)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"RCSavedRecordingsModel.m", 988, @"Invalid parameter not satisfying: %@", @"folder.folderType == RCFolderTypeUserDefined" object file lineNumber description];
  }
  context = self->_context;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__RCSavedRecordingsModel_deleteFolder___block_invoke;
  v10[3] = &unk_1E6496350;
  id v11 = v5;
  uint64_t v12 = self;
  id v7 = v5;
  [(NSManagedObjectContext *)context performBlockAndWait:v10];
}

void __39__RCSavedRecordingsModel_deleteFolder___block_invoke(uint64_t a1)
{
  uint64_t v2 = OSLogForCategory(@"Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __39__RCSavedRecordingsModel_deleteFolder___block_invoke_cold_2();
  }

  id v3 = [*(id *)(a1 + 40) userFolders];
  uint64_t v4 = [*(id *)(a1 + 32) rank];
  unint64_t v5 = [v3 count];
  unint64_t v6 = v4 + 1;
  if (v6 < v5)
  {
    unint64_t v7 = v5;
    do
    {
      uint64_t v8 = [v3 objectAtIndexedSubscript:v6];
      objc_msgSend(v8, "setRank:", objc_msgSend(v8, "rank") - 1);

      ++v6;
    }
    while (v7 != v6);
  }
  [*(id *)(*(void *)(a1 + 40) + 8) deleteObject:*(void *)(a1 + 32)];
  uint64_t v9 = *(void **)(a1 + 40);
  id v13 = 0;
  char v10 = [v9 saveIfNecessary:&v13];
  id v11 = v13;
  if ((v10 & 1) == 0)
  {
    uint64_t v12 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __39__RCSavedRecordingsModel_deleteFolder___block_invoke_cold_1();
    }
  }
}

- (void)renameFolder:(id)a3 toName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  context = self->_context;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __46__RCSavedRecordingsModel_renameFolder_toName___block_invoke;
  v11[3] = &unk_1E64966E8;
  id v12 = v6;
  id v13 = v7;
  int v14 = self;
  id v9 = v7;
  id v10 = v6;
  [(NSManagedObjectContext *)context performBlockAndWait:v11];
}

void __46__RCSavedRecordingsModel_renameFolder_toName___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  [v3 setName:v2];
  [*(id *)(a1 + 48) saveIfNecessary];
}

- (void)addRecordings:(id)a3 toFolder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  context = self->_context;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __49__RCSavedRecordingsModel_addRecordings_toFolder___block_invoke;
  v11[3] = &unk_1E64966E8;
  id v12 = v7;
  id v13 = v6;
  int v14 = self;
  id v9 = v6;
  id v10 = v7;
  [(NSManagedObjectContext *)context performBlockAndWait:v11];
}

void __49__RCSavedRecordingsModel_addRecordings_toFolder___block_invoke(id *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a1[5];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(v2, "containsRecording:", v8, (void)v9) & 1) == 0) {
          [v2 addRecording:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [a1[6] saveIfNecessary];
}

- (void)addRecording:(id)a3 toFolder:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  long long v9 = [v6 arrayWithObjects:&v10 count:1];

  -[RCSavedRecordingsModel addRecordings:toFolder:](self, "addRecordings:toFolder:", v9, v7, v10, v11);
}

- (void)removeRecording:(id)a3 fromFolder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  context = self->_context;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __53__RCSavedRecordingsModel_removeRecording_fromFolder___block_invoke;
  v11[3] = &unk_1E64966E8;
  id v12 = v7;
  id v13 = v6;
  uint64_t v14 = self;
  id v9 = v6;
  id v10 = v7;
  [(NSManagedObjectContext *)context performBlockAndWait:v11];
}

void __53__RCSavedRecordingsModel_removeRecording_fromFolder___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  [v3 removeRecording:v2];
  [*(id *)(a1 + 48) saveIfNecessary];
}

- (void)eraseRecording:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"RCSavedRecordingsModel.m", 1043, @"Invalid parameter not satisfying: %@", @"recording != nil" object file lineNumber description];
  }
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [(RCSavedRecordingsModel *)self eraseRecordings:v6];
}

- (void)eraseRecordings:(id)a3
{
  id v4 = a3;
  context = self->_context;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__RCSavedRecordingsModel_eraseRecordings___block_invoke;
  v7[3] = &unk_1E6496350;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(NSManagedObjectContext *)context performBlockAndWait:v7];
}

void __42__RCSavedRecordingsModel_eraseRecordings___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v15 + 1) + 8 * v6);
        id v8 = OSLogForCategory(@"Default");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          id v20 = "-[RCSavedRecordingsModel eraseRecordings:]_block_invoke";
          __int16 v21 = 2112;
          uint64_t v22 = v7;
          _os_log_debug_impl(&dword_1C3964000, v8, OS_LOG_TYPE_DEBUG, "%s -- erasing recording: %@", buf, 0x16u);
        }

        id v9 = [v7 url];
        +[RCComposition deleteFromFilesystem:v9];

        [*(id *)(*(void *)(a1 + 40) + 8) deleteObject:v7];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v4);
  }

  id v10 = *(void **)(a1 + 40);
  id v14 = 0;
  char v11 = [v10 saveIfNecessary:&v14];
  id v12 = v14;
  if ((v11 & 1) == 0)
  {
    id v13 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __42__RCSavedRecordingsModel_eraseRecordings___block_invoke_cold_1();
    }
  }
}

- (void)deleteRecording:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"RCSavedRecordingsModel.m", 1063, @"Invalid parameter not satisfying: %@", @"recording != nil" object file lineNumber description];
  }
  v8[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [(RCSavedRecordingsModel *)self deleteRecordings:v6];
}

- (void)deleteRecordings:(id)a3
{
  id v4 = a3;
  context = self->_context;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__RCSavedRecordingsModel_deleteRecordings___block_invoke;
  v7[3] = &unk_1E6496350;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(NSManagedObjectContext *)context performBlockAndWait:v7];
}

void __43__RCSavedRecordingsModel_deleteRecordings___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v14 = a1;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * v7);
        id v9 = OSLogForCategory(@"Default");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v21 = "-[RCSavedRecordingsModel deleteRecordings:]_block_invoke";
          __int16 v22 = 2112;
          id v23 = v8;
          _os_log_debug_impl(&dword_1C3964000, v9, OS_LOG_TYPE_DEBUG, "%s -- deleting recording: %@", buf, 0x16u);
        }

        [v8 setDeletionDate:v2];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v5);
  }

  id v10 = *(void **)(v14 + 40);
  id v15 = 0;
  char v11 = [v10 saveIfNecessary:&v15];
  id v12 = v15;
  if ((v11 & 1) == 0)
  {
    id v13 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __43__RCSavedRecordingsModel_deleteRecordings___block_invoke_cold_1();
    }
  }
}

- (void)restoreDeletedRecording:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"RCSavedRecordingsModel.m", 1084, @"Invalid parameter not satisfying: %@", @"recording != nil" object file lineNumber description];
  }
  v8[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [(RCSavedRecordingsModel *)self restoreDeletedRecordings:v6];
}

- (void)restoreDeletedRecordings:(id)a3
{
  id v4 = a3;
  context = self->_context;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__RCSavedRecordingsModel_restoreDeletedRecordings___block_invoke;
  v7[3] = &unk_1E6496350;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(NSManagedObjectContext *)context performBlockAndWait:v7];
}

void __51__RCSavedRecordingsModel_restoreDeletedRecordings___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v16;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v15 + 1) + 8 * v5);
        uint64_t v7 = OSLogForCategory(@"Default");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          id v20 = "-[RCSavedRecordingsModel restoreDeletedRecordings:]_block_invoke";
          __int16 v21 = 2112;
          __int16 v22 = v6;
          _os_log_debug_impl(&dword_1C3964000, v7, OS_LOG_TYPE_DEBUG, "%s -- restoring recording: %@", buf, 0x16u);
        }

        [v6 setDeletionDate:0];
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v3);
  }

  id v8 = *(void **)(a1 + 40);
  id v14 = 0;
  char v9 = [v8 saveIfNecessary:&v14];
  id v10 = v14;
  char v11 = v10;
  if ((v9 & 1) == 0 && v10)
  {
    id v12 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __51__RCSavedRecordingsModel_restoreDeletedRecordings___block_invoke_cold_1();
    }
  }
}

- (void)eraseAllDeleted
{
  context = self->_context;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__RCSavedRecordingsModel_eraseAllDeleted__block_invoke;
  v3[3] = &unk_1E64963A0;
  v3[4] = self;
  [(NSManagedObjectContext *)context performBlockAndWait:v3];
}

void __41__RCSavedRecordingsModel_eraseAllDeleted__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[RCQueryManager allDeletedRecordingsFetchRequest];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) executeFetchRequest:v2 error:0];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        char v9 = [v8 url];
        +[RCComposition deleteFromFilesystem:v9];

        [*(id *)(*(void *)(a1 + 32) + 8) deleteObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  id v10 = *(void **)(a1 + 32);
  id v14 = 0;
  char v11 = [v10 saveIfNecessary:&v14];
  id v12 = v14;
  if ((v11 & 1) == 0)
  {
    id v13 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __41__RCSavedRecordingsModel_eraseAllDeleted__block_invoke_cold_1();
    }
  }
}

- (void)_copyPropertiesFromOriginalRecording:(id)a3 newRecording:(id)a4
{
  id v13 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 userFolderUUID];
  if (v7)
  {
    uint64_t v8 = [(RCSavedRecordingsModel *)self existingFolderWithUUID:v7];
    if (v8)
    {
      char v9 = (void *)v8;
      [(RCSavedRecordingsModel *)self addRecording:v13 toFolder:v8];
    }
  }
  [v13 copySharedFlagsFromOriginalRecording:v6];
  [v6 layerMix];
  int v11 = v10;

  LODWORD(v12) = v11;
  [v13 setLayerMix:v12];
}

- (id)duplicateRecording:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 creationDate];
  uint64_t v8 = [(RCSavedRecordingsModel *)self duplicateRecording:v6 copyingResources:1 creationDate:v7 error:a4];

  return v8;
}

- (id)duplicateRecording:(id)a3 copyingResources:(BOOL)a4 creationDate:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a5;
  if (!v11)
  {
    long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"RCSavedRecordingsModel.m", 1150, @"Invalid parameter not satisfying: %@", @"recording != nil" object file lineNumber description];
  }
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  double v35 = __Block_byref_object_copy__1;
  id v36 = __Block_byref_object_dispose__1;
  id v37 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__1;
  id v30 = __Block_byref_object_dispose__1;
  id v31 = 0;
  context = self->_context;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __81__RCSavedRecordingsModel_duplicateRecording_copyingResources_creationDate_error___block_invoke;
  v19[3] = &unk_1E6496788;
  id v14 = v11;
  BOOL v25 = a4;
  id v20 = v14;
  __int16 v21 = self;
  id v23 = &v32;
  uint64_t v24 = &v26;
  id v15 = v12;
  id v22 = v15;
  [(NSManagedObjectContext *)context performBlockAndWait:v19];
  if (a6) {
    *a6 = (id) v33[5];
  }
  id v16 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v16;
}

void __81__RCSavedRecordingsModel_duplicateRecording_copyingResources_creationDate_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) url];
  uint64_t v3 = [v2 path];

  uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v5 = [v4 UUIDString];
  if (*(unsigned char *)(a1 + 72))
  {
    id v6 = [*(id *)(a1 + 32) creationDate];
    uint64_t v7 = [v3 pathExtension];
    uint64_t v8 = +[RCSavedRecordingsModel standardPathForRecordingWithCreationDate:v6 uniqueID:v5 fileExtension:v7];

    char v9 = (const char *)[v3 fileSystemRepresentation];
    id v10 = v8;
    if (clonefile(v9, (const char *)[v10 fileSystemRepresentation], 0))
    {
      uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
      uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      goto LABEL_13;
    }
  }
  else
  {
    id v10 = 0;
  }
  id v14 = RCLocalizedFrameworkString(@"RECORDING_COPY_SUFFIX");
  id v15 = [*(id *)(a1 + 32) title];
  uint64_t v16 = [v15 rangeOfString:v14];
  if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
    [v15 stringByAppendingString:v14];
  }
  else {
  long long v18 = objc_msgSend(v15, "substringWithRange:", 0, v16 + v17);
  }

  long long v19 = *(void **)(a1 + 40);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __81__RCSavedRecordingsModel_duplicateRecording_copyingResources_creationDate_error___block_invoke_2;
  v26[3] = &unk_1E6496760;
  uint64_t v32 = *(void *)(a1 + 64);
  v26[4] = v19;
  id v10 = v10;
  id v27 = v10;
  id v28 = *(id *)(a1 + 32);
  id v29 = *(id *)(a1 + 48);
  id v20 = v18;
  id v30 = v20;
  id v31 = v5;
  [v19 performWithSavingDisabled:v26];
  [*(id *)(a1 + 40) _copyPropertiesFromOriginalRecording:*(void *)(a1 + 32) newRecording:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  __int16 v21 = *(void **)(a1 + 40);
  uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v22 + 40);
  char v23 = [v21 saveIfNecessary:&obj];
  objc_storeStrong((id *)(v22 + 40), obj);
  if ((v23 & 1) == 0)
  {
    uint64_t v24 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      __81__RCSavedRecordingsModel_duplicateRecording_copyingResources_creationDate_error___block_invoke_cold_1();
    }
  }
LABEL_13:
}

uint64_t __81__RCSavedRecordingsModel_duplicateRecording_copyingResources_creationDate_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  [*(id *)(a1 + 48) length];
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = objc_msgSend(v2, "insertRecordingWithAudioFile:duration:date:customTitleBase:uniqueID:", v3, *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72));
  return MEMORY[0x1F41817F8]();
}

- (void)mergeRecordings:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_2);
  id v6 = [(RCSavedRecordingsModel *)self _transactionsAndChangesForObjectIDs:v5];
  [MEMORY[0x1E4F28CB8] defaultManager];
  v39 = id v38 = v6;
  uint64_t v7 = [v6 count] - 1;
  if (v7 < 0)
  {
    id v33 = 0;
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v34 = v5;
    double v35 = v4;
    id v36 = 0;
    uint64_t v8 = 0;
    do
    {
      char v9 = [v38 objectAtIndexedSubscript:v7];
      id v10 = [v9 changes];

      uint64_t v11 = [v10 count];
      if (v11 - 1 >= 0)
      {
        uint64_t v12 = v11;
        while (1)
        {
          id v13 = [v10 objectAtIndexedSubscript:--v12];
          id v14 = [v13 changedObjectID];
          id v15 = [(RCSavedRecordingsModel *)self recordingWithID:v14];

          if ([v15 playable])
          {
            uint64_t v16 = [v15 url];
            uint64_t v17 = [v16 path];
            int v18 = [v39 fileExistsAtPath:v17];

            if (v18) {
              break;
            }
          }

          if (v12 <= 0) {
            goto LABEL_10;
          }
        }
        uint64_t v19 = [v15 objectID];

        id v20 = [v15 url];
        uint64_t v21 = [v20 path];

        uint64_t v8 = (void *)v21;
        id v36 = (void *)v19;
      }
LABEL_10:
    }
    while (v7-- > 0);
    if (v36)
    {
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __42__RCSavedRecordingsModel_mergeRecordings___block_invoke_2;
      v44[3] = &unk_1E64967D0;
      id v37 = v36;
      id v45 = v37;
      char v23 = objc_msgSend(v35, "na_filter:", v44);
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v41 != v26) {
              objc_enumerationMutation(v23);
            }
            id v28 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            id v29 = [v28 url];
            id v30 = [v29 path];
            char v31 = [v8 isEqualToString:v30];

            if (v31)
            {
              uint64_t v32 = [(RCSavedRecordingsModel *)self context];
              [v32 deleteObject:v28];

              [(RCSavedRecordingsModel *)self saveIfNecessary];
            }
            else
            {
              [(RCSavedRecordingsModel *)self eraseRecording:v28];
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v40 objects:v46 count:16];
        }
        while (v25);
      }

      uint64_t v5 = v34;
      id v4 = v35;
      id v33 = v37;
    }
    else
    {
      id v33 = 0;
      uint64_t v5 = v34;
      id v4 = v35;
    }
  }
}

uint64_t __42__RCSavedRecordingsModel_mergeRecordings___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

uint64_t __42__RCSavedRecordingsModel_mergeRecordings___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 objectID];
  uint64_t v4 = [v2 isEqual:v3] ^ 1;

  return v4;
}

- (id)_recordingsForFolderUUID:(id)a3
{
  uint64_t v4 = +[RCQueryManager recordingsInFolderFetchRequest:a3];
  context = self->_context;
  id v11 = 0;
  id v6 = [(NSManagedObjectContext *)context executeFetchRequest:v4 error:&v11];
  id v7 = v11;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    char v9 = OSLogForCategory(@"Service");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[RCSavedRecordingsModel _recordingsForFolderUUID:]();
    }

    id v8 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (void)_mergeFolders:(id)a3 intoTargetFolder:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v13 = [v12 uuid];
        id v14 = [(RCSavedRecordingsModel *)self _recordingsForFolderUUID:v13];

        if ([v14 count]) {
          [(RCSavedRecordingsModel *)self addRecordings:v14 toFolder:v7];
        }
        [(RCSavedRecordingsModel *)self deleteFolder:v12];
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (BOOL)_mergeDuplicateUUIDFolders:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)[v4 count] >= 2)
  {
    id v6 = objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(v6, "addObject:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v29 count:16];
      }
      while (v9);
    }

    unint64_t v12 = [v6 count];
    BOOL v5 = v12 > 1;
    if (v12 >= 2)
    {
      id v13 = [v6 lastObject];
      id v14 = OSLogForCategory(@"Service");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        long long v15 = [v13 name];
        long long v16 = [v13 uuid];
        *(_DWORD *)buf = 136315650;
        uint64_t v24 = "-[RCSavedRecordingsModel _mergeDuplicateUUIDFolders:]";
        __int16 v25 = 2112;
        uint64_t v26 = v15;
        __int16 v27 = 2112;
        id v28 = v16;
        _os_log_impl(&dword_1C3964000, v14, OS_LOG_TYPE_DEFAULT, "%s -- merging duplicate uuid user folder %@ - uuid = %@", buf, 0x20u);
      }
      long long v17 = objc_msgSend(v6, "subarrayWithRange:", 0, objc_msgSend(v6, "count") - 1);
      [(RCSavedRecordingsModel *)self _mergeFolders:v17 intoTargetFolder:v13];
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_mergeDuplicateNameFoldersWithName:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = +[RCQueryManager foldersWithNameFetchRequest:a3 searchOption:0];
  BOOL v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"countOfRecordings" ascending:1];
  v21[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [v4 setSortDescriptors:v6];

  context = self->_context;
  id v16 = 0;
  uint64_t v8 = [(NSManagedObjectContext *)context executeFetchRequest:v4 error:&v16];
  id v9 = v16;
  unint64_t v10 = [v8 count];
  if (v10 >= 2)
  {
    id v11 = [v8 lastObject];
    unint64_t v12 = OSLogForCategory(@"Service");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v11 name];
      *(_DWORD *)buf = 136315394;
      long long v18 = "-[RCSavedRecordingsModel _mergeDuplicateNameFoldersWithName:]";
      __int16 v19 = 2112;
      long long v20 = v13;
      _os_log_impl(&dword_1C3964000, v12, OS_LOG_TYPE_DEFAULT, "%s -- merging duplicate named user folder %@", buf, 0x16u);
    }
    id v14 = objc_msgSend(v8, "subarrayWithRange:", 0, objc_msgSend(v8, "count") - 1);
    [(RCSavedRecordingsModel *)self _mergeFolders:v14 intoTargetFolder:v11];
  }
  return v10 > 1;
}

- (void)_rerankFolders
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- fetch request failed - error: %@", v2, v3, v4, v5, 2u);
}

- (void)reconcileChangedFolder:(id)a3 change:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self->_context;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__RCSavedRecordingsModel_reconcileChangedFolder_change___block_invoke;
  void v12[3] = &unk_1E64967F8;
  id v13 = v7;
  id v14 = v8;
  id v15 = v6;
  id v16 = self;
  id v9 = v6;
  unint64_t v10 = v8;
  id v11 = v7;
  [(NSManagedObjectContext *)v10 performBlockAndWait:v12];
}

void __56__RCSavedRecordingsModel_reconcileChangedFolder_change___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) changeType];
  if (v2 != 2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = [*(id *)(a1 + 40) existingObjectWithID:*(void *)(a1 + 48) error:0];
    uint64_t v5 = v4;
    if (v4)
    {
      if (!v3)
      {
        id v6 = *(void **)(a1 + 56);
        id v7 = [v4 uuid];
        uint64_t v8 = [v6 _foldersWithUUID:v7];

        if ([*(id *)(a1 + 56) _mergeDuplicateUUIDFolders:v8]) {
          [*(id *)(a1 + 56) saveIfNecessary];
        }
      }
      id v9 = *(void **)(a1 + 56);
      unint64_t v10 = [v5 name];
      LODWORD(v9) = [v9 _mergeDuplicateNameFoldersWithName:v10];

      if (v9)
      {
        [*(id *)(a1 + 56) _rerankFolders];
        [*(id *)(a1 + 56) saveIfNecessary];
      }
      else
      {
        id v11 = +[RCQueryManager foldersWithhRankFetchRequest:](RCQueryManager, "foldersWithhRankFetchRequest:", [v5 rank]);
        unint64_t v12 = *(void **)(a1 + 40);
        id v16 = 0;
        id v13 = [v12 executeFetchRequest:v11 error:&v16];
        id v14 = v16;
        if (v13)
        {
          if ((unint64_t)[v13 count] >= 2)
          {
            [*(id *)(a1 + 56) _rerankFolders];
            [*(id *)(a1 + 56) saveIfNecessary];
          }
        }
        else
        {
          id v15 = OSLogForCategory(@"Orphan-Handling");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            __56__RCSavedRecordingsModel_reconcileChangedFolder_change___block_invoke_cold_1();
          }
        }
      }
    }
  }
}

- (void)saveIfNecessary
{
}

- (BOOL)__saveManagedObjectContext:(id *)a3
{
  BOOL v3 = 0;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  int64_t isSavingDisabledCount = self->_isSavingDisabledCount;
  if (isSavingDisabledCount <= 0)
  {
    self->_int64_t isSavingDisabledCount = isSavingDisabledCount + 1;
    uint64_t v11 = 0;
    unint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__1;
    id v15 = __Block_byref_object_dispose__1;
    id v16 = 0;
    context = self->_context;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__RCSavedRecordingsModel___saveManagedObjectContext___block_invoke;
    v10[3] = &unk_1E6496820;
    void v10[4] = self;
    void v10[5] = &v17;
    v10[6] = &v11;
    [(NSManagedObjectContext *)context performBlockAndWait:v10];
    int v8 = *((unsigned __int8 *)v18 + 24);
    if (a3 && !*((unsigned char *)v18 + 24))
    {
      *a3 = (id) v12[5];
      int v8 = *((unsigned __int8 *)v18 + 24);
    }
    --self->_isSavingDisabledCount;
    _Block_object_dispose(&v11, 8);

    BOOL v3 = v8 != 0;
  }
  _Block_object_dispose(&v17, 8);
  return v3;
}

void __53__RCSavedRecordingsModel___saveManagedObjectContext___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _synchronizeRecordingsMetadata];
  [*(id *)(*(void *)(a1 + 32) + 8) processPendingChanges];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  char v4 = [v2 save:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v5 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __53__RCSavedRecordingsModel___saveManagedObjectContext___block_invoke_cold_1();
    }

    [*(id *)(*(void *)(a1 + 32) + 8) rollback];
  }
}

- (void)_synchronizeRecordingsMetadata
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v2 = [(NSManagedObjectContext *)self->_context updatedObjects];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        int v8 = [v7 entity];
        id v9 = [v8 name];
        int v10 = [v9 isEqualToString:@"CloudRecording"];

        if (v10)
        {
          uint64_t v11 = [v7 changedValues];
          unint64_t v12 = [v11 objectForKeyedSubscript:@"customLabelForSorting"];

          if (v12) {
            [v7 synchronizeRecordingMetadata];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

- (void)performWithSavingDisabled:(id)a3
{
}

+ (id)_copyFileIntoRecordingsDirectory:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = a3;
  uint64_t v5 = [v3 fileURLWithPath:v4];
  id v16 = 0;
  [v5 getResourceValue:&v16 forKey:*MEMORY[0x1E4F1C540] error:0];
  id v6 = v16;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v8 = [v4 pathExtension];

  id v9 = +[RCSavedRecordingsModel standardURLForRecordingWithCreationDate:v6 fileExtension:v8];
  int v10 = objc_msgSend(v7, "rc_uniqueFileSystemURLWithPreferredURL:", v9);

  id v15 = 0;
  LOBYTE(v8) = [v7 copyItemAtURL:v5 toURL:v10 error:&v15];
  id v11 = v15;
  if ((v8 & 1) == 0)
  {
    unint64_t v12 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[RCSavedRecordingsModel _copyFileIntoRecordingsDirectory:]();
    }

    int v10 = 0;
  }
  long long v13 = [v10 path];

  return v13;
}

- (BOOL)resetCloudForStore:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  context = self->_context;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__RCSavedRecordingsModel_resetCloudForStore_completionHandler___block_invoke;
  void v12[3] = &unk_1E64968B8;
  void v12[4] = self;
  id v9 = v7;
  id v14 = v9;
  id v10 = v6;
  id v13 = v10;
  id v15 = &v16;
  [(NSManagedObjectContext *)context performBlockAndWait:v12];
  LOBYTE(v6) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v6;
}

void __63__RCSavedRecordingsModel_resetCloudForStore_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C098]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __63__RCSavedRecordingsModel_resetCloudForStore_completionHandler___block_invoke_2;
  v8[3] = &unk_1E6496890;
  v8[4] = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 48);
  uint64_t v3 = (void *)[v2 initWithOptions:0 completionBlock:v8];
  objc_msgSend(v3, "rc_setAffectedStore:", *(void *)(a1 + 40));
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v7 = 0;
  uint64_t v5 = [v4 executeRequest:v3 error:&v7];
  id v6 = v7;
  if (!v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

void __63__RCSavedRecordingsModel_resetCloudForStore_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 8);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __63__RCSavedRecordingsModel_resetCloudForStore_completionHandler___block_invoke_3;
  v8[3] = &unk_1E6496868;
  id v9 = v3;
  uint64_t v10 = v4;
  id v6 = *(id *)(a1 + 40);
  id v11 = v3;
  id v12 = v6;
  id v7 = v3;
  [v5 performBlock:v8];
}

void __63__RCSavedRecordingsModel_resetCloudForStore_completionHandler___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) madeChanges]) {
    [*(id *)(a1 + 40) enumerateExistingRecordingsWithBlock:&__block_literal_global_134];
  }
  uint64_t v4 = a1 + 48;
  id v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void *)(v4 + 8);
  id v5 = [v2 error];
  (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v2, v5);
}

- (BOOL)exportToCloudForStore:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  context = self->_context;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__RCSavedRecordingsModel_exportToCloudForStore_completionHandler___block_invoke;
  void v12[3] = &unk_1E6496908;
  id v9 = v7;
  id v15 = v9;
  id v10 = v6;
  id v13 = v10;
  id v14 = self;
  uint64_t v16 = &v17;
  [(NSManagedObjectContext *)context performBlockAndWait:v12];
  LOBYTE(self) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)self;
}

void __66__RCSavedRecordingsModel_exportToCloudForStore_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C070]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __66__RCSavedRecordingsModel_exportToCloudForStore_completionHandler___block_invoke_2;
  v8[3] = &unk_1E64968E0;
  id v9 = *(id *)(a1 + 48);
  uint64_t v3 = (void *)[v2 initWithOptions:0 completionBlock:v8];
  objc_msgSend(v3, "rc_setAffectedStore:", *(void *)(a1 + 32));
  uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 8);
  id v7 = 0;
  id v5 = [v4 executeRequest:v3 error:&v7];
  id v6 = v7;
  if (!v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

void __66__RCSavedRecordingsModel_exportToCloudForStore_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 error];
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v3, v4);
}

- (BOOL)importFromCloudForStore:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  context = self->_context;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__RCSavedRecordingsModel_importFromCloudForStore_completionHandler___block_invoke;
  void v12[3] = &unk_1E6496908;
  id v9 = v7;
  id v15 = v9;
  id v10 = v6;
  id v13 = v10;
  id v14 = self;
  uint64_t v16 = &v17;
  [(NSManagedObjectContext *)context performBlockAndWait:v12];
  LOBYTE(self) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)self;
}

void __68__RCSavedRecordingsModel_importFromCloudForStore_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C080]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __68__RCSavedRecordingsModel_importFromCloudForStore_completionHandler___block_invoke_2;
  v8[3] = &unk_1E64968E0;
  id v9 = *(id *)(a1 + 48);
  id v3 = (void *)[v2 initWithOptions:0 completionBlock:v8];
  objc_msgSend(v3, "rc_setAffectedStore:", *(void *)(a1 + 32));
  id v4 = *(void **)(*(void *)(a1 + 40) + 8);
  id v7 = 0;
  id v5 = [v4 executeRequest:v3 error:&v7];
  id v6 = v7;
  if (!v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

void __68__RCSavedRecordingsModel_importFromCloudForStore_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 error];
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v3, v4);
}

- (BOOL)fetchObjectsFromCloud:(id)a3 entityToAttributesToFetch:(id)a4 forStore:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  context = self->_context;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __101__RCSavedRecordingsModel_fetchObjectsFromCloud_entityToAttributesToFetch_forStore_completionHandler___block_invoke;
  v20[3] = &unk_1E6496930;
  id v15 = v13;
  id v25 = v15;
  id v16 = v10;
  id v21 = v16;
  id v17 = v11;
  id v22 = v17;
  id v18 = v12;
  id v23 = v18;
  uint64_t v24 = self;
  uint64_t v26 = &v27;
  [(NSManagedObjectContext *)context performBlockAndWait:v20];
  LOBYTE(self) = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return (char)self;
}

void __101__RCSavedRecordingsModel_fetchObjectsFromCloud_entityToAttributesToFetch_forStore_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C078]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __101__RCSavedRecordingsModel_fetchObjectsFromCloud_entityToAttributesToFetch_forStore_completionHandler___block_invoke_2;
  v9[3] = &unk_1E64968E0;
  id v10 = *(id *)(a1 + 64);
  id v3 = (void *)[v2 initWithOptions:0 completionBlock:v9];
  [v3 setObjectIDsToFetch:*(void *)(a1 + 32)];
  [v3 setEntityNameToAttributesToFetch:*(void *)(a1 + 40)];
  objc_msgSend(v3, "rc_setAffectedStore:", *(void *)(a1 + 48));
  id v4 = *(void **)(*(void *)(a1 + 56) + 8);
  id v8 = 0;
  id v5 = [v4 executeRequest:v3 error:&v8];
  id v6 = v8;
  if (v5)
  {
    char v7 = 1;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    char v7 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v7;
}

void __101__RCSavedRecordingsModel_fetchObjectsFromCloud_entityToAttributesToFetch_forStore_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 error];
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v3, v4);
}

- (BOOL)fetchExportProgress:(id)a3 forStore:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  context = self->_context;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__RCSavedRecordingsModel_fetchExportProgress_forStore_completionHandler___block_invoke;
  v16[3] = &unk_1E6496958;
  id v12 = v10;
  id v20 = v12;
  id v13 = v8;
  id v17 = v13;
  id v14 = v9;
  id v18 = v14;
  uint64_t v19 = self;
  id v21 = &v22;
  [(NSManagedObjectContext *)context performBlockAndWait:v16];
  LOBYTE(self) = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return (char)self;
}

void __73__RCSavedRecordingsModel_fetchExportProgress_forStore_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C060]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__RCSavedRecordingsModel_fetchExportProgress_forStore_completionHandler___block_invoke_2;
  v10[3] = &unk_1E64968E0;
  id v11 = *(id *)(a1 + 56);
  id v3 = (void *)[v2 initWithOptions:0 completionBlock:v10];
  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 32)];
  [v3 setObjectIDsToFetch:v4];

  objc_msgSend(v3, "rc_setAffectedStore:", *(void *)(a1 + 40));
  id v5 = *(void **)(*(void *)(a1 + 48) + 8);
  id v9 = 0;
  id v6 = [v5 executeRequest:v3 error:&v9];
  id v7 = v9;
  if (v6)
  {
    char v8 = 1;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    char v8 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v8;
}

void __73__RCSavedRecordingsModel_fetchExportProgress_forStore_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 error];
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v3, v4);
}

- (id)objectIDsForRecordingsNeedingAssetExport
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__1;
  id v14 = __Block_byref_object_dispose__1;
  id v15 = 0;
  id v3 = +[RCQueryManager recordingsNeedingAssetExportFetchRequest];
  [v3 setResultType:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__RCSavedRecordingsModel_objectIDsForRecordingsNeedingAssetExport__block_invoke;
  v7[3] = &unk_1E64963C8;
  id v9 = &v10;
  void v7[4] = self;
  id v4 = v3;
  id v8 = v4;
  [(RCSavedRecordingsModel *)self performBlockAndWait:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __66__RCSavedRecordingsModel_objectIDsForRecordingsNeedingAssetExport__block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  id v3 = *(void **)(a1[4] + 8);
  id v11 = 0;
  uint64_t v4 = [v3 executeFetchRequest:v2 error:&v11];
  id v5 = v11;
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    id v8 = OSLogForCategory(@"Service");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __66__RCSavedRecordingsModel_objectIDsForRecordingsNeedingAssetExport__block_invoke_cold_1();
    }

    uint64_t v9 = *(void *)(a1[6] + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = MEMORY[0x1E4F1CBF0];
  }
}

- (unint64_t)fetchPlayableRecordingsCount
{
  id v3 = +[RCQueryManager playableRecordingsFetchRequestWithSubPredicate:0];
  unint64_t v4 = [(RCSavedRecordingsModel *)self _countForFetchRequest:v3];

  return v4;
}

- (id)createEncryptedFieldsMigration:(int)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__1;
  uint64_t v12 = __Block_byref_object_dispose__1;
  id v13 = 0;
  context = self->_context;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__RCSavedRecordingsModel_createEncryptedFieldsMigration___block_invoke;
  v6[3] = &unk_1E6496980;
  int v7 = a3;
  void v6[4] = self;
  v6[5] = &v8;
  [(NSManagedObjectContext *)context performBlockAndWait:v6];
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

uint64_t __57__RCSavedRecordingsModel_createEncryptedFieldsMigration___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[RCMigration createEncryptedFieldsMigration:*(unsigned int *)(a1 + 48) context:*(void *)(*(void *)(a1 + 32) + 8)];
  return MEMORY[0x1F41817F8]();
}

- (BOOL)encryptedFieldsMigrationExists
{
  id v3 = +[RCQueryManager encryptedFieldsMigrationsFetchRequest];
  [v3 setFetchLimit:1];
  LOBYTE(self) = [(RCSavedRecordingsModel *)self _countForFetchRequest:v3] != 0;

  return (char)self;
}

- (id)encryptedFieldMigrations
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__1;
  uint64_t v9 = __Block_byref_object_dispose__1;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__RCSavedRecordingsModel_encryptedFieldMigrations__block_invoke;
  v4[3] = &unk_1E64963F0;
  v4[4] = self;
  void v4[5] = &v5;
  [(RCSavedRecordingsModel *)self performBlockAndWait:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __50__RCSavedRecordingsModel_encryptedFieldMigrations__block_invoke(uint64_t a1)
{
  id v2 = +[RCQueryManager encryptedFieldsMigrationsFetchRequest];
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v11 = 0;
  uint64_t v4 = [v3 executeFetchRequest:v2 error:&v11];
  id v5 = v11;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v8 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __50__RCSavedRecordingsModel_encryptedFieldMigrations__block_invoke_cold_1();
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = MEMORY[0x1E4F1CBF0];
  }
}

- (id)recordingsWithNilEncryptedTitleOrCustomLabel
{
  id v3 = +[RCQueryManager recordingsWithNilEncryptedTitleOrCustomLabelFetchRequest];
  uint64_t v4 = [(RCSavedRecordingsModel *)self _recordingsWithFetchRequest:v3];

  return v4;
}

- (id)recordingsWithNilAudioFutures
{
  id v3 = +[RCQueryManager recordingsWithNilAudioFuturesFetchRequest];
  uint64_t v4 = [(RCSavedRecordingsModel *)self _recordingsWithFetchRequest:v3];

  return v4;
}

- (id)_recordingsWithFetchRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  char v25 = __Block_byref_object_copy__1;
  uint64_t v26 = __Block_byref_object_dispose__1;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__1;
  id v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  context = self->_context;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__RCSavedRecordingsModel__recordingsWithFetchRequest_error___block_invoke;
  void v12[3] = &unk_1E64969A8;
  id v14 = &v22;
  void v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v15 = &v16;
  [(NSManagedObjectContext *)context performBlockAndWait:v12];
  uint64_t v9 = (void *)v23[5];
  if (a4 && !v9)
  {
    *a4 = (id) v17[5];
    uint64_t v9 = (void *)v23[5];
  }
  id v10 = v9;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __60__RCSavedRecordingsModel__recordingsWithFetchRequest_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  id v3 = *(void **)(a1[4] + 8);
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v3 executeFetchRequest:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)_recordingsWithFetchRequest:(id)a3
{
  id v4 = a3;
  id v11 = 0;
  uint64_t v5 = [(RCSavedRecordingsModel *)self _recordingsWithFetchRequest:v4 error:&v11];
  id v6 = v11;
  uint64_t v7 = v5;
  if (!v5)
  {
    id v8 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[RCSavedRecordingsModel _recordingsWithFetchRequest:]();
    }

    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v9 = v7;

  return v9;
}

- (id)recordingsWithTitle:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__1;
  id v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__RCSavedRecordingsModel_recordingsWithTitle___block_invoke;
  v9[3] = &unk_1E6496418;
  id v5 = v4;
  id v11 = self;
  uint64_t v12 = &v13;
  id v10 = v5;
  [(RCSavedRecordingsModel *)self performBlockAndWait:v9];
  id v6 = (void *)v14[5];
  if (!v6) {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = v6;

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __46__RCSavedRecordingsModel_recordingsWithTitle___block_invoke(void *a1)
{
  uint64_t v2 = +[RCQueryManager recordingsWithTitleFetchRequest:a1[4]];
  id v3 = *(void **)(a1[5] + 8);
  id v9 = 0;
  uint64_t v4 = [v3 executeFetchRequest:v2 error:&v9];
  id v5 = v9;
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    id v8 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __46__RCSavedRecordingsModel_recordingsWithTitle___block_invoke_cold_1();
    }
  }
}

- (id)visibleRecordingsFetchedResultsController
{
  id v3 = +[RCQueryManager visibleRecordingsFetchRequest];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C0F0]) initWithFetchRequest:v3 managedObjectContext:self->_context sectionNameKeyPath:0 cacheName:0];

  return v4;
}

- (id)userFoldersFetchedResultsController
{
  id v3 = [(RCSavedRecordingsModel *)self _userFolderFetchRequest];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C0F0]) initWithFetchRequest:v3 managedObjectContext:self->_context sectionNameKeyPath:0 cacheName:0];

  return v4;
}

- (id)insertRecordingWithAudioFile:(id)a3 duration:(double)a4 date:(id)a5
{
  return [(RCSavedRecordingsModel *)self insertRecordingWithAudioFile:a3 duration:a5 date:0 customLabelBase:a4];
}

- (int64_t)isSavingDisabledCount
{
  return self->_isSavingDisabledCount;
}

- (void)setIsSavingDisabledCount:(int64_t)a3
{
  self->_int64_t isSavingDisabledCount = a3;
}

- (void)recordingWithID:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- ERROR: Unable to fetch recording (%@.)", v2, v3, v4, v5, 2u);
}

void __90__RCSavedRecordingsModel_enumerateExistingRecordingsWithProperties_sortDescriptors_block___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- ERROR: Unable to fetch recordings (%@.)", v2, v3, v4, v5, 2u);
}

void __61__RCSavedRecordingsModel__transactionsAndChangesWithRequest___block_invoke_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1C3964000, v0, v1, "%s -- ERROR: Unable to fetch change history (%@.), request = %@", v2);
}

void __61__RCSavedRecordingsModel__transactionsAndChangesWithRequest___block_invoke_cold_2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1C3964000, v0, v1, "%s -- ERROR: Unexpected result type - result = %@, request = %@", v2);
}

+ (void)_determineImportabilityOfRecordingWithAudioAsset:(void *)a1 preferredFormat:completionHandler:.cold.1(void *a1)
{
  os_log_t v1 = [a1 path];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_1C3964000, v2, v3, "%s -- ERROR: import disallowed because audioURL '%@' duration is 0.0", v4, v5, v6, v7, 2u);
}

void __109__RCSavedRecordingsModel__determineImportabilityOfRecordingWithAudioAsset_preferredFormat_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  os_log_t v1 = [*(id *)(a1 + 40) path];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_1C3964000, v2, v3, "%s -- ERROR: import disallowed because audioURL '%@' can not be exported by AVFoundation.", v4, v5, v6, v7, 2u);
}

+ (void)determineImportabilityOfRecordingWithAudioURL:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- Failed to load playable asset for URL: %@", v2, v3, v4, v5, 2u);
}

- (void)importRecordingWithSourceAudioURL:name:date:xpcConnection:userInfo:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- could not import Music Memo with conflicting uniqueID = %@", v2, v3, v4, v5, 2u);
}

void __111__RCSavedRecordingsModel_importRecordingWithSourceAudioURL_name_date_xpcConnection_userInfo_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- updateError = %@", v2, v3, v4, v5, 2u);
}

void __114__RCSavedRecordingsModel__importRecordingWithSourceAudioURL_name_date_uniqueID_preferredFormat_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- removeError = %@", v2, v3, v4, v5, 2u);
}

- (void)_importImportableRecordingWithAudioAsset:(uint8_t *)buf name:(os_log_t)log date:uniqueID:presetName:outputFileType:completionHandler:.cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315650;
  *(void *)(buf + 4) = "-[RCSavedRecordingsModel _importImportableRecordingWithAudioAsset:name:date:uniqueID:presetName"
                         ":outputFileType:completionHandler:]";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2112;
  *((void *)buf + 3) = a2;
  _os_log_debug_impl(&dword_1C3964000, log, OS_LOG_TYPE_DEBUG, "%s -- Preparing asset %@ (exporting to %@) for import...", buf, 0x20u);
}

void __130__RCSavedRecordingsModel__importImportableRecordingWithAudioAsset_name_date_uniqueID_presetName_outputFileType_completionHandler___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = *a1;
  int v6 = [*a1 status];
  int v7 = 136315906;
  id v8 = "-[RCSavedRecordingsModel _importImportableRecordingWithAudioAsset:name:date:uniqueID:presetName:outputFileType:co"
       "mpletionHandler:]_block_invoke";
  __int16 v9 = 2112;
  id v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  __int16 v13 = 1024;
  int v14 = v6;
  _os_log_error_impl(&dword_1C3964000, a3, OS_LOG_TYPE_ERROR, "%s -- ERROR: Unable to prepare asset %@ for import with underlying error = %@, exportSession.status = %d", (uint8_t *)&v7, 0x26u);
}

void __130__RCSavedRecordingsModel__importImportableRecordingWithAudioAsset_name_date_uniqueID_presetName_outputFileType_completionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  v4[0] = 136315650;
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1C3964000, a2, OS_LOG_TYPE_DEBUG, "%s -- Finished preparing asset %@ (exported to %@) for import...", (uint8_t *)v4, 0x20u);
}

void __41__RCSavedRecordingsModel_folderWithName___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- obtainPermanentIDsForObjects failed %@", v2, v3, v4, v5, 2u);
}

void __48__RCSavedRecordingsModel__countForFetchRequest___block_invoke_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1C3964000, v0, v1, "%s -- countForFetchRequest failed with error = %@, fetchRequest = %@", v2);
}

void __37__RCSavedRecordingsModel_userFolders__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- executeFetchRequest error = %@", v2, v3, v4, v5, 2u);
}

void __49__RCSavedRecordingsModel_existingFolderWithUUID___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __39__RCSavedRecordingsModel_deleteFolder___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1C3964000, v0, v1, "%s -- Error deleting folder: %@", v2, v3, v4, v5, 2u);
}

void __39__RCSavedRecordingsModel_deleteFolder___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1C3964000, v0, v1, "%s -- deleting folder: %@", v2, v3, v4, v5, 2u);
}

void __42__RCSavedRecordingsModel_eraseRecordings___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1C3964000, v0, v1, "%s -- Error erasing recordings: %@", v2, v3, v4, v5, 2u);
}

void __43__RCSavedRecordingsModel_deleteRecordings___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1C3964000, v0, v1, "%s -- Error deleting recordings: %@", v2, v3, v4, v5, 2u);
}

void __51__RCSavedRecordingsModel_restoreDeletedRecordings___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1C3964000, v0, v1, "%s -- Error restoring recordings: %@", v2, v3, v4, v5, 2u);
}

void __59__RCSavedRecordingsModel_eraseRecordingsDeletedBeforeDate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1C3964000, v0, v1, "%s -- Error restoring recording: %@", v2, v3, v4, v5, 2u);
}

void __41__RCSavedRecordingsModel_eraseAllDeleted__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1C3964000, v0, v1, "%s -- Error deleting all recordings: %@", v2, v3, v4, v5, 2u);
}

void __81__RCSavedRecordingsModel_duplicateRecording_copyingResources_creationDate_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- Error duplicating recording: %@", v2, v3, v4, v5, 2u);
}

- (void)_recordingsForFolderUUID:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- fetch request failed - error: %@", v2, v3, v4, v5, 2u);
}

void __56__RCSavedRecordingsModel_reconcileChangedFolder_change___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- fetchError = %@", v2, v3, v4, v5, 2u);
}

void __53__RCSavedRecordingsModel___saveManagedObjectContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x1E4F143B8]);
  v1[0] = 136315394;
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_1C3964000, v0, OS_LOG_TYPE_FAULT, "%s -- ERROR: Attempt to save database failed, possibly due to an entity with an invalid value.  Core Data error = %@", (uint8_t *)v1, 0x16u);
}

+ (void)_copyFileIntoRecordingsDirectory:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- Warning: Could not copy audio file to recordings directory. %@", v2, v3, v4, v5, 2u);
}

void __66__RCSavedRecordingsModel_objectIDsForRecordingsNeedingAssetExport__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- fetch request failed - error: %@", v2, v3, v4, v5, 2u);
}

void __50__RCSavedRecordingsModel_encryptedFieldMigrations__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- Failed to fetch migrations, error = %@", v2, v3, v4, v5, 2u);
}

- (void)_recordingsWithFetchRequest:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_1C3964000, v0, v1, "%s -- Recordings fetch request failed - error = %@, fetch request = %@", v2);
}

void __46__RCSavedRecordingsModel_recordingsWithTitle___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- Failed to executeFetchRequest %@", v2, v3, v4, v5, 2u);
}

@end