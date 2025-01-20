@interface ICImageAnalysisController
+ (ICImageAnalysisController)sharedController;
- (ICImageAnalysisController)init;
- (OS_dispatch_queue)photoLibraryQueue;
- (void)analyzeSearchableItems:(id)a3 completion:(id)a4;
@end

@implementation ICImageAnalysisController

+ (ICImageAnalysisController)sharedController
{
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)sharedController_instance;
  return (ICImageAnalysisController *)v2;
}

uint64_t __45__ICImageAnalysisController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(ICImageAnalysisController);
  v1 = (void *)sharedController_instance;
  sharedController_instance = (uint64_t)v0;

  id PHPhotoLibraryClass = getPHPhotoLibraryClass();
  return [PHPhotoLibraryClass enableMultiLibraryMode];
}

- (ICImageAnalysisController)init
{
  v7.receiver = self;
  v7.super_class = (Class)ICImageAnalysisController;
  v2 = [(ICImageAnalysisController *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.notes.search.photoLibraryQueue", v3);
    photoLibraryQueue = v2->_photoLibraryQueue;
    v2->_photoLibraryQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)analyzeSearchableItems:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ICImageAnalysisController analyzeSearchableItems:completion:](v6);
  }

  v9 = [(ICImageAnalysisController *)self photoLibraryQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__ICImageAnalysisController_analyzeSearchableItems_completion___block_invoke;
  v12[3] = &unk_2640CD610;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, v12);
}

void __63__ICImageAnalysisController_analyzeSearchableItems_completion___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v2 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __63__ICImageAnalysisController_analyzeSearchableItems_completion___block_invoke_cold_2(a1);
  }

  id v29 = 0;
  v3 = [getPHPhotoLibraryClass() openPhotoLibraryWithWellKnownIdentifier:3 error:&v29];
  id v4 = v29;
  id v5 = v4;
  if (!v3 || v4)
  {
    obj = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      __63__ICImageAnalysisController_analyzeSearchableItems_completion___block_invoke_cold_1((uint64_t)v5, obj);
    }
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    obj = *(id *)(a1 + 32);
    uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v22 = a1;
      id v5 = 0;
      uint64_t v8 = *(void *)v26;
      while (1)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);

          id v11 = [v10 uniqueIdentifier];
          v12 = [MEMORY[0x263F086E0] mainBundle];
          id v13 = [v12 bundleIdentifier];
          id v24 = 0;
          id v14 = [v3 processUniversalSearchJITForCoreSpotlightUniqueIdentifier:v11 bundleID:v13 processingTypes:3 error:&v24];
          id v5 = v24;

          v15 = os_log_create("com.apple.notes", "SearchIndexer");
          v16 = v15;
          if (v14) {
            BOOL v17 = v5 == 0;
          }
          else {
            BOOL v17 = 0;
          }
          if (v17)
          {
            if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_17;
            }
            v18 = [v10 uniqueIdentifier];
            *(_DWORD *)buf = 138412546;
            v31 = v18;
            __int16 v32 = 2112;
            id v33 = v14;
            _os_log_debug_impl(&dword_20C263000, v16, OS_LOG_TYPE_DEBUG, "[JIT] Processed item (%@): %@", buf, 0x16u);
          }
          else
          {
            if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              goto LABEL_17;
            }
            v18 = [v10 uniqueIdentifier];
            *(_DWORD *)buf = 138412546;
            v31 = v18;
            __int16 v32 = 2112;
            id v33 = v5;
            _os_log_error_impl(&dword_20C263000, v16, OS_LOG_TYPE_ERROR, "[JIT] Failed processing item (%@): %@", buf, 0x16u);
          }

LABEL_17:
          ++v9;
        }
        while (v7 != v9);
        uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v34 count:16];
        uint64_t v7 = v19;
        if (!v19)
        {
          a1 = v22;
          goto LABEL_26;
        }
      }
    }
    id v5 = 0;
  }
LABEL_26:

  v20 = *(void **)(a1 + 40);
  if (v20)
  {
    v21 = dispatch_get_global_queue(0, 0);
    dispatch_async(v21, v20);
  }
}

- (OS_dispatch_queue)photoLibraryQueue
{
  return self->_photoLibraryQueue;
}

- (void).cxx_destruct
{
}

- (void)analyzeSearchableItems:(void *)a1 completion:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_0_2(&dword_20C263000, v1, v2, "[JIT] Enqueuing %lu searchable items", v3, v4, v5, v6, 0);
}

void __63__ICImageAnalysisController_analyzeSearchableItems_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20C263000, a2, OS_LOG_TYPE_ERROR, "[JIT] Skipping image analysis because the photo library cannot be opened: %@", (uint8_t *)&v2, 0xCu);
}

void __63__ICImageAnalysisController_analyzeSearchableItems_completion___block_invoke_cold_2(uint64_t a1)
{
  [*(id *)(a1 + 32) count];
  OUTLINED_FUNCTION_0_2(&dword_20C263000, v1, v2, "[JIT] Processing %lu searchable items", v3, v4, v5, v6, 0);
}

@end