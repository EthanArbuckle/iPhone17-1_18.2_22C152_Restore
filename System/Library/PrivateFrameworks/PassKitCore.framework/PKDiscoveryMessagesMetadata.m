@interface PKDiscoveryMessagesMetadata
+ (BOOL)supportsSecureCoding;
- (NSURL)messagesBundleURL;
- (PKDiscoveryMessagesMetadata)initWithCoder:(id)a3;
- (PKDiscoveryMessagesMetadata)initWithDictionary:(id)a3;
- (int64_t)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKDiscoveryMessagesMetadata

- (PKDiscoveryMessagesMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDiscoveryMessagesMetadata;
  v5 = [(PKDiscoveryMessagesMetadata *)&v9 init];
  if (v5)
  {
    v5->_version = [v4 PKIntegerForKey:@"version"];
    uint64_t v6 = [v4 PKURLForKey:@"messagesBundleURL"];
    messagesBundleURL = v5->_messagesBundleURL;
    v5->_messagesBundleURL = (NSURL *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDiscoveryMessagesMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDiscoveryMessagesMetadata;
  v5 = [(PKDiscoveryMessagesMetadata *)&v9 init];
  if (v5)
  {
    v5->_version = [v4 decodeIntegerForKey:@"version"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"messagesBundleURL"];
    messagesBundleURL = v5->_messagesBundleURL;
    v5->_messagesBundleURL = (NSURL *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t version = self->_version;
  id v5 = a3;
  [v5 encodeInteger:version forKey:@"version"];
  [v5 encodeObject:self->_messagesBundleURL forKey:@"messagesBundleURL"];
}

- (int64_t)version
{
  return self->_version;
}

- (NSURL)messagesBundleURL
{
  return self->_messagesBundleURL;
}

- (void).cxx_destruct
{
}

@end