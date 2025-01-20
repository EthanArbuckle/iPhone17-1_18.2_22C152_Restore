@interface PLMigrationHistory
+ (BOOL)currentMigrationHistoryIndex:(int64_t *)a3 withManagedObjectContext:(id)a4 error:(id *)a5;
+ (BOOL)recordCurrentMigrationStateInManagedObjectContext:(id)a3 withPathManager:(id)a4 migrationType:(int64_t)a5 forceRebuildReason:(id)a6 sourceModelVersion:(id)a7 updateLegacyMigrationState:(BOOL)a8 journalRebuildRequred:(BOOL)a9 origin:(signed __int16)a10 libraryCreateOptions:(unint64_t)a11 hardwareModel:(id)a12 deviceUniqueID:(id)a13 cplEnabled:(BOOL)a14 initialSyncDate:(id)a15;
+ (id)currentMigrationHistoryWithManagedObjectContext:(id)a3;
+ (id)entityName;
+ (id)insertCreatedWithManagedObjectContext:(id)a3 index:(int64_t)a4 migrationDate:(id)a5 hardwareModel:(id)a6 deviceUniqueID:(id)a7 cplEnabled:(BOOL)a8 initialSyncDate:(id)a9;
+ (id)insertIntoManagedObjectContext:(id)a3 index:(int64_t)a4 sourceModelVersion:(id)a5 migrationType:(int64_t)a6 migrationDate:(id)a7 forceRebuildReason:(id)a8 hardwareModel:(id)a9 deviceUniqueID:(id)a10 cplEnabled:(BOOL)a11 initialSyncDate:(id)a12;
+ (id)insertLightweightWithManagedObjectContext:(id)a3 index:(int64_t)a4 sourceModelVersion:(unint64_t)a5 migrationDate:(id)a6 hardwareModel:(id)a7 deviceUniqueID:(id)a8 cplEnabled:(BOOL)a9 initialSyncDate:(id)a10;
+ (id)insertNoopWithManagedObjectContext:(id)a3 index:(int64_t)a4 migrationDate:(id)a5 hardwareModel:(id)a6 deviceUniqueID:(id)a7 cplEnabled:(BOOL)a8 initialSyncDate:(id)a9;
+ (id)insertRebuildWithManagedObjectContext:(id)a3 index:(int64_t)a4 migrationDate:(id)a5 forceRebuildReason:(id)a6 hardwareModel:(id)a7 deviceUniqueID:(id)a8 cplEnabled:(BOOL)a9 initialSyncDate:(id)a10;
+ (id)migrateLegacyMigrationHistoryWithMetadata:(id)a3 index:(int64_t)a4 outGlobalKeyValues:(id)a5 managedObjectContext:(id)a6;
+ (id)migrationHistoryWithManagedObjectContext:(id)a3;
+ (int64_t)_rebuildMigrationHistoryWithJournal:(id)a3 managedObjectContext:(id)a4;
+ (void)initialize;
- (BOOL)supportsCloudUpload;
- (id)payloadForChangedKeys:(id)a3;
- (id)payloadID;
- (id)payloadIDForTombstone:(id)a3;
@end

@implementation PLMigrationHistory

- (BOOL)supportsCloudUpload
{
  return 0;
}

+ (int64_t)_rebuildMigrationHistoryWithJournal:(id)a3 managedObjectContext:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = -1;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __79__PLMigrationHistory__rebuildMigrationHistoryWithJournal_managedObjectContext___block_invoke;
  v19[3] = &unk_1E5863F28;
  id v7 = v6;
  id v20 = v7;
  v21 = &v22;
  id v18 = 0;
  char v8 = [v5 enumeratePayloadsUsingBlock:v19 error:&v18];
  id v9 = v18;
  v10 = v9;
  if (v8)
  {
    id v11 = v9;
    goto LABEL_13;
  }
  if (!PLIsErrorEqualToCode())
  {
    v14 = PLMigrationGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v27 = "+[PLMigrationHistory _rebuildMigrationHistoryWithJournal:managedObjectContext:]";
      __int16 v28 = 2112;
      id v29 = v10;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to read MigrationHistory journal: %{public}s, %@", buf, 0x16u);
    }
    id v11 = v10;
    goto LABEL_12;
  }
  v12 = PLMigrationGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v27 = "+[PLMigrationHistory _rebuildMigrationHistoryWithJournal:managedObjectContext:]";
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Not rebuilding MigrationHistory due to too new payload version in the journal: %{public}s, %@", buf, 0x16u);
  }

  id v17 = v10;
  char v13 = [v5 createSnapshotUsingNextPayloadBlock:&__block_literal_global_8317 createOnlyIfNecessary:0 error:&v17];
  id v11 = v17;

  if ((v13 & 1) == 0)
  {
    v14 = PLMigrationGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v27 = "+[PLMigrationHistory _rebuildMigrationHistoryWithJournal:managedObjectContext:]";
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to snapshot empty MigrationHistory journal: %{public}s, %@", buf, 0x16u);
    }
