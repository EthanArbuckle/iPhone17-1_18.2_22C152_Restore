@interface PLAppDeletion
+ (BOOL)changeClassProtection:(int)a3;
+ (BOOL)changePermissionForDirectory:(id)a3 withProtectionLevel:(id)a4;
+ (BOOL)changePermissionsForFilesInDirectory:(id)a3 withProtectionLevel:(id)a4;
+ (BOOL)deferXPCActivity:(id)a3;
+ (BOOL)finishXPCActivity:(id)a3;
+ (BOOL)setFileProtectionForPath:(id)a3 withLevel:(id)a4;
+ (id)appDeletionCriteria;
+ (id)constructUpdateQueries;
+ (id)filePermissionCriteria;
+ (id)getProtectionLevel:(int)a3;
+ (id)pluginsForBundleID:(id)a3;
+ (id)processNameForBundleID:(id)a3;
+ (void)addFilesToList:(id)a3;
+ (void)constructAppReferenceMapping;
+ (void)constructAppReferenceTableList;
+ (void)constructFileNames;
+ (void)constructUpdateQueries;
+ (void)deleteAppReferenceMapping;
+ (void)deleteAppReferences:(id)a3;
+ (void)deleteAppReferencesFromCompressedFiles:(id)a3;
+ (void)deleteAppReferencesInCurrentPowerlog;
+ (void)filePermissionCriteria;
+ (void)handleAppDeletionXPCActivityCallback:(id)a3;
+ (void)handleFilePermissionXPCActivityCallback:(id)a3;
+ (void)iterateAgents;
+ (void)iterateServices;
+ (void)maskAssociatedPlugins:(id)a3 withMaskedDictionary:(id)a4;
+ (void)maskProcessName:(id)a3 withMaskedDictionary:(id)a4;
+ (void)populateIdentifiers:(id)a3;
+ (void)registerAppDeletionActivity;
+ (void)registerFilePermissionActivity;
+ (void)resetStateVariables;
+ (void)setup;
+ (void)traverseVersionDirectory:(id)a3 withBlock:(id)a4;
+ (void)updateQuery:(id)a3;
@end

@implementation PLAppDeletion

+ (id)getProtectionLevel:(int)a3
{
  if (!a3)
  {
    v4 = (id *)MEMORY[0x1E4F28348];
LABEL_5:
    id v5 = *v4;
    return v5;
  }
  if (a3 == 1)
  {
    v4 = (id *)MEMORY[0x1E4F28358];
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

+ (void)traverseVersionDirectory:(id)a3 withBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v8 = [v7 contentsOfDirectoryAtPath:v5 error:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__PLAppDeletion_traverseVersionDirectory_withBlock___block_invoke;
  v11[3] = &unk_1E6253FD8;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  [v8 enumerateObjectsUsingBlock:v11];
}

void __52__PLAppDeletion_traverseVersionDirectory_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) stringByAppendingPathComponent:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (BOOL)setFileProtectionForPath:(id)a3 withLevel:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v20 = *MEMORY[0x1E4F28370];
  v21[0] = v6;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  id v13 = 0;
  char v9 = [v7 setAttributes:v8 ofItemAtPath:v5 error:&v13];
  id v10 = v13;

  if (v10)
  {
    v11 = PLLogAppDeletion();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_error_impl(&dword_1BBD2F000, v11, OS_LOG_TYPE_ERROR, "Failed to set file protection %@ for file at path: %@ with error: %@", buf, 0x20u);
    }
  }
  return v9;
}

+ (BOOL)changePermissionsForFilesInDirectory:(id)a3 withProtectionLevel:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v8 contentsOfDirectoryAtPath:v6 error:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v22;
    *(void *)&long long v11 = 138412546;
    long long v20 = v11;
    while (2)
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = objc_msgSend(v6, "stringByAppendingPathComponent:", *(void *)(*((void *)&v21 + 1) + 8 * v14), v20, (void)v21);
        __int16 v16 = PLLogAppDeletion();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v20;
          v26 = v15;
          __int16 v27 = 2112;
          id v28 = v7;
          _os_log_debug_impl(&dword_1BBD2F000, v16, OS_LOG_TYPE_DEBUG, "Changing permission for file %@ to %@", buf, 0x16u);
        }

        if (([a1 setFileProtectionForPath:v15 withLevel:v7] & 1) == 0)
        {
          __int16 v18 = PLLogAppDeletion();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            +[PLAppDeletion changePermissionsForFilesInDirectory:withProtectionLevel:]();
          }

          BOOL v17 = 0;
          goto LABEL_15;
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 1;
LABEL_15:

  return v17;
}

+ (BOOL)changePermissionForDirectory:(id)a3 withProtectionLevel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__PLAppDeletion_changePermissionForDirectory_withProtectionLevel___block_invoke;
  v10[3] = &unk_1E6254F10;
  uint64_t v12 = &v14;
  id v13 = a1;
  id v8 = v7;
  id v11 = v8;
  [a1 traverseVersionDirectory:v6 withBlock:v10];
  LOBYTE(a1) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)a1;
}

