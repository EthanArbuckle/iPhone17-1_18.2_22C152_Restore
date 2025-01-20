@interface PKIdentityProvisioningAttestations
+ (BOOL)supportsSecureCoding;
- (NSArray)authorizationKeyAttestation;
- (NSArray)deviceEncryptionKeyAttestation;
- (NSArray)transactionKeys;
- (NSData)deviceEncryptionKeyAuthorization;
- (NSData)progenitorKeyCASDAttestation;
- (NSData)serverAttestedProvisioningData;
- (NSData)transactionKeyCASDAttestation;
- (NSData)transactionKeyCASDAuthorization;
- (NSData)transactionKeyCASDSignature;
- (PKIdentityProvisioningAttestations)initWithAuthorizationKeyAttestation:(id)a3 deviceEncryptionKeyAttestation:(id)a4 deviceEncryptionKeyAuthorization:(id)a5 progenitorKeyCASDAttestation:(id)a6 transactionKeys:(id)a7 serverAttestedProvisioningData:(id)a8;
- (PKIdentityProvisioningAttestations)initWithAuthorizationKeyAttestation:(id)a3 deviceEncryptionKeyAttestation:(id)a4 deviceEncryptionKeyAuthorization:(id)a5 transactionKeyCASDAttestation:(id)a6 transactionKeyCASDSignature:(id)a7 transactionKeyCASDAuthorization:(id)a8;
- (PKIdentityProvisioningAttestations)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKIdentityProvisioningAttestations

- (PKIdentityProvisioningAttestations)initWithAuthorizationKeyAttestation:(id)a3 deviceEncryptionKeyAttestation:(id)a4 deviceEncryptionKeyAuthorization:(id)a5 transactionKeyCASDAttestation:(id)a6 transactionKeyCASDSignature:(id)a7 transactionKeyCASDAuthorization:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PKIdentityProvisioningAttestations;
  v18 = [(PKIdentityProvisioningAttestations *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_authorizationKeyAttestation, a3);
    objc_storeStrong((id *)&v19->_deviceEncryptionKeyAttestation, a4);
    objc_storeStrong((id *)&v19->_deviceEncryptionKeyAuthorization, a5);
    objc_storeStrong((id *)&v19->_transactionKeyCASDAttestation, a6);
    objc_storeStrong((id *)&v19->_transactionKeyCASDSignature, a7);
    objc_storeStrong((id *)&v19->_transactionKeyCASDAuthorization, a8);
  }

  return v19;
}

