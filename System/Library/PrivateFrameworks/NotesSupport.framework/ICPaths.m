@interface ICPaths
+ (BOOL)isReadOnlyPersistentStore;
+ (NSDictionary)attributesForGroupContainerDirectory;
+ (NSURL)applicationDataContainerURL;
+ (NSURL)applicationDocumentsURL;
+ (NSURL)defaultPreviewImageDirectoryURL;
+ (NSURL)importDocumentsURL;
+ (NSURL)managedObjectModelURL;
+ (NSURL)oldManagedObjectModelURL;
+ (NSURL)persistentStoreURL;
+ (id)URLForGroupContainerWithIdentifier:(id)a3;
+ (void)applicationDataContainerURL;
+ (void)resetApplicationDocumentsURL;
+ (void)setApplicationDocumentsURL:(id)a3;
+ (void)setIsReadOnlyPersistentStore:(BOOL)a3;
@end

@implementation ICPaths

void __34__ICPaths_applicationDocumentsURL__block_invoke_2(uint64_t a1)
{
  if (!_applicationDocumentsURL)
  {
    v1 = *(void **)(a1 + 32);
    ICGroupContainerIdentifier();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = [v1 URLForGroupContainerWithIdentifier:v4];
    v3 = (void *)_applicationDocumentsURL;
    _applicationDocumentsURL = v2;
  }
}

+ (id)URLForGroupContainerWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2050000000;
  v5 = (void *)getUMUserManagerClass_softClass_0;
  uint64_t v45 = getUMUserManagerClass_softClass_0;
  if (!getUMUserManagerClass_softClass_0)
  {
    uint64_t v37 = MEMORY[0x263EF8330];
    uint64_t v38 = 3221225472;
    v39 = __getUMUserManagerClass_block_invoke_0;
    v40 = &unk_2640CD368;
    v41 = &v42;
    __getUMUserManagerClass_block_invoke_0((uint64_t)&v37);
    v5 = (void *)v43[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v42, 8);
  v7 = [v6 sharedManager];
  v8 = [v7 currentPersona];
  int v9 = [v8 isProxy];
  id v36 = 0;
  v10 = (void *)[v8 copyCurrentPersonaContextWithError:&v36];
  id v11 = v36;
  v12 = v11;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v9;
  }
  if (v13 == 1)
  {
    v14 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      +[ICPaths URLForGroupContainerWithIdentifier:].cold.4();
    }

    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2050000000;
    v15 = (void *)getUMUserPersonaAttributesClass_softClass_0;
    uint64_t v45 = getUMUserPersonaAttributesClass_softClass_0;
    if (!getUMUserPersonaAttributesClass_softClass_0)
    {
      uint64_t v37 = MEMORY[0x263EF8330];
      uint64_t v38 = 3221225472;
      v39 = __getUMUserPersonaAttributesClass_block_invoke_0;
      v40 = &unk_2640CD368;
      v41 = &v42;
      __getUMUserPersonaAttributesClass_block_invoke_0((uint64_t)&v37);
      v15 = (void *)v43[3];
    }
    id v16 = v15;
    _Block_object_dispose(&v42, 8);
    v17 = [v16 personaAttributesForPersonaType:0];
    v18 = [v17 userPersonaUniqueString];
    id v19 = (id)[v8 generateAndRestorePersonaContextWithPersonaUniqueString:v18];
  }
  else
  {
    if (!v11) {
      goto LABEL_16;
    }
    v17 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[ICPaths URLForGroupContainerWithIdentifier:].cold.5();
    }
  }

LABEL_16:
  v20 = [MEMORY[0x263F08850] defaultManager];
  v21 = [v20 containerURLForSecurityApplicationGroupIdentifier:v4];

  if (v21)
  {
    if (!v13) {
      goto LABEL_18;
    }
  }
  else
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "groupContainerURL", "+[ICPaths URLForGroupContainerWithIdentifier:]", 1, 1, @"Failed to get group container URL for \"%@\"", v4);
    if (!v13)
    {
LABEL_18:
      if (!v21) {
        goto LABEL_32;
      }
      goto LABEL_22;
    }
  }
  id v22 = (id)[v8 restorePersonaWithSavedPersonaContext:v10];
  if (!v21) {
    goto LABEL_32;
  }
