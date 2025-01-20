@interface ICAttachmentPreviewGenerator
+ (BOOL)docCamOCRGenerationEnabled;
+ (BOOL)imageClassificationEnabled;
+ (BOOL)imageOCRGenerationEnabled;
+ (BOOL)universalSearchProcessingLibraryEnabled;
+ (ICAttachmentPreviewGenerator)sharedGenerator;
+ (void)purgeImageClassificationsInContext:(id)a3;
+ (void)purgeOCRInContext:(id)a3;
+ (void)setImageClassificationTemporarilyDisabled:(BOOL)a3;
- (BOOL)isPreviewGenerationSupported;
- (BOOL)previewOperationsIdle;
- (BOOL)shouldGenerateAttachmentsWhenReachable;
- (ICAttachmentPreviewGenerator)init;
- (ICAttachmentPreviewGeneratorOperationQueue)asyncGeneratorQueue;
- (ICAttachmentPreviewGeneratorOperationQueue)costlyGeneratorQueue;
- (ICAttachmentPreviewGeneratorOperationQueue)generatorQueue;
- (ICAttachmentPreviewGeneratorOperationQueue)postProcessingQueue;
- (ICProgressIndicatorTracking)progressTracker;
- (NSMapTable)lastOperationForAttachmentID;
- (NSMutableDictionary)attachmentIDsProgress;
- (NSMutableOrderedSet)postProcessingIDsPending;
- (NSMutableSet)attachmentIDsPending;
- (OS_dispatch_queue)previewProgressQueue;
- (OS_dispatch_queue)previewQueue;
- (id)progressForObjectID:(id)a3;
- (unint64_t)postProcessingRequestIndex;
- (unint64_t)previewGenerationState;
- (void)adjustUserTitleIfNecessaryForAttachment:(id)a3;
- (void)attachmentNeedsPostProcessingNotification:(id)a3;
- (void)attachmentNeedsPreviewGenerationNotification:(id)a3;
- (void)attachmentWillBeDeleted:(id)a3;
- (void)beginPostProcessingAfterDelayIfNecessaryWithForceDelay:(BOOL)a3;
- (void)cancelGenerationOfPendingPreviews;
- (void)cancelIfNeededForAttachment:(id)a3;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)disableAutomaticPreviewGeneration;
- (void)enableAutomaticPreviewGeneration;
- (void)fetchMissingOrOutdatedImageClassificationSummaryAttachmentIDsInContext:(id)a3 completion:(id)a4;
- (void)fetchMissingOrOutdatedMetaDataAttachmentIDsInContext:(id)a3 completion:(id)a4;
- (void)fetchMissingOrOutdatedOCRSummaryAttachmentIDsInContext:(id)a3 completion:(id)a4;
- (void)generateMissingOrOutdatedAttachmentMetaDataIfNeededInContext:(id)a3;
- (void)generatePendingPreviewForAttachment:(id)a3;
- (void)generatePendingPreviews;
- (void)generatePreviewIfNeededForAttachment:(id)a3;
- (void)generatePreviewIfNeededForAttachmentWithObjectID:(id)a3;
- (void)generatePreviewsIfNeeded;
- (void)mediaDidLoad:(id)a3;
- (void)operationComplete:(id)a3;
- (void)postProcessIfNeededForAttachment:(id)a3;
- (void)postProcessPendingPreviews;
- (void)postProcessPreviewForAttachment:(id)a3;
- (void)progressIndicatorTrackerStartAnimation;
- (void)progressIndicatorTrackerStopAnimation;
- (void)reachabilityChanged:(id)a3;
- (void)resume;
- (void)setAsyncGeneratorQueue:(id)a3;
- (void)setAttachmentIDsPending:(id)a3;
- (void)setAttachmentIDsProgress:(id)a3;
- (void)setCostlyGeneratorQueue:(id)a3;
- (void)setGeneratorQueue:(id)a3;
- (void)setLastOperationForAttachmentID:(id)a3;
- (void)setPostProcessingIDsPending:(id)a3;
- (void)setPostProcessingQueue:(id)a3;
- (void)setPostProcessingRequestIndex:(unint64_t)a3;
- (void)setPreviewGenerationState:(unint64_t)a3;
- (void)setPreviewProgressQueue:(id)a3;
- (void)setPreviewQueue:(id)a3;
- (void)setProgress:(id)a3 forObjectID:(id)a4;
- (void)setProgressTracker:(id)a3;
- (void)setShouldGenerateAttachmentsWhenReachable:(BOOL)a3;
- (void)suspend;
@end

@implementation ICAttachmentPreviewGenerator

+ (ICAttachmentPreviewGenerator)sharedGenerator
{
  if (sharedGenerator_once != -1) {
    dispatch_once(&sharedGenerator_once, &__block_literal_global_44);
  }
  v2 = (void *)sharedGenerator;
  return (ICAttachmentPreviewGenerator *)v2;
}

uint64_t __47__ICAttachmentPreviewGenerator_sharedGenerator__block_invoke()
{
  v0 = objc_alloc_init(ICAttachmentPreviewGenerator);
  sharedGenerator = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0);
}

