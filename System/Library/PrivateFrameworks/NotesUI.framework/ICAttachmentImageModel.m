@interface ICAttachmentImageModel
@end

@implementation ICAttachmentImageModel

void __72__ICAttachmentImageModel_PreviewGeneration__needToPostProcessAttachment__block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (+[ICAttachmentPreviewGenerator imageOCRGenerationEnabled])
  {
    int v2 = 1;
  }
  else if ([*(id *)(a1 + 32) isChildOfDocumentGallery])
  {
    int v2 = +[ICAttachmentPreviewGenerator docCamOCRGenerationEnabled];
  }
  else
  {
    int v2 = 0;
  }
  v3 = [*(id *)(a1 + 32) previewImages];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    char v10 = 0;
    LOBYTE(v2) = 0;
    goto LABEL_21;
  }
  uint64_t v5 = [*(id *)(a1 + 32) ocrSummary];
  if (v5)
  {
    v6 = (void *)v5;
    int v7 = [*(id *)(a1 + 32) ocrSummaryVersion];
    int v8 = (__int16)*MEMORY[0x1E4F82FF0];

    if (v7 < v8) {
      char v9 = v2;
    }
    else {
      char v9 = 0;
    }
    if ((v9 & 1) == 0)
    {
      LOBYTE(v2) = 0;
      goto LABEL_16;
    }
  }
  else if (!v2)
  {
    goto LABEL_16;
  }
  v11 = [*(id *)(a1 + 32) attachmentModel];
  LOBYTE(v2) = [v11 supportsOCR];

LABEL_16:
  uint64_t v12 = [*(id *)(a1 + 32) imageClassificationSummary];
  if (v12
    && (v13 = (void *)v12,
        int v14 = [*(id *)(a1 + 32) imageClassificationSummaryVersion],
        int v15 = (__int16)*MEMORY[0x1E4F82FE8],
        v13,
        v14 >= v15)
    || !+[ICAttachmentPreviewGenerator imageClassificationEnabled])
  {
    char v10 = 0;
  }
  else
  {
    v16 = [*(id *)(a1 + 32) attachmentModel];
    char v10 = [v16 supportsImageClassification];
  }
LABEL_21:
  v17 = [*(id *)(a1 + 32) attachmentModel];
  if ([v17 requiresPostProcessing]) {
    char v18 = v2 | v10;
  }
  else {
    char v18 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v18;

  v19 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    BOOL v20 = v4 != 0;
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    v23 = NSStringFromSelector(*(SEL *)(a1 + 56));
    v24 = [*(id *)(a1 + 32) identifier];
    int v25 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    v26 = [*(id *)(a1 + 32) ocrSummary];
    v27 = [*(id *)(a1 + 32) imageClassificationSummary];
    int v28 = 138413826;
    v29 = v22;
    __int16 v30 = 2112;
    v31 = v23;
    __int16 v32 = 2112;
    v33 = v24;
    __int16 v34 = 1024;
    int v35 = v25;
    __int16 v36 = 1024;
    BOOL v37 = v26 != 0;
    __int16 v38 = 1024;
    BOOL v39 = v27 != 0;
    __int16 v40 = 1024;
    BOOL v41 = v20;
    _os_log_debug_impl(&dword_1B08EB000, v19, OS_LOG_TYPE_DEBUG, "%@ %@ %@ return %d ocrSummary %d imageClassificationSummary %d hasPreviewImage %d", (uint8_t *)&v28, 0x38u);
  }
}

void __214__ICAttachmentImageModel_PreviewGeneration__generateFullSizePreviewWithAttachmentIdentifier_existingPreviewImage_markupModelData_imageOrientation_imageFilterType_mediaDecryptedData_mediaURL_mediaSize_croppingQuad___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) attachment];
  [v2 sizeWidth];
  double v4 = v3;
  uint64_t v5 = [*(id *)(a1 + 32) attachment];
  [v5 sizeHeight];
  double v7 = v6;

  if (*(double *)(a1 + 40) != v4 || *(double *)(a1 + 48) != v7)
  {
    char v9 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v15 = [*(id *)(a1 + 32) attachment];
      v16 = [v15 shortLoggingDescription];
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = *(void *)(a1 + 48);
      int v19 = 138413314;
      BOOL v20 = v16;
      __int16 v21 = 2048;
      double v22 = v4;
      __int16 v23 = 2048;
      double v24 = v7;
      __int16 v25 = 2048;
      uint64_t v26 = v17;
      __int16 v27 = 2048;
      uint64_t v28 = v18;
      _os_log_debug_impl(&dword_1B08EB000, v9, OS_LOG_TYPE_DEBUG, "Corrected cropped image size for %@ (%g %g => %g %g)", (uint8_t *)&v19, 0x34u);
    }
    double v10 = *(double *)(a1 + 40);
    v11 = [*(id *)(a1 + 32) attachment];
    [v11 setSizeWidth:v10];

    double v12 = *(double *)(a1 + 48);
    v13 = [*(id *)(a1 + 32) attachment];
    [v13 setSizeHeight:v12];

    int v14 = [*(id *)(a1 + 32) attachment];
    [v14 updateChangeCountWithReason:@"Generated full-size previews"];
  }
}

