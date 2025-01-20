@interface RCServiceContainer
+ (id)sharedContainer;
- (BOOL)_deleteStore:(id)a3 error:(id *)a4;
- (BOOL)_manuallyMigrateCloudRecordingsDatabase:(id)a3 error:(id *)a4;
- (BOOL)performLocalEncryptedTitleMigrationIfNeeded;
- (BOOL)unsetLocalEncryptedTitleMigrationFlag;
- (id)_cloudRecordingsInContext:(id)a3;
- (id)_legacyRecordingWithUniqueID:(id)a3 context:(id)a4;
- (id)loadStore:(id)a3 error:(id *)a4;
- (void)_deleteLegacyStore:(id)a3;
- (void)_logIfDiscrepancyWithKey:(id)a3 cloudRecordingValue:(id)a4 legacyRecordingValue:(id)a5;
- (void)_migrateDatabaseIfNecessary;
- (void)_migrateLegacyStore:(id)a3;
- (void)_migrateSyncedUUIDsIfNeeded;
- (void)_saveMigrationStep:(id)a3 migrationFlag:(id)a4;
- (void)_validateMigratedRecording:(id)a3 legacyRecording:(id)a4;
@end

@implementation RCServiceContainer

+ (id)sharedContainer
{
  if (qword_100040510 != -1) {
    dispatch_once(&qword_100040510, &stru_100038BE0);
  }
  v2 = (void *)qword_100040508;
  return v2;
}

