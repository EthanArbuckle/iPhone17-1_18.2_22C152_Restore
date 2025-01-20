@interface ICAttachment(UI)
+ (id)imageCache;
+ (id)imageLoadingOperationQueue;
+ (id)thumbnailOperationQueue;
- (ICDocumentMergeController)documentMergeController;
- (id)activityItems;
- (id)attributedString;
- (id)cachedImage;
- (id)croppingQuad;
- (id)deviceInfosWithoutPreviewImagesFromDeviceInfos:()UI;
- (id)image;
- (id)imageCacheKey;
- (id)loadImage:()UI aboutToLoadHandler:forceFullSizeImage:;
- (id)modificationDateForSpeaking;
- (id)movieDurationForSpeaking;
- (id)pasteboardData;
- (id)unprocessedDocumentImage;
- (id)updateAttachmentPreviewImageWithImage:()UI scale:appearanceType:scaleWhenDrawing:metadata:sendNotification:;
- (uint64_t)fetchThumbnailImageWithMinSize:()UI scale:appearanceInfo:cache:cacheKey:processingBlock:completionBlock:fallbackBlock:aboutToLoadHandler:;
- (uint64_t)isUnsupportedOnCurrentPlatform;
- (uint64_t)loadImage:()UI;
- (uint64_t)notifyDocCamFrameworkAttachmentWasDeleted;
- (uint64_t)setCroppingQuad:()UI;
- (uint64_t)thumbnailImage:()UI minSize:scale:appearanceType:requireAppearance:imageScaling:showAsFileIcon:isMovie:movieDuration:;
- (uint64_t)thumbnailImage:()UI minSize:scale:imageScaling:showAsFileIcon:isMovie:movieDuration:;
- (uint64_t)updateAttachmentPreviewImageWithImage:()UI scale:scaleWhenDrawing:metadata:sendNotification:;
- (void)redactAuthorAttributionsToCurrentUser;
- (void)setCachedImage:()UI;
@end

@implementation ICAttachment(UI)

- (ICDocumentMergeController)documentMergeController
{
  objc_getAssociatedObject(a1, &documentMergeController_documentMergeControllerHandle_0);
  v2 = (ICDocumentMergeController *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(ICDocumentMergeController);
    v3 = [a1 note];
    v4 = [v3 documentMergeController];
    [(ICDocumentMergeController *)v2 setParentController:v4];

    objc_setAssociatedObject(a1, &documentMergeController_documentMergeControllerHandle_0, v2, (void *)1);
  }
  v5 = v2;

  return v5;
}

- (id)loadImage:()UI aboutToLoadHandler:forceFullSizeImage:
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  v7 = a3;
  v31 = a4;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__53;
  v59 = __Block_byref_object_dispose__53;
  id v60 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__53;
  v53 = __Block_byref_object_dispose__53;
  id v54 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  __int16 v48 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  v8 = [a1 managedObjectContext];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __68__ICAttachment_UI__loadImage_aboutToLoadHandler_forceFullSizeImage___block_invoke;
  v40[3] = &unk_1E5FDD410;
  v40[4] = a1;
  v40[5] = &v55;
  v40[6] = &v49;
  v40[7] = &v45;
  v40[8] = &v41;
  [v8 performBlockAndWait:v40];

  v9 = [(id)objc_opt_class() imageCache];
  v10 = [v9 objectForKey:v50[5]];

  if (v10 || !*((_WORD *)v46 + 12))
  {
    uint64_t v11 = 1;
    v12 = v10;
LABEL_3:
    ((void (**)(id, void *, uint64_t))v7)[2](v7, v12, v11);
    v13 = 0;
    goto LABEL_24;
  }
  if (!v56[5] && !*((unsigned char *)v42 + 24))
  {
    v12 = 0;
    uint64_t v11 = 0;
    goto LABEL_3;
  }
  if (v31) {
    v31[2]();
  }
  v29 = [(id)objc_opt_class() imageLoadingOperationQueue];
  [v29 setSuspended:1];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v14 = [v29 operations];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v61 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v37;
