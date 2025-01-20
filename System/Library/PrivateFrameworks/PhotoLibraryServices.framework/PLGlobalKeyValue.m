@interface PLGlobalKeyValue
+ (id)_debugDescriptionDateFormatter;
+ (id)_globalValueForKeyValue:(id)a3;
+ (id)allDecodeClasses;
+ (id)attributesForKey;
+ (id)debugDescriptionOfValue:(id)a3 forKey:(id)a4;
+ (id)dictionaryWithManagedObjectContext:(id)a3 forMigrationHistory:(BOOL)a4;
+ (id)entityName;
+ (id)fetchGlobalKeyValueForKey:(id)a3 withManagedObjectContext:(id)a4 createIfMissing:(BOOL)a5;
+ (id)fetchGlobalKeyValuesForKeys:(id)a3 withManagedObjectContext:(id)a4;
+ (id)globalValueForKey:(id)a3 managedObjectContext:(id)a4;
+ (id)globalValuesForKeys:(id)a3 managedObjectContext:(id)a4;
+ (signed)typeForKey:(id)a3;
+ (void)_setGlobalValue:(id)a3 forKeyValue:(id)a4 managedObjectContext:(id)a5;
+ (void)checkTypeForKey:(id)a3 andValue:(id)a4;
+ (void)initialize;
+ (void)migrateLocaleIdentifierToGlobalKeyValues:(id)a3 withPathManager:(id)a4;
+ (void)populateWithDictionary:(id)a3 managedObjectContext:(id)a4 replaceExisting:(BOOL)a5;
+ (void)setGlobalValue:(id)a3 forKey:(id)a4 managedObjectContext:(id)a5;
- (BOOL)supportsCloudUpload;
@end

@implementation PLGlobalKeyValue

+ (id)globalValueForKey:(id)a3 managedObjectContext:(id)a4
{
  v5 = [a1 fetchGlobalKeyValueForKey:a3 withManagedObjectContext:a4 createIfMissing:0];
  v6 = [a1 _globalValueForKeyValue:v5];

  return v6;
}

+ (id)fetchGlobalKeyValueForKey:(id)a3 withManagedObjectContext:(id)a4 createIfMissing:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)MEMORY[0x1E4F1C0D0];
  v11 = [a1 entityName];
  v12 = [v10 fetchRequestWithEntityName:v11];

  v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"key", v8];
  [v12 setPredicate:v13];

  id v19 = 0;
  v14 = [v9 executeFetchRequest:v12 error:&v19];
  id v15 = v19;
  if (v14)
  {
    v16 = [v14 firstObject];
    if (!v16 && v5)
    {
      v16 = +[PLManagedObject insertInManagedObjectContext:v9];
      [v16 setKey:v8];
    }
  }
  else
  {
    v17 = PLBackendGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v15;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Error fetching GlobalKeyValue for key %{public}@, error: %@", buf, 0x16u);
    }

    v16 = 0;
  }

  return v16;
}

+ (id)entityName
{
  return @"GlobalKeyValue";
}

+ (id)_globalValueForKeyValue:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    v6 = [v4 key];
    int v7 = [a1 typeForKey:v6];

    switch(v7)
    {
      case 1:
        uint64_t v8 = [v5 BOOLValue];
        goto LABEL_12;
      case 2:
        v10 = [v5 key];
        int v11 = [v10 isEqualToString:@"ImportedFileSystemAssets"];

        v12 = [v5 integerValue];
        id v9 = v12;
        if (v11)
        {
          if (v12)
          {
            id v13 = v12;
          }
          else
          {
            id v13 = [v5 BOOLValue];
          }
          id v15 = v13;

          id v9 = v15;
        }
        break;
      case 3:
        uint64_t v8 = [v5 doubleValue];
        goto LABEL_12;
      case 4:
        uint64_t v8 = [v5 dateValue];
        goto LABEL_12;
      case 5:
        uint64_t v8 = [v5 stringValue];
        goto LABEL_12;
      case 6:
        uint64_t v8 = [v5 anyValue];
LABEL_12:
        id v9 = (void *)v8;
        break;
      default:
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    id v9 = 0;
  }

  return v9;
}

+ (void)initialize
{
}

- (BOOL)supportsCloudUpload
{
  return 0;
}

