@interface ICAttachmentWebModel
@end

@implementation ICAttachmentWebModel

void __71__ICAttachmentWebModel_PreviewGeneration__generatePreviewsInOperation___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(*(SEL *)(a1 + 80));
  v8 = [WeakRetained attachment];
  v9 = [v8 identifier];
  uint64_t v10 = [v4 stringWithFormat:@"%@ %@ %@", v6, v7, v9];
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if ([WeakRetained previewGenerationOperationCancelled]) {
    goto LABEL_19;
  }
  v13 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __71__ICAttachmentWebModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_cold_1(a1 + 32, v13);
  }

  v14 = [WeakRetained attachment];
  uint64_t v15 = [v14 URL];
  uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  id v18 = objc_loadWeakRetained(v2);
  v19 = [v18 attachment];
  int v20 = [v19 hasSynapseLink];

  if (v20)
  {
    v21 = objc_loadWeakRetained(v2);
    v22 = [v21 attachment];
    uint64_t v23 = [v22 synapseData];
    uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
    v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;
  }
  else
  {
    v26 = [WeakRetained attachment];
    v27 = [v26 previewUpdateDate];
    if (v27) {
      int v28 = 0;
    }
    else {
      int v28 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isFileURL] ^ 1;
    }

    v29 = [WeakRetained attachment];
    if ([v29 urlExpired])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    }
    else
    {
      v30 = [WeakRetained attachment];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v30 metadataExists] ^ 1 | v28;
    }
    if (!v28) {
      goto LABEL_15;
    }
    v21 = [WeakRetained attachment];
    [v21 deleteAttachmentPreviewImages];
  }

LABEL_15:
  v31 = [WeakRetained attachment];
  v32 = [v31 previewUpdateDate];
  if (v32)
  {
    v33 = [WeakRetained attachment];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v33 hasMetadata] ^ 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }

LABEL_19:
}

void __79__ICAttachmentWebModel_PreviewGeneration__extractPreviewImagesFromSynapseData___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained attachment];
  v3 = [v2 synapseBasedMetadata];

  [WeakRetained saveImagesFromLinkMetadata:v3];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3 != 0;
  v4 = [MEMORY[0x1E4F1C9C8] date];
  v5 = [WeakRetained attachment];
  [v5 setPreviewUpdateDate:v4];
}

void __75__ICAttachmentWebModel_PreviewGeneration__downloadPreviewForAttachmentURL___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28E88] requestWithURL:*(void *)(a1 + 32)];
  [v2 _setNonAppInitiated:1];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v3 = (void *)getLPMetadataProviderClass_softClass_0;
  uint64_t v15 = getLPMetadataProviderClass_softClass_0;
  if (!getLPMetadataProviderClass_softClass_0)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getLPMetadataProviderClass_block_invoke_0;
    v11[3] = &unk_1E5FD95C0;
    v11[4] = &v12;
    __getLPMetadataProviderClass_block_invoke_0((uint64_t)v11);
    v3 = (void *)v13[3];
  }
  v4 = v3;
  _Block_object_dispose(&v12, 8);
  id v5 = objc_alloc_init(v4);
  [v5 _setShouldDownloadMediaSubresources:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__ICAttachmentWebModel_PreviewGeneration__downloadPreviewForAttachmentURL___block_invoke_2;
  v8[3] = &unk_1E5FDBFE8;
  objc_copyWeak(&v10, (id *)(a1 + 64));
  v8[4] = *(void *)(a1 + 40);
  long long v7 = *(_OWORD *)(a1 + 48);
  id v6 = (id)v7;
  long long v9 = v7;
  [v5 startFetchingMetadataForRequest:v2 completionHandler:v8];

  objc_destroyWeak(&v10);
}

