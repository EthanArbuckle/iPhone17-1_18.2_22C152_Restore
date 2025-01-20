@interface ICThumbnailService
+ (ICThumbnailService)sharedThumbnailService;
- (BOOL)managedObjectContextChangeControllerShouldUpdateImmediately:(id)a3;
- (ICManagedObjectContextChangeController)managedObjectChangeController;
- (ICThumbnailCaching)cache;
- (ICThumbnailService)init;
- (ICThumbnailService)initWithViewContext:(id)a3 workerContext:(id)a4;
- (NSManagedObjectContext)viewContext;
- (NSManagedObjectContext)workerContext;
- (NSMutableDictionary)callbacks;
- (NSOperationQueue)thumbnailGenerationQueue;
- (OS_dispatch_queue)backgroundQueue;
- (OS_dispatch_queue)schedulingSerialQueue;
- (id)managedObjectContextChangeController:(id)a3 managedObjectIDsToUpdateForUpdatedManagedObjects:(id)a4;
- (id)thumbnailGeneratorForConfiguration:(id)a3;
- (id)thumbnailWithConfiguration:(id)a3;
- (void)attachmentPreviewImagesDidUpdate:(id)a3;
- (void)dealloc;
- (void)managedObjectContextChangeController:(id)a3 performUpdatesForManagedObjectIDs:(id)a4;
- (void)processThumbnailDescriptionResult:(id)a3;
- (void)setBackgroundQueue:(id)a3;
- (void)setCallbacks:(id)a3;
- (void)setManagedObjectChangeController:(id)a3;
- (void)setSchedulingSerialQueue:(id)a3;
- (void)setThumbnailGenerationQueue:(id)a3;
- (void)thumbnailWithConfiguration:(id)a3 completion:(id)a4;
- (void)thumbnailsWithConfigurations:(id)a3 completion:(id)a4;
@end

@implementation ICThumbnailService

void __56__ICThumbnailService_processThumbnailDescriptionResult___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) callbacks];
  v3 = [*(id *)(a1 + 40) configuration];
  v4 = [v3 uniqueKey];
  uint64_t v5 = [v2 objectForKeyedSubscript:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v10 = [*(id *)(a1 + 32) callbacks];
  v8 = [*(id *)(a1 + 40) configuration];
  v9 = [v8 uniqueKey];
  [v10 removeObjectForKey:v9];
}

void __60__ICThumbnailService_thumbnailWithConfiguration_completion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) callbacks];
  v3 = [*(id *)(a1 + 40) uniqueKey];
  id v10 = [v2 objectForKeyedSubscript:v3];

  if (v10)
  {
    v4 = *(const void **)(a1 + 48);
    if (v4)
    {
      uint64_t v5 = _Block_copy(v4);
      [v10 addObject:v5];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA48];
    v7 = _Block_copy(*(const void **)(a1 + 48));
    id v10 = [v6 arrayWithObject:v7];

    v8 = [*(id *)(a1 + 32) callbacks];
    v9 = [*(id *)(a1 + 40) uniqueKey];
    [v8 setObject:v10 forKeyedSubscript:v9];
  }
}

- (NSMutableDictionary)callbacks
{
  return self->_callbacks;
}

- (void)processThumbnailDescriptionResult:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 image];

  if (v5)
  {
    if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
    {
      uint64_t v6 = [v4 configuration];
      int v7 = [v6 prepareThumbnail];

      v8 = [v4 image];
      v9 = v8;
      if (v7)
      {
        id v10 = [v4 image];
        [v10 size];
        v11 = objc_msgSend(v9, "imageByPreparingThumbnailOfSize:");
        [v4 setImage:v11];
      }
      else
      {
        id v10 = objc_msgSend(v8, "ic_decodeInBackground");
        [v4 setImage:v10];
      }
    }
    v12 = [(ICThumbnailService *)self cache];
    v13 = [v4 configuration];
    [v12 setObject:v4 forKeyedSubscript:v13];
  }
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__74;
  v32 = __Block_byref_object_dispose__74;
  id v33 = 0;
  v14 = [(ICThumbnailService *)self schedulingSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ICThumbnailService_processThumbnailDescriptionResult___block_invoke;
  block[3] = &unk_1E5FD9870;
  v27 = &v28;
  block[4] = self;
  id v15 = v4;
  id v26 = v15;
  dispatch_sync(v14, block);

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = (id)v29[5];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = *(void *)(*((void *)&v21 + 1) + 8 * v19);
        if (v20) {
          (*(void (**)(uint64_t, id))(v20 + 16))(v20, v15);
        }
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v34 count:16];
    }
    while (v17);
  }

  _Block_object_dispose(&v28, 8);
}