+ (void)migrateLocaleIdentifierToGlobalKeyValues:(id)a3 withPathManager:(id)a4
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v5 = a3;
  id v7 = (id)[[v4 alloc] initWithSuiteName:@"com.apple.mobileslideshow"];
  v6 = [v7 objectForKey:@"com.apple.Photos.LocaleIdentifier"];
  [v5 setObject:v6 forKeyedSubscript:@"LocaleIdentifier"];
}

+ (id)fetchGlobalKeyValuesForKeys:(id)a3 withManagedObjectContext:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F1C0D0];
  id v8 = a4;
  id v9 = [a1 entityName];
  v10 = [v7 fetchRequestWithEntityName:v9];

  int v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"key", v6];
  [v10 setPredicate:v11];

  id v16 = 0;
  v12 = [v8 executeFetchRequest:v10 error:&v16];

  id v13 = v16;
  if (!v12)
  {
    v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v13;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Error fetching GlobalKeyValue for keys %{public}@, error: %@", buf, 0x16u);
    }
  }
  return v12;
}

+ (void)_setGlobalValue:(id)a3 forKeyValue:(id)a4 managedObjectContext:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    int v11 = PLBackendGetLog();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v12)
      {
        id v13 = [v10 name];
        v14 = [v9 key];
        int v21 = 138412802;
        __int16 v22 = v13;
        __int16 v23 = 2114;
        uint64_t v24 = v14;
        __int16 v25 = 2112;
        id v26 = v8;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "GlobalKeyValue: (%@) setting %{public}@ = %@", (uint8_t *)&v21, 0x20u);
      }
      id v15 = [v9 key];
      uint64_t v16 = [a1 typeForKey:v15];

      [v9 setType:v16];
      switch((int)v16)
      {
        case 0:
          goto LABEL_10;
        case 1:
          v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "BOOLValue"));
          [v9 setBoolValue:v17];
          goto LABEL_13;
        case 2:
          v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "integerValue"));
          [v9 setIntegerValue:v17];
          goto LABEL_13;
        case 3:
          id v20 = NSNumber;
          [v8 doubleValue];
          v17 = objc_msgSend(v20, "numberWithDouble:");
          [v9 setDoubleValue:v17];
LABEL_13:

          break;
        case 4:
          [v9 setDateValue:v8];
          break;
        case 5:
          [v9 setStringValue:v8];
          break;
        case 6:
          [v9 setAnyValue:v8];
          break;
        default:
          break;
      }
    }
    else
    {
      if (v12)
      {
        id v18 = [v10 name];
        __int16 v19 = [v9 key];
        int v21 = 138412546;
        __int16 v22 = v18;
        __int16 v23 = 2114;
        uint64_t v24 = v19;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "GlobalKeyValue: (%@) removing %{public}@", (uint8_t *)&v21, 0x16u);
      }
LABEL_10:
      [v10 deleteObject:v9];
    }
  }
}

+ (void)populateWithDictionary:(id)a3 managedObjectContext:(id)a4 replaceExisting:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    id v10 = 0;
  }
  else
  {
    id v10 = [a1 dictionaryWithManagedObjectContext:v9 forMigrationHistory:0];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__PLGlobalKeyValue_populateWithDictionary_managedObjectContext_replaceExisting___block_invoke;
  v13[3] = &unk_1E586E120;
  id v15 = v9;
  id v16 = a1;
  id v14 = v10;
  id v11 = v9;
  id v12 = v10;
  [v8 enumerateKeysAndObjectsUsingBlock:v13];
}

void __80__PLGlobalKeyValue_populateWithDictionary_managedObjectContext_replaceExisting___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  id v8 = (void *)v7;
  if (v6 && !v7) {
    [*(id *)(a1 + 48) setGlobalValue:v6 forKey:v5 managedObjectContext:*(void *)(a1 + 40)];
  }
}