LABEL_22:
  id v35 = 0;
  char v23 = [v21 checkResourceIsReachableAndReturnError:&v35];
  id v24 = v35;
  if ((v23 & 1) == 0)
  {
    v25 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      +[ICPaths URLForGroupContainerWithIdentifier:]();
    }

    if (([a1 isReadOnlyPersistentStore] & 1) == 0)
    {
      v33 = v10;
      v26 = [MEMORY[0x263F08850] defaultManager];
      v27 = [a1 attributesForGroupContainerDirectory];
      id v34 = 0;
      char v28 = [v26 createDirectoryAtURL:v21 withIntermediateDirectories:1 attributes:v27 error:&v34];
      id v29 = v34;

      if ((v28 & 1) == 0)
      {
        v30 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          +[ICPaths URLForGroupContainerWithIdentifier:]();
        }
      }
      v10 = v33;
    }
  }

LABEL_32:
  v31 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    +[ICPaths URLForGroupContainerWithIdentifier:]();
  }

  return v21;
}

+ (void)URLForGroupContainerWithIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_20C263000, v0, OS_LOG_TYPE_DEBUG, "Group container URL: %@", v1, 0xCu);
}

+ (NSURL)managedObjectModelURL
{
  if (managedObjectModelURL_onceToken != -1) {
    dispatch_once(&managedObjectModelURL_onceToken, &__block_literal_global_55);
  }
  uint64_t v2 = (void *)managedObjectModelURL_modelURL;
  return (NSURL *)v2;
}

void __32__ICPaths_managedObjectModelURL__block_invoke()
{
  os_log_t v0 = (void *)MEMORY[0x263F086E0];
  v1 = ICSharedFrameworkBundleIdentifier();
  uint64_t v2 = [v0 bundleWithIdentifier:v1];

  if (!v2)
  {
    uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
    if (!v2)
    {
      v3 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        __32__ICPaths_managedObjectModelURL__block_invoke_cold_2();
      }

      uint64_t v2 = 0;
    }
  }
  uint64_t v4 = [v2 URLForResource:@"NoteData" withExtension:@"mom"];
  v5 = (void *)managedObjectModelURL_modelURL;
  managedObjectModelURL_modelURL = v4;

  if (!managedObjectModelURL_modelURL)
  {
    id v6 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __32__ICPaths_managedObjectModelURL__block_invoke_cold_1();
    }
  }
}

void __34__ICPaths_applicationDocumentsURL__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("ICPathsCreateApplicationDocumentsURL", v2);
  v1 = (void *)applicationDocumentsURL_creationQueue;
  applicationDocumentsURL_creationQueue = (uint64_t)v0;
}

void __29__ICPaths_persistentStoreURL__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("ICPathsCreatePersistentStoreURL", v2);
  v1 = (void *)persistentStoreURL_creationQueue;
  persistentStoreURL_creationQueue = (uint64_t)v0;
}

+ (NSURL)persistentStoreURL
{
  if (persistentStoreURL_onceToken != -1) {
    dispatch_once(&persistentStoreURL_onceToken, &__block_literal_global_66);
  }
  v3 = (void *)_persistentStoreURL;
  if (!_persistentStoreURL)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29__ICPaths_persistentStoreURL__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_sync((dispatch_queue_t)persistentStoreURL_creationQueue, block);
    v3 = (void *)_persistentStoreURL;
  }
  return (NSURL *)v3;
}