void __214__ICAttachmentImageModel_PreviewGeneration__generateFullSizePreviewWithAttachmentIdentifier_existingPreviewImage_markupModelData_imageOrientation_imageFilterType_mediaDecryptedData_mediaURL_mediaSize_croppingQuad___block_invoke_56(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) attachment];
  id v4 = [v2 updateAttachmentPreviewImageWithImageSrc:*(void *)(a1 + 48) maxDimension:0 scale:0 appearanceType:0 scaleWhenDrawing:0 metadata:*(double *)(a1 + 56) sendNotification:1.0];

  double v3 = v4;
  if (v4)
  {
    [*(id *)(a1 + 40) removeObject:v4];
    double v3 = v4;
  }
}

void __73__ICAttachmentImageModel_PreviewGeneration__generatePreviewsInOperation___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) attachment];
  uint64_t v3 = [v2 identifier];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if ([*(id *)(a1 + 32) needToGeneratePreviews])
  {
    double v6 = [*(id *)(a1 + 32) attachment];
    double v7 = [v6 parentAttachment];
    uint64_t v8 = [v7 attachmentModel];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    double v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    v11 = [*(id *)(a1 + 32) attachment];
    *(_WORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v11 imageFilterType];

    double v12 = [*(id *)(a1 + 32) attachment];
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = (int)[v12 orientation];

    v13 = [*(id *)(a1 + 32) attachment];
    id v42 = [v13 media];

    uint64_t v14 = [v42 identifier];
    uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
    v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    if ([v42 isPasswordProtected])
    {
      uint64_t v17 = [v42 decryptedData];
      uint64_t v18 = *(void *)(a1 + 80);
    }
    else
    {
      uint64_t v17 = [v42 mediaURL];
      uint64_t v18 = *(void *)(a1 + 88);
    }
    uint64_t v19 = *(void *)(v18 + 8);
    BOOL v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v17;

    __int16 v21 = [*(id *)(a1 + 32) attachment];
    double v22 = [v21 previewImages];
    uint64_t v23 = [v22 mutableCopy];
    uint64_t v24 = *(void *)(*(void *)(a1 + 96) + 8);
    __int16 v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;

    uint64_t v26 = [*(id *)(a1 + 32) attachment];
    uint64_t v27 = [v26 markupModelData];
    uint64_t v28 = *(void *)(*(void *)(a1 + 104) + 8);
    uint64_t v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;

    __int16 v30 = [*(id *)(a1 + 32) attachment];
    v31 = [v30 attachmentModel];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = [v31 needsFullSizePreview];

    __int16 v32 = [*(id *)(a1 + 32) attachment];
    [v32 sizeWidth];
    uint64_t v34 = v33;
    int v35 = [*(id *)(a1 + 32) attachment];
    [v35 sizeHeight];
    uint64_t v36 = *(void *)(*(void *)(a1 + 120) + 8);
    *(void *)(v36 + 32) = v34;
    *(void *)(v36 + 40) = v37;

    __int16 v38 = [*(id *)(a1 + 32) attachment];
    uint64_t v39 = [v38 croppingQuad];
    uint64_t v40 = *(void *)(*(void *)(a1 + 128) + 8);
    BOOL v41 = *(void **)(v40 + 40);
    *(void *)(v40 + 40) = v39;
  }
}

void __73__ICAttachmentImageModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_57(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) scale];
  double v3 = v2;
  uint64_t v4 = [*(id *)(a1 + 40) attachment];
  uint64_t v5 = [v4 updateAttachmentPreviewImageWithImageSrc:*(void *)(a1 + 80) maxDimension:0 scale:1 appearanceType:0 scaleWhenDrawing:0 metadata:*(double *)(a1 + 88) sendNotification:v3];

  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= [*(id *)(*(void *)(*(void *)(a1 + 56) + 8)+ 40) containsObject:v5];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) removeObject:v5];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    double v6 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      double v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      uint64_t v9 = NSStringFromSelector(*(SEL *)(a1 + 96));
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      uint64_t v11 = *(void *)(a1 + 88);
      int v12 = 138413314;
      v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      __int16 v18 = 2048;
      uint64_t v19 = v11;
      __int16 v20 = 2048;
      double v21 = v3;
      _os_log_debug_impl(&dword_1B08EB000, v6, OS_LOG_TYPE_DEBUG, "%@ %@ %@ preview generation failed for size: %.1f, scale %.1f", (uint8_t *)&v12, 0x34u);
    }
  }
}