+ (id)dictionaryWithManagedObjectContext:(id)a3 forMigrationHistory:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = (void *)MEMORY[0x1E4F1C0D0];
  id v8 = [a1 entityName];
  id v9 = [v7 fetchRequestWithEntityName:v8];

  id v37 = 0;
  id v10 = [v6 executeFetchRequest:v9 error:&v37];
  id v11 = v37;
  if (v10)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obj = v10;
    uint64_t v12 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v27 = v11;
      v28 = v10;
      v29 = v9;
      id v30 = v6;
      uint64_t v14 = *(void *)v34;
      id v15 = obj;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v34 != v14) {
            objc_enumerationMutation(v15);
          }
          v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (!v4) {
            goto LABEL_9;
          }
          id v18 = [a1 attributesForKey];
          __int16 v19 = [v17 key];
          id v20 = [v18 objectForKeyedSubscript:v19];
          int v21 = [v20 includeInMigrationHistory];

          id v15 = obj;
          if (v21)
          {
LABEL_9:
            __int16 v22 = objc_msgSend(a1, "_globalValueForKeyValue:", v17, v27, v28, v29, v30);
            __int16 v23 = [v17 key];
            [v32 setObject:v22 forKeyedSubscript:v23];
          }
        }
        uint64_t v13 = [v15 countByEnumeratingWithState:&v33 objects:v40 count:16];
      }
      while (v13);
      id v9 = v29;
      id v6 = v30;
      id v11 = v27;
      id v10 = v28;
    }
  }
  else
  {
    uint64_t v24 = PLBackendGetLog();
    obj = v24;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v11;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Error fetching GlobalKeyValue for all keys, error: %@", buf, 0xCu);
    }
  }

  __int16 v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v32];

  return v25;
}

+ (id)globalValuesForKeys:(id)a3 managedObjectContext:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = [a1 fetchGlobalKeyValuesForKeys:v6 withManagedObjectContext:v7];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v15 = [a1 _globalValueForKeyValue:v14];
        id v16 = [v14 key];
        [v8 setObject:v15 forKeyedSubscript:v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v8;
}

+ (void)setGlobalValue:(id)a3 forKey:(id)a4 managedObjectContext:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [a1 checkTypeForKey:v9 andValue:v10];
  id v11 = [a1 fetchGlobalKeyValueForKey:v9 withManagedObjectContext:v8 createIfMissing:1];

  [a1 _setGlobalValue:v10 forKeyValue:v11 managedObjectContext:v8];
}

+ (void)checkTypeForKey:(id)a3 andValue:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  switch([a1 typeForKey:v14])
  {
    case 0u:
      id v7 = (void *)MEMORY[0x1E4F1CA00];
      [NSString stringWithFormat:@"No type defined for key %@", v14, v13];
      goto LABEL_20;
    case 1u:
    case 2u:
    case 3u:
      if (!v6) {
        goto LABEL_14;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_14;
      }
      id v7 = (void *)MEMORY[0x1E4F1CA00];
      [NSString stringWithFormat:@"Expect number value for key %@", v14, v13];
      goto LABEL_20;
    case 4u:
      if (!v6) {
        goto LABEL_14;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_14;
      }
      id v7 = (void *)MEMORY[0x1E4F1CA00];
      [NSString stringWithFormat:@"Expect date value for key %@", v14, v13];
      goto LABEL_20;
    case 5u:
      if (!v6) {
        goto LABEL_14;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_14;
      }
      id v7 = (void *)MEMORY[0x1E4F1CA00];
      [NSString stringWithFormat:@"Expect string value for key %@", v14, v13];
      goto LABEL_20;
    case 6u:
      if (!v6) {
        goto LABEL_14;
      }
      id v8 = [a1 attributesForKey];
      id v9 = [v8 objectForKeyedSubscript:v14];
      uint64_t v10 = [v9 anyValueClass];

      if (!v10)
      {
        id v7 = (void *)MEMORY[0x1E4F1CA00];
        [NSString stringWithFormat:@"No any-value class defined for key %@", v14, v13];
        goto LABEL_20;
      }
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v7 = (void *)MEMORY[0x1E4F1CA00];
        [NSString stringWithFormat:@"Value's class not supported for key %@, must confirm to %@", v14, v10];
        id v11 = LABEL_20:;
        id v12 = [v7 exceptionWithName:@"GlobalKeyValueTypeMismatchException" reason:v11 userInfo:0];

        objc_exception_throw(v12);
      }
LABEL_14:

      return;
    default:
      goto LABEL_14;
  }
}

+ (id)allDecodeClasses
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  BOOL v4 = [a1 attributesForKey];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__PLGlobalKeyValue_allDecodeClasses__block_invoke;
  v7[3] = &unk_1E586E0F8;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __36__PLGlobalKeyValue_allDecodeClasses__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 type] == 6 && objc_msgSend(v4, "anyValueClass")) {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(v4, "anyValueClass"));
  }
}

