@interface PKSharingExistingChannelDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)existingForTransportIdentifier:(id)a3;
- (NSString)transportIdentifier;
- (PKSharingExistingChannelDescriptor)initWithCoder:(id)a3;
- (id)_initWithTransportIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKSharingExistingChannelDescriptor

- (id)_initWithTransportIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSharingExistingChannelDescriptor;
  v6 = [(PKSharingChannelDescriptor *)&v9 _initWithType:1];
  v7 = v6;
  if (v6) {
    objc_storeStrong(v6 + 2, a3);
  }

  return v7;
}

+ (id)existingForTransportIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [[PKSharingExistingChannelDescriptor alloc] _initWithTransportIdentifier:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharingExistingChannelDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSharingExistingChannelDescriptor;
  id v5 = [(PKSharingChannelDescriptor *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transportIdentifier"];
    transportIdentifier = v5->_transportIdentifier;
    v5->_transportIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKSharingExistingChannelDescriptor;
  id v4 = a3;
  [(PKSharingChannelDescriptor *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_transportIdentifier, @"transportIdentifier", v5.receiver, v5.super_class);
}

- (NSString)transportIdentifier
{
  return self->_transportIdentifier;
}

- (void).cxx_destruct
{
}

@end