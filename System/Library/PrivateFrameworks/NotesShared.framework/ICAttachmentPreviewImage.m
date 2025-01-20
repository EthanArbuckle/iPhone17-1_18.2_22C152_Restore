@interface ICAttachmentPreviewImage
+ (id)allAttachmentPreviewImagesInContext:(id)a3;
+ (id)attachmentPreviewImageIdentifiersForAccount:(id)a3;
+ (id)attachmentPreviewImageWithIdentifier:(id)a3 inContext:(id)a4;
+ (id)concurrentFileLoadLimitSemaphore;
+ (id)fileGlobalQueue;
+ (id)fileQueueGroup;
+ (id)identifierForContentIdentifier:(id)a3 scale:(double)a4 width:(double)a5 height:(double)a6 appearanceType:(unint64_t)a7;
+ (id)newAttachmentPreviewImageWithIdentifier:(id)a3 attachment:(id)a4;
+ (id)previewImageURLsForIdentifier:(id)a3 account:(id)a4;
+ (int64_t)updateFileWriteCounterBy:(int64_t)a3 identifier:(id)a4;
+ (void)deleteStrandedAttachmentPreviewImagesInContext:(id)a3;
+ (void)enumerateAttachmentPreviewImagesInContext:(id)a3 batchSize:(unint64_t)a4 saveAfterBatch:(BOOL)a5 usingBlock:(id)a6;
+ (void)purgeAllAttachmentPreviewImagesInContext:(id)a3;
+ (void)purgePreviewImageFilesForIdentifiers:(id)a3 account:(id)a4;
+ (void)waitUntilAllFileWritesAreFinished;
- (BOOL)hasAnyPNGPreviewImageFiles;
- (BOOL)imageIsValid;
- (BOOL)imageIsWriting;
- (BOOL)makeSurePreviewImageDirectoryExists:(id *)a3;
- (BOOL)needsInitialFetchFromCloud;
- (BOOL)needsToBeDeletedFromCloud;
- (BOOL)needsToBeFetchedFromCloud;
- (BOOL)needsToBePushedToCloud;
- (BOOL)setImageData:(id)a3 withSize:(CGSize)a4 scale:(double)a5 appearanceType:(unint64_t)a6;
- (BOOL)setScaledImageFromImageSrc:(CGImageSource *)a3 typeUTI:(__CFString *)a4;
- (BOOL)shouldSyncToCloud;
- (BOOL)suppressesFileDeletion;
- (CGAffineTransform)orientedImageTransform;
- (CGSize)size;
- (ICAccount)placeholderAccount;
- (ICAssetGenerationManager)generationManager;
- (ICAttachmentPreviewImage)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (NSData)metadata;
- (OS_dispatch_queue)fileQueue;
- (id)cloudAccount;
- (id)containerAccount;
- (id)containerDirectoryURL;
- (id)cryptoStrategyProtocol;
- (id)decryptedImageData;
- (id)encryptedPreviewImageFallbackURL;
- (id)encryptedPreviewImageURL;
- (id)ic_loggingValues;
- (id)orientedPreviewImageFallbackURLWithoutCreating;
- (id)orientedPreviewImageURL;
- (id)orientedPreviewImageURLWithoutCreating;
- (id)previewImageDirectoryURL;
- (id)previewImageFallbackURL;
- (id)previewImagePathExtension;
- (id)previewImageURL;
- (id)primaryEncryptedData;
- (id)primaryEncryptedDataFromRecord:(id)a3;
- (id)urls;
- (int64_t)minimumSupportedNotesVersion;
- (unint64_t)imageID;
- (void)accountWillChangeToAccount:(id)a3;
- (void)awakeFromFetch;
- (void)clearDecryptedData;
- (void)containerAccount;
- (void)createOrientedPreviewIfNeeded;
- (void)deleteFromLocalDatabase;
- (void)invalidateCache;
- (void)invalidateImage;
- (void)invalidateOrientedImage;
- (void)prepareForDeletion;
- (void)previewImageURL;
- (void)removeItemAtURL:(id)a3;
- (void)setImageID:(unint64_t)a3;
- (void)setMetadata:(id)a3;
- (void)setPlaceholderAccount:(id)a3;
- (void)setPrimaryEncryptedData:(id)a3;
- (void)setSuppressesFileDeletion:(BOOL)a3;
- (void)suppressFileDeletion;
- (void)updateFlagToExcludeFromCloudBackup;
- (void)willTurnIntoFault;
@end

@implementation ICAttachmentPreviewImage

- (ICAttachmentPreviewImage)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ICAttachmentPreviewImage;
  result = [(ICCloudSyncingObject *)&v5 initWithEntity:a3 insertIntoManagedObjectContext:a4];
  __dmb(0xBu);
  return result;
}

- (void)awakeFromFetch
{
  v3.receiver = self;
  v3.super_class = (Class)ICAttachmentPreviewImage;
  [(ICCloudSyncingObject *)&v3 awakeFromFetch];
  [(ICAssetGenerationManager *)self->_generationManager updateCurrentGeneration];
}

- (CGSize)size
{
  [(ICAttachmentPreviewImage *)self width];
  double v4 = v3;
  [(ICAttachmentPreviewImage *)self height];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

+ (void)purgePreviewImageFilesForIdentifiers:(id)a3 account:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v21 = a4;
  double v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v5;
  uint64_t v22 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
  id v7 = 0;
  if (v22)
  {
    uint64_t v19 = *(void *)v31;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v8;
        uint64_t v9 = *(void *)(*((void *)&v30 + 1) + 8 * v8);
        context = (void *)MEMORY[0x1C877DB80]();
        v10 = [a1 previewImageURLsForIdentifier:v9 account:v21];
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v38 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v27;
          do
          {
            uint64_t v14 = 0;
            do
            {
              v15 = v7;
              if (*(void *)v27 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * v14);
              id v25 = v7;
              [v6 removeItemAtURL:v16 error:&v25];
              id v7 = v25;

              if (v7 && [v7 code] != 4)
              {
                v17 = os_log_create("com.apple.notes", "PreviewGeneration");
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v35 = v16;
                  __int16 v36 = 2112;
                  id v37 = v7;
                  _os_log_error_impl(&dword_1C3A61000, v17, OS_LOG_TYPE_ERROR, "failed to remove media directory at URL: %@, error: %@", buf, 0x16u);
                }
              }
              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v38 count:16];
          }
          while (v12);
        }

        uint64_t v8 = v24 + 1;
      }
      while (v24 + 1 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v22);
  }
}

