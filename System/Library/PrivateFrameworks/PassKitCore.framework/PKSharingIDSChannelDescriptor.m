@interface PKSharingIDSChannelDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)createWithDeviceIdentifier:(id)a3;
+ (id)createWithRemoteAddress:(id)a3;
+ (id)existingForSessionIdentifier:(id)a3;
- (NSString)deviceIdentifier;
- (NSString)sessionIdentifier;
- (PKSharingIDSChannelDescriptor)initWithCoder:(id)a3;
- (PKSharingIDSChannelDescriptor)initWithSessionIdentifier:(id)a3 deviceIdentifier:(id)a4;
- (id)_initWithSessionIdentifier:(id)a3 deviceIdentifier:(id)a4 subtype:(unint64_t)a5;
- (unint64_t)subtype;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKSharingIDSChannelDescriptor

- (id)_initWithSessionIdentifier:(id)a3 deviceIdentifier:(id)a4 subtype:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKSharingIDSChannelDescriptor;
  v11 = [(PKSharingChannelDescriptor *)&v14 _initWithType:4];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(v11 + 4, a3);
    objc_storeStrong(v12 + 3, a4);
    v12[2] = (id)a5;
  }

  return v12;
}

- (PKSharingIDSChannelDescriptor)initWithSessionIdentifier:(id)a3 deviceIdentifier:(id)a4
{
  return (PKSharingIDSChannelDescriptor *)[(PKSharingIDSChannelDescriptor *)self _initWithSessionIdentifier:a3 deviceIdentifier:a4 subtype:0];
}

+ (id)createWithDeviceIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [[PKSharingIDSChannelDescriptor alloc] _initWithSessionIdentifier:0 deviceIdentifier:v3 subtype:0];

  return v4;
}

+ (id)existingForSessionIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [[PKSharingIDSChannelDescriptor alloc] _initWithSessionIdentifier:v3 deviceIdentifier:0 subtype:2];

  return v4;
}

+ (id)createWithRemoteAddress:(id)a3
{
  id v3 = a3;
  id v4 = [[PKSharingIDSChannelDescriptor alloc] _initWithSessionIdentifier:0 deviceIdentifier:v3 subtype:1];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharingIDSChannelDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKSharingIDSChannelDescriptor;
  v5 = [(PKSharingChannelDescriptor *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionIdentifier"];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceIdentifier"];
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKSharingIDSChannelDescriptor;
  id v4 = a3;
  [(PKSharingChannelDescriptor *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sessionIdentifier, @"sessionIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_deviceIdentifier forKey:@"deviceIdentifier"];
}

- (unint64_t)subtype
{
  return self->_subtype;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end