+ (NSURL)applicationDocumentsURL
{
  if (applicationDocumentsURL_onceToken != -1) {
    dispatch_once(&applicationDocumentsURL_onceToken, &__block_literal_global_15);
  }
  v3 = (void *)_applicationDocumentsURL;
  if (!_applicationDocumentsURL)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__ICPaths_applicationDocumentsURL__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_sync((dispatch_queue_t)applicationDocumentsURL_creationQueue, block);
    v3 = (void *)_applicationDocumentsURL;
  }
  return (NSURL *)v3;
}

uint64_t __29__ICPaths_persistentStoreURL__block_invoke_2(uint64_t result)
{
  if (!_persistentStoreURL)
  {
    v1 = [*(id *)(result + 32) applicationDocumentsURL];
    uint64_t v2 = [v1 URLByAppendingPathComponent:@"NoteStore" isDirectory:0];
    v3 = (void *)_persistentStoreURL;
    _persistentStoreURL = v2;

    _persistentStoreURL = [(id)_persistentStoreURL URLByAppendingPathExtension:@"sqlite"];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

+ (void)setIsReadOnlyPersistentStore:(BOOL)a3
{
  id obj = a1;
  objc_sync_enter(obj);
  _isReadOnlyPersistentStore = a3;
  objc_sync_exit(obj);
}

+ (void)setApplicationDocumentsURL:(id)a3
{
  objc_storeStrong((id *)&_applicationDocumentsURL, a3);
  id v5 = a3;
  uint64_t v4 = (void *)_persistentStoreURL;
  _persistentStoreURL = 0;
}

+ (void)resetApplicationDocumentsURL
{
  uint64_t v2 = (void *)_applicationDocumentsURL;
  _applicationDocumentsURL = 0;

  v3 = (void *)_persistentStoreURL;
  _persistentStoreURL = 0;
}

+ (NSURL)importDocumentsURL
{
  if (importDocumentsURL_onceToken != -1) {
    dispatch_once(&importDocumentsURL_onceToken, &__block_literal_global_40);
  }
  v3 = (void *)importDocumentsURL_importDocumentsURL;
  if (!importDocumentsURL_importDocumentsURL)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29__ICPaths_importDocumentsURL__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_sync((dispatch_queue_t)importDocumentsURL_creationQueue, block);
    v3 = (void *)importDocumentsURL_importDocumentsURL;
  }
  return (NSURL *)v3;
}

void __29__ICPaths_importDocumentsURL__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("ICPathsCreateImportDocumentsURL", v2);
  v1 = (void *)importDocumentsURL_creationQueue;
  importDocumentsURL_creationQueue = (uint64_t)v0;
}

void __29__ICPaths_importDocumentsURL__block_invoke_2(uint64_t a1)
{
  if (!importDocumentsURL_importDocumentsURL)
  {
    v1 = *(void **)(a1 + 32);
    ICImportGroupContainerIdentifier();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = [v1 URLForGroupContainerWithIdentifier:v4];
    v3 = (void *)importDocumentsURL_importDocumentsURL;
    importDocumentsURL_importDocumentsURL = v2;
  }
}

+ (NSURL)defaultPreviewImageDirectoryURL
{
  uint64_t v2 = [a1 applicationDocumentsURL];
  v3 = [v2 URLByAppendingPathComponent:@"Previews" isDirectory:1];

  return (NSURL *)v3;
}

+ (NSURL)applicationDataContainerURL
{
  uint64_t v2 = [MEMORY[0x263F01890] bundleRecordForCurrentProcess];
  uint64_t v3 = objc_opt_class();
  id v4 = ICDynamicCast(v3, (uint64_t)v2);
  id v5 = [v4 containingBundleRecord];

  uint64_t v6 = objc_opt_class();
  v7 = ICDynamicCast(v6, (uint64_t)v5);
  uint64_t v8 = [v7 dataContainerURL];
  if (v8)
  {
    int v9 = (void *)v8;
    v10 = v5;
    goto LABEL_12;
  }
  id v11 = (void *)MEMORY[0x263F01890];
  v12 = ICNotesAppBundleIdentifier();
  id v18 = 0;
  v10 = [v11 bundleRecordWithApplicationIdentifier:v12 error:&v18];
  id v13 = v18;

  if (v13)
  {
    v14 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[ICPaths applicationDataContainerURL]();
    }
  }
  else
  {
    uint64_t v16 = [v10 dataContainerURL];
    if (v16)
    {
      int v9 = (void *)v16;
      goto LABEL_12;
    }
  }
  v15 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    +[ICPaths applicationDataContainerURL]();
  }

  int v9 = 0;
