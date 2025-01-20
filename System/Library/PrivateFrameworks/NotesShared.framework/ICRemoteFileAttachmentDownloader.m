@interface ICRemoteFileAttachmentDownloader
+ (BOOL)needsToDownloadRemoteFileAttachments;
+ (id)allUndownloadedLegacyAttachmentsInContext:(id)a3;
+ (id)sharedDownloader;
+ (void)initializeDownloaderAfterDelayIfNecessary;
+ (void)releaseSharedDownloaderIfPossible;
- (ICRemoteFileAttachmentDownloader)init;
- (NSMutableDictionary)operationsByAttachmentIdentifier;
- (NSOperationQueue)operationQueue;
- (void)dealloc;
- (void)downloadRemoteFileForAttachment:(id)a3;
- (void)downloadRemoteFileForAttachmentObjectID:(id)a3;
- (void)downloadUndownloadedLegacyAttachments;
- (void)init;
- (void)reachabilityChanged:(id)a3;
- (void)resumeDownloadsAfterDelay;
- (void)setOperationQueue:(id)a3;
- (void)setOperationsByAttachmentIdentifier:(id)a3;
@end

@implementation ICRemoteFileAttachmentDownloader

+ (void)initializeDownloaderAfterDelayIfNecessary
{
  v3 = [MEMORY[0x1E4F83740] appLifeCycleHandler];
  [v3 cancelBlocksWithStringIdentifier:@"ICRemoteFileAttachmentDownloaderDispatchAfterIdentifier"];

  v4 = [MEMORY[0x1E4F83740] appLifeCycleHandler];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__ICRemoteFileAttachmentDownloader_initializeDownloaderAfterDelayIfNecessary__block_invoke;
  v5[3] = &__block_descriptor_40_e5_v8__0l;
  v5[4] = a1;
  [v4 dispatchAfter:@"ICRemoteFileAttachmentDownloaderDispatchAfterIdentifier" stringIdentifier:v5 withBlock:5.0];
}

+ (id)sharedDownloader
{
  id v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)sSharedDownloader;
  if (!sSharedDownloader)
  {
    v4 = objc_alloc_init(ICRemoteFileAttachmentDownloader);
    v5 = (void *)sSharedDownloader;
    sSharedDownloader = (uint64_t)v4;

    v3 = (void *)sSharedDownloader;
  }
  id v6 = v3;
  objc_sync_exit(v2);

  return v6;
}

void __77__ICRemoteFileAttachmentDownloader_initializeDownloaderAfterDelayIfNecessary__block_invoke(uint64_t a1)
{
  id v2 = dispatch_get_global_queue(-2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__ICRemoteFileAttachmentDownloader_initializeDownloaderAfterDelayIfNecessary__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

id __77__ICRemoteFileAttachmentDownloader_initializeDownloaderAfterDelayIfNecessary__block_invoke_2(uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 32) needsToDownloadRemoteFileAttachments];
  if (result) {
    return (id)[*(id *)(a1 + 32) sharedDownloader];
  }
  return result;
}

+ (void)releaseSharedDownloaderIfPossible
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Releasing the shared remote file attachment downloader", v1, 2u);
}

+ (BOOL)needsToDownloadRemoteFileAttachments
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v3 = +[ICNoteContext sharedContext];
  v4 = [v3 workerManagedObjectContext];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__ICRemoteFileAttachmentDownloader_needsToDownloadRemoteFileAttachments__block_invoke;
  v7[3] = &unk_1E64A6000;
  id v10 = a1;
  id v5 = v4;
  id v8 = v5;
  v9 = &v11;
  [v5 performBlockAndWait:v7];
  LOBYTE(v4) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __72__ICRemoteFileAttachmentDownloader_needsToDownloadRemoteFileAttachments__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 48) allUndownloadedLegacyAttachmentsInContext:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count] != 0;
}