LABEL_12:
  }
LABEL_13:

  int64_t v15 = v23[3];
  _Block_object_dispose(&v22, 8);

  return v15;
}

void __79__PLMigrationHistory__rebuildMigrationHistoryWithJournal_managedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 insertMigrationHistoryFromDataInManagedObjectContext:*(void *)(a1 + 32)];
  if ([v3 index] > *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 index];
  }
}

uint64_t __79__PLMigrationHistory__rebuildMigrationHistoryWithJournal_managedObjectContext___block_invoke_89()
{
  return 0;
}

+ (BOOL)recordCurrentMigrationStateInManagedObjectContext:(id)a3 withPathManager:(id)a4 migrationType:(int64_t)a5 forceRebuildReason:(id)a6 sourceModelVersion:(id)a7 updateLegacyMigrationState:(BOOL)a8 journalRebuildRequred:(BOOL)a9 origin:(signed __int16)a10 libraryCreateOptions:(unint64_t)a11 hardwareModel:(id)a12 deviceUniqueID:(id)a13 cplEnabled:(BOOL)a14 initialSyncDate:(id)a15
{
  BOOL v15 = a8;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v21 = a4;
  id v22 = a6;
  id v23 = a7;
  id v24 = a12;
  id v35 = a13;
  id v25 = a15;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  char v57 = 1;
  v26 = [v20 persistentStoreCoordinator];
  v27 = [v26 persistentStores];
  v37 = [v27 firstObject];

  __int16 v28 = [v37 metadata];
  id v29 = v28;
  if (v28)
  {
    v36 = (void *)[v28 mutableCopy];
    uint64_t v30 = objc_msgSend(NSNumber, "numberWithInt:", +[PLModelMigrator currentModelVersion](PLModelMigrator, "currentModelVersion"));
    [v36 setObject:v30 forKeyedSubscript:@"PLModelVersion"];

    if (v15) {
      [v36 setObject:&unk_1EEBED368 forKeyedSubscript:*MEMORY[0x1E4F8C4C8]];
    }
    [v37 setMetadata:v36];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __273__PLMigrationHistory_recordCurrentMigrationStateInManagedObjectContext_withPathManager_migrationType_forceRebuildReason_sourceModelVersion_updateLegacyMigrationState_journalRebuildRequred_origin_libraryCreateOptions_hardwareModel_deviceUniqueID_cplEnabled_initialSyncDate___block_invoke;
    v38[3] = &unk_1E5863F00;
    id v39 = v21;
    int64_t v48 = a5;
    id v49 = a1;
    id v40 = v20;
    v47 = &v54;
    id v41 = v22;
    id v42 = v24;
    id v43 = v35;
    BOOL v52 = a14;
    id v44 = v25;
    signed __int16 v51 = a10;
    BOOL v53 = a9;
    id v45 = v23;
    unint64_t v50 = a11;
    id v46 = v29;
    [v40 performBlockAndWait:v38];

    BOOL v31 = *((unsigned char *)v55 + 24) != 0;
  }
  else
  {
    v32 = PLMigrationGetLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v59 = "+[PLMigrationHistory recordCurrentMigrationStateInManagedObjectContext:withPathManager:migrationType:forceRe"
            "buildReason:sourceModelVersion:updateLegacyMigrationState:journalRebuildRequred:origin:libraryCreateOptions:"
            "hardwareModel:deviceUniqueID:cplEnabled:initialSyncDate:]";
      _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "Failed to get store metadata: %{public}s", buf, 0xCu);
    }

    BOOL v31 = 0;
    *((unsigned char *)v55 + 24) = 0;
  }

  _Block_object_dispose(&v54, 8);
  return v31;
}