- (ICAttachmentPreviewGenerator)init
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)ICAttachmentPreviewGenerator;
  v2 = [(ICAttachmentPreviewGenerator *)&v40 init];
  if (v2)
  {
    v3 = objc_alloc_init(ICAttachmentPreviewGeneratorOperationQueue);
    generatorQueue = v2->_generatorQueue;
    v2->_generatorQueue = v3;

    [(ICAttachmentPreviewGeneratorOperationQueue *)v2->_generatorQueue setName:@"Generator Queue"];
    [(ICAttachmentPreviewGeneratorOperationQueue *)v2->_generatorQueue setMaxConcurrentOperationCount:1];
    v5 = objc_alloc_init(ICAttachmentPreviewGeneratorOperationQueue);
    asyncGeneratorQueue = v2->_asyncGeneratorQueue;
    v2->_asyncGeneratorQueue = v5;

    [(ICAttachmentPreviewGeneratorOperationQueue *)v2->_asyncGeneratorQueue setName:@"Async Generator Queue"];
    [(ICAttachmentPreviewGeneratorOperationQueue *)v2->_asyncGeneratorQueue setMaxConcurrentOperationCount:2];
    v7 = objc_alloc_init(ICAttachmentPreviewGeneratorOperationQueue);
    costlyGeneratorQueue = v2->_costlyGeneratorQueue;
    v2->_costlyGeneratorQueue = v7;

    [(ICAttachmentPreviewGeneratorOperationQueue *)v2->_costlyGeneratorQueue setName:@"Costly Generator Queue"];
    [(ICAttachmentPreviewGeneratorOperationQueue *)v2->_costlyGeneratorQueue setMaxConcurrentOperationCount:1];
    v9 = objc_alloc_init(ICAttachmentPreviewGeneratorOperationQueue);
    postProcessingQueue = v2->_postProcessingQueue;
    v2->_postProcessingQueue = v9;

    [(ICAttachmentPreviewGeneratorOperationQueue *)v2->_postProcessingQueue setName:@"Attachment Post-Processing Queue"];
    [(ICAttachmentPreviewGeneratorOperationQueue *)v2->_postProcessingQueue setMaxConcurrentOperationCount:1];
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.notes.preview-generator", v11);
    previewQueue = v2->_previewQueue;
    v2->_previewQueue = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.notes.preview-generator-progress", v14);
    previewProgressQueue = v2->_previewProgressQueue;
    v2->_previewProgressQueue = (OS_dispatch_queue *)v15;

    Class v17 = NSClassFromString(&cfstr_Icprogressindi.isa);
    if (v17)
    {
      Class v18 = v17;
      uint64_t v34 = MEMORY[0x1E4F143A8];
      uint64_t v35 = 3221225472;
      v36 = __36__ICAttachmentPreviewGenerator_init__block_invoke;
      v37 = &unk_1E5FDBAC8;
      v38 = v2;
      Class v39 = v18;
      dispatch_async(MEMORY[0x1E4F14428], &v34);
    }
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28E10], "strongToWeakObjectsMapTable", v34, v35, v36, v37);
    lastOperationForAttachmentID = v2->_lastOperationForAttachmentID;
    v2->_lastOperationForAttachmentID = (NSMapTable *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA80] set];
    attachmentIDsPending = v2->_attachmentIDsPending;
    v2->_attachmentIDsPending = (NSMutableSet *)v21;

    uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
    attachmentIDsProgress = v2->_attachmentIDsProgress;
    v2->_attachmentIDsProgress = (NSMutableDictionary *)v23;

    v25 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    postProcessingIDsPending = v2->_postProcessingIDsPending;
    v2->_postProcessingIDsPending = v25;

    [(ICAttachmentPreviewGenerator *)v2 enableAutomaticPreviewGeneration];
    v27 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      if ([(id)objc_opt_class() docCamOCRGenerationEnabled]) {
        v28 = @"enabled";
      }
      else {
        v28 = @"disabled";
      }
      *(_DWORD *)buf = 138412290;
      v42 = v28;
      _os_log_impl(&dword_1B08EB000, v27, OS_LOG_TYPE_INFO, "DocCam OCR Generation is %@", buf, 0xCu);
    }

    v29 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      if ([(id)objc_opt_class() imageOCRGenerationEnabled]) {
        v30 = @"enabled";
      }
      else {
        v30 = @"disabled";
      }
      *(_DWORD *)buf = 138412290;
      v42 = v30;
      _os_log_impl(&dword_1B08EB000, v29, OS_LOG_TYPE_INFO, "Image OCR Generation is %@", buf, 0xCu);
    }

    v31 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      if ([(id)objc_opt_class() imageClassificationEnabled]) {
        v32 = @"enabled";
      }
      else {
        v32 = @"disabled";
      }
      *(_DWORD *)buf = 138412290;
      v42 = v32;
      _os_log_impl(&dword_1B08EB000, v31, OS_LOG_TYPE_INFO, "Image Classification is %@", buf, 0xCu);
    }
  }
  return v2;
}

uint64_t __36__ICAttachmentPreviewGenerator_init__block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(*(Class *)(a1 + 40)) initWithDelegate:*(void *)(a1 + 32)];
  *(void *)(*(void *)(a1 + 32) + 64) = v2;
  return MEMORY[0x1F41817F8](v2);
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICAttachmentPreviewGenerator;
  [(ICAttachmentPreviewGenerator *)&v4 dealloc];
}

- (void)progressIndicatorTrackerStartAnimation
{
  id v2 = [(ICAttachmentPreviewGenerator *)self costlyGeneratorQueue];
  [v2 setSuspended:1];
}

- (void)progressIndicatorTrackerStopAnimation
{
  id v2 = [(ICAttachmentPreviewGenerator *)self costlyGeneratorQueue];
  [v2 setSuspended:0];
}

- (BOOL)isPreviewGenerationSupported
{
  id v2 = [MEMORY[0x1E4F83428] sharedContext];
  char v3 = [v2 hasContextOptions:32];

  return v3;
}

- (BOOL)previewOperationsIdle
{
  char v3 = [(ICAttachmentPreviewGenerator *)self attachmentIDsPending];
  uint64_t v4 = [v3 count];

  v5 = [(ICAttachmentPreviewGenerator *)self generatorQueue];
  uint64_t v6 = v4 | [v5 operationCount];

  v7 = [(ICAttachmentPreviewGenerator *)self costlyGeneratorQueue];
  uint64_t v8 = [v7 operationCount];

  v9 = [(ICAttachmentPreviewGenerator *)self asyncGeneratorQueue];
  uint64_t v10 = [v9 operationCount];

  return !v6 && (v8 | v10) == 0;
}

- (void)generatePreviewsIfNeeded
{
  if ([(ICAttachmentPreviewGenerator *)self isPreviewGenerationSupported])
  {
    char v3 = [(ICAttachmentPreviewGenerator *)self previewQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__ICAttachmentPreviewGenerator_generatePreviewsIfNeeded__block_invoke;
    block[3] = &unk_1E5FD8DF0;
    block[4] = self;
    dispatch_async(v3, block);

    [(ICAttachmentPreviewGenerator *)self generatePendingPreviews];
  }
}

void __56__ICAttachmentPreviewGenerator_generatePreviewsIfNeeded__block_invoke(uint64_t a1)
{
  if ((unint64_t)[*(id *)(a1 + 32) previewGenerationState] <= 1)
  {
    [*(id *)(a1 + 32) setPreviewGenerationState:2];
    id v2 = [*(id *)(a1 + 32) attachmentIDsPending];
    [v2 removeAllObjects];
  }
}

+ (BOOL)docCamOCRGenerationEnabled
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"ICDocCamOCRDisabledDefaultsKey"] ^ 1;

  return v3;
}

+ (BOOL)universalSearchProcessingLibraryEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)imageOCRGenerationEnabled
{
  if ([a1 universalSearchProcessingLibraryEnabled])
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    char v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v2 = [v3 BOOLForKey:@"ICImageOCRDisabledDefaultsKey"] ^ 1;
  }
  return v2;
}

+ (BOOL)imageClassificationEnabled
{
  if ([a1 universalSearchProcessingLibraryEnabled]) {
    return 0;
  }
  char v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"ICImageClassificationDisabledDefaultsKey"];

  if ((v4 & 1) == 0)
  {
    objc_opt_class();
    uint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v7 = [v6 objectForKey:@"ICImageClassificationTemporarilyDisabledUntilDateDefaultsKey"];
    uint64_t v8 = ICDynamicCast();

    if (v8)
    {
      v9 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v10 = [v9 compare:v8];

      if (v10 == -1)
      {
        char v5 = 1;
        goto LABEL_10;
      }
      v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v11 removeObjectForKey:@"ICImageClassificationTemporarilyDisabledUntilDateDefaultsKey"];
    }
    char v5 = 0;
LABEL_10:

    return v5 ^ 1;
  }
  char v5 = 1;
  return v5 ^ 1;
}

