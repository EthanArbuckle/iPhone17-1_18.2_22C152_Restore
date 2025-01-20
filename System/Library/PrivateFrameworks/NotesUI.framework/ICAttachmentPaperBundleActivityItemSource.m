@interface ICAttachmentPaperBundleActivityItemSource
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)attachmentTypeUTI;
@end

@implementation ICAttachmentPaperBundleActivityItemSource

- (id)attachmentTypeUTI
{
  return (id)[(id)*MEMORY[0x1E4F44450] identifier];
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "data", a3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ICAttachmentActivityItemSource *)self attachment];
  int v9 = [v8 isPasswordProtected];

  if (v9)
  {
    v10 = (void *)MEMORY[0x1B3E9ED80]();
    v11 = [(ICAttachmentActivityItemSource *)self attachment];
    v12 = [v11 fallbackPDFData];
  }
  else
  {
    v13 = [(ICAttachmentActivityItemSource *)self attachment];
    v12 = [v13 previewItemURL];
  }
  return v12;
}

@end