void __66__PLAppDeletion_changePermissionForDirectory_withProtectionLevel___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 48) changePermissionsForFilesInDirectory:v3 withProtectionLevel:*(void *)(a1 + 32)];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v4 = PLLogAppDeletion();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66__PLAppDeletion_changePermissionForDirectory_withProtectionLevel___block_invoke_cold_1();
    }
  }
}

+ (BOOL)changeClassProtection:(int)a3
{
  id v5 = objc_msgSend(a1, "getProtectionLevel:");
  if (!v5)
  {
    id v13 = PLLogAppDeletion();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[PLAppDeletion changeClassProtection:](a3, v13);
    }
    goto LABEL_13;
  }
  id v6 = +[PLUtilities containerPath];
  id v7 = [v6 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs/MajorVersion"];
  char v8 = [a1 changePermissionForDirectory:v7 withProtectionLevel:v5];

  if ((v8 & 1) == 0)
  {
    id v13 = PLLogAppDeletion();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[PLAppDeletion changeClassProtection:].cold.4();
    }
    goto LABEL_13;
  }
  id v9 = +[PLUtilities containerPath];
  uint64_t v10 = [v9 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs/MinorVersion"];
  char v11 = [a1 changePermissionForDirectory:v10 withProtectionLevel:v5];

  uint64_t v12 = PLLogAppDeletion();
  id v13 = v12;
  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[PLAppDeletion changeClassProtection:]();
    }
LABEL_13:
    BOOL v14 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    +[PLAppDeletion changeClassProtection:]();
  }
  BOOL v14 = 1;
LABEL_14:

  return v14;
}

+ (id)filePermissionCriteria
{
  v2 = PLLogAppDeletion();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    +[PLAppDeletion filePermissionCriteria]();
  }

  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14318], 1);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  return v3;
}

+ (void)registerFilePermissionActivity
{
  xpc_object_t v3 = [a1 filePermissionCriteria];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __47__PLAppDeletion_registerFilePermissionActivity__block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = a1;
  xpc_activity_register("com.apple.powerlogd.XPCFilePermissionScheduler", v3, handler);
}

void __47__PLAppDeletion_registerFilePermissionActivity__block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t v3 = a2;
  if (xpc_activity_get_state(v3) == 2)
  {
    [*(id *)(a1 + 32) handleFilePermissionXPCActivityCallback:v3];
  }
  else
  {
    v4 = PLLogAppDeletion();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __47__PLAppDeletion_registerFilePermissionActivity__block_invoke_cold_1();
    }
  }
}

+ (void)handleFilePermissionXPCActivityCallback:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[PLAppDeletion changeClassProtection:1];
  id v6 = PLLogAppDeletion();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      +[PLAppDeletion handleFilePermissionXPCActivityCallback:]();
    }

    [a1 finishXPCActivity:v4];
    [a1 registerAppDeletionActivity];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v8 = 0;
      _os_log_impl(&dword_1BBD2F000, v7, OS_LOG_TYPE_DEFAULT, "Deferring activity as changing class protection to ClassC failed", v8, 2u);
    }

    if (([a1 deferXPCActivity:v4] & 1) == 0) {
      [a1 finishXPCActivity:v4];
    }
  }
}

+ (void)setup
{
  [a1 constructAppReferenceTableList];
  [a1 constructFileNames];
  [a1 constructAppReferenceMapping];
  id v3 = (id)[a1 constructUpdateQueries];
}

+ (void)resetStateVariables
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  processedFilesCounter = 0;
  v2 = [(id)listOfFileNames allKeys];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [(id)listOfFileNames setObject:&unk_1F1580BA0 forKeyedSubscript:*(void *)(*((void *)&v8 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"PLAppDeletionActivityComplete" object:0 userInfo:0];
}

+ (id)pluginsForBundleID:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [[PLValueComparison alloc] initWithKey:@"PluginParentApp" withValue:v3 withComparisonOperation:0];

  uint64_t v5 = +[PowerlogCore sharedCore];
  uint64_t v6 = [v5 storage];
  v10[0] = v4;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  long long v8 = [v6 entriesForKey:@"PLApplicationAgent_EventNone_AllPlugins" withComparisons:v7];

  return v8;
}

+ (void)maskAssociatedPlugins:(id)a3 withMaskedDictionary:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a1 pluginsForBundleID:a3];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
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
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = [v12 objectForKeyedSubscript:@"PluginId"];

        if (v13)
        {
          BOOL v14 = (void *)_MergedGlobals;
          id v15 = [v12 objectForKeyedSubscript:@"PluginId"];
          [v14 setObject:v6 forKeyedSubscript:v15];
        }
        uint64_t v16 = [v12 objectForKeyedSubscript:@"PluginExecutableName"];

        if (v16)
        {
          char v17 = (void *)qword_1EBA00470;
          __int16 v18 = [v12 objectForKeyedSubscript:@"PluginExecutableName"];
          [v17 setObject:v6 forKeyedSubscript:v18];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
}

+ (id)processNameForBundleID:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [[PLValueComparison alloc] initWithKey:@"BundleID" withValue:v3 withComparisonOperation:0];

  uint64_t v5 = +[PowerlogCore sharedCore];
  id v6 = [v5 storage];
  v11[0] = v4;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v8 = [v6 lastEntryForKey:@"PLProcessMonitorAgent_EventForward_ProcessID" withComparisons:v7 isSingleton:1];

  uint64_t v9 = [v8 objectForKeyedSubscript:@"ProcessName"];

  return v9;
}

