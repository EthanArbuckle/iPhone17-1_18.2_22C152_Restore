@interface STSTapToProvisionResult
+ (id)fromOR:(id)a3;
- (NSData)authenticationTag;
- (NSData)casdCertificate;
- (NSData)casdSignature;
- (NSData)ephemeralPublicKey;
- (NSData)keyIdentifier;
- (NSData)provisionDataBlob;
- (NSString)configId;
- (NSString)formatVersion;
- (NSString)platformId;
- (NSString)transactionId;
- (STSTapToProvisionResult)initWithProvisionDataBlob:(id)a3 casdCertificate:(id)a4;
- (STSTapToProvisionResult)initWithProvisionDataBlob:(id)a3 platformId:(id)a4 configId:(id)a5 transactionId:(id)a6 casdCertificate:(id)a7 casdSignature:(id)a8 authenticationTag:(id)a9 ephemeralPublicKey:(id)a10 formatVersion:(id)a11 keyIdentifier:(id)a12;
- (id)description;
@end

@implementation STSTapToProvisionResult

- (STSTapToProvisionResult)initWithProvisionDataBlob:(id)a3 casdCertificate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)STSTapToProvisionResult;
  v9 = [(STSTapToProvisionResult *)&v24 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_provisionDataBlob, a3);
    platformId = v10->_platformId;
    v10->_platformId = (NSString *)&stru_26D2FDEC0;

    configId = v10->_configId;
    v10->_configId = (NSString *)&stru_26D2FDEC0;

    transactionId = v10->_transactionId;
    v10->_transactionId = (NSString *)&stru_26D2FDEC0;

    objc_storeStrong((id *)&v10->_casdCertificate, a4);
    uint64_t v14 = objc_opt_new();
    casdSignature = v10->_casdSignature;
    v10->_casdSignature = (NSData *)v14;

    uint64_t v16 = objc_opt_new();
    authenticationTag = v10->_authenticationTag;
    v10->_authenticationTag = (NSData *)v16;

    uint64_t v18 = objc_opt_new();
    ephemeralPublicKey = v10->_ephemeralPublicKey;
    v10->_ephemeralPublicKey = (NSData *)v18;

    formatVersion = v10->_formatVersion;
    v10->_formatVersion = (NSString *)&stru_26D2FDEC0;

    uint64_t v21 = objc_opt_new();
    keyIdentifier = v10->_keyIdentifier;
    v10->_keyIdentifier = (NSData *)v21;
  }
  return v10;
}

- (STSTapToProvisionResult)initWithProvisionDataBlob:(id)a3 platformId:(id)a4 configId:(id)a5 transactionId:(id)a6 casdCertificate:(id)a7 casdSignature:(id)a8 authenticationTag:(id)a9 ephemeralPublicKey:(id)a10 formatVersion:(id)a11 keyIdentifier:(id)a12
{
  return -[STSTapToProvisionResult initWithProvisionDataBlob:casdCertificate:](self, "initWithProvisionDataBlob:casdCertificate:", a3, a7, a5, a6);
}

+ (id)fromOR:(id)a3
{
  id v3 = a3;
  v4 = [STSTapToProvisionResult alloc];
  v5 = [v3 provisionDataBlob];
  v6 = [v3 casdCertificate];

  id v7 = [(STSTapToProvisionResult *)v4 initWithProvisionDataBlob:v5 casdCertificate:v6];
  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Tap To Provision Result : \n            \tprovisionDataBlob=%@,\n            \tcasdCertificate=%@\n", self->_provisionDataBlob, self->_casdCertificate];
}

- (NSData)provisionDataBlob
{
  return self->_provisionDataBlob;
}

- (NSData)casdCertificate
{
  return self->_casdCertificate;
}

- (NSString)platformId
{
  return self->_platformId;
}

- (NSString)configId
{
  return self->_configId;
}

- (NSString)transactionId
{
  return self->_transactionId;
}

- (NSData)casdSignature
{
  return self->_casdSignature;
}

- (NSData)authenticationTag
{
  return self->_authenticationTag;
}

- (NSData)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (NSString)formatVersion
{
  return self->_formatVersion;
}

- (NSData)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_formatVersion, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
  objc_storeStrong((id *)&self->_authenticationTag, 0);
  objc_storeStrong((id *)&self->_casdSignature, 0);
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_configId, 0);
  objc_storeStrong((id *)&self->_platformId, 0);
  objc_storeStrong((id *)&self->_casdCertificate, 0);
  objc_storeStrong((id *)&self->_provisionDataBlob, 0);
}

@end