void __60__ICThumbnailService_thumbnailWithConfiguration_completion___block_invoke(id *a1)
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v2 = [a1[4] schedulingSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__ICThumbnailService_thumbnailWithConfiguration_completion___block_invoke_2;
  block[3] = &unk_1E5FDE0A8;
  id v3 = a1[5];
  block[4] = a1[4];
  id v15 = v3;
  id v16 = a1[7];
  uint64_t v17 = &v18;
  dispatch_sync(v2, block);

  if (!*((unsigned char *)v19 + 24))
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28B48]);
    objc_initWeak(&location, v4);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__ICThumbnailService_thumbnailWithConfiguration_completion___block_invoke_3;
    v8[3] = &unk_1E5FDE0F8;
    objc_copyWeak(&v12, &location);
    id v9 = a1[5];
    id v5 = a1[6];
    id v6 = a1[4];
    id v10 = v5;
    id v11 = v6;
    [v4 addExecutionBlock:v8];
    int v7 = [a1[4] thumbnailGenerationQueue];
    [v7 addOperation:v4];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v18, 8);
}

- (OS_dispatch_queue)schedulingSerialQueue
{
  return self->_schedulingSerialQueue;
}

- (NSOperationQueue)thumbnailGenerationQueue
{
  return self->_thumbnailGenerationQueue;
}

- (ICThumbnailService)init
{
  id v3 = [MEMORY[0x1E4F83428] sharedContext];
  id v4 = [v3 managedObjectContext];

  id v5 = [MEMORY[0x1E4F83428] sharedContext];
  id v6 = [v5 workerManagedObjectContext];

  int v7 = [(ICThumbnailService *)self initWithViewContext:v4 workerContext:v6];
  return v7;
}

void __60__ICThumbnailService_thumbnailWithConfiguration_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [MEMORY[0x1E4F1C9C8] now];
  [v3 timeIntervalSinceDate:*(void *)(a1 + 32)];
  objc_msgSend(v7, "setFetchDuration:");

  [v7 setCreationDate:*(void *)(a1 + 32)];
  id v4 = [v7 image];
  if (!v4)
  {
    id v5 = [*(id *)(a1 + 40) fallbackBlock];

    if (!v5) {
      goto LABEL_5;
    }
    id v4 = [*(id *)(a1 + 40) fallbackBlock];
    [*(id *)(a1 + 40) scale];
    id v6 = v4[2](v4);
    [v7 setImage:v6];
  }
LABEL_5:
  [*(id *)(a1 + 48) processThumbnailDescriptionResult:v7];
}

- (id)managedObjectContextChangeController:(id)a3 managedObjectIDsToUpdateForUpdatedManagedObjects:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    uint64_t v20 = v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          v13 = objc_msgSend(v12, "changedValues", v20);
          v14 = [v13 allKeys];
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v22[0] = __108__ICThumbnailService_managedObjectContextChangeController_managedObjectIDsToUpdateForUpdatedManagedObjects___block_invoke;
          v22[1] = &unk_1E5FDE148;
          id v15 = v12;
          id v23 = v15;
          if (objc_msgSend(v14, "ic_containsObjectPassingTest:", v21))
          {
            [v15 objectID];
            v17 = id v16 = v6;
            objc_msgSend(v5, "ic_addNonNilObject:", v17);

            id v6 = v16;
          }

          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
        }
        objc_msgSend(v11, "note", v20);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        v13 = [v15 objectID];
        objc_msgSend(v5, "ic_addNonNilObject:", v13);
LABEL_13:

        continue;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }

  uint64_t v18 = (void *)[v5 copy];
  return v18;
}