+ (void)setImageClassificationTemporarilyDisabled:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    char v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:10800.0];
    char v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v4 setObject:v3 forKey:@"ICImageClassificationTemporarilyDisabledUntilDateDefaultsKey"];

    char v5 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      uint64_t v8 = v3;
      _os_log_impl(&dword_1B08EB000, v5, OS_LOG_TYPE_INFO, "image classification temporarily disabled until %@", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v6 removeObjectForKey:@"ICImageClassificationTemporarilyDisabledUntilDateDefaultsKey"];

    char v3 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1B08EB000, v3, OS_LOG_TYPE_INFO, "image classification no longer temporarily disabled", (uint8_t *)&v7, 2u);
    }
  }
}

+ (void)purgeImageClassificationsInContext:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__ICAttachmentPreviewGenerator_purgeImageClassificationsInContext___block_invoke;
  v5[3] = &unk_1E5FD8DF0;
  id v6 = v3;
  id v4 = v3;
  [v4 performBlockAndWait:v5];
}

void __67__ICAttachmentPreviewGenerator_purgeImageClassificationsInContext___block_invoke(uint64_t a1)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  int v2 = [MEMORY[0x1E4F832A0] predicateForPasswordProtected:0];
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(imageClassificationSummary != nil)"];
  id v4 = (void *)MEMORY[0x1E4F28BA0];
  v8[0] = v2;
  v8[1] = v3;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v6 = [v4 andPredicateWithSubpredicates:v5];

  int v7 = [MEMORY[0x1E4F832A0] attachmentsMatchingPredicate:v6 context:*(void *)(a1 + 32)];
  [v7 enumerateObjectsUsingBlock:&__block_literal_global_67_0];
}

void __67__ICAttachmentPreviewGenerator_purgeImageClassificationsInContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v2 = (void *)MEMORY[0x1B3E9ED80]();
  [v3 setImageClassificationSummary:0];
  [v3 updateChangeCountWithReason:@"Purged image classification"];
}

+ (void)purgeOCRInContext:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__ICAttachmentPreviewGenerator_purgeOCRInContext___block_invoke;
  v5[3] = &unk_1E5FD8DF0;
  id v6 = v3;
  id v4 = v3;
  [v4 performBlockAndWait:v5];
}

void __50__ICAttachmentPreviewGenerator_purgeOCRInContext___block_invoke(uint64_t a1)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  int v2 = [MEMORY[0x1E4F832A0] predicateForPasswordProtected:0];
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(ocrSummary != nil)"];
  id v4 = (void *)MEMORY[0x1E4F28BA0];
  v8[0] = v2;
  v8[1] = v3;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v6 = [v4 andPredicateWithSubpredicates:v5];

  int v7 = [MEMORY[0x1E4F832A0] attachmentsMatchingPredicate:v6 context:*(void *)(a1 + 32)];
  [v7 enumerateObjectsUsingBlock:&__block_literal_global_75];
}

void __50__ICAttachmentPreviewGenerator_purgeOCRInContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v2 = (void *)MEMORY[0x1B3E9ED80]();
  [v3 setOcrSummary:0];
  [v3 updateChangeCountWithReason:@"Purged OCR"];
}

- (void)fetchMissingOrOutdatedImageClassificationSummaryAttachmentIDsInContext:(id)a3 completion:(id)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(media != nil)"];
  uint64_t v8 = [MEMORY[0x1E4F832A0] predicateForPasswordProtected:0];
  uint64_t v9 = [MEMORY[0x1E4F832A0] notDeletedPredicate];
  v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(imageClassificationSummary == nil)"];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(imageClassificationSummaryVersion < %d)", (__int16)*MEMORY[0x1E4F82FE8]);
  v11 = (void *)MEMORY[0x1E4F28BA0];
  v26[0] = v20;
  v26[1] = v10;
  dispatch_queue_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v13 = [v11 orPredicateWithSubpredicates:v12];

  v14 = (void *)MEMORY[0x1E4F28BA0];
  v25[0] = v7;
  v25[1] = v9;
  v25[2] = v13;
  v25[3] = v8;
  dispatch_queue_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
  v16 = [v14 andPredicateWithSubpredicates:v15];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __114__ICAttachmentPreviewGenerator_fetchMissingOrOutdatedImageClassificationSummaryAttachmentIDsInContext_completion___block_invoke;
  v21[3] = &unk_1E5FDBB10;
  id v22 = v16;
  id v23 = v5;
  id v24 = v6;
  id v17 = v6;
  id v18 = v5;
  id v19 = v16;
  [v18 performBlock:v21];
}

void __114__ICAttachmentPreviewGenerator_fetchMissingOrOutdatedImageClassificationSummaryAttachmentIDsInContext_completion___block_invoke(void *a1)
{
  objc_msgSend(MEMORY[0x1E4F832A0], "ic_objectIDsMatchingPredicate:context:", a1[4], a1[5]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)fetchMissingOrOutdatedOCRSummaryAttachmentIDsInContext:(id)a3 completion:(id)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(media != nil)"];
  uint64_t v8 = [MEMORY[0x1E4F832A0] predicateForPasswordProtected:0];
  uint64_t v9 = [MEMORY[0x1E4F832A0] notDeletedPredicate];
  v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(ocrSummary == nil)"];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(ocrSummaryVersion < %d)", (__int16)*MEMORY[0x1E4F82FF0]);
  v11 = (void *)MEMORY[0x1E4F28BA0];
  v26[0] = v20;
  v26[1] = v10;
  dispatch_queue_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v13 = [v11 orPredicateWithSubpredicates:v12];

  v14 = (void *)MEMORY[0x1E4F28BA0];
  v25[0] = v7;
  v25[1] = v13;
  v25[2] = v8;
  v25[3] = v9;
  dispatch_queue_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
  v16 = [v14 andPredicateWithSubpredicates:v15];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __98__ICAttachmentPreviewGenerator_fetchMissingOrOutdatedOCRSummaryAttachmentIDsInContext_completion___block_invoke;
  v21[3] = &unk_1E5FDBB10;
  id v22 = v16;
  id v23 = v5;
  id v24 = v6;
  id v17 = v6;
  id v18 = v5;
  id v19 = v16;
  [v18 performBlock:v21];
}

void __98__ICAttachmentPreviewGenerator_fetchMissingOrOutdatedOCRSummaryAttachmentIDsInContext_completion___block_invoke(void *a1)
{
  objc_msgSend(MEMORY[0x1E4F832A0], "ic_objectIDsMatchingPredicate:context:", a1[4], a1[5]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)fetchMissingOrOutdatedMetaDataAttachmentIDsInContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__ICAttachmentPreviewGenerator_fetchMissingOrOutdatedMetaDataAttachmentIDsInContext_completion___block_invoke;
  v10[3] = &unk_1E5FDBB60;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(ICAttachmentPreviewGenerator *)self fetchMissingOrOutdatedOCRSummaryAttachmentIDsInContext:v9 completion:v10];
}

void __96__ICAttachmentPreviewGenerator_fetchMissingOrOutdatedMetaDataAttachmentIDsInContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __96__ICAttachmentPreviewGenerator_fetchMissingOrOutdatedMetaDataAttachmentIDsInContext_completion___block_invoke_2;
  v7[3] = &unk_1E5FDBB38;
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v6 = v3;
  [v4 fetchMissingOrOutdatedImageClassificationSummaryAttachmentIDsInContext:v5 completion:v7];
}