- (OS_dispatch_queue)fileQueue
{
  double v3 = [(ICAttachmentPreviewImage *)self identifier];
  double v4 = +[ICAttachmentPreviewImage fileGlobalQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__ICAttachmentPreviewImage_fileQueue__block_invoke;
  v8[3] = &unk_1E64A4218;
  v8[4] = self;
  id v9 = v3;
  id v5 = v3;
  dispatch_sync(v4, v8);

  double v6 = self->_fileQueue;
  return v6;
}

void __37__ICAttachmentPreviewImage_fileQueue__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 208))
  {
    v2 = (void *)ICAttachmentPreviewImageFileQueuesMap;
    if (!ICAttachmentPreviewImageFileQueuesMap)
    {
      uint64_t v3 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
      double v4 = (void *)ICAttachmentPreviewImageFileQueuesMap;
      ICAttachmentPreviewImageFileQueuesMap = v3;

      v2 = (void *)ICAttachmentPreviewImageFileQueuesMap;
    }
    uint64_t v5 = [v2 objectForKey:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 208);
    *(void *)(v6 + 208) = v5;

    if (!*(void *)(*(void *)(a1 + 32) + 208))
    {
      id v8 = [NSString stringWithFormat:@"%@-fileAccess", *(void *)(a1 + 40)];
      id v9 = (const char *)[v8 UTF8String];
      v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v11 = dispatch_queue_create(v9, v10);
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void **)(v12 + 208);
      *(void *)(v12 + 208) = v11;

      uint64_t v14 = (void *)ICAttachmentPreviewImageFileQueuesMap;
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 208);
      [v14 setObject:v16 forKey:v15];
    }
  }
}

+ (int64_t)updateFileWriteCounterBy:(int64_t)a3 identifier:(id)a4
{
  id v5 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v6 = +[ICAttachmentPreviewImage fileGlobalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__ICAttachmentPreviewImage_updateFileWriteCounterBy_identifier___block_invoke;
  block[3] = &unk_1E64A6000;
  id v11 = v5;
  uint64_t v12 = &v14;
  int64_t v13 = a3;
  id v7 = v5;
  dispatch_sync(v6, block);

  int64_t v8 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v8;
}

void __64__ICAttachmentPreviewImage_updateFileWriteCounterBy_identifier___block_invoke(void *a1)
{
  v2 = (void *)ICAttachmentPreviewFileWriteCounterMap;
  if (!ICAttachmentPreviewFileWriteCounterMap)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    double v4 = (void *)ICAttachmentPreviewFileWriteCounterMap;
    ICAttachmentPreviewFileWriteCounterMap = v3;

    v2 = (void *)ICAttachmentPreviewFileWriteCounterMap;
  }
  id v5 = [v2 objectForKey:a1[4]];
  id v9 = v5;
  if (v5)
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = [v5 integerValue];
    id v5 = v9;
  }
  uint64_t v6 = a1[6];
  if (v6)
  {
    id v7 = (void *)ICAttachmentPreviewFileWriteCounterMap;
    int64_t v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(*(void *)(a1[5] + 8) + 24) + v6];
    [v7 setObject:v8 forKey:a1[4]];

    id v5 = v9;
  }
}

+ (id)concurrentFileLoadLimitSemaphore
{
  if (concurrentFileLoadLimitSemaphore_once != -1) {
    dispatch_once(&concurrentFileLoadLimitSemaphore_once, &__block_literal_global_64);
  }
  v2 = (void *)concurrentFileLoadLimitSemaphore_sema;
  return v2;
}

void __60__ICAttachmentPreviewImage_concurrentFileLoadLimitSemaphore__block_invoke()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(2);
  v1 = (void *)concurrentFileLoadLimitSemaphore_sema;
  concurrentFileLoadLimitSemaphore_sema = (uint64_t)v0;
}

+ (id)fileGlobalQueue
{
  if (fileGlobalQueue_once != -1) {
    dispatch_once(&fileGlobalQueue_once, &__block_literal_global_35);
  }
  v2 = (void *)fileGlobalQueue_fileGlobalQueue;
  return v2;
}

void __43__ICAttachmentPreviewImage_fileGlobalQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("fileGlobalAccess", v2);
  v1 = (void *)fileGlobalQueue_fileGlobalQueue;
  fileGlobalQueue_fileGlobalQueue = (uint64_t)v0;
}

+ (id)fileQueueGroup
{
  if (fileQueueGroup_once != -1) {
    dispatch_once(&fileQueueGroup_once, &__block_literal_global_38);
  }
  v2 = (void *)fileQueueGroup_fileGroup;
  return v2;
}

void __42__ICAttachmentPreviewImage_fileQueueGroup__block_invoke()
{
  dispatch_group_t v0 = dispatch_group_create();
  v1 = (void *)fileQueueGroup_fileGroup;
  fileQueueGroup_fileGroup = (uint64_t)v0;
}

+ (void)waitUntilAllFileWritesAreFinished
{
  v2 = +[ICAttachmentPreviewImage fileQueueGroup];
  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)suppressFileDeletion
{
}

- (void)prepareForDeletion
{
  v2 = [a1 identifier];
  uint64_t v3 = [a1 objectID];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v4, v5, "Not deleting files for attachment preview image - identifier: %@, object ID: %@", v6, v7, v8, v9, 2u);
}

- (void)willTurnIntoFault
{
  v3.receiver = self;
  v3.super_class = (Class)ICAttachmentPreviewImage;
  [(ICAttachmentPreviewImage *)&v3 willTurnIntoFault];
  [(ICAttachmentPreviewImage *)self invalidateCache];
}

- (void)accountWillChangeToAccount:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v6 = [(ICAttachmentPreviewImage *)self containerAccount];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [(ICAttachmentPreviewImage *)self identifier];
  uint64_t v9 = [v7 previewImageURLsForIdentifier:v8 account:v6];

  v10 = objc_opt_class();
  long long v31 = self;
  id v11 = [(ICAttachmentPreviewImage *)self identifier];
  uint64_t v12 = [v10 previewImageURLsForIdentifier:v11 account:v4];

  long long v32 = v6;
  if ([v6 isEqual:v4])
  {
    int64_t v13 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[ICAttachmentPreviewImage accountWillChangeToAccount:]();
    }
  }
  if ([v9 count])
  {
    long long v33 = 0;
    unint64_t v15 = 0;
    *(void *)&long long v14 = 138412290;
    long long v30 = v14;
    while (1)
    {
      if (v15 >= objc_msgSend(v12, "count", v30)) {
        goto LABEL_24;
      }
      if (v4)
      {
        uint64_t v16 = [v9 objectAtIndexedSubscript:v15];
        os_log_t v17 = [v16 path];
        if (![v5 fileExistsAtPath:v17]) {
          goto LABEL_19;
        }
        v18 = [v9 objectAtIndexedSubscript:v15];
        uint64_t v19 = [v12 objectAtIndexedSubscript:v15];
        char v20 = [v18 isEqual:v19];

        if ((v20 & 1) == 0) {
          break;
        }
      }
LABEL_20:
      if (++v15 >= [v9 count]) {
        goto LABEL_24;
      }
    }
    id v21 = [v12 objectAtIndexedSubscript:v15];
    uint64_t v22 = [v21 URLByDeletingLastPathComponent];
    id v35 = v33;
    [v5 createDirectoryAtURL:v22 withIntermediateDirectories:1 attributes:0 error:&v35];
    id v23 = v35;

    if (v23)
    {
      uint64_t v24 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v30;
        id v37 = v23;
        _os_log_error_impl(&dword_1C3A61000, v24, OS_LOG_TYPE_ERROR, "Error creating preview image directory %@", buf, 0xCu);
      }
    }
    id v25 = [v9 objectAtIndexedSubscript:v15];
    long long v26 = [v12 objectAtIndexedSubscript:v15];
    id v34 = v23;
    [v5 moveItemAtURL:v25 toURL:v26 error:&v34];
    id v27 = v34;

    long long v33 = v27;
    if (!v27)
    {
      long long v33 = 0;
      goto LABEL_20;
    }
    os_log_t v17 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      long long v28 = [v9 objectAtIndexedSubscript:v15];
      long long v29 = [v28 lastPathComponent];
      *(_DWORD *)buf = 138412546;
      id v37 = v29;
      __int16 v38 = 2112;
      v39 = v33;
      _os_log_error_impl(&dword_1C3A61000, v17, OS_LOG_TYPE_ERROR, "Error moving preview image file %@, error %@", buf, 0x16u);
    }
    uint64_t v16 = v17;