- (id)loadStore:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = RCRecordingsDirectoryURL();
  v57 = [v7 path];

  id v8 = objc_alloc_init((Class)NSFileManager);
  char v83 = 0;
  unsigned __int8 v9 = [v8 fileExistsAtPath:v57 isDirectory:&v83];
  if (v83) {
    unsigned __int8 v10 = v9;
  }
  else {
    unsigned __int8 v10 = 0;
  }
  if ((v10 & 1) == 0)
  {
    [v8 removeItemAtPath:v57 error:0];
    id v82 = 0;
    unsigned __int8 v11 = [v8 createDirectoryAtPath:v57 withIntermediateDirectories:1 attributes:0 error:&v82];
    id v12 = v82;
    if ((v11 & 1) == 0)
    {
      v13 = OSLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100022D58();
      }
    }
  }
  if ((RCDeviceUnlockedSinceBoot() & 1) == 0)
  {
    v14 = OSLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100022CD4(v14);
    }
  }
  v15 = [v6 URLByDeletingLastPathComponent];
  v56 = [v15 URLByAppendingPathComponent:RCLegacyRecordingsDatabaseFileName];

  char v81 = 0;
  v16 = [v56 path];
  unsigned int v17 = [v8 fileExistsAtPath:v16 isDirectory:&v81];
  if (v81) {
    unsigned int v18 = 0;
  }
  else {
    unsigned int v18 = v17;
  }

  v55 = [(id)objc_opt_class() storeDescriptionForURL:v56 isXPCClient:0 configuration:RCLocalConfiguration];
  v19 = [(id)objc_opt_class() storeDescriptionForURL:v6 isXPCClient:0 configuration:RCCloudConfiguration];
  v20 = [(RCServiceContainer *)self persistentContainer];
  v58 = [v20 persistentStoreCoordinator];

  if (v18)
  {
    v88[0] = v55;
    v88[1] = v19;
    +[NSArray arrayWithObjects:v88 count:2];
  }
  else
  {
    v87 = v19;
    +[NSArray arrayWithObjects:&v87 count:1];
  v21 = };
  v22 = [(RCServiceContainer *)self persistentContainer];
  [v22 setPersistentStoreDescriptions:v21];

  id v80 = 0;
  LODWORD(v21) = [v6 getResourceValue:&v80 forKey:NSURLFileProtectionKey error:0];
  id v53 = v80;
  if (v21)
  {
    v23 = OSLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = [v6 path];
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "-[RCServiceContainer loadStore:error:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v24;
      *(_WORD *)&buf[22] = 2112;
      id v86 = v53;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s -- storePath = %@, storeProtectionValue = %@", buf, 0x20u);
    }
  }
  v25 = objc_opt_new();
  v26 = [(RCServiceContainer *)self persistentContainer];
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_10000B668;
  v78[3] = &unk_100038C08;
  id v27 = v25;
  id v79 = v27;
  [v26 loadPersistentStoresWithCompletionHandler:v78];

  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_10000B6E4;
  v76[3] = &unk_100038C30;
  id v28 = v19;
  id v77 = v28;
  v54 = objc_msgSend(v27, "na_filter:", v76);
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_10000B800;
  v72[3] = &unk_100038C58;
  id v52 = v28;
  id v73 = v52;
  v74 = self;
  id v29 = v27;
  id v75 = v29;
  [v54 enumerateKeysAndObjectsUsingBlock:v72];
  if ([v29 count])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    id v86 = 0;
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_10000B944;
    v68[3] = &unk_100038C80;
    id v69 = v8;
    id v30 = v58;
    id v70 = v30;
    v71 = buf;
    objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v68, v52);
    id v31 = *(id *)(*(void *)&buf[8] + 24);
    if (v31 == [v29 count])
    {
      [v29 removeAllObjects];
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      v32 = [v30 persistentStores];
      id v33 = [v32 copy];

      id v34 = [v33 countByEnumeratingWithState:&v64 objects:v84 count:16];
      v35 = a4;
      if (v34)
      {
        uint64_t v36 = *(void *)v65;
        do
        {
          for (i = 0; i != v34; i = (char *)i + 1)
          {
            if (*(void *)v65 != v36) {
              objc_enumerationMutation(v33);
            }
            [v30 removePersistentStore:*(void *)(*((void *)&v64 + 1) + 8 * i) error:0];
          }
          id v34 = [v33 countByEnumeratingWithState:&v64 objects:v84 count:16];
        }
        while (v34);
      }

      a4 = v35;
      v38 = [(RCServiceContainer *)self persistentContainer];
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472;
      v62[2] = sub_10000BEA0;
      v62[3] = &unk_100038C08;
      id v63 = v29;
      [v38 loadPersistentStoresWithCompletionHandler:v62];
    }
    if ([v29 count])
    {
      v39 = OSLogForCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
        sub_100022C60();
      }

      if (a4)
      {
        v40 = +[NSMutableDictionary dictionaryWithObject:@"Failed to load stores" forKey:NSLocalizedDescriptionKey];
        [v40 addEntriesFromDictionary:v29];
        *a4 = +[NSError errorWithDomain:RCVoiceMemosErrorDomain code:1 userInfo:v40];
      }
      _Block_object_dispose(buf, 8);
      v41 = 0;
      goto LABEL_48;
    }

    _Block_object_dispose(buf, 8);
  }
  v42 = objc_msgSend(v58, "persistentStores", v52);
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_10000BF1C;
  v60[3] = &unk_100038CA8;
  id v61 = v6;
  v41 = objc_msgSend(v42, "na_firstObjectPassingTest:", v60);

  v43 = [[RCDatabaseMetadata alloc] initWithPersistentStore:v41];
  metadata = self->_metadata;
  self->_metadata = v43;

  v45 = (void *)os_transaction_create();
  v46 = [v55 URL];
  v47 = [v58 persistentStoreForURL:v46];

  if (v47)
  {
    [(RCServiceContainer *)self _migrateLegacyStore:v47];
    id v59 = 0;
    unsigned int v48 = [v58 removePersistentStore:v47 error:&v59];
    id v49 = v59;
    if (v48)
    {
      v50 = [v47 URL];
      [(RCServiceContainer *)self _deleteLegacyStore:v50];
    }
    else
    {
      v50 = OSLogForCategory();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT)) {
        sub_100022BEC();
      }
    }
  }
  [(RCServiceContainer *)self _migrateDatabaseIfNecessary];

LABEL_48:
  return v41;
}

