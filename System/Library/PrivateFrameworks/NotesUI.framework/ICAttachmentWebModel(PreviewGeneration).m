@interface ICAttachmentWebModel(PreviewGeneration)
- (uint64_t)downloadPreviewForAttachmentURL:()PreviewGeneration;
- (uint64_t)extractPreviewImagesFromSynapseData:()PreviewGeneration;
- (uint64_t)generateAsynchronousPreviews;
- (uint64_t)generatePreviewsInOperation:()PreviewGeneration;
- (uint64_t)needToGeneratePreviews;
- (uint64_t)updateAttachmentPreviewImagesMetadata;
- (void)saveImagesFromLinkMetadata:()PreviewGeneration;
- (void)updateAttachmentWithPreviewImage:()PreviewGeneration;
- (void)updateTitle:()PreviewGeneration andDescription:;
@end

@implementation ICAttachmentWebModel(PreviewGeneration)

- (uint64_t)needToGeneratePreviews
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v4 = [a1 attachment];
  if ([v4 hasSynapseLink])
  {
    v5 = [a1 attachment];
    v6 = [v5 previewUpdateDate];

    if (v6) {
      return 0;
    }
  }
  else
  {
  }
  v8 = [a1 attachment];
  v9 = [v8 URL];
  if (objc_msgSend(v9, "ic_isWebURL") && (objc_msgSend(a1, "isGeneratingPreviews") & 1) == 0)
  {
    v10 = [a1 attachment];
    if ([v10 wasCreatedByCurrentUser])
    {
      v11 = [a1 attachment];
      if ([v11 metadataExists])
      {
        v12 = [a1 attachment];
        v13 = [v12 previewUpdateDate];
        if (v13)
        {
          v14 = [a1 attachment];
          uint64_t v7 = [v14 hasMetadata] ^ 1;
        }
        else
        {
          uint64_t v7 = 1;
        }
      }
      else
      {
        uint64_t v7 = 1;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  v15 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    v19 = NSStringFromSelector(a2);
    v20 = [a1 attachment];
    v21 = [v20 identifier];
    v22 = [a1 attachment];
    v23 = [v22 previewUpdateDate];
    v24 = [a1 attachment];
    int v25 = 138413570;
    v26 = v18;
    __int16 v27 = 2112;
    v28 = v19;
    __int16 v29 = 2112;
    v30 = v21;
    __int16 v31 = 1024;
    int v32 = v7;
    __int16 v33 = 2112;
    v34 = v23;
    __int16 v35 = 1024;
    int v36 = [v24 hasMetadata];
    _os_log_debug_impl(&dword_1B08EB000, v15, OS_LOG_TYPE_DEBUG, "%@ %@ %@ return %d self.attachment.previewUpdateDate %@ has self.attachment.metadataData %d", (uint8_t *)&v25, 0x36u);
  }
  return v7;
}

- (uint64_t)generateAsynchronousPreviews
{
  return 1;
}

- (uint64_t)generatePreviewsInOperation:()PreviewGeneration
{
  id v5 = a3;
  if ([a1 isGeneratingPreviews])
  {
    v6 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[ICAttachmentWebModel(PreviewGeneration) generatePreviewsInOperation:](v6);
    }

    uint64_t v7 = 0;
    goto LABEL_15;
  }
  [a1 setGeneratingPreviews:1];
  uint64_t v44 = 0;
  v45[0] = &v44;
  v45[1] = 0x3032000000;
  v45[2] = __Block_byref_object_copy__45;
  v45[3] = __Block_byref_object_dispose__45;
  id v46 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__45;
  v42 = __Block_byref_object_dispose__45;
  id v43 = 0;
  uint64_t v34 = 0;
  __int16 v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v30 = 0;
  __int16 v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  int v25 = &v24;
  uint64_t v26 = 0x3032000000;
  __int16 v27 = __Block_byref_object_copy__45;
  v28 = __Block_byref_object_dispose__45;
  id v29 = 0;
  objc_initWeak(&location, a1);
  v8 = [a1 attachment];
  v9 = [v8 managedObjectContext];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __71__ICAttachmentWebModel_PreviewGeneration__generatePreviewsInOperation___block_invoke;
  v16 = &unk_1E5FDBFC0;
  objc_copyWeak(v22, &location);
  v17 = &v44;
  v18 = &v38;
  v19 = &v24;
  v20 = &v34;
  v22[1] = a2;
  v21 = &v30;
  [v9 performBlockAndWait:&v13];

  if (*((unsigned char *)v35 + 24))
  {
    uint64_t v10 = objc_msgSend(a1, "downloadPreviewForAttachmentURL:", v39[5], v13, v14, v15, v16);
  }
  else if (*((unsigned char *)v31 + 24))
  {
    uint64_t v10 = objc_msgSend(a1, "updateAttachmentPreviewImagesMetadata", v13, v14, v15, v16);
  }
  else
  {
    if (!v25[5])
    {
      uint64_t v7 = 0;
      goto LABEL_12;
    }
    uint64_t v10 = objc_msgSend(a1, "extractPreviewImagesFromSynapseData:", v13, v14, v15, v16);
  }
  uint64_t v7 = v10;
LABEL_12:
  v11 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ICAttachmentWebModel(PreviewGeneration) generatePreviewsInOperation:]((uint64_t)v45, v11);
  }

  [a1 setGeneratingPreviews:0];
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
LABEL_15:

  return v7;
}