- (ICThumbnailService)initWithViewContext:(id)a3 workerContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)ICThumbnailService;
  uint64_t v9 = [(ICThumbnailService *)&v31 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workerContext, a4);
    objc_storeStrong((id *)&v10->_viewContext, a3);
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    callbacks = v10->_callbacks;
    v10->_callbacks = (NSMutableDictionary *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INITIATED, -1);

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.notes.thumbnail-service-scheduler", v14);
    schedulingSerialQueue = v10->_schedulingSerialQueue;
    v10->_schedulingSerialQueue = (OS_dispatch_queue *)v15;

    uint64_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v18 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_USER_INITIATED, -1);

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.notes.thumbnail-service-background", v18);
    backgroundQueue = v10->_backgroundQueue;
    v10->_backgroundQueue = (OS_dispatch_queue *)v19;

    char v21 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    thumbnailGenerationQueue = v10->_thumbnailGenerationQueue;
    v10->_thumbnailGenerationQueue = v21;

    [(NSOperationQueue *)v10->_thumbnailGenerationQueue setQualityOfService:25];
    [(NSOperationQueue *)v10->_thumbnailGenerationQueue setMaxConcurrentOperationCount:2];
    [(NSOperationQueue *)v10->_thumbnailGenerationQueue setName:@"com.apple.notes.thumbnail-service-generation"];
    uint64_t v23 = +[ICThumbnailCache shared];
    cache = v10->_cache;
    v10->_cache = (ICThumbnailCaching *)v23;

    long long v25 = [ICManagedObjectContextChangeController alloc];
    long long v26 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ic_setFromNonNilObject:", v10->_viewContext);
    uint64_t v27 = [(ICManagedObjectContextChangeController *)v25 initWithManagedObjectContexts:v26 delegate:v10];
    managedObjectChangeController = v10->_managedObjectChangeController;
    v10->_managedObjectChangeController = (ICManagedObjectContextChangeController *)v27;

    uint64_t v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v29 addObserver:v10 selector:sel_attachmentPreviewImagesDidUpdate_ name:*MEMORY[0x1E4F83040] object:0];
  }
  return v10;
}

+ (ICThumbnailService)sharedThumbnailService
{
  if (sharedThumbnailService_onceToken != -1) {
    dispatch_once(&sharedThumbnailService_onceToken, &__block_literal_global_83);
  }
  v2 = (void *)sharedThumbnailService_instance;
  return (ICThumbnailService *)v2;
}

- (void)thumbnailWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v9 = [(ICThumbnailService *)self cache];
  id v10 = [v9 objectForKeyedSubscript:v6];

  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
    [v11 timeIntervalSinceDate:v8];
    objc_msgSend(v10, "setFetchDuration:");

    if (v7) {
      v7[2](v7, v10);
    }
  }
  else
  {
    id v12 = [(ICThumbnailService *)self backgroundQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__ICThumbnailService_thumbnailWithConfiguration_completion___block_invoke;
    v13[3] = &unk_1E5FDE120;
    v13[4] = self;
    id v14 = v6;
    id v16 = v7;
    id v15 = v8;
    dispatch_async(v12, v13);
  }
}

- (ICThumbnailCaching)cache
{
  return self->_cache;
}

- (OS_dispatch_queue)backgroundQueue
{
  return self->_backgroundQueue;
}

uint64_t __44__ICThumbnailService_sharedThumbnailService__block_invoke()
{
  sharedThumbnailService_instance = objc_alloc_init(ICThumbnailService);
  return MEMORY[0x1F41817F8]();
}

