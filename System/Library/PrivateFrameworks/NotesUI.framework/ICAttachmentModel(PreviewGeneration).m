@interface ICAttachmentModel(PreviewGeneration)
- (BOOL)needToGeneratePreviews;
- (uint64_t)didCancelPreviewGeneratorOperation;
- (uint64_t)generateAsynchronousPreviews;
- (uint64_t)generatePreviewsDuringCloudActivity;
- (uint64_t)generatePreviewsInOperation:()PreviewGeneration;
- (uint64_t)needToPostProcessAttachment;
- (uint64_t)requiresNetworkToGeneratePreview;
- (uint64_t)tooLargeForPreviewGeneration;
@end

@implementation ICAttachmentModel(PreviewGeneration)

- (uint64_t)generatePreviewsInOperation:()PreviewGeneration
{
  return 0;
}

- (BOOL)needToGeneratePreviews
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ([a1 hasPreviews])
  {
    v4 = [a1 attachment];
    v5 = [v4 previewUpdateDate];
    if (v5)
    {
      v6 = [a1 attachment];
      v7 = [v6 previewImages];
      BOOL v8 = [v7 count] == 0;
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  v9 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = NSStringFromSelector(a2);
    v20 = [a1 attachment];
    v14 = [v20 identifier];
    int v15 = [a1 hasPreviews];
    v16 = [a1 attachment];
    v17 = [v16 previewUpdateDate];
    v18 = [a1 attachment];
    v19 = [v18 previewImages];
    *(_DWORD *)buf = 138413826;
    v22 = v12;
    __int16 v23 = 2112;
    v24 = v13;
    __int16 v25 = 2112;
    v26 = v14;
    __int16 v27 = 1024;
    BOOL v28 = v8;
    __int16 v29 = 1024;
    int v30 = v15;
    __int16 v31 = 2112;
    v32 = v17;
    __int16 v33 = 2048;
    uint64_t v34 = [v19 count];
    _os_log_debug_impl(&dword_1B08EB000, v9, OS_LOG_TYPE_DEBUG, "%@ %@ %@ return %d hasPreviews %d self.attachment.previewUpdateDate %@ self.attachment.previewImages.count %lu", buf, 0x40u);
  }
  return v8;
}

- (uint64_t)generateAsynchronousPreviews
{
  return 0;
}

- (uint64_t)generatePreviewsDuringCloudActivity
{
  return 1;
}

- (uint64_t)requiresNetworkToGeneratePreview
{
  return 0;
}

- (uint64_t)didCancelPreviewGeneratorOperation
{
  return [a1 setPreviewGenerationOperationCancelled:1];
}

- (uint64_t)needToPostProcessAttachment
{
  return 0;
}

- (uint64_t)tooLargeForPreviewGeneration
{
  return 0;
}

@end