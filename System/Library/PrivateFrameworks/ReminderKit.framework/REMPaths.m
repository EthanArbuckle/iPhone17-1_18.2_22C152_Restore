@interface REMPaths
+ (BOOL)_legacy_shouldUseCentralizedDataPath;
+ (id)URLForGroupContainerWithIdentifier:(id)a3;
+ (id)attributesForGroupContainerDirectory;
+ (id)createTemporaryFileDirectoryURLIfNeededWithError:(id *)a3;
+ (id)dataSeparationEnabled_applicationDocumentsURL;
+ (id)legacy_applicationDocumentsURL;
+ (id)legacy_centralizedDataPath;
+ (void)unitTest_setLegacyApplicationDocumentsURL:(id)a3;
@end

@implementation REMPaths

+ (id)createTemporaryFileDirectoryURLIfNeededWithError:(id *)a3
{
  if (rem_feature_enabled(@"Reminders", @"dataSeparation")) {
    objc_msgSend(a1, "dataSeparationEnabled_applicationDocumentsURL");
  }
  else {
  v5 = objc_msgSend(a1, "legacy_applicationDocumentsURL");
  }
  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  v7 = [v6 URLForDirectory:99 inDomain:1 appropriateForURL:v5 create:1 error:a3];

  return v7;
}

+ (id)legacy_centralizedDataPath
{
  v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/var/mobile/Library"];
  v3 = [v2 URLByAppendingPathComponent:@"Reminders/"];

  return v3;
}

+ (id)legacy_applicationDocumentsURL
{
  if (onceToken != -1) {
    dispatch_once(&onceToken, &__block_literal_global_38);
  }
  v3 = (void *)legacy_applicationDocumentsURL;
  if (!legacy_applicationDocumentsURL)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__REMPaths_legacy_applicationDocumentsURL__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_sync((dispatch_queue_t)creationQueue, block);
    v3 = (void *)legacy_applicationDocumentsURL;
  }

  return v3;
}

void __42__REMPaths_legacy_applicationDocumentsURL__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("REMPathsCreateApplicationDocumentsURLs", v2);
  v1 = (void *)creationQueue;
  creationQueue = (uint64_t)v0;
}

void __42__REMPaths_legacy_applicationDocumentsURL__block_invoke_2(uint64_t a1)
{
  if (!legacy_applicationDocumentsURL)
  {
    int v2 = objc_msgSend(*(id *)(a1 + 32), "_legacy_shouldUseCentralizedDataPath");
    v3 = *(void **)(a1 + 32);
    if (v2) {
      objc_msgSend(v3, "legacy_centralizedDataPath");
    }
    else {
    uint64_t v4 = [v3 URLForGroupContainerWithIdentifier:@"group.com.apple.reminders"];
    }
    v5 = (void *)legacy_applicationDocumentsURL;
    legacy_applicationDocumentsURL = v4;

    if (!legacy_applicationDocumentsURL)
    {
      legacy_applicationDocumentsURL = objc_msgSend(*(id *)(a1 + 32), "legacy_centralizedDataPath");
      MEMORY[0x1F41817F8]();
    }
  }
}

+ (id)dataSeparationEnabled_applicationDocumentsURL
{
  if (onceToken != -1) {
    dispatch_once(&onceToken, &__block_literal_global_18_0);
  }
  v3 = (void *)dataSeparationEnabled_applicationDocumentsURL;
  if (!dataSeparationEnabled_applicationDocumentsURL)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__REMPaths_dataSeparationEnabled_applicationDocumentsURL__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_sync((dispatch_queue_t)creationQueue, block);
    v3 = (void *)dataSeparationEnabled_applicationDocumentsURL;
  }

  return v3;
}

void __57__REMPaths_dataSeparationEnabled_applicationDocumentsURL__block_invoke()
{
  int v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("REMPathsCreateApplicationDocumentsURLs", v2);
  v1 = (void *)creationQueue;
  creationQueue = (uint64_t)v0;
}

void __57__REMPaths_dataSeparationEnabled_applicationDocumentsURL__block_invoke_2(uint64_t a1)
{
  if (!dataSeparationEnabled_applicationDocumentsURL)
  {
    uint64_t v2 = [*(id *)(a1 + 32) URLForGroupContainerWithIdentifier:@"group.com.apple.reminders"];
    v3 = (void *)dataSeparationEnabled_applicationDocumentsURL;
    dataSeparationEnabled_applicationDocumentsURL = v2;

    if (!dataSeparationEnabled_applicationDocumentsURL)
    {
      dataSeparationEnabled_applicationDocumentsURL = objc_msgSend(*(id *)(a1 + 32), "legacy_applicationDocumentsURL");
      MEMORY[0x1F41817F8]();
    }
  }
}

