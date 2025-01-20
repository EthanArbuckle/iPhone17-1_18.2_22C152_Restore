@interface MLULookupItemAttachmentContent
- (MLULookupItemAttachmentContent)initWithAttachments:(id)a3 currentAttachmentIndex:(unint64_t)a4;
- (id)previewActions;
- (unint64_t)commitType;
@end

@implementation MLULookupItemAttachmentContent

- (id)previewActions
{
  return 0;
}

- (MLULookupItemAttachmentContent)initWithAttachments:(id)a3 currentAttachmentIndex:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MLULookupItemAttachmentContent;
  v7 = [(MLULookupItemAttachmentContent *)&v11 init];
  if (v7)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x263F16098]) initWithPreviewItems:v6];
    [(MLULookupItemContent *)v7 setPreviewViewController:v8];

    v9 = [(MLULookupItemContent *)v7 previewViewController];
    [v9 setCurrentPreviewItemIndex:a4];

    [(MLULookupItemContent *)v7 setValid:1];
  }

  return v7;
}

- (unint64_t)commitType
{
  return 2;
}

@end