LABEL_11:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v37 != v16) {
        objc_enumerationMutation(v14);
      }
      v18 = *(void **)(*((void *)&v36 + 1) + 8 * v17);
      v19 = [v18 cacheKey];
      char v20 = [v19 isEqual:v50[5]];

      if (v20) {
        break;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v61 count:16];
        if (v15) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
    id v21 = v18;

    if (v21
      && ([v21 isFinished] & 1) == 0
      && ([v21 isExecuting] & 1) == 0
      && ![v21 isCancelled])
    {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_17:

    id v21 = 0;
  }
  v22 = [ICAttachmentImageLoadingOperation alloc];
  v23 = [(id)objc_opt_class() imageCache];
  uint64_t v24 = [(ICAttachmentImageLoadingOperation *)v22 initWithCache:v23 attachment:a1 attachmentType:*((__int16 *)v46 + 12) forceFullSizeImage:a5 completionHandler:0];

  [v29 addOperation:v24];
  id v21 = (id)v24;
LABEL_23:
  v25 = [v21 addCompletionHandler:v7];
  [v29 setSuspended:0];
  objc_initWeak(&location, v21);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__ICAttachment_UI__loadImage_aboutToLoadHandler_forceFullSizeImage___block_invoke_2;
  aBlock[3] = &unk_1E5FDD438;
  objc_copyWeak(&v34, &location);
  id v33 = v25;
  id v26 = v25;
  v13 = _Block_copy(aBlock);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

LABEL_24:
  v27 = _Block_copy(v13);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
  return v27;
}

+ (id)imageCache
{
  if (imageCache_onceToken_2 != -1) {
    dispatch_once(&imageCache_onceToken_2, &__block_literal_global_29_0);
  }
  v0 = (void *)imageCache_imageCache_2;
  return v0;
}

+ (id)imageLoadingOperationQueue
{
  if (imageLoadingOperationQueue_onceToken != -1) {
    dispatch_once(&imageLoadingOperationQueue_onceToken, &__block_literal_global_12_2);
  }
  v0 = (void *)imageLoadingOperationQueue_imageLoadingOperationQueue;
  return v0;
}

- (id)imageCacheKey
{
  v2 = [a1 media];
  v3 = [v2 identifier];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [a1 identifier];
  }
  v6 = v5;

  return v6;
}

- (uint64_t)isUnsupportedOnCurrentPlatform
{
  if ([a1 attachmentType] == 13
    && !+[ICSystemPaperTextAttachment isEnabled])
  {
    return 1;
  }
  return [a1 isUnsupported];
}

- (id)croppingQuad
{
  v2 = [a1 attachmentModel];
  int v3 = [v2 shouldCropImage];

  if (v3)
  {
    [a1 croppingQuadTopLeftX];
    double v5 = v4;
    [a1 croppingQuadTopLeftY];
    double v7 = v6;
    [a1 croppingQuadTopRightX];
    double v9 = v8;
    [a1 croppingQuadTopRightY];
    double v11 = v10;
    [a1 croppingQuadBottomLeftX];
    double v13 = v12;
    [a1 croppingQuadBottomLeftY];
    double v15 = v14;
    [a1 croppingQuadBottomRightX];
    double v17 = v16;
    [a1 croppingQuadBottomRightY];
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F45E10]), "initWithBottomLeft:bottomRight:topLeft:topRight:", v13, v15, v17, v18, v5, v7, v9, v11);
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

+ (id)thumbnailOperationQueue
{
  if (thumbnailOperationQueue_onceToken != -1) {
    dispatch_once(&thumbnailOperationQueue_onceToken, &__block_literal_global_64);
  }
  v0 = (void *)thumbnailOperationQueue_thumbnailOperationQueue;
  return v0;
}