void __73__ICAttachmentImageModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_58(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
  {
    double v2 = [*(id *)(a1 + 32) attachment];
    [v2 removePreviewImages:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v3 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
          uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "attachment", (void)v14);
          uint64_t v10 = [v9 managedObjectContext];
          [v10 deleteObject:v8];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v5);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "isCancelled", (void)v14) & 1) == 0)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
      int v12 = [*(id *)(a1 + 32) attachment];
      [v12 setPreviewUpdateDate:v11];

      v13 = [*(id *)(a1 + 32) attachment];
      [v13 updateChangeCountWithReason:@"Generated previews"];
    }
  }
}

void __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1B3E9ED80]();
  if (*(void *)(a1 + 32))
  {
    id v3 = (id *)(a1 + 40);
    [*(id *)(a1 + 40) sizeWidth];
    [*(id *)(a1 + 40) sizeHeight];
    TSDShrinkSizeToFitInSize();
    double v5 = v4;
    double v7 = v6;
    uint64_t v8 = os_log_create("com.apple.notes", "PreviewGeneration");
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v5 <= 0.0 || v7 <= 0.0)
    {
      if (v9) {
        __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke_cold_6(a1 + 40);
      }
      uint64_t v10 = v8;
      goto LABEL_34;
    }
    if (v9) {
      __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke_cold_5(a1 + 40);
    }

    uint64_t v10 = objc_msgSend(*v3, "attachmentPreviewImageWithMinSize:scale:", v5, v7, 1.0);
    uint64_t v11 = [v10 orientedPreviewImageURL];
    if (!v11)
    {
      int v12 = [*v3 media];
      uint64_t v11 = [v12 mediaURL];

      if (!v11)
      {
        v13 = os_log_create("com.apple.notes", "PreviewGeneration");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke_cold_2((uint64_t)v3);
        }
        uint64_t v11 = v13;
        goto LABEL_31;
      }
    }
    if ([*(id *)(a1 + 48) isCancelled])
    {
      v13 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke_cold_3((uint64_t)v3);
      }

      goto LABEL_31;
    }
    v13 = [MEMORY[0x1E4F1C9C8] date];
    long long v14 = (void *)MEMORY[0x1E4F83440];
    id v27 = 0;
    long long v15 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    long long v16 = [v14 ocrStringFromImageURL:v11 title:&v27 languages:v15];
    id v17 = v27;

    __int16 v18 = [MEMORY[0x1E4F1C9C8] date];
    [v18 timeIntervalSinceDate:v13];

    uint64_t v19 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke_cold_4((uint64_t)v3);
    }

    __int16 v20 = [*v3 ocrSummary];
    char v21 = [v20 isEqualToString:v16];

    if ((v21 & 1) == 0)
    {
      if (v16) {
        uint64_t v22 = v16;
      }
      else {
        uint64_t v22 = @" ";
      }
      [*v3 setOcrSummary:v22];
      [*v3 updateChangeCountWithReason:@"Generated OCR"];
    }
    if (v17)
    {
      uint64_t v23 = objc_msgSend(v17, "ic_trimmedString");
      if (![v23 length])
      {
LABEL_26:

        goto LABEL_27;
      }
      uint64_t v24 = [*v3 title];
      char v25 = [v24 isEqualToString:v17];

      if ((v25 & 1) == 0)
      {
        [*v3 setTitle:v17];
        uint64_t v23 = [*v3 parentAttachment];
        [v23 regenerateTitle];
        goto LABEL_26;
      }
    }
LABEL_27:
    uint64_t v26 = [*v3 managedObjectContext];
    objc_msgSend(v26, "ic_save");

LABEL_31:
    uint64_t v8 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke_cold_1((uint64_t)v3);
    }

LABEL_34:
  }
}