void __96__ICAttachmentPreviewGenerator_fetchMissingOrOutdatedMetaDataAttachmentIDsInContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v7 = [v3 setWithArray:v4];
  [v7 addObjectsFromArray:v5];

  id v6 = [v7 allObjects];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)generateMissingOrOutdatedAttachmentMetaDataIfNeededInContext:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __93__ICAttachmentPreviewGenerator_generateMissingOrOutdatedAttachmentMetaDataIfNeededInContext___block_invoke;
  v6[3] = &unk_1E5FDBBB0;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(ICAttachmentPreviewGenerator *)self fetchMissingOrOutdatedMetaDataAttachmentIDsInContext:v5 completion:v6];
}

void __93__ICAttachmentPreviewGenerator_generateMissingOrOutdatedAttachmentMetaDataIfNeededInContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __93__ICAttachmentPreviewGenerator_generateMissingOrOutdatedAttachmentMetaDataIfNeededInContext___block_invoke_2;
  void v8[3] = &unk_1E5FD8FE8;
  id v9 = v3;
  id v4 = *(void **)(a1 + 32);
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = v3;
  [v4 performBlock:v8];
}

void __93__ICAttachmentPreviewGenerator_generateMissingOrOutdatedAttachmentMetaDataIfNeededInContext___block_invoke_2(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __93__ICAttachmentPreviewGenerator_generateMissingOrOutdatedAttachmentMetaDataIfNeededInContext___block_invoke_3;
  v5[3] = &unk_1E5FDBB88;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateObjectsUsingBlock:v5];
}

void __93__ICAttachmentPreviewGenerator_generateMissingOrOutdatedAttachmentMetaDataIfNeededInContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = (void *)MEMORY[0x1B3E9ED80]();
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F832A0], "ic_existingObjectWithID:context:", v5, *(void *)(a1 + 32));
  if ((([(id)objc_opt_class() imageOCRGenerationEnabled] & 1) != 0
     || [(id)objc_opt_class() imageClassificationEnabled])
    && [v4 attachmentType] == 3)
  {
    [*(id *)(a1 + 40) postProcessIfNeededForAttachment:v4];
  }
}

- (void)generatePreviewIfNeededForAttachment:(id)a3
{
  id v4 = a3;
  if ([(ICAttachmentPreviewGenerator *)self isPreviewGenerationSupported])
  {
    id v5 = objc_msgSend(v4, "ic_permanentObjectID");
    id v6 = [(ICAttachmentPreviewGenerator *)self previewQueue];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    id v10 = __69__ICAttachmentPreviewGenerator_generatePreviewIfNeededForAttachment___block_invoke;
    uint64_t v11 = &unk_1E5FD91D0;
    id v12 = self;
    id v13 = v5;
    id v7 = v5;
    dispatch_async(v6, &v8);

    [(ICAttachmentPreviewGenerator *)self generatePendingPreviews];
    [(ICAttachmentPreviewGenerator *)self postProcessIfNeededForAttachment:v4];
  }
}

void __69__ICAttachmentPreviewGenerator_generatePreviewIfNeededForAttachment___block_invoke(uint64_t a1)
{
  if ((unint64_t)[*(id *)(a1 + 32) previewGenerationState] <= 1)
  {
    [*(id *)(a1 + 32) setPreviewGenerationState:1];
    id v2 = [*(id *)(a1 + 32) attachmentIDsPending];
    [v2 addObject:*(void *)(a1 + 40)];
  }
}

- (void)generatePreviewIfNeededForAttachmentWithObjectID:(id)a3
{
  id v5 = a3;
  if ([(ICAttachmentPreviewGenerator *)self isPreviewGenerationSupported])
  {
    if ([v5 isTemporaryID])
    {
      id v6 = (void *)MEMORY[0x1E4F836F8];
      id v7 = NSStringFromSelector(a2);
      [v6 handleFailedAssertWithCondition:"!attachmentObjectID.isTemporaryID", "-[ICAttachmentPreviewGenerator generatePreviewIfNeededForAttachmentWithObjectID:]", 1, 0, @"Can't send a temporary ID to %@", v7 functionName simulateCrash showAlert format];
    }
    uint64_t v8 = [(ICAttachmentPreviewGenerator *)self previewQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__ICAttachmentPreviewGenerator_generatePreviewIfNeededForAttachmentWithObjectID___block_invoke;
    block[3] = &unk_1E5FD91D0;
    block[4] = self;
    id v10 = v5;
    dispatch_async(v8, block);

    [(ICAttachmentPreviewGenerator *)self generatePendingPreviews];
  }
}

void __81__ICAttachmentPreviewGenerator_generatePreviewIfNeededForAttachmentWithObjectID___block_invoke(uint64_t a1)
{
  if ((unint64_t)[*(id *)(a1 + 32) previewGenerationState] <= 1)
  {
    [*(id *)(a1 + 32) setPreviewGenerationState:1];
    id v2 = [*(id *)(a1 + 32) attachmentIDsPending];
    [v2 addObject:*(void *)(a1 + 40)];
  }
}

- (void)attachmentNeedsPostProcessingNotification:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F832A0];
  id v5 = [a3 object];
  id v6 = [MEMORY[0x1E4F83428] sharedContext];
  id v7 = [v6 managedObjectContext];
  objc_msgSend(v4, "ic_existingObjectWithID:context:", v5, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = v9;
  if (v9)
  {
    [(ICAttachmentPreviewGenerator *)self postProcessIfNeededForAttachment:v9];
    uint64_t v8 = v9;
  }
}

- (void)postProcessIfNeededForAttachment:(id)a3
{
  id v4 = a3;
  if (([(id)objc_opt_class() docCamOCRGenerationEnabled] & 1) != 0
    || ([(id)objc_opt_class() imageOCRGenerationEnabled] & 1) != 0
    || [(id)objc_opt_class() imageClassificationEnabled])
  {
    id v5 = [v4 attachmentModel];
    int v6 = [v5 needToPostProcessAttachment];

    if (v6)
    {
      id v7 = [(ICAttachmentPreviewGenerator *)self postProcessingQueue];
      [v7 cancelOperationsForAttachment:v4];

      [v4 identifier];
      uint64_t v8 = [(ICAttachmentPreviewGenerator *)self previewQueue];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __65__ICAttachmentPreviewGenerator_postProcessIfNeededForAttachment___block_invoke;
      v9[3] = &unk_1E5FD91D0;
      v9[4] = self;
      id v10 = v4;
      dispatch_async(v8, v9);
    }
  }
}

uint64_t __65__ICAttachmentPreviewGenerator_postProcessIfNeededForAttachment___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) postProcessingIDsPending];
  id v3 = [*(id *)(a1 + 40) objectID];
  [v2 addObject:v3];

  id v4 = *(void **)(a1 + 32);
  return [v4 beginPostProcessingAfterDelayIfNecessaryWithForceDelay:1];
}

