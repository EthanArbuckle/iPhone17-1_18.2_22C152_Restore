@interface ICAttachmentGalleryModel(PreviewGeneration)
- (BOOL)needToGeneratePreviews;
- (uint64_t)generatePreviewsInOperation:()PreviewGeneration;
@end

@implementation ICAttachmentGalleryModel(PreviewGeneration)

- (BOOL)needToGeneratePreviews
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v22.receiver = a1;
  v22.super_class = (Class)&off_1F0A4D270;
  if (!objc_msgSendSuper2(&v22, sel_needToGeneratePreviews) || ![a1 subAttachmentCount]) {
    return 0;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v2 = +[ICPreviewDeviceContext sharedContext];
  v3 = [v2 deviceInfoScalable:1];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v9 imageSize];
        double v11 = v10;
        [v9 scale];
        double v13 = v11 * v12;
        if (v7 < v13) {
          double v7 = v13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  v15 = [a1 firstSubAttachment];
  v16 = objc_msgSend(v15, "attachmentPreviewImageWithMinSize:scale:", v7, v7, 1.0);
  BOOL v14 = v16 != 0;

  return v14;
}

- (uint64_t)generatePreviewsInOperation:()PreviewGeneration
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__72;
  v77 = __Block_byref_object_dispose__72;
  id v78 = 0;
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x3032000000;
  v71[3] = __Block_byref_object_copy__72;
  v71[4] = __Block_byref_object_dispose__72;
  id v72 = 0;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__72;
  v69 = __Block_byref_object_dispose__72;
  id v70 = 0;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v4 = +[ICPreviewDeviceContext sharedContext];
  uint64_t v5 = [v4 deviceInfoScalable:1];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v61 objects:v86 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v62;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v62 != v7) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        [v10 imageSize];
        double v12 = v11;
        [v10 scale];
        double v14 = v12 * v13;
        if (v8 < v14) {
          double v8 = v14;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v61 objects:v86 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 0.0;
  }

  v15 = [a1 attachment];
  v16 = [v15 managedObjectContext];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __75__ICAttachmentGalleryModel_PreviewGeneration__generatePreviewsInOperation___block_invoke;
  v60[3] = &unk_1E5FDE020;
  *(double *)&v60[8] = v8;
  v60[4] = a1;
  v60[5] = &v65;
  v60[6] = v71;
  v60[7] = &v73;
  [v16 performBlockAndWait:v60];

  v17 = (void *)v66[5];
  if (!v17)
  {
    v39 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      v43 = NSStringFromSelector(a2);
      uint64_t v44 = v74[5];
      *(_DWORD *)buf = 138412802;
      id v81 = v42;
      __int16 v82 = 2112;
      v83 = v43;
      __int16 v84 = 2112;
      uint64_t v85 = v44;
      _os_log_debug_impl(&dword_1B08EB000, v39, OS_LOG_TYPE_DEBUG, "%@ %@ %@ early return", buf, 0x20u);
    }
    CFDataRef v46 = (const __CFData *)v39;
    goto LABEL_32;
  }
  if (objc_msgSend(v17, "ic_imageOrientation"))
  {
    uint64_t v18 = [MEMORY[0x1E4F45E08] imageWithRGBColorspaceFromImage:v66[5]];
    long long v19 = (void *)v66[5];
    v66[5] = v18;
  }
  objc_msgSend((id)v66[5], "ic_JPEGData");
  CFDataRef v46 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  long long v20 = CGImageSourceCreateWithData(v46, 0);
  if (v20)
  {
    cf = v20;
    CFDictionaryRef v21 = CGImageSourceCopyPropertiesAtIndex(v20, 0, 0);
    CFDictionaryRef v22 = v21;
    v45 = v21;
    if (v21)
    {
      v23 = [(__CFDictionary *)v21 objectForKeyedSubscript:*MEMORY[0x1E4F2FD00]];
      uint64_t v24 = [(__CFDictionary *)v22 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE8]];
      v25 = (void *)v24;
      if (v23 && v24)
      {
        v26 = [a1 attachment];
        v27 = [v26 managedObjectContext];
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __75__ICAttachmentGalleryModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_14;
        v57[3] = &unk_1E5FD8FE8;
        v57[4] = a1;
        id v58 = v23;
        id v59 = v25;
        [v27 performBlockAndWait:v57];
      }
    }
    long long v55 = 0u;
    long long v56 = 0u;
    long long v54 = 0u;
    long long v53 = 0u;
    v28 = +[ICPreviewDeviceContext sharedContext];
    obuint64_t j = [v28 deviceInfoScalable:1];

    uint64_t v29 = [obj countByEnumeratingWithState:&v53 objects:v79 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v54 != v30) {
            objc_enumerationMutation(obj);
          }
          v32 = *(void **)(*((void *)&v53 + 1) + 8 * j);
          [v32 imageSize];
          uint64_t v34 = v33;
          v35 = [a1 attachment];
          v36 = [v35 managedObjectContext];
          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = 3221225472;
          v52[2] = __75__ICAttachmentGalleryModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2;
          v52[3] = &unk_1E5FDE048;
          v52[8] = v34;
          v52[4] = a1;
          v52[5] = v32;
          v52[6] = v71;
          v52[7] = cf;
          [v36 performBlockAndWait:v52];
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v53 objects:v79 count:16];
      }
      while (v29);
    }

    v37 = [a1 attachment];
    v38 = [v37 managedObjectContext];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __75__ICAttachmentGalleryModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_3;
    v51[3] = &unk_1E5FD91F8;
    v51[5] = v71;
    v51[4] = a1;
    [v38 performBlockAndWait:v51];

    CFRelease(cf);
    v39 = v45;
LABEL_32:
  }
  _Block_object_dispose(&v65, 8);

  _Block_object_dispose(v71, 8);
  _Block_object_dispose(&v73, 8);

  return 1;
}

@end