void __60__ICThumbnailService_thumbnailWithConfiguration_completion___block_invoke_3(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  int v3 = [WeakRetained isCancelled];

  if (v3)
  {
    uint64_t v11 = [[ICThumbnailDescription alloc] initWithConfiguration:a1[4]];
    id v4 = [MEMORY[0x1E4F1C9C8] now];
    [v4 timeIntervalSinceDate:a1[5]];
    -[ICThumbnailDescription setFetchDuration:](v11, "setFetchDuration:");

    [(ICThumbnailDescription *)v11 setCreationDate:a1[5]];
    id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v6 = (void *)[v5 initWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
    [(ICThumbnailDescription *)v11 setError:v6];

    [a1[6] processThumbnailDescriptionResult:v11];
  }
  else
  {
    id v7 = [a1[6] thumbnailGeneratorForConfiguration:a1[4]];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__ICThumbnailService_thumbnailWithConfiguration_completion___block_invoke_4;
    v12[3] = &unk_1E5FDE0D0;
    id v8 = a1[4];
    id v13 = a1[5];
    id v9 = a1[4];
    id v10 = a1[6];
    id v14 = v9;
    id v15 = v10;
    [v7 generateThumbnailWithConfiguration:v8 completion:v12];
  }
}

- (id)thumbnailGeneratorForConfiguration:(id)a3
{
  switch([a3 thumbnailType])
  {
    case 0:
      id v8 = ICThumbnailGeneratorAttachment;
      goto LABEL_8;
    case 1:
      id v8 = ICThumbnailGeneratorNote;
      goto LABEL_8;
    case 2:
    case 3:
      id v8 = ICThumbnailGeneratorNoteAttachments;
      goto LABEL_8;
    case 4:
    case 7:
    case 10:
    case 11:
      id v5 = [ICThumbnailGeneratorSystemPaper alloc];
      id v6 = [(ICThumbnailService *)self workerContext];
      id v7 = +[ICAssetThumbnailCache shared];
      int v3 = [(ICThumbnailGeneratorSystemPaper *)v5 initWithManagedObjectContext:v6 cache:v7];

      goto LABEL_9;
    case 5:
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICThumbnailService thumbnailGeneratorForConfiguration:]" simulateCrash:1 showAlert:0 format:@"Cannot generate System Paper backdrop thumbnail"];
      int v3 = 0;
      break;
    case 8:
      id v8 = ICThumbnailGeneratorAvatar;
LABEL_8:
      id v9 = [v8 alloc];
      id v6 = [(ICThumbnailService *)self workerContext];
      int v3 = (ICThumbnailGeneratorSystemPaper *)[v9 initWithManagedObjectContext:v6];
LABEL_9:

      break;
    default:
      break;
  }
  return v3;
}

- (NSManagedObjectContext)workerContext
{
  return self->_workerContext;
}

- (void)dealloc
{
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICThumbnailService;
  [(ICThumbnailService *)&v4 dealloc];
}

- (id)thumbnailWithConfiguration:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v18 = 0;
  dispatch_queue_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  char v21 = __Block_byref_object_copy__74;
  long long v22 = __Block_byref_object_dispose__74;
  id v23 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __49__ICThumbnailService_thumbnailWithConfiguration___block_invoke;
  id v15 = &unk_1E5FDB4C0;
  uint64_t v17 = &v18;
  id v6 = v5;
  id v16 = v6;
  [(ICThumbnailService *)self thumbnailWithConfiguration:v4 completion:&v12];
  dispatch_time_t v7 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    id v8 = os_log_create("com.apple.notes", "Thumbnails");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_msgSend(v4, "associatedObjectIdentifier", v12, v13, v14, v15);
      [(ICThumbnailService *)v9 thumbnailWithConfiguration:v8];
    }
  }
  id v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v10;
}

void __49__ICThumbnailService_thumbnailWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)thumbnailsWithConfigurations:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_group_t v8 = dispatch_group_create();
  id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v10 = dispatch_queue_create("com.apple.notes.mention-avatar", v9);

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__ICThumbnailService_thumbnailsWithConfigurations_completion___block_invoke;
  block[3] = &unk_1E5FD9EF0;
  objc_copyWeak(&v18, &location);
  id v15 = v6;
  dispatch_group_t v16 = v8;
  id v17 = v7;
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = v6;
  dispatch_async(v10, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __62__ICThumbnailService_thumbnailsWithConfigurations_completion___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v20 + 1) + 8 * v7);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __62__ICThumbnailService_thumbnailsWithConfigurations_completion___block_invoke_2;
        v16[3] = &unk_1E5FDE0D0;
        id v17 = v2;
        uint64_t v18 = v8;
        id v19 = *(id *)(a1 + 40);
        [WeakRetained thumbnailWithConfiguration:v8 completion:v16];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__ICThumbnailService_thumbnailsWithConfigurations_completion___block_invoke_3;
  block[3] = &unk_1E5FD8F20;
  id v9 = *(NSObject **)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v14 = v2;
  id v15 = v10;
  id v11 = v2;
  dispatch_group_notify(v9, MEMORY[0x1E4F14428], block);
}

