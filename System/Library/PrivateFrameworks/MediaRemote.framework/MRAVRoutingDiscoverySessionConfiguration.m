@interface MRAVRoutingDiscoverySessionConfiguration
+ (BOOL)supportsSecureCoding;
+ (MRAVRoutingDiscoverySessionConfiguration)configurationWithEndpointFeatures:(unsigned int)a3;
- (BOOL)alwaysAllowUpdates;
- (BOOL)enableThrottling;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocal;
- (BOOL)populatesExternalDevice;
- (MRAVRoutingDiscoverySessionConfiguration)initWithCoder:(id)a3;
- (MRAVRoutingDiscoverySessionConfiguration)initWithEndpointFeatures:(unsigned int)a3;
- (MRAVRoutingDiscoverySessionConfiguration)initWithProtobuf:(id)a3;
- (NSString)outputDeviceUID;
- (NSString)routingContextUID;
- (_MRDiscoverySessionConfigurationProtobuf)protobuf;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)features;
- (unsigned)targetAudioSessionID;
- (void)encodeWithCoder:(id)a3;
- (void)setAlwaysAllowUpdates:(BOOL)a3;
- (void)setEnableThrottling:(BOOL)a3;
- (void)setOutputDeviceUID:(id)a3;
- (void)setPopulatesExternalDevice:(BOOL)a3;
- (void)setRoutingContextUID:(id)a3;
- (void)setTargetAudioSessionID:(unsigned int)a3;
@end

@implementation MRAVRoutingDiscoverySessionConfiguration

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_routingContextUID hash];
  NSUInteger v4 = [(NSString *)self->_outputDeviceUID hash] ^ v3;
  v5 = [NSNumber numberWithUnsignedInt:self->_features];
  uint64_t v6 = v4 ^ [v5 hash];

  v7 = [NSNumber numberWithUnsignedInt:self->_targetAudioSessionID];
  uint64_t v8 = v6 ^ [v7 hash];

  return v8 ^ (100 * self->_enableThrottling) ^ (200 * self->_alwaysAllowUpdates) ^ (300
                                                                                       * self->_populatesExternalDevice);
}

- (void)setTargetAudioSessionID:(unsigned int)a3
{
  self->_targetAudioSessionID = a3;
}

- (MRAVRoutingDiscoverySessionConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobuf"];

  uint64_t v6 = [(MRAVRoutingDiscoverySessionConfiguration *)self initWithProtobuf:v5];
  return v6;
}

- (void)setEnableThrottling:(BOOL)a3
{
  self->_enableThrottling = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);

  objc_storeStrong((id *)&self->_routingContextUID, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MRAVRoutingDiscoverySessionConfiguration *)self protobuf];
  [v4 encodeObject:v5 forKey:@"protobuf"];
}

- (_MRDiscoverySessionConfigurationProtobuf)protobuf
{
  NSUInteger v3 = objc_alloc_init(_MRDiscoverySessionConfigurationProtobuf);
  [(_MRDiscoverySessionConfigurationProtobuf *)v3 setFeatures:self->_features];
  id v4 = (void *)[(NSString *)self->_outputDeviceUID copy];
  [(_MRDiscoverySessionConfigurationProtobuf *)v3 setOutputDeviceUID:v4];

  id v5 = (void *)[(NSString *)self->_routingContextUID copy];
  [(_MRDiscoverySessionConfigurationProtobuf *)v3 setRoutingContextUID:v5];

  if (self->_alwaysAllowUpdates) {
    [(_MRDiscoverySessionConfigurationProtobuf *)v3 setAlwaysAllowUpdates:1];
  }
  if (self->_enableThrottling) {
    [(_MRDiscoverySessionConfigurationProtobuf *)v3 setEnableThrottling:1];
  }
  if (self->_populatesExternalDevice) {
    [(_MRDiscoverySessionConfigurationProtobuf *)v3 setPopulatesExternalDevice:1];
  }
  if (self->_targetAudioSessionID) {
    -[_MRDiscoverySessionConfigurationProtobuf setTargetSessionID:](v3, "setTargetSessionID:");
  }

  return v3;
}

- (MRAVRoutingDiscoverySessionConfiguration)initWithEndpointFeatures:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MRAVRoutingDiscoverySessionConfiguration;
  result = [(MRAVRoutingDiscoverySessionConfiguration *)&v5 init];
  if (result)
  {
    result->_features = a3;
    result->_populatesExternalDevice = 1;
  }
  return result;
}

- (void)setRoutingContextUID:(id)a3
{
}

