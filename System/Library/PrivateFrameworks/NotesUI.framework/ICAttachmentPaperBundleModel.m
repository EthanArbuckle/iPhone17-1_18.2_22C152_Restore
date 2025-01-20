@interface ICAttachmentPaperBundleModel
@end

@implementation ICAttachmentPaperBundleModel

void __70__ICAttachmentPaperBundleModel_PreviewGeneration__generateFallbackPDF__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  *(unsigned char *)(*((void *)v1[3] + 1) + 24) = [*(id *)(a1 + 32) writeFallbackPDFData:*(void *)(a1 + 40)];
  [(id)objc_opt_class() generateImagePreviewsForAttachment:*v1 withFallbackPDFData:v1[1]];
  if (*(unsigned char *)(*((void *)v1[3] + 1) + 24))
  {
    v2 = [MEMORY[0x1E4F1C9C8] date];
    [*v1 setPreviewUpdateDate:v2];

    [*v1 updateChangeCountWithReason:@"Regenerated paper document fallback PDF and preview images"];
    v3 = [*v1 modificationDate];
    v4 = [*v1 previewUpdateDate];
    uint64_t v5 = [v3 compare:v4];

    if (v5 == 1)
    {
      v6 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __70__ICAttachmentPaperBundleModel_PreviewGeneration__generateFallbackPDF__block_invoke_cold_1(v1, v6);
      }

      v7 = [*v1 previewUpdateDate];
      [*v1 setModificationDate:v7];
    }
    else
    {
      id v8 = [*v1 modificationDate];
      [*v1 setModificationDate:v8];
    }
  }
}

void __79__ICAttachmentPaperBundleModel_PreviewGeneration__generatePreviewsInOperation___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) paperBundleURL];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v8 = [*(id *)(a1 + 32) attachment];
  uint64_t v5 = objc_msgSend(v8, "ic_loggingIdentifier");
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __70__ICAttachmentPaperBundleModel_PreviewGeneration__generateFallbackPDF__block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend(*a1, "ic_loggingDescription");
  uint64_t v5 = [*a1 modificationDate];
  uint64_t v6 = [*a1 creationDate];
  int v7 = 138412802;
  id v8 = v4;
  __int16 v9 = 2112;
  v10 = v5;
  __int16 v11 = 2112;
  v12 = v6;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Attachment's modificationDate was later than its previewUpdateDate. Using previewUpdateDate as modificationDate so we don't end up in a preview loop (Attachment: %@, modificationDate: %@, previewUpdateDate: %@).", (uint8_t *)&v7, 0x20u);
}

@end