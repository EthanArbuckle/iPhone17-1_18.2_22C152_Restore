@interface ICAttachmentImageModel(PreviewGeneration)
- (BOOL)generatePreviewsDuringCloudActivity;
- (BOOL)generatePreviewsInOperation:()PreviewGeneration;
- (BOOL)needToGeneratePreviews;
- (__CFString)classificationsForImage:()PreviewGeneration;
- (id)generateFullSizePreviewWithAttachmentIdentifier:()PreviewGeneration existingPreviewImage:markupModelData:imageOrientation:imageFilterType:mediaDecryptedData:mediaURL:mediaSize:croppingQuad:;
- (id)labelsForClassificationObservations:()PreviewGeneration;
- (uint64_t)needToPostProcessAttachment;
- (void)classifyImageInOperation:()PreviewGeneration;
- (void)generateOCRInOperation:()PreviewGeneration;
@end

@implementation ICAttachmentImageModel(PreviewGeneration)

- (BOOL)generatePreviewsDuringCloudActivity
{
  v1 = [a1 attachment];
  v2 = [v1 markupModelData];
  BOOL v3 = [v2 length] == 0;

  return v3;
}

- (BOOL)needToGeneratePreviews
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v4 = +[ICPreviewDeviceContext sharedContext];
  BOOL v5 = 1;
  v6 = [v4 deviceInfoScalable:1];
  uint64_t v7 = [v6 count];

  unsigned int v8 = [a1 needsFullSizePreview];
  v25.receiver = a1;
  v25.super_class = (Class)&off_1F0A2EE18;
  if ((objc_msgSendSuper2(&v25, sel_needToGeneratePreviews) & 1) == 0)
  {
    unint64_t v9 = v7 + v8;
    v10 = [a1 attachment];
    v11 = [v10 previewImages];
    BOOL v5 = [v11 count] < v9;
  }
  v12 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = NSStringFromSelector(a2);
    v24 = [a1 attachment];
    v17 = [v24 identifier];
    v18 = [a1 attachment];
    v19 = [v18 previewImages];
    uint64_t v20 = [v19 count];
    v21 = +[ICPreviewDeviceContext sharedContext];
    v22 = [v21 deviceInfoScalable:1];
    uint64_t v23 = [v22 count];
    *(_DWORD *)buf = 138413570;
    v27 = v15;
    __int16 v28 = 2112;
    v29 = v16;
    __int16 v30 = 2112;
    v31 = v17;
    __int16 v32 = 1024;
    BOOL v33 = v5;
    __int16 v34 = 2048;
    uint64_t v35 = v20;
    __int16 v36 = 2048;
    uint64_t v37 = v23;
    _os_log_debug_impl(&dword_1B08EB000, v12, OS_LOG_TYPE_DEBUG, "%@ %@ %@ return %d self.attachment.previewImages.count %lu [[ICPreviewDeviceContext sharedContext] deviceInfoScalable:YES].count %lu", buf, 0x3Au);
  }
  return v5;
}

