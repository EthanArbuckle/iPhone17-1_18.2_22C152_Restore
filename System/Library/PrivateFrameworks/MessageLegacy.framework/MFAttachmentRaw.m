@interface MFAttachmentRaw
+ (id)attachmentData:(id)a3 fileName:(id)a4 mimeType:(id)a5;
+ (id)attachmentData:(id)a3 fileName:(id)a4 mimeType:(id)a5 contentID:(id)a6;
- (NSData)data;
- (NSString)contentID;
- (NSString)fileName;
- (NSString)mimeType;
- (void)dealloc;
- (void)setContentID:(id)a3;
- (void)setData:(id)a3;
- (void)setFileName:(id)a3;
- (void)setMimeType:(id)a3;
@end

@implementation MFAttachmentRaw

+ (id)attachmentData:(id)a3 fileName:(id)a4 mimeType:(id)a5
{
  return (id)[a1 attachmentData:a3 fileName:a4 mimeType:a5 contentID:0];
}

+ (id)attachmentData:(id)a3 fileName:(id)a4 mimeType:(id)a5 contentID:(id)a6
{
  v10 = objc_alloc_init(MFAttachmentRaw);
  [(MFAttachmentRaw *)v10 setData:a3];
  [(MFAttachmentRaw *)v10 setFileName:a4];
  [(MFAttachmentRaw *)v10 setMimeType:a5];
  [(MFAttachmentRaw *)v10 setContentID:a6];
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFAttachmentRaw;
  [(MFAttachmentRaw *)&v3 dealloc];
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
}

- (NSString)contentID
{
  return self->_contentID;
}

- (void)setContentID:(id)a3
{
}

@end