- (PKIdentityProvisioningAttestations)initWithAuthorizationKeyAttestation:(id)a3 deviceEncryptionKeyAttestation:(id)a4 deviceEncryptionKeyAuthorization:(id)a5 progenitorKeyCASDAttestation:(id)a6 transactionKeys:(id)a7 serverAttestedProvisioningData:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PKIdentityProvisioningAttestations;
  v18 = [(PKIdentityProvisioningAttestations *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_authorizationKeyAttestation, a3);
    objc_storeStrong((id *)&v19->_deviceEncryptionKeyAttestation, a4);
    objc_storeStrong((id *)&v19->_deviceEncryptionKeyAuthorization, a5);
    objc_storeStrong((id *)&v19->_progenitorKeyCASDAttestation, a6);
    objc_storeStrong((id *)&v19->_transactionKeys, a7);
    objc_storeStrong((id *)&v19->_serverAttestedProvisioningData, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  authorizationKeyAttestation = self->_authorizationKeyAttestation;
  id v5 = a3;
  [v5 encodeObject:authorizationKeyAttestation forKey:@"authorizationKeyAttestation"];
  [v5 encodeObject:self->_deviceEncryptionKeyAttestation forKey:@"deviceEncryptionKeyAttestation"];
  [v5 encodeObject:self->_deviceEncryptionKeyAuthorization forKey:@"deviceEncryptionKeyAuthorization"];
  [v5 encodeObject:self->_transactionKeyCASDAttestation forKey:@"transactionKeyCASDAttestation"];
  [v5 encodeObject:self->_transactionKeyCASDSignature forKey:@"transactionKeyCASDSignature"];
  [v5 encodeObject:self->_transactionKeyCASDAuthorization forKey:@"transactionKeyCASDAuthorization"];
  [v5 encodeObject:self->_progenitorKeyCASDAttestation forKey:@"progenitorKeyAttestation"];
  [v5 encodeObject:self->_transactionKeys forKey:@"transactionKeyData"];
  [v5 encodeObject:self->_serverAttestedProvisioningData forKey:@"serverAttestedProvisioningData"];
}

- (PKIdentityProvisioningAttestations)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKIdentityProvisioningAttestations;
  id v5 = [(PKIdentityProvisioningAttestations *)&v34 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"authorizationKeyAttestation"];
    authorizationKeyAttestation = v5->_authorizationKeyAttestation;
    v5->_authorizationKeyAttestation = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"deviceEncryptionKeyAttestation"];
    deviceEncryptionKeyAttestation = v5->_deviceEncryptionKeyAttestation;
    v5->_deviceEncryptionKeyAttestation = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceEncryptionKeyAuthorization"];
    deviceEncryptionKeyAuthorization = v5->_deviceEncryptionKeyAuthorization;
    v5->_deviceEncryptionKeyAuthorization = (NSData *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionKeyCASDAttestation"];
    transactionKeyCASDAttestation = v5->_transactionKeyCASDAttestation;
    v5->_transactionKeyCASDAttestation = (NSData *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionKeyCASDSignature"];
    transactionKeyCASDSignature = v5->_transactionKeyCASDSignature;
    v5->_transactionKeyCASDSignature = (NSData *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionKeyCASDAuthorization"];
    transactionKeyCASDAuthorization = v5->_transactionKeyCASDAuthorization;
    v5->_transactionKeyCASDAuthorization = (NSData *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"progenitorKeyAttestation"];
    progenitorKeyCASDAttestation = v5->_progenitorKeyCASDAttestation;
    v5->_progenitorKeyCASDAttestation = (NSData *)v24;

    v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"transactionKeyData"];
    transactionKeys = v5->_transactionKeys;
    v5->_transactionKeys = (NSArray *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverAttestedProvisioningData"];
    serverAttestedProvisioningData = v5->_serverAttestedProvisioningData;
    v5->_serverAttestedProvisioningData = (NSData *)v31;
  }
  return v5;
}

- (NSArray)authorizationKeyAttestation
{
  return self->_authorizationKeyAttestation;
}

- (NSArray)deviceEncryptionKeyAttestation
{
  return self->_deviceEncryptionKeyAttestation;
}

- (NSData)deviceEncryptionKeyAuthorization
{
  return self->_deviceEncryptionKeyAuthorization;
}

- (NSData)transactionKeyCASDAttestation
{
  return self->_transactionKeyCASDAttestation;
}

- (NSData)transactionKeyCASDSignature
{
  return self->_transactionKeyCASDSignature;
}

- (NSData)transactionKeyCASDAuthorization
{
  return self->_transactionKeyCASDAuthorization;
}

- (NSData)progenitorKeyCASDAttestation
{
  return self->_progenitorKeyCASDAttestation;
}

- (NSArray)transactionKeys
{
  return self->_transactionKeys;
}

- (NSData)serverAttestedProvisioningData
{
  return self->_serverAttestedProvisioningData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverAttestedProvisioningData, 0);
  objc_storeStrong((id *)&self->_transactionKeys, 0);
  objc_storeStrong((id *)&self->_progenitorKeyCASDAttestation, 0);
  objc_storeStrong((id *)&self->_transactionKeyCASDAuthorization, 0);
  objc_storeStrong((id *)&self->_transactionKeyCASDSignature, 0);
  objc_storeStrong((id *)&self->_transactionKeyCASDAttestation, 0);
  objc_storeStrong((id *)&self->_deviceEncryptionKeyAuthorization, 0);
  objc_storeStrong((id *)&self->_deviceEncryptionKeyAttestation, 0);
  objc_storeStrong((id *)&self->_authorizationKeyAttestation, 0);
}

@end