- (void)beginPostProcessingAfterDelayIfNecessaryWithForceDelay:(BOOL)a3
{
  if (([(id)objc_opt_class() docCamOCRGenerationEnabled] & 1) != 0
    || ([(id)objc_opt_class() imageOCRGenerationEnabled] & 1) != 0
    || [(id)objc_opt_class() imageClassificationEnabled])
  {
    id v5 = [(ICAttachmentPreviewGenerator *)self previewQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __87__ICAttachmentPreviewGenerator_beginPostProcessingAfterDelayIfNecessaryWithForceDelay___block_invoke;
    v6[3] = &unk_1E5FDBBD8;
    void v6[4] = self;
    BOOL v7 = a3;
    dispatch_async(v5, v6);
  }
}

void __87__ICAttachmentPreviewGenerator_beginPostProcessingAfterDelayIfNecessaryWithForceDelay___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) postProcessingIDsPending];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    if (*(unsigned char *)(a1 + 40) || ![*(id *)(a1 + 32) previewOperationsIdle])
    {
      id v5 = *(void **)(a1 + 32);
      uint64_t v6 = [v5 postProcessingRequestIndex] + 1;
      [v5 setPostProcessingRequestIndex:v6];
      dispatch_time_t v7 = dispatch_time(0, 2000000000);
      uint64_t v8 = [*(id *)(a1 + 32) previewQueue];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __87__ICAttachmentPreviewGenerator_beginPostProcessingAfterDelayIfNecessaryWithForceDelay___block_invoke_2;
      v9[3] = &unk_1E5FD9B40;
      v9[4] = *(void *)(a1 + 32);
      void v9[5] = v6;
      dispatch_after(v7, v8, v9);
    }
    else
    {
      id v4 = *(void **)(a1 + 32);
      [v4 postProcessPendingPreviews];
    }
  }
}

void __87__ICAttachmentPreviewGenerator_beginPostProcessingAfterDelayIfNecessaryWithForceDelay___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) postProcessingRequestIndex] == *(void *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) postProcessingIDsPending];
    uint64_t v3 = [v2 count];

    if (v3)
    {
      if ([*(id *)(a1 + 32) previewOperationsIdle])
      {
        id v4 = *(void **)(a1 + 32);
        [v4 postProcessPendingPreviews];
      }
    }
  }
}

- (void)postProcessPendingPreviews
{
  if (([(id)objc_opt_class() docCamOCRGenerationEnabled] & 1) != 0
    || ([(id)objc_opt_class() imageOCRGenerationEnabled] & 1) != 0
    || [(id)objc_opt_class() imageClassificationEnabled])
  {
    uint64_t v3 = [(ICAttachmentPreviewGenerator *)self previewQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__ICAttachmentPreviewGenerator_postProcessPendingPreviews__block_invoke;
    block[3] = &unk_1E5FD8DF0;
    block[4] = self;
    dispatch_async(v3, block);
  }
}

void __58__ICAttachmentPreviewGenerator_postProcessPendingPreviews__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) previewOperationsIdle])
  {
    id v2 = [*(id *)(a1 + 32) postProcessingIDsPending];
    uint64_t v3 = [v2 firstObject];

    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) postProcessingIDsPending];
      [v4 removeObject:v3];

      id v5 = [MEMORY[0x1E4F83428] sharedContext];
      uint64_t v6 = [v5 workerManagedObjectContext];

      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __58__ICAttachmentPreviewGenerator_postProcessPendingPreviews__block_invoke_2;
      void v8[3] = &unk_1E5FD8FE8;
      id v9 = v3;
      id v10 = v6;
      uint64_t v11 = *(void *)(a1 + 32);
      id v7 = v6;
      [v7 performBlockAndWait:v8];
    }
  }
}

void __58__ICAttachmentPreviewGenerator_postProcessPendingPreviews__block_invoke_2(uint64_t a1)
{
  id v2 = (uint64_t *)(a1 + 32);
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F832A0], "ic_existingObjectWithID:context:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 attachmentModel];
    int v6 = [v5 needToPostProcessAttachment];

    if (v6)
    {
      [*(id *)(a1 + 48) postProcessPreviewForAttachment:v4];
    }
    else
    {
      [v4 identifier];
    }
  }
  else
  {
    id v7 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __58__ICAttachmentPreviewGenerator_postProcessPendingPreviews__block_invoke_2_cold_1(v2, v7);
    }
  }
}

- (void)postProcessPreviewForAttachment:(id)a3
{
  id v18 = a3;
  [(ICAttachmentPreviewGenerator *)self adjustUserTitleIfNecessaryForAttachment:v18];
  id v4 = [v18 attachmentModel];
  int v5 = [v4 needToPostProcessAttachment];

  if (!v5) {
    goto LABEL_13;
  }
  id v7 = [v18 attachmentModel];
  if (![(ICAttachmentPreviewGeneratorOCROperation *)v7 supportsOCR]) {
    goto LABEL_9;
  }
  if ([(id)objc_opt_class() docCamOCRGenerationEnabled]
    && ([v18 isChildOfDocumentGallery] & 1) != 0)
  {

    goto LABEL_8;
  }
  if (![(id)objc_opt_class() imageOCRGenerationEnabled])
  {
LABEL_9:

    goto LABEL_10;
  }
  char v8 = [v18 isImage];

  if (v8)
  {
LABEL_8:
    id v9 = [ICAttachmentPreviewGeneratorOCROperation alloc];
    id v10 = [v18 objectID];
    id v7 = [(ICAttachmentPreviewGeneratorOperation *)v9 initWithAttachmentManagedObjectID:v10];

    uint64_t v11 = [(ICAttachmentPreviewGenerator *)self postProcessingQueue];
    [v11 addOperation:v7];

    goto LABEL_9;
  }
LABEL_10:
  uint64_t v6 = [(id)objc_opt_class() imageClassificationEnabled];
  if (v6)
  {
    id v12 = [v18 attachmentModel];
    int v13 = [v12 supportsImageClassification];

    if (v13)
    {
      v14 = [ICAttachmentPreviewGeneratorImageClassificationOperation alloc];
      dispatch_queue_t v15 = [v18 objectID];
      v16 = [(ICAttachmentPreviewGeneratorOperation *)v14 initWithAttachmentManagedObjectID:v15];

      id v17 = [(ICAttachmentPreviewGenerator *)self postProcessingQueue];
      [v17 addOperation:v16];
    }
  }
LABEL_13:
  MEMORY[0x1F41817F8](v6);
}

- (void)adjustUserTitleIfNecessaryForAttachment:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 parentAttachment];
  int v5 = [v4 title];
  uint64_t v6 = [v4 defaultTitle];
  char v7 = [v5 isEqualToString:v6];

  if ([v3 isChildOfDocumentGallery])
  {
    if ((v7 & 1) == 0)
    {
      char v8 = [v4 userTitle];

      if (!v8)
      {
        id v9 = [v3 parentAttachment];
        id v10 = [v9 attachmentModel];

        objc_opt_class();
        uint64_t v11 = ICDynamicCast();
        uint64_t v21 = 0;
        id v22 = &v21;
        uint64_t v23 = 0x2020000000;
        char v24 = 0;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __72__ICAttachmentPreviewGenerator_adjustUserTitleIfNecessaryForAttachment___block_invoke;
        v20[3] = &unk_1E5FDBC00;
        v20[4] = &v21;
        [v11 enumerateSubAttachmentsWithBlock:v20];
        if (!*((unsigned char *)v22 + 24))
        {
          id v12 = os_log_create("com.apple.notes", "PreviewGeneration");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            int v13 = [v4 identifier];
            [(ICAttachmentPreviewGenerator *)v13 adjustUserTitleIfNecessaryForAttachment:v12];
          }

          v14 = [v4 title];
          [v4 setUserTitle:v14];

          dispatch_queue_t v15 = [v4 note];
          int v16 = [v15 regenerateTitle:1 snippet:1];

          if (v16)
          {
            id v17 = [v4 note];
            [v17 markShareDirtyIfNeededWithReason:@"Regenerated title from attachment OCR"];

            id v18 = [v4 note];
            [v18 updateChangeCountWithReason:@"Regenerated title from attachment OCR"];
          }
          id v19 = [v4 managedObjectContext];
          objc_msgSend(v19, "ic_save");
        }
        _Block_object_dispose(&v21, 8);
      }
    }
  }
}