+ (id)allUndownloadedLegacyAttachmentsInContext:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "predicateWithFormat:", @"%K != nil", @"remoteFileURLString");
  v11[0] = v5;
  id v6 = +[ICBaseAttachment predicateForVisibleAttachmentsInContext:v4];
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  id v8 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v7];
  v9 = +[ICBaseAttachment attachmentsMatchingPredicate:v8 context:v4];

  return v9;
}

- (ICRemoteFileAttachmentDownloader)init
{
  v12.receiver = self;
  v12.super_class = (Class)ICRemoteFileAttachmentDownloader;
  id v2 = [(ICRemoteFileAttachmentDownloader *)&v12 init];
  if (v2)
  {
    v3 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[ICRemoteFileAttachmentDownloader init](v3);
    }

    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    [(ICRemoteFileAttachmentDownloader *)v2 setOperationsByAttachmentIdentifier:v4];

    id v5 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    [(ICRemoteFileAttachmentDownloader *)v2 setOperationQueue:v5];

    id v6 = [(ICRemoteFileAttachmentDownloader *)v2 operationQueue];
    [v6 setMaxConcurrentOperationCount:2];

    v7 = [(ICRemoteFileAttachmentDownloader *)v2 operationQueue];
    [v7 setName:@"RemoteFileAttachmentDownloader"];

    [(ICRemoteFileAttachmentDownloader *)v2 resumeDownloadsAfterDelay];
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v9 = *MEMORY[0x1E4F838C0];
    id v10 = [MEMORY[0x1E4F837B0] sharedReachabilityForInternetConnection];
    [v8 addObserver:v2 selector:sel_reachabilityChanged_ name:v9 object:v10];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  v7 = __43__ICRemoteFileAttachmentDownloader_dealloc__block_invoke;
  id v8 = &unk_1E64A4240;
  uint64_t v9 = self;
  performBlockOnMainThreadAndWait();
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICRemoteFileAttachmentDownloader;
  [(ICRemoteFileAttachmentDownloader *)&v4 dealloc];
}

uint64_t __43__ICRemoteFileAttachmentDownloader_dealloc__block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32)];
}

- (void)resumeDownloadsAfterDelay
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__ICRemoteFileAttachmentDownloader_resumeDownloadsAfterDelay__block_invoke;
  block[3] = &unk_1E64A4240;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __61__ICRemoteFileAttachmentDownloader_resumeDownloadsAfterDelay__block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel_downloadUndownloadedLegacyAttachments object:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 performSelector:sel_downloadUndownloadedLegacyAttachments withObject:0 afterDelay:5.0];
}

- (void)downloadUndownloadedLegacyAttachments
{
  v3 = +[ICNoteContext sharedContext];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__ICRemoteFileAttachmentDownloader_downloadUndownloadedLegacyAttachments__block_invoke;
  v4[3] = &unk_1E64A6BC8;
  v4[4] = self;
  [v3 performBackgroundTask:v4];
}

void __73__ICRemoteFileAttachmentDownloader_downloadUndownloadedLegacyAttachments__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = [(id)objc_opt_class() allUndownloadedLegacyAttachmentsInContext:v3];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = objc_msgSend(v4, "copy", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(a1 + 32) downloadRemoteFileForAttachment:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(id)objc_opt_class() releaseSharedDownloaderIfPossible];
}

- (void)downloadRemoteFileForAttachment:(id)a3
{
  id v4 = [a3 objectID];
  [(ICRemoteFileAttachmentDownloader *)self downloadRemoteFileForAttachmentObjectID:v4];
}

- (void)downloadRemoteFileForAttachmentObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__50;
  v35 = __Block_byref_object_dispose__50;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__50;
  v29 = __Block_byref_object_dispose__50;
  id v30 = 0;
  uint64_t v5 = +[ICNoteContext sharedContext];
  uint64_t v6 = [v5 workerManagedObjectContext];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke;
  v19[3] = &unk_1E64A8EB8;
  id v7 = v4;
  id v20 = v7;
  id v8 = v6;
  id v21 = v8;
  v22 = self;
  v23 = &v25;
  v24 = &v31;
  [v8 performBlockAndWait:v19];
  if (v26[5])
  {
    uint64_t v9 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[ICRemoteFileAttachmentDownloader downloadRemoteFileForAttachmentObjectID:]();
    }

    long long v10 = (void *)MEMORY[0x1E4F28B48];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_32;
    v14[3] = &unk_1E64A8F30;
    v17 = &v25;
    v18 = &v31;
    id v15 = v7;
    v16 = self;
    long long v11 = [v10 blockOperationWithBlock:v14];
    long long v12 = [(ICRemoteFileAttachmentDownloader *)self operationsByAttachmentIdentifier];
    [v12 setObject:v11 forKeyedSubscript:v32[5]];

    long long v13 = [(ICRemoteFileAttachmentDownloader *)self operationQueue];
    [v13 addOperation:v11];
  }
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
}

void __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke(uint64_t a1)
{
  id v12 = +[ICAttachment ic_existingObjectWithID:*(void *)(a1 + 32) context:*(void *)(a1 + 40)];
  if (([v12 isDeleted] & 1) == 0 && (objc_msgSend(v12, "isSharedViaICloud") & 1) == 0)
  {
    if ([v12 isVisible])
    {
      id v2 = [v12 remoteFileURL];

      if (v2)
      {
        id v3 = [*(id *)(a1 + 48) operationsByAttachmentIdentifier];
        id v4 = [v12 identifier];
        uint64_t v5 = [v3 objectForKeyedSubscript:v4];

        if (!v5 || [v5 isFinished])
        {
          uint64_t v6 = [v12 remoteFileURL];
          uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
          id v8 = *(void **)(v7 + 40);
          *(void *)(v7 + 40) = v6;

          uint64_t v9 = [v12 identifier];
          uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
          long long v11 = *(void **)(v10 + 40);
          *(void *)(v10 + 40) = v9;
        }
      }
    }
  }
}

void __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_32(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__50;
  v43 = __Block_byref_object_dispose__50;
  id v44 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__50;
  v37 = __Block_byref_object_dispose__50;
  id v38 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = [MEMORY[0x1E4F290E0] sharedSession];
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_2;
  v26[3] = &unk_1E64A8EE0;
  v28 = v31;
  v29 = &v33;
  id v30 = &v39;
  uint64_t v5 = v2;
  uint64_t v27 = v5;
  uint64_t v6 = [v3 dataTaskWithURL:v4 completionHandler:v26];

  [v6 resume];
  dispatch_time_t v7 = dispatch_time(0, 20000000000);
  dispatch_semaphore_wait(v5, v7);
  id v8 = (void *)v40[5];
  if (!v8) {
    goto LABEL_8;
  }
  if ([v8 code] == -1009)
  {
    uint64_t v9 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_32_cold_3();
    }
    goto LABEL_14;
  }
  if (v40[5])
  {
    uint64_t v9 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_32_cold_4();
    }
  }
  else
  {
LABEL_8:
    uint64_t v10 = v34[5];
    os_log_t v11 = os_log_create("com.apple.notes", "Media");
    uint64_t v9 = v11;
    if (v10)
    {
      uint64_t v9 = v11;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_32_cold_2(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), [(id)v34[5] length], buf, v9);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_32_cold_1();
    }
  }
LABEL_14:

  id v12 = +[ICNoteContext sharedContext];
  long long v13 = [v12 workerManagedObjectContext];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_36;
  v18[3] = &unk_1E64A8F08;
  id v19 = *(id *)(a1 + 32);
  id v14 = v13;
  uint64_t v16 = *(void *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 56);
  id v20 = v14;
  uint64_t v21 = v15;
  v22 = &v33;
  uint64_t v23 = v16;
  v24 = v31;
  uint64_t v25 = &v39;
  [v14 performBlockAndWait:v18];
  v17 = [*(id *)(a1 + 40) operationsByAttachmentIdentifier];
  [v17 removeObjectForKey:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

  [(id)objc_opt_class() releaseSharedDownloaderIfPossible];
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
}