LABEL_19:

    goto LABEL_20;
  }
  long long v33 = 0;
LABEL_24:
  if (v4) {
    [(ICAttachmentPreviewImage *)v31 setPlaceholderAccount:v4];
  }
}

- (void)removeItemAtURL:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    objc_super v3 = (void *)MEMORY[0x1E4F28CB8];
    id v4 = a3;
    uint64_t v5 = [v3 defaultManager];
    id v9 = 0;
    char v6 = [v5 removeItemAtURL:v4 error:&v9];

    id v7 = v9;
    if ((v6 & 1) == 0 && [v7 code] != 4)
    {
      uint64_t v8 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v7;
        _os_log_impl(&dword_1C3A61000, v8, OS_LOG_TYPE_DEFAULT, "Error removing preview image file: %@", buf, 0xCu);
      }
    }
  }
}

- (void)invalidateOrientedImage
{
  ++self->_imageID;
  if (objc_opt_respondsToSelector()) {
    [(ICAttachmentPreviewImage *)self clearCachedOrientedImage];
  }
  id v3 = [(ICAttachmentPreviewImage *)self orientedPreviewImageURLWithoutCreating];
  [(ICAttachmentPreviewImage *)self removeItemAtURL:v3];
}

- (void)invalidateImage
{
  [(ICAttachmentPreviewImage *)self invalidateCache];
  [(ICAttachmentPreviewImage *)self invalidateOrientedImage];
}

- (void)invalidateCache
{
  if (objc_opt_respondsToSelector()) {
    [(ICAttachmentPreviewImage *)self clearCachedImage];
  }
  if (objc_opt_respondsToSelector())
  {
    [(ICAttachmentPreviewImage *)self clearCachedOrientedImage];
  }
}

- (CGAffineTransform)orientedImageTransform
{
  id v4 = [(ICAttachmentPreviewImage *)self attachment];
  if (v4)
  {
    id v10 = v4;
    uint64_t v5 = [v4 attachmentModel];
    char v6 = v5;
    if (v5)
    {
      [v5 previewImageOrientationTransform];
    }
    else
    {
      *(_OWORD *)&retstr->c = 0u;
      *(_OWORD *)&retstr->tx = 0u;
      *(_OWORD *)&retstr->a = 0u;
    }

    id v4 = v10;
  }
  else
  {
    uint64_t v7 = MEMORY[0x1E4F1DAB8];
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v8;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v7 + 32);
  }

  return result;
}

- (BOOL)imageIsValid
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(ICAttachmentPreviewImage *)self hasCachedImage] & 1) != 0)
  {
    return 1;
  }
  char v4 = [(ICAttachmentPreviewImage *)self isPasswordProtected];
  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (v4) {
    [(ICAttachmentPreviewImage *)self encryptedPreviewImageURL];
  }
  else {
  char v6 = [(ICAttachmentPreviewImage *)self previewImageURL];
  }
  uint64_t v7 = [v6 path];
  char v8 = [v5 fileExistsAtPath:v7];

  return v8;
}

- (BOOL)imageIsWriting
{
  v2 = [(ICAttachmentPreviewImage *)self identifier];
  BOOL v3 = +[ICAttachmentPreviewImage updateFileWriteCounterBy:0 identifier:v2] > 0;

  return v3;
}

- (BOOL)setImageData:(id)a3 withSize:(CGSize)a4 scale:(double)a5 appearanceType:(unint64_t)a6
{
  __int16 v6 = a6;
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 1;
  uint64_t v12 = [(ICAttachmentPreviewImage *)self identifier];

  if (!v12) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.identifier != ((void *)0)" functionName:"-[ICAttachmentPreviewImage setImageData:withSize:scale:appearanceType:]" simulateCrash:1 showAlert:0 format:@"Why doesn't the preview image have an identifier?"];
  }
  int64_t v13 = [(ICAttachmentPreviewImage *)self identifier];

  if (!v13)
  {
    long long v14 = [MEMORY[0x1E4F29128] UUID];
    unint64_t v15 = [v14 UUIDString];
    [(ICAttachmentPreviewImage *)self setIdentifier:v15];
  }
  [(ICAttachmentPreviewImage *)self invalidateImage];
  uint64_t v16 = [(ICAttachmentPreviewImage *)self generationManager];
  int v17 = [v16 beginGeneration];

  if (v17)
  {
    v18 = [(ICAttachmentPreviewImage *)self previewImageURL];
    uint64_t v19 = [(ICAttachmentPreviewImage *)self encryptedPreviewImageURL];
    char v20 = [(ICAttachmentPreviewImage *)self isPasswordProtected];
    id v21 = [(ICAttachmentPreviewImage *)self fileQueue];
    uint64_t v22 = [(ICAttachmentPreviewImage *)self identifier];
    [(ICAttachmentPreviewImage *)self setWidth:width];
    [(ICAttachmentPreviewImage *)self setHeight:height];
    [(ICAttachmentPreviewImage *)self setScale:a5];
    id v23 = [MEMORY[0x1E4F1C9C8] date];
    [(ICAttachmentPreviewImage *)self setModifiedDate:v23];

    [(ICAttachmentPreviewImage *)self setAppearanceType:v6];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__ICAttachmentPreviewImage_setImageData_withSize_scale_appearanceType___block_invoke;
    block[3] = &unk_1E64A9598;
    id v24 = v22;
    id v32 = v24;
    long long v33 = self;
    id v37 = &v39;
    char v38 = v20;
    id v34 = v11;
    id v25 = v18;
    id v35 = v25;
    id v26 = v19;
    id v36 = v26;
    dispatch_sync(v21, block);
    if (*((unsigned char *)v40 + 24))
    {
      id v27 = [(ICAttachmentPreviewImage *)self generationManager];
      char v28 = [v27 commitGeneration];
      *((unsigned char *)v40 + 24) = v28;
    }
    else
    {
      id v27 = [(ICAttachmentPreviewImage *)self generationManager];
      [v27 rollbackGeneration];
    }

    BOOL v29 = *((unsigned char *)v40 + 24) != 0;
  }
  else
  {
    BOOL v29 = 0;
  }
  _Block_object_dispose(&v39, 8);

  return v29;
}

