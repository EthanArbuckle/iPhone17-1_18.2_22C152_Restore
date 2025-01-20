@interface WiFiAwareDatapathConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)internetSharingEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)pairSetupServiceSpecificInfoEqual:(id)a3;
- (BOOL)pairingCachingEnabled;
- (BOOL)passphraseEqual:(id)a3;
- (BOOL)pmkEqual:(id)a3;
- (BOOL)pmkIDEqual:(id)a3;
- (BOOL)serviceSpecificInfoEqual:(id)a3;
- (NSData)pmk;
- (NSData)pmkID;
- (NSString)passphrase;
- (WiFiAwareDatapathConfiguration)initWithCoder:(id)a3;
- (WiFiAwareDatapathConfiguration)initWithDiscoveryResult:(id)a3 serviceType:(int64_t)a4 passphrase:(id)a5 pmk:(id)a6 pmkID:(id)a7 serviceSpecificInfo:(id)a8 internetSharingConfiguration:(id)a9 pairingMethod:(int64_t)a10 pairingCachingEnabled:(BOOL)a11 pairSetupServiceSpecificInfo:(id)a12;
- (WiFiAwareDiscoveryResult)discoveryResult;
- (WiFiAwareInternetSharingConfiguration)internetSharingConfiguration;
- (WiFiAwarePublishDatapathServiceSpecificInfo)serviceSpecificInfo;
- (WiFiAwarePublishServiceSpecificInfo)pairSetupServiceSpecificInfo;
- (id)description;
- (int64_t)pairingMethod;
- (int64_t)serviceType;
- (void)encodeWithCoder:(id)a3;
- (void)setInternetSharingConfiguration:(id)a3;
- (void)setServiceSpecificInfo:(id)a3;
@end

@implementation WiFiAwareDatapathConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwareDatapathConfiguration *)self discoveryResult];
  [v4 encodeObject:v5 forKey:@"WiFiAwareDataRequest.discoveryResult"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[WiFiAwareDatapathConfiguration serviceType](self, "serviceType"), @"WiFiAwareDataRequest.serviceType");
  v6 = [(WiFiAwareDatapathConfiguration *)self passphrase];
  [v4 encodeObject:v6 forKey:@"WiFiAwareDataRequest.passphrase"];

  v7 = [(WiFiAwareDatapathConfiguration *)self pmk];
  [v4 encodeObject:v7 forKey:@"WiFiAwareDataRequest.pmk"];

  v8 = [(WiFiAwareDatapathConfiguration *)self pmkID];
  [v4 encodeObject:v8 forKey:@"WiFiAwareDataRequest.pmkID"];

  v9 = [(WiFiAwareDatapathConfiguration *)self serviceSpecificInfo];
  [v4 encodeObject:v9 forKey:@"WiFiAwareDataRequest.serviceSpecificInfo"];

  v10 = [(WiFiAwareDatapathConfiguration *)self internetSharingConfiguration];
  [v4 encodeObject:v10 forKey:@"WiFiAwareDataRequest.internetSharingConfiguration"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[WiFiAwareDatapathConfiguration pairingMethod](self, "pairingMethod"), @"WiFiAwareDataRequest.pairingMethod");
  objc_msgSend(v4, "encodeBool:forKey:", -[WiFiAwareDatapathConfiguration pairingCachingEnabled](self, "pairingCachingEnabled"), @"WiFiAwareDataRequest.pairingCaching");
  id v11 = [(WiFiAwareDatapathConfiguration *)self pairSetupServiceSpecificInfo];
  [v4 encodeObject:v11 forKey:@"WiFiAwareDataRequest.pairSetupServiceSpecificInfo"];
}

- (WiFiAwareDatapathConfiguration)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataRequest.discoveryResult"];
  uint64_t v16 = [v3 decodeIntegerForKey:@"WiFiAwareDataRequest.serviceType"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataRequest.passphrase"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataRequest.pmk"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataRequest.pmkID"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataRequest.serviceSpecificInfo"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataRequest.internetSharingConfiguration"];
  uint64_t v10 = [v3 decodeIntegerForKey:@"WiFiAwareDataRequest.pairingMethod"];
  char v11 = [v3 decodeBoolForKey:@"WiFiAwareDataRequest.pairingCaching"];
  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataRequest.pairSetupServiceSpecificInfo"];

  LOBYTE(v15) = v11;
  v13 = [(WiFiAwareDatapathConfiguration *)self initWithDiscoveryResult:v4 serviceType:v16 passphrase:v5 pmk:v6 pmkID:v7 serviceSpecificInfo:v8 internetSharingConfiguration:v9 pairingMethod:v10 pairingCachingEnabled:v15 pairSetupServiceSpecificInfo:v12];

  return v13;
}

