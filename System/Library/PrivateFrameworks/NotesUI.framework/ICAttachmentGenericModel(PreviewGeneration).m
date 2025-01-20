@interface ICAttachmentGenericModel(PreviewGeneration)
- (BOOL)generatePreviewsInOperation:()PreviewGeneration;
- (uint64_t)generateAsynchronousPreviews;
- (uint64_t)needToGeneratePreviews;
@end

@implementation ICAttachmentGenericModel(PreviewGeneration)

- (uint64_t)needToGeneratePreviews
{
  v2 = [a1 attachment];
  if ([v2 usesLinkPresentation])
  {
    v3 = [a1 attachment];
    v4 = [v3 media];
    v5 = [v4 mediaURL];
    if ([v5 isFileURL])
    {
      v6 = [a1 attachment];
      if ([v6 attachmentType] == 4)
      {
        uint64_t v7 = 0;
      }
      else
      {
        v8 = [a1 attachment];
        if ([v8 metadataExists]) {
          uint64_t v7 = 0;
        }
        else {
          uint64_t v7 = [a1 isGeneratingPreviews] ^ 1;
        }
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

  return v7;
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
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__63;
    v30 = __Block_byref_object_dispose__63;
    id v31 = 0;
    v6 = [a1 attachment];
    uint64_t v7 = [v6 managedObjectContext];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __75__ICAttachmentGenericModel_PreviewGeneration__generatePreviewsInOperation___block_invoke;
    v23[3] = &unk_1E5FD91F8;
    v25 = &v26;
    id v8 = v6;
    id v24 = v8;
    [v7 performBlockAndWait:v23];

    if ([(id)v27[5] isFileURL])
    {
      dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
      uint64_t v37 = 0;
      v38 = &v37;
      uint64_t v39 = 0x2050000000;
      v10 = (void *)getLPMetadataProviderClass_softClass_1;
      uint64_t v40 = getLPMetadataProviderClass_softClass_1;
      if (!getLPMetadataProviderClass_softClass_1)
      {
        uint64_t v32 = MEMORY[0x1E4F143A8];
        uint64_t v33 = 3221225472;
        uint64_t v34 = (uint64_t)__getLPMetadataProviderClass_block_invoke_1;
        v35 = &unk_1E5FD95C0;
        v36 = &v37;
        __getLPMetadataProviderClass_block_invoke_1((uint64_t)&v32);
        v10 = (void *)v38[3];
      }
      v11 = v10;
      _Block_object_dispose(&v37, 8);
      id v12 = objc_alloc_init(v11);
      uint64_t v32 = 0;
      uint64_t v33 = (uint64_t)&v32;
      uint64_t v34 = 0x2020000000;
      LOBYTE(v35) = 0;
      uint64_t v13 = v27[5];
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      v18 = __75__ICAttachmentGenericModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2;
      v19 = &unk_1E5FDABA8;
      id v20 = v8;
      v22 = &v32;
      v14 = v9;
      v21 = v14;
      [v12 startFetchingMetadataForURL:v13 completionHandler:&v16];
      dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
      objc_msgSend(a1, "setGeneratingPreviews:", 0, v16, v17, v18, v19);
      BOOL v5 = *(unsigned char *)(v33 + 24) != 0;

      _Block_object_dispose(&v32, 8);
    }
    else
    {
      [a1 setGeneratingPreviews:0];
      BOOL v5 = 0;
    }

    _Block_object_dispose(&v26, 8);
  }

  return v5;
}

@end