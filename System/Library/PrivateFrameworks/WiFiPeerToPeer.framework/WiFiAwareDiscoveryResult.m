@interface WiFiAwareDiscoveryResult
+ (BOOL)supportsSecureCoding;
- (BOOL)datapathSecurityRequired;
- (BOOL)datapathSupported;
- (BOOL)furtherServiceDiscoveryRequired;
- (BOOL)isEqual:(id)a3;
- (BOOL)pairSetupRequired;
- (BOOL)serviceSpecificInfoEqual:(id)a3;
- (NSString)serviceName;
- (WiFiAwareDiscoveryResult)initWithCoder:(id)a3;
- (WiFiAwareDiscoveryResult)initWithServiceName:(id)a3 serviceSpecificInfo:(id)a4 publishID:(unsigned __int8)a5 subscribeID:(unsigned __int8)a6 publisherAddressKey:(id)a7 datapathSupported:(BOOL)a8 datapathCipherSuite:(int64_t)a9 fsdFunction:(int64_t)a10 rssi:(int64_t)a11 pairSetupRequired:(BOOL)a12 pairingConfiguration:(id)a13;
- (WiFiAwarePairingConfiguration)pairingConfiguration;
- (WiFiAwarePublishServiceSpecificInfo)serviceSpecificInfo;
- (WiFiMACAddress)publisherAddress;
- (const)fsdFunctionString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)datapathCipherSuite;
- (int64_t)fsdFunction;
- (int64_t)rssi;
- (unsigned)publishID;
- (unsigned)subscribeID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WiFiAwareDiscoveryResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwareDiscoveryResult *)self serviceName];
  [v4 encodeObject:v5 forKey:@"WiFiAwareDiscoveryResult.serviceName"];

  v6 = [(WiFiAwareDiscoveryResult *)self serviceSpecificInfo];
  [v4 encodeObject:v6 forKey:@"WiFiAwareDiscoveryResult.serviceSpecificInfo"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[WiFiAwareDiscoveryResult publishID](self, "publishID"));
  [v4 encodeObject:v7 forKey:@"WiFiAwareDiscoveryResult.publishID"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[WiFiAwareDiscoveryResult subscribeID](self, "subscribeID"));
  [v4 encodeObject:v8 forKey:@"WiFiAwareDiscoveryResult.subscribeID"];

  v9 = [(WiFiAwareDiscoveryResult *)self publisherAddress];
  [v4 encodeObject:v9 forKey:@"WiFiAwareDiscoveryResult.publisherAddress"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WiFiAwareDiscoveryResult datapathSupported](self, "datapathSupported"), @"WiFiAwareDiscoveryResult.datapathSupported");
  objc_msgSend(v4, "encodeInteger:forKey:", -[WiFiAwareDiscoveryResult datapathCipherSuite](self, "datapathCipherSuite"), @"WiFiAwareDiscoveryResult.datapathCipherSuite");
  objc_msgSend(v4, "encodeInteger:forKey:", -[WiFiAwareDiscoveryResult fsdFunction](self, "fsdFunction"), @"WiFiAwareDiscoveryResult.fsdFunction");
  objc_msgSend(v4, "encodeInteger:forKey:", -[WiFiAwareDiscoveryResult rssi](self, "rssi"), @"WiFiAwareDiscoveryResult.rssi");
  objc_msgSend(v4, "encodeBool:forKey:", -[WiFiAwareDiscoveryResult pairSetupRequired](self, "pairSetupRequired"), @"WiFiAwareDiscoveryResult.pairSetupRequired");
  id v10 = [(WiFiAwareDiscoveryResult *)self pairingConfiguration];
  [v4 encodeObject:v10 forKey:@"WiFiAwareDiscoveryResult.pairingConfiguration"];
}

