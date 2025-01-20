@interface SPAttachmentInfo
+ (BOOL)supportsSecureCoding;
- (NSUUID)attachedToDevice;
- (SPAttachmentInfo)initWithAttachedToDevice:(id)a3;
- (SPAttachmentInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SPAttachmentInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPAttachmentInfo alloc];
  v5 = [(SPAttachmentInfo *)self attachedToDevice];
  v6 = [(SPAttachmentInfo *)v4 initWithAttachedToDevice:v5];

  return v6;
}

- (SPAttachmentInfo)initWithAttachedToDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPAttachmentInfo;
  v6 = [(SPAttachmentInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_attachedToDevice, a3);
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
}

- (SPAttachmentInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attachedToDevice"];

  attachedToDevice = self->_attachedToDevice;
  self->_attachedToDevice = v5;

  return self;
}

- (NSUUID)attachedToDevice
{
  return self->_attachedToDevice;
}

- (void).cxx_destruct
{
}

@end