- (id)image
{
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x3032000000;
  double v13 = __Block_byref_object_copy__53;
  double v14 = __Block_byref_object_dispose__53;
  id v15 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25__ICAttachment_UI__image__block_invoke;
  v7[3] = &unk_1E5FDD3E8;
  double v9 = &v10;
  int v3 = v2;
  double v8 = v3;
  id v4 = (id)[a1 loadImage:v7];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (id)unprocessedDocumentImage
{
  dispatch_semaphore_t v2 = [a1 parentAttachment];
  int v3 = [v2 attachmentType];

  if (v3 != 11)
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"parentIsGallery" functionName:"-[ICAttachment(UI) unprocessedDocumentImage]" simulateCrash:1 showAlert:0 format:@"Trying to get un-processed image from type that is not a gallery sub attachment"];
    uint64_t v10 = 0;
    goto LABEL_11;
  }
  id v4 = [a1 media];
  int v5 = [v4 isPasswordProtected];

  double v6 = [a1 media];
  double v7 = v6;
  if (!v5)
  {
    double v8 = [v6 mediaURL];

    if (v8)
    {
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_imageWithContentsOfURL:", v8);
      goto LABEL_8;
    }
LABEL_9:
    uint64_t v10 = 0;
    goto LABEL_10;
  }
  double v8 = [v6 decryptedData];

  if (!v8) {
    goto LABEL_9;
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_imageWithData:", v8);
LABEL_8:
  uint64_t v10 = (void *)v9;
LABEL_10:

LABEL_11:
  return v10;
}

- (uint64_t)setCroppingQuad:()UI
{
  id v4 = a3;
  [a1 setCachedImage:0];
  [a1 invalidateAttachmentPreviewImages];
  [v4 topLeft];
  objc_msgSend(a1, "setCroppingQuadTopLeftX:");
  [v4 topLeft];
  [a1 setCroppingQuadTopLeftY:v5];
  [v4 topRight];
  objc_msgSend(a1, "setCroppingQuadTopRightX:");
  [v4 topRight];
  [a1 setCroppingQuadTopRightY:v6];
  [v4 bottomLeft];
  objc_msgSend(a1, "setCroppingQuadBottomLeftX:");
  [v4 bottomLeft];
  [a1 setCroppingQuadBottomLeftY:v7];
  [v4 bottomRight];
  objc_msgSend(a1, "setCroppingQuadBottomRightX:");
  [v4 bottomRight];
  double v9 = v8;

  return [a1 setCroppingQuadBottomRightY:v9];
}

- (uint64_t)loadImage:()UI
{
  return [a1 loadImage:a3 aboutToLoadHandler:0 forceFullSizeImage:0];
}

- (id)cachedImage
{
  id v1 = a1;
  objc_sync_enter(v1);
  dispatch_semaphore_t v2 = [v1 imageCacheKey];
  if (v2)
  {
    int v3 = [(id)objc_opt_class() imageCache];
    id v4 = [v1 imageCacheKey];
    double v5 = [v3 objectForKey:v4];
  }
  else
  {
    double v5 = 0;
  }

  objc_sync_exit(v1);
  return v5;
}

- (void)setCachedImage:()UI
{
  id v8 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  double v5 = [v4 imageCacheKey];

  if (v5)
  {
    double v6 = [(id)objc_opt_class() imageCache];
    double v7 = [v4 imageCacheKey];
    if (v8) {
      [v6 setObject:v8 forKey:v7];
    }
    else {
      [v6 removeObjectForKey:v7];
    }
  }
  objc_sync_exit(v4);
}

- (id)attributedString
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3010000000;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v12 = &unk_1B0BF84BB;
  dispatch_semaphore_t v2 = [a1 note];
  int v3 = [v2 textStorage];

  uint64_t v4 = [v3 length];
  uint64_t v5 = *MEMORY[0x1E4FB06B8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__ICAttachment_UI__attributedString__block_invoke;
  v8[3] = &unk_1E5FDD460;
  v8[4] = a1;
  v8[5] = &v9;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v4, 0, v8);
  if (v10[5])
  {
    double v6 = objc_msgSend(v3, "ic_attributedSubstringFromRange:", v10[4]);
  }
  else
  {
    double v6 = 0;
  }

  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)pasteboardData
{
  dispatch_semaphore_t v2 = [a1 note];
  int v3 = [v2 textStorage];

  uint64_t v4 = [a1 note];
  objc_msgSend(v4, "filterAttachmentsInTextStorage:range:", v3, 0, objc_msgSend(v3, "length"));

  id v5 = objc_alloc(MEMORY[0x1E4F83350]);
  double v6 = [a1 identifier];
  double v7 = (void *)[v5 initWithObjectIdentifier:v6 forPasteboard:1];

  id v8 = [a1 attributedString];
  uint64_t v9 = [a1 managedObjectContext];
  uint64_t v10 = objc_msgSend(v8, "ic_serializeWithFlags:dataPersister:managedObjectContext:error:", 1, v7, v9, 0);

  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F83438]) initWithAttributedStringData:v10 dataPersister:v7];
  return v11;
}

