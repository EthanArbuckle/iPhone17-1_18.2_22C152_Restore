@interface ICAttachmentPaperBundleModel
+ (BOOL)canDisplayPaperAtURL:(id)a3;
+ (id)generateFallbackPDFDataForAttachment:(id)a3;
+ (id)paperBundleURLForAttachmentIdentifier:(id)a3 inAccount:(id)a4;
+ (int64_t)baseNotesVersion;
- (BOOL)hasPreviews;
- (BOOL)paperHasEnhancedCanvas;
- (BOOL)paperHasMath;
- (BOOL)paperHasNewInks2022;
- (BOOL)paperHasNewInks2023;
- (BOOL)paperHasNewInksSpring2024;
- (BOOL)providesStandaloneTitleForNote;
- (BOOL)restorePaperBundleFromArchiveURL:(id)a3 error:(id *)a4;
- (BOOL)showThumbnailInNoteList;
- (ICAccount)account;
- (NSURL)paperBundleAssetsSubdirectoryURL;
- (NSURL)paperBundleDatabaseSubdirectoryURL;
- (NSURL)paperBundleURL;
- (NSURL)paperCoherenceContextURL;
- (id)archivePaperBundleToDiskWithError:(id *)a3;
- (id)standaloneTitleForNote;
- (void)removeStrokesFromStyleInventory;
- (void)setPaperHasEnhancedCanvas:(BOOL)a3;
- (void)setPaperHasMath:(BOOL)a3;
- (void)setPaperHasNewInks2022:(BOOL)a3;
- (void)setPaperHasNewInks2023:(BOOL)a3;
- (void)setPaperHasNewInksSpring2024:(BOOL)a3;
- (void)updateMinimumSupportedVersionIfNeededWithCompletionHandler:(id)a3;
@end

@implementation ICAttachmentPaperBundleModel

+ (BOOL)canDisplayPaperAtURL:(id)a3
{
  return a3
      && +[ICAttachmentSystemPaperModelHelper canDisplayPaperAtURL:](_TtC11NotesShared34ICAttachmentSystemPaperModelHelper, "canDisplayPaperAtURL:");
}

- (BOOL)hasPreviews
{
  return 1;
}

- (BOOL)showThumbnailInNoteList
{
  if (![(ICAttachmentModel *)self hasThumbnailImage]) {
    return 0;
  }
  v3 = [(ICAttachmentModel *)self attachment];
  v4 = [v3 previewImages];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (NSURL)paperCoherenceContextURL
{
  v2 = [(ICAttachmentModel *)self attachment];
  v3 = [v2 paperCoherenceContextURL];

  return (NSURL *)v3;
}

- (NSURL)paperBundleURL
{
  v2 = [(ICAttachmentModel *)self attachment];
  v3 = [v2 paperBundleURL];

  return (NSURL *)v3;
}

+ (id)paperBundleURLForAttachmentIdentifier:(id)a3 inAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 length];
  if (v6 && v7)
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__43;
    v25 = __Block_byref_object_dispose__43;
    id v26 = 0;
    v8 = [v6 managedObjectContext];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __80__ICAttachmentPaperBundleModel_paperBundleURLForAttachmentIdentifier_inAccount___block_invoke;
    v17[3] = &unk_1E64A5958;
    id v18 = v6;
    id v19 = v5;
    v20 = &v21;
    [v8 performBlockAndWait:v17];

    id v9 = (id)v22[5];
    _Block_object_dispose(&v21, 8);

    goto LABEL_7;
  }
  if (![v5 length])
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"identifier.length" functionName:"+[ICAttachmentPaperBundleModel paperBundleURLForAttachmentIdentifier:inAccount:]" simulateCrash:1 showAlert:1 format:@"PaperKit attachment identifier is empty"];
    if (v6) {
      goto LABEL_6;
    }
LABEL_11:
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"account" functionName:"+[ICAttachmentPaperBundleModel paperBundleURLForAttachmentIdentifier:inAccount:]" simulateCrash:1 showAlert:1 format:@"PaperKit attachment account is nil"];
    goto LABEL_6;
  }
  if (!v6) {
    goto LABEL_11;
  }