void __72__ICAttachmentPreviewGenerator_adjustUserTitleIfNecessaryForAttachment___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  char v7 = [a2 ocrSummary];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
}

- (void)attachmentNeedsPreviewGenerationNotification:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F83428] sharedContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__ICAttachmentPreviewGenerator_attachmentNeedsPreviewGenerationNotification___block_invoke;
  v7[3] = &unk_1E5FD9270;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 performBackgroundTask:v7];
}

void __77__ICAttachmentPreviewGenerator_attachmentNeedsPreviewGenerationNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F832A0];
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 object];
  objc_msgSend(v3, "ic_existingObjectWithID:context:", v6, v5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  char v7 = v8;
  if (v8)
  {
    [*(id *)(a1 + 40) generatePreviewIfNeededForAttachment:v8];
    char v7 = v8;
  }
}

- (void)attachmentWillBeDeleted:(id)a3
{
  id v8 = [a3 object];
  id v4 = [(ICAttachmentPreviewGenerator *)self generatorQueue];
  [v4 cancelOperationsForAttachment:v8];

  id v5 = [(ICAttachmentPreviewGenerator *)self asyncGeneratorQueue];
  [v5 cancelOperationsForAttachment:v8];

  id v6 = [(ICAttachmentPreviewGenerator *)self costlyGeneratorQueue];
  [v6 cancelOperationsForAttachment:v8];

  char v7 = [(ICAttachmentPreviewGenerator *)self postProcessingQueue];
  [v7 cancelOperationsForAttachment:v8];
}

- (void)mediaDidLoad:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F83408];
  id v5 = [a3 object];
  id v6 = [MEMORY[0x1E4F83428] sharedContext];
  char v7 = [v6 managedObjectContext];
  objc_msgSend(v4, "ic_existingObjectWithID:context:", v5, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = [v9 attachment];
  if (v8) {
    [(ICAttachmentPreviewGenerator *)self generatePreviewIfNeededForAttachment:v8];
  }
}

- (void)reachabilityChanged:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F837B0], "sharedReachabilityForInternetConnection", a3);

  if (v4)
  {
    int v5 = 1;
    atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_shouldGenerateAttachmentsWhenReachable, (unsigned __int8 *)&v5, 0);
    if (v5 == 1)
    {
      [(ICAttachmentPreviewGenerator *)self generatePreviewsIfNeeded];
    }
  }
}

- (void)cancelGenerationOfPendingPreviews
{
  id v3 = [(ICAttachmentPreviewGenerator *)self generatorQueue];
  [v3 cancelAllOperations];

  id v4 = [(ICAttachmentPreviewGenerator *)self asyncGeneratorQueue];
  [v4 cancelAllOperations];

  int v5 = [(ICAttachmentPreviewGenerator *)self costlyGeneratorQueue];
  [v5 cancelAllOperations];

  id v6 = [(ICAttachmentPreviewGenerator *)self postProcessingQueue];
  [v6 cancelAllOperations];
}

- (void)didReceiveMemoryWarning
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "ICAttachmentPreviewGenerator received a memory warning. Canceling OCR operations", v1, 2u);
}

- (void)enableAutomaticPreviewGeneration
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_attachmentDidLoad_ name:*MEMORY[0x1E4F83010] object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel_attachmentNeedsPreviewGenerationNotification_ name:*MEMORY[0x1E4F83030] object:0];

  int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel_attachmentWillBeDeleted_ name:*MEMORY[0x1E4F830A8] object:0];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel_mediaDidLoad_ name:*MEMORY[0x1E4F830F8] object:0];

  char v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v8 = *MEMORY[0x1E4F1BE20];
  id v9 = [MEMORY[0x1E4F83428] sharedContext];
  id v10 = [v9 managedObjectContext];
  [v7 addObserver:self selector:sel_managedObjectContextDidSave_ name:v8 object:v10];

  id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:self selector:sel_reachabilityChanged_ name:*MEMORY[0x1E4F838C0] object:0];
}

- (void)disableAutomaticPreviewGeneration
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];
}

- (void)suspend
{
  id v3 = [(ICAttachmentPreviewGenerator *)self previewQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__ICAttachmentPreviewGenerator_suspend__block_invoke;
  block[3] = &unk_1E5FD8DF0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __39__ICAttachmentPreviewGenerator_suspend__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) generatorQueue];
  [v2 suspend];

  id v3 = [*(id *)(a1 + 32) asyncGeneratorQueue];
  [v3 suspend];

  id v4 = [*(id *)(a1 + 32) costlyGeneratorQueue];
  [v4 suspend];

  id v5 = [*(id *)(a1 + 32) postProcessingQueue];
  [v5 suspend];
}

- (void)resume
{
  id v3 = [(ICAttachmentPreviewGenerator *)self previewQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__ICAttachmentPreviewGenerator_resume__block_invoke;
  block[3] = &unk_1E5FD8DF0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __38__ICAttachmentPreviewGenerator_resume__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) generatorQueue];
  [v2 resume];

  id v3 = [*(id *)(a1 + 32) asyncGeneratorQueue];
  [v3 resume];

  id v4 = [*(id *)(a1 + 32) costlyGeneratorQueue];
  [v4 resume];

  id v5 = [*(id *)(a1 + 32) postProcessingQueue];
  [v5 resume];

  id v6 = *(void **)(a1 + 32);
  return [v6 beginPostProcessingAfterDelayIfNecessaryWithForceDelay:0];
}

- (void)operationComplete:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAttachmentPreviewGenerator *)self previewQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__ICAttachmentPreviewGenerator_operationComplete___block_invoke;
  v7[3] = &unk_1E5FD91D0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__ICAttachmentPreviewGenerator_operationComplete___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) lastOperationForAttachmentID];
  id v3 = [*(id *)(a1 + 40) attachmentID];
  id v9 = [v2 objectForKey:v3];

  id v4 = *(id *)(a1 + 40);
  if (v9 == v4)
  {
    id v5 = [*(id *)(a1 + 32) lastOperationForAttachmentID];
    id v6 = [*(id *)(a1 + 40) attachmentID];
    [v5 removeObjectForKey:v6];

    id v4 = *(id *)(a1 + 40);
  }
  char v7 = *(void **)(a1 + 32);
  BOOL v8 = [v4 type] != 2 && objc_msgSend(*(id *)(a1 + 40), "type") != 3;
  [v7 beginPostProcessingAfterDelayIfNecessaryWithForceDelay:v8];
}