+ (void)maskProcessName:(id)a3 withMaskedDictionary:(id)a4
{
  id v7 = a4;
  id v6 = [a1 processNameForBundleID:a3];
  if (v6) {
    [(id)qword_1EBA00470 setObject:v7 forKeyedSubscript:v6];
  }
}

+ (void)constructAppReferenceMapping
{
  uint64_t v7 = [a2 entryID];
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_debug_impl(&dword_1BBD2F000, a4, OS_LOG_TYPE_DEBUG, "AppDeletion : already processed this entry %lld", a1, 0xCu);
}

+ (void)populateIdentifiers:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v27;
    unint64_t v7 = 0x1E6253000uLL;
    id v21 = v3;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v26 + 1) + 8 * v8);
        uint64_t v10 = (void *)MEMORY[0x1C1869120]();
        long long v11 = [*(id *)(v7 + 1088) sharedSQLiteConnection];
        int v12 = [v11 tableExistsForTableName:v9];

        if (v12)
        {
          uint64_t v13 = +[PLEntryDefinition definitionForEntryKey:v9];
          if (+[PLEntryDefinition hasAppIdentifierKeysForEntryDefinition:v13])
          {
            BOOL v14 = objc_opt_new();
            id v15 = objc_opt_new();
            uint64_t v16 = objc_opt_new();
            char v17 = +[PLEntryDefinition keyConfigsForEntryDefinition:v13];
            v22[0] = MEMORY[0x1E4F143A8];
            v22[1] = 3221225472;
            v22[2] = __37__PLAppDeletion_populateIdentifiers___block_invoke;
            v22[3] = &unk_1E6253BD0;
            id v18 = v14;
            id v23 = v18;
            id v19 = v15;
            id v24 = v19;
            id v20 = v16;
            id v25 = v20;
            [v17 enumerateKeysAndObjectsUsingBlock:v22];
            if ([v18 count]) {
              [(id)tableNameToBundleIdentifier setObject:v18 forKeyedSubscript:v9];
            }
            if ([v19 count]) {
              [(id)tableNameToAppIdentifier setObject:v19 forKeyedSubscript:v9];
            }
            if ([v20 count]) {
              [(id)tableNameToProcessIdentifier setObject:v20 forKeyedSubscript:v9];
            }

            id v3 = v21;
            unint64_t v7 = 0x1E6253000;
          }
        }
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v5);
  }
}

void __37__PLAppDeletion_populateIdentifiers___block_invoke(id *a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"BundleID"];
  int v7 = [v6 BOOLValue];

  if (v7) {
    [a1[4] addObject:v12];
  }
  uint64_t v8 = [v5 objectForKeyedSubscript:@"AppName"];
  int v9 = [v8 BOOLValue];

  if (v9) {
    [a1[5] addObject:v12];
  }
  uint64_t v10 = [v5 objectForKeyedSubscript:@"ProcessName"];
  int v11 = [v10 BOOLValue];

  if (v11) {
    [a1[6] addObject:v12];
  }
}

+ (void)iterateAgents
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = +[PowerlogCore sharedCore];
  uint64_t v4 = [v3 agents];
  id v5 = [v4 allOperators];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) entryKeys];
        int v11 = (void *)[v10 copy];

        [a1 populateIdentifiers:v11];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

+ (void)iterateServices
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = +[PowerlogCore sharedCore];
  uint64_t v4 = [v3 services];
  id v5 = [v4 allOperators];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) entryKeys];
        int v11 = (void *)[v10 copy];

        [a1 populateIdentifiers:v11];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

+ (void)constructAppReferenceTableList
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "AppDeletion : tableNameToBundleIdentifier is %@", v2, v3, v4, v5, v6);
}

uint64_t __47__PLAppDeletion_constructAppReferenceTableList__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = (void *)tableNameToBundleIdentifier;
  tableNameToBundleIdentifier = v2;

  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = (void *)tableNameToAppIdentifier;
  tableNameToAppIdentifier = v4;

  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v7 = (void *)tableNameToProcessIdentifier;
  tableNameToProcessIdentifier = v6;

  [*(id *)(a1 + 32) iterateAgents];
  [*(id *)(a1 + 32) iterateServices];
  uint64_t v8 = (void *)tableNameToBundleIdentifier;
  return [v8 setObject:&unk_1F1585B68 forKeyedSubscript:@"PLAccountingOperator_EventNone_Nodes"];
}

+ (id)constructUpdateQueries
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)updateQueries;
  updateQueries = v2;

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__PLAppDeletion_constructUpdateQueries__block_invoke;
  v7[3] = &unk_1E6254F58;
  uint64_t v8 = @"PLApplicationAgent_EventNone_AllApps";
  uint64_t v9 = @"AppDistributorID";
  [(id)tableNameToBundleIdentifier enumerateKeysAndObjectsUsingBlock:v7];
  [(id)tableNameToAppIdentifier enumerateKeysAndObjectsUsingBlock:&__block_literal_global_103];
  [(id)tableNameToProcessIdentifier enumerateKeysAndObjectsUsingBlock:&__block_literal_global_105];
  uint64_t v4 = PLLogAppDeletion();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[PLAppDeletion constructUpdateQueries]();
  }

  id v5 = (id)updateQueries;
  return v5;
}

