@interface ICAttachmentPreviewImageCache
- (ICAttachmentPreviewImageCache)init;
- (void)attachmentPreviewImagesDidUpdate:(id)a3;
- (void)dealloc;
@end

@implementation ICAttachmentPreviewImageCache

- (ICAttachmentPreviewImageCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICAttachmentPreviewImageCache;
  v2 = [(ICThumbnailDataCache *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_attachmentPreviewImagesDidUpdate_ name:@"ICAttachmentPreviewImagesDidUpdateNotification" object:0];

    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel_attachmentPreviewImagesDidUpdate_ name:@"ICAttachmentDidLoadNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"ICAttachmentPreviewImagesDidUpdateNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)ICAttachmentPreviewImageCache;
  [(ICAttachmentPreviewImageCache *)&v4 dealloc];
}

- (void)attachmentPreviewImagesDidUpdate:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 object];

  ICCheckedDynamicCast();
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_super v6 = v9;
  if (v9)
  {
    v7 = [v9 URIRepresentation];
    v8 = [v7 absoluteString];
    [(ICThumbnailDataCache *)self removeThumbnailDataForKey:v8];

    objc_super v6 = v9;
  }
}

@end