LABEL_12:

  return (NSURL *)v9;
}

+ (NSDictionary)attributesForGroupContainerDirectory
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F08078];
  v5[0] = &unk_26C144CB8;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return (NSDictionary *)v2;
}

+ (BOOL)isReadOnlyPersistentStore
{
  id v2 = a1;
  objc_sync_enter(v2);
  char v3 = _isReadOnlyPersistentStore;
  objc_sync_exit(v2);

  return v3;
}

+ (NSURL)oldManagedObjectModelURL
{
  if (oldManagedObjectModelURL_onceToken != -1) {
    dispatch_once(&oldManagedObjectModelURL_onceToken, &__block_literal_global_61);
  }
  id v2 = (void *)oldManagedObjectModelURL_modelURL;
  return (NSURL *)v2;
}

void __35__ICPaths_oldManagedObjectModelURL__block_invoke()
{
  dispatch_queue_t v0 = (void *)MEMORY[0x263F086E0];
  v1 = ICSharedFrameworkBundleIdentifier();
  id v2 = [v0 bundleWithIdentifier:v1];

  if (!v2)
  {
    id v2 = [MEMORY[0x263F086E0] mainBundle];
    if (!v2)
    {
      char v3 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        __35__ICPaths_oldManagedObjectModelURL__block_invoke_cold_2();
      }

      id v2 = 0;
    }
  }
  uint64_t v4 = [v2 URLForResource:@"NoteDataOld" withExtension:@"momd"];
  id v5 = (void *)oldManagedObjectModelURL_modelURL;
  oldManagedObjectModelURL_modelURL = v4;

  if (!oldManagedObjectModelURL_modelURL)
  {
    uint64_t v6 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __35__ICPaths_oldManagedObjectModelURL__block_invoke_cold_1();
    }
  }
}

+ (void)URLForGroupContainerWithIdentifier:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_20C263000, v0, OS_LOG_TYPE_ERROR, "Error creating %@ group container: %@", v1, 0x16u);
}

+ (void)URLForGroupContainerWithIdentifier:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_20C263000, v0, OS_LOG_TYPE_DEBUG, "%@ group container URL is not reachable. URL=%@", v1, 0x16u);
}

+ (void)URLForGroupContainerWithIdentifier:.cold.4()
{
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_20C263000, v0, OS_LOG_TYPE_DEBUG, "Temporarily adopting personal persona context instead of system proxy", v1, 2u);
}

+ (void)URLForGroupContainerWithIdentifier:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20C263000, v0, v1, "Error saving persona context {error: %@}", v2, v3, v4, v5, v6);
}

+ (void)applicationDataContainerURL
{
  OUTLINED_FUNCTION_1();
}

void __32__ICPaths_managedObjectModelURL__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20C263000, v0, v1, "Unable to find CoreData mom file for object model in %@", v2, v3, v4, v5, v6);
}

void __32__ICPaths_managedObjectModelURL__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_20C263000, v0, v1, "Unable to find framework/XPC service bundle", v2, v3, v4, v5, v6);
}

void __35__ICPaths_oldManagedObjectModelURL__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20C263000, v0, v1, "Unable to find CoreData momd file for old object model in %@", v2, v3, v4, v5, v6);
}

void __35__ICPaths_oldManagedObjectModelURL__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_20C263000, v0, v1, "Unable to find framework/XPC service bundle when looking for old data model", v2, v3, v4, v5, v6);
}

@end