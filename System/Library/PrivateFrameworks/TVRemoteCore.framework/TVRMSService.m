@interface TVRMSService
+ (id)protobufsFromServices:(id)a3;
+ (id)servicesFromProtobufs:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToService:(id)a3;
- (BOOL)isLegacy;
- (NSString)displayName;
- (NSString)homeSharingGroupKey;
- (NSString)hostName;
- (NSString)networkName;
- (TVRMSService)initWithData:(id)a3;
- (TVRMSService)initWithProtobuf:(id)a3;
- (id)data;
- (id)description;
- (id)protobuf;
- (int)port;
- (int64_t)serviceDiscoverySource;
- (int64_t)serviceLegacyFlags;
- (int64_t)serviceType;
- (void)setDisplayName:(id)a3;
- (void)setHomeSharingGroupKey:(id)a3;
- (void)setHostName:(id)a3;
- (void)setNetworkName:(id)a3;
- (void)setPort:(int)a3;
- (void)setServiceDiscoverySource:(int64_t)a3;
- (void)setServiceLegacyFlags:(int64_t)a3;
- (void)setServiceType:(int64_t)a3;
@end

@implementation TVRMSService

- (TVRMSService)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TVRMSService;
  v5 = [(TVRMSService *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 displayName];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    uint64_t v8 = [v4 networkName];
    networkName = v5->_networkName;
    v5->_networkName = (NSString *)v8;

    uint64_t v10 = [v4 hostName];
    hostName = v5->_hostName;
    v5->_hostName = (NSString *)v10;

    v5->_port = [v4 port];
    v5->_serviceType = (int)[v4 serviceType];
    v5->_serviceDiscoverySource = (int)[v4 serviceDiscoverySource];
    v5->_serviceLegacyFlags = (int)[v4 serviceLegacyFlags];
    uint64_t v12 = [v4 homeSharingGroupKey];
    homeSharingGroupKey = v5->_homeSharingGroupKey;
    v5->_homeSharingGroupKey = (NSString *)v12;
  }
  return v5;
}

- (TVRMSService)initWithData:(id)a3
{
  id v4 = a3;
  v5 = [[TVRMSServiceMessage alloc] initWithData:v4];

  uint64_t v6 = [(TVRMSService *)self initWithProtobuf:v5];
  return v6;
}

- (id)protobuf
{
  v3 = objc_opt_new();
  [v3 setDisplayName:self->_displayName];
  [v3 setNetworkName:self->_networkName];
  [v3 setHostName:self->_hostName];
  [v3 setPort:self->_port];
  [v3 setServiceType:LODWORD(self->_serviceType)];
  [v3 setServiceDiscoverySource:LODWORD(self->_serviceDiscoverySource)];
  [v3 setServiceLegacyFlags:LODWORD(self->_serviceLegacyFlags)];
  [v3 setHomeSharingGroupKey:self->_homeSharingGroupKey];

  return v3;
}

- (id)data
{
  v2 = [(TVRMSService *)self protobuf];
  v3 = [v2 data];

  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"[%@] %@, type: %d, source: %d, HS key: %@, legacy flags: %d", self->_networkName, self->_displayName, self->_serviceType, self->_serviceDiscoverySource, self->_homeSharingGroupKey, self->_serviceLegacyFlags];
}

- (BOOL)isLegacy
{
  return self->_serviceLegacyFlags != 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(TVRMSService *)self isEqualToService:v4];

  return v5;
}

- (BOOL)isEqualToService:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (!v4) {
    goto LABEL_12;
  }
  int64_t serviceType = self->_serviceType;
  if (serviceType != [v4 serviceType]) {
    goto LABEL_12;
  }
  networkName = self->_networkName;
  uint64_t v8 = [v5 networkName];
  LODWORD(networkName) = [(NSString *)networkName isEqualToString:v8];

  if (!networkName) {
    goto LABEL_12;
  }
  hostName = self->_hostName;
  uint64_t v10 = [v5 hostName];
  LODWORD(hostName) = [(NSString *)hostName isEqualToString:v10];

  if (!hostName) {
    goto LABEL_12;
  }
  int port = self->_port;
  if (port != [v5 port]) {
    goto LABEL_12;
  }
  displayName = self->_displayName;
  v13 = [v5 displayName];

  if (displayName != v13) {
    goto LABEL_12;
  }
  homeSharingGroupKey = self->_homeSharingGroupKey;
  if (homeSharingGroupKey)
  {
LABEL_10:
    v16 = [v5 homeSharingGroupKey];
    BOOL v17 = [(NSString *)homeSharingGroupKey isEqualToString:v16];

    if (v17) {
      goto LABEL_11;
    }
LABEL_12:
    BOOL v18 = 0;
    goto LABEL_13;
  }
  objc_super v15 = [v5 homeSharingGroupKey];

  if (v15)
  {
    homeSharingGroupKey = self->_homeSharingGroupKey;
    goto LABEL_10;
  }
LABEL_11:
  BOOL v18 = 1;
LABEL_13:

  return v18;
}

+ (id)servicesFromProtobufs:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = [TVRMSService alloc];
        uint64_t v12 = -[TVRMSService initWithProtobuf:](v11, "initWithProtobuf:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)protobufsFromServices:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "protobuf", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
}

- (NSString)hostName
{
  return self->_hostName;
}

- (void)setHostName:(id)a3
{
}

- (int)port
{
  return self->_port;
}

- (void)setPort:(int)a3
{
  self->_int port = a3;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_int64_t serviceType = a3;
}

- (int64_t)serviceDiscoverySource
{
  return self->_serviceDiscoverySource;
}

- (void)setServiceDiscoverySource:(int64_t)a3
{
  self->_serviceDiscoverySource = a3;
}

- (int64_t)serviceLegacyFlags
{
  return self->_serviceLegacyFlags;
}

- (void)setServiceLegacyFlags:(int64_t)a3
{
  self->_serviceLegacyFlags = a3;
}

- (NSString)homeSharingGroupKey
{
  return self->_homeSharingGroupKey;
}

- (void)setHomeSharingGroupKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeSharingGroupKey, 0);
  objc_storeStrong((id *)&self->_hostName, 0);
  objc_storeStrong((id *)&self->_networkName, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end