- (id)activityItems
{
  id v1 = [a1 attachmentModel];
  dispatch_semaphore_t v2 = [v1 activityItems];

  return v2;
}

- (id)modificationDateForSpeaking
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  int v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v2 setLocale:v3];

  [v2 setDateStyle:3];
  [v2 setTimeStyle:0];
  uint64_t v4 = [a1 modificationDate];
  id v5 = [v2 stringFromDate:v4];

  return v5;
}

- (id)movieDurationForSpeaking
{
  [a1 duration];
  uint64_t v8 = (int)(v7 / 3600.0);
  int v9 = (int)v7 % 3600;
  uint64_t v10 = ((int)v7 % 60);
  if (v8)
  {
    uint64_t v11 = NSString;
    uint64_t v12 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"%d hours" value:@"%d hours" table:0 allowSiri:1];
    uint64_t v13 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v8);
  }
  else
  {
    uint64_t v13 = 0;
  }
  if ((v9 - 60) > 0xFFFFFF88)
  {
    double v17 = 0;
    if (v10) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v14 = ((__int16)((34953 * (__int16)v9) >> 16) >> 5)
        + (((v9 + ((-30583 * (__int16)v9) >> 16)) & 0x8000) >> 15);
    id v15 = NSString;
    double v16 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"%d minutes" value:@"%d minutes" table:0 allowSiri:1];
    double v17 = objc_msgSend(v15, "localizedStringWithFormat:", v16, v14);

    if (v10)
    {
LABEL_6:
      double v18 = NSString;
      v19 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"%d seconds" value:@"%d seconds" table:0 allowSiri:1];
      char v20 = objc_msgSend(v18, "localizedStringWithFormat:", v19, v10);

      goto LABEL_9;
    }
  }
  char v20 = 0;
LABEL_9:
  id v21 = __ICAccessibilityStringForVariables(0, v13, v1, v2, v3, v4, v5, v6, (uint64_t)v17);

  return v21;
}

- (id)deviceInfosWithoutPreviewImagesFromDeviceInfos:()UI
{
  id v4 = a3;
  uint64_t v5 = [a1 previewImages];
  uint64_t v6 = [v5 count];

  double v7 = v4;
  if (v6)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v4];
    int v9 = [a1 previewImages];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__ICAttachment_UI__deviceInfosWithoutPreviewImagesFromDeviceInfos___block_invoke;
    v12[3] = &unk_1E5FDD488;
    id v13 = v8;
    id v10 = v8;
    [v9 enumerateObjectsUsingBlock:v12];

    double v7 = [v10 allObjects];
  }
  return v7;
}

- (uint64_t)updateAttachmentPreviewImageWithImage:()UI scale:scaleWhenDrawing:metadata:sendNotification:
{
  return objc_msgSend(a1, "updateAttachmentPreviewImageWithImage:scale:appearanceType:scaleWhenDrawing:metadata:sendNotification:", a3, 0, a4, a5, a6);
}

- (id)updateAttachmentPreviewImageWithImage:()UI scale:appearanceType:scaleWhenDrawing:metadata:sendNotification:
{
  id v14 = a7;
  id v15 = a4;
  [v15 size];
  double v17 = v16;
  double v19 = v18;
  char v20 = objc_msgSend(v15, "ic_PNGData");

  id v21 = objc_msgSend(a1, "updateAttachmentPreviewImageWithImageData:size:scale:appearanceType:scaleWhenDrawing:metadata:sendNotification:", v20, a5, a6, v14, a8, v17, v19, a2);

  v22 = [v21 managedObjectContext];
  objc_msgSend(v22, "ic_saveWithLogDescription:", @"Saving preview image");

  return v21;
}