- (void)_deleteLegacyStore:(id)a3
{
  id v15 = 0;
  unsigned __int8 v3 = [(RCServiceContainer *)self _deleteStore:a3 error:&v15];
  id v4 = v15;
  if ((v3 & 1) == 0)
  {
    v5 = OSLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100023154();
    }
  }
  id v6 = +[NSFileManager defaultManager];
  v7 = RCRecordingsDirectoryURL();
  id v8 = [v7 URLByAppendingPathComponent:@"AssetManifest.plist"];

  unsigned __int8 v9 = [v8 path];
  unsigned int v10 = [v6 fileExistsAtPath:v9];

  if (v10)
  {
    id v14 = v4;
    unsigned __int8 v11 = [v6 removeItemAtURL:v8 error:&v14];
    id v12 = v14;

    if ((v11 & 1) == 0)
    {
      v13 = OSLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000230D4();
      }
    }
  }
  else
  {
    id v12 = v4;
  }
}

- (BOOL)_deleteStore:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 lastPathComponent];
  v7 = [v5 URLByDeletingLastPathComponent];
  v32[0] = v5;
  id v8 = [v6 stringByAppendingString:@"-wal"];
  unsigned __int8 v9 = [v7 URLByAppendingPathComponent:v8];
  v32[1] = v9;
  unsigned int v10 = [v6 stringByAppendingString:@"-shm"];
  unsigned __int8 v11 = [v7 URLByAppendingPathComponent:v10];
  v32[2] = v11;
  id v12 = RCSupportDirectoryForDatabase();
  v32[3] = v12;
  v13 = +[NSArray arrayWithObjects:v32 count:4];

  id v14 = +[NSFileManager defaultManager];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = v13;
  id v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v16)
  {
    id v17 = v16;
    v25 = v7;
    v26 = v6;
    uint64_t v18 = *(void *)v28;
    while (2)
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v21 = objc_msgSend(v20, "path", v25, v26, (void)v27);
        unsigned int v22 = [v14 fileExistsAtPath:v21];

        if (v22 && ![v14 removeItemAtURL:v20 error:a4])
        {
          BOOL v23 = 0;
          goto LABEL_12;
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v17) {
        continue;
      }
      break;
    }
    BOOL v23 = 1;
LABEL_12:
    v7 = v25;
    id v6 = v26;
  }
  else
  {
    BOOL v23 = 1;
  }

  return v23;
}

