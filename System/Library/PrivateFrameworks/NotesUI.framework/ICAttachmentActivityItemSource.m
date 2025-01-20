@interface ICAttachmentActivityItemSource
- (ICAttachment)attachment;
- (ICAttachmentActivityItemSource)initWithAttachment:(id)a3;
- (NSString)attachmentFileName;
- (NSString)attachmentTypeUTI;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (void)setAttachment:(id)a3;
@end

@implementation ICAttachmentActivityItemSource

- (ICAttachmentActivityItemSource)initWithAttachment:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICAttachmentActivityItemSource;
  v5 = [(ICAttachmentActivityItemSource *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ICAttachmentActivityItemSource *)v5 setAttachment:v4];
  }

  return v6;
}

- (NSString)attachmentTypeUTI
{
  v2 = [(ICAttachmentActivityItemSource *)self attachment];
  v3 = [v2 typeUTI];

  return (NSString *)v3;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "data", a3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  int v5 = [a4 isEqualToString:*MEMORY[0x1E4F435A0]];
  uint64_t v6 = *MEMORY[0x1E4F83138];
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    objc_super v8 = 0;
  }
  else
  {
    v9 = [(ICAttachmentActivityItemSource *)self attachment];
    v10 = [v9 pasteboardData];

    if (v10)
    {
      uint64_t v13 = v6;
      v11 = [v10 persistenceData];
      v14[0] = v11;
      objc_super v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    }
    else
    {
      objc_super v8 = 0;
    }
  }
  return v8;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  if ([a4 isEqualToString:*MEMORY[0x1E4F435A0]]) {
    id v4 = (__CFString *)(id)*MEMORY[0x1E4F83138];
  }
  else {
    id v4 = &stru_1F0973378;
  }
  return v4;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4 = [(ICAttachmentActivityItemSource *)self attachment];
  if ([v4 isTable])
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v6 = [(ICAttachmentActivityItemSource *)self attachment];
    char v7 = [v6 usesLinkPresentation];

    if (v7)
    {
      id v5 = 0;
      goto LABEL_7;
    }
    id v5 = objc_alloc_init(MEMORY[0x1E4F30A78]);
    objc_super v8 = [(ICAttachmentActivityItemSource *)self attachment];
    objc_msgSend(MEMORY[0x1E4FB1BA8], "ic_scale");
    id v4 = objc_msgSend(v8, "attachmentPreviewImageWithMinSize:scale:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), v9);

    id v10 = objc_alloc(MEMORY[0x1E4F28D78]);
    v11 = [v4 previewImageURL];
    v12 = (void *)[v10 initWithContentsOfURL:v11];
    [v5 setIconProvider:v12];

    uint64_t v13 = [(ICAttachmentActivityItemSource *)self attachmentFileName];
    [v5 setTitle:v13];
  }
LABEL_7:
  return v5;
}

- (NSString)attachmentFileName
{
  v3 = [(ICAttachmentActivityItemSource *)self attachment];
  id v4 = [v3 title];

  if (![v4 length])
  {
    id v5 = [(ICAttachmentActivityItemSource *)self attachment];
    uint64_t v6 = [v5 note];
    uint64_t v7 = [v6 title];

    id v4 = (void *)v7;
  }
  objc_super v8 = [(ICAttachmentActivityItemSource *)self attachmentTypeUTI];
  if (![v4 length])
  {
    uint64_t v9 = [MEMORY[0x1E4F832A0] filenameFromUTI:v8];

    id v4 = (void *)v9;
  }
  if (![v4 length]) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"name.length != 0", "-[ICAttachmentActivityItemSource attachmentFileName]", 1, 0, @"Empty filename for uti %@", v8 functionName simulateCrash showAlert format];
  }
  id v10 = [MEMORY[0x1E4F832A0] filenameExtensionForUTI:v8];
  if (v10)
  {
    v11 = [v4 pathExtension];
    char v12 = [v11 isEqual:v10];

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = [v4 stringByAppendingPathExtension:v10];

      id v4 = (void *)v13;
    }
  }

  return (NSString *)v4;
}

- (ICAttachment)attachment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachment);
  return (ICAttachment *)WeakRetained;
}

- (void)setAttachment:(id)a3
{
}

- (void).cxx_destruct
{
}

@end