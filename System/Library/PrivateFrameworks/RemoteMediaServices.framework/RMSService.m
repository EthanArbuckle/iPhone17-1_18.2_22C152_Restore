@interface RMSService
+ (id)protobufsFromServices:(id)a3;
+ (id)servicesFromProtobufs:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToService:(id)a3;
- (BOOL)isLegacyAppleTV;
- (BOOL)isTVRemoteCoreSupported;
- (NSString)displayName;
- (NSString)homeSharingGroupKey;
- (NSString)hostName;
- (NSString)networkName;
- (NSString)uniqueIdentifier;
- (RMSService)initWithData:(id)a3;
- (RMSService)initWithProtobuf:(id)a3;
- (id)data;
- (id)description;
- (id)device;
- (id)protobuf;
- (int)port;
- (int64_t)serviceDiscoverySource;
- (int64_t)serviceFlags;
- (int64_t)serviceType;
- (void)setDevice:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHomeSharingGroupKey:(id)a3;
- (void)setHostName:(id)a3;
- (void)setNetworkName:(id)a3;
- (void)setPort:(int)a3;
- (void)setServiceDiscoverySource:(int64_t)a3;
- (void)setServiceFlags:(int64_t)a3;
- (void)setServiceType:(int64_t)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation RMSService

- (RMSService)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RMSService;
  v5 = [(RMSService *)&v17 init];
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
    v5->_serviceFlags = (int)[v4 serviceFlags];
    uint64_t v12 = [v4 homeSharingGroupKey];
    homeSharingGroupKey = v5->_homeSharingGroupKey;
    v5->_homeSharingGroupKey = (NSString *)v12;

    uint64_t v14 = [v4 uniqueIdentifier];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v14;
  }
  return v5;
}

- (RMSService)initWithData:(id)a3
{
  id v4 = a3;
  v5 = [[RMSServiceMessage alloc] initWithData:v4];

  uint64_t v6 = [(RMSService *)self initWithProtobuf:v5];
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
  [v3 setServiceFlags:LODWORD(self->_serviceFlags)];
  [v3 setHomeSharingGroupKey:self->_homeSharingGroupKey];
  [v3 setUniqueIdentifier:self->_uniqueIdentifier];
  return v3;
}

- (id)data
{
  v2 = [(RMSService *)self protobuf];
  v3 = [v2 data];

  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"[%@] %@, type: %d, source: %d, HS key: %@, flags: %d, uniqueIdentifier: %@, device: %@", self->_networkName, self->_displayName, self->_serviceType, self->_serviceDiscoverySource, self->_homeSharingGroupKey, self->_serviceFlags, self->_uniqueIdentifier, self->_device];
}

- (BOOL)isLegacyAppleTV
{
  return self->_serviceFlags & 1;
}

- (BOOL)isTVRemoteCoreSupported
{
  return (LOBYTE(self->_serviceFlags) >> 1) & 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(RMSService *)self isEqualToService:v4];

  return v5;
}

- (BOOL)isEqualToService:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (!v4) {
    goto LABEL_47;
  }
  serviceType = (void *)self->_serviceType;
  if (serviceType != (void *)[v4 serviceType]) {
    goto LABEL_47;
  }
  networkName = self->_networkName;
  uint64_t v8 = networkName;
  if (!networkName)
  {
    uint64_t v9 = [v5 networkName];
    if (!v9) {
      goto LABEL_10;
    }
    serviceType = (void *)v9;
    uint64_t v8 = self->_networkName;
  }
  uint64_t v10 = [v5 networkName];
  BOOL v11 = [(NSString *)v8 isEqualToString:v10];

  if (networkName)
  {
    if (!v11) {
      goto LABEL_47;
    }
  }
  else
  {

    if (!v11) {
      goto LABEL_47;
    }
  }