void __273__PLMigrationHistory_recordCurrentMigrationStateInManagedObjectContext_withPathManager_migrationType_forceRebuildReason_sourceModelVersion_updateLegacyMigrationState_journalRebuildRequred_origin_libraryCreateOptions_hardwareModel_deviceUniqueID_cplEnabled_initialSyncDate___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v36 = -1;
  v2 = (void *)MEMORY[0x1E4F1CB10];
  id v3 = [*(id *)(a1 + 32) photoDirectoryWithType:8];
  v4 = [v2 fileURLWithPath:v3];

  id v5 = [[PLJournal alloc] initWithBaseURL:v4 payloadClass:objc_opt_class()];
  if (*(void *)(a1 + 104) == 2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v35 = 0;
    BOOL v7 = +[PLMigrationHistory currentMigrationHistoryIndex:&v36 withManagedObjectContext:v6 error:&v35];
    id v8 = v35;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = v7;
  }
  else
  {
    id v8 = 0;
    uint64_t v36 = [*(id *)(a1 + 112) _rebuildMigrationHistoryWithJournal:v5 managedObjectContext:*(void *)(a1 + 40)];
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
  {
    uint64_t v9 = ++v36;
    switch(*(void *)(a1 + 104))
    {
      case 0:
        uint64_t v10 = *(void *)(a1 + 40);
        id v11 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v12 = +[PLMigrationHistory insertNoopWithManagedObjectContext:v10 index:v9 migrationDate:v11 hardwareModel:*(void *)(a1 + 56) deviceUniqueID:*(void *)(a1 + 64) cplEnabled:*(unsigned __int8 *)(a1 + 130) initialSyncDate:*(void *)(a1 + 72)];
        goto LABEL_12;
      case 1:
        uint64_t v14 = *(void *)(a1 + 40);
        id v11 = [MEMORY[0x1E4F1C9C8] date];
        LOBYTE(v32) = *(unsigned char *)(a1 + 130);
        uint64_t v12 = +[PLMigrationHistory insertRebuildWithManagedObjectContext:v14 index:v9 migrationDate:v11 forceRebuildReason:*(void *)(a1 + 48) hardwareModel:*(void *)(a1 + 56) deviceUniqueID:*(void *)(a1 + 64) cplEnabled:v32 initialSyncDate:*(void *)(a1 + 72)];
        goto LABEL_12;
      case 2:
        uint64_t v15 = *(void *)(a1 + 40);
        uint64_t v16 = [*(id *)(a1 + 80) integerValue];
        id v17 = [MEMORY[0x1E4F1C9C8] date];
        LOBYTE(v32) = *(unsigned char *)(a1 + 130);
        char v13 = +[PLMigrationHistory insertLightweightWithManagedObjectContext:v15 index:v9 sourceModelVersion:v16 migrationDate:v17 hardwareModel:*(void *)(a1 + 56) deviceUniqueID:*(void *)(a1 + 64) cplEnabled:v32 initialSyncDate:*(void *)(a1 + 72)];

        break;
      case 3:
        uint64_t v18 = *(void *)(a1 + 40);
        id v11 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v12 = +[PLMigrationHistory insertCreatedWithManagedObjectContext:v18 index:v9 migrationDate:v11 hardwareModel:*(void *)(a1 + 56) deviceUniqueID:*(void *)(a1 + 64) cplEnabled:*(unsigned __int8 *)(a1 + 130) initialSyncDate:*(void *)(a1 + 72)];
LABEL_12:
        char v13 = v12;

        break;
      default:
        v19 = PLMigrationGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          id v20 = *(const char **)(a1 + 104);
          *(_DWORD *)buf = 134217984;
          id v39 = v20;
          _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Unsupported migrationType: %ld", buf, 0xCu);
        }

        char v13 = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 0;
        break;
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
    {
      __int16 v21 = *(_WORD *)(a1 + 128);
      if (!v21)
      {
        if (*(void *)(a1 + 104) != 3 || v36 < 1) {
          goto LABEL_22;
        }
        __int16 v21 = 6;
      }
      [v13 setOrigin:v21];
LABEL_22:
      if (*(unsigned char *)(a1 + 131)) {
        +[PLGlobalValues setJournalRebuildRequired:1 managedObjectContext:*(void *)(a1 + 40)];
      }
      +[PLGlobalValues setLibraryCreateOptions:*(void *)(a1 + 120) managedObjectContext:*(void *)(a1 + 40)];
      id v22 = *(void **)(a1 + 40);
      id v34 = v8;
      char v23 = [v22 save:&v34];
      id v24 = v34;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = v23;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
      {
        id v25 = [PLJournalEntry alloc];
        v26 = [v13 payloadForChangedKeys:0];
        v27 = [(PLJournalEntry *)v25 initForInsertWithPayload:v26];

        v37 = v27;
        __int16 v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
        id v33 = v24;
        BOOL v29 = [(PLJournal *)v5 appendChangeEntries:v28 error:&v33];
        id v8 = v33;

        if (!v29)
        {
          uint64_t v30 = PLMigrationGetLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            id v39 = "+[PLMigrationHistory recordCurrentMigrationStateInManagedObjectContext:withPathManager:migrationType:f"
                  "orceRebuildReason:sourceModelVersion:updateLegacyMigrationState:journalRebuildRequred:origin:libraryCr"
                  "eateOptions:hardwareModel:deviceUniqueID:cplEnabled:initialSyncDate:]_block_invoke";
            __int16 v40 = 2114;
            id v41 = v8;
            _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, "Failed to update MigrationHistory journal: %{public}s, %{public}@", buf, 0x16u);
          }
        }
      }
      else
      {
        v27 = PLMigrationGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          uint64_t v31 = *(void *)(a1 + 88);
          *(_DWORD *)buf = 136446722;
          id v39 = "+[PLMigrationHistory recordCurrentMigrationStateInManagedObjectContext:withPathManager:migrationType:for"
                "ceRebuildReason:sourceModelVersion:updateLegacyMigrationState:journalRebuildRequred:origin:libraryCreate"
                "Options:hardwareModel:deviceUniqueID:cplEnabled:initialSyncDate:]_block_invoke";
          __int16 v40 = 2114;
          id v41 = v24;
          __int16 v42 = 2114;
          uint64_t v43 = v31;
          _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Failed to save store metadata: %{public}s, error: %{public}@, metadata:%{public}@", buf, 0x20u);
        }
        id v8 = v24;
      }
    }
  }
  else
  {
    char v13 = PLMigrationGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v39 = "+[PLMigrationHistory recordCurrentMigrationStateInManagedObjectContext:withPathManager:migrationType:forceRe"
            "buildReason:sourceModelVersion:updateLegacyMigrationState:journalRebuildRequred:origin:libraryCreateOptions:"
            "hardwareModel:deviceUniqueID:cplEnabled:initialSyncDate:]_block_invoke";
      __int16 v40 = 2114;
      id v41 = v8;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Failed to query next migration history index: %{public}s, %{public}@", buf, 0x16u);
    }
  }
}