void __39__PLAppDeletion_constructUpdateQueries__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obuint64_t j = a3;
  uint64_t v42 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v42)
  {
    uint64_t v41 = *(void *)v60;
    uint64_t v6 = &containerPath_containerPath;
    id v50 = v5;
    uint64_t v47 = a1;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v60 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v43 = v7;
        uint64_t v8 = *(void *)(*((void *)&v59 + 1) + 8 * v7);
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v45 = (id)v6[143];
        id v48 = (id)[v45 countByEnumeratingWithState:&v55 objects:v66 count:16];
        if (v48)
        {
          uint64_t v46 = *(void *)v56;
          uint64_t v44 = v8;
          do
          {
            for (uint64_t i = 0; i != v48; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v56 != v46) {
                objc_enumerationMutation(v45);
              }
              uint64_t v10 = *(void *)(*((void *)&v55 + 1) + 8 * i);
              int v11 = [v5 isEqualToString:*(void *)(a1 + 32)];
              long long v12 = (void *)MEMORY[0x1E4F28E78];
              if (v11)
              {
                uint64_t v13 = *(void *)(a1 + 32);
                uint64_t v14 = *(void *)(a1 + 40);
                long long v15 = [(id)v6[143] objectForKeyedSubscript:v10];
                uint64_t v16 = [v15 objectForKeyedSubscript:@"MaskedName"];
                objc_msgSend(v12, "stringWithFormat:", @"UPDATE '%@' SET %@ ='%@' WHERE %@ = '%@' AND AppDeletedDate != 0;",
                  v13,
                  v14,
                  v16,
                  v8,
                uint64_t v17 = v10);

                [(id)updateQueries addObject:v17];
                id v18 = PLLogAppDeletion();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v65 = v17;
                  _os_log_debug_impl(&dword_1BBD2F000, v18, OS_LOG_TYPE_DEBUG, "AppDeletion : updateQueries for AppDistributorID is %@", buf, 0xCu);
                }

                id v19 = (void *)MEMORY[0x1E4F28E78];
                id v20 = [(id)qword_1EBA00478 objectForKeyedSubscript:v10];
                id v21 = [v20 objectForKeyedSubscript:@"MaskedName"];
                uint64_t v8 = v44;
                id v5 = v50;
                objc_msgSend(v19, "stringWithFormat:", @"UPDATE '%@' SET %@ ='%@' WHERE %@ = '%@' AND AppDeletedDate != 0;",
                  v50,
                  v44,
                  v21,
                  v44,
                long long v22 = v10);

                [(id)updateQueries addObject:v22];
              }
              else
              {
                id v23 = [(id)v6[143] objectForKeyedSubscript:v10];
                id v24 = [v23 objectForKeyedSubscript:@"MaskedName"];
                id v25 = [(id)v6[143] objectForKeyedSubscript:v10];
                long long v26 = [v25 objectForKeyedSubscript:@"DeleteTimestamp"];
                [v26 doubleValue];
                objc_msgSend(v12, "stringWithFormat:", @"UPDATE '%@' SET %@ ='%@' WHERE %@ = '%@' AND timestamp <= %f;",
                  v5,
                  v8,
                  v24,
                  v8,
                  v10,
                uint64_t v17 = v27);

                [(id)updateQueries addObject:v17];
              }

              a1 = v47;
              uint64_t v6 = &containerPath_containerPath;
            }
            id v48 = (id)[v45 countByEnumeratingWithState:&v55 objects:v66 count:16];
          }
          while (v48);
        }

        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v49 = (id)_MergedGlobals;
        uint64_t v28 = [v49 countByEnumeratingWithState:&v51 objects:v63 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v52;
          do
          {
            for (uint64_t j = 0; j != v29; ++j)
            {
              if (*(void *)v52 != v30) {
                objc_enumerationMutation(v49);
              }
              uint64_t v32 = *(void *)(*((void *)&v51 + 1) + 8 * j);
              v33 = (void *)MEMORY[0x1E4F28E78];
              v34 = [(id)_MergedGlobals objectForKeyedSubscript:v32];
              v35 = [v34 objectForKeyedSubscript:@"MaskedName"];
              v36 = [(id)_MergedGlobals objectForKeyedSubscript:v32];
              v37 = [v36 objectForKeyedSubscript:@"DeleteTimestamp"];
              [v37 doubleValue];
              objc_msgSend(v33, "stringWithFormat:", @"UPDATE '%@' SET %@ ='%@' WHERE %@ = '%@' AND timestamp <= %f;",
                v50,
                v8,
                v35,
                v8,
                v32,
              v39 = v38);

              [(id)updateQueries addObject:v39];
            }
            uint64_t v29 = [v49 countByEnumeratingWithState:&v51 objects:v63 count:16];
          }
          while (v29);
        }

        uint64_t v7 = v43 + 1;
        id v5 = v50;
        a1 = v47;
        uint64_t v6 = &containerPath_containerPath;
      }
      while (v43 + 1 != v42);
      uint64_t v42 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
    }
    while (v42);
  }
}