- (void)setProgress:(id)a3 forObjectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(ICAttachmentPreviewGenerator *)self previewProgressQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ICAttachmentPreviewGenerator_setProgress_forObjectID___block_invoke;
  block[3] = &unk_1E5FD8FE8;
  id v12 = v6;
  int v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __56__ICAttachmentPreviewGenerator_setProgress_forObjectID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) attachmentIDsProgress];
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = v3;
  if (v2) {
    [v3 setObject:v2 forKeyedSubscript:v4];
  }
  else {
    [v3 removeObjectForKey:v4];
  }
}

- (id)progressForObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  dispatch_queue_t v15 = __Block_byref_object_copy__41;
  int v16 = __Block_byref_object_dispose__41;
  id v17 = 0;
  id v5 = [(ICAttachmentPreviewGenerator *)self previewProgressQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__ICAttachmentPreviewGenerator_progressForObjectID___block_invoke;
  block[3] = &unk_1E5FD9870;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __52__ICAttachmentPreviewGenerator_progressForObjectID___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) attachmentIDsProgress];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)generatePendingPreviews
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "Skipping generation of pending previews because we're running inside of an extension (iPhone System Paper).", v1, 2u);
}

void __55__ICAttachmentPreviewGenerator_generatePendingPreviews__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) previewGenerationState])
  {
    if ([*(id *)(a1 + 32) previewGenerationState] == 1)
    {
      uint64_t v2 = [*(id *)(a1 + 32) attachmentIDsPending];
      uint64_t v3 = (void *)[v2 copy];
    }
    else
    {
      uint64_t v3 = 0;
    }
    [*(id *)(a1 + 32) setPreviewGenerationState:0];
    id v4 = [*(id *)(a1 + 32) attachmentIDsPending];
    [v4 removeAllObjects];

    id v5 = [MEMORY[0x1E4F83428] sharedContext];
    id v6 = [v5 workerManagedObjectContext];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__ICAttachmentPreviewGenerator_generatePendingPreviews__block_invoke_2;
    v9[3] = &unk_1E5FD8FE8;
    id v10 = v3;
    id v11 = v6;
    uint64_t v12 = *(void *)(a1 + 32);
    id v7 = v6;
    id v8 = v3;
    [v7 performBlockAndWait:v9];
  }
}

void __55__ICAttachmentPreviewGenerator_generatePendingPreviews__block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v15;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
          id v9 = (void *)MEMORY[0x1B3E9ED80]();
          id v10 = objc_msgSend(MEMORY[0x1E4F832A0], "ic_existingObjectWithID:context:", v8, *(void *)(a1 + 40));
          if (v10)
          {
            [*(id *)(a1 + 48) generatePendingPreviewForAttachment:v10];
            if (([v10 hasChanges] & 1) == 0) {
              [*(id *)(a1 + 40) refreshObject:v10 mergeChanges:0];
            }
          }
          else
          {
            id v11 = os_log_create("com.apple.notes", "PreviewGeneration");
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v19 = v8;
              _os_log_debug_impl(&dword_1B08EB000, v11, OS_LOG_TYPE_DEBUG, "unable to find attachment for generating preview: %@", buf, 0xCu);
            }
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v5);
    }
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__ICAttachmentPreviewGenerator_generatePendingPreviews__block_invoke_156;
    v13[3] = &unk_1E5FDBC28;
    uint64_t v12 = *(void *)(a1 + 40);
    v13[4] = *(void *)(a1 + 48);
    [MEMORY[0x1E4F832A0] enumerateAttachmentsInContext:v12 batchSize:1 visibleOnly:1 saveAfterBatch:0 usingBlock:v13];
  }
}

uint64_t __55__ICAttachmentPreviewGenerator_generatePendingPreviews__block_invoke_156(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) generatePendingPreviewForAttachment:a2];
}

- (void)generatePendingPreviewForAttachment:(id)a3
{
  id v4 = a3;
  if ([(ICAttachmentPreviewGenerator *)self isPreviewGenerationSupported])
  {
    uint64_t v5 = [v4 attachmentModel];
    char v6 = [v5 tooLargeForPreviewGeneration];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = [v4 managedObjectContext];
      uint64_t v8 = [(ICAttachmentPreviewGenerator *)self previewQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__ICAttachmentPreviewGenerator_generatePendingPreviewForAttachment___block_invoke;
      block[3] = &unk_1E5FD8FE8;
      id v11 = v7;
      id v12 = v4;
      int v13 = self;
      id v9 = v7;
      dispatch_async(v8, block);
    }
  }
}

void __68__ICAttachmentPreviewGenerator_generatePendingPreviewForAttachment___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__ICAttachmentPreviewGenerator_generatePendingPreviewForAttachment___block_invoke_2;
  v5[3] = &unk_1E5FD8FE8;
  uint64_t v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  [v2 performBlockAndWait:v5];
}

uint64_t __68__ICAttachmentPreviewGenerator_generatePendingPreviewForAttachment___block_invoke_2(id *a1)
{
  uint64_t v2 = a1 + 4;
  if (([a1[4] isDeleted] & 1) == 0 && (objc_msgSend(*v2, "markedForDeletion") & 1) == 0)
  {
    id v3 = [*v2 attachmentModel];
    if ([v3 hasPreviews])
    {
      uint64_t v4 = [*v2 note];
      int v5 = [v4 isPasswordProtectedAndLocked];

      if (!v5)
      {
        id v6 = [*v2 attachmentModel];
        int v7 = [v6 requiresNetworkToGeneratePreview];

        if (v7
          && ([MEMORY[0x1E4F837B0] sharedReachabilityForInternetConnection],
              uint64_t v8 = objc_claimAutoreleasedReturnValue(),
              uint64_t v9 = [v8 currentReachabilityStatus],
              v8,
              !v9))
        {
          [a1[6] setShouldGenerateAttachmentsWhenReachable:1];
        }
        else
        {
          id v10 = [MEMORY[0x1E4F28B50] mainBundle];
          if ((objc_msgSend(v10, "ic_isAppExtension") & 1) == 0)
          {

LABEL_15:
            long long v16 = [*v2 attachmentModel];
            int v17 = [v16 needToGeneratePreviews];

            if (v17)
            {
              id v18 = [*v2 objectID];
              uint64_t v19 = [*v2 attachmentModel];
              int v20 = [v19 generateAsynchronousPreviews];

              if (v20)
              {
                uint64_t v21 = [a1[6] asyncGeneratorQueue];
              }
              else
              {
                id v22 = [a1[4] attachmentModel];
                int v23 = [v22 generatePreviewsDuringCloudActivity];

                id v24 = a1[6];
                if (v23) {
                  [v24 generatorQueue];
                }
                else {
                uint64_t v21 = [v24 costlyGeneratorQueue];
                }
              }
              v25 = v21;
              [v21 suspend];
              uint64_t v26 = [a1[6] lastOperationForAttachmentID];
              v27 = [v26 objectForKey:v18];

              if (v27
                && ([v27 dependencies],
                    v28 = objc_claimAutoreleasedReturnValue(),
                    uint64_t v29 = [v28 count],
                    v28,
                    v29))
              {
                p_super = os_log_create("com.apple.notes", "PreviewGeneration");
                if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG)) {
                  __68__ICAttachmentPreviewGenerator_generatePendingPreviewForAttachment___block_invoke_2_cold_1(v2, p_super);
                }
              }
              else
              {
                v31 = [[ICAttachmentPreviewGeneratorOperation alloc] initWithAttachmentManagedObjectID:v18];
                p_super = &v31->super.super;
                if (v27) {
                  [(ICAttachmentPreviewGeneratorOperation *)v31 addDependency:v27];
                }
                [v25 addOperation:p_super];
                v32 = [a1[6] lastOperationForAttachmentID];
                [v32 setObject:p_super forKey:v18];
              }
              v33 = [*v2 attachmentModel];
              int v34 = [v33 requiresPostProcessing];

              if (v34) {
                [a1[6] postProcessIfNeededForAttachment:a1[4]];
              }
              [v25 resume];
            }
            return objc_msgSend(a1[5], "ic_refreshObject:mergeChanges:", a1[4], 0);
          }
          id v11 = [*v2 note];
          char v12 = [v11 markedForDeletion];

          if (v12) {
            goto LABEL_15;
          }
        }
      }
    }
    else
    {
    }
  }
  id v14 = a1[4];
  id v13 = a1[5];
  return objc_msgSend(v13, "ic_refreshObject:mergeChanges:", v14, 0);
}

