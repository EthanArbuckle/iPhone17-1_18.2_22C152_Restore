@interface AttachmentPreviewItem
- (AttachmentPreviewItem)initWithUrl:(id)a3 title:(id)a4;
- (NSString)previewItemTitle;
- (NSURL)previewItemURL;
- (void)setPreviewItemTitle:(id)a3;
- (void)setPreviewItemURL:(id)a3;
@end

@implementation AttachmentPreviewItem

- (AttachmentPreviewItem)initWithUrl:(id)a3 title:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AttachmentPreviewItem;
  v9 = [(AttachmentPreviewItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_previewItemURL, a3);
    objc_storeStrong((id *)&v10->_previewItemTitle, a4);
  }

  return v10;
}

- (NSURL)previewItemURL
{
  return self->_previewItemURL;
}

- (void)setPreviewItemURL:(id)a3
{
}

- (NSString)previewItemTitle
{
  return self->_previewItemTitle;
}

- (void)setPreviewItemTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewItemTitle, 0);

  objc_storeStrong((id *)&self->_previewItemURL, 0);
}

@end