@interface SEEndPointAuthorizeResponse
+ (BOOL)supportsSecureCoding;
+ (id)responseWithEndPointAttestationData:(id)a3 encryptionPublicKeyData:(id)a4 encryptedData:(id)a5;
- (NSData)encryptedData;
- (NSData)encryptionPublicKeyData;
- (NSData)endPointAttestationData;
- (SEEndPointAuthorizeResponse)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEncryptedData:(id)a3;
- (void)setEncryptionPublicKeyData:(id)a3;
- (void)setEndPointAttestationData:(id)a3;
@end

@implementation SEEndPointAuthorizeResponse

+ (id)responseWithEndPointAttestationData:(id)a3 encryptionPublicKeyData:(id)a4 encryptedData:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  v11 = v10;
  if (v10)
  {
    [v10 setEndPointAttestationData:v7];
    [v11 setEncryptionPublicKeyData:v8];
    [v11 setEncryptedData:v9];
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  v4 = [(SEEndPointAuthorizeResponse *)self endPointAttestationData];
  v5 = [v4 asHexString];
  v6 = [(SEEndPointAuthorizeResponse *)self encryptionPublicKeyData];
  id v7 = [v6 asHexString];
  id v8 = [(SEEndPointAuthorizeResponse *)self encryptedData];
  id v9 = [v8 asHexString];
  v10 = [v3 stringWithFormat:@"{\n\tendPointAttestation : %@,\n\tencryptionPublicKey : %@,\n\tencryptedData : %@\n}", v5, v7, v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SEEndPointAuthorizeResponse *)self endPointAttestationData];
  [v4 encodeObject:v5 forKey:@"endPointAttestationData"];

  v6 = [(SEEndPointAuthorizeResponse *)self encryptionPublicKeyData];
  [v4 encodeObject:v6 forKey:@"encryptionPublicKeyData"];

  id v7 = [(SEEndPointAuthorizeResponse *)self encryptedData];
  [v4 encodeObject:v7 forKey:@"encryptedData"];
}

- (SEEndPointAuthorizeResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SEEndPointAuthorizeResponse;
  v5 = [(SEEndPointAuthorizeResponse *)&v17 init];
  v6 = v5;
  if (v5)
  {
    id v7 = [(SEEndPointAuthorizeResponse *)v5 endPointAttestationData];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endPointAttestationData"];
    endPointAttestationData = v6->_endPointAttestationData;
    v6->_endPointAttestationData = (NSData *)v8;

    v10 = [(SEEndPointAuthorizeResponse *)v6 encryptionPublicKeyData];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptionPublicKeyData"];
    encryptionPublicKeyData = v6->_encryptionPublicKeyData;
    v6->_encryptionPublicKeyData = (NSData *)v11;

    v13 = [(SEEndPointAuthorizeResponse *)v6 encryptedData];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptedData"];
    encryptedData = v6->_encryptedData;
    v6->_encryptedData = (NSData *)v14;
  }
  return v6;
}

- (NSData)endPointAttestationData
{
  return self->_endPointAttestationData;
}

- (void)setEndPointAttestationData:(id)a3
{
}

- (NSData)encryptedData
{
  return self->_encryptedData;
}

- (void)setEncryptedData:(id)a3
{
}

- (NSData)encryptionPublicKeyData
{
  return self->_encryptionPublicKeyData;
}

- (void)setEncryptionPublicKeyData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionPublicKeyData, 0);
  objc_storeStrong((id *)&self->_encryptedData, 0);
  objc_storeStrong((id *)&self->_endPointAttestationData, 0);
}

@end