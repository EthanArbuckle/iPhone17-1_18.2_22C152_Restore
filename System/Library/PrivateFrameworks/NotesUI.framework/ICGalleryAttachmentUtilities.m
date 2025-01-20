@interface ICGalleryAttachmentUtilities
+ (CGSize)sizeOfSubAttachment:(id)a3 forHeight:(double)a4;
+ (CGSize)sizeOfViewForAttachment:(id)a3 textViewContentWidth:(double)a4;
+ (double)requiredWidthForAttachment:(id)a3 viewHeight:(double)a4 maxWidth:(double)a5;
+ (id)createAndAddSubAttachmentsToGalleryAttachment:(id)a3 fromDocuments:(id)a4 imageCache:(id)a5 context:(id)a6;
+ (id)createSubAttachmentFromDocument:(id)a3 imageCache:(id)a4 galleryAttachment:(id)a5;
+ (id)imageForSubAttachment:(id)a3;
+ (id)imageForSubAttachment:(id)a3 allowCached:(BOOL)a4;
+ (id)imageForSubAttachment:(id)a3 rotateForMacImageGallery:(BOOL)a4 allowCached:(BOOL)a5;
@end

@implementation ICGalleryAttachmentUtilities

+ (id)createSubAttachmentFromDocument:(id)a3 imageCache:(id)a4 galleryAttachment:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [v9 dataCryptorDelegate];
  v11 = [v7 fullImageUUID];
  v12 = [v9 getImageURL:v11 async:0];

  if (!v12)
  {
    v13 = 0;
    goto LABEL_16;
  }
  if ([v8 isPasswordProtected] && v10)
  {
    v13 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v12];
    if (!v13) {
      goto LABEL_10;
    }
    v14 = [v7 fullImageUUID];
    v15 = [v10 decryptEncryptedData:v13 identifier:v14];

    if (!v15)
    {
      v13 = 0;
      goto LABEL_16;
    }
    v16 = [v8 note];
    v17 = [(id)*MEMORY[0x1E4F44400] identifier];
    v18 = [v12 lastPathComponent];
    v13 = [v16 addAttachmentWithUTI:v17 data:v15 filename:v18 updateFileBasedAttributes:0 analytics:0 regulatoryLogging:0];
  }
  else
  {
    v15 = [v8 note];
    v13 = [v15 addAttachmentWithFileURL:v12 updateFileBasedAttributes:0 analytics:0];
  }

LABEL_10:
  if (v13)
  {
    [v13 setParentAttachment:v8];
    objc_msgSend(v13, "setOrientation:", (__int16)objc_msgSend(v7, "currentOrientation"));
    if ([v7 hasFilter]) {
      objc_msgSend(v13, "setImageFilterType:", objc_msgSend(v7, "currentFilter"));
    }
    v19 = [v7 imageQuad];

    if (v19)
    {
      v20 = [v7 imageQuad];
      [v13 setCroppingQuad:v20];
    }
    v21 = [v7 markupModelData];
    [v13 setMarkupModelData:v21];

    v22 = [v13 attachmentModel];
    [v22 updateFileBasedAttributes];

    v23 = [v13 identifier];
    [v7 setScanDataDelegateIdentifier:v23];
  }
LABEL_16:

  return v13;
}

+ (id)createAndAddSubAttachmentsToGalleryAttachment:(id)a3 fromDocuments:(id)a4 imageCache:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v13)
  {
    v14 = [MEMORY[0x1E4F83428] sharedContext];
    id v13 = [v14 snapshotManagedObjectContext];
  }
  v15 = [v10 objectID];
  v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  v29 = __111__ICGalleryAttachmentUtilities_createAndAddSubAttachmentsToGalleryAttachment_fromDocuments_imageCache_context___block_invoke;
  v30 = &unk_1E5FDBF70;
  id v31 = v13;
  id v32 = v15;
  id v17 = v11;
  id v36 = a1;
  id v33 = v17;
  id v34 = v12;
  id v18 = v16;
  id v35 = v18;
  id v19 = v12;
  id v20 = v15;
  id v21 = v13;
  [v21 performBlockAndWait:&v27];
  uint64_t v22 = objc_msgSend(v18, "count", v27, v28, v29, v30);
  if (v22 != [v17 count])
  {
    v23 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      +[ICGalleryAttachmentUtilities createAndAddSubAttachmentsToGalleryAttachment:fromDocuments:imageCache:context:](v17, v18, v23);
    }
  }
  v24 = v35;
  id v25 = v18;

  return v25;
}