void __39__PLAppDeletion_constructUpdateQueries__block_invoke_101(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v23 = a2;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = a3;
  uint64_t v20 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v29;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v4;
        uint64_t v5 = *(void *)(*((void *)&v28 + 1) + 8 * v4);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v22 = (id)qword_1EBA00480;
        uint64_t v6 = [v22 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v25 != v8) {
                objc_enumerationMutation(v22);
              }
              uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * i);
              int v11 = (void *)MEMORY[0x1E4F28E78];
              long long v12 = [(id)qword_1EBA00480 objectForKeyedSubscript:v10];
              uint64_t v13 = [v12 objectForKeyedSubscript:@"MaskedName"];
              uint64_t v14 = [(id)qword_1EBA00480 objectForKeyedSubscript:v10];
              long long v15 = [v14 objectForKeyedSubscript:@"DeleteTimestamp"];
              [v15 doubleValue];
              objc_msgSend(v11, "stringWithFormat:", @"UPDATE '%@' SET %@ ='%@' WHERE %@ = '%@' AND timestamp <= %f;",
                v23,
                v5,
                v13,
                v5,
                v10,
              uint64_t v17 = v16);

              [(id)updateQueries addObject:v17];
            }
            uint64_t v7 = [v22 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v7);
        }

        uint64_t v4 = v21 + 1;
      }
      while (v21 + 1 != v20);
      uint64_t v20 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v20);
  }
}

void __39__PLAppDeletion_constructUpdateQueries__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v23 = a2;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = a3;
  uint64_t v20 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v29;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v4;
        uint64_t v5 = *(void *)(*((void *)&v28 + 1) + 8 * v4);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v22 = (id)qword_1EBA00470;
        uint64_t v6 = [v22 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v25 != v8) {
                objc_enumerationMutation(v22);
              }
              uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * i);
              int v11 = (void *)MEMORY[0x1E4F28E78];
              long long v12 = [(id)qword_1EBA00470 objectForKeyedSubscript:v10];
              uint64_t v13 = [v12 objectForKeyedSubscript:@"MaskedName"];
              uint64_t v14 = [(id)qword_1EBA00470 objectForKeyedSubscript:v10];
              long long v15 = [v14 objectForKeyedSubscript:@"DeleteTimestamp"];
              [v15 doubleValue];
              objc_msgSend(v11, "stringWithFormat:", @"UPDATE '%@' SET %@ ='%@' WHERE %@ = '%@' AND timestamp <= %f;",
                v23,
                v5,
                v13,
                v5,
                v10,
              uint64_t v17 = v16);

              [(id)updateQueries addObject:v17];
            }
            uint64_t v7 = [v22 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v7);
        }

        uint64_t v4 = v21 + 1;
      }
      while (v21 + 1 != v20);
      uint64_t v20 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v20);
  }
}

+ (void)addFilesToList:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v13 contentsOfDirectoryAtPath:v3 error:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v9 = NSString;
        uint64_t v10 = [v8 pathExtension];
        int v11 = [v9 stringWithFormat:@".%@", v10];

        if ([v11 isEqualToString:@".gz"])
        {
          long long v12 = [v3 stringByAppendingPathComponent:v8];
          [(id)listOfFileNames setObject:&unk_1F1580BA0 forKeyedSubscript:v12];
        }
        else
        {
          long long v12 = PLLogAppDeletion();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v20 = v8;
            _os_log_debug_impl(&dword_1BBD2F000, v12, OS_LOG_TYPE_DEBUG, "AppDeletion : skipping non-gz file %@", buf, 0xCu);
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v5);
  }
}

+ (void)constructFileNames
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = (void *)listOfFileNames;
  listOfFileNames = v3;

  uint64_t v5 = +[PLUtilities containerPath];
  uint64_t v6 = [v5 stringByAppendingString:@"/Library/BatteryLife/Archives/"];
  [a1 addFilesToList:v6];

  uint64_t v7 = +[PLUtilities containerPath];
  uint64_t v8 = [v7 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs/MajorVersion"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __35__PLAppDeletion_constructFileNames__block_invoke;
  v12[3] = &__block_descriptor_40_e18_v16__0__NSString_8l;
  v12[4] = a1;
  +[PLAppDeletion traverseVersionDirectory:v8 withBlock:v12];

  uint64_t v9 = +[PLUtilities containerPath];
  uint64_t v10 = [v9 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs/MinorVersion"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __35__PLAppDeletion_constructFileNames__block_invoke_2;
  v11[3] = &__block_descriptor_40_e18_v16__0__NSString_8l;
  void v11[4] = a1;
  +[PLAppDeletion traverseVersionDirectory:v10 withBlock:v11];
}

uint64_t __35__PLAppDeletion_constructFileNames__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addFilesToList:a2];
}

uint64_t __35__PLAppDeletion_constructFileNames__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addFilesToList:a2];
}