LABEL_6:
  v10 = (void *)MEMORY[0x1E4F1CB10];
  v11 = NSTemporaryDirectory();
  v12 = [v10 fileURLWithPath:v11];
  v13 = [MEMORY[0x1E4F29128] UUID];
  v14 = [v13 UUIDString];
  v15 = [v12 URLByAppendingPathComponent:v14 isDirectory:0];
  id v9 = [v15 URLByAppendingPathExtension:@"bundle"];

LABEL_7:
  return v9;
}

void __80__ICAttachmentPaperBundleModel_paperBundleURLForAttachmentIdentifier_inAccount___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) systemPaperBundlesDirectoryURL];
  v3 = [v2 URLByAppendingPathComponent:*(void *)(a1 + 40) isDirectory:1];
  uint64_t v4 = [v3 URLByAppendingPathExtension:@"bundle"];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v5 = a1 + 48;
  uint64_t v7 = *(void *)(v6 + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v4;

  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  v10 = [v3 path];
  if (([v9 fileExistsAtPath:v10] & 1) == 0)
  {
LABEL_9:

    goto LABEL_10;
  }
  v11 = [*(id *)(*(void *)(*(void *)v5 + 8) + 40) path];
  char v12 = [v9 fileExistsAtPath:v11];

  if ((v12 & 1) == 0)
  {
    v13 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __80__ICAttachmentPaperBundleModel_paperBundleURLForAttachmentIdentifier_inAccount___block_invoke_cold_2();
    }

    v10 = +[ICFileUtilities coordinateMoveItemAt:v3 to:*(void *)(*(void *)(*(void *)v5 + 8) + 40)];
    if (v10)
    {
      v14 = os_log_create("com.apple.notes", "SystemPaper");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __80__ICAttachmentPaperBundleModel_paperBundleURLForAttachmentIdentifier_inAccount___block_invoke_cold_1();
      }
    }
    goto LABEL_9;
  }
LABEL_10:
}

- (NSURL)paperBundleDatabaseSubdirectoryURL
{
  v2 = [(ICAttachmentPaperBundleModel *)self paperBundleURL];
  v3 = +[ICSystemPaperDocument databaseDirectoryAt:v2];

  return (NSURL *)v3;
}

- (NSURL)paperBundleAssetsSubdirectoryURL
{
  v2 = [(ICAttachmentPaperBundleModel *)self paperBundleURL];
  v3 = +[ICSystemPaperDocument assetsDirectoryAt:v2];

  return (NSURL *)v3;
}

- (id)archivePaperBundleToDiskWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(ICAttachmentModel *)self attachment];
  uint64_t v6 = [v5 cloudAccount];
  uint64_t v7 = [v6 systemPaperTemporaryDirectoryURL];

  v8 = [MEMORY[0x1E4F29128] UUID];
  id v9 = [v8 UUIDString];
  v10 = [v7 URLByAppendingPathComponent:v9 isDirectory:0];
  v11 = [(id)*MEMORY[0x1E4F44558] preferredFilenameExtension];
  char v12 = [v10 URLByAppendingPathExtension:v11];

  v13 = [_TtC11NotesShared21ICSystemPaperDocument alloc];
  v14 = [(ICAttachmentModel *)self attachment];
  v15 = [(ICSystemPaperDocument *)v13 initWithPaperAttachment:v14];

  id v23 = 0;
  [(ICSystemPaperDocument *)v15 copyAndArchivePaperBundleTo:v12 error:&v23];
  id v16 = v23;
  v17 = v16;
  if (v16)
  {
    if (a3) {
      *a3 = v16;
    }
    id v18 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = [(ICAttachmentModel *)self attachment];
      v22 = objc_msgSend(v21, "ic_loggingIdentifier");
      *(_DWORD *)buf = 138412802;
      v25 = v22;
      __int16 v26 = 2112;
      v27 = v12;
      __int16 v28 = 2112;
      v29 = v17;
      _os_log_error_impl(&dword_1C3A61000, v18, OS_LOG_TYPE_ERROR, "Failed to archive paper (%@) bundle to (%@): %@", buf, 0x20u);
    }
    id v19 = 0;
  }
  else
  {
    id v19 = v12;
  }

  return v19;
}

