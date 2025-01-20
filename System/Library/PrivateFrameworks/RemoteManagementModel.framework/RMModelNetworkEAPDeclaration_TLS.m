@interface RMModelNetworkEAPDeclaration_TLS
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithRequireClientCertificate:(id)a3 identityAssetReference:(id)a4 trustedServerNames:(id)a5 anchorCertificateAssetReferences:(id)a6 minimumVersion:(id)a7 maximumVersion:(id)a8;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)payloadAnchorCertificateAssetReferences;
- (NSArray)payloadTrustedServerNames;
- (NSNumber)payloadRequireClientCertificate;
- (NSString)payloadIdentityAssetReference;
- (NSString)payloadMaximumVersion;
- (NSString)payloadMinimumVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadAnchorCertificateAssetReferences:(id)a3;
- (void)setPayloadIdentityAssetReference:(id)a3;
- (void)setPayloadMaximumVersion:(id)a3;
- (void)setPayloadMinimumVersion:(id)a3;
- (void)setPayloadRequireClientCertificate:(id)a3;
- (void)setPayloadTrustedServerNames:(id)a3;
@end

@implementation RMModelNetworkEAPDeclaration_TLS

+ (NSSet)allowedPayloadKeys
{
  v6[6] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"RequireClientCertificate";
  v6[1] = @"IdentityAssetReference";
  v6[2] = @"TrustedServerNames";
  v6[3] = @"AnchorCertificateAssetReferences";
  v6[4] = @"MinimumVersion";
  v6[5] = @"MaximumVersion";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:6];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithRequireClientCertificate:(id)a3 identityAssetReference:(id)a4 trustedServerNames:(id)a5 anchorCertificateAssetReferences:(id)a6 minimumVersion:(id)a7 maximumVersion:(id)a8
{
  v13 = (__CFString *)a8;
  v14 = (__CFString *)a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = objc_opt_new();
  v20 = v19;
  if (v18) {
    id v21 = v18;
  }
  else {
    id v21 = (id)MEMORY[0x263EFFA80];
  }
  [v19 setPayloadRequireClientCertificate:v21];

  [v20 setPayloadIdentityAssetReference:v17];
  [v20 setPayloadTrustedServerNames:v16];

  [v20 setPayloadAnchorCertificateAssetReferences:v15];
  if (v14) {
    v22 = v14;
  }
  else {
    v22 = @"1.0";
  }
  [v20 setPayloadMinimumVersion:v22];

  if (v13) {
    v23 = v13;
  }
  else {
    v23 = @"1.2";
  }
  [v20 setPayloadMaximumVersion:v23];

  return v20;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();
  return v2;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelNetworkEAPDeclaration_TLS allowedPayloadKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  BOOL v13 = 0;
  if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"RequireClientCertificate" forKeyPath:@"payloadRequireClientCertificate" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
  {
    BOOL v13 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"IdentityAssetReference" forKeyPath:@"payloadIdentityAssetReference" isRequired:0 defaultValue:0 error:a5])
    {
      BOOL v13 = 0;
      if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v7 usingKey:@"TrustedServerNames" forKeyPath:@"payloadTrustedServerNames" validator:&__block_literal_global_499 isRequired:0 defaultValue:0 error:a5])
      {
        BOOL v13 = 0;
        if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v7 usingKey:@"AnchorCertificateAssetReferences" forKeyPath:@"payloadAnchorCertificateAssetReferences" validator:&__block_literal_global_504 isRequired:0 defaultValue:0 error:a5])
        {
          BOOL v13 = 0;
          if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"MinimumVersion" forKeyPath:@"payloadMinimumVersion" isRequired:0 defaultValue:@"1.0" error:a5])
          {
            BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"MaximumVersion" forKeyPath:@"payloadMaximumVersion" isRequired:0 defaultValue:@"1.2" error:a5];
          }
        }
      }
    }
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMModelNetworkEAPDeclaration_TLS *)self payloadRequireClientCertificate];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"RequireClientCertificate" value:v5 isRequired:0 defaultValue:MEMORY[0x263EFFA80]];

  v6 = [(RMModelNetworkEAPDeclaration_TLS *)self payloadIdentityAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"IdentityAssetReference" value:v6 isRequired:0 defaultValue:0];

  id v7 = [(RMModelNetworkEAPDeclaration_TLS *)self payloadTrustedServerNames];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v4 usingKey:@"TrustedServerNames" value:v7 itemSerializer:&__block_literal_global_512 isRequired:0 defaultValue:0];

  v8 = [(RMModelNetworkEAPDeclaration_TLS *)self payloadAnchorCertificateAssetReferences];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v4 usingKey:@"AnchorCertificateAssetReferences" value:v8 itemSerializer:&__block_literal_global_514 isRequired:0 defaultValue:0];

  v9 = [(RMModelNetworkEAPDeclaration_TLS *)self payloadMinimumVersion];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"MinimumVersion" value:v9 isRequired:0 defaultValue:@"1.0"];

  v10 = [(RMModelNetworkEAPDeclaration_TLS *)self payloadMaximumVersion];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"MaximumVersion" value:v10 isRequired:0 defaultValue:@"1.2"];

  v11 = (void *)[v4 copy];
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)RMModelNetworkEAPDeclaration_TLS;
  v4 = [(RMModelPayloadBase *)&v18 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadRequireClientCertificate copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadIdentityAssetReference copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSArray *)self->_payloadTrustedServerNames copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSArray *)self->_payloadAnchorCertificateAssetReferences copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSString *)self->_payloadMinimumVersion copy];
  v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSString *)self->_payloadMaximumVersion copy];
  id v16 = (void *)v4[7];
  v4[7] = v15;

  return v4;
}

- (NSNumber)payloadRequireClientCertificate
{
  return self->_payloadRequireClientCertificate;
}

- (void)setPayloadRequireClientCertificate:(id)a3
{
}

- (NSString)payloadIdentityAssetReference
{
  return self->_payloadIdentityAssetReference;
}

- (void)setPayloadIdentityAssetReference:(id)a3
{
}

- (NSArray)payloadTrustedServerNames
{
  return self->_payloadTrustedServerNames;
}

- (void)setPayloadTrustedServerNames:(id)a3
{
}

- (NSArray)payloadAnchorCertificateAssetReferences
{
  return self->_payloadAnchorCertificateAssetReferences;
}

- (void)setPayloadAnchorCertificateAssetReferences:(id)a3
{
}

- (NSString)payloadMinimumVersion
{
  return self->_payloadMinimumVersion;
}

- (void)setPayloadMinimumVersion:(id)a3
{
}

- (NSString)payloadMaximumVersion
{
  return self->_payloadMaximumVersion;
}

- (void)setPayloadMaximumVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadMaximumVersion, 0);
  objc_storeStrong((id *)&self->_payloadMinimumVersion, 0);
  objc_storeStrong((id *)&self->_payloadAnchorCertificateAssetReferences, 0);
  objc_storeStrong((id *)&self->_payloadTrustedServerNames, 0);
  objc_storeStrong((id *)&self->_payloadIdentityAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadRequireClientCertificate, 0);
}

@end