LABEL_10:
  hostName = self->_hostName;
  v13 = hostName;
  if (!hostName)
  {
    uint64_t v14 = [v5 hostName];
    if (!v14) {
      goto LABEL_17;
    }
    serviceType = (void *)v14;
    v13 = self->_hostName;
  }
  v15 = [v5 hostName];
  BOOL v16 = [(NSString *)v13 isEqualToString:v15];

  if (hostName)
  {
    if (!v16) {
      goto LABEL_47;
    }
  }
  else
  {

    if (!v16) {
      goto LABEL_47;
    }
  }
LABEL_17:
  uint64_t port = self->_port;
  if (port != [v5 port]) {
    goto LABEL_47;
  }
  displayName = self->_displayName;
  v19 = displayName;
  if (!displayName)
  {
    uint64_t v20 = [v5 displayName];
    if (!v20) {
      goto LABEL_25;
    }
    uint64_t port = v20;
    v19 = self->_displayName;
  }
  v21 = [v5 displayName];
  BOOL v22 = [(NSString *)v19 isEqualToString:v21];

  if (displayName)
  {
    if (!v22) {
      goto LABEL_47;
    }
  }
  else
  {

    if (!v22) {
      goto LABEL_47;
    }
  }
LABEL_25:
  homeSharingGroupKey = self->_homeSharingGroupKey;
  v24 = homeSharingGroupKey;
  if (!homeSharingGroupKey)
  {
    uint64_t v25 = [v5 homeSharingGroupKey];
    if (!v25) {
      goto LABEL_32;
    }
    uint64_t port = v25;
    v24 = self->_homeSharingGroupKey;
  }
  v26 = [v5 homeSharingGroupKey];
  BOOL v27 = [(NSString *)v24 isEqualToString:v26];

  if (homeSharingGroupKey)
  {
    if (!v27) {
      goto LABEL_47;
    }
  }
  else
  {

    if (!v27) {
      goto LABEL_47;
    }
  }
LABEL_32:
  uniqueIdentifier = self->_uniqueIdentifier;
  v29 = uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    uint64_t v30 = [v5 uniqueIdentifier];
    if (!v30) {
      goto LABEL_39;
    }
    uint64_t port = v30;
    v29 = self->_uniqueIdentifier;
  }
  v31 = [v5 uniqueIdentifier];
  BOOL v32 = [(NSString *)v29 isEqualToString:v31];

  if (!uniqueIdentifier)
  {

    if (v32) {
      goto LABEL_39;
    }
LABEL_47:
    BOOL v38 = 0;
    goto LABEL_48;
  }
  if (!v32) {
    goto LABEL_47;
  }
LABEL_39:
  if (_os_feature_enabled_impl())
  {
    id device = self->_device;
    id v34 = device;
    if (!device)
    {
      uint64_t v35 = [v5 device];
      if (!v35) {
        goto LABEL_46;
      }
      uint64_t port = v35;
      id v34 = self->_device;
    }
    v36 = [v5 device];
    char v37 = [v34 isEqual:v36];

    if (!device) {
    if ((v37 & 1) == 0)
    }
      goto LABEL_47;
  }
LABEL_46:
  BOOL v38 = 1;
LABEL_48:

  return v38;
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
        BOOL v11 = [RMSService alloc];
        uint64_t v12 = -[RMSService initWithProtobuf:](v11, "initWithProtobuf:", v10, (void)v14);
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
  self->_uint64_t port = a3;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (int64_t)serviceDiscoverySource
{
  return self->_serviceDiscoverySource;
}

- (void)setServiceDiscoverySource:(int64_t)a3
{
  self->_serviceDiscoverySource = a3;
}

- (int64_t)serviceFlags
{
  return self->_serviceFlags;
}

- (void)setServiceFlags:(int64_t)a3
{
  self->_serviceFlags = a3;
}

- (NSString)homeSharingGroupKey
{
  return self->_homeSharingGroupKey;
}

- (void)setHomeSharingGroupKey:(id)a3
{
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (id)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_device, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_homeSharingGroupKey, 0);
  objc_storeStrong((id *)&self->_hostName, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end