+ (void)updateQuery:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  errmsg = 0;
  ppDb = 0;
  id v3 = a3;
  if (sqlite3_open_v2((const char *)[v3 UTF8String], &ppDb, 2, 0))
  {
    uint64_t v4 = PLLogAppDeletion();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      +[PLAppDeletion updateQuery:]();
    }
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v4 = (id)updateQueries;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v29 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      id v16 = v3;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v10 = (void *)MEMORY[0x1C1869120]();
          int v11 = ppDb;
          id v12 = v9;
          int v13 = sqlite3_exec(v11, (const char *)[v12 UTF8String], 0, 0, &errmsg);
          if (v13)
          {
            int v14 = v13;
            long long v15 = PLLogAppDeletion();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              id v24 = v12;
              __int16 v25 = 1024;
              int v26 = v14;
              __int16 v27 = 2080;
              long long v28 = errmsg;
              _os_log_error_impl(&dword_1BBD2F000, v15, OS_LOG_TYPE_ERROR, "failed to execute update query %@ - %d and %s", buf, 0x1Cu);
            }

            sqlite3_free(errmsg);
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v29 count:16];
      }
      while (v6);
      id v3 = v16;
    }
  }

  sqlite3_close(ppDb);
}

+ (void)deleteAppReferencesFromCompressedFiles:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  activity = (_xpc_activity_s *)a3;
  uint64_t v30 = [MEMORY[0x1E4F28CB8] defaultManager];
  [(id)listOfFileNames allKeys];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v37 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v8 = [(id)listOfFileNames objectForKeyedSubscript:v7];
        int v9 = [v8 intValue];

        if (v9)
        {
          uint64_t v10 = PLLogAppDeletion();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v41 = v7;
            _os_log_impl(&dword_1BBD2F000, v10, OS_LOG_TYPE_DEFAULT, "AppDeletion : filename %@ is processed", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v10 = [v7 stringByDeletingLastPathComponent];
          int v11 = [v7 lastPathComponent];
          id v12 = [v11 stringByDeletingPathExtension];

          int v13 = [v10 stringByAppendingPathComponent:v12];
          int v14 = PLLogAppDeletion();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v41 = v7;
            _os_log_impl(&dword_1BBD2F000, v14, OS_LOG_TYPE_DEFAULT, "AppDeletion : invoking decompress on file %@", buf, 0xCu);
          }

          BOOL v15 = +[PLUtilities decompressWithSource:v7 withDestination:v13 withRemoveSrc:1];
          id v16 = PLLogAppDeletion();
          long long v17 = v16;
          if (v15)
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v41 = v13;
              _os_log_debug_impl(&dword_1BBD2F000, v17, OS_LOG_TYPE_DEBUG, "AppDeletion : invoking update query on file %@", buf, 0xCu);
            }

            [a1 updateQuery:v13];
            long long v18 = PLLogAppDeletion();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v41 = v13;
              _os_log_impl(&dword_1BBD2F000, v18, OS_LOG_TYPE_DEFAULT, "AppDeletion : invoking compress on file %@", buf, 0xCu);
            }

            +[PLUtilities compressWithSource:v13 withDestination:v7 withLevel:4];
            [v30 removeItemAtPath:v13 error:0];
            long long v19 = [v13 stringByAppendingString:@"-shm"];
            [v30 removeItemAtPath:v19 error:0];

            long long v20 = [v13 stringByAppendingString:@"-wal"];
            [v30 removeItemAtPath:v20 error:0];

            [(id)listOfFileNames setObject:&unk_1F1580BB8 forKeyedSubscript:v7];
            uint64_t v21 = ++processedFilesCounter;
            if (v21 == [obj count])
            {
              __int16 v27 = PLLogAppDeletion();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                long long v28 = [(id)listOfFileNames objectForKeyedSubscript:v7];
                int v29 = [v28 intValue];
                *(_DWORD *)buf = 138412546;
                uint64_t v41 = v7;
                __int16 v42 = 1024;
                int v43 = v29;
                _os_log_impl(&dword_1BBD2F000, v27, OS_LOG_TYPE_DEFAULT, "Did not defer activity file %@ and processed %d", buf, 0x12u);
              }
              id v23 = PLLogAppDeletion();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BBD2F000, v23, OS_LOG_TYPE_DEFAULT, "All compressed files processed", buf, 2u);
              }
              goto LABEL_38;
            }
            if (activity && xpc_activity_should_defer(activity))
            {
              int v22 = [a1 deferXPCActivity:activity];
              id v23 = PLLogAppDeletion();
              BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
              if (v22)
              {
                if (v24) {
                  +[PLAppDeletion deleteAppReferencesFromCompressedFiles:]((uint64_t)v7, v23);
                }
LABEL_38:

                goto LABEL_39;
              }
              if (v24) {
                +[PLAppDeletion deleteAppReferencesFromCompressedFiles:v23];
              }
            }
            else
            {
              id v23 = PLLogAppDeletion();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v25 = [(id)listOfFileNames objectForKeyedSubscript:v7];
                int v26 = [v25 intValue];
                *(_DWORD *)buf = 138412546;
                uint64_t v41 = v7;
                __int16 v42 = 1024;
                int v43 = v26;
                _os_log_impl(&dword_1BBD2F000, v23, OS_LOG_TYPE_DEFAULT, "Did not defer activity file %@ and processed %d", buf, 0x12u);
              }
            }
          }
          else
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v41 = v13;
              _os_log_error_impl(&dword_1BBD2F000, v17, OS_LOG_TYPE_ERROR, "AppDeletion : failed to decompress file %@", buf, 0xCu);
            }

            ++processedFilesCounter;
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_39:
}

