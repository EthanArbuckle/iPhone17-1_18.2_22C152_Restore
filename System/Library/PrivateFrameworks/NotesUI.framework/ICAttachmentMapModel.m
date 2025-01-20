@interface ICAttachmentMapModel
@end

@implementation ICAttachmentMapModel

void __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained attachment];
  uint64_t v4 = [v3 URL];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  v7 = [WeakRetained attachment];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2;
  v8[3] = &unk_1E5FDAB58;
  v8[4] = WeakRetained;
  [v7 updatePlaceInLocationIfNeededHandler:v8];
}

void __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2_cold_1((uint64_t)v5, v6);
    }
    goto LABEL_6;
  }
  if (a2)
  {
    v6 = [*(id *)(a1 + 32) attachment];
    v7 = [v6 managedObjectContext];
    objc_msgSend(v7, "ic_save");

LABEL_6:
  }
}

void __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_11(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2_12;
  v5[3] = &unk_1E5FDABA8;
  v5[4] = *(void *)(a1 + 48);
  long long v4 = *(_OWORD *)(a1 + 56);
  id v3 = (id)v4;
  long long v6 = v4;
  [v1 startFetchingMetadataForRequest:v2 completionHandler:v5];
}

void __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2_12(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = [*(id *)(a1 + 32) attachment];
    v9 = [v8 managedObjectContext];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_3;
    v14[3] = &unk_1E5FD91D0;
    id v10 = v5;
    uint64_t v11 = *(void *)(a1 + 32);
    id v15 = v10;
    uint64_t v16 = v11;
    [v9 performBlock:v14];
  }
  else if (v6)
  {
    v12 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2_12_cold_1((uint64_t)v7, v12);
    }

    v13 = [*(id *)(a1 + 32) attachment];
    objc_msgSend(v13, "ic_postNotificationOnMainThreadWithName:", @"ICAttachmentDidFailFetchingMetadataNotification");

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_3(uint64_t a1)
{
  v9 = [*(id *)(a1 + 32) specialization];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  id v10 = (void *)getLPMapMetadataClass_softClass;
  uint64_t v23 = getLPMapMetadataClass_softClass;
  if (!getLPMapMetadataClass_softClass)
  {
    v19[1] = 3221225472;
    v19[2] = __getLPMapMetadataClass_block_invoke;
    v19[3] = &unk_1E5FD95C0;
    v19[4] = &v20;
    __getLPMapMetadataClass_block_invoke((uint64_t)v19, v2, v3, v4, v5, v6, v7, v8, v18, MEMORY[0x1E4F143A8]);
    id v10 = (void *)v21[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v20, 8);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v13 = [*(id *)(a1 + 32) specialization];
    v14 = [v13 address];
    id v15 = [*(id *)(a1 + 40) attachment];
    [v15 setSummary:v14];
  }
  uint64_t v16 = [*(id *)(a1 + 40) attachment];
  [v16 persistLinkMetadata:*(void *)(a1 + 32)];

  v17 = [*(id *)(a1 + 40) attachment];
  objc_msgSend(v17, "ic_postNotificationOnMainThreadWithName:", @"ICAttachmentInitialPreviewDidLoadNotification");
}

uint64_t __55__ICAttachmentMapModel_UI__genericListThumbnailCreator__block_invoke()
{
  return [MEMORY[0x1E4FB1818] imageNamed:@"attachmentbrick_list_loading_map"];
}

uint64_t __56__ICAttachmentMapModel_UI__genericBrickThumbnailCreator__block_invoke()
{
  return [MEMORY[0x1E4FB1818] imageNamed:@"attachmentbrick_note_loading_map"];
}

void __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Updating map location failed: %@", (uint8_t *)&v2, 0xCu);
}

void __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2_12_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Map preview generation failed with error: %@", (uint8_t *)&v2, 0xCu);
}

@end