- (BOOL)_manuallyMigrateCloudRecordingsDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 URL];
  id v8 = [v6 options];
  unsigned __int8 v9 = +[NSPersistentStoreCoordinator metadataForPersistentStoreOfType:NSSQLiteStoreType URL:v7 options:v8 error:a4];

  if (v9)
  {
    unsigned int v10 = +[NSManagedObjectModel modelCompatibleWithStoreMetadata:v9 forStoreURL:v7];
    if (v10)
    {
      BOOL v23 = +[NSManagedObjectModel rc_newObjectModel];
      unsigned __int8 v11 = +[NSMappingModel inferredMappingModelForSourceModel:v10 destinationModel:v23 error:a4];
      if (v11)
      {
        id v22 = [objc_alloc((Class)NSMigrationManager) initWithSourceModel:v10 destinationModel:v23];
        if (v22)
        {
          id v12 = [v6 options];
          v13 = [v6 options];
          unsigned int v14 = [v22 migrateStoreFromURL:v7 type:NSSQLiteStoreType options:v12 withMappingModel:v11 toDestinationURL:v7 destinationType:NSSQLiteStoreType destinationOptions:v13 error:a4];

          if (v14)
          {
            uint64_t v25 = 0;
            v26 = &v25;
            uint64_t v27 = 0x3032000000;
            long long v28 = sub_100007E18;
            long long v29 = sub_10000C724;
            id v30 = 0;
            id v15 = [(RCServiceContainer *)self persistentContainer];
            id v16 = [v15 persistentStoreCoordinator];
            v24[0] = _NSConcreteStackBlock;
            v24[1] = 3221225472;
            v24[2] = sub_10000C72C;
            v24[3] = &unk_100038CD0;
            v24[4] = &v25;
            [v16 addPersistentStoreWithDescription:v6 completionHandler:v24];

            id v17 = (void *)v26[5];
            BOOL v18 = v17 == 0;
            if (a4 && v17) {
              *a4 = v17;
            }
            _Block_object_dispose(&v25, 8);

            goto LABEL_17;
          }
        }
        else if (a4)
        {
          NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
          v19 = +[NSString stringWithFormat:@"Failed to create migrationManager"];
          v32 = v19;
          v20 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
          *a4 = +[NSError errorWithDomain:RCVoiceMemosErrorDomain code:134130 userInfo:v20];
        }
        BOOL v18 = 0;
LABEL_17:

        goto LABEL_18;
      }
      BOOL v18 = 0;
    }
    else
    {
      if (!a4)
      {
        BOOL v18 = 0;
        goto LABEL_19;
      }
      NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
      BOOL v23 = +[NSString stringWithFormat:@"Failed to find a compatible model to load store"];
      id v34 = v23;
      unsigned __int8 v11 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      +[NSError errorWithDomain:RCVoiceMemosErrorDomain code:134130 userInfo:v11];
      BOOL v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  BOOL v18 = 0;
LABEL_20:

  return v18;
}

- (id)_cloudRecordingsInContext:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSFetchRequest);
  id v5 = +[NSEntityDescription entityForName:RCCloudRecording_EntityName inManagedObjectContext:v3];
  [v4 setEntity:v5];

  id v6 = +[RCQueryManager defaultFetchedProperties];
  [v4 setPropertiesToFetch:v6];

  v7 = +[RCQueryManager defaultSortDescriptors];
  [v4 setSortDescriptors:v7];

  id v8 = [objc_alloc((Class)NSFetchedResultsController) initWithFetchRequest:v4 managedObjectContext:v3 sectionNameKeyPath:0 cacheName:0];
  id v14 = 0;
  unsigned __int8 v9 = [v8 performFetch:&v14];
  id v10 = v14;
  if ((v9 & 1) == 0)
  {
    unsigned __int8 v11 = OSLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000231C8();
    }
  }
  id v12 = [v8 fetchedObjects];

  return v12;
}

- (id)_legacyRecordingWithUniqueID:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = +[RCSavedRecording legacyRecordingWithUniqueIDFetchRequest:a3];
  v7 = [v5 executeFetchRequest:v6 error:0];

  id v8 = [v7 lastObject];

  return v8;
}

- (void)_migrateLegacyStore:(id)a3
{
  id v4 = a3;
  id v5 = [[RCDatabaseMetadata alloc] initWithPersistentStore:v4];

  id v6 = [(RCDatabaseMetadata *)v5 objectForKeyedSubscript:@"MigratedMetadataToCloudStore"];
  unsigned __int8 v7 = [v6 BOOLValue];

  if ((v7 & 1) == 0)
  {
    id v8 = [(RCServiceContainer *)self newContextWithConcurrencyType:1];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000CAF4;
    v16[3] = &unk_100038CF8;
    id v17 = v5;
    BOOL v18 = self;
    id v19 = v8;
    id v9 = v8;
    [v9 performBlockAndWait:v16];
  }
  id v10 = [(RCDatabaseMetadata *)self->_metadata objectForKeyedSubscript:@"CloudRecordingsMigrated"];
  unsigned __int8 v11 = [v10 BOOLValue];

  if ((v11 & 1) == 0)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000CB78;
    v13[3] = &unk_100038D20;
    id v14 = [(RCServiceContainer *)self newContextWithConcurrencyType:1];
    id v15 = self;
    id v12 = v14;
    [v12 performBlockAndWait:v13];
  }
}