+ (id)migrateLegacyMigrationHistoryWithMetadata:(id)a3 index:(int64_t)a4 outGlobalKeyValues:(id)a5 managedObjectContext:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (a4 < 0)
  {
    id v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2 object:a1 file:@"PLMigrationHistory.m" lineNumber:212 description:@"index must be greater than 0"];
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v15 = [v11 objectForKeyedSubscript:@"ImportedFileSystemAssets"];

  if (v15)
  {
    uint64_t v16 = [NSNumber numberWithInteger:_BOOLForKey(v11, @"ImportedFileSystemAssets")];
    [v14 setObject:v16 forKeyedSubscript:@"ImportedFileSystemAssets"];

    [v11 removeObjectForKey:@"ImportedFileSystemAssets"];
  }
  id v17 = [v11 objectForKeyedSubscript:@"ImportedFileSystemAssetsDate"];

  if (v17)
  {
    uint64_t v18 = PLCompleteDateFormatter();
    v19 = _dateForKey(v11, @"ImportedFileSystemAssetsDate", v18);
    [v14 setObject:v19 forKeyedSubscript:@"ImportedFileSystemAssetsDate"];

    [v11 removeObjectForKey:@"ImportedFileSystemAssetsDate"];
  }
  id v20 = [v11 objectForKeyedSubscript:@"PLRebuildRequired"];

  if (v20)
  {
    if (_BOOLForKey(v11, @"PLRebuildRequired"))
    {
      __int16 v21 = [NSNumber numberWithBool:1];
      [v14 setObject:v21 forKeyedSubscript:@"JournalRebuildRequired"];
    }
    [v11 removeObjectForKey:@"PLRebuildRequired"];
  }
  id v22 = PLCompleteDateFormatter();
  char v23 = _dateForKey(v11, @"PLMigrationDate", v22);

  id v24 = _stringForKey(v11, @"PLLibraryUpgradeType");
  id v25 = [v24 lowercaseString];

  if ([v25 hasPrefix:@"created"])
  {
    uint64_t v26 = 3;
  }
  else if ([v25 hasPrefix:@"lightweight"])
  {
    uint64_t v26 = 2;
  }
  else
  {
    uint64_t v26 = [v25 hasPrefix:@"rebuil"];
  }
  int64_t v48 = v12;
  if ([v25 containsString:@" icloud restore"]) {
    uint64_t v27 = 2;
  }
  else {
    uint64_t v27 = [v25 containsString:@" itunes restore"];
  }
  if ([v25 hasSuffix:@"(forced)"]) {
    __int16 v28 = &unk_1EEBED350;
  }
  else {
    __int16 v28 = 0;
  }
  v47 = v13;
  BOOL v29 = +[PLManagedObject insertInManagedObjectContext:v13];
  [v29 setIndex:a4];
  uint64_t v30 = _numberForKey(v11, @"PLModelVersion");
  objc_msgSend(v29, "setModelVersion:", objc_msgSend(v30, "integerValue"));
  uint64_t v31 = _numberForKey(v11, @"PLMigrationSourceModelVersion");
  [v29 setSourceModelVersion:v31];

  [v29 setMigrationType:v26];
  [v29 setMigrationDate:v23];
  uint64_t v32 = _stringForKey(v11, @"PLOSVersion");
  if (v32)
  {
    id v33 = objc_msgSend([NSString alloc], "initWithUTF8String:", objc_msgSend(v32, "UTF8String"));
    [v29 setOsVersion:v33];
  }
  id v34 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F1BF90]];
  [v29 setStoreUUID:v34];

  [v29 setForceRebuildReason:v28];
  [v29 setOrigin:v27];
  if ([v14 count])
  {
    id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v14];
    [v29 setGlobalKeyValues:v35];
  }
  else
  {
    [v29 setGlobalKeyValues:0];
  }
  uint64_t v36 = v48;
  [v11 removeObjectForKey:@"PLMigrationDate"];
  [v11 removeObjectForKey:@"PLLibraryUpgradeType"];
  [v11 removeObjectForKey:@"PLMigrationSourceModelVersion"];
  [v11 removeObjectForKey:@"PLOSVersion"];
  v37 = [v11 objectForKeyedSubscript:@"PLGreenValues"];
  if (v37)
  {
    [v14 setObject:v37 forKeyedSubscript:@"GreenValues"];
    [v11 removeObjectForKey:@"PLGreenValues"];
  }
  if (v48)
  {
    id v46 = v30;
    v38 = v23;
    [v48 addEntriesFromDictionary:v14];
    id v39 = [v14 objectForKeyedSubscript:@"ImportedFileSystemAssets"];
    if ([v39 integerValue] == 1)
    {
      __int16 v40 = [v14 objectForKeyedSubscript:@"JournalRebuildRequired"];
      char v41 = [v40 BOOLValue];

      if (v41) {
        goto LABEL_34;
      }
      id v39 = [v14 objectForKeyedSubscript:@"ImportedFileSystemAssetsDate"];
      [v48 setObject:v39 forKeyedSubscript:@"RebuildCompleteDate"];
    }

LABEL_34:
    __int16 v42 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F8C4C8]];
    uint64_t v43 = [v42 integerValue];

    uint64_t v36 = v48;
    char v23 = v38;
    uint64_t v30 = v46;
    if (v43 == 1) {
      [v29 setOrigin:5];
    }
  }

  return v29;
}

