@interface MFAttachmentRaw
+ (BOOL)supportsSecureCoding;
+ (id)attachmentData:(id)a3 fileName:(id)a4 mimeType:(id)a5;
+ (id)attachmentData:(id)a3 fileName:(id)a4 mimeType:(id)a5 contentID:(id)a6;
- (MFAttachmentRaw)initWithCoder:(id)a3;
- (NSData)data;
- (NSString)contentID;
- (NSString)fileName;
- (NSString)mimeType;
- (void)encodeWithCoder:(id)a3;
- (void)setContentID:(id)a3;
- (void)setData:(id)a3;
- (void)setFileName:(id)a3;
- (void)setMimeType:(id)a3;
@end

@implementation MFAttachmentRaw

+ (id)attachmentData:(id)a3 fileName:(id)a4 mimeType:(id)a5
{
  v5 = [a1 attachmentData:a3 fileName:a4 mimeType:a5 contentID:0];
  return v5;
}

+ (id)attachmentData:(id)a3 fileName:(id)a4 mimeType:(id)a5 contentID:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = objc_alloc_init(MFAttachmentRaw);
  [(MFAttachmentRaw *)v13 setData:v9];
  [(MFAttachmentRaw *)v13 setFileName:v10];
  [(MFAttachmentRaw *)v13 setMimeType:v11];
  [(MFAttachmentRaw *)v13 setContentID:v12];

  return v13;
}

- (MFAttachmentRaw)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MFAttachmentRaw;
  v5 = [(MFAttachmentRaw *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_data"];
    data = v5->_data;
    v5->_data = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_fileName"];
    fileName = v5->_fileName;
    v5->_fileName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_mimeType"];
    mimeType = v5->_mimeType;
    v5->_mimeType = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_contentID"];
    contentID = v5->_contentID;
    v5->_contentID = (NSString *)v12;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(MFAttachmentRaw *)self data];
  [v8 encodeObject:v4 forKey:@"EFPropertyKey_data"];

  v5 = [(MFAttachmentRaw *)self fileName];
  [v8 encodeObject:v5 forKey:@"EFPropertyKey_fileName"];

  uint64_t v6 = [(MFAttachmentRaw *)self mimeType];
  [v8 encodeObject:v6 forKey:@"EFPropertyKey_mimeType"];

  v7 = [(MFAttachmentRaw *)self contentID];
  [v8 encodeObject:v7 forKey:@"EFPropertyKey_contentID"];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentID, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end