void __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 statusCode] != 200) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  os_log_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
  id v12 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_36(void *a1)
{
  dispatch_semaphore_t v2 = +[ICAttachment ic_existingObjectWithID:a1[4] context:a1[5]];
  id v3 = v2;
  if (!v2 || ([v2 isVisible] & 1) == 0)
  {
    uint64_t v5 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_36_cold_2();
    }
    goto LABEL_9;
  }
  uint64_t v4 = [v3 media];

  if (v4)
  {
    uint64_t v5 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_36_cold_3(v3, v5);
    }

LABEL_9:
    goto LABEL_10;
  }
  uint64_t v10 = *(void *)(*(void *)(a1[7] + 8) + 40);
  if (v10)
  {
    os_log_t v11 = [*(id *)(*(void *)(a1[8] + 8) + 40) lastPathComponent];
    id v12 = +[ICMedia newMediaWithAttachment:v3 forData:v10 filename:v11 error:0];
    [v3 setMedia:v12];

    [v3 setRemoteFileURL:0];
    id v13 = [v3 attachmentModel];
    [v13 updateFileBasedAttributes];

    id v14 = @"Downloaded remote file";
LABEL_19:
    [v3 updateChangeCountWithReason:v14];
    goto LABEL_10;
  }
  if (*(unsigned char *)(*(void *)(a1[9] + 8) + 24)
    || (uint64_t v15 = *(void **)(*(void *)(a1[10] + 8) + 40)) != 0 && [v15 code] != -1009)
  {
    [v3 setRemoteFileURL:0];
    id v14 = @"Failed downloading remote file";
    goto LABEL_19;
  }
LABEL_10:
  uint64_t v6 = (void *)a1[5];
  id v16 = 0;
  char v7 = [v6 save:&v16];
  id v8 = v16;
  if ((v7 & 1) == 0)
  {
    id v9 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_36_cold_1((uint64_t)v8, v9);
    }
  }
}

- (void)reachabilityChanged:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F837B0], "sharedReachabilityForInternetConnection", a3);
  uint64_t v5 = [v4 currentReachabilityStatus];

  if ((unint64_t)(v5 - 1) <= 1)
  {
    [(ICRemoteFileAttachmentDownloader *)self resumeDownloadsAfterDelay];
  }
}

- (NSMutableDictionary)operationsByAttachmentIdentifier
{
  return self->_operationsByAttachmentIdentifier;
}

- (void)setOperationsByAttachmentIdentifier:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_operationsByAttachmentIdentifier, 0);
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Creating the shared remote file attachment downloader", v1, 2u);
}

- (void)downloadRemoteFileForAttachmentObjectID:.cold.1()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "Adding operation to download remote URL for attachment %@", v2, v3, v4, v5, v6);
}

void __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_32_cold_1()
{
  OUTLINED_FUNCTION_0_11(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_6();
  _os_log_error_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_ERROR, "Unknown error downloading remote URL for attachment (%@)", v1, 0xCu);
}

void __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_32_cold_2(uint64_t a1, unint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(double *)(buf + 14) = (double)a2 * 0.0009765625;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Downloaded remote URL for attachment (%@). Size=%.2fkb", buf, 0x16u);
}

void __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_32_cold_3()
{
  OUTLINED_FUNCTION_0_11(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "No internet connection while downloading remote URL for attachment (%@)", v2, v3, v4, v5, v6);
}

void __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_32_cold_4()
{
  OUTLINED_FUNCTION_0_11(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_6();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1C3A61000, v1, OS_LOG_TYPE_ERROR, "Error downloading remote URL for attachment (%@): %@", v2, 0x16u);
}

void __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_36_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Error saving after downloading remote file attachment: %@", (uint8_t *)&v2, 0xCu);
}

void __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_36_cold_2()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "Finished downloading a file for a deleted attachment (%@)", v2, v3, v4, v5, v6);
}

void __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_36_cold_3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 identifier];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Trying to set a media for a downloaded attachment (%@), but it already has a media.", (uint8_t *)&v4, 0xCu);
}

@end