+ (void)deleteAppReferencesInCurrentPowerlog
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = (id)updateQueries;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        uint64_t v8 = +[PLSQLiteConnection sharedSQLiteConnection];
        id v9 = (id)[v8 performQuery:v7 returnValue:0 returnResult:0];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

+ (void)deleteAppReferenceMapping
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = (id)qword_1EBA00478;
  uint64_t v2 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v37 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v7 = (void *)MEMORY[0x1E4F28E78];
        uint64_t v8 = [(id)qword_1EBA00478 objectForKeyedSubscript:v6];
        id v9 = [v8 objectForKeyedSubscript:@"MaskedName"];
        long long v10 = [(id)qword_1EBA00478 objectForKeyedSubscript:v6];
        long long v11 = [v10 objectForKeyedSubscript:@"DeleteTimestamp"];
        [v11 doubleValue];
        objc_msgSend(v7, "stringWithFormat:", @"UPDATE '%@' SET AppBundleId ='%@' WHERE AppBundleId = '%@' AND timestamp <= %f;",
          @"PLApplicationAgent_EventForward_ApplicationDidUninstall",
          v9,
          v6,
        long long v13 = v12);

        int v14 = +[PLSQLiteConnection sharedSQLiteConnection];
        id v15 = (id)[v14 performQuery:v13 returnValue:0 returnResult:0];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v3);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obja = (id)qword_1EBA00480;
  uint64_t v16 = [obja countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(obja);
        }
        uint64_t v20 = *(void *)(*((void *)&v32 + 1) + 8 * j);
        uint64_t v21 = (void *)MEMORY[0x1E4F28E78];
        int v22 = [(id)qword_1EBA00480 objectForKeyedSubscript:v20];
        id v23 = [v22 objectForKeyedSubscript:@"MaskedName"];
        BOOL v24 = [(id)qword_1EBA00480 objectForKeyedSubscript:v20];
        __int16 v25 = [v24 objectForKeyedSubscript:@"DeleteTimestamp"];
        [v25 doubleValue];
        objc_msgSend(v21, "stringWithFormat:", @"UPDATE '%@' SET AppName ='%@' WHERE AppName = '%@' AND timestamp <= %f;",
          @"PLApplicationAgent_EventForward_ApplicationDidUninstall",
          v23,
          v20,
        __int16 v27 = v26);

        long long v28 = +[PLSQLiteConnection sharedSQLiteConnection];
        id v29 = (id)[v28 performQuery:v27 returnValue:0 returnResult:0];
      }
      uint64_t v17 = [obja countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v17);
  }
}

+ (void)deleteAppReferences:(id)a3
{
  id v4 = a3;
  [a1 setup];
  uint64_t v5 = [(id)updateQueries count];
  uint64_t v6 = PLLogAppDeletion();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7) {
      +[PLAppDeletion deleteAppReferences:]();
    }

    uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"PLAppDeletionActivityStarted" object:a1 userInfo:qword_1EBA00478];

    [a1 deleteAppReferencesInCurrentPowerlog];
    [a1 deleteAppReferencesFromCompressedFiles:v4];
  }
  else
  {
    if (v7) {
      +[PLAppDeletion deleteAppReferences:]();
    }

    processedFilesCounter = [(id)listOfFileNames count];
  }
}

+ (id)appDeletionCriteria
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F14138], 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F14340], 1);
  xpc_dictionary_set_string(v2, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  return v2;
}

+ (void)registerAppDeletionActivity
{
  uint64_t v3 = [a1 appDeletionCriteria];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __44__PLAppDeletion_registerAppDeletionActivity__block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = a1;
  xpc_activity_register("com.apple.powerlogd.XPCAppDeletionScheduler", v3, handler);
}

void __44__PLAppDeletion_registerAppDeletionActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  uint64_t v5 = PLLogAppDeletion();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __44__PLAppDeletion_registerAppDeletionActivity__block_invoke_cold_2();
  }

  if (state == 2)
  {
    [*(id *)(a1 + 32) handleAppDeletionXPCActivityCallback:v3];
  }
  else
  {
    uint64_t v6 = PLLogAppDeletion();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __44__PLAppDeletion_registerAppDeletionActivity__block_invoke_cold_1();
    }
  }
}

+ (void)handleAppDeletionXPCActivityCallback:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PLLogAppDeletion();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[PLAppDeletion handleAppDeletionXPCActivityCallback:].cold.4();
  }

  [a1 deleteAppReferences:v4];
  uint64_t v6 = processedFilesCounter;
  if (v6 == [(id)listOfFileNames count])
  {
    [a1 deleteAppReferenceMapping];
    [a1 finishXPCActivity:v4];
    BOOL v7 = PLLogAppDeletion();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[PLAppDeletion handleAppDeletionXPCActivityCallback:]();
    }

    uint64_t v8 = PLLogAppDeletion();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[PLAppDeletion handleAppDeletionXPCActivityCallback:]();
    }

    +[PLAppDeletion changeClassProtection:0];
    [a1 resetStateVariables];
  }
  else
  {
    id v9 = PLLogAppDeletion();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      +[PLAppDeletion handleAppDeletionXPCActivityCallback:]();
    }
  }
}

