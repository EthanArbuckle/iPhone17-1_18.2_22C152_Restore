@interface ICGalleryAttachmentViewSubAttachmentItem
- (BOOL)isEqual:(id)a3;
- (BOOL)updateSize;
- (CGSize)size;
- (ICAttachment)attachment;
- (ICGalleryAttachmentViewSubAttachmentItem)initWithAttachmentIdentifier:(id)a3 context:(id)a4;
- (NSManagedObjectContext)context;
- (NSString)attachmentIdentifier;
- (void)invalidateSize;
- (void)setAttachment:(id)a3;
- (void)setAttachmentIdentifier:(id)a3;
- (void)setContext:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation ICGalleryAttachmentViewSubAttachmentItem

- (ICGalleryAttachmentViewSubAttachmentItem)initWithAttachmentIdentifier:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICGalleryAttachmentViewSubAttachmentItem;
  v9 = [(ICGalleryAttachmentViewSubAttachmentItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attachmentIdentifier, a3);
    objc_storeStrong((id *)&v10->_context, a4);
  }

  return v10;
}

- (ICAttachment)attachment
{
  attachment = self->_attachment;
  if (!attachment)
  {
    v4 = (void *)MEMORY[0x263F5AB78];
    v5 = [(ICGalleryAttachmentViewSubAttachmentItem *)self attachmentIdentifier];
    v6 = [(ICGalleryAttachmentViewSubAttachmentItem *)self context];
    id v7 = [v4 attachmentWithIdentifier:v5 context:v6];
    id v8 = self->_attachment;
    self->_attachment = v7;

    attachment = self->_attachment;
  }

  return attachment;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = ICDynamicCast();

  if (v5)
  {
    v6 = [(ICGalleryAttachmentViewSubAttachmentItem *)self attachmentIdentifier];
    id v7 = [v5 attachmentIdentifier];
    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)invalidateSize
{
}

- (BOOL)updateSize
{
  v3 = [(ICGalleryAttachmentViewSubAttachmentItem *)self attachment];
  [v3 sizeWidth];
  double v5 = v4;
  v6 = [(ICGalleryAttachmentViewSubAttachmentItem *)self attachment];
  [v6 sizeHeight];
  double v8 = v7;

  BOOL v9 = v8 != self->_size.height || v5 != self->_size.width;
  if (v9)
  {
    self->_size.width = v5;
    self->_size.height = v8;
  }
  return v9;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  if (width == *MEMORY[0x263F001B0] && height == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    v6 = [(ICGalleryAttachmentViewSubAttachmentItem *)self attachment];
    [v6 sizeWidth];
    CGFloat v8 = v7;
    BOOL v9 = [(ICGalleryAttachmentViewSubAttachmentItem *)self attachment];
    [v9 sizeHeight];
    self->_size.double width = v8;
    self->_size.double height = v10;

    double width = self->_size.width;
    double height = self->_size.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setAttachment:(id)a3
{
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (NSString)attachmentIdentifier
{
  return self->_attachmentIdentifier;
}

- (void)setAttachmentIdentifier:(id)a3
{
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_attachmentIdentifier, 0);

  objc_storeStrong((id *)&self->_attachment, 0);
}

@end