void __71__ICAttachmentPreviewImage_setImageData_withSize_scale_appearanceType___block_invoke(uint64_t a1)
{
  v2 = +[ICAttachmentPreviewImage fileQueueGroup];
  dispatch_group_enter(v2);

  +[ICAttachmentPreviewImage updateFileWriteCounterBy:1 identifier:*(void *)(a1 + 32)];
  BOOL v3 = *(void **)(a1 + 40);
  id v25 = 0;
  char v4 = [v3 makeSurePreviewImageDirectoryExists:&v25];
  id v5 = v25;
  if (v4)
  {
    if (*(unsigned char *)(a1 + 80))
    {
      __int16 v6 = [*(id *)(a1 + 40) cryptoStrategy];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v6 writeEncryptedImageData:*(void *)(a1 + 48)];
    }
    else
    {
      char v8 = *(void **)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 56);
      id v24 = v5;
      char v10 = [v8 writeToURL:v9 options:1 error:&v24];
      id v11 = v24;

      if ((v10 & 1) == 0)
      {
        uint64_t v12 = os_log_create("com.apple.notes", "PreviewGeneration");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          __71__ICAttachmentPreviewImage_setImageData_withSize_scale_appearanceType___block_invoke_cold_2((uint64_t *)(a1 + 32), (uint64_t)v11, v12);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      }
      id v5 = v11;
    }
  }
  else
  {
    uint64_t v7 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __71__ICAttachmentPreviewImage_setImageData_withSize_scale_appearanceType___block_invoke_cold_3();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    uint64_t v13 = 64;
    if (!*(unsigned char *)(a1 + 80)) {
      uint64_t v13 = 56;
    }
    id v14 = *(id *)(a1 + v13);
    id v23 = 0;
    uint64_t v15 = *MEMORY[0x1E4F1C530];
    id v22 = 0;
    int v16 = [v14 getResourceValue:&v23 forKey:v15 error:&v22];
    id v17 = v23;
    id v18 = v22;
    uint64_t v19 = v18;
    if (v16)
    {
      [*(id *)(a1 + 40) setModifiedDate:v17];
    }
    else if (v18)
    {
      char v20 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __71__ICAttachmentPreviewImage_setImageData_withSize_scale_appearanceType___block_invoke_cold_1((uint64_t)v19, v14, v20);
      }
    }
    [*(id *)(a1 + 40) updateFlagToExcludeFromCloudBackup];
  }
  +[ICAttachmentPreviewImage updateFileWriteCounterBy:-1 identifier:*(void *)(a1 + 32)];
  id v21 = +[ICAttachmentPreviewImage fileQueueGroup];
  dispatch_group_leave(v21);
}

- (BOOL)setScaledImageFromImageSrc:(CGImageSource *)a3 typeUTI:(__CFString *)a4
{
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v7 = [(ICAttachmentPreviewImage *)self identifier];

  if (!v7) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.identifier != ((void *)0)" functionName:"-[ICAttachmentPreviewImage setScaledImageFromImageSrc:typeUTI:]" simulateCrash:1 showAlert:0 format:@"Why doesn't the preview image have an identifier?"];
  }
  char v8 = [(ICAttachmentPreviewImage *)self identifier];

  if (!v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    char v10 = [v9 UUIDString];
    [(ICAttachmentPreviewImage *)self setIdentifier:v10];
  }
  [(ICAttachmentPreviewImage *)self invalidateImage];
  id v11 = [(ICAttachmentPreviewImage *)self generationManager];
  int v12 = [v11 beginGeneration];

  if (v12)
  {
    uint64_t v13 = [(ICAttachmentPreviewImage *)self previewImageURL];
    id v14 = [(ICAttachmentPreviewImage *)self encryptedPreviewImageURL];
    uint64_t v15 = [(ICAttachmentPreviewImage *)self identifier];
    char v16 = [(ICAttachmentPreviewImage *)self isPasswordProtected];
    [(ICAttachmentPreviewImage *)self width];
    double v18 = v17;
    [(ICAttachmentPreviewImage *)self height];
    if (v18 < v19) {
      double v18 = v19;
    }
    CFRetain(a3);
    char v20 = [(ICAttachmentPreviewImage *)self fileQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__ICAttachmentPreviewImage_setScaledImageFromImageSrc_typeUTI___block_invoke;
    block[3] = &unk_1E64A95C0;
    id v21 = v15;
    id v29 = v21;
    long long v30 = self;
    char v37 = v16;
    id v34 = a4;
    id v22 = v13;
    id v35 = a3;
    uint64_t v36 = (uint64_t)v18;
    id v31 = v22;
    long long v33 = &v38;
    id v23 = v14;
    id v32 = v23;
    dispatch_sync(v20, block);

    if (*((unsigned char *)v39 + 24))
    {
      id v24 = [(ICAttachmentPreviewImage *)self generationManager];
      char v25 = [v24 commitGeneration];
      *((unsigned char *)v39 + 24) = v25;
    }
    else
    {
      id v24 = [(ICAttachmentPreviewImage *)self generationManager];
      [v24 rollbackGeneration];
    }

    BOOL v26 = *((unsigned char *)v39 + 24) != 0;
  }
  else
  {
    BOOL v26 = 0;
  }
  _Block_object_dispose(&v38, 8);
  return v26;
}

void __63__ICAttachmentPreviewImage_setScaledImageFromImageSrc_typeUTI___block_invoke(uint64_t a1)
{
  v27[3] = *MEMORY[0x1E4F143B8];
  v2 = +[ICAttachmentPreviewImage fileQueueGroup];
  dispatch_group_enter(v2);

  +[ICAttachmentPreviewImage updateFileWriteCounterBy:1 identifier:*(void *)(a1 + 32)];
  BOOL v3 = *(void **)(a1 + 40);
  id v25 = 0;
  char v4 = [v3 makeSurePreviewImageDirectoryExists:&v25];
  id v5 = v25;
  if (v4)
  {
    if (*(unsigned char *)(a1 + 96))
    {
      __int16 v6 = [MEMORY[0x1E4F1CA58] data];
      uint64_t v7 = CGImageDestinationCreateWithData(v6, *(CFStringRef *)(a1 + 72), 1uLL, 0);
      if (!v7)
      {
LABEL_5:
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) && *(unsigned char *)(a1 + 96))
        {
          uint64_t v13 = [*(id *)(a1 + 40) cryptoStrategy];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v13 writeEncryptedImageData:v6];
        }
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v7 = CGImageDestinationCreateWithURL(*(CFURLRef *)(a1 + 48), *(CFStringRef *)(a1 + 72), 1uLL, 0);
      __int16 v6 = 0;
      if (!v7) {
        goto LABEL_5;
      }
    }
    v26[0] = *MEMORY[0x1E4F2F428];
    char v8 = *(CGImageSource **)(a1 + 80);
    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 88)];
    uint64_t v10 = *MEMORY[0x1E4F2FE28];
    v27[0] = v9;
    v27[1] = MEMORY[0x1E4F1CC38];
    uint64_t v11 = *MEMORY[0x1E4F2FE48];
    v26[1] = v10;
    v26[2] = v11;
    v27[2] = MEMORY[0x1E4F1CC38];
    CFDictionaryRef v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
    CGImageDestinationAddImageFromSource(v7, v8, 0, v12);

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = CGImageDestinationFinalize(v7);
    CFRelease(v7);
    goto LABEL_5;
  }
  __int16 v6 = (__CFData *)os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
    __63__ICAttachmentPreviewImage_setScaledImageFromImageSrc_typeUTI___block_invoke_cold_2();
  }