- (uint64_t)thumbnailImage:()UI minSize:scale:imageScaling:showAsFileIcon:isMovie:movieDuration:
{
  return objc_msgSend(a1, "thumbnailImage:minSize:scale:appearanceType:requireAppearance:imageScaling:showAsFileIcon:isMovie:movieDuration:", a3, 0, 0, a4, a5, a6, a7);
}

- (uint64_t)thumbnailImage:()UI minSize:scale:appearanceType:requireAppearance:imageScaling:showAsFileIcon:isMovie:movieDuration:
{
  *a6 = 0;
  *a9 = 0;
  *a10 = 0;
  *a11 = 0;
  uint64_t v22 = 0;
  if (([a1 markedForDeletion] & 1) == 0)
  {
    v23 = [a1 attachmentModel];
    int v24 = [v23 hasPreviews];

    if (v24)
    {
      v25 = objc_msgSend(a1, "attachmentPreviewImageWithMinSize:scale:appearanceType:requireAppearance:", a7, a8, a2, a3, a4);
      *a6 = [v25 orientedImage];
      *a9 = [v25 scaleWhenDrawing];

      uint64_t v22 = 1;
    }
    else
    {
      id v26 = [a1 media];
      v27 = [v26 mediaURL];

      if (v27)
      {
        v28 = [a1 attachmentModel];
        objc_msgSend(v28, "fileIconWithPreferredSize:", a2, a3);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        *a9 = 2;
        uint64_t v22 = 1;
        *a10 = 1;
      }
      else
      {
        uint64_t v22 = 0;
      }
    }
    v29 = (void *)MEMORY[0x1E4F832A0];
    v30 = [a1 typeUTI];
    LODWORD(v29) = [v29 typeUTIIsPlayableMovie:v30];

    if (v29)
    {
      *a11 = 1;
      [a1 duration];
      CMTimeMakeWithSeconds(&v33, v31, 1000000000);
      *a12 = v33;
    }
    else
    {
      *a11 = 0;
    }
  }
  return v22;
}

- (uint64_t)fetchThumbnailImageWithMinSize:()UI scale:appearanceInfo:cache:cacheKey:processingBlock:completionBlock:fallbackBlock:aboutToLoadHandler:
{
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  v27 = a12;
  int v28 = [a1 markedForDeletion];
  if ((v28 & 1) == 0)
  {
    id v34 = v21;
    v29 = [a1 attachmentModel];
    int v30 = [v29 needToGeneratePreviews];

    if (v30)
    {
      Float64 v31 = +[ICAttachmentPreviewGenerator sharedGenerator];
      [v31 generatePreviewIfNeededForAttachment:a1];
    }
    uint64_t v36 = 0;
    long long v37 = &v36;
    uint64_t v38 = 0x3032000000;
    long long v39 = __Block_byref_object_copy__53;
    v40 = __Block_byref_object_dispose__53;
    id v41 = [v22 thumbnailDataForKey:v23];
    if (v37[5])
    {
      id v35 = v25;
      performBlockOnMainThreadAndWait();
      v32 = v35;
    }
    else
    {
      if (v27) {
        v27[2](v27);
      }
      v32 = [(id)objc_opt_class() thumbnailOperationQueue];
      objc_msgSend(v32, "addOperationWithAttachment:size:scale:appearanceInfo:cache:cacheKey:processingBlock:completionBlock:fallbackBlock:", a1, v34, v22, v23, v24, v25, a2, a3, a4, v26);
    }

    _Block_object_dispose(&v36, 8);
    id v21 = v34;
  }

  return v28 ^ 1u;
}

- (uint64_t)notifyDocCamFrameworkAttachmentWasDeleted
{
  return [MEMORY[0x1E4F45E00] scanWasDeleted:a1];
}

- (void)redactAuthorAttributionsToCurrentUser
{
  v3.receiver = a1;
  v3.super_class = (Class)&off_1F0A2D790;
  objc_msgSendSuper2(&v3, sel_redactAuthorAttributionsToCurrentUser);
  uint64_t v2 = [a1 attachmentModel];
  [v2 redactAuthorAttributionsToCurrentUser];
}

@end