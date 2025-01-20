@interface ICAttachmentModel
@end

@implementation ICAttachmentModel

uint64_t __81__ICAttachmentModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x263F5ACA0] sharedContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__ICAttachmentModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke_2;
  v7[3] = &unk_2640B8168;
  id v8 = *(id *)(a1 + 32);
  id v9 = v3;
  id v5 = v3;
  [v4 performSnapshotBackgroundTask:v7];

  return 0;
}

void __81__ICAttachmentModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = objc_msgSend(MEMORY[0x263F5AB78], "ic_existingObjectWithID:context:", *(void *)(a1 + 32), a2);
  v4 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __81__ICAttachmentModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke_2_cold_1(v3);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  v6 = [v3 attachmentModel];
  v7 = [v6 itemProviderWritingURL];
  (*(void (**)(uint64_t, void *, uint64_t, void))(v5 + 16))(v5, v7, 1, 0);
}

void __102__ICAttachmentModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = objc_msgSend(MEMORY[0x263F5AB78], "ic_existingObjectWithID:context:", *(void *)(a1 + 32), a2);
  if (v3 && [*(id *)(a1 + 40) isEqualToString:*MEMORY[0x263F5AA90]])
  {
    v4 = [v3 pasteboardData];
    uint64_t v5 = [v4 persistenceData];

    v6 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __102__ICAttachmentModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_2(v3, v5);
    }
  }
  else
  {
    v7 = [v3 attachmentModel];
    uint64_t v5 = [v7 itemProviderWritingData];

    v6 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __102__ICAttachmentModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(v3, v5);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __81__ICAttachmentModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke_2_cold_1(void *a1)
{
  v2 = [a1 shortLoggingDescription];
  id v3 = [a1 attachmentModel];
  v4 = [v3 itemProviderWritingURL];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20BE60000, v5, v6, "Providing media url for attachment: %@ => %@", v7, v8, v9, v10, v11);
}

void __102__ICAttachmentModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = [a1 shortLoggingDescription];
  [a2 length];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20BE60000, v4, v5, "Providing data attachment: %@ => %lu", v6, v7, v8, v9, v10);
}

void __102__ICAttachmentModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_2(void *a1, void *a2)
{
  id v3 = [a1 shortLoggingDescription];
  [a2 length];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20BE60000, v4, v5, "Providing pasteboard data attachment: %@ => %lu", v6, v7, v8, v9, v10);
}

@end