- (uint64_t)needToPostProcessAttachment
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v4 = [a1 attachment];
  BOOL v5 = [v4 managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__ICAttachmentImageModel_PreviewGeneration__needToPostProcessAttachment__block_invoke;
  v9[3] = &unk_1E5FDA0D0;
  id v6 = v4;
  id v10 = v6;
  v11 = a1;
  v12 = &v14;
  uint64_t v13 = a2;
  [v5 performBlockAndWait:v9];

  uint64_t v7 = *((unsigned __int8 *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v7;
}

- (id)generateFullSizePreviewWithAttachmentIdentifier:()PreviewGeneration existingPreviewImage:markupModelData:imageOrientation:imageFilterType:mediaDecryptedData:mediaURL:mediaSize:croppingQuad:
{
  id v56 = a5;
  id v55 = a6;
  id v19 = a7;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  if ([v19 length]) {
    unint64_t v23 = a8;
  }
  else {
    unint64_t v23 = 0;
  }
  if (v21) {
    objc_msgSend(MEMORY[0x1E4FB1818], "ic_imageWithContentsOfURL:", v21);
  }
  else {
  uint64_t v24 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_imageWithData:", v20);
  }
  objc_super v25 = (void *)v24;
  if (v22 && v24)
  {
    v26 = [MEMORY[0x1E4F45E08] perspectiveCorrectedImageFromImage:v24 normalizedImageQuad:v22];

    if (!v26)
    {
LABEL_37:
      objc_super v25 = 0;
      goto LABEL_38;
    }
    [v26 size];
    if (((1 << a8) & 0xCC) != 0) {
      double v29 = v28;
    }
    else {
      double v29 = v27;
    }
    if (((1 << a8) & 0xCC) != 0) {
      double v30 = v27;
    }
    else {
      double v30 = v28;
    }
    if (a8 <= 7) {
      double v31 = v29;
    }
    else {
      double v31 = v27;
    }
    if (a8 <= 7) {
      double v32 = v30;
    }
    else {
      double v32 = v28;
    }
    if (v31 != a2 || v32 != a3)
    {
      __int16 v34 = [a1 attachment];
      uint64_t v35 = [v34 managedObjectContext];
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __214__ICAttachmentImageModel_PreviewGeneration__generateFullSizePreviewWithAttachmentIdentifier_existingPreviewImage_markupModelData_imageOrientation_imageFilterType_mediaDecryptedData_mediaURL_mediaSize_croppingQuad___block_invoke;
      v61[3] = &unk_1E5FDA0F8;
      v61[4] = a1;
      *(double *)&v61[5] = v31;
      *(double *)&v61[6] = v32;
      [v35 performBlockAndWait:v61];
    }
    objc_super v25 = v26;
  }
  else if (!v24)
  {
LABEL_38:
    BOOL v36 = v23 != 0;
    uint64_t v37 = v25;
    goto LABEL_39;
  }
  BOOL v36 = v23 != 0;
  if (!a9 && !v23) {
    goto LABEL_38;
  }
  uint64_t v37 = [MEMORY[0x1E4F45E08] filteredImage:v25 orientation:0 imageFilterType:a9];

  if (!v37) {
    goto LABEL_37;
  }
  if ([v19 length])
  {
    uint64_t v38 = [MEMORY[0x1E4F45E08] imageWithRGBColorspaceFromImage:v37];

    uint64_t v37 = (void *)v38;
  }
  if (v37 && v23)
  {
    uint64_t v39 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_orientedImageFromImage:toOrientation:", v37, v23);

    BOOL v36 = 1;
    uint64_t v37 = (void *)v39;
  }
LABEL_39:
  v40 = objc_msgSend(v37, "ic_JPEGData");

  if ([v19 length])
  {
    v41 = v55;
    if (v40)
    {
      uint64_t v42 = [MEMORY[0x1E4F83400] imageDataWithMarkupModelData:v19 sourceImageData:v40];

      v40 = (void *)v42;
    }
    else
    {
      v40 = [MEMORY[0x1E4F83400] imageDataWithMarkupModelData:v19 sourceImageURL:0];
    }
    if (v40) {
      BOOL v45 = v36;
    }
    else {
      BOOL v45 = 0;
    }
    if (v45)
    {
      v46 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_imageWithData:", v40);
      v47 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_orientedImageFromImage:fromOrientation:", v46, v23);

      uint64_t v48 = objc_msgSend(v47, "ic_JPEGData");

      v40 = (void *)v48;
    }
    v43 = v56;
    if (v40) {
      goto LABEL_53;
    }
  }
  else
  {
    v41 = v55;
    v43 = v56;
    if (v40)
    {
LABEL_53:
      CGImageSourceRef v49 = CGImageSourceCreateWithData((CFDataRef)v40, 0);
      if (v49)
      {
        CGImageSourceRef v50 = v49;
        if (a2 >= a3) {
          a3 = a2;
        }
        v51 = [a1 attachment];
        v52 = [v51 managedObjectContext];
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __214__ICAttachmentImageModel_PreviewGeneration__generateFullSizePreviewWithAttachmentIdentifier_existingPreviewImage_markupModelData_imageOrientation_imageFilterType_mediaDecryptedData_mediaURL_mediaSize_croppingQuad___block_invoke_56;
        v57[3] = &unk_1E5FDA120;
        v57[4] = a1;
        CGImageSourceRef v59 = v50;
        double v60 = a3;
        id v58 = v41;
        [v52 performBlockAndWait:v57];

        CFRelease(v50);
      }
      goto LABEL_57;
    }
  }
  v44 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
    -[ICAttachmentImageModel(PreviewGeneration) generateFullSizePreviewWithAttachmentIdentifier:existingPreviewImage:markupModelData:imageOrientation:imageFilterType:mediaDecryptedData:mediaURL:mediaSize:croppingQuad:]();
  }

LABEL_57:
  return v40;
}

- (BOOL)generatePreviewsInOperation:()PreviewGeneration
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  uint64_t v104 = 0;
  v105 = &v104;
  uint64_t v106 = 0x3032000000;
  v107 = __Block_byref_object_copy__14;
  v108 = __Block_byref_object_dispose__14;
  id v109 = 0;
  uint64_t v98 = 0;
  v99 = &v98;
  uint64_t v100 = 0x3032000000;
  v101 = __Block_byref_object_copy__14;
  v102 = __Block_byref_object_dispose__14;
  id v103 = 0;
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x3032000000;
  v95 = __Block_byref_object_copy__14;
  v96 = __Block_byref_object_dispose__14;
  id v97 = 0;
  v90[0] = 0;
  v90[1] = v90;
  v90[2] = 0x3032000000;
  v90[3] = __Block_byref_object_copy__14;
  v90[4] = __Block_byref_object_dispose__14;
  id v91 = 0;
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x3032000000;
  v87 = __Block_byref_object_copy__14;
  v88 = __Block_byref_object_dispose__14;
  id v89 = 0;
  uint64_t v80 = 0;
  v81 = &v80;
  uint64_t v82 = 0x2020000000;
  __int16 v83 = 0;
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x2020000000;
  uint64_t v79 = 0;
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__14;
  v74 = __Block_byref_object_dispose__14;
  id v75 = 0;
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__14;
  v68 = __Block_byref_object_dispose__14;
  id v69 = 0;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x2020000000;
  char v63 = 0;
  uint64_t v55 = 0;
  id v56 = (double *)&v55;
  uint64_t v57 = 0x3010000000;
  id v58 = &unk_1B0BF84BB;
  long long v59 = *MEMORY[0x1E4F1DB30];
  uint64_t v49 = 0;
  CGImageSourceRef v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__14;
  v53 = __Block_byref_object_dispose__14;
  id v54 = 0;
  v4 = a1;
  BOOL v5 = [a1 attachment];
  id v6 = [v5 managedObjectContext];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __73__ICAttachmentImageModel_PreviewGeneration__generatePreviewsInOperation___block_invoke;
  v48[3] = &unk_1E5FDA148;
  v48[4] = v4;
  v48[5] = &v104;
  v48[6] = &v70;
  v48[7] = &v80;
  v48[8] = &v76;
  v48[9] = v90;
  v48[10] = &v98;
  v48[11] = &v92;
  v48[12] = &v84;
  v48[13] = &v64;
  v48[14] = &v60;
  v48[15] = &v55;
  v48[16] = &v49;
  [v6 performBlockAndWait:v48];

  if (([v31 isCancelled] & 1) != 0 || !v93[5] && !v99[5])
  {
    uint64_t v7 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      double v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      double v29 = NSStringFromSelector(a2);
      uint64_t v30 = v105[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v28;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v29;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v112 = v30;
      _os_log_debug_impl(&dword_1B08EB000, v7, OS_LOG_TYPE_DEBUG, "%@ %@ %@ early return", buf, 0x20u);
    }
    goto LABEL_26;
  }
  if (*((unsigned char *)v61 + 24))
  {
    uint64_t v8 = objc_msgSend(v4, "generateFullSizePreviewWithAttachmentIdentifier:existingPreviewImage:markupModelData:imageOrientation:imageFilterType:mediaDecryptedData:mediaURL:mediaSize:croppingQuad:", v105[5], v85[5], v65[5], v77[3], *((__int16 *)v81 + 12), v99[5], v56[4], v56[5], v93[5], v50[5]);
    unint64_t v9 = (void *)v99[5];
    v99[5] = v8;

    id v10 = (void *)v93[5];
    v93[5] = 0;
  }
  if ([v31 isCancelled]) {
    goto LABEL_26;
  }
  CFURLRef v11 = (const __CFURL *)v93[5];
  if (v11)
  {
    CGImageSourceRef cf = CGImageSourceCreateWithURL(v11, 0);
    goto LABEL_14;
  }
  CFDataRef v12 = (const __CFData *)v99[5];
  if (!v12)
  {
LABEL_26:
    BOOL v25 = 0;
    goto LABEL_27;
  }
  CGImageSourceRef cf = CGImageSourceCreateWithData(v12, 0);
LABEL_14:
  if (!cf) {
    goto LABEL_26;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v112) = 0;
  uint64_t v44 = 0;
  BOOL v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v13 = +[ICPreviewDeviceContext sharedContext];
  id obj = [v13 deviceInfoScalable:1];

  uint64_t v14 = [obj countByEnumeratingWithState:&v40 objects:v110 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(obj);
        }
        char v17 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        [v17 imageSize];
        uint64_t v19 = v18;
        id v20 = [v4 attachment];
        id v21 = [v20 managedObjectContext];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __73__ICAttachmentImageModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_57;
        v39[3] = &unk_1E5FDA170;
        v39[4] = v17;
        v39[5] = v4;
        v39[9] = &v104;
        v39[10] = cf;
        v39[11] = v19;
        v39[6] = buf;
        v39[7] = &v84;
        v39[8] = &v44;
        v39[12] = a2;
        [v21 performBlockAndWait:v39];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v40 objects:v110 count:16];
    }
    while (v14);
  }

  id v22 = [v4 attachment];
  unint64_t v23 = [v22 managedObjectContext];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __73__ICAttachmentImageModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_58;
  v35[3] = &unk_1E5FDA198;
  uint64_t v37 = &v84;
  v35[4] = v4;
  uint64_t v38 = buf;
  id v24 = v31;
  id v36 = v24;
  [v23 performBlockAndWait:v35];

  CFRelease(cf);
  if (([v24 isCancelled] & 1) == 0
    && [(id)v71[5] shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier:v105[5]])
  {
    [(id)v71[5] generatePreviewsInOperation:v24];
  }
  BOOL v25 = *((unsigned char *)v45 + 24) == 0;

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(buf, 8);
LABEL_27:
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);

  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v84, 8);

  _Block_object_dispose(v90, 8);
  _Block_object_dispose(&v92, 8);

  _Block_object_dispose(&v98, 8);
  _Block_object_dispose(&v104, 8);

  return v25;
}