+ (id)debugDescriptionOfValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    uint64_t v10 = @"nil";
    goto LABEL_9;
  }
  if ([v7 isEqualToString:@"LibraryCreateOptions"])
  {
    uint64_t v9 = PLDescriptionForLibraryCreateOptions([v6 integerValue]);
  }
  else
  {
    if ([a1 typeForKey:v8] == 4)
    {
      id v11 = [a1 _debugDescriptionDateFormatter];
      uint64_t v10 = [v11 stringFromDate:v6];

      goto LABEL_9;
    }
    uint64_t v9 = [v6 description];
  }
  uint64_t v10 = (__CFString *)v9;
LABEL_9:

  return v10;
}

+ (id)_debugDescriptionDateFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
  id v3 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v2 setTimeZone:v3];

  return v2;
}

+ (signed)typeForKey:(id)a3
{
  id v4 = a3;
  id v5 = [a1 attributesForKey];
  id v6 = [v5 objectForKeyedSubscript:v4];

  LOWORD(v4) = [v6 type];
  return (__int16)v4;
}

+ (id)attributesForKey
{
  if (attributesForKey_onceToken != -1) {
    dispatch_once(&attributesForKey_onceToken, &__block_literal_global_69090);
  }
  id v2 = (void *)attributesForKey_attributesForKey;
  return v2;
}