- (WiFiAwareDiscoveryResult)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDiscoveryResult.serviceName"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDiscoveryResult.serviceSpecificInfo"];
  unsigned int v17 = decodeInstanceIDFrom(v3, @"WiFiAwareDiscoveryResult.publishID");
  unsigned int v16 = decodeInstanceIDFrom(v3, @"WiFiAwareDiscoveryResult.subscribeID");
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDiscoveryResult.publisherAddress"];
  uint64_t v7 = [v3 decodeBoolForKey:@"WiFiAwareDiscoveryResult.datapathSupported"];
  uint64_t v8 = [v3 decodeIntegerForKey:@"WiFiAwareDiscoveryResult.datapathCipherSuite"];
  uint64_t v9 = [v3 decodeIntegerForKey:@"WiFiAwareDiscoveryResult.fsdFunction"];
  uint64_t v10 = [v3 decodeIntegerForKey:@"WiFiAwareDiscoveryResult.rssi"];
  char v11 = [v3 decodeBoolForKey:@"WiFiAwareDiscoveryResult.pairSetupRequired"];
  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDiscoveryResult.pairingConfiguration"];

  LOBYTE(v15) = v11;
  v13 = [(WiFiAwareDiscoveryResult *)self initWithServiceName:v4 serviceSpecificInfo:v5 publishID:v17 subscribeID:v16 publisherAddressKey:v6 datapathSupported:v7 datapathCipherSuite:v8 fsdFunction:v9 rssi:v10 pairSetupRequired:v15 pairingConfiguration:v12];

  return v13;
}

- (WiFiAwareDiscoveryResult)initWithServiceName:(id)a3 serviceSpecificInfo:(id)a4 publishID:(unsigned __int8)a5 subscribeID:(unsigned __int8)a6 publisherAddressKey:(id)a7 datapathSupported:(BOOL)a8 datapathCipherSuite:(int64_t)a9 fsdFunction:(int64_t)a10 rssi:(int64_t)a11 pairSetupRequired:(BOOL)a12 pairingConfiguration:(id)a13
{
  id v30 = a3;
  id v19 = a4;
  id v20 = a7;
  id v21 = a13;
  v31.receiver = self;
  v31.super_class = (Class)WiFiAwareDiscoveryResult;
  v22 = [(WiFiAwareDiscoveryResult *)&v31 init];
  if (v22)
  {
    uint64_t v23 = [v30 copy];
    serviceName = v22->_serviceName;
    v22->_serviceName = (NSString *)v23;

    uint64_t v25 = [v19 copy];
    serviceSpecificInfo = v22->_serviceSpecificInfo;
    v22->_serviceSpecificInfo = (WiFiAwarePublishServiceSpecificInfo *)v25;

    v22->_publishID = a5;
    objc_storeStrong((id *)&v22->_publisherAddress, a7);
    v22->_subscribeID = a6;
    v22->_datapathSupported = a8;
    v22->_datapathCipherSuite = a9;
    v22->_fsdFunction = a10;
    v22->_rssi = a11;
    v22->_pairSetupRequired = a12;
    uint64_t v27 = [v21 copy];
    pairingConfiguration = v22->_pairingConfiguration;
    v22->_pairingConfiguration = (WiFiAwarePairingConfiguration *)v27;
  }
  return v22;
}

- (BOOL)serviceSpecificInfoEqual:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwareDiscoveryResult *)self serviceSpecificInfo];
  v6 = [v4 serviceSpecificInfo];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    uint64_t v7 = [(WiFiAwareDiscoveryResult *)self serviceSpecificInfo];
    uint64_t v8 = [v4 serviceSpecificInfo];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (unsigned)subscribeID
{
  return self->_subscribeID;
}

- (int64_t)datapathCipherSuite
{
  return self->_datapathCipherSuite;
}

- (BOOL)datapathSecurityRequired
{
  return [(WiFiAwareDiscoveryResult *)self datapathCipherSuite] != 0;
}

- (int64_t)fsdFunction
{
  return self->_fsdFunction;
}

