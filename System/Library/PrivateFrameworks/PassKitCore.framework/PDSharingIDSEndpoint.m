@interface PDSharingIDSEndpoint
- (NSDate)createdAt;
- (NSDate)updatedAt;
- (NSString)description;
- (NSString)deviceIdentifier;
- (NSString)idsCorrelationIdentifier;
- (NSString)transportIdentifier;
- (PDSharingIDSEndpoint)init;
- (PDSharingIDSEndpoint)initWithDeviceIdentifier:(id)a3;
- (PDSharingIDSEndpoint)initWithSessionIdentifier:(id)a3;
- (PDSharingIDSEndpoint)initWithSessionIdentifier:(id)a3 deviceIdentifier:(id)a4;
- (id)_initWithSessionIdentifier:(id)a3 deviceIdentifier:(id)a4;
- (unint64_t)channelType;
- (unint64_t)isDeviceOnSameIDSAccount;
- (unint64_t)provisioningType;
- (void)setChannelType:(unint64_t)a3;
- (void)setCreatedAt:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setIdsCorrelationIdentifier:(id)a3;
- (void)setIsDeviceOnSameIDSAccount:(unint64_t)a3;
- (void)setProvisioningType:(unint64_t)a3;
- (void)setTransportIdentifier:(id)a3;
- (void)setUpdatedAt:(id)a3;
@end

@implementation PDSharingIDSEndpoint

- (PDSharingIDSEndpoint)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDSharingIDSEndpoint;
  return [(PDSharingIDSEndpoint *)&v3 init];
}

- (PDSharingIDSEndpoint)initWithDeviceIdentifier:(id)a3
{
  return (PDSharingIDSEndpoint *)[(PDSharingIDSEndpoint *)self _initWithSessionIdentifier:0 deviceIdentifier:a3];
}

- (PDSharingIDSEndpoint)initWithSessionIdentifier:(id)a3
{
  return (PDSharingIDSEndpoint *)[(PDSharingIDSEndpoint *)self _initWithSessionIdentifier:a3 deviceIdentifier:0];
}

- (PDSharingIDSEndpoint)initWithSessionIdentifier:(id)a3 deviceIdentifier:(id)a4
{
  return (PDSharingIDSEndpoint *)[(PDSharingIDSEndpoint *)self _initWithSessionIdentifier:a3 deviceIdentifier:a4];
}

- (id)_initWithSessionIdentifier:(id)a3 deviceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PDSharingIDSEndpoint;
  v8 = [(PDSharingIDSEndpoint *)&v17 init];
  v9 = (int64x2_t *)v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_deviceIdentifier, a4);
    if (v6)
    {
      id v10 = v6;
      id v11 = (id)v9->i64[1];
      v9->i64[1] = (uint64_t)v10;
    }
    else
    {
      id v11 = objc_alloc_init((Class)NSUUID);
      uint64_t v12 = [v11 UUIDString];
      v13 = (void *)v9->i64[1];
      v9->i64[1] = v12;
    }
    v9[1] = vdupq_n_s64(2uLL);
    id v14 = objc_alloc_init((Class)NSDate);
    v15 = (void *)v9[2].i64[0];
    v9[2].i64[0] = (uint64_t)v14;
  }
  return v9;
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
  [v3 appendFormat:@"deviceIdentifier: '%@'; ", self->_deviceIdentifier];
  v4 = [(PDSharingIDSEndpoint *)self transportIdentifier];
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
    CFStringRef v6 = off_10074A328[v9];
  }
  [v3 appendFormat:@"channelType: '%@'; ", v6];
  [v3 appendFormat:@"idsCorrelationIdentifier: '%@'; ", self->_idsCorrelationIdentifier];
  [v3 appendFormat:@">"];
  id v10 = [v3 copy];

  return (NSString *)v10;
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

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (unint64_t)isDeviceOnSameIDSAccount
{
  return self->_isDeviceOnSameIDSAccount;
}

- (void)setIsDeviceOnSameIDSAccount:(unint64_t)a3
{
  self->_isDeviceOnSameIDSAccount = a3;
}

- (NSString)idsCorrelationIdentifier
{
  return self->_idsCorrelationIdentifier;
}

- (void)setIdsCorrelationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsCorrelationIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_updatedAt, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_transportIdentifier, 0);
}

@end