- (void)_migrateDatabaseIfNecessary
{
  id v3 = [(RCDatabaseMetadata *)self->_metadata objectForKeyedSubscript:@"CloudRecordingsMarkedPlayableAndEvicted"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10000D4EC;
    v29[3] = &unk_100038D20;
    v29[4] = self;
    id v30 = [(RCServiceContainer *)self newContextWithConcurrencyType:1];
    id v5 = v30;
    [v5 performBlockAndWait:v29];
  }
  id v6 = [(RCDatabaseMetadata *)self->_metadata objectForKeyedSubscript:@"RCRecordingsDirectory"];
  if (!v6 || ([@"RCRecordingsRelativePath" isEqualToString:v6] & 1) == 0)
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000D628;
    v27[3] = &unk_100038D20;
    v27[4] = self;
    id v28 = [(RCServiceContainer *)self newContextWithConcurrencyType:1];
    id v7 = v28;
    [v7 performBlockAndWait:v27];
  }
  id v8 = [(RCDatabaseMetadata *)self->_metadata objectForKeyedSubscript:@"BackupExclusionFlagMigrated"];
  unsigned __int8 v9 = [v8 BOOLValue];

  if ((v9 & 1) == 0)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000D81C;
    v25[3] = &unk_100038D20;
    v25[4] = self;
    id v26 = [(RCServiceContainer *)self newContextWithConcurrencyType:1];
    id v10 = v26;
    [v10 performBlockAndWait:v25];
  }
  unsigned __int8 v11 = [(RCDatabaseMetadata *)self->_metadata objectForKeyedSubscript:@"CloudRecordingsHaveCompleteMetadata"];
  unsigned __int8 v12 = [v11 BOOLValue];

  if ((v12 & 1) == 0)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000D96C;
    v23[3] = &unk_100038D20;
    v23[4] = self;
    id v24 = [(RCServiceContainer *)self newContextWithConcurrencyType:1];
    id v13 = v24;
    [v13 performBlockAndWait:v23];
  }
  id v14 = [(RCDatabaseMetadata *)self->_metadata objectForKeyedSubscript:@"kRCCloudRecordingsLocalPropertiesUpdated"];
  unsigned __int8 v15 = [v14 BOOLValue];

  if ((v15 & 1) == 0)
  {
    id v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    id v19 = sub_10000DAA4;
    v20 = &unk_100038D20;
    v21 = self;
    id v22 = [(RCServiceContainer *)self newContextWithConcurrencyType:1];
    id v16 = v22;
    [v16 performBlockAndWait:&v17];
  }
  [(RCServiceContainer *)self _migrateSyncedUUIDsIfNeeded];
}

- (void)_migrateSyncedUUIDsIfNeeded
{
  id v3 = [(RCDatabaseMetadata *)self->_metadata objectForKeyedSubscript:@"CloudRecordingsSyncedUUIDMigrated"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000DCAC;
    v6[3] = &unk_100038D20;
    v6[4] = self;
    id v7 = [(RCServiceContainer *)self newContextWithConcurrencyType:1];
    id v5 = v7;
    [v5 performBlockAndWait:v6];
  }
}

- (BOOL)performLocalEncryptedTitleMigrationIfNeeded
{
  id v3 = [(RCServiceContainer *)self store];
  unsigned __int8 v4 = [v3 voiceMemosMetadata];
  id v5 = [v4 objectForKeyedSubscript:@"CloudRecordingsCustomLabelsMigrated"];
  unsigned __int8 v6 = [v5 BOOLValue];

  if (v6) {
    return 0;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000DF58;
  v14[3] = &unk_100038D48;
  id v8 = [(RCServiceContainer *)self newBackgroundModel];
  id v15 = v8;
  [v8 performBlockAndWait:v14];
  unsigned __int8 v9 = [(RCServiceContainer *)self store];
  id v13 = 0;
  unsigned __int8 v7 = [v9 saveVoiceMemosMetadataValue:&__kCFBooleanTrue forKey:@"CloudRecordingsCustomLabelsMigrated" error:&v13];
  id v10 = v13;

  if ((v7 & 1) == 0)
  {
    unsigned __int8 v11 = OSLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100023248((uint64_t)v10, v11);
    }
  }
  return v7;
}

- (BOOL)unsetLocalEncryptedTitleMigrationFlag
{
  v2 = [(RCServiceContainer *)self store];
  id v7 = 0;
  unsigned __int8 v3 = [v2 saveVoiceMemosMetadataValue:0 forKey:@"CloudRecordingsCustomLabelsMigrated" error:&v7];
  id v4 = v7;

  if ((v3 & 1) == 0)
  {
    id v5 = OSLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000232E4((uint64_t)v4, v5);
    }
  }
  return v3;
}

