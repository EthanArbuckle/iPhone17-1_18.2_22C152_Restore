@interface ICAttachmentImageModel
@end

@implementation ICAttachmentImageModel

void __107__ICAttachmentImageModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = objc_msgSend(MEMORY[0x263F5AB78], "ic_existingObjectWithID:context:", *(void *)(a1 + 32), a2);
  v4 = v3;
  if (v3)
  {
    if ([v3 isChildOfDocumentGallery])
    {
      v5 = os_log_create("com.apple.notes", "DragAndDrop");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __107__ICAttachmentImageModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(v4);
      }

      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __107__ICAttachmentImageModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_76;
      v11[3] = &unk_2640B81E0;
      id v12 = *(id *)(a1 + 56);
      id v6 = (id)[v4 loadImage:v11 aboutToLoadHandler:0 forceFullSizeImage:1];
    }
    else
    {
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 56);
      v10.receiver = *(id *)(a1 + 48);
      v10.super_class = (Class)&off_26C1C4500;
      id v9 = objc_msgSendSuper2(&v10, sel_loadDataWithTypeIdentifier_forItemProviderCompletionHandler_, v7, v8);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __107__ICAttachmentImageModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_76(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_msgSend(a2, "ic_JPEGData");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, 0);
}

void __107__ICAttachmentImageModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [a1 shortLoggingDescription];
  id v3 = [a1 attachmentModel];
  v4 = [v3 itemProviderWritingURL];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20BE60000, v5, v6, "Providing gallery image attachment: %@ => %@", v7, v8, v9, v10, v11);
}

@end