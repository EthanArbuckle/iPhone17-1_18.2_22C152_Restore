@interface ICMarkupUtilities
+ (BOOL)hasPrivateImageMetadata:(id)a3;
+ (id)cleanImageMetadataFromData:(id)a3;
+ (id)createMarkupViewController;
+ (id)createProcessingMarkupViewControllerOutWindow:(id *)a3;
+ (id)imageDataWithMarkupModelData:(id)a3 sourceImageData:(id)a4;
+ (id)imageDataWithMarkupModelData:(id)a3 sourceImageData:(id)a4 embedData:(BOOL)a5;
+ (id)imageDataWithMarkupModelData:(id)a3 sourceImageURL:(id)a4;
+ (id)markupModelDataFromData:(id)a3;
+ (id)markupModelDataFromDataAtURL:(id)a3;
+ (void)applyMarkupModelData:(id)a3 attachment:(id)a4 completionBlock:(id)a5;
+ (void)applyReturnedMarkupURL:(id)a3 attachment:(id)a4 completionBlock:(id)a5;
+ (void)embedReturnedMarkupURL:(id)a3 attachment:(id)a4 completionBlock:(id)a5;
+ (void)extractReturnedMarkupURL:(id)a3 attachment:(id)a4 completionBlock:(id)a5;
@end

@implementation ICMarkupUtilities

+ (BOOL)hasPrivateImageMetadata:(id)a3
{
  id v3 = a3;
  char v4 = [getMarkupViewControllerClass() hasPrivateImageMetadata:v3];

  return v4;
}

+ (id)cleanImageMetadataFromData:(id)a3
{
  id v3 = a3;
  char v4 = [getMarkupViewControllerClass() cleanImageMetadataFromData:v3];

  return v4;
}

+ (id)createMarkupViewController
{
  id v2 = objc_alloc_init((Class)getMarkupViewControllerClass());
  return v2;
}

+ (id)createProcessingMarkupViewControllerOutWindow:(id *)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  uint64_t v5 = MEMORY[0x1E4F143A8];
  performBlockOnMainThreadAndWait();
  objc_msgSend((id)v8[5], "setEncryptPrivateMetadata:", 0, v5, 3221225472, __67__ICMarkupUtilities_createProcessingMarkupViewControllerOutWindow___block_invoke, &unk_1E64A44D8, &v7, a1);
  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

void __67__ICMarkupUtilities_createProcessingMarkupViewControllerOutWindow___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) createMarkupViewController];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (id)imageDataWithMarkupModelData:(id)a3 sourceImageData:(id)a4
{
  return (id)[a1 imageDataWithMarkupModelData:a3 sourceImageData:a4 embedData:0];
}

+ (id)imageDataWithMarkupModelData:(id)a3 sourceImageData:(id)a4 embedData:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)MEMORY[0x1C877DB80]();
  id v24 = 0;
  v11 = [a1 createProcessingMarkupViewControllerOutWindow:&v24];
  id v12 = v24;
  v20[1] = (id)MEMORY[0x1E4F143A8];
  v20[2] = (id)3221225472;
  v20[3] = __76__ICMarkupUtilities_imageDataWithMarkupModelData_sourceImageData_embedData___block_invoke;
  v20[4] = &unk_1E64A4500;
  id v13 = v11;
  id v21 = v13;
  id v14 = v9;
  id v22 = v14;
  id v15 = v8;
  id v23 = v15;
  performBlockOnMainThreadAndWait();
  v20[0] = 0;
  v16 = [v13 dataRepresentationEmbeddingSourceImageAndEditModel:v5 error:v20];
  id v17 = v20[0];
  if (v17)
  {
    v18 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[ICMarkupUtilities imageDataWithMarkupModelData:sourceImageData:embedData:]();
    }
  }

  return v16;
}

uint64_t __76__ICMarkupUtilities_imageDataWithMarkupModelData_sourceImageData_embedData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setData:*(void *)(a1 + 40) withArchivedModelData:*(void *)(a1 + 48)];
}

