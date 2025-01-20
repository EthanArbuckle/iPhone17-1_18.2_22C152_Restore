@interface ICNote
@end

@implementation ICNote

void __91__ICNote_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  uint64_t v4 = a1[4];
  id v14 = 0;
  v5 = [v3 existingObjectWithID:v4 error:&v14];

  id v6 = v14;
  v7 = ICDynamicCast();

  if (v7)
  {
    v8 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __91__ICNote_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_2(v7);
    }

    [v7 prepareForCopyingData];
    v9 = [v7 textStorage];
    uint64_t v10 = [v9 length];

    v11 = [v7 textStorage];
    v12 = objc_msgSend(v11, "copyDataForUTI:range:persistenceHelper:", a1[5], 0, v10, v7);
  }
  else
  {
    v12 = 0;
  }
  v13 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __91__ICNote_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(v12, v13);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __104__ICNote_ItemProviderWriting___loadFileRepresentationOfTypeIdentifier_forItemProviderCompletionHandler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  uint64_t v4 = a1[4];
  id v14 = 0;
  v5 = [v3 existingObjectWithID:v4 error:&v14];

  id v6 = v14;
  v7 = ICDynamicCast();

  if (!v7) {
    goto LABEL_6;
  }
  v8 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __104__ICNote_ItemProviderWriting___loadFileRepresentationOfTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(v7);
  }

  [v7 prepareForCopyingData];
  v9 = [v7 textStorage];
  uint64_t v10 = [v9 length];

  v11 = [v7 textStorage];
  v12 = objc_msgSend(v11, "filteredAttributedStringForUTI:range:", a1[5], 0, v10);

  if (v12)
  {
    id v13 = (id)[v12 _loadFileRepresentationOfTypeIdentifier:a1[5] forItemProviderCompletionHandler:a1[6]];
  }
  else
  {
LABEL_6:
    (*(void (**)(void))(a1[6] + 16))();
  }
}

void __91__ICNote_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = [a1 length];
  _os_log_debug_impl(&dword_20BE60000, a2, OS_LOG_TYPE_DEBUG, "Returning data for, length: %lu", (uint8_t *)&v3, 0xCu);
}

void __91__ICNote_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_20BE60000, v2, v3, "About to copy data for note: %@, uti: %@", v4, v5, v6, v7, v8);
}

void __104__ICNote_ItemProviderWriting___loadFileRepresentationOfTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_20BE60000, v2, v3, "About to load file for note: %@, uti: %@", v4, v5, v6, v7, v8);
}

@end