@interface ICAttachment
@end

@implementation ICAttachment

uint64_t __68__ICAttachment_UI__loadImage_aboutToLoadHandler_forceFullSizeImage___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) media];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) imageCacheKey];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *(_WORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) attachmentType];
  uint64_t result = [*(id *)(a1 + 32) isUnsupportedOnCurrentPlatform];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
  return result;
}

uint64_t __46__ICAttachment_UI__imageLoadingOperationQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)imageLoadingOperationQueue_imageLoadingOperationQueue;
  imageLoadingOperationQueue_imageLoadingOperationQueue = (uint64_t)v0;

  [(id)imageLoadingOperationQueue_imageLoadingOperationQueue setName:@"com.apple.notes.attachment-image-loading-queue"];
  uint64_t v2 = (void *)imageLoadingOperationQueue_imageLoadingOperationQueue;
  return [v2 setMaxConcurrentOperationCount:2];
}

uint64_t __30__ICAttachment_UI__imageCache__block_invoke()
{
  imageCache_imageCache_2 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F83718]);
  return MEMORY[0x1F41817F8]();
}

void __51__ICAttachment_PDFGalleryVersion__docCamPDFVersion__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) modificationDate];
  [v3 timeIntervalSince1970];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (uint64_t)v2;
}

void __61__ICAttachment_SearchIndexable_UI__fileURLForTypeIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v2 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __61__ICAttachment_SearchIndexable_UI__fileURLForTypeIdentifier___block_invoke_cold_1(a1);
  }

  id v3 = [*(id *)(a1 + 40) attachmentModel];
  uint64_t v4 = [v3 fileURLForTypeIdentifier:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  v7 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = [*(id *)(a1 + 40) shortLoggingDescription];
    int v11 = 138412802;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    v16 = v10;
    _os_log_debug_impl(&dword_1B08EB000, v7, OS_LOG_TYPE_DEBUG, "Got file URL (%@) for %@ %@", (uint8_t *)&v11, 0x20u);
  }
}

void __58__ICAttachment_SearchIndexable_UI__dataForTypeIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v2 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__ICAttachment_SearchIndexable_UI__dataForTypeIdentifier___block_invoke_cold_1(a1);
  }

  id v3 = [*(id *)(a1 + 40) attachmentModel];
  uint64_t v4 = [v3 dataForTypeIdentifier:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  v7 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length];
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = [*(id *)(a1 + 40) shortLoggingDescription];
    int v11 = 134218498;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    v16 = v10;
    _os_log_debug_impl(&dword_1B08EB000, v7, OS_LOG_TYPE_DEBUG, "Got %ld bytes for %@ %@", (uint8_t *)&v11, 0x20u);
  }
}

void __54__ICAttachment_LinkPresentation__retrieveLinkMetadata__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v2 = [WeakRetained linkPresentationArchivedMetadata];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if ([*(id *)(a1 + 32) attachmentType] == 2)
  {
    uint64_t v5 = [WeakRetained title];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void __54__ICAttachment_LinkPresentation__persistLinkMetadata___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setLinkPresentationArchivedMetadata:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  objc_msgSend(v2, "ic_save");
}

void __48__ICAttachment_LinkPresentation__metadataExists__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained linkPresentationArchivedMetadata];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2 != 0;
}

void __55__ICAttachment_LinkPresentation__requestRemoteMetadata__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained attachmentModel];
  [v1 generatePreviewsInOperation:0];
}

uint64_t __64__ICAttachment_LinkPresentation__requestFileMetadataIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) generatePreviewsInOperation:0];
}

uint64_t __60__ICAttachment_LinkPresentation__filePreviewGenerationQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.mobilenotes.filePreviewGenerationQueue", 0);
  filePreviewGenerationQueue_queue = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0);
}

uint64_t __59__ICAttachment_LinkPresentation__webPreviewGenerationQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.mobilenotes.webPreviewGenerationQueue", 0);
  webPreviewGenerationQueue_queue = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0);
}

uint64_t __59__ICAttachment_LinkPresentation__mapPreviewGenerationQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.mobilenotes.mapPreviewGenerationQueue", 0);
  mapPreviewGenerationQueue_queue = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0);
}