void __111__ICGalleryAttachmentUtilities_createAndAddSubAttachmentsToGalleryAttachment_fromDocuments_imageCache_context___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) existingObjectWithID:*(void *)(a1 + 40) error:0];
  if (v2)
  {
    objc_opt_class();
    v3 = [v2 attachmentModel];
    v26 = ICCheckedDynamicCast();

    id v25 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v4 = *(id *)(a1 + 48);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v32;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v32 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v31 + 1) + 8 * v8);
          id v10 = (void *)MEMORY[0x1B3E9ED80]();
          id v11 = [*(id *)(a1 + 72) createSubAttachmentFromDocument:v9 imageCache:*(void *)(a1 + 56) galleryAttachment:v2];
          id v12 = v11;
          if (v11)
          {
            [v11 identifier];
            v14 = id v13 = v2;
            [v9 setScanDataDelegateIdentifier:v14];

            [v25 addObject:v12];
            v15 = *(void **)(a1 + 64);
            v16 = [v12 identifier];
            [v15 addObject:v16];

            v2 = v13;
            [v26 addSubAttachment:v12];
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v6);
    }

    [v2 saveMergeableDataIfNeeded];
    [v2 updateChangeCountWithReason:@"Add gallery page"];
    [v2 attachmentDidChange];
    id v17 = (id)objc_msgSend(v2, "ic_postNotificationOnMainThreadAfterSaveWithName:", *MEMORY[0x1E4F83010]);
    objc_msgSend(*(id *)(a1 + 32), "ic_saveWithLogDescription:", @"Add gallery page");
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v18 = v25;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8 * v22);
          v24 = +[ICAttachmentPreviewGenerator sharedGenerator];
          [v24 generatePreviewIfNeededForAttachment:v23];

          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v20);
    }
  }
}

+ (id)imageForSubAttachment:(id)a3
{
  return (id)[a1 imageForSubAttachment:a3 allowCached:1];
}

+ (id)imageForSubAttachment:(id)a3 allowCached:(BOOL)a4
{
  return (id)[a1 imageForSubAttachment:a3 rotateForMacImageGallery:0 allowCached:a4];
}

+ (id)imageForSubAttachment:(id)a3 rotateForMacImageGallery:(BOOL)a4 allowCached:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  [v7 sizeWidth];
  double v9 = v8;
  [v7 sizeHeight];
  if (v9 <= 0.0 || (double v11 = v10, v10 <= 0.0))
  {
    uint64_t v19 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      +[ICGalleryAttachmentUtilities imageForSubAttachment:rotateForMacImageGallery:allowCached:](v7, v19);
    }

    id v18 = 0;
  }
  else
  {
    id v12 = objc_msgSend(v7, "attachmentPreviewImageWithMinSize:scale:", v9, v10, 1.0);
    id v13 = v12;
    if (!v5) {
      goto LABEL_14;
    }
    [v12 width];
    double v15 = v14;
    [v13 height];
    if (v15 >= v16) {
      double v16 = v15;
    }
    double v17 = v9 >= v11 ? v9 : v11;
    if (vabdd_f64(v16, v17) < 0.00999999978)
    {
      id v18 = [v13 orientedImage];
    }
    else
    {
LABEL_14:
      uint64_t v20 = [v7 media];
      int v38 = [v7 imageFilterType];
      int v21 = [v7 orientation];
      uint64_t v22 = [v7 markupModelData];
      uint64_t v23 = [v7 croppingQuad];
      if ([v7 isPasswordProtected])
      {
        v24 = [v20 decryptedData];
        uint64_t v25 = [objc_alloc(MEMORY[0x1E4FB1818]) initWithData:v24];
      }
      else
      {
        v26 = (void *)MEMORY[0x1E4FB1818];
        v24 = [v20 mediaURL];
        uint64_t v25 = objc_msgSend(v26, "ic_imageWithContentsOfURL:", v24);
      }
      id v18 = (void *)v25;

      if (v18 && v23)
      {
        uint64_t v27 = [MEMORY[0x1E4F45E08] perspectiveCorrectedImageFromImage:v18 normalizedImageQuad:v23];

        id v18 = (void *)v27;
      }
      long long v28 = v22;
      if (v18)
      {
        if (!(v21 | v38)) {
          goto LABEL_39;
        }
        uint64_t v29 = 2;
        uint64_t v30 = 3;
        if (v21 != 2) {
          uint64_t v30 = v21;
        }
        if (v21 != 3) {
          uint64_t v29 = v30;
        }
        uint64_t v31 = v6 ? v29 : v21;
        uint64_t v32 = objc_msgSend(MEMORY[0x1E4F45E08], "filteredImage:orientation:imageFilterType:", v18, v31);

        id v18 = (void *)v32;
        if (v32)
        {
LABEL_39:
          if ([v22 length])
          {
            long long v33 = [MEMORY[0x1E4F45E08] imageWithRGBColorspaceFromImage:v18];

            long long v34 = objc_msgSend(v33, "ic_JPEGData");
            id v35 = (void *)MEMORY[0x1E4FB1818];
            id v36 = [MEMORY[0x1E4F83400] imageDataWithMarkupModelData:v28 sourceImageData:v34];
            id v18 = objc_msgSend(v35, "ic_imageWithData:", v36);
          }
        }
      }
    }
  }

  return v18;
}