- (BOOL)restorePaperBundleFromArchiveURL:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [_TtC11NotesShared21ICSystemPaperDocument alloc];
  v8 = [(ICAttachmentModel *)self attachment];
  id v9 = [(ICSystemPaperDocument *)v7 initWithPaperAttachment:v8];

  id v16 = 0;
  [(ICSystemPaperDocument *)v9 restorePaperBundleFrom:v6 error:&v16];
  id v10 = v16;
  v11 = v10;
  if (v10)
  {
    if (a4) {
      *a4 = v10;
    }
    char v12 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = [(ICAttachmentModel *)self attachment];
      v15 = objc_msgSend(v14, "ic_loggingIdentifier");
      *(_DWORD *)buf = 138412802;
      id v18 = v15;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      v22 = v11;
      _os_log_error_impl(&dword_1C3A61000, v12, OS_LOG_TYPE_ERROR, "Failed to restore paper (%@) bundle archive (%@): %@", buf, 0x20u);
    }
  }

  return v11 == 0;
}

- (BOOL)paperHasEnhancedCanvas
{
  v2 = [(ICAttachmentModel *)self attachment];
  v3 = [v2 metadata];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"hasEnhancedCanvasKey"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setPaperHasEnhancedCanvas:(BOOL)a3
{
  uint64_t v4 = [(ICAttachmentModel *)self attachment];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__ICAttachmentPaperBundleModel_setPaperHasEnhancedCanvas___block_invoke;
  v5[3] = &__block_descriptor_33_e29_v16__0__NSMutableDictionary_8l;
  BOOL v6 = a3;
  [v4 updateAttachmentMetadataWithBlock:v5];
}

void __58__ICAttachmentPaperBundleModel_setPaperHasEnhancedCanvas___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 32);
  id v4 = a2;
  id v5 = [v2 numberWithBool:v3];
  [v4 setObject:v5 forKeyedSubscript:@"hasEnhancedCanvasKey"];
}

- (BOOL)paperHasNewInks2022
{
  v2 = [(ICAttachmentModel *)self attachment];
  uint64_t v3 = [v2 metadata];
  id v4 = [v3 objectForKeyedSubscript:@"hasNewInksKey"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setPaperHasNewInks2022:(BOOL)a3
{
  id v4 = [(ICAttachmentModel *)self attachment];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__ICAttachmentPaperBundleModel_setPaperHasNewInks2022___block_invoke;
  v5[3] = &__block_descriptor_33_e29_v16__0__NSMutableDictionary_8l;
  BOOL v6 = a3;
  [v4 updateAttachmentMetadataWithBlock:v5];
}

void __55__ICAttachmentPaperBundleModel_setPaperHasNewInks2022___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 32);
  id v4 = a2;
  id v5 = [v2 numberWithBool:v3];
  [v4 setObject:v5 forKeyedSubscript:@"hasNewInksKey"];
}

- (BOOL)paperHasNewInks2023
{
  v2 = [(ICAttachmentModel *)self attachment];
  uint64_t v3 = [v2 metadata];
  id v4 = [v3 objectForKeyedSubscript:@"hasNewInks2023Key"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setPaperHasNewInks2023:(BOOL)a3
{
  id v4 = [(ICAttachmentModel *)self attachment];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__ICAttachmentPaperBundleModel_setPaperHasNewInks2023___block_invoke;
  v5[3] = &__block_descriptor_33_e29_v16__0__NSMutableDictionary_8l;
  BOOL v6 = a3;
  [v4 updateAttachmentMetadataWithBlock:v5];
}

void __55__ICAttachmentPaperBundleModel_setPaperHasNewInks2023___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 32);
  id v4 = a2;
  id v5 = [v2 numberWithBool:v3];
  [v4 setObject:v5 forKeyedSubscript:@"hasNewInks2023Key"];
}