+ (BOOL)currentMigrationHistoryIndex:(int64_t *)a3 withManagedObjectContext:(id)a4 error:(id *)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  BOOL v7 = (void *)MEMORY[0x1E4F28C68];
  id v8 = a4;
  uint64_t v9 = [v7 expressionForKeyPath:@"index"];
  uint64_t v10 = (void *)MEMORY[0x1E4F28C68];
  v24[0] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  id v12 = [v10 expressionForFunction:@"max:" arguments:v11];

  id v13 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v13 setName:@"maxIndex"];
  [v13 setExpression:v12];
  [v13 setExpressionResultType:300];
  id v14 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v15 = +[PLMigrationHistory entityName];
  uint64_t v16 = [v14 fetchRequestWithEntityName:v15];

  [v16 setResultType:2];
  id v23 = v13;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  [v16 setPropertiesToFetch:v17];

  uint64_t v18 = [v8 executeFetchRequest:v16 error:a5];

  if (v18)
  {
    v19 = [v18 firstObject];
    id v20 = [v19 valueForKey:@"maxIndex"];

    if (v20) {
      int64_t v21 = [v20 longLongValue];
    }
    else {
      int64_t v21 = -1;
    }
    *a3 = v21;
  }
  return v18 != 0;
}

+ (id)currentMigrationHistoryWithManagedObjectContext:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v18 = 0;
  uint64_t v19 = 0;
  BOOL v4 = +[PLMigrationHistory currentMigrationHistoryIndex:&v19 withManagedObjectContext:v3 error:&v18];
  id v5 = v18;
  if (!v4 || v19 < 0)
  {
    id v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v5;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Error querying current migration history index: %@", buf, 0xCu);
    }
    id v14 = 0;
    id v13 = v5;
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1C0D0];
    BOOL v7 = +[PLMigrationHistory entityName];
    id v8 = [v6 fetchRequestWithEntityName:v7];

    uint64_t v9 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v10 = [NSNumber numberWithLongLong:v19];
    id v11 = [v9 predicateWithFormat:@"%K = %@", @"index", v10];
    [v8 setPredicate:v11];

    id v17 = v5;
    id v12 = [v3 executeFetchRequest:v8 error:&v17];
    id v13 = v17;

    if (v12)
    {
      id v14 = [v12 firstObject];
    }
    else
    {
      uint64_t v15 = PLBackendGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v13;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Error fetching current migration history: %@", buf, 0xCu);
      }

      id v14 = 0;
    }
  }
  return v14;
}