- (uint64_t)extractPreviewImagesFromSynapseData:()PreviewGeneration
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  objc_initWeak(&location, a1);
  id v5 = [a1 attachment];
  v6 = [v5 managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__ICAttachmentWebModel_PreviewGeneration__extractPreviewImagesFromSynapseData___block_invoke;
  v9[3] = &unk_1E5FDAB80;
  objc_copyWeak(&v10, &location);
  v9[4] = &v12;
  [v6 performBlockAndWait:v9];

  uint64_t v7 = *((unsigned __int8 *)v13 + 24);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (uint64_t)downloadPreviewForAttachmentURL:()PreviewGeneration
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  objc_initWeak(&location, a1);
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__ICAttachmentWebModel_PreviewGeneration__downloadPreviewForAttachmentURL___block_invoke;
  v10[3] = &unk_1E5FDC010;
  id v11 = v4;
  id v6 = v4;
  objc_copyWeak(&v15, &location);
  dispatch_semaphore_t v13 = v5;
  uint64_t v14 = &v16;
  uint64_t v12 = a1;
  uint64_t v7 = v5;
  dispatch_sync(MEMORY[0x1E4F14428], v10);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v8 = *((unsigned __int8 *)v17 + 24);

  objc_destroyWeak(&v15);
  _Block_object_dispose(&v16, 8);
  objc_destroyWeak(&location);
  return v8;
}

- (uint64_t)updateAttachmentPreviewImagesMetadata
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v2 = [a1 attachment];
  v3 = [v2 managedObjectContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__ICAttachmentWebModel_PreviewGeneration__updateAttachmentPreviewImagesMetadata__block_invoke;
  v6[3] = &unk_1E5FDB2D0;
  v6[4] = a1;
  v6[5] = &v7;
  [v3 performBlockAndWait:v6];

  uint64_t v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)updateTitle:()PreviewGeneration andDescription:
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [a1 attachment];
  if (![v9 isValidObject])
  {
LABEL_10:

    goto LABEL_11;
  }
  char v10 = [a1 previewGenerationOperationCancelled];

  if ((v10 & 1) == 0)
  {
    id v11 = NSString;
    uint64_t v12 = (objc_class *)objc_opt_class();
    dispatch_semaphore_t v13 = NSStringFromClass(v12);
    uint64_t v14 = NSStringFromSelector(a2);
    id v15 = [a1 attachment];
    uint64_t v16 = [v15 identifier];
    uint64_t v9 = [v11 stringWithFormat:@"%@ %@ %@", v13, v14, v16];

    v17 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[ICAttachmentWebModel(PreviewGeneration) updateTitle:andDescription:](a2, (uint64_t)v9, v17);
    }

    if ([v7 length])
    {
      uint64_t v18 = [a1 attachment];
      char v19 = [v18 title];
      char v20 = [v19 isEqualToString:v7];

      if ((v20 & 1) == 0)
      {
        v21 = [a1 attachment];
        [v21 setTitle:v7];
      }
    }
    v22 = [a1 attachment];
    v23 = [v22 summary];
    uint64_t v24 = [v23 length];

    if (!v24)
    {
      int v25 = [a1 attachment];
      [v25 setSummary:v8];
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (void)saveImagesFromLinkMetadata:()PreviewGeneration
{
  id v17 = a3;
  uint64_t v4 = [v17 image];

  if (v4)
  {
    dispatch_semaphore_t v5 = [v17 image];
    id v6 = [v5 platformImage];
    [v6 size];
    BOOL v9 = v8 <= 192.0 && v7 <= 192.0;
    goto LABEL_7;
  }
  char v10 = [v17 icon];

  if (v10)
  {
    dispatch_semaphore_t v5 = [v17 icon];
    id v6 = [v5 platformImage];
    BOOL v9 = 1;
LABEL_7:
    [a1 updateAttachmentWithPreviewImage:v6];

    goto LABEL_8;
  }
  BOOL v9 = 1;
LABEL_8:
  id v11 = [a1 attachment];
  uint64_t v12 = [v11 metadata];
  dispatch_semaphore_t v13 = v12;
  if (!v12) {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  uint64_t v14 = (void *)[v12 mutableCopy];

  id v15 = [NSNumber numberWithBool:v9];
  [v14 setObject:v15 forKey:*MEMORY[0x1E4F83028]];

  uint64_t v16 = [a1 attachment];
  [v16 setMetadata:v14];
}

- (void)updateAttachmentWithPreviewImage:()PreviewGeneration
{
  id v10 = a3;
  [v10 scale];
  double v5 = v4;
  id v6 = [a1 attachment];
  id v7 = (id)[v6 updateAttachmentPreviewImageWithImage:v10 scale:1 scaleWhenDrawing:0 metadata:0 sendNotification:v5];

  double v8 = [a1 attachment];
  [v8 updateChangeCountWithReason:@"Updated preview images with image"];

  BOOL v9 = [a1 attachment];
  objc_msgSend(v9, "ic_postNotificationOnMainThreadWithName:", *MEMORY[0x1E4F83040]);
}

- (void)generatePreviewsInOperation:()PreviewGeneration .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "Preview generation has already been requested. Stopping", v1, 2u);
}

- (void)generatePreviewsInOperation:()PreviewGeneration .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_DEBUG, "%@ completed", (uint8_t *)&v3, 0xCu);
}

- (void)updateTitle:()PreviewGeneration andDescription:.cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1B08EB000, a3, OS_LOG_TYPE_DEBUG, "%@ %@", (uint8_t *)&v6, 0x16u);
}

@end