- (BOOL)paperHasNewInksSpring2024
{
  v2 = [(ICAttachmentModel *)self attachment];
  uint64_t v3 = [v2 metadata];
  id v4 = [v3 objectForKeyedSubscript:@"hasNewInksSpring2024Key"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setPaperHasNewInksSpring2024:(BOOL)a3
{
  id v4 = [(ICAttachmentModel *)self attachment];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__ICAttachmentPaperBundleModel_setPaperHasNewInksSpring2024___block_invoke;
  v5[3] = &__block_descriptor_33_e29_v16__0__NSMutableDictionary_8l;
  BOOL v6 = a3;
  [v4 updateAttachmentMetadataWithBlock:v5];
}

void __61__ICAttachmentPaperBundleModel_setPaperHasNewInksSpring2024___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 32);
  id v4 = a2;
  id v5 = [v2 numberWithBool:v3];
  [v4 setObject:v5 forKeyedSubscript:@"hasNewInksSpring2024Key"];
}

- (BOOL)paperHasMath
{
  v2 = [(ICAttachmentModel *)self attachment];
  uint64_t v3 = [v2 metadata];
  id v4 = [v3 objectForKeyedSubscript:@"hasMathKey"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setPaperHasMath:(BOOL)a3
{
  id v4 = [(ICAttachmentModel *)self attachment];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__ICAttachmentPaperBundleModel_setPaperHasMath___block_invoke;
  v5[3] = &__block_descriptor_33_e29_v16__0__NSMutableDictionary_8l;
  BOOL v6 = a3;
  [v4 updateAttachmentMetadataWithBlock:v5];
}

void __48__ICAttachmentPaperBundleModel_setPaperHasMath___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 32);
  id v4 = a2;
  id v5 = [v2 numberWithBool:v3];
  [v4 setObject:v5 forKeyedSubscript:@"hasMathKey"];
}

+ (int64_t)baseNotesVersion
{
  return 7;
}

- (void)updateMinimumSupportedVersionIfNeededWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = [(ICAttachmentModel *)self attachment];
  if ([(ICAttachmentPaperBundleModel *)self paperHasNewInksSpring2024])
  {
LABEL_9:
    v4[2](v4);
    goto LABEL_10;
  }
  BOOL v6 = [(ICAttachmentPaperBundleModel *)self paperBundleURL];

  if (!v6)
  {
    v8 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ICAttachmentPaperBundleModel updateMinimumSupportedVersionIfNeededWithCompletionHandler:](v5, v8);
    }

    goto LABEL_9;
  }
  if (updateMinimumSupportedVersionIfNeededWithCompletionHandler__onceToken != -1) {
    dispatch_once(&updateMinimumSupportedVersionIfNeededWithCompletionHandler__onceToken, &__block_literal_global_52);
  }
  uint64_t v7 = updateMinimumSupportedVersionIfNeededWithCompletionHandler__queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__ICAttachmentPaperBundleModel_updateMinimumSupportedVersionIfNeededWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E64A4578;
  block[4] = self;
  id v10 = v5;
  v11 = v4;
  dispatch_async(v7, block);

LABEL_10:
}

void __91__ICAttachmentPaperBundleModel_updateMinimumSupportedVersionIfNeededWithCompletionHandler___block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.notes.system-paper-version-check", v2);
  v1 = (void *)updateMinimumSupportedVersionIfNeededWithCompletionHandler__queue;
  updateMinimumSupportedVersionIfNeededWithCompletionHandler__queue = (uint64_t)v0;
}