+ (id)migrationHistoryWithManagedObjectContext:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1C0D0];
  id v4 = a3;
  id v5 = +[PLMigrationHistory entityName];
  uint64_t v6 = [v3 fetchRequestWithEntityName:v5];

  BOOL v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"index" ascending:1];
  v16[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v6 setSortDescriptors:v8];

  id v13 = 0;
  uint64_t v9 = [v4 executeFetchRequest:v6 error:&v13];

  id v10 = v13;
  if (!v9)
  {
    id v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v10;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Error fetching migration history: %@", buf, 0xCu);
    }
  }
  return v9;
}

+ (id)insertIntoManagedObjectContext:(id)a3 index:(int64_t)a4 sourceModelVersion:(id)a5 migrationType:(int64_t)a6 migrationDate:(id)a7 forceRebuildReason:(id)a8 hardwareModel:(id)a9 deviceUniqueID:(id)a10 cplEnabled:(BOOL)a11 initialSyncDate:(id)a12
{
  __int16 v39 = a6;
  id v17 = a3;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  id v40 = a9;
  id v21 = a10;
  id v22 = a12;
  if (a4 < 0)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2 object:a1 file:@"PLMigrationHistory.m" lineNumber:136 description:@"index must be greater than or equal to 0"];
  }
  id v23 = +[PLManagedObject insertInManagedObjectContext:](PLMigrationHistory, "insertInManagedObjectContext:", v17, a2);
  [v23 setIndex:a4];
  objc_msgSend(v23, "setModelVersion:", +[PLModelMigrator currentModelVersion](PLModelMigrator, "currentModelVersion"));
  id v24 = [MEMORY[0x1E4F8B888] currentBuildVersionString];
  [v23 setOsVersion:v24];

  id v25 = v18;
  [v23 setSourceModelVersion:v18];
  [v23 setMigrationType:v39];
  uint64_t v26 = v19;
  [v23 setMigrationDate:v19];
  [v23 setForceRebuildReason:v20];
  uint64_t v27 = [v17 persistentStoreCoordinator];
  __int16 v28 = [v27 persistentStores];
  BOOL v29 = [v28 firstObject];

  uint64_t v30 = [v29 metadata];
  uint64_t v31 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F1BF90]];
  [v23 setStoreUUID:v31];

  uint64_t v32 = PLPhotoLibraryServicesBinaryImageUUID();
  id v33 = [v32 UUIDString];
  [v23 setFrameworkUUID:v33];

  id v34 = +[PLGlobalKeyValue dictionaryWithManagedObjectContext:v17 forMigrationHistory:1];
  if ([v34 count]) {
    id v35 = v34;
  }
  else {
    id v35 = 0;
  }
  [v23 setGlobalKeyValues:v35];
  [v23 setHardwareModel:v40];
  [v23 setDeviceUniqueID:v21];
  [v23 setInitialSyncDate:v22];
  [v23 setCplEnabled:a11];

  return v23;
}