- (WiFiAwareDatapathConfiguration)initWithDiscoveryResult:(id)a3 serviceType:(int64_t)a4 passphrase:(id)a5 pmk:(id)a6 pmkID:(id)a7 serviceSpecificInfo:(id)a8 internetSharingConfiguration:(id)a9 pairingMethod:(int64_t)a10 pairingCachingEnabled:(BOOL)a11 pairSetupServiceSpecificInfo:(id)a12
{
  id v40 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a12;
  v41.receiver = self;
  v41.super_class = (Class)WiFiAwareDatapathConfiguration;
  v25 = [(WiFiAwareDatapathConfiguration *)&v41 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_discoveryResult, a3);
    v26->_serviceType = a4;
    uint64_t v27 = [v19 copy];
    passphrase = v26->_passphrase;
    v26->_passphrase = (NSString *)v27;

    uint64_t v29 = [v20 copy];
    pmk = v26->_pmk;
    v26->_pmk = (NSData *)v29;

    uint64_t v31 = [v21 copy];
    pmkID = v26->_pmkID;
    v26->_pmkID = (NSData *)v31;

    uint64_t v33 = [v22 copy];
    serviceSpecificInfo = v26->_serviceSpecificInfo;
    v26->_serviceSpecificInfo = (WiFiAwarePublishDatapathServiceSpecificInfo *)v33;

    uint64_t v35 = [v23 copy];
    internetSharingConfiguration = v26->_internetSharingConfiguration;
    v26->_internetSharingConfiguration = (WiFiAwareInternetSharingConfiguration *)v35;

    v26->_pairingMethod = a10;
    v26->_pairingCachingEnabled = a11;
    uint64_t v37 = [v24 copy];
    pairSetupServiceSpecificInfo = v26->_pairSetupServiceSpecificInfo;
    v26->_pairSetupServiceSpecificInfo = (WiFiAwarePublishServiceSpecificInfo *)v37;
  }
  return v26;
}

- (BOOL)passphraseEqual:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwareDatapathConfiguration *)self passphrase];
  v6 = [v4 passphrase];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    v7 = [(WiFiAwareDatapathConfiguration *)self passphrase];
    v8 = [v4 passphrase];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)pmkEqual:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwareDatapathConfiguration *)self pmk];
  v6 = [v4 pmk];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    v7 = [(WiFiAwareDatapathConfiguration *)self pmk];
    v8 = [v4 pmk];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)pmkIDEqual:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwareDatapathConfiguration *)self pmkID];
  v6 = [v4 pmkID];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    v7 = [(WiFiAwareDatapathConfiguration *)self pmkID];
    v8 = [v4 pmkID];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)serviceSpecificInfoEqual:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwareDatapathConfiguration *)self serviceSpecificInfo];
  v6 = [v4 serviceSpecificInfo];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    v7 = [(WiFiAwareDatapathConfiguration *)self serviceSpecificInfo];
    v8 = [v4 serviceSpecificInfo];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)pairSetupServiceSpecificInfoEqual:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwareDatapathConfiguration *)self pairSetupServiceSpecificInfo];
  v6 = [v4 pairSetupServiceSpecificInfo];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    v7 = [(WiFiAwareDatapathConfiguration *)self pairSetupServiceSpecificInfo];
    v8 = [v4 pairSetupServiceSpecificInfo];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)internetSharingEqual:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwareDatapathConfiguration *)self internetSharingConfiguration];
  v6 = [v4 internetSharingConfiguration];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    v7 = [(WiFiAwareDatapathConfiguration *)self internetSharingConfiguration];
    v8 = [v4 internetSharingConfiguration];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WiFiAwareDatapathConfiguration *)a3;
  if (self == v4)
  {
    v5 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v10 = 0;
      v5 = 0;
      goto LABEL_16;
    }
    v5 = v4;
    v6 = [(WiFiAwareDatapathConfiguration *)self discoveryResult];
    v7 = [(WiFiAwareDatapathConfiguration *)v5 discoveryResult];
    if (![v6 isEqual:v7]
      || (int64_t v8 = [(WiFiAwareDatapathConfiguration *)self serviceType],
          v8 != [(WiFiAwareDatapathConfiguration *)v5 serviceType])
      || ![(WiFiAwareDatapathConfiguration *)self passphraseEqual:v5]
      || ![(WiFiAwareDatapathConfiguration *)self pmkEqual:v5]
      || ![(WiFiAwareDatapathConfiguration *)self pmkIDEqual:v5]
      || ![(WiFiAwareDatapathConfiguration *)self serviceSpecificInfoEqual:v5])
    {

LABEL_15:
      BOOL v10 = 0;
      goto LABEL_16;
    }
    BOOL v9 = [(WiFiAwareDatapathConfiguration *)self internetSharingEqual:v5];

    if (!v9) {
      goto LABEL_15;
    }
  }
  BOOL v10 = 1;