+ (id)imageDataWithMarkupModelData:(id)a3 sourceImageURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1C877DB80]();
  id v22 = 0;
  id v9 = [a1 createProcessingMarkupViewControllerOutWindow:&v22];
  id v10 = v22;
  v18[1] = (id)MEMORY[0x1E4F143A8];
  v18[2] = (id)3221225472;
  v18[3] = __65__ICMarkupUtilities_imageDataWithMarkupModelData_sourceImageURL___block_invoke;
  v18[4] = &unk_1E64A4500;
  id v11 = v9;
  id v19 = v11;
  id v12 = v7;
  id v20 = v12;
  id v13 = v6;
  id v21 = v13;
  performBlockOnMainThreadAndWait();
  v18[0] = 0;
  id v14 = [v11 dataRepresentationEmbeddingSourceImageAndEditModel:0 error:v18];
  id v15 = v18[0];
  if (v15)
  {
    v16 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[ICMarkupUtilities imageDataWithMarkupModelData:sourceImageData:embedData:]();
    }
  }

  return v14;
}

uint64_t __65__ICMarkupUtilities_imageDataWithMarkupModelData_sourceImageURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFileURL:*(void *)(a1 + 40) withArchivedModelData:*(void *)(a1 + 48)];
}

+ (void)applyReturnedMarkupURL:(id)a3 attachment:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  id v11 = [v9 managedObjectContext];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __71__ICMarkupUtilities_applyReturnedMarkupURL_attachment_completionBlock___block_invoke;
  v16 = &unk_1E64A4528;
  v18 = &v19;
  id v12 = v9;
  id v17 = v12;
  [v11 performBlockAndWait:&v13];

  if (*((unsigned char *)v20 + 24)) {
    objc_msgSend(a1, "embedReturnedMarkupURL:attachment:completionBlock:", v8, v12, v10, v13, v14, v15, v16);
  }
  else {
    objc_msgSend(a1, "extractReturnedMarkupURL:attachment:completionBlock:", v8, v12, v10, v13, v14, v15, v16);
  }

  _Block_object_dispose(&v19, 8);
}

uint64_t __71__ICMarkupUtilities_applyReturnedMarkupURL_attachment_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) shouldEmbedMarkupDataInMedia];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (void)embedReturnedMarkupURL:(id)a3 attachment:(id)a4 completionBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [v9 startAccessingSecurityScopedResource];
  id v12 = [v10 managedObjectContext];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__ICMarkupUtilities_embedReturnedMarkupURL_attachment_completionBlock___block_invoke;
  v16[3] = &unk_1E64A4550;
  id v17 = v10;
  id v18 = v9;
  id v20 = a1;
  SEL v21 = a2;
  id v19 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  [v12 performBlockAndWait:v16];
}

void __71__ICMarkupUtilities_embedReturnedMarkupURL_attachment_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) media];
  uint64_t v3 = *(void *)(a1 + 40);
  id v19 = 0;
  char v4 = [v2 writeDataFromFileURL:v3 error:&v19];
  id v5 = v19;

  [*(id *)(a1 + 40) stopAccessingSecurityScopedResource];
  id v6 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 64));
    *(_DWORD *)buf = 138412546;
    SEL v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_DEFAULT, "%@ %@ B", buf, 0x16u);
  }
  if (v4)
  {
    id v10 = [*(id *)(a1 + 32) media];
    id v11 = [v10 data];

    objc_msgSend(*(id *)(a1 + 32), "setHasMarkupData:", objc_msgSend(*(id *)(a1 + 56), "hasPrivateImageMetadata:", v11));
    [*(id *)(a1 + 32) setPreviewUpdateDate:0];
    [*(id *)(a1 + 32) attachmentDidChange];
    id v12 = [*(id *)(a1 + 32) managedObjectContext];
    id v18 = v5;
    [v12 save:&v18];
    id v13 = v18;

    if (v13)
    {
      id v14 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __71__ICMarkupUtilities_embedReturnedMarkupURL_attachment_completionBlock___block_invoke_cold_1();
      }
    }
    id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v16 = [*(id *)(a1 + 32) objectID];
    [v15 postNotificationName:@"ICAttachmentNeedsPreviewGenerationNotification" object:v16];
  }
  else
  {
    id v11 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __71__ICMarkupUtilities_embedReturnedMarkupURL_attachment_completionBlock___block_invoke_cold_1();
    }
    id v13 = v5;
  }

  uint64_t v17 = *(void *)(a1 + 48);
  if (v17) {
    (*(void (**)(void))(v17 + 16))();
  }
}

