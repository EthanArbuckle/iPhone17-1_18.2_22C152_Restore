@interface PKSharingTransferChannelDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)createForTransferToken:(id)a3;
- (NSString)transferToken;
- (PKSharingTransferChannelDescriptor)initWithCoder:(id)a3;
- (id)_initWithTransferToken:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKSharingTransferChannelDescriptor

- (id)_initWithTransferToken:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSharingTransferChannelDescriptor;
  v6 = [(PKSharingChannelDescriptor *)&v9 _initWithType:2];
  v7 = v6;
  if (v6) {
    objc_storeStrong(v6 + 2, a3);
  }

  return v7;
}

+ (id)createForTransferToken:(id)a3
{
  id v3 = a3;
  id v4 = [[PKSharingTransferChannelDescriptor alloc] _initWithTransferToken:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharingTransferChannelDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSharingTransferChannelDescriptor;
  id v5 = [(PKSharingChannelDescriptor *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferToken"];
    transferToken = v5->_transferToken;
    v5->_transferToken = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKSharingTransferChannelDescriptor;
  id v4 = a3;
  [(PKSharingChannelDescriptor *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_transferToken, @"transferToken", v5.receiver, v5.super_class);
}

- (NSString)transferToken
{
  return self->_transferToken;
}

- (void).cxx_destruct
{
}

@end