- (BOOL)furtherServiceDiscoveryRequired
{
  int64_t v3 = [(WiFiAwareDiscoveryResult *)self fsdFunction];
  if (v3 != 1) {
    LOBYTE(v3) = [(WiFiAwareDiscoveryResult *)self fsdFunction] == 2;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WiFiAwareDiscoveryResult *)a3;
  if (self == v4)
  {
    v5 = 0;
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v17 = 0;
    v5 = 0;
    goto LABEL_19;
  }
  v5 = v4;
  v6 = [(WiFiAwareDiscoveryResult *)self serviceName];
  uint64_t v7 = [(WiFiAwareDiscoveryResult *)v5 serviceName];
  if (![v6 isEqualToString:v7]) {
    goto LABEL_14;
  }
  if (![(WiFiAwareDiscoveryResult *)self serviceSpecificInfoEqual:v5]) {
    goto LABEL_14;
  }
  int v8 = [(WiFiAwareDiscoveryResult *)self publishID];
  if (v8 != [(WiFiAwareDiscoveryResult *)v5 publishID]) {
    goto LABEL_14;
  }
  int v9 = [(WiFiAwareDiscoveryResult *)self subscribeID];
  if (v9 != [(WiFiAwareDiscoveryResult *)v5 subscribeID]) {
    goto LABEL_14;
  }
  uint64_t v10 = [(WiFiAwareDiscoveryResult *)self publisherAddress];
  char v11 = [(WiFiAwareDiscoveryResult *)v5 publisherAddress];
  if ([v10 isEqual:v11])
  {
    BOOL v12 = [(WiFiAwareDiscoveryResult *)self datapathSupported];
    if (v12 == [(WiFiAwareDiscoveryResult *)v5 datapathSupported])
    {
      BOOL v13 = [(WiFiAwareDiscoveryResult *)self datapathSecurityRequired];
      if (v13 == [(WiFiAwareDiscoveryResult *)v5 datapathSecurityRequired])
      {
        int64_t v14 = [(WiFiAwareDiscoveryResult *)self fsdFunction];
        if (v14 == [(WiFiAwareDiscoveryResult *)v5 fsdFunction])
        {
          int64_t v15 = [(WiFiAwareDiscoveryResult *)self rssi];
          if (v15 == [(WiFiAwareDiscoveryResult *)v5 rssi])
          {
            BOOL v16 = [(WiFiAwareDiscoveryResult *)self pairSetupRequired];
            if (v16 == [(WiFiAwareDiscoveryResult *)v5 pairSetupRequired])
            {
              id v19 = [(WiFiAwareDiscoveryResult *)self pairingConfiguration];
              uint64_t v20 = [(WiFiAwareDiscoveryResult *)v5 pairingConfiguration];
              if (v19 == (void *)v20)
              {
              }
              else
              {
                id v21 = (void *)v20;
                v22 = [(WiFiAwareDiscoveryResult *)self pairingConfiguration];
                uint64_t v23 = [(WiFiAwareDiscoveryResult *)v5 pairingConfiguration];
                char v24 = [v22 isEqual:v23];

                if ((v24 & 1) == 0) {
                  goto LABEL_15;
                }
              }
LABEL_17:
              BOOL v17 = 1;
              goto LABEL_19;
            }
          }
        }
      }
    }
  }

LABEL_14:
LABEL_15:
  BOOL v17 = 0;
LABEL_19:

  return v17;
}

- (const)fsdFunctionString
{
  unint64_t v2 = [(WiFiAwareDiscoveryResult *)self fsdFunction];
  if (v2 > 2) {
    return "unrecognized";
  }
  else {
    return off_1E633EAC8[v2];
  }
}

