@interface NNMKAttachment
+ (BOOL)isTypeActionable:(unint64_t)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)isActionable;
- (BOOL)isImage;
- (NNMKAttachment)initWithCoder:(id)a3;
- (NSString)contentId;
- (NSString)fileName;
- (NSString)messageId;
- (NSString)mimePartNumber;
- (NSString)url;
- (id)description;
- (unint64_t)fileSize;
- (unint64_t)syncState;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setContentId:(id)a3;
- (void)setFileName:(id)a3;
- (void)setFileSize:(unint64_t)a3;
- (void)setMessageId:(id)a3;
- (void)setMimePartNumber:(id)a3;
- (void)setSyncState:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
- (void)setUrl:(id)a3;
@end

@implementation NNMKAttachment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NNMKAttachment)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NNMKAttachment;
  v5 = [(NNMKAttachment *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyContentId"];
    contentId = v5->_contentId;
    v5->_contentId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyMessageId"];
    messageId = v5->_messageId;
    v5->_messageId = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyFileName"];
    fileName = v5->_fileName;
    v5->_fileName = (NSString *)v10;

    v5->_fileSize = [v4 decodeIntegerForKey:@"kNSCodingKeyFileSize"];
    v5->_type = [v4 decodeIntegerForKey:@"kNSCodingKeyType"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyContentURL"];
    url = v5->_url;
    v5->_url = (NSString *)v12;

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeySyncState"];
    v5->_syncState = [v14 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  contentId = self->_contentId;
  id v5 = a3;
  [v5 encodeObject:contentId forKey:@"kNSCodingKeyContentId"];
  [v5 encodeObject:self->_messageId forKey:@"kNSCodingKeyMessageId"];
  [v5 encodeObject:self->_fileName forKey:@"kNSCodingKeyFileName"];
  [v5 encodeInteger:self->_fileSize forKey:@"kNSCodingKeyFileSize"];
  [v5 encodeInteger:self->_type forKey:@"kNSCodingKeyType"];
  [v5 encodeObject:self->_url forKey:@"kNSCodingKeyContentURL"];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_syncState];
  [v5 encodeObject:v6 forKey:@"kNSCodingKeySyncState"];
}

- (BOOL)isActionable
{
  v3 = objc_opt_class();
  unint64_t v4 = [(NNMKAttachment *)self type];
  return [v3 isTypeActionable:v4];
}

- (BOOL)isImage
{
  unint64_t v2 = [(NNMKAttachment *)self type];
  return v2 == 5 || v2 == 22;
}

+ (BOOL)isTypeActionable:(unint64_t)a3
{
  return (a3 < 0x18) & (0xB00010u >> a3);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"ContentID: %@, File Name: %@, File Size: %ld, Type: %d", self->_contentId, self->_fileName, self->_fileSize, self->_type];
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)contentId
{
  return self->_contentId;
}

- (void)setContentId:(id)a3
{
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (NSString)mimePartNumber
{
  return self->_mimePartNumber;
}

- (void)setMimePartNumber:(id)a3
{
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(id)a3
{
}

- (unint64_t)syncState
{
  return self->_syncState;
}

- (void)setSyncState:(unint64_t)a3
{
  self->_syncState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_mimePartNumber, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_contentId, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end