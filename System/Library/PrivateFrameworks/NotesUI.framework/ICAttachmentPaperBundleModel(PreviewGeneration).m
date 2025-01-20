@interface ICAttachmentPaperBundleModel(PreviewGeneration)
+ (uint64_t)fallbackPDFGenerationEnabled;
+ (uint64_t)generateImagePreviewsForAttachment:()PreviewGeneration withFallbackPDFData:;
- (BOOL)generateFallbackPDF;
- (BOOL)needToGeneratePreviews;
- (uint64_t)generateFallbackPDFIfNecessary;
- (uint64_t)generatePreviewsDuringCloudActivity;
- (uint64_t)generatePreviewsInOperation:()PreviewGeneration;
- (void)generateFallbackPDF;
- (void)needToGeneratePreviews;
@end

@implementation ICAttachmentPaperBundleModel(PreviewGeneration)

- (uint64_t)generatePreviewsDuringCloudActivity
{
  return 0;
}

- (BOOL)needToGeneratePreviews
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ((ICInternalSettingsIsPDFsInNotesEnabled() & 1) == 0)
  {
    v12 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ICAttachmentPaperBundleModel(PreviewGeneration) needToGeneratePreviews](v12);
    }
    goto LABEL_11;
  }
  if (([(id)objc_opt_class() fallbackPDFGenerationEnabled] & 1) == 0)
  {
    v12 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ICAttachmentPaperBundleModel(PreviewGeneration) needToGeneratePreviews](v12);
    }
LABEL_11:
    BOOL v11 = 0;
    goto LABEL_12;
  }
  v4 = [a1 attachment];
  v5 = [v4 previewUpdateDate];

  if (v5)
  {
    v6 = [a1 attachment];
    v7 = [v6 previewUpdateDate];
    v8 = [a1 attachment];
    v9 = [v8 modificationDate];
    uint64_t v10 = [v7 compare:v9];
    BOOL v11 = v10 == -1;

    v12 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      BOOL v23 = v10 == -1;
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      v16 = NSStringFromSelector(a2);
      v17 = [a1 attachment];
      v18 = [v17 identifier];
      v19 = [a1 attachment];
      v20 = [v19 previewUpdateDate];
      v21 = [a1 attachment];
      v22 = [v21 modificationDate];
      *(_DWORD *)buf = 138413570;
      v25 = v15;
      __int16 v26 = 2112;
      v27 = v16;
      __int16 v28 = 2112;
      v29 = v18;
      __int16 v30 = 1024;
      BOOL v31 = v23;
      __int16 v32 = 2112;
      v33 = v20;
      __int16 v34 = 2112;
      v35 = v22;
      _os_log_debug_impl(&dword_1B08EB000, v12, OS_LOG_TYPE_DEBUG, "%@ %@ %@ return %d self.attachment.previewUpdateDate %@ self.attachment.modificationDate %@", buf, 0x3Au);
    }
  }
  else
  {
    v12 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      [(ICAttachmentPaperBundleModel(PreviewGeneration) *)a1 needToGeneratePreviews];
    }

    BOOL v11 = 1;
  }
LABEL_12:

  return v11;
}

+ (uint64_t)fallbackPDFGenerationEnabled
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  char v1 = objc_msgSend(v0, "ic_isAppExtension");

  if (v1) {
    return 0;
  }
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v2 = [v3 BOOLForKey:*MEMORY[0x1E4F830C8]] ^ 1;

  return v2;
}

- (uint64_t)generateFallbackPDFIfNecessary
{
  uint64_t result = [a1 needToGeneratePreviews];
  if (result)
  {
    return [a1 generateFallbackPDF];
  }
  return result;
}

- (BOOL)generateFallbackPDF
{
  uint64_t v2 = [a1 attachment];
  v3 = [v2 managedObjectContext];
  v4 = [MEMORY[0x1E4F832C8] generateFallbackPDFDataForAttachment:v2];
  if ([v4 length])
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__ICAttachmentPaperBundleModel_PreviewGeneration__generateFallbackPDF__block_invoke;
    v8[3] = &unk_1E5FD94F8;
    v12 = &v13;
    id v9 = v2;
    id v10 = v4;
    BOOL v11 = a1;
    [v3 performBlockAndWait:v8];
    BOOL v5 = *((unsigned char *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ICAttachmentPaperBundleModel(PreviewGeneration) generateFallbackPDF](v6);
    }

    BOOL v5 = 0;
  }

  return v5;
}