uint64_t __43__ICAttachment_UI__thumbnailOperationQueue__block_invoke()
{
  dispatch_queue_t v0 = objc_alloc_init(ICAttachmentThumbnailOperationQueue);
  v1 = (void *)thumbnailOperationQueue_thumbnailOperationQueue;
  thumbnailOperationQueue_thumbnailOperationQueue = (uint64_t)v0;

  [(id)thumbnailOperationQueue_thumbnailOperationQueue setName:@"com.apple.notes.attachment-thumbnail-queue"];
  id v2 = (void *)thumbnailOperationQueue_thumbnailOperationQueue;
  return [v2 setMaxConcurrentOperationCount:2];
}

void __25__ICAttachment_UI__image__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __68__ICAttachment_UI__loadImage_aboutToLoadHandler_forceFullSizeImage___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      id v4 = WeakRetained;
      [WeakRetained removeCompletionHandler:v3 cancelIfNoneLeft:1];
      id WeakRetained = v4;
    }
  }
}

void __36__ICAttachment_UI__attributedString__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v12 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v12 attachment];
    v10 = *(void **)(a1 + 32);

    if (v9 == v10)
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      *(void *)(v11 + 32) = a3;
      *(void *)(v11 + 40) = a4;
      *a5 = 1;
    }
  }
}

void __67__ICAttachment_UI__deviceInfosWithoutPreviewImagesFromDeviceInfos___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F83480] previewDeviceInfoForPreviewImage:a2];
  objc_msgSend(v2, "ic_removeNonNilObject:", v3);
}

void __152__ICAttachment_UI__fetchThumbnailImageWithMinSize_scale_appearanceInfo_cache_cacheKey_processingBlock_completionBlock_fallbackBlock_aboutToLoadHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) image];
  (*(void (**)(uint64_t, id, uint64_t, uint64_t, uint64_t))(v2 + 16))(v2, v3, [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) imageScaling], objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "showAsFileIcon"), objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "isMovie"));
}

void __101__ICAttachment_InlineAttachmentManagement_UI__filterInlineAttachmentsInTableColumnTextStorage_range___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) inlineAttachmentFromObject:v7 createIfNecessary:0];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      objc_opt_class();
      v10 = ICDynamicCast();
      if (!v10
        && +[ICTextAttachment textAttachmentIsContent:v7])
      {
        uint64_t v11 = +[ICInlineTextAttachment textAttachmentWithAttachment:v9];
        if (v11)
        {
          objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E4FB06B8], v11, a3, a4);
        }
        else
        {
          id v12 = os_log_create("com.apple.notes", "UI");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            __101__ICAttachment_InlineAttachmentManagement_UI__filterInlineAttachmentsInTableColumnTextStorage_range___block_invoke_cold_1(v9, a3, a4);
          }

          objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *MEMORY[0x1E4FB06B8], a3, a4);
        }
      }
      goto LABEL_14;
    }
    if ([(id)objc_opt_class() isInlineAttachment:v7])
    {
      uint64_t v9 = [*(id *)(a1 + 32) inlineAttachmentFromObject:v7 createIfNecessary:1];
      [v9 setNeedsInitialFetchFromCloud:1];
LABEL_14:
    }
  }
}

void __61__ICAttachment_SearchIndexable_UI__fileURLForTypeIdentifier___block_invoke_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 40) shortLoggingDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v2, v3, "Getting %@ file URL for %@", v4, v5, v6, v7, v8);
}

void __58__ICAttachment_SearchIndexable_UI__dataForTypeIdentifier___block_invoke_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 40) shortLoggingDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v2, v3, "Getting %@ data for %@", v4, v5, v6, v7, v8);
}

void __101__ICAttachment_InlineAttachmentManagement_UI__filterInlineAttachmentsInTableColumnTextStorage_range___block_invoke_cold_1(void *a1, NSUInteger a2, NSUInteger a3)
{
  uint64_t v5 = [a1 shortLoggingDescription];
  v13.location = a2;
  v13.length = a3;
  id v12 = NSStringFromRange(v13);
  OUTLINED_FUNCTION_3(&dword_1B08EB000, v6, v7, "Table: Found a token text attachment that we could not create a text attachment for: %@ at %@", v8, v9, v10, v11, 2u);
}

@end