void __91__ICAttachmentPaperBundleModel_updateMinimumSupportedVersionIfNeededWithCompletionHandler___block_invoke_2(id *a1)
{
  uint64_t v2 = [(id)objc_opt_class() baseNotesVersion];
  uint64_t v3 = [a1[4] paperBundleURL];
  int64_t v4 = +[ICAttachmentSystemPaperModelHelper minimumSupportedNotesVersionForPaperAtURL:v3 greaterOrEqualToVersion:v2];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__ICAttachmentPaperBundleModel_updateMinimumSupportedVersionIfNeededWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E64A4550;
  uint64_t v11 = v2;
  int64_t v12 = v4;
  id v5 = a1[5];
  id v6 = a1[4];
  id v8 = v5;
  id v9 = v6;
  id v10 = a1[6];
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __91__ICAttachmentPaperBundleModel_updateMinimumSupportedVersionIfNeededWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2 < 9)
  {
    if (*(uint64_t *)(a1 + 64) < 9) {
      goto LABEL_7;
    }
    uint64_t v3 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int64_t v4 = objc_msgSend(*(id *)(a1 + 32), "ic_loggingIdentifier");
      uint64_t v5 = [*(id *)(a1 + 32) minimumSupportedNotesVersion];
      int v19 = 138412802;
      id v20 = v4;
      __int16 v21 = 2048;
      uint64_t v22 = v5;
      __int16 v23 = 2048;
      uint64_t v24 = 9;
      _os_log_impl(&dword_1C3A61000, v3, OS_LOG_TYPE_INFO, "Attachment (%@) was found to have contents which won't render properly pre-iOS 16.0. Bumping notes version for the attachment from %lld to %lld.", (uint8_t *)&v19, 0x20u);
    }
    [*(id *)(a1 + 40) setPaperHasEnhancedCanvas:1];
    uint64_t v2 = *(void *)(a1 + 56);
  }
  if (v2 > 9) {
    goto LABEL_11;
  }
LABEL_7:
  if (*(uint64_t *)(a1 + 64) > 9)
  {
    id v6 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "ic_loggingIdentifier");
      uint64_t v8 = [*(id *)(a1 + 32) minimumSupportedNotesVersion];
      int v19 = 138412802;
      id v20 = v7;
      __int16 v21 = 2048;
      uint64_t v22 = v8;
      __int16 v23 = 2048;
      uint64_t v24 = 10;
      _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_INFO, "Attachment (%@) was found to have contents which won't render properly pre-iOS 16.1. Bumping notes version for the attachment from %lld to %lld.", (uint8_t *)&v19, 0x20u);
    }
    [*(id *)(a1 + 40) setPaperHasNewInks2022:1];
    uint64_t v2 = *(void *)(a1 + 56);
LABEL_11:
    if (v2 >= 13) {
      goto LABEL_16;
    }
  }
  if (*(uint64_t *)(a1 + 64) < 13) {
    goto LABEL_17;
  }
  id v9 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = objc_msgSend(*(id *)(a1 + 32), "ic_loggingIdentifier");
    uint64_t v11 = [*(id *)(a1 + 32) minimumSupportedNotesVersion];
    int v19 = 138412802;
    id v20 = v10;
    __int16 v21 = 2048;
    uint64_t v22 = v11;
    __int16 v23 = 2048;
    uint64_t v24 = 13;
    _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_INFO, "Attachment (%@) was found to have contents which won't render properly pre-iOS 17.0. Bumping notes version for the attachment from %lld to %lld.", (uint8_t *)&v19, 0x20u);
  }
  [*(id *)(a1 + 40) setPaperHasNewInks2023:1];
  uint64_t v2 = *(void *)(a1 + 56);
LABEL_16:
  if (v2 >= 14) {
    goto LABEL_21;
  }
LABEL_17:
  if (*(uint64_t *)(a1 + 64) > 13)
  {
    int64_t v12 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = objc_msgSend(*(id *)(a1 + 32), "ic_loggingIdentifier");
      uint64_t v14 = [*(id *)(a1 + 32) minimumSupportedNotesVersion];
      int v19 = 138412802;
      id v20 = v13;
      __int16 v21 = 2048;
      uint64_t v22 = v14;
      __int16 v23 = 2048;
      uint64_t v24 = 14;
      _os_log_impl(&dword_1C3A61000, v12, OS_LOG_TYPE_INFO, "Attachment (%@) was found to have contents which won't render properly pre-iOS 17.4. Bumping notes version for the attachment from %lld to %lld.", (uint8_t *)&v19, 0x20u);
    }
    [*(id *)(a1 + 40) setPaperHasNewInksSpring2024:1];
    uint64_t v2 = *(void *)(a1 + 56);