- (void)cancelIfNeededForAttachment:(id)a3
{
  v41[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(ICAttachmentPreviewGenerator *)self suspend];
  uint64_t v26 = v4;
  int v5 = [v4 objectID];
  id v6 = [(ICAttachmentPreviewGenerator *)self asyncGeneratorQueue];
  v41[0] = v6;
  int v7 = [(ICAttachmentPreviewGenerator *)self costlyGeneratorQueue];
  v41[1] = v7;
  uint64_t v8 = [(ICAttachmentPreviewGenerator *)self generatorQueue];
  v41[2] = v8;
  v25 = self;
  uint64_t v9 = [(ICAttachmentPreviewGenerator *)self postProcessingQueue];
  v41[3] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:4];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v10;
  uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v28 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v36 != v28) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v15 = [v14 operations];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v32;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v32 != v18) {
                objc_enumerationMutation(v15);
              }
              int v20 = *(void **)(*((void *)&v31 + 1) + 8 * j);
              uint64_t v21 = [v20 attachmentID];
              int v22 = [v21 isEqual:v5];

              if (v22) {
                [v20 cancel];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v17);
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v12);
  }

  int v23 = [(ICAttachmentPreviewGenerator *)v25 previewQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__ICAttachmentPreviewGenerator_cancelIfNeededForAttachment___block_invoke;
  block[3] = &unk_1E5FD91D0;
  void block[4] = v25;
  id v30 = v5;
  id v24 = v5;
  dispatch_sync(v23, block);

  [(ICAttachmentPreviewGenerator *)v25 resume];
}

void __60__ICAttachmentPreviewGenerator_cancelIfNeededForAttachment___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) attachmentIDsPending];
  [v2 removeObject:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) postProcessingIDsPending];
  [v3 removeObject:*(void *)(a1 + 40)];
}

- (ICAttachmentPreviewGeneratorOperationQueue)asyncGeneratorQueue
{
  return self->_asyncGeneratorQueue;
}

- (void)setAsyncGeneratorQueue:(id)a3
{
}

- (ICAttachmentPreviewGeneratorOperationQueue)costlyGeneratorQueue
{
  return self->_costlyGeneratorQueue;
}

- (void)setCostlyGeneratorQueue:(id)a3
{
}

- (ICAttachmentPreviewGeneratorOperationQueue)generatorQueue
{
  return self->_generatorQueue;
}

- (void)setGeneratorQueue:(id)a3
{
}

- (NSMapTable)lastOperationForAttachmentID
{
  return self->_lastOperationForAttachmentID;
}

- (void)setLastOperationForAttachmentID:(id)a3
{
}

- (NSMutableSet)attachmentIDsPending
{
  return self->_attachmentIDsPending;
}

- (void)setAttachmentIDsPending:(id)a3
{
}

- (NSMutableDictionary)attachmentIDsProgress
{
  return self->_attachmentIDsProgress;
}

- (void)setAttachmentIDsProgress:(id)a3
{
}

- (ICProgressIndicatorTracking)progressTracker
{
  return self->_progressTracker;
}

- (void)setProgressTracker:(id)a3
{
}

- (ICAttachmentPreviewGeneratorOperationQueue)postProcessingQueue
{
  return self->_postProcessingQueue;
}

- (void)setPostProcessingQueue:(id)a3
{
}

- (NSMutableOrderedSet)postProcessingIDsPending
{
  return self->_postProcessingIDsPending;
}

- (void)setPostProcessingIDsPending:(id)a3
{
}

- (unint64_t)postProcessingRequestIndex
{
  return self->_postProcessingRequestIndex;
}

- (void)setPostProcessingRequestIndex:(unint64_t)a3
{
  self->_postProcessingRequestIndex = a3;
}

- (unint64_t)previewGenerationState
{
  return self->_previewGenerationState;
}

- (void)setPreviewGenerationState:(unint64_t)a3
{
  self->_previewGenerationState = a3;
}

- (OS_dispatch_queue)previewQueue
{
  return self->_previewQueue;
}

- (void)setPreviewQueue:(id)a3
{
}

- (OS_dispatch_queue)previewProgressQueue
{
  return self->_previewProgressQueue;
}

- (void)setPreviewProgressQueue:(id)a3
{
}

- (BOOL)shouldGenerateAttachmentsWhenReachable
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_shouldGenerateAttachmentsWhenReachable);
  return v2 & 1;
}

- (void)setShouldGenerateAttachmentsWhenReachable:(BOOL)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewProgressQueue, 0);
  objc_storeStrong((id *)&self->_previewQueue, 0);
  objc_storeStrong((id *)&self->_postProcessingIDsPending, 0);
  objc_storeStrong((id *)&self->_postProcessingQueue, 0);
  objc_storeStrong((id *)&self->_progressTracker, 0);
  objc_storeStrong((id *)&self->_attachmentIDsProgress, 0);
  objc_storeStrong((id *)&self->_attachmentIDsPending, 0);
  objc_storeStrong((id *)&self->_lastOperationForAttachmentID, 0);
  objc_storeStrong((id *)&self->_generatorQueue, 0);
  objc_storeStrong((id *)&self->_costlyGeneratorQueue, 0);
  objc_storeStrong((id *)&self->_asyncGeneratorQueue, 0);
}

void __58__ICAttachmentPreviewGenerator_postProcessPendingPreviews__block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_DEBUG, "unable to find attachment for post processing: %@", (uint8_t *)&v3, 0xCu);
}

- (void)adjustUserTitleIfNecessaryForAttachment:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "Clearing OCR generated user title from gallery attachment %@", buf, 0xCu);
}

void __68__ICAttachmentPreviewGenerator_generatePendingPreviewForAttachment___block_invoke_2_cold_1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = [*a1 shortLoggingDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_DEBUG, "Existing preview generation operations existed, not adding more for %@", (uint8_t *)&v4, 0xCu);
}

@end