- (uint64_t)generatePreviewsInOperation:()PreviewGeneration
{
  id v4 = a3;
  if (+[ICSystemPaperTextAttachment isEnabled])
  {
    uint64_t v15 = 0;
    char v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__68;
    v19 = __Block_byref_object_dispose__68;
    id v20 = 0;
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy__68;
    v13[4] = __Block_byref_object_dispose__68;
    id v14 = 0;
    BOOL v5 = [a1 attachment];
    v6 = [v5 managedObjectContext];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __79__ICAttachmentPaperBundleModel_PreviewGeneration__generatePreviewsInOperation___block_invoke;
    v12[3] = &unk_1E5FD9248;
    v12[4] = a1;
    v12[5] = &v15;
    v12[6] = v13;
    [v6 performBlockAndWait:v12];

    if (v16[5]
      && ([MEMORY[0x1E4F28CB8] defaultManager],
          v7 = objc_claimAutoreleasedReturnValue(),
          [(id)v16[5] path],
          v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v7 fileExistsAtPath:v8],
          v8,
          v7,
          v9))
    {
      uint64_t v10 = [a1 generateFallbackPDF];
    }
    else
    {
      uint64_t v10 = 0;
    }
    _Block_object_dispose(v13, 8);

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (uint64_t)generateImagePreviewsForAttachment:()PreviewGeneration withFallbackPDFData:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F38DA0]) initWithData:v6];
    v8 = v7;
    if (v7)
    {
      int v9 = [v7 pageAtIndex:0];
      uint64_t v10 = v9;
      uint64_t v11 = v9 != 0;
      if (v9)
      {
        v37 = v8;
        BOOL v38 = v9 != 0;
        [v9 boundsForBox:1];
        double v13 = v12;
        [v5 setSizeWidth:v14];
        [v5 setSizeHeight:v13];
        uint64_t v15 = [v5 previewImages];
        char v16 = (void *)[v15 mutableCopy];

        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        uint64_t v17 = +[ICPreviewDeviceContext sharedContext];
        v18 = [v17 deviceInfoScalable:0];

        uint64_t v19 = [v18 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v44;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v44 != v21) {
                objc_enumerationMutation(v18);
              }
              BOOL v23 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              [v23 imageSize];
              double v25 = v24;
              [v23 imageSize];
              v27 = objc_msgSend(v10, "thumbnailOfSize:forBox:", 1, v25, v26);
              if (v27)
              {
                [v23 scale];
                __int16 v28 = objc_msgSend(v5, "updateAttachmentPreviewImageWithImage:scale:scaleWhenDrawing:metadata:sendNotification:", v27, 1, 0, 0);
                objc_msgSend(v16, "ic_removeNonNilObject:", v28);
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v43 objects:v48 count:16];
          }
          while (v20);
        }

        if ([v16 count])
        {
          [v5 removePreviewImages:v16];
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v29 = v16;
          uint64_t v30 = [v29 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v40;
            do
            {
              for (uint64_t j = 0; j != v31; ++j)
              {
                if (*(void *)v40 != v32) {
                  objc_enumerationMutation(v29);
                }
                uint64_t v34 = *(void *)(*((void *)&v39 + 1) + 8 * j);
                v35 = [v5 managedObjectContext];
                [v35 deleteObject:v34];
              }
              uint64_t v31 = [v29 countByEnumeratingWithState:&v39 objects:v47 count:16];
            }
            while (v31);
          }
        }
        uint64_t v11 = v38;
        v8 = v37;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)needToGeneratePreviews
{
  *(_WORD *)char v1 = 0;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "PDF in Notes is disabled. Not generating previews.", v1, 2u);
}

- (void)generateFallbackPDF
{
  *(_WORD *)char v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Not saving fallback PDF because the data was empty", v1, 2u);
}

@end