+ (id)URLForGroupContainerWithIdentifier:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2050000000;
  v5 = (void *)getUMUserManagerClass_softClass_0;
  uint64_t v43 = getUMUserManagerClass_softClass_0;
  if (!getUMUserManagerClass_softClass_0)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getUMUserManagerClass_block_invoke_0;
    v45 = &unk_1E61DDA60;
    v46 = &v40;
    __getUMUserManagerClass_block_invoke_0((uint64_t)buf);
    v5 = (void *)v41[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v40, 8);
  v7 = [v6 sharedManager];
  v8 = [v7 currentPersona];
  int v9 = [v8 isProxy];
  id v39 = 0;
  uint64_t v35 = [v8 copyCurrentPersonaContextWithError:&v39];
  id v10 = v39;
  v11 = v10;
  if (v10) {
    int v12 = 0;
  }
  else {
    int v12 = v9;
  }
  if (v12 == 1)
  {
    v13 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B9AA2000, v13, OS_LOG_TYPE_INFO, "URLForGroupContainer: Temporarily adopting personal persona context instead of system proxy", buf, 2u);
    }

    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2050000000;
    v14 = (void *)getUMUserPersonaAttributesClass_softClass_0;
    uint64_t v43 = getUMUserPersonaAttributesClass_softClass_0;
    if (!getUMUserPersonaAttributesClass_softClass_0)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getUMUserPersonaAttributesClass_block_invoke_0;
      v45 = &unk_1E61DDA60;
      v46 = &v40;
      __getUMUserPersonaAttributesClass_block_invoke_0((uint64_t)buf);
      v14 = (void *)v41[3];
    }
    id v15 = v14;
    _Block_object_dispose(&v40, 8);
    v16 = [v15 personaAttributesForPersonaType:0];
    v17 = [v16 userPersonaUniqueString];
    id v18 = (id)[v8 generateAndRestorePersonaContextWithPersonaUniqueString:v17];
  }
  else
  {
    if (!v10) {
      goto LABEL_16;
    }
    v16 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[REMPaths URLForGroupContainerWithIdentifier:]((uint64_t)v11, v16);
    }
  }

LABEL_16:
  v19 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", v35);
  v20 = [v19 containerURLForSecurityApplicationGroupIdentifier:v4];

  if (!v20)
  {
    v21 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B9AA2000, v21, OS_LOG_TYPE_INFO, "URLForGroupContainer: NSFileManager failed to return our group container, falling back to bundle proxy", buf, 2u);
    }

    v22 = [MEMORY[0x1E4F223F0] bundleProxyForIdentifier:@"com.apple.reminders"];
    v23 = [v22 groupContainerURLs];
    v20 = [v23 objectForKey:v4];
  }
  if (v12) {
    id v24 = (id)[v8 restorePersonaWithSavedPersonaContext:v36];
  }
  if (v20)
  {
    id v38 = 0;
    char v25 = [v20 checkResourceIsReachableAndReturnError:&v38];
    v26 = v38;
    if ((v25 & 1) == 0)
    {
      v27 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v4;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v20;
        _os_log_impl(&dword_1B9AA2000, v27, OS_LOG_TYPE_DEFAULT, "URLForGroupContainer: %@ group container URL is not reachable. URL=%@", buf, 0x16u);
      }

      v28 = [MEMORY[0x1E4F28CB8] defaultManager];
      v29 = [a1 attributesForGroupContainerDirectory];
      id v37 = 0;
      char v30 = [v28 createDirectoryAtURL:v20 withIntermediateDirectories:1 attributes:v29 error:&v37];
      id v31 = v37;

      if ((v30 & 1) == 0)
      {
        v32 = os_log_create("com.apple.reminderkit", "default");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          +[REMPaths URLForGroupContainerWithIdentifier:v32];
        }
      }
    }
  }
  else
  {
    v26 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      +[REMPaths URLForGroupContainerWithIdentifier:]((uint64_t)v4, v26);
    }
  }

  v33 = os_log_create("com.apple.reminderkit", "default");
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v20;
    _os_log_impl(&dword_1B9AA2000, v33, OS_LOG_TYPE_INFO, "URLForGroupContainer: Group container URL: %@", buf, 0xCu);
  }

  return v20;
}

+ (BOOL)_legacy_shouldUseCentralizedDataPath
{
  if (_legacy_shouldUseCentralizedDataPath_onceToken != -1) {
    dispatch_once(&_legacy_shouldUseCentralizedDataPath_onceToken, &__block_literal_global_23);
  }
  return _legacy_shouldUseCentralizedDataPath_sResult;
}

void __48__REMPaths__legacy_shouldUseCentralizedDataPath__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28F80] processInfo];
  dispatch_queue_t v0 = [v2 processName];
  if (([v0 isEqual:@"remindd"] & 1) != 0
    || ([v0 isEqualToString:@"xctest"] & 1) != 0)
  {
    char v1 = 1;
  }
  else
  {
    char v1 = [v0 isEqualToString:@"remindtool"];
  }
  _legacy_shouldUseCentralizedDataPath_sResult = v1;
}

+ (id)attributesForGroupContainerDirectory
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F28330];
  v5[0] = &unk_1F136C320;
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (void)unitTest_setLegacyApplicationDocumentsURL:(id)a3
{
  id v3 = a3;
  if (onceToken != -1) {
    dispatch_once(&onceToken, &__block_literal_global_49);
  }
  uint64_t v4 = creationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__REMPaths_UnitTests__unitTest_setLegacyApplicationDocumentsURL___block_invoke_2;
  block[3] = &unk_1E61DC740;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

void __65__REMPaths_UnitTests__unitTest_setLegacyApplicationDocumentsURL___block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("REMPathsCreateApplicationDocumentsURLs", v2);
  char v1 = (void *)creationQueue;
  creationQueue = (uint64_t)v0;
}

void __65__REMPaths_UnitTests__unitTest_setLegacyApplicationDocumentsURL___block_invoke_2(uint64_t a1)
{
}

+ (void)URLForGroupContainerWithIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "URLForGroupContainer: Failed to get group container URL (maybe simulator) for \"%@\"", (uint8_t *)&v2, 0xCu);
}

+ (void)URLForGroupContainerWithIdentifier:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_ERROR, "URLForGroupContainer: Error creating %@ group container: %@", (uint8_t *)&v3, 0x16u);
}

+ (void)URLForGroupContainerWithIdentifier:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "URLForGroupContainer: Error saving persona context {error: %@}", (uint8_t *)&v2, 0xCu);
}

@end