LABEL_10:

  CFRelease(*(CFTypeRef *)(a1 + 80));
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v14 = 56;
    if (!*(unsigned char *)(a1 + 96)) {
      uint64_t v14 = 48;
    }
    id v15 = *(id *)(a1 + v14);
    id v24 = 0;
    uint64_t v16 = *MEMORY[0x1E4F1C530];
    id v23 = 0;
    int v17 = [v15 getResourceValue:&v24 forKey:v16 error:&v23];
    id v18 = v24;
    id v19 = v23;
    char v20 = v19;
    if (v17)
    {
      [*(id *)(a1 + 40) setModifiedDate:v18];
    }
    else if (v19)
    {
      id v21 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __71__ICAttachmentPreviewImage_setImageData_withSize_scale_appearanceType___block_invoke_cold_1((uint64_t)v20, v15, v21);
      }
    }
    [*(id *)(a1 + 40) updateFlagToExcludeFromCloudBackup];
  }
  +[ICAttachmentPreviewImage updateFileWriteCounterBy:-1 identifier:*(void *)(a1 + 32)];
  id v22 = +[ICAttachmentPreviewImage fileQueueGroup];
  dispatch_group_leave(v22);
}

- (BOOL)makeSurePreviewImageDirectoryExists:(id *)a3
{
  char v4 = [(ICAttachmentPreviewImage *)self containerAccount];
  id v5 = [v4 previewImageDirectoryURL];
  __int16 v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F837A0] defaultPreviewImageDirectoryURL];
  }
  char v8 = v7;

  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v10 = [v9 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:a3];

  return v10;
}

- (id)containerAccount
{
  BOOL v3 = [(ICAttachmentPreviewImage *)self attachment];
  char v4 = [v3 note];
  id v5 = [v4 account];
  __int16 v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    char v8 = [(ICAttachmentPreviewImage *)self attachment];
    uint64_t v9 = [v8 note];
    char v10 = [v9 folder];
    id v7 = [v10 account];
  }
  if (!v7)
  {
    id v7 = [(ICAttachmentPreviewImage *)self placeholderAccount];
    if (!v7)
    {
      uint64_t v11 = [(ICAttachmentPreviewImage *)self managedObjectContext];
      id v7 = +[ICAccount defaultAccountInContext:v11];

      CFDictionaryRef v12 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        [(ICAttachmentPreviewImage *)self containerAccount];
      }
    }
  }
  [(ICAttachmentPreviewImage *)self setPlaceholderAccount:v7];
  return v7;
}

+ (id)identifierForContentIdentifier:(id)a3 scale:(double)a4 width:(double)a5 height:(double)a6 appearanceType:(unint64_t)a7
{
  return (id)[NSString stringWithFormat:@"%@-%d-%dx%d-%d", a3, (int)a4, (int)a5, (int)a6, a7];
}

- (id)previewImagePathExtension
{
  v2 = [(ICAttachmentPreviewImage *)self attachment];
  BOOL v3 = [v2 attachmentModel];
  char v4 = [v3 previewImageTypeUTI];
  id v5 = (void *)*MEMORY[0x1E4F44410];
  __int16 v6 = [(id)*MEMORY[0x1E4F44410] identifier];
  if ([v4 isEqualToString:v6]) {
    id v7 = v5;
  }
  else {
    id v7 = (void *)*MEMORY[0x1E4F44460];
  }
  char v8 = [v7 preferredFilenameExtension];

  return v8;
}

- (id)previewImageDirectoryURL
{
  v2 = [(ICAttachmentPreviewImage *)self containerAccount];
  BOOL v3 = [v2 previewImageDirectoryURL];
  char v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F837A0] defaultPreviewImageDirectoryURL];
  }
  __int16 v6 = v5;

  return v6;
}

- (id)containerDirectoryURL
{
  BOOL v3 = [(ICAttachmentPreviewImage *)self identifier];

  if (v3)
  {
    char v4 = [(ICAttachmentPreviewImage *)self previewImageDirectoryURL];
    id v5 = [(ICAttachmentPreviewImage *)self identifier];
    __int16 v6 = [v4 URLByAppendingPathComponent:v5 isDirectory:1];
  }
  else
  {
    __int16 v6 = 0;
  }
  return v6;
}

- (id)previewImageFallbackURL
{
  BOOL v3 = [(ICAttachmentPreviewImage *)self identifier];

  if (v3)
  {
    char v4 = [(ICAttachmentPreviewImage *)self previewImageDirectoryURL];
    id v5 = [(ICAttachmentPreviewImage *)self identifier];
    __int16 v6 = [v4 URLByAppendingPathComponent:v5 isDirectory:0];

    id v7 = [(ICAttachmentPreviewImage *)self previewImagePathExtension];
    char v8 = [v6 URLByAppendingPathExtension:v7];
  }
  else
  {
    char v8 = 0;
  }
  return v8;
}

- (id)previewImageURL
{
  BOOL v3 = [(ICAttachmentPreviewImage *)self previewImageFallbackURL];
  char v4 = [(ICAttachmentPreviewImage *)self encryptedPreviewImageFallbackURL];
  id v5 = [(ICAttachmentPreviewImage *)self generationManager];
  __int16 v6 = [v5 generationURL];

  if (!v6)
  {
    id v16 = v3;
    id v14 = 0;
    goto LABEL_18;
  }
  if (v3)
  {
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v23 = 0;
    char v8 = [v7 removeItemAtURL:v3 error:&v23];
    id v9 = v23;
    char v10 = v9;
    if ((v8 & 1) == 0)
    {
      uint64_t v11 = [v9 code];

      if (v11 == 4) {
        goto LABEL_8;
      }
      id v7 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[ICAttachmentPreviewImage previewImageURL]();
      }
    }

LABEL_8:
    if (v4) {
      goto LABEL_9;
    }
LABEL_16:
    id v14 = v10;
    goto LABEL_17;
  }
  char v10 = 0;
  if (!v4) {
    goto LABEL_16;
  }