+ (id)insertNoopWithManagedObjectContext:(id)a3 index:(int64_t)a4 migrationDate:(id)a5 hardwareModel:(id)a6 deviceUniqueID:(id)a7 cplEnabled:(BOOL)a8 initialSyncDate:(id)a9
{
  LOBYTE(v10) = a8;
  return (id)[a1 insertIntoManagedObjectContext:a3 index:a4 sourceModelVersion:0 migrationType:0 migrationDate:a5 forceRebuildReason:0 hardwareModel:a6 deviceUniqueID:a7 cplEnabled:v10 initialSyncDate:a9];
}

+ (id)insertRebuildWithManagedObjectContext:(id)a3 index:(int64_t)a4 migrationDate:(id)a5 forceRebuildReason:(id)a6 hardwareModel:(id)a7 deviceUniqueID:(id)a8 cplEnabled:(BOOL)a9 initialSyncDate:(id)a10
{
  LOBYTE(v11) = a9;
  return (id)[a1 insertIntoManagedObjectContext:a3 index:a4 sourceModelVersion:0 migrationType:1 migrationDate:a5 forceRebuildReason:a6 hardwareModel:a7 deviceUniqueID:a8 cplEnabled:v11 initialSyncDate:a10];
}

+ (id)insertLightweightWithManagedObjectContext:(id)a3 index:(int64_t)a4 sourceModelVersion:(unint64_t)a5 migrationDate:(id)a6 hardwareModel:(id)a7 deviceUniqueID:(id)a8 cplEnabled:(BOOL)a9 initialSyncDate:(id)a10
{
  id v17 = NSNumber;
  id v18 = a10;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a3;
  id v23 = [v17 numberWithUnsignedInteger:a5];
  LOBYTE(v26) = a9;
  id v24 = [a1 insertIntoManagedObjectContext:v22 index:a4 sourceModelVersion:v23 migrationType:2 migrationDate:v21 forceRebuildReason:0 hardwareModel:v20 deviceUniqueID:v19 cplEnabled:v26 initialSyncDate:v18];

  return v24;
}

+ (id)insertCreatedWithManagedObjectContext:(id)a3 index:(int64_t)a4 migrationDate:(id)a5 hardwareModel:(id)a6 deviceUniqueID:(id)a7 cplEnabled:(BOOL)a8 initialSyncDate:(id)a9
{
  LOBYTE(v10) = a8;
  return (id)[a1 insertIntoManagedObjectContext:a3 index:a4 sourceModelVersion:0 migrationType:3 migrationDate:a5 forceRebuildReason:0 hardwareModel:a6 deviceUniqueID:a7 cplEnabled:v10 initialSyncDate:a9];
}

+ (id)entityName
{
  return @"MigrationHistory";
}

+ (void)initialize
{
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4 = a3;
  id v5 = [(PLManagedObjectJournalEntryPayload *)[PLMigrationHistoryJournalEntryPayload alloc] initWithManagedObject:self changedKeys:v4];

  return v5;
}

- (id)payloadIDForTombstone:(id)a3
{
  id v3 = NSString;
  id v4 = [a3 objectForKeyedSubscript:@"index"];
  id v5 = [v3 stringWithFormat:@"%@", v4];
  uint64_t v6 = +[PLJournalEntryPayloadIDFactory payloadIDWithString:v5];

  return v6;
}

- (id)payloadID
{
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", -[PLMigrationHistory index](self, "index"));
  id v3 = +[PLJournalEntryPayloadIDFactory payloadIDWithString:v2];

  return v3;
}

@end