void __75__ICAttachmentWebModel_PreviewGeneration__downloadPreviewForAttachmentURL___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (v5 && WeakRetained)
  {
    long long v9 = [WeakRetained attachment];
    id v10 = [v9 managedObjectContext];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __75__ICAttachmentWebModel_PreviewGeneration__downloadPreviewForAttachmentURL___block_invoke_3;
    v23[3] = &unk_1E5FD8FE8;
    v23[4] = v8;
    id v11 = v5;
    uint64_t v12 = *(void *)(a1 + 32);
    id v24 = v11;
    uint64_t v25 = v12;
    [v10 performBlockAndWait:v23];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    objc_opt_class();
    v13 = [v6 userInfo];
    uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
    uint64_t v15 = ICCheckedDynamicCast();

    uint64_t v16 = [v8 attachment];
    v17 = [v16 managedObjectContext];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __75__ICAttachmentWebModel_PreviewGeneration__downloadPreviewForAttachmentURL___block_invoke_4;
    v19[3] = &unk_1E5FD8FE8;
    id v20 = v15;
    v21 = v8;
    id v22 = v6;
    id v18 = v15;
    [v17 performBlock:v19];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __75__ICAttachmentWebModel_PreviewGeneration__downloadPreviewForAttachmentURL___block_invoke_3(id *a1)
{
  id v2 = a1[4];
  v3 = [a1[5] title];
  v4 = [a1[5] summary];
  [v2 updateTitle:v3 andDescription:v4];

  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [a1[6] attachment];
  [v6 setPreviewUpdateDate:v5];

  [a1[6] saveImagesFromLinkMetadata:a1[5]];
  [a1[5] setImage:0];
  id v7 = [a1[4] attachment];
  if (([v7 metadataExists] & 1) == 0)
  {
    [v7 persistLinkMetadata:a1[5]];
    objc_msgSend(v7, "ic_postNotificationOnMainThreadWithName:", @"ICAttachmentInitialPreviewDidLoadNotification");
  }
}

void __75__ICAttachmentWebModel_PreviewGeneration__downloadPreviewForAttachmentURL___block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2 && [v2 code] != -1009)
  {
    v3 = [*(id *)(a1 + 40) attachment];
    [v3 setUrlExpired:1];

    v4 = [*(id *)(a1 + 40) attachment];
    id v5 = [v4 managedObjectContext];
    objc_msgSend(v5, "ic_save");
  }
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v7 = [*(id *)(a1 + 40) attachment];
  [v6 postNotificationName:@"ICAttachmentDidFailFetchingMetadataNotification" object:v7];

  v8 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __75__ICAttachmentWebModel_PreviewGeneration__downloadPreviewForAttachmentURL___block_invoke_4_cold_1(a1, v8);
  }
}

void __80__ICAttachmentWebModel_PreviewGeneration__updateAttachmentPreviewImagesMetadata__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "attachment", 0);
  v3 = [v2 previewImages];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    char v7 = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        [v9 width];
        if (v10 <= 192.0)
        {
          [v9 height];
          if (v11 <= 192.0) {
            continue;
          }
        }
        char v7 = 0;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }
  else
  {
    char v7 = 1;
  }

  uint64_t v12 = [*(id *)(a1 + 32) attachment];
  v13 = [v12 metadata];
  uint64_t v14 = v13;
  if (!v13) {
    v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  uint64_t v15 = (void *)[v13 mutableCopy];

  uint64_t v16 = [NSNumber numberWithBool:v7 & 1];
  [v15 setObject:v16 forKey:*MEMORY[0x1E4F83028]];

  v17 = [*(id *)(a1 + 32) attachment];
  [v17 setMetadata:v15];

  id v18 = [*(id *)(a1 + 32) attachment];
  [v18 updateChangeCountWithReason:@"Updated metadata"];

  v19 = [*(id *)(a1 + 32) attachment];
  objc_msgSend(v19, "ic_postNotificationOnMainThreadWithName:", *MEMORY[0x1E4F83040]);

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

uint64_t __55__ICAttachmentWebModel_UI__genericListThumbnailCreator__block_invoke()
{
  return [MEMORY[0x1E4FB1818] imageNamed:@"attachmentbrick_list_loading_web"];
}

uint64_t __56__ICAttachmentWebModel_UI__genericBrickThumbnailCreator__block_invoke(double a1)
{
  id v2 = objc_opt_class();
  return objc_msgSend(v2, "genericBrickThumbnailWithSize:scale:", 36.0, 36.0, a1);
}

uint64_t __61__ICAttachmentWebModel_UI__genericBrickLargeThumbnailCreator__block_invoke(double a1)
{
  id v2 = objc_opt_class();
  return objc_msgSend(v2, "genericBrickThumbnailWithSize:scale:", 72.0, 72.0, a1);
}

void __71__ICAttachmentWebModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_DEBUG, "%@ start", (uint8_t *)&v3, 0xCu);
}

void __75__ICAttachmentWebModel_PreviewGeneration__downloadPreviewForAttachmentURL___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Web preview generation failed with error: %@", (uint8_t *)&v3, 0xCu);
}

@end