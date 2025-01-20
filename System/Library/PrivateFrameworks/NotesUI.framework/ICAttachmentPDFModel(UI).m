@interface ICAttachmentPDFModel(UI)
- (void)drawPreviewInRect:()UI;
- (void)genericBrickThumbnailCreator;
- (void)genericListThumbnailCreator;
@end

@implementation ICAttachmentPDFModel(UI)

- (void)genericListThumbnailCreator
{
  return &__block_literal_global_17;
}

- (void)genericBrickThumbnailCreator
{
  return &__block_literal_global_12;
}

- (void)drawPreviewInRect:()UI
{
  v10 = [a1 attachment];
  int v11 = [v10 preferredViewSize];

  if (v11 == 1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)&off_1F0A2EBF8;
    objc_msgSendSuper2(&v19, sel_drawPreviewInRect_, a2, a3, a4, a5);
    return;
  }
  v12 = (void *)MEMORY[0x1B3E9ED80]();
  id v13 = objc_alloc(MEMORY[0x1E4F38DA0]);
  v14 = [a1 attachment];
  v15 = [v14 media];
  v16 = [v15 mediaURL];
  v17 = (void *)[v13 initWithURL:v16];

  if (!v17)
  {
    v18 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ICAttachmentPDFModel(UI) drawPreviewInRect:](a1);
    }
    goto LABEL_9;
  }
  if (!+[ICPDFPreviewHelper drawPreviewOfPDFDocument:inRect:](ICPDFPreviewHelper, "drawPreviewOfPDFDocument:inRect:", v17, a2, a3, a4, a5))
  {
    v18 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ICAttachmentPDFModel(UI) drawPreviewInRect:](a1);
    }
LABEL_9:
  }
}

- (void)drawPreviewInRect:()UI .cold.1(void *a1)
{
  v1 = [a1 attachment];
  v2 = objc_msgSend(v1, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_0_0(&dword_1B08EB000, v3, v4, "Unable to load pdfData/mediaURL for attachment while previewing note: %@", v5, v6, v7, v8, 2u);
}

- (void)drawPreviewInRect:()UI .cold.2(void *a1)
{
  v1 = [a1 attachment];
  v2 = objc_msgSend(v1, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_0_0(&dword_1B08EB000, v3, v4, "Unable to draw preview for attachment: %@", v5, v6, v7, v8, 2u);
}

@end