+ (void)extractReturnedMarkupURL:(id)a3 attachment:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v10 startAccessingSecurityScopedResource];
  id v11 = [a1 markupModelDataFromDataAtURL:v10];
  [v10 stopAccessingSecurityScopedResource];

  [a1 applyMarkupModelData:v11 attachment:v9 completionBlock:v8];
}

+ (void)applyMarkupModelData:(id)a3 attachment:(id)a4 completionBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 managedObjectContext];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__ICMarkupUtilities_applyMarkupModelData_attachment_completionBlock___block_invoke;
  v14[3] = &unk_1E64A4578;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  [v10 performBlockAndWait:v14];
}

uint64_t __69__ICMarkupUtilities_applyMarkupModelData_attachment_completionBlock___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) markupModelData];
  if (v2 | v3)
  {
    char v4 = (void *)v3;
    char v5 = [(id)v2 isEqual:v3];

    if ((v5 & 1) == 0)
    {
      [*(id *)(a1 + 40) setMarkupModelData:*(void *)(a1 + 32)];
      [*(id *)(a1 + 40) attachmentDidChange];
      [*(id *)(a1 + 40) setPreviewUpdateDate:0];
      id v6 = [*(id *)(a1 + 40) parentAttachment];
      [v6 attachmentDidChange];

      id v7 = [*(id *)(a1 + 40) parentAttachment];
      [v7 setPreviewUpdateDate:0];

      id v8 = [*(id *)(a1 + 40) managedObjectContext];
      objc_msgSend(v8, "ic_save");

      id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v10 = [*(id *)(a1 + 40) objectID];
      [v9 postNotificationName:@"ICAttachmentDidUpdateMarkupDataNotification" object:v10];

      id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v12 = [*(id *)(a1 + 40) objectID];
      [v11 postNotificationName:@"ICAttachmentNeedsPreviewGenerationNotification" object:v12];
    }
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v14 = *(uint64_t (**)(void))(result + 16);
    return v14();
  }
  return result;
}

+ (id)markupModelDataFromDataAtURL:(id)a3
{
  id v4 = a3;
  char v5 = (void *)MEMORY[0x1C877DB80]();
  id v13 = 0;
  id v6 = [a1 createProcessingMarkupViewControllerOutWindow:&v13];
  id v7 = v13;
  id v11 = v6;
  id v12 = v4;
  id v8 = v6;
  performBlockOnMainThreadAndWait();
  id v9 = [v8 createArchivedModelData];

  return v9;
}

uint64_t __50__ICMarkupUtilities_markupModelDataFromDataAtURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFileURL:*(void *)(a1 + 40) withArchivedModelData:0];
}

+ (id)markupModelDataFromData:(id)a3
{
  id v4 = a3;
  char v5 = (void *)MEMORY[0x1C877DB80]();
  id v13 = 0;
  id v6 = [a1 createProcessingMarkupViewControllerOutWindow:&v13];
  id v7 = v13;
  id v11 = v6;
  id v12 = v4;
  id v8 = v6;
  performBlockOnMainThreadAndWait();
  id v9 = [v8 createArchivedModelData];

  return v9;
}

uint64_t __45__ICMarkupUtilities_markupModelDataFromData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setData:*(void *)(a1 + 40) withArchivedModelData:0];
}

+ (void)imageDataWithMarkupModelData:sourceImageData:embedData:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Markup error: %@", v2, v3, v4, v5, v6);
}

void __71__ICMarkupUtilities_embedReturnedMarkupURL_attachment_completionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

@end