- (MRAVRoutingDiscoverySessionConfiguration)initWithProtobuf:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)MRAVRoutingDiscoverySessionConfiguration;
    objc_super v5 = [(MRAVRoutingDiscoverySessionConfiguration *)&v14 init];
    if (v5)
    {
      v5->_features = [v4 features];
      uint64_t v6 = [v4 outputDeviceUID];
      uint64_t v7 = [v6 copy];
      outputDeviceUID = v5->_outputDeviceUID;
      v5->_outputDeviceUID = (NSString *)v7;

      v9 = [v4 routingContextUID];
      uint64_t v10 = [v9 copy];
      routingContextUID = v5->_routingContextUID;
      v5->_routingContextUID = (NSString *)v10;

      v5->_alwaysAllowUpdates = [v4 alwaysAllowUpdates];
      v5->_enableThrottling = [v4 enableThrottling];
      v5->_populatesExternalDevice = [v4 populatesExternalDevice];
      v5->_targetAudioSessionID = [v4 targetSessionID];
    }
    self = v5;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || [v7 features] != self->_features
    || (int v8 = [v7 enableThrottling],
        v8 != [(MRAVRoutingDiscoverySessionConfiguration *)self enableThrottling])
    || (int v9 = [v7 alwaysAllowUpdates],
        v9 != [(MRAVRoutingDiscoverySessionConfiguration *)self alwaysAllowUpdates])
    || (int v10 = [v7 populatesExternalDevice],
        v10 != [(MRAVRoutingDiscoverySessionConfiguration *)self populatesExternalDevice])
    || (int v11 = [v7 targetAudioSessionID],
        v11 != [(MRAVRoutingDiscoverySessionConfiguration *)self targetAudioSessionID]))
  {
    char v14 = 0;
    goto LABEL_12;
  }
  v12 = [v7 routingContextUID];
  if (v12
    || ([(MRAVRoutingDiscoverySessionConfiguration *)self routingContextUID],
        (v19 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    NSUInteger v3 = [v7 routingContextUID];
    id v4 = [(MRAVRoutingDiscoverySessionConfiguration *)self routingContextUID];
    if (![v3 isEqualToString:v4])
    {
      char v14 = 0;
LABEL_19:

      goto LABEL_20;
    }
    int v13 = 1;
  }
  else
  {
    v19 = 0;
    int v13 = 0;
  }
  v16 = [v7 outputDeviceUID];
  if (!v16)
  {
    objc_super v5 = [(MRAVRoutingDiscoverySessionConfiguration *)self outputDeviceUID];
    if (!v5)
    {
      char v14 = 1;
LABEL_24:

      if ((v13 & 1) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  v17 = [v7 outputDeviceUID];
  v18 = [(MRAVRoutingDiscoverySessionConfiguration *)self outputDeviceUID];
  char v14 = [v17 isEqualToString:v18];

  if (!v16) {
    goto LABEL_24;
  }

  if (v13) {
    goto LABEL_19;
  }
LABEL_20:
  if (!v12) {

  }
LABEL_12:
  return v14;
}

- (NSString)routingContextUID
{
  return self->_routingContextUID;
}

- (unsigned)targetAudioSessionID
{
  return self->_targetAudioSessionID;
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (BOOL)populatesExternalDevice
{
  return self->_populatesExternalDevice;
}

- (BOOL)alwaysAllowUpdates
{
  return self->_alwaysAllowUpdates;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v4[8] = self->_enableThrottling;
  v4[9] = self->_alwaysAllowUpdates;
  *((_DWORD *)v4 + 3) = self->_features;
  v4[10] = self->_populatesExternalDevice;
  *((_DWORD *)v4 + 4) = self->_targetAudioSessionID;
  uint64_t v5 = [(NSString *)self->_routingContextUID copy];
  uint64_t v6 = (void *)*((void *)v4 + 3);
  *((void *)v4 + 3) = v5;

  uint64_t v7 = [(NSString *)self->_outputDeviceUID copy];
  int v8 = (void *)*((void *)v4 + 4);
  *((void *)v4 + 4) = v7;

  return v4;
}

- (BOOL)enableThrottling
{
  return self->_enableThrottling;
}

- (unsigned)features
{
  return self->_features;
}

- (BOOL)isLocal
{
  NSUInteger v3 = [(MRAVRoutingDiscoverySessionConfiguration *)self outputDeviceUID];

  if (!v3) {
    return 1;
  }
  id v4 = [(MRAVRoutingDiscoverySessionConfiguration *)self outputDeviceUID];
  uint64_t v5 = +[MRAVOutputDevice localDeviceUID];
  char v6 = [v4 isEqualToString:v5];

  if (v6) {
    return 1;
  }
  int v8 = +[MROrigin localOrigin];
  int v9 = +[MRDeviceInfoRequest deviceInfoForOrigin:v8];

  int v10 = [(MRAVRoutingDiscoverySessionConfiguration *)self outputDeviceUID];
  int v11 = [v9 clusterID];
  char v12 = [v10 isEqualToString:v11];

  if ((v12 & 1) != 0
    || ([(MRAVRoutingDiscoverySessionConfiguration *)self outputDeviceUID],
        int v13 = objc_claimAutoreleasedReturnValue(),
        [v9 deviceUID],
        char v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = [v13 isEqualToString:v14],
        v14,
        v13,
        (v15 & 1) != 0))
  {
    char v7 = 1;
  }
  else
  {
    v16 = [(MRAVRoutingDiscoverySessionConfiguration *)self outputDeviceUID];
    v17 = [v9 identifier];
    char v7 = [v16 isEqualToString:v17];
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (MRAVRoutingDiscoverySessionConfiguration)configurationWithEndpointFeatures:(unsigned int)a3
{
  NSUInteger v3 = [[MRAVRoutingDiscoverySessionConfiguration alloc] initWithEndpointFeatures:*(void *)&a3];

  return v3;
}

- (id)description
{
  v2 = [(MRAVRoutingDiscoverySessionConfiguration *)self protobuf];
  NSUInteger v3 = [v2 description];

  return v3;
}

- (void)setAlwaysAllowUpdates:(BOOL)a3
{
  self->_alwaysAllowUpdates = a3;
}

- (void)setPopulatesExternalDevice:(BOOL)a3
{
  self->_populatesExternalDevice = a3;
}

- (void)setOutputDeviceUID:(id)a3
{
}

@end