void __36__PLGlobalKeyValue_attributesForKey__block_invoke()
{
  v83[67] = *MEMORY[0x1E4F143B8];
  v77 = +[PLGlobalKeyValueAttributes attributesWithKey:@"ImportedFileSystemAssets" type:2];
  v83[0] = v77;
  v76 = +[PLGlobalKeyValueAttributes attributesWithKey:@"ImportedFileSystemAssetsDate" type:4];
  v83[1] = v76;
  v75 = +[PLGlobalKeyValueAttributes attributesWithKey:@"JournalRebuildRequired" type:1];
  v83[2] = v75;
  v74 = +[PLGlobalKeyValueAttributes attributesWithKey:@"BackgroundJobServiceNeedsProcessing" type:1];
  v83[3] = v74;
  v73 = +[PLGlobalKeyValueAttributes attributesWithKey:@"RebuildCompleteDate" type:4];
  v83[4] = v73;
  v72 = +[PLGlobalKeyValueAttributes attributesWithKey:@"GreenValues" type:6 includeInMigrationHistory:0 anyValueClass:objc_opt_class()];
  v83[5] = v72;
  v71 = +[PLGlobalKeyValueAttributes attributesWithKey:@"LocaleIdentifier" type:5];
  v83[6] = v71;
  v70 = +[PLGlobalKeyValueAttributes attributesWithKey:@"GreenTeaContactsAuthorization" type:2];
  v83[7] = v70;
  v69 = +[PLGlobalKeyValueAttributes attributesWithKey:@"LibraryCreateOptions" type:2];
  v83[8] = v69;
  v68 = +[PLGlobalKeyValueAttributes attributesWithKey:@"LastWidgetUpdateDate" type:4];
  v83[9] = v68;
  v67 = +[PLGlobalKeyValueAttributes attributesWithKey:@"LargestWidgetPixelSize" type:2];
  v83[10] = v67;
  v66 = +[PLGlobalKeyValueAttributes attributesWithKey:@"LargestWidgetSizeDate" type:4];
  v83[11] = v66;
  v65 = +[PLGlobalKeyValueAttributes attributesWithKey:@"LastFullIndexSyndicationSyncDate" type:4];
  v83[12] = v65;
  v64 = +[PLGlobalKeyValueAttributes attributesWithKey:@"LastFullIndexSyndicationSyncStartDate" type:4];
  v83[13] = v64;
  v63 = +[PLGlobalKeyValueAttributes attributesWithKey:@"InProgressFullIndexSyndicationSyncDate" type:4];
  v83[14] = v63;
  v62 = +[PLGlobalKeyValueAttributes attributesWithKey:@"LastAttachmentSyndicationSyncDate" type:4];
  v83[15] = v62;
  v61 = +[PLGlobalKeyValueAttributes attributesWithKey:@"LastChatSyndicationSyncDate" type:4];
  v83[16] = v61;
  v60 = +[PLGlobalKeyValueAttributes attributesWithKey:@"LastDeleteSyndicationSyncDateKey" type:4];
  v83[17] = v60;
  v59 = +[PLGlobalKeyValueAttributes attributesWithKey:@"SyndicationStartDate" type:4];
  v83[18] = v59;
  v58 = +[PLGlobalKeyValueAttributes attributesWithKey:@"PLSyndicationPrefetchDownloadThrottlingDate" type:4];
  v83[19] = v58;
  v57 = +[PLGlobalKeyValueAttributes attributesWithKey:@"PLSyndicationSyncRangeDenominator" type:3];
  v83[20] = v57;
  v56 = +[PLGlobalKeyValueAttributes attributesWithKey:@"LastGuestAssetSyncToken" type:6 includeInMigrationHistory:0 anyValueClass:objc_opt_class()];
  v83[21] = v56;
  v55 = +[PLGlobalKeyValueAttributes attributesWithKey:@"GuestAssetSyncStatus" type:2];
  v83[22] = v55;
  v54 = +[PLGlobalKeyValueAttributes attributesWithKey:@"GuestAssetInitialSyncResumeMarker" type:5];
  v83[23] = v54;
  v53 = +[PLGlobalKeyValueAttributes attributesWithKey:@"LastGuestAssetSyncTargetLibraryPath" type:5];
  v83[24] = v53;
  v52 = +[PLGlobalKeyValueAttributes attributesWithKey:@"LastPersonSyncToken" type:6 includeInMigrationHistory:0 anyValueClass:objc_opt_class()];
  v83[25] = v52;
  v51 = +[PLGlobalKeyValueAttributes attributesWithKey:@"LastPersonSyncSourceLibraryPath" type:5];
  v83[26] = v51;
  v50 = +[PLGlobalKeyValueAttributes attributesWithKey:@"LastDuplicateDetectorProcessingToken" type:6 includeInMigrationHistory:0 anyValueClass:objc_opt_class()];
  v83[27] = v50;
  v49 = +[PLGlobalKeyValueAttributes attributesWithKey:@"LastInitialDuplicateDetectorProcessingCompletedToken" type:6 includeInMigrationHistory:0 anyValueClass:objc_opt_class()];
  v83[28] = v49;
  v48 = +[PLGlobalKeyValueAttributes attributesWithKey:@"AssetStackProcessingStatus" type:2];
  v83[29] = v48;
  v47 = +[PLGlobalKeyValueAttributes attributesWithKey:@"LastSharedAssetContainerUpdateToken" type:6 includeInMigrationHistory:0 anyValueClass:objc_opt_class()];
  v83[30] = v47;
  v46 = +[PLGlobalKeyValueAttributes attributesWithKey:@"LockedResourceTransitionAssetUUID" type:5];
  v83[31] = v46;
  v45 = +[PLGlobalKeyValueAttributes attributesWithKey:@"OrphanedSceneClassificationsCount" type:2];
  v83[32] = v45;
  v44 = +[PLGlobalKeyValueAttributes attributesWithKey:@"CloudTrackerLastKnownCloudVersion" type:5];
  v83[33] = v44;
  v43 = +[PLGlobalKeyValueAttributes attributesWithKey:@"CloudTrackerLastKnownTransactionStoreUUID" type:5];
  v83[34] = v43;
  v42 = +[PLGlobalKeyValueAttributes attributesWithKey:@"CloudTrackerLastKnownTransactionNumber" type:2];
  v83[35] = v42;
  uint64_t v41 = +[PLGlobalKeyValueAttributes attributesWithKey:@"CloudInitialUploadDate" type:4];
  v83[36] = v41;
  v40 = +[PLGlobalKeyValueAttributes attributesWithKey:@"LibraryScopeRulesTrackerLastKnownStoreUUID" type:5];
  v83[37] = v40;
  id v39 = +[PLGlobalKeyValueAttributes attributesWithKey:@"LibraryScopeRulesTrackerLastKnownTransactionNumber" type:2];
  v83[38] = v39;
  v38 = +[PLGlobalKeyValueAttributes attributesWithKey:@"LastCompletePrefetchDate" type:4];
  v83[39] = v38;
  id v37 = +[PLGlobalKeyValueAttributes attributesWithKey:@"SearchIndexVersion" type:2];
  v83[40] = v37;
  long long v36 = +[PLGlobalKeyValueAttributes attributesWithKey:@"SearchIndexEmbeddingModelVersionKey" type:2];
  v83[41] = v36;
  long long v35 = +[PLGlobalKeyValueAttributes attributesWithKey:@"SearchIndexUtilityTypeClassifierVersion" type:2];
  v83[42] = v35;
  long long v34 = +[PLGlobalKeyValueAttributes attributesWithKey:@"SearchIndexLocaleIdentifier" type:5];
  v83[43] = v34;
  long long v33 = +[PLGlobalKeyValueAttributes attributesWithKey:@"SearchIndexSceneTaxonomySHA" type:5];
  v83[44] = v33;
  id v32 = +[PLGlobalKeyValueAttributes attributesWithKey:@"SearchIndexFeatureSettings" type:2];
  v83[45] = v32;
  v31 = +[PLGlobalKeyValueAttributes attributesWithKey:@"SearchIndexStatus" type:2];
  v83[46] = v31;
  id v30 = +[PLGlobalKeyValueAttributes attributesWithKey:@"SearchIndexRebuildResumeMarker" type:5];
  v83[47] = v30;
  v28 = +[PLGlobalKeyValueAttributes attributesWithKey:@"SearchIndexSpotlightClientState" type:6 includeInMigrationHistory:0 anyValueClass:objc_opt_class()];
  v83[48] = v28;
  id v27 = +[PLGlobalKeyValueAttributes attributesWithKey:@"SearchIndexSpotlightClientStateMissingCount" type:2];
  v83[49] = v27;
  id v26 = +[PLGlobalKeyValueAttributes attributesWithKey:@"SearchIndexSpotlightClientStateMismatchedCount" type:2];
  v83[50] = v26;
  __int16 v25 = +[PLGlobalKeyValueAttributes attributesWithKey:@"SearchIndexRebuildRequiredExternalReason" type:2];
  v83[51] = v25;
  uint64_t v24 = +[PLGlobalKeyValueAttributes attributesWithKey:@"SearchIndexRebuildStartDate" type:4];
  v83[52] = v24;
  uint64_t v23 = +[PLGlobalKeyValueAttributes attributesWithKey:@"SearchIndexRebuildEndDate" type:4];
  v83[53] = v23;
  __int16 v22 = +[PLGlobalKeyValueAttributes attributesWithKey:@"SearchIndexRebuildCoalescedReasons" type:2];
  v83[54] = v22;
  long long v21 = +[PLGlobalKeyValueAttributes attributesWithKey:@"LastUpdatedGraphLabel" type:5];
  v83[55] = v21;
  long long v20 = +[PLGlobalKeyValueAttributes attributesWithKey:@"FeatureAvailabilityKey" type:6 includeInMigrationHistory:0 anyValueClass:objc_opt_class()];
  v83[56] = v20;
  v0 = +[PLGlobalKeyValueAttributes attributesWithKey:@"TimeOfLastFeatureAvailabilityJob" type:4];
  v83[57] = v0;
  v1 = +[PLGlobalKeyValueAttributes attributesWithKey:@"FeatureAvailabilityJobDidFailKey" type:1];
  v83[58] = v1;
  id v2 = +[PLGlobalKeyValueAttributes attributesWithKey:@"SearchFeatureReadyDate" type:4];
  v83[59] = v2;
  id v3 = +[PLGlobalKeyValueAttributes attributesWithKey:@"SearchFeatureReadyFraction" type:3];
  v83[60] = v3;
  id v4 = +[PLGlobalKeyValueAttributes attributesWithKey:@"MemoriesCreationPreviewAvailableDate" type:4];
  v83[61] = v4;
  id v5 = +[PLGlobalKeyValueAttributes attributesWithKey:@"DateOfLastExternalAvailabilitySignal" type:4];
  v83[62] = v5;
  id v6 = +[PLGlobalKeyValueAttributes attributesWithKey:@"MediaAnalysisEmbeddingVersion" type:2];
  v83[63] = v6;
  id v7 = +[PLGlobalKeyValueAttributes attributesWithKey:@"MediaAnalysisEmbeddingVersionBumpDate" type:4];
  v83[64] = v7;
  id v8 = +[PLGlobalKeyValueAttributes attributesWithKey:@"LibraryReadyForAnalysisDate" type:4];
  v83[65] = v8;
  uint64_t v9 = +[PLGlobalKeyValueAttributes attributesWithKey:@"LocationOfInterestUpdateDate" type:4];
  v83[66] = v9;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:67];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v11 = v29;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v78 objects:v82 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v79 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v78 + 1) + 8 * i);
        v17 = [v16 key];
        [v10 setObject:v16 forKeyedSubscript:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v78 objects:v82 count:16];
    }
    while (v13);
  }

  uint64_t v18 = [v10 copy];
  long long v19 = (void *)attributesForKey_attributesForKey;
  attributesForKey_attributesForKey = v18;
}

@end