void __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke(id *a1)
{
  double v2 = (void *)MEMORY[0x1B3E9ED80]();
  if (a1[4])
  {
    id v3 = a1 + 5;
    [a1[5] sizeWidth];
    double v5 = v4;
    [a1[5] sizeHeight];
    double v7 = v6;
    uint64_t v8 = os_log_create("com.apple.notes", "PreviewGeneration");
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v5 <= 0.0 || v7 <= 0.0)
    {
      if (v9) {
        __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke_cold_6((uint64_t)(a1 + 5));
      }
      uint64_t v10 = v8;
      goto LABEL_29;
    }
    if (v9) {
      __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke_cold_5((uint64_t)(a1 + 5));
    }

    uint64_t v8 = objc_msgSend(*v3, "attachmentPreviewImageWithMinSize:scale:", v5, v7, 1.0);
    uint64_t v10 = [v8 orientedImage];
    if (v10)
    {
      if (([a1[6] isCancelled] & 1) == 0)
      {
        int v12 = [MEMORY[0x1E4F1C9C8] date];
        os_log_t v11 = [a1[4] classificationsForImage:v10];
        v13 = [MEMORY[0x1E4F1C9C8] date];
        [v13 timeIntervalSinceDate:v12];

        long long v14 = os_log_create("com.apple.notes", "PreviewGeneration");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke_cold_4((uint64_t)v3);
        }

        if (v11)
        {
          if ([v11 length]) {
            long long v15 = (__CFString *)v11;
          }
          else {
            long long v15 = @" ";
          }
          [*v3 setImageClassificationSummary:v15];
          if ([v11 rangeOfString:@"document" options:1] != 0x7FFFFFFFFFFFFFFFLL)
          {
            long long v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
            [v16 postNotificationName:*MEMORY[0x1E4F83008] object:*v3];
          }
        }
        else
        {
          +[ICAttachmentPreviewGenerator setImageClassificationTemporarilyDisabled:1];
        }
        [*v3 updateChangeCountWithReason:@"Classified image"];
        id v17 = [*v3 managedObjectContext];
        objc_msgSend(v17, "ic_save");

        goto LABEL_26;
      }
      os_log_t v11 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke_cold_3((uint64_t)v3);
      }
    }
    else
    {
      os_log_t v11 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke_cold_2((uint64_t)v3);
      }
    }
    int v12 = v11;
LABEL_26:

    __int16 v18 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke_cold_1((uint64_t)v3);
    }

LABEL_29:
  }
}

uint64_t __81__ICAttachmentImageModel_PreviewGeneration__labelsForClassificationObservations___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a3 + 32))
  {
    if (!*(unsigned char *)(a3 + 33))
    {
      uint64_t v4 = *(unsigned int *)(a3 + 8);
      if (([*(id *)(a1 + 32) containsIndex:v4] & 1) == 0)
      {
        double v5 = *(void **)(a1 + 40);
        double v6 = PFSceneTaxonomyNodeLocalizedLabel();
        objc_msgSend(v5, "ic_addNonNilObject:", v6);

        double v7 = PFSceneTaxonomyNodeLocalizedSynonyms();
        if ([v7 count]) {
          objc_msgSend(*(id *)(a1 + 40), "ic_addObjectsFromNonNilArray:", v7);
        }
        [*(id *)(a1 + 32) addIndex:v4];
      }
    }
  }
  return 0;
}

void __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke_cold_1(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_1_1(a1) identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Ended OCR Generation: %@", v4, v5, v6, v7, v8);
}

void __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke_cold_2(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_1_1(a1) identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Ended OCR Generation Early due to no image url for Attachment: %@", v4, v5, v6, v7, v8);
}

void __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke_cold_3(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_1_1(a1) identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Ended OCR Generation Early due to operation cancelled: %@", v4, v5, v6, v7, v8);
}

void __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke_cold_4(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_1_1(a1) identifier];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v2, v3, "Completed OCR Generation for Attachment %@. %0.3fs", v4, v5, v6, v7, v8);
}

void __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke_cold_5(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_1_1(a1) identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Beginning OCR Generation For Attachment: %@", v4, v5, v6, v7, v8);
}

void __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke_cold_6(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_1_1(a1) identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Ended OCR Generation Early invalid media size: %@", v4, v5, v6, v7, v8);
}

void __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke_cold_1(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_1_1(a1) identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Ended Image Classification: %@", v4, v5, v6, v7, v8);
}

void __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke_cold_2(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_1_1(a1) identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Ended Image Classification Early due to no image for Attachment: %@", v4, v5, v6, v7, v8);
}

void __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke_cold_3(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_1_1(a1) identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Image Classification operation cancelled for: %@", v4, v5, v6, v7, v8);
}

void __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke_cold_4(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_1_1(a1) identifier];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v2, v3, "Completed Image Classification for Attachment %@. %0.3fs", v4, v5, v6, v7, v8);
}

void __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke_cold_5(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_1_1(a1) identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Beginning Image Classification For Attachment: %@", v4, v5, v6, v7, v8);
}

void __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke_cold_6(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_1_1(a1) identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Ended Image Classification Early invalid media size: %@", v4, v5, v6, v7, v8);
}

@end