LABEL_9:
  CFDictionaryRef v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v22 = v10;
  char v13 = [v12 removeItemAtURL:v4 error:&v22];
  id v14 = v22;

  if (v13)
  {
LABEL_13:

    goto LABEL_17;
  }
  uint64_t v15 = [v14 code];

  if (v15 != 4)
  {
    CFDictionaryRef v12 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ICAttachmentPreviewImage previewImageURL]();
    }
    goto LABEL_13;
  }
LABEL_17:
  int v17 = [(ICAttachmentPreviewImage *)self generationManager];
  id v18 = [v17 generationURL];
  id v19 = [v18 URLByAppendingPathComponent:@"Preview" isDirectory:0];

  char v20 = [(ICAttachmentPreviewImage *)self previewImagePathExtension];
  id v16 = [v19 URLByAppendingPathExtension:v20];

LABEL_18:
  return v16;
}

- (id)encryptedPreviewImageFallbackURL
{
  v2 = [(ICAttachmentPreviewImage *)self previewImageFallbackURL];
  BOOL v3 = [v2 URLByAppendingPathExtension:@"encrypted"];

  return v3;
}

- (id)encryptedPreviewImageURL
{
  BOOL v3 = [(ICAttachmentPreviewImage *)self generationManager];
  char v4 = [v3 generationURL];

  if (v4)
  {
    id v5 = [(ICAttachmentPreviewImage *)self previewImageURL];
    __int16 v6 = [v5 URLByAppendingPathExtension:@"encrypted"];
  }
  else
  {
    __int16 v6 = [(ICAttachmentPreviewImage *)self encryptedPreviewImageFallbackURL];
  }
  return v6;
}

- (id)orientedPreviewImageFallbackURLWithoutCreating
{
  BOOL v3 = [(ICAttachmentPreviewImage *)self identifier];
  char v4 = [v3 stringByAppendingString:@"-oriented"];

  id v5 = [(ICAttachmentPreviewImage *)self previewImagePathExtension];
  __int16 v6 = [v4 stringByAppendingPathExtension:v5];

  id v7 = [(ICAttachmentPreviewImage *)self containerAccount];
  char v8 = [v7 previewImageDirectoryURL];
  id v9 = [v8 URLByAppendingPathComponent:v6 isDirectory:0];

  return v9;
}

- (id)orientedPreviewImageURLWithoutCreating
{
  BOOL v3 = [(ICAttachmentPreviewImage *)self identifier];

  if (v3)
  {
    char v4 = [(ICAttachmentPreviewImage *)self generationManager];
    id v5 = [v4 generationURL];

    if (v5)
    {
      __int16 v6 = [(ICAttachmentPreviewImage *)self generationManager];
      id v7 = [v6 generationURL];
      char v8 = [v7 URLByAppendingPathComponent:@"OrientedPreview" isDirectory:0];

      id v9 = [(ICAttachmentPreviewImage *)self previewImagePathExtension];
      char v10 = [v8 URLByAppendingPathExtension:v9];
    }
    else
    {
      char v10 = [(ICAttachmentPreviewImage *)self orientedPreviewImageFallbackURLWithoutCreating];
    }
  }
  else
  {
    char v10 = 0;
  }
  return v10;
}

- (id)orientedPreviewImageURL
{
  [(ICAttachmentPreviewImage *)self createOrientedPreviewIfNeeded];
  return [(ICAttachmentPreviewImage *)self orientedPreviewImageURLWithoutCreating];
}

- (id)urls
{
  BOOL v3 = [MEMORY[0x1E4F1CA80] set];
  char v4 = [(ICAttachmentPreviewImage *)self previewImageURL];
  objc_msgSend(v3, "ic_addNonNilObject:", v4);

  id v5 = [(ICAttachmentPreviewImage *)self encryptedPreviewImageURL];
  objc_msgSend(v3, "ic_addNonNilObject:", v5);

  __int16 v6 = [(ICAttachmentPreviewImage *)self orientedPreviewImageURLWithoutCreating];
  objc_msgSend(v3, "ic_addNonNilObject:", v6);

  id v7 = (void *)[v3 copy];
  return v7;
}

- (ICAssetGenerationManager)generationManager
{
  v17[3] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(ICAttachmentPreviewImage *)self containerDirectoryURL];
  if (v3)
  {
    char v4 = v3;
    id v5 = [(ICAttachmentPreviewImage *)self containerAccount];

    if (v5)
    {
      generationManager = self->_generationManager;
      if (!generationManager)
      {
        id v7 = NSStringFromSelector(sel_generation);
        char v8 = [ICAssetGenerationManager alloc];
        id v9 = [(ICAttachmentPreviewImage *)self containerDirectoryURL];
        char v10 = [(ICAssetGenerationManager *)v8 initWithObject:self generationKeyPath:v7 containerURL:v9];
        uint64_t v11 = self->_generationManager;
        self->_generationManager = v10;

        CFDictionaryRef v12 = [(ICAttachmentPreviewImage *)self previewImageFallbackURL];
        char v13 = [(ICAttachmentPreviewImage *)self encryptedPreviewImageFallbackURL];
        v17[1] = v13;
        id v14 = [(ICAttachmentPreviewImage *)self orientedPreviewImageFallbackURLWithoutCreating];
        v17[2] = v14;
        uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
        [(ICAssetGenerationManager *)self->_generationManager setFallbackURLs:v15];

        generationManager = self->_generationManager;
      }
      BOOL v3 = generationManager;
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  return v3;
}

- (BOOL)hasAnyPNGPreviewImageFiles
{
  BOOL v3 = [(ICAttachmentPreviewImage *)self orientedPreviewImageURLWithoutCreating];
  char v4 = [v3 URLByDeletingPathExtension];
  id v5 = (void *)*MEMORY[0x1E4F44460];
  __int16 v6 = [(id)*MEMORY[0x1E4F44460] preferredFilenameExtension];
  id v7 = [v4 URLByAppendingPathExtension:v6];

  if ([v7 checkResourceIsReachableAndReturnError:0])
  {
    char v8 = 1;
  }
  else
  {
    id v9 = [(ICAttachmentPreviewImage *)self previewImageURL];
    char v10 = [v9 URLByDeletingPathExtension];
    uint64_t v11 = [v5 preferredFilenameExtension];
    CFDictionaryRef v12 = [v10 URLByAppendingPathExtension:v11];

    if ([(ICAttachmentPreviewImage *)self isPasswordProtected])
    {
      uint64_t v13 = [v12 URLByAppendingPathExtension:@"encrypted"];

      CFDictionaryRef v12 = (void *)v13;
    }
    char v8 = [v12 checkResourceIsReachableAndReturnError:0];
  }
  return v8;
}

- (void)createOrientedPreviewIfNeeded
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [a1 identifier];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Trying to write oriented image for %@ to disk in a non-UI process", v4, 0xCu);
}