+ (CGSize)sizeOfViewForAttachment:(id)a3 textViewContentWidth:(double)a4
{
  [a1 requiredWidthForAttachment:a3 viewHeight:372.0 maxWidth:a4];
  if (v5 > a4) {
    double v5 = a4;
  }
  double v6 = 372.0;
  result.height = v6;
  result.width = v5;
  return result;
}

+ (double)requiredWidthForAttachment:(id)a3 viewHeight:(double)a4 maxWidth:(double)a5
{
  id v8 = a3;
  uint64_t v15 = 0;
  double v16 = (double *)&v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0x4028000000000000;
  objc_opt_class();
  double v9 = [v8 attachmentModel];
  double v10 = ICDynamicCast();
  double v11 = a4 + -28.0 + -24.0;

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__ICGalleryAttachmentUtilities_requiredWidthForAttachment_viewHeight_maxWidth___block_invoke;
  v14[3] = &unk_1E5FDBF98;
  v14[4] = &v15;
  v14[5] = a1;
  *(double *)&v14[6] = v11;
  *(double *)&v14[7] = a5;
  [v10 enumerateSubAttachmentsWithBlock:v14];
  double v12 = v16[3];
  if (v12 < 50.0)
  {
    v16[3] = v11;
    double v12 = v11;
  }

  _Block_object_dispose(&v15, 8);
  return v12;
}

uint64_t __79__ICGalleryAttachmentUtilities_requiredWidthForAttachment_viewHeight_maxWidth___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [*(id *)(a1 + 40) sizeOfSubAttachment:a2 forHeight:*(double *)(a1 + 48)];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ceil(v8)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24)
                                                              + 12.0;
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  double v10 = *(double *)(a1 + 56);
  if (*(double *)(v9 + 24) > v10)
  {
    *(double *)(v9 + 24) = v10;
    *a5 = 1;
  }
  return result;
}

+ (CGSize)sizeOfSubAttachment:(id)a3 forHeight:(double)a4
{
  id v5 = a3;
  [v5 sizeWidth];
  [v5 sizeHeight];

  TSDMultiplySizeScalar();
  if (v6 >= a4 * 1.8) {
    double v6 = a4 * 1.8;
  }
  if (v6 < a4 * 0.5) {
    double v6 = a4 * 0.5;
  }
  double v7 = a4;
  result.height = v7;
  result.width = v6;
  return result;
}

+ (void)createAndAddSubAttachmentsToGalleryAttachment:(NSObject *)a3 fromDocuments:imageCache:context:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 134218240;
  uint64_t v6 = [a1 count];
  __int16 v7 = 2048;
  uint64_t v8 = [a2 count];
  _os_log_error_impl(&dword_1B08EB000, a3, OS_LOG_TYPE_ERROR, "Needed to create %lu sub attachments but only created %lu.", (uint8_t *)&v5, 0x16u);
}

+ (void)imageForSubAttachment:(void *)a1 rotateForMacImageGallery:(NSObject *)a2 allowCached:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 shortLoggingDescription];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_debug_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_DEBUG, "Unable to find a size for attachment: %@", (uint8_t *)&v4, 0xCu);
}

@end