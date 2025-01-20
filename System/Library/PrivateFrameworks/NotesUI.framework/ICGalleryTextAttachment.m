@interface ICGalleryTextAttachment
- (double)viewCornerRadius;
- (id)attachmentFileWrapper;
- (void)attachmentFileWrapper;
@end

@implementation ICGalleryTextAttachment

- (double)viewCornerRadius
{
  v2 = [(ICAbstractTextAttachment *)self attachment];
  int v3 = [v2 preferredViewSize];

  double result = 12.0;
  if (v3 == 1) {
    return 16.0;
  }
  return result;
}

- (id)attachmentFileWrapper
{
  objc_opt_class();
  int v3 = [(ICAbstractTextAttachment *)self attachment];
  v4 = [v3 attachmentModel];
  v5 = ICDynamicCast();
  v6 = [v5 blockingGeneratePDFURL];

  if (v6)
  {
    id v11 = 0;
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F28CF0]) initWithURL:v6 options:0 error:&v11];
    id v8 = v11;
    if (!v7)
    {
      v9 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(ICGalleryTextAttachment *)(uint64_t)v8 attachmentFileWrapper];
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)attachmentFileWrapper
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Failed to create file wrapper from generated PDF: %@", (uint8_t *)&v2, 0xCu);
}

@end