@interface ICAttachmentGalleryModel
@end

@implementation ICAttachmentGalleryModel

void __109__ICAttachmentGalleryModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(MEMORY[0x263F5AB78], "ic_existingObjectWithID:context:", a1[4], a2);
  v4 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __109__ICAttachmentGalleryModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(v3);
  }

  uint64_t v5 = a1[5];
  id v14 = 0;
  v6 = [MEMORY[0x263F5B308] blockingGeneratePDFURLForAttachment:v3 withProgress:v5 error:&v14];
  id v7 = v14;
  if (v6)
  {
    id v13 = v7;
    v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v6 options:1 error:&v13];
    id v9 = v13;

    (*(void (**)(void))(a1[6] + 16))();
    v10 = [MEMORY[0x263F08850] defaultManager];
    id v12 = 0;
    [v10 removeItemAtURL:v6 error:&v12];
    id v7 = v12;

    if (v7)
    {
      v11 = os_log_create("com.apple.notes", "DragAndDrop");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v7;
        _os_log_impl(&dword_20BE60000, v11, OS_LOG_TYPE_DEFAULT, "Failed to remove temporary file for attachment item provider: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

id __88__ICAttachmentGalleryModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263F08AB8]);
  uint64_t v5 = [MEMORY[0x263F5ACA0] sharedContext];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __88__ICAttachmentGalleryModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke_2;
  v11[3] = &unk_2640B81B8;
  id v12 = *(id *)(a1 + 32);
  id v6 = v4;
  id v13 = v6;
  id v14 = v3;
  id v7 = v3;
  [v5 performBackgroundTask:v11];

  v8 = v14;
  id v9 = v6;

  return v9;
}

void __88__ICAttachmentGalleryModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke_2(void *a1, uint64_t a2)
{
  id v3 = objc_msgSend(MEMORY[0x263F5AB78], "ic_existingObjectWithID:context:", a1[4], a2);
  id v4 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __88__ICAttachmentGalleryModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke_2_cold_1(v3);
  }

  uint64_t v5 = a1[5];
  id v8 = 0;
  id v6 = [MEMORY[0x263F5B308] blockingGeneratePDFURLForAttachment:v3 withProgress:v5 error:&v8];
  id v7 = v8;
  (*(void (**)(void))(a1[6] + 16))();
}

void __109__ICAttachmentGalleryModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_20BE60000, v2, v3, "Generating PDF data for attachment: %@", v4, v5, v6, v7, v8);
}

void __88__ICAttachmentGalleryModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke_2_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_20BE60000, v2, v3, "Generating PDF file for attachment: %@", v4, v5, v6, v7, v8);
}

@end