- (void)setMetadata:(id)a3
{
  id v4 = a3;
  if ([(ICAttachmentPreviewImage *)self isPasswordProtected])
  {
    id v5 = [(ICCloudSyncingObject *)self cryptoStrategy];
    [v5 writeEncryptedMetadata:v4];
  }
  else
  {
    [(ICAttachmentPreviewImage *)self willChangeValueForKey:@"metadata"];
    [(ICAttachmentPreviewImage *)self setPrimitiveValue:v4 forKey:@"metadata"];

    [(ICAttachmentPreviewImage *)self didChangeValueForKey:@"metadata"];
  }
}

- (NSData)metadata
{
  [(ICAttachmentPreviewImage *)self willAccessValueForKey:@"metadata"];
  if ([(ICAttachmentPreviewImage *)self isPasswordProtected])
  {
    BOOL v3 = [(ICCloudSyncingObject *)self cryptoStrategy];
    id v4 = [v3 decryptedMetadata];
  }
  else
  {
    id v4 = [(ICAttachmentPreviewImage *)self primitiveValueForKey:@"metadata"];
  }
  [(ICAttachmentPreviewImage *)self didAccessValueForKey:@"metadata"];
  return (NSData *)v4;
}

+ (id)previewImageURLsForIdentifier:(id)a3 account:(id)a4
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = [MEMORY[0x1E4F1CA48] array];
    context = (void *)MEMORY[0x1C877DB80]();
    char v8 = [v6 previewImageDirectoryURL];
    id v9 = v8;
    id v30 = v6;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [MEMORY[0x1E4F837A0] defaultPreviewImageDirectoryURL];
    }
    CFDictionaryRef v12 = v10;

    uint64_t v13 = [v12 URLByAppendingPathComponent:v5 isDirectory:0];
    [v7 addObject:v13];
    id v14 = [(id)*MEMORY[0x1E4F44460] preferredFilenameExtension];
    v38[0] = v14;
    uint64_t v15 = [(id)*MEMORY[0x1E4F44410] preferredFilenameExtension];
    v38[1] = v15;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = v16;
    uint64_t v17 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v32 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v34 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          id v21 = [v5 stringByAppendingPathExtension:v20];
          id v22 = [v12 URLByAppendingPathComponent:v21 isDirectory:0];

          [v7 addObject:v22];
          id v23 = [v12 URLByAppendingPathComponent:v21 isDirectory:0];
          id v24 = [v23 URLByAppendingPathExtension:@"encrypted"];

          [v7 addObject:v24];
          id v25 = [v5 stringByAppendingString:@"-oriented"];
          BOOL v26 = [v25 stringByAppendingPathExtension:v20];

          id v27 = [v12 URLByAppendingPathComponent:v26 isDirectory:0];

          [v7 addObject:v27];
          uint64_t v13 = [v12 URLByAppendingPathComponent:v5 isDirectory:1];

          [v7 addObject:v13];
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v18);
    }

    id v6 = v30;
  }
  else
  {
    uint64_t v11 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      +[ICAttachmentPreviewImage previewImageURLsForIdentifier:account:](v11);
    }

    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (BOOL)shouldSyncToCloud
{
  v2 = self;
  BOOL v3 = [(ICAttachmentPreviewImage *)self attachment];
  id v4 = [v3 attachmentModel];
  LOBYTE(v2) = [v4 shouldSyncPreviewImageToCloud:v2];

  return (char)v2;
}

- (id)ic_loggingValues
{
  v12.receiver = self;
  v12.super_class = (Class)ICAttachmentPreviewImage;
  BOOL v3 = [(ICCloudSyncingObject *)&v12 ic_loggingValues];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [(ICAttachmentPreviewImage *)self managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__ICAttachmentPreviewImage_ic_loggingValues__block_invoke;
  v9[3] = &unk_1E64A4218;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = self;
  [v5 performBlockAndWait:v9];

  id v7 = v6;
  return v7;
}

void __44__ICAttachmentPreviewImage_ic_loggingValues__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  [*(id *)(a1 + 40) scale];
  BOOL v3 = objc_msgSend(v2, "numberWithDouble:");
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:@"scale"];

  id v4 = (void *)MEMORY[0x1E4F28ED0];
  [*(id *)(a1 + 40) width];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"width"];

  id v6 = (void *)MEMORY[0x1E4F28ED0];
  [*(id *)(a1 + 40) height];
  id v7 = objc_msgSend(v6, "numberWithDouble:");
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:@"height"];

  char v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithShort:", objc_msgSend(*(id *)(a1 + 40), "appearanceType"));
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:@"appearanceType"];

  uint64_t v9 = [*(id *)(a1 + 40) modifiedDate];
  id v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = (__CFString *)v9;
  }
  else {
    uint64_t v11 = @"nil";
  }
  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:@"modifiedDate"];

  id v15 = [*(id *)(a1 + 40) attachment];
  uint64_t v12 = [v15 identifier];
  uint64_t v13 = (void *)v12;
  if (v12) {
    id v14 = (__CFString *)v12;
  }
  else {
    id v14 = &stru_1F1F2FFF8;
  }
  [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:@"attachment"];
}

- (int64_t)minimumSupportedNotesVersion
{
  return 4 * ([(ICAttachmentPreviewImage *)self appearanceType] != 0);
}

- (void)updateFlagToExcludeFromCloudBackup
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(ICAttachmentPreviewImage *)self urls];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "ic_updateFlagToExcludeFromBackup:", 1);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)needsToBePushedToCloud
{
  return 0;
}

- (BOOL)needsToBeDeletedFromCloud
{
  return 0;
}

- (BOOL)needsToBeFetchedFromCloud
{
  return 0;
}

- (BOOL)needsInitialFetchFromCloud
{
  return 0;
}

- (void)deleteFromLocalDatabase
{
  id v3 = [(ICAttachmentPreviewImage *)self managedObjectContext];
  [v3 deleteObject:self];
}

- (id)cloudAccount
{
  v2 = [(ICAttachmentPreviewImage *)self attachment];
  id v3 = [v2 cloudAccount];

  return v3;
}

- (id)cryptoStrategyProtocol
{
  return &unk_1F1F84F00;
}

- (id)decryptedImageData
{
  v2 = [(ICCloudSyncingObject *)self cryptoStrategy];
  id v3 = [v2 decryptedImageData];

  return v3;
}

- (id)primaryEncryptedData
{
  v2 = (void *)MEMORY[0x1E4F1C9B8];
  id v3 = [(ICAttachmentPreviewImage *)self encryptedPreviewImageURL];
  uint64_t v4 = [v2 dataWithContentsOfURL:v3];

  return v4;
}

- (void)setPrimaryEncryptedData:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(ICAttachmentPreviewImage *)self generationManager];
  int v5 = [v4 beginGeneration];

  if (v5)
  {
    uint64_t v6 = [(ICAttachmentPreviewImage *)self encryptedPreviewImageURL];
    int v7 = [v10 writeToURL:v6 atomically:1];

    long long v8 = [(ICAttachmentPreviewImage *)self generationManager];
    long long v9 = v8;
    if (v7) {
      [v8 commitGeneration];
    }
    else {
      [v8 rollbackGeneration];
    }
  }
}