void __62__ICThumbnailService_thumbnailsWithConfigurations_completion___block_invoke_2(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  uint64_t v4 = [a2 image];
  uint64_t v5 = (void *)[v4 copy];
  uint64_t v6 = [*(id *)(a1 + 40) associatedObjectIdentifier];
  [v3 setObject:v5 forKey:v6];

  uint64_t v7 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v7);
}

uint64_t __62__ICThumbnailService_thumbnailsWithConfigurations_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)attachmentPreviewImagesDidUpdate:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = [v4 object];

  uint64_t v6 = ICCheckedDynamicCast();

  uint64_t v7 = [(ICThumbnailService *)self workerContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__ICThumbnailService_attachmentPreviewImagesDidUpdate___block_invoke;
  v9[3] = &unk_1E5FD91D0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 performBlock:v9];
}

void __55__ICThumbnailService_attachmentPreviewImagesDidUpdate___block_invoke(uint64_t a1)
{
  id v8 = [MEMORY[0x1E4F1CA80] set];
  id v2 = [*(id *)(a1 + 32) workerContext];
  int v3 = objc_msgSend(v2, "ic_existingObjectWithID:", *(void *)(a1 + 40));

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 identifier];
    objc_msgSend(v8, "ic_addNonNilObject:", v4);

    uint64_t v5 = [v3 note];
    uint64_t v6 = [v5 identifier];
    objc_msgSend(v8, "ic_addNonNilObject:", v6);
  }
  uint64_t v7 = [*(id *)(a1 + 32) cache];
  [v7 invalidateForObjectIdentifiers:v8];
}

uint64_t __108__ICThumbnailService_managedObjectContextChangeController_managedObjectIDsToUpdateForUpdatedManagedObjects___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 noteCellKeyPaths];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

- (void)managedObjectContextChangeController:(id)a3 performUpdatesForManagedObjectIDs:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = a4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v23;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v22 + 1) + 8 * v8);
        uint64_t v16 = 0;
        id v17 = &v16;
        uint64_t v18 = 0x3032000000;
        id v19 = __Block_byref_object_copy__74;
        long long v20 = __Block_byref_object_dispose__74;
        id v21 = 0;
        id v10 = [(ICThumbnailService *)self viewContext];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __93__ICThumbnailService_managedObjectContextChangeController_performUpdatesForManagedObjectIDs___block_invoke;
        v15[3] = &unk_1E5FD9870;
        v15[5] = v9;
        v15[6] = &v16;
        v15[4] = self;
        [v10 performBlockAndWait:v15];

        if (v17[5])
        {
          id v11 = [(ICThumbnailService *)self cache];
          uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v17[5]];
          [v11 invalidateForObjectIdentifiers:v12];
        }
        _Block_object_dispose(&v16, 8);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }
}

void __93__ICThumbnailService_managedObjectContextChangeController_performUpdatesForManagedObjectIDs___block_invoke(uint64_t a1)
{
  objc_opt_class();
  id v7 = [*(id *)(a1 + 32) viewContext];
  id v2 = objc_msgSend(v7, "ic_existingObjectWithID:", *(void *)(a1 + 40));
  id v3 = ICDynamicCast();
  uint64_t v4 = [v3 identifier];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (BOOL)managedObjectContextChangeControllerShouldUpdateImmediately:(id)a3
{
  return 1;
}

- (NSManagedObjectContext)viewContext
{
  return self->_viewContext;
}

- (ICManagedObjectContextChangeController)managedObjectChangeController
{
  return self->_managedObjectChangeController;
}

- (void)setManagedObjectChangeController:(id)a3
{
}

- (void)setCallbacks:(id)a3
{
}

- (void)setSchedulingSerialQueue:(id)a3
{
}

- (void)setBackgroundQueue:(id)a3
{
}

- (void)setThumbnailGenerationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailGenerationQueue, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_schedulingSerialQueue, 0);
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_storeStrong((id *)&self->_managedObjectChangeController, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_viewContext, 0);
  objc_storeStrong((id *)&self->_workerContext, 0);
}

- (void)thumbnailWithConfiguration:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = &unk_1F09A4688;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "ICThumbnailService timed out generating thumbnail synchronously after %@s for: %@.", buf, 0x16u);
}

@end