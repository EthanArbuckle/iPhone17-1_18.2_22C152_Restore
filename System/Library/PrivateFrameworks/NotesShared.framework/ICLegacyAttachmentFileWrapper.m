@interface ICLegacyAttachmentFileWrapper
+ (BOOL)supportsSecureCoding;
- (ICLegacyAttachmentFileWrapper)initWithCIDURL:(id)a3;
- (ICLegacyAttachmentFileWrapper)initWithCoder:(id)a3;
- (NSString)attachmentIdentifier;
- (NSURL)cidURL;
- (void)encodeWithCoder:(id)a3;
- (void)setCidURL:(id)a3;
@end

@implementation ICLegacyAttachmentFileWrapper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLegacyAttachmentFileWrapper)initWithCIDURL:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICLegacyAttachmentFileWrapper;
  v5 = [(ICLegacyAttachmentFileWrapper *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ICLegacyAttachmentFileWrapper *)v5 setCidURL:v4];
  }

  return v6;
}

- (ICLegacyAttachmentFileWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cidURL"];
  }
  else
  {
    v5 = 0;
  }
  v6 = [(ICLegacyAttachmentFileWrapper *)self initWithCIDURL:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if ([v5 allowsKeyedCoding])
  {
    id v4 = [(ICLegacyAttachmentFileWrapper *)self cidURL];
    [v5 encodeObject:v4 forKey:@"cidURL"];
  }
}

- (NSString)attachmentIdentifier
{
  v2 = [(ICLegacyAttachmentFileWrapper *)self cidURL];
  v3 = [v2 resourceSpecifier];
  id v4 = objc_msgSend(v3, "ic_md5");

  return (NSString *)v4;
}

- (NSURL)cidURL
{
  return self->_cidURL;
}

- (void)setCidURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end