- (id)primaryEncryptedDataFromRecord:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = [v3 objectForKeyedSubscript:@"PreviewImages"];

  int v5 = ICDynamicCast();

  uint64_t v6 = [v5 firstObject];
  int v7 = [v6 fileURL];

  if (v7)
  {
    long long v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v7];
  }
  else
  {
    long long v8 = 0;
  }

  return v8;
}

- (void)clearDecryptedData
{
  id v3 = [(ICAttachmentPreviewImage *)self orientedPreviewImageURLWithoutCreating];
  if (v3) {
    [(ICAttachmentPreviewImage *)self removeItemAtURL:v3];
  }
  if (objc_opt_respondsToSelector()) {
    [(ICAttachmentPreviewImage *)self clearCachedImage];
  }
  if (objc_opt_respondsToSelector()) {
    [(ICAttachmentPreviewImage *)self clearCachedOrientedImage];
  }
  v4.receiver = self;
  v4.super_class = (Class)ICAttachmentPreviewImage;
  [(ICCloudSyncingObject *)&v4 clearDecryptedData];
}

- (ICAccount)placeholderAccount
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->placeholderAccount);
  return (ICAccount *)WeakRetained;
}

- (void)setPlaceholderAccount:(id)a3
{
}

- (unint64_t)imageID
{
  return self->_imageID;
}

- (void)setImageID:(unint64_t)a3
{
  self->_imageID = a3;
}

- (BOOL)suppressesFileDeletion
{
  return self->suppressesFileDeletion;
}

- (void)setSuppressesFileDeletion:(BOOL)a3
{
  self->suppressesFileDeletion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generationManager, 0);
  objc_storeStrong((id *)&self->_fileQueue, 0);
  objc_destroyWeak((id *)&self->placeholderAccount);
}

+ (id)newAttachmentPreviewImageWithIdentifier:(id)a3 attachment:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = [v6 managedObjectContext];
  long long v9 = (void *)[a1 newObjectWithIdentifier:v7 context:v8];

  [v9 setAttachment:v6];
  id v10 = [v6 note];

  uint64_t v11 = [v10 account];
  uint64_t v12 = [v11 persistentStore];
  [v9 assignToPersistentStore:v12];

  return v9;
}

+ (void)purgeAllAttachmentPreviewImagesInContext:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v5 = objc_msgSend(a1, "allAttachmentPreviewImagesInContext:", v4, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = [v10 attachment];
        [v11 removePreviewImagesObject:v10];

        uint64_t v12 = [v10 attachment];
        [v12 setPreviewUpdateDate:0];

        [v4 deleteObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  +[ICAttachment enumerateAttachmentsInContext:v4 batchSize:5 visibleOnly:0 saveAfterBatch:1 usingBlock:&__block_literal_global_347];
}

void __81__ICAttachmentPreviewImage_Management__purgeAllAttachmentPreviewImagesInContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setPreviewUpdateDate:0];
  objc_msgSend(v2, "ic_postNotificationOnMainThreadWithName:", @"ICAttachmentPreviewImagesDidUpdateNotification");
}

+ (id)attachmentPreviewImageWithIdentifier:(id)a3 inContext:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  uint64_t v8 = [v6 predicateWithFormat:@"%K == %@", @"identifier", a3];
  long long v9 = [a1 attachmentPreviewImagesMatchingPredicate:v8 inContext:v7];

  id v10 = [v9 firstObject];

  return v10;
}

+ (id)attachmentPreviewImageIdentifiersForAccount:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  int v5 = [v3 set];
  uint64_t v6 = [v4 managedObjectContext];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"ICAttachmentPreviewImage"];
  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"attachment.note.account == %@", v4];

  [v7 setPredicate:v8];
  [v7 setResultType:2];
  [v7 setPropertiesToFetch:&unk_1F1F62D78];
  id v14 = 0;
  long long v9 = [v6 executeFetchRequest:v7 error:&v14];
  id v10 = v14;
  if (v10)
  {
    uint64_t v11 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[ICAttachmentPreviewImage(Management) attachmentPreviewImageIdentifiersForAccount:]();
    }
  }
  else
  {
    uint64_t v11 = [v9 valueForKey:@"identifier"];
    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];

      int v5 = (void *)v12;
    }
  }

  return v5;
}

+ (id)allAttachmentPreviewImagesInContext:(id)a3
{
  return (id)[a1 attachmentPreviewImagesMatchingPredicate:0 inContext:a3];
}

+ (void)enumerateAttachmentPreviewImagesInContext:(id)a3 batchSize:(unint64_t)a4 saveAfterBatch:(BOOL)a5 usingBlock:(id)a6
{
}

+ (void)deleteStrandedAttachmentPreviewImagesInContext:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"attachment == nil"];
  v20[0] = v6;
  id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == NO", @"markedForDeletion");
  v20[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  long long v9 = [v5 andPredicateWithSubpredicates:v8];

  id v10 = [a1 attachmentPreviewImagesMatchingPredicate:v9 inContext:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) markForDeletion];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)accountWillChangeToAccount:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_DEBUG, "Preview image source and destination account are the same %@", v1, 0xCu);
}

void __71__ICAttachmentPreviewImage_setImageData_withSize_scale_appearanceType___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = [a2 path];
  int v7 = 138412546;
  uint64_t v8 = a1;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_9(&dword_1C3A61000, a3, v6, "Error:(%@) retriving attributes of file at path(%@)", (uint8_t *)&v7);
}

void __71__ICAttachmentPreviewImage_setImageData_withSize_scale_appearanceType___block_invoke_cold_2(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  OUTLINED_FUNCTION_1_9(&dword_1C3A61000, a3, (uint64_t)a3, "Error writing preview image to disk for %@: %@", (uint8_t *)&v4);
}

void __71__ICAttachmentPreviewImage_setImageData_withSize_scale_appearanceType___block_invoke_cold_3()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[ICAttachmentPreviewImage setImageData:withSize:scale:appearanceType:]_block_invoke";
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_9(&dword_1C3A61000, v0, v1, "%s -- Failed to create directory with error %@.", (uint8_t *)&v2);
}

void __63__ICAttachmentPreviewImage_setScaledImageFromImageSrc_typeUTI___block_invoke_cold_2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[ICAttachmentPreviewImage setScaledImageFromImageSrc:typeUTI:]_block_invoke";
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_9(&dword_1C3A61000, v0, v1, "%s -- Failed to create directory with error %@.", (uint8_t *)&v2);
}

- (void)containerAccount
{
  uint64_t v3 = [a1 identifier];
  uint64_t v4 = [a2 identifier];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v5, v6, "Couldn't find account for media %@, using default account %@ for container directory.", v7, v8, v9, v10, 2u);
}

- (void)previewImageURL
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Cannot remove preview image fallback {url: %@}", v2, v3, v4, v5, v6);
}

+ (void)previewImageURLsForIdentifier:(os_log_t)log account:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Trying to get preview image URLs with a nil identifier", v1, 2u);
}

@end