LABEL_21:
    if (v2 > 14) {
      goto LABEL_26;
    }
  }
  if (*(uint64_t *)(a1 + 64) >= 15)
  {
    v15 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = objc_msgSend(*(id *)(a1 + 32), "ic_loggingIdentifier");
      uint64_t v17 = [*(id *)(a1 + 32) minimumSupportedNotesVersion];
      int v19 = 138412802;
      id v20 = v16;
      __int16 v21 = 2048;
      uint64_t v22 = v17;
      __int16 v23 = 2048;
      uint64_t v24 = 15;
      _os_log_impl(&dword_1C3A61000, v15, OS_LOG_TYPE_INFO, "Attachment (%@) was found to have contents which won't render properly pre-iOS 18.0. Bumping notes version for the attachment from %lld to %lld.", (uint8_t *)&v19, 0x20u);
    }
    [*(id *)(a1 + 40) setPaperHasMath:1];
  }
LABEL_26:
  [*(id *)(a1 + 32) resetToIntrinsicNotesVersionAndPropagateToChildObjects];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)removeStrokesFromStyleInventory
{
  uint64_t v3 = [(ICAttachmentModel *)self attachment];
  int64_t v4 = objc_msgSend(v3, "ic_permanentObjectID");

  uint64_t v5 = [(ICAttachmentModel *)self attachment];
  id v6 = [v5 workerManagedObjectContext];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__ICAttachmentPaperBundleModel_removeStrokesFromStyleInventory__block_invoke;
  v9[3] = &unk_1E64A4218;
  id v10 = v6;
  id v11 = v4;
  id v7 = v4;
  id v8 = v6;
  [v8 performBlock:v9];
}

void __63__ICAttachmentPaperBundleModel_removeStrokesFromStyleInventory__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "ic_existingObjectWithID:", *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = [[_TtC11NotesShared21ICSystemPaperDocument alloc] initWithPaperAttachment:v2];
  [(ICSystemPaperDocument *)v1 removeStrokesFromStyleInventory];
}

+ (id)generateFallbackPDFDataForAttachment:(id)a3
{
  id v3 = a3;
  int64_t v4 = [[_TtC11NotesShared21ICSystemPaperDocument alloc] initWithPaperAttachment:v3];

  uint64_t v5 = [(ICSystemPaperDocument *)v4 toFallbackPDFData];

  return v5;
}

- (BOOL)providesStandaloneTitleForNote
{
  return 1;
}

- (id)standaloneTitleForNote
{
  id v3 = [(ICAttachmentModel *)self attachment];
  int64_t v4 = [v3 userTitle];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v6 = [(ICAttachmentModel *)self attachment];
    id v5 = [v6 title];
  }
  if (![v5 length])
  {
    uint64_t v7 = +[ICNote defaultTitleForEmptyNote];

    id v5 = (id)v7;
  }
  id v8 = [v5 pathExtension];
  if ([v8 length])
  {
    id v9 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v8];
    if ([v9 isEqual:*MEMORY[0x1E4F44450]])
    {
      uint64_t v10 = [v5 stringByDeletingPathExtension];

      id v5 = (id)v10;
    }
  }
  return v5;
}

- (ICAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
}

void __80__ICAttachmentPaperBundleModel_paperBundleURLForAttachmentIdentifier_inAccount___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_7(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_ERROR, "Could note move prerelease system paper bundle from %@ to %@", v1, 0x16u);
}

void __80__ICAttachmentPaperBundleModel_paperBundleURLForAttachmentIdentifier_inAccount___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_7(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_DEBUG, "Detected prerelease system paper bundle that has note been moved: %@. Moving to %@", v1, 0x16u);
}

- (void)updateMinimumSupportedVersionIfNeededWithCompletionHandler:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(a1, "ic_loggingIdentifier");
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Can't update minimum supported version for paper attachment (%@) because paperBundleURL was nil", (uint8_t *)&v4, 0xCu);
}

@end