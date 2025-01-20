@interface ICDrawingTextAttachment
- ($01BB1521EC52D44A8E7628F5261DCEC8)attachmentBoundsMargins;
- (BOOL)requiresSpaceAfterAttachmentForPrinting;
- (BOOL)supportsMultipleThumbnailsOnSameLine;
- (double)viewCornerRadius;
- (id)attachmentFileWrapper;
- (id)printableTextAttachment;
- (void)attachmentFileWrapper;
@end

@implementation ICDrawingTextAttachment

- (id)attachmentFileWrapper
{
  v3 = [(ICAbstractTextAttachment *)self attachment];

  if (v3)
  {
    v4 = [(ICAbstractTextAttachment *)self attachment];
    [MEMORY[0x1E4F83368] defaultPixelSize];
    v5 = objc_msgSend(v4, "attachmentPreviewImageWithMinSize:scale:");

    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F28CF0]);
      v7 = [v5 orientedPreviewImageURL];
      id v11 = 0;
      v3 = (void *)[v6 initWithURL:v7 options:0 error:&v11];
      id v8 = v11;

      if (v8)
      {
        v9 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          [(ICDrawingTextAttachment *)(uint64_t)v8 attachmentFileWrapper];
        }
      }
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)attachmentBoundsMargins
{
  v17.receiver = self;
  v17.super_class = (Class)ICDrawingTextAttachment;
  [(ICTextAttachment *)&v17 attachmentBoundsMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(ICAbstractTextAttachment *)self attachment];
  int v12 = [v11 preferredViewSize];

  if (v12) {
    double v13 = v8;
  }
  else {
    double v13 = 4.0;
  }
  if (v12) {
    double v14 = v10;
  }
  else {
    double v14 = 5.0;
  }
  double v15 = v4;
  double v16 = v6;
  result.var3 = v14;
  result.var2 = v13;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (BOOL)requiresSpaceAfterAttachmentForPrinting
{
  return 1;
}

- (BOOL)supportsMultipleThumbnailsOnSameLine
{
  return 0;
}

- (double)viewCornerRadius
{
  return 12.0;
}

- (id)printableTextAttachment
{
  v2 = [(ICAbstractTextAttachment *)self attachment];
  [MEMORY[0x1E4F83368] defaultPixelSize];
  double v3 = objc_msgSend(v2, "attachmentPreviewImageWithMinSize:scale:");

  double v4 = [v3 orientedPreviewImageURL];
  if (v4)
  {
    uint64_t v8 = 0;
    double v5 = (void *)[objc_alloc(MEMORY[0x1E4F28CF0]) initWithURL:v4 options:0 error:&v8];
    double v6 = [[ICPrintableTextAttachment alloc] initWithFileWrapper:v5];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (void)attachmentFileWrapper
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Error creating drawing file wrapper: %@", (uint8_t *)&v2, 0xCu);
}

@end