- (void)generateOCRInOperation:()PreviewGeneration
{
  id v4 = a3;
  BOOL v5 = [a1 attachment];
  id v6 = [v5 managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke;
  v9[3] = &unk_1E5FD8FE8;
  void v9[4] = a1;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 performBlockAndWait:v9];
}

- (void)classifyImageInOperation:()PreviewGeneration
{
  id v4 = a3;
  BOOL v5 = [a1 attachment];
  id v6 = [v5 managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke;
  v9[3] = &unk_1E5FD8FE8;
  void v9[4] = a1;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 performBlockAndWait:v9];
}

- (__CFString)classificationsForImage:()PreviewGeneration
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2050000000;
  BOOL v5 = (void *)getVNSessionClass_softClass;
  uint64_t v32 = getVNSessionClass_softClass;
  if (!getVNSessionClass_softClass)
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __getVNSessionClass_block_invoke;
    double v27 = &unk_1E5FD95C0;
    id v28 = &v29;
    __getVNSessionClass_block_invoke((uint64_t)&v24);
    BOOL v5 = (void *)v30[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v29, 8);
  id v7 = objc_alloc_init(v6);
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2050000000;
  id v8 = (void *)getVNImageRequestHandlerClass_softClass;
  uint64_t v32 = getVNImageRequestHandlerClass_softClass;
  if (!getVNImageRequestHandlerClass_softClass)
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __getVNImageRequestHandlerClass_block_invoke;
    double v27 = &unk_1E5FD95C0;
    id v28 = &v29;
    __getVNImageRequestHandlerClass_block_invoke((uint64_t)&v24);
    id v8 = (void *)v30[3];
  }
  unint64_t v9 = v8;
  _Block_object_dispose(&v29, 8);
  id v10 = [v9 alloc];
  uint64_t v11 = objc_msgSend(v4, "ic_CGImage");
  CFDataRef v12 = (void *)[v10 initWithCGImage:v11 options:MEMORY[0x1E4F1CC08] session:v7];
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2050000000;
  uint64_t v13 = (void *)getVNSceneClassificationRequestClass_softClass;
  uint64_t v32 = getVNSceneClassificationRequestClass_softClass;
  if (!getVNSceneClassificationRequestClass_softClass)
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __getVNSceneClassificationRequestClass_block_invoke;
    double v27 = &unk_1E5FD95C0;
    id v28 = &v29;
    __getVNSceneClassificationRequestClass_block_invoke((uint64_t)&v24);
    uint64_t v13 = (void *)v30[3];
  }
  uint64_t v14 = v13;
  _Block_object_dispose(&v29, 8);
  id v15 = objc_alloc_init(v14);
  v33[0] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  id v23 = 0;
  int v17 = [v12 performRequests:v16 error:&v23];
  id v18 = v23;

  if (!v17)
  {
    id v20 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[ICAttachmentImageModel(PreviewGeneration) classificationsForImage:]();
    }
    goto LABEL_13;
  }
  uint64_t v19 = [v15 results];
  id v20 = [a1 labelsForClassificationObservations:v19];

  if (!v20)
  {
LABEL_13:
    id v21 = 0;
    goto LABEL_14;
  }
  if ([v20 count])
  {
    id v21 = [v20 componentsJoinedByString:@" "];
  }
  else
  {
    id v21 = &stru_1F0973378;
  }
