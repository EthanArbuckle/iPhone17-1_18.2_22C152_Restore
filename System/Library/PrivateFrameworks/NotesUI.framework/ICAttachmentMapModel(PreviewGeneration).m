@interface ICAttachmentMapModel(PreviewGeneration)
- (BOOL)generatePreviewsInOperation:()PreviewGeneration;
- (uint64_t)generateAsynchronousPreviews;
- (uint64_t)needToGeneratePreviews;
- (uint64_t)requiresNetworkToGeneratePreview;
@end

@implementation ICAttachmentMapModel(PreviewGeneration)

- (uint64_t)requiresNetworkToGeneratePreview
{
  return 1;
}

- (uint64_t)needToGeneratePreviews
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = [a1 attachment];
  if ([v4 metadataExists]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [a1 isGeneratingPreviews] ^ 1;
  }

  v6 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = NSStringFromSelector(a2);
    v11 = [a1 attachment];
    v12 = [v11 identifier];
    int v13 = 138413058;
    v14 = v9;
    __int16 v15 = 2112;
    v16 = v10;
    __int16 v17 = 2112;
    v18 = v12;
    __int16 v19 = 1024;
    int v20 = v5;
    _os_log_debug_impl(&dword_1B08EB000, v6, OS_LOG_TYPE_DEBUG, "%@ %@ %@ return %d", (uint8_t *)&v13, 0x26u);
  }
  return v5;
}

- (uint64_t)generateAsynchronousPreviews
{
  return 1;
}

- (BOOL)generatePreviewsInOperation:()PreviewGeneration
{
  id v4 = a3;
  if ([a1 isGeneratingPreviews])
  {
    BOOL v5 = 0;
  }
  else
  {
    [a1 setGeneratingPreviews:1];
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    objc_initWeak(&location, a1);
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 1;
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__23;
    v25 = __Block_byref_object_dispose__23;
    id v26 = 0;
    v7 = [a1 attachment];
    v8 = [v7 managedObjectContext];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke;
    v19[3] = &unk_1E5FDAB80;
    objc_copyWeak(&v20, &location);
    v19[4] = &v21;
    [v8 performBlockAndWait:v19];

    v9 = (void *)MEMORY[0x1B3E9ED80]();
    v10 = [MEMORY[0x1E4F28E88] requestWithURL:v22[5]];
    [v10 _setNonAppInitiated:1];
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2050000000;
    v11 = (void *)getLPMetadataProviderClass_softClass;
    uint64_t v36 = getLPMetadataProviderClass_softClass;
    if (!getLPMetadataProviderClass_softClass)
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __getLPMetadataProviderClass_block_invoke;
      v32[3] = &unk_1E5FD95C0;
      v32[4] = &v33;
      __getLPMetadataProviderClass_block_invoke((uint64_t)v32);
      v11 = (void *)v34[3];
    }
    v12 = v11;
    _Block_object_dispose(&v33, 8);
    id v13 = objc_alloc_init(v12);
    id v14 = objc_loadWeakRetained(&location);
    id v16 = v13;
    id v17 = v10;
    v18 = v6;
    performBlockOnMainThread();

    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    [a1 setGeneratingPreviews:0];
    BOOL v5 = *((unsigned char *)v28 + 24) != 0;
    objc_destroyWeak(&v20);
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
    objc_destroyWeak(&location);
  }
  return v5;
}

@end