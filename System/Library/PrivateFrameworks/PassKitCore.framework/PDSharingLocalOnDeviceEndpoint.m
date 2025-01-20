@interface PDSharingLocalOnDeviceEndpoint
- (BOOL)isSource;
- (NSDate)createdAt;
- (NSDate)updatedAt;
- (NSString)description;
- (NSString)destinationTransportIdentifier;
- (NSString)sourceTransportIdentifier;
- (NSString)transportIdentifier;
- (PDSharingLocalOnDeviceEndpoint)init;
- (PDSharingLocalOnDeviceEndpoint)initWithSourceTransportIdentifier:(id)a3 destinationTransportIdentifier:(id)a4 isSource:(BOOL)a5;
- (id)createContraEndpoint;
- (unint64_t)channelType;
- (unint64_t)provisioningType;
- (void)setChannelType:(unint64_t)a3;
- (void)setCreatedAt:(id)a3;
- (void)setDestinationTransportIdentifier:(id)a3;
- (void)setProvisioningType:(unint64_t)a3;
- (void)setSourceTransportIdentifier:(id)a3;
- (void)setTransportIdentifier:(id)a3;
- (void)setUpdatedAt:(id)a3;
@end

@implementation PDSharingLocalOnDeviceEndpoint

- (PDSharingLocalOnDeviceEndpoint)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDSharingLocalOnDeviceEndpoint;
  return [(PDSharingLocalOnDeviceEndpoint *)&v3 init];
}

- (PDSharingLocalOnDeviceEndpoint)initWithSourceTransportIdentifier:(id)a3 destinationTransportIdentifier:(id)a4 isSource:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PDSharingLocalOnDeviceEndpoint;
  v11 = [(PDSharingLocalOnDeviceEndpoint *)&v17 init];
  v12 = v11;
  if (v11)
  {
    if (v5) {
      v13 = v9;
    }
    else {
      v13 = v10;
    }
    objc_storeStrong((id *)&v11->_transportIdentifier, v13);
    *(_OWORD *)&v12->_channelType = xmmword_1005B3AE0;
    v14 = (NSDate *)objc_alloc_init((Class)NSDate);
    createdAt = v12->_createdAt;
    v12->_createdAt = v14;

    objc_storeStrong((id *)&v12->_sourceTransportIdentifier, a3);
    objc_storeStrong((id *)&v12->_destinationTransportIdentifier, a4);
  }

  return v12;
}

- (void)setCreatedAt:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_createdAt, a3);
  updatedAt = self->_updatedAt;
  p_updatedAt = &self->_updatedAt;
  if (!updatedAt) {
    objc_storeStrong((id *)p_updatedAt, a3);
  }
}

- (void)setUpdatedAt:(id)a3
{
}

- (NSString)description
{
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@: %p; ",
    objc_opt_class(),
  objc_super v3 = self);
  [v3 appendFormat:@"sourceTransportIdentifier: '%@'; ", self->_sourceTransportIdentifier];
  objc_msgSend(v3, "appendFormat:", @"destinationTransportIdentifier: '%@'; ",
    self->_destinationTransportIdentifier);
  v4 = [(PDSharingLocalOnDeviceEndpoint *)self transportIdentifier];
  [v3 appendFormat:@"transportIdentifier: '%@'; ", v4];

  unint64_t provisioningType = self->_provisioningType;
  CFStringRef v6 = @"unknown";
  CFStringRef v7 = @"stateful";
  if (provisioningType != 2) {
    CFStringRef v7 = @"unknown";
  }
  if (provisioningType == 1) {
    CFStringRef v8 = @"stateless";
  }
  else {
    CFStringRef v8 = v7;
  }
  [v3 appendFormat:@"provisioningType: '%@'; ", v8];
  unint64_t v9 = self->_channelType - 1;
  if (v9 <= 2) {
    CFStringRef v6 = *(&off_100750B88 + v9);
  }
  [v3 appendFormat:@"channelType: '%@'; ", v6];
  [v3 appendFormat:@">"];
  id v10 = [v3 copy];

  return (NSString *)v10;
}

- (BOOL)isSource
{
  return PKEqualObjects();
}

- (id)createContraEndpoint
{
  objc_super v3 = [PDSharingLocalOnDeviceEndpoint alloc];
  sourceTransportIdentifier = self->_sourceTransportIdentifier;
  destinationTransportIdentifier = self->_destinationTransportIdentifier;
  uint64_t v6 = [(PDSharingLocalOnDeviceEndpoint *)self isSource] ^ 1;
  return [(PDSharingLocalOnDeviceEndpoint *)v3 initWithSourceTransportIdentifier:sourceTransportIdentifier destinationTransportIdentifier:destinationTransportIdentifier isSource:v6];
}

- (NSString)transportIdentifier
{
  return self->_transportIdentifier;
}

- (void)setTransportIdentifier:(id)a3
{
}

- (unint64_t)channelType
{
  return self->_channelType;
}

- (void)setChannelType:(unint64_t)a3
{
  self->_channelType = a3;
}

- (unint64_t)provisioningType
{
  return self->_provisioningType;
}

- (void)setProvisioningType:(unint64_t)a3
{
  self->_unint64_t provisioningType = a3;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (NSDate)updatedAt
{
  return self->_updatedAt;
}

- (NSString)sourceTransportIdentifier
{
  return self->_sourceTransportIdentifier;
}

- (void)setSourceTransportIdentifier:(id)a3
{
}

- (NSString)destinationTransportIdentifier
{
  return self->_destinationTransportIdentifier;
}

- (void)setDestinationTransportIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationTransportIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceTransportIdentifier, 0);
  objc_storeStrong((id *)&self->_updatedAt, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_transportIdentifier, 0);
}

@end