- (void)_saveMigrationStep:(id)a3 migrationFlag:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v10 = 0;
  unsigned __int8 v7 = [v5 save:&v10];
  id v8 = v10;
  if ((v7 & 1) == 0)
  {
    unsigned __int8 v9 = OSLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      unsigned __int8 v12 = "-[RCServiceContainer _saveMigrationStep:migrationFlag:]";
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s -- ERROR: Save failed - migration flag = %@, error = %@", buf, 0x20u);
    }
  }
}

- (void)_validateMigratedRecording:(id)a3 legacyRecording:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 url];
  unsigned __int8 v9 = [v8 path];
  id v10 = [v7 url];
  unsigned __int8 v11 = [v10 path];
  [(RCServiceContainer *)self _logIfDiscrepancyWithKey:@"path" cloudRecordingValue:v9 legacyRecordingValue:v11];

  unsigned __int8 v12 = [v6 uuid];
  __int16 v13 = [v7 uniqueID];
  [(RCServiceContainer *)self _logIfDiscrepancyWithKey:@"uuid" cloudRecordingValue:v12 legacyRecordingValue:v13];

  id v14 = [v6 creationDate];
  __int16 v15 = [v7 date];
  [(RCServiceContainer *)self _logIfDiscrepancyWithKey:@"creationDate" cloudRecordingValue:v14 legacyRecordingValue:v15];

  id v16 = [v6 title];
  id v17 = [v7 customLabel];
  [(RCServiceContainer *)self _logIfDiscrepancyWithKey:@"customLabel" cloudRecordingValue:v16 legacyRecordingValue:v17];

  [v6 length];
  double v19 = v18;
  [v7 duration];
  if (v19 != v20)
  {
    v21 = OSLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      [v6 length];
      uint64_t v23 = v22;
      [v7 duration];
      int v29 = 136315650;
      id v30 = "-[RCServiceContainer _validateMigratedRecording:legacyRecording:]";
      __int16 v31 = 2048;
      *(void *)v32 = v23;
      *(_WORD *)&v32[8] = 2048;
      uint64_t v33 = v24;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s -- cloudRecording.length = %f, recording.length = %f", (uint8_t *)&v29, 0x20u);
    }
  }
  unsigned int v25 = [v6 audioFutureNeedsDownload];
  if (v25 != [v7 pendingRestore])
  {
    id v26 = OSLogForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v27 = [v6 audioFutureNeedsDownload];
      unsigned int v28 = [v7 pendingRestore];
      int v29 = 136315650;
      id v30 = "-[RCServiceContainer _validateMigratedRecording:legacyRecording:]";
      __int16 v31 = 1024;
      *(_DWORD *)v32 = v27;
      *(_WORD *)&void v32[4] = 1024;
      *(_DWORD *)&v32[6] = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s -- cloudRecording.audioFutureNeedsDownload = %i, recording.pendingRestore = %i", (uint8_t *)&v29, 0x18u);
    }
  }
}

- (void)_logIfDiscrepancyWithKey:(id)a3 cloudRecordingValue:(id)a4 legacyRecordingValue:(id)a5
{
  id v7 = a3;
  unint64_t v8 = (unint64_t)a4;
  unint64_t v9 = (unint64_t)a5;
  if (v8 | v9 && ([(id)v8 isEqual:v9] & 1) == 0)
  {
    id v10 = OSLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136316162;
      unsigned __int8 v12 = "-[RCServiceContainer _logIfDiscrepancyWithKey:cloudRecordingValue:legacyRecordingValue:]";
      __int16 v13 = 2112;
      id v14 = v7;
      __int16 v15 = 2112;
      unint64_t v16 = v8;
      __int16 v17 = 2112;
      id v18 = v7;
      __int16 v19 = 2112;
      unint64_t v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s -- cloudRecording.%@ = %@, recording.%@ = %@", (uint8_t *)&v11, 0x34u);
    }
  }
}

- (void).cxx_destruct
{
}

@end