LABEL_14:

  return v21;
}

- (id)labelsForClassificationObservations:()PreviewGeneration
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v20 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F8CD60]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        CFDataRef v12 = [v11 identifier];
        uint64_t v13 = [v5 nodeRefForName:v12];

        if (v13)
        {
          [v11 confidence];
          double v15 = v14;
          PFSceneTaxonomyNodeSearchThreshold();
          if (v16 < v15)
          {
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __81__ICAttachmentImageModel_PreviewGeneration__labelsForClassificationObservations___block_invoke;
            aBlock[3] = &unk_1E5FDA1C0;
            id v23 = v20;
            id v24 = v4;
            id v25 = v5;
            int v17 = (void (**)(void *, uint64_t, _OWORD *))_Block_copy(aBlock);
            memset(v21, 0, sizeof(v21));
            PFSceneTaxonomyFillNodeData();
            v17[2](v17, v13, v21);
            PFSceneTaxonomyNodeVisitParents();
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }

  id v18 = (void *)[v4 copy];
  return v18;
}

- (void)generateFullSizePreviewWithAttachmentIdentifier:()PreviewGeneration existingPreviewImage:markupModelData:imageOrientation:imageFilterType:mediaDecryptedData:mediaURL:mediaSize:croppingQuad:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1B08EB000, v0, OS_LOG_TYPE_ERROR, "No media decrypted data for: %@", v1, 0xCu);
}

- (void)classificationsForImage:()PreviewGeneration .cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1B08EB000, v0, OS_LOG_TYPE_ERROR, "Error classifying image: %@", v1, 0xCu);
}

@end