+ (BOOL)finishXPCActivity:(id)a3
{
  uint64_t v3 = (_xpc_activity_s *)a3;
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = xpc_activity_set_state(v3, 5);
    uint64_t v6 = PLLogAppDeletion();
    BOOL v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        +[PLAppDeletion finishXPCActivity:]();
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[PLSubmissions(XPCScheduling) finishXPCActivity:]();
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (BOOL)deferXPCActivity:(id)a3
{
  uint64_t v3 = (_xpc_activity_s *)a3;
  id v4 = v3;
  if (v3)
  {
    if (xpc_activity_get_state(v3) == 3)
    {
      BOOL v5 = PLLogAppDeletion();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        +[PLAppDeletion deferXPCActivity:]();
      }
    }
    else
    {
      BOOL v7 = xpc_activity_set_state(v4, 3);
      BOOL v5 = PLLogAppDeletion();
      BOOL v8 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
      if (!v7)
      {
        if (v8) {
          +[PLAppDeletion deferXPCActivity:]();
        }
        BOOL v6 = 0;
        goto LABEL_13;
      }
      if (v8) {
        +[PLAppDeletion deferXPCActivity:]();
      }
    }
    BOOL v6 = 1;
LABEL_13:

    goto LABEL_14;
  }
  BOOL v6 = 0;
LABEL_14:

  return v6;
}

+ (void)changePermissionsForFilesInDirectory:withProtectionLevel:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BBD2F000, v0, OS_LOG_TYPE_ERROR, "changePermissionsForFilesInDirectory failed %@", v1, 0xCu);
}

void __66__PLAppDeletion_changePermissionForDirectory_withProtectionLevel___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BBD2F000, v0, OS_LOG_TYPE_ERROR, "changePermissionForDirectory failed %@", v1, 0xCu);
}

+ (void)changeClassProtection:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_ERROR, "Invalid option %d for protection level ", (uint8_t *)v2, 8u);
}

+ (void)changeClassProtection:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "FileProtection has been changed", v2, v3, v4, v5, v6);
}

+ (void)changeClassProtection:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1BBD2F000, v0, v1, "Could not change permission for minor version folder", v2, v3, v4, v5, v6);
}

+ (void)changeClassProtection:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1BBD2F000, v0, v1, "Could not change permission for major version folder", v2, v3, v4, v5, v6);
}

+ (void)filePermissionCriteria
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "Configuring File Permission criteria", v2, v3, v4, v5, v6);
}

void __47__PLAppDeletion_registerFilePermissionActivity__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "Activity state: not to run", v2, v3, v4, v5, v6);
}

+ (void)handleFilePermissionXPCActivityCallback:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "Successfully completed changing class protection", v2, v3, v4, v5, v6);
}

+ (void)constructUpdateQueries
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "AppDeletion : updateQueries is %@", v2, v3, v4, v5, v6);
}

+ (void)updateQuery:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "AppDeletion : failed to open db %@", v2, v3, v4, v5, v6);
}

+ (void)deleteAppReferencesFromCompressedFiles:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(id)listOfFileNames objectForKeyedSubscript:a1];
  int v5 = 138412546;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = [v4 intValue];
  _os_log_debug_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_DEBUG, "Deferring activity after file %@ and processed %d", (uint8_t *)&v5, 0x12u);
}

+ (void)deleteAppReferencesFromCompressedFiles:(os_log_t)log .cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_DEBUG, "Could not set state to defer, continue", buf, 2u);
}

+ (void)deleteAppReferences:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "AppDeletion : Update queries empty, bail out from activity", v2, v3, v4, v5, v6);
}

+ (void)deleteAppReferences:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "AppDeletion : Notifying Accounting module to clear up cache references", v2, v3, v4, v5, v6);
}

void __44__PLAppDeletion_registerAppDeletionActivity__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "AppDeletion : Activity state: not to run", v2, v3, v4, v5, v6);
}

void __44__PLAppDeletion_registerAppDeletionActivity__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "AppDeletion : State is being set to %ld", v2, v3, v4, v5, v6);
}

+ (void)handleAppDeletionXPCActivityCallback:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "AppDeletion : Change to class B", v2, v3, v4, v5, v6);
}

+ (void)handleAppDeletionXPCActivityCallback:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "AppDeletion : Successfully completed app deletion", v2, v3, v4, v5, v6);
}

+ (void)handleAppDeletionXPCActivityCallback:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "AppDeletion : App Deletion Activity was deferred as there are still files to process", v2, v3, v4, v5, v6);
}

+ (void)handleAppDeletionXPCActivityCallback:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "AppDeletion : Delete app references", v2, v3, v4, v5, v6);
}

+ (void)finishXPCActivity:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "Set background state to done", v2, v3, v4, v5, v6);
}

+ (void)deferXPCActivity:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "Background state already in defer", v2, v3, v4, v5, v6);
}

+ (void)deferXPCActivity:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "Set background state to defer %@", v2, v3, v4, v5, v6);
}

+ (void)deferXPCActivity:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "Failed to set background state to defer", v2, v3, v4, v5, v6);
}

@end