- (id)description
{
  v18 = NSString;
  id v19 = [(WiFiAwareDiscoveryResult *)self serviceName];
  int64_t v3 = [(WiFiAwareDiscoveryResult *)self serviceSpecificInfo];
  unsigned int v17 = [(WiFiAwareDiscoveryResult *)self publishID];
  id v4 = [(WiFiAwareDiscoveryResult *)self publisherAddress];
  BOOL v5 = [(WiFiAwareDiscoveryResult *)self datapathSupported];
  BOOL v6 = [(WiFiAwareDiscoveryResult *)self datapathSecurityRequired];
  unint64_t v7 = [(WiFiAwareDiscoveryResult *)self datapathCipherSuite];
  if (v7 > 8) {
    int v8 = "unrecognized";
  }
  else {
    int v8 = off_1E633EAE0[v7];
  }
  int v9 = "YES";
  if (v6) {
    uint64_t v10 = "YES";
  }
  else {
    uint64_t v10 = "NO";
  }
  if (v5) {
    char v11 = "YES";
  }
  else {
    char v11 = "NO";
  }
  BOOL v12 = [(WiFiAwareDiscoveryResult *)self fsdFunctionString];
  int64_t v13 = [(WiFiAwareDiscoveryResult *)self rssi];
  if (![(WiFiAwareDiscoveryResult *)self pairSetupRequired]) {
    int v9 = "NO";
  }
  int64_t v14 = [(WiFiAwareDiscoveryResult *)self pairingConfiguration];
  int64_t v15 = [v18 stringWithFormat:@"<WiFiAwareDiscoveryResult: name=%@, serviceSpecificInfo=%@, publishID=%u, publisherAddress=%@, datapath=%s, security=%s, cipherSuite=%s, FSD=%s, rssi=%ld, pairSetup=%s, pairing=%@>", v19, v3, v17, v4, v11, v10, v8, v12, v13, v9, v14];

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18 = [WiFiAwareDiscoveryResult alloc];
  id v4 = [(WiFiAwareDiscoveryResult *)self serviceName];
  BOOL v5 = [(WiFiAwareDiscoveryResult *)self serviceSpecificInfo];
  unsigned int v17 = [(WiFiAwareDiscoveryResult *)self publishID];
  uint64_t v6 = [(WiFiAwareDiscoveryResult *)self subscribeID];
  unint64_t v7 = [(WiFiAwareDiscoveryResult *)self publisherAddress];
  BOOL v8 = [(WiFiAwareDiscoveryResult *)self datapathSupported];
  int64_t v9 = [(WiFiAwareDiscoveryResult *)self datapathCipherSuite];
  int64_t v10 = [(WiFiAwareDiscoveryResult *)self fsdFunction];
  int64_t v11 = [(WiFiAwareDiscoveryResult *)self rssi];
  BOOL v12 = [(WiFiAwareDiscoveryResult *)self pairSetupRequired];
  int64_t v13 = [(WiFiAwareDiscoveryResult *)self pairingConfiguration];
  LOBYTE(v16) = v12;
  int64_t v14 = [(WiFiAwareDiscoveryResult *)v18 initWithServiceName:v4 serviceSpecificInfo:v5 publishID:v17 subscribeID:v6 publisherAddressKey:v7 datapathSupported:v8 datapathCipherSuite:v9 fsdFunction:v10 rssi:v11 pairSetupRequired:v16 pairingConfiguration:v13];

  return v14;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (WiFiAwarePublishServiceSpecificInfo)serviceSpecificInfo
{
  return self->_serviceSpecificInfo;
}

- (unsigned)publishID
{
  return self->_publishID;
}

- (WiFiMACAddress)publisherAddress
{
  return self->_publisherAddress;
}

- (BOOL)datapathSupported
{
  return self->_datapathSupported;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (BOOL)pairSetupRequired
{
  return self->_pairSetupRequired;
}

- (WiFiAwarePairingConfiguration)pairingConfiguration
{
  return self->_pairingConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingConfiguration, 0);
  objc_storeStrong((id *)&self->_publisherAddress, 0);
  objc_storeStrong((id *)&self->_serviceSpecificInfo, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end