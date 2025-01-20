@interface ICAttachmentGenericModel
@end

@implementation ICAttachmentGenericModel

void __75__ICAttachmentGenericModel_PreviewGeneration__generatePreviewsInOperation___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) media];
  uint64_t v2 = [v5 mediaURL];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __75__ICAttachmentGenericModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    [*(id *)(a1 + 32) persistLinkMetadata:v5];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else if (v6)
  {
    v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __75__ICAttachmentGenericModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2_cold_1((uint64_t)v7, v8);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __75__ICAttachmentGenericModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Error generating metadata: %@", (uint8_t *)&v2, 0xCu);
}

@end