LABEL_16:

  return v10;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(WiFiAwareDatapathConfiguration *)self discoveryResult];
  unint64_t v5 = [(WiFiAwareDatapathConfiguration *)self serviceType];
  id v20 = v3;
  if (v5 > 2) {
    v6 = "unrecognized";
  }
  else {
    v6 = off_1E633F0D0[v5];
  }
  id v19 = v6;
  v7 = [(WiFiAwareDatapathConfiguration *)self passphrase];
  int64_t v8 = [(WiFiAwareDatapathConfiguration *)self pmk];
  BOOL v9 = [(WiFiAwareDatapathConfiguration *)self pmkID];
  BOOL v10 = [(WiFiAwareDatapathConfiguration *)self serviceSpecificInfo];
  char v11 = [(WiFiAwareDatapathConfiguration *)self internetSharingConfiguration];
  unint64_t v12 = [(WiFiAwareDatapathConfiguration *)self pairingMethod];
  if (v12 > 5) {
    v13 = "unrecognized";
  }
  else {
    v13 = off_1E633F0E8[v12];
  }
  if ([(WiFiAwareDatapathConfiguration *)self pairingCachingEnabled]) {
    v14 = "YES";
  }
  else {
    v14 = "NO";
  }
  uint64_t v15 = [(WiFiAwareDatapathConfiguration *)self pairSetupServiceSpecificInfo];
  if (v15)
  {
    uint64_t v16 = [(WiFiAwareDatapathConfiguration *)self pairSetupServiceSpecificInfo];
    v17 = [v20 stringWithFormat:@"<WiFiAwareDatapathConfiguration: discoveryResult=%@, serviceType=%s, passphrase=%@, pmk=%@, pmkID=%@, serviceSpecificInfo=%@, internetSharing=%@, pairingMethod=%s, pairingCaching=%s, pairSetupServiceSpecificInfo=%@>", v4, v19, v7, v8, v9, v10, v11, v13, v14, v16];
  }
  else
  {
    v17 = [v20 stringWithFormat:@"<WiFiAwareDatapathConfiguration: discoveryResult=%@, serviceType=%s, passphrase=%@, pmk=%@, pmkID=%@, serviceSpecificInfo=%@, internetSharing=%@, pairingMethod=%s, pairingCaching=%s, pairSetupServiceSpecificInfo=%@>", v4, v19, v7, v8, v9, v10, v11, v13, v14, @"none"];
  }

  return v17;
}

- (WiFiAwareDiscoveryResult)discoveryResult
{
  return self->_discoveryResult;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (NSString)passphrase
{
  return self->_passphrase;
}

- (NSData)pmk
{
  return self->_pmk;
}

- (NSData)pmkID
{
  return self->_pmkID;
}

- (WiFiAwarePublishDatapathServiceSpecificInfo)serviceSpecificInfo
{
  return self->_serviceSpecificInfo;
}

- (void)setServiceSpecificInfo:(id)a3
{
}

- (WiFiAwareInternetSharingConfiguration)internetSharingConfiguration
{
  return self->_internetSharingConfiguration;
}

- (void)setInternetSharingConfiguration:(id)a3
{
}

- (int64_t)pairingMethod
{
  return self->_pairingMethod;
}

- (BOOL)pairingCachingEnabled
{
  return self->_pairingCachingEnabled;
}

- (WiFiAwarePublishServiceSpecificInfo)pairSetupServiceSpecificInfo
{
  return (WiFiAwarePublishServiceSpecificInfo *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairSetupServiceSpecificInfo, 0);
  objc_storeStrong((id *)&self->_internetSharingConfiguration, 0);
  objc_storeStrong((id *)&self->_serviceSpecificInfo, 0);
  objc_storeStrong((id *)&self->_pmkID, 0);
  objc_storeStrong((id *)&self->_pmk, 0);
  objc_storeStrong((id *)&self->_passphrase, 0);
  objc_storeStrong((id *)&self->_discoveryResult, 0);
}

@end