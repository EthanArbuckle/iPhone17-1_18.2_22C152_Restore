@interface SEEndPointPrivacyEncryptResponse
+ (BOOL)supportsSecureCoding;
+ (SEEndPointPrivacyEncryptResponse)responseWithCipherText:(id)a3 ephemeralPublicKeyData:(id)a4 receiverPublicKeyHash:(id)a5;
- (NSData)cipherText;
- (NSData)ephemeralPublicKeydata;
- (NSData)receiverPublicKeyHash;
- (NSString)version;
- (SEEndPointPrivacyEncryptResponse)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCipherText:(id)a3;
- (void)setEphemeralPublicKeydata:(id)a3;
- (void)setReceiverPublicKeyHash:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation SEEndPointPrivacyEncryptResponse

+ (SEEndPointPrivacyEncryptResponse)responseWithCipherText:(id)a3 ephemeralPublicKeyData:(id)a4 receiverPublicKeyHash:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  v11 = v10;
  if (v10)
  {
    [v10 setVersion:@"ECIES_V1"];
    [v11 setCipherText:v7];
    [v11 setEphemeralPublicKeydata:v8];
    [v11 setReceiverPublicKeyHash:v9];
  }

  return (SEEndPointPrivacyEncryptResponse *)v11;
}

- (id)description
{
  v3 = NSString;
  v4 = [(SEEndPointPrivacyEncryptResponse *)self version];
  v5 = [(SEEndPointPrivacyEncryptResponse *)self cipherText];
  v6 = [v5 asHexString];
  id v7 = [(SEEndPointPrivacyEncryptResponse *)self ephemeralPublicKeydata];
  id v8 = [v7 asHexString];
  id v9 = [(SEEndPointPrivacyEncryptResponse *)self receiverPublicKeyHash];
  v10 = [v9 asHexString];
  v11 = [v3 stringWithFormat:@"{\n\tversion : %@,\n\tcipherText : %@,\n\tephemeralPublicKeydata : %@\n\treceiverPublicKeyHash : %@\n}", v4, v6, v8, v10];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SEEndPointPrivacyEncryptResponse *)self version];
  [v4 encodeObject:v5 forKey:@"version"];

  v6 = [(SEEndPointPrivacyEncryptResponse *)self cipherText];
  [v4 encodeObject:v6 forKey:@"cipherText"];

  id v7 = [(SEEndPointPrivacyEncryptResponse *)self ephemeralPublicKeydata];
  [v4 encodeObject:v7 forKey:@"ephemeralPublicKeydata"];

  id v8 = [(SEEndPointPrivacyEncryptResponse *)self receiverPublicKeyHash];
  [v4 encodeObject:v8 forKey:@"receiverPublicKeyHash"];
}

- (SEEndPointPrivacyEncryptResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SEEndPointPrivacyEncryptResponse;
  v5 = [(SEEndPointPrivacyEncryptResponse *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    version = v5->_version;
    v5->_version = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cipherText"];
    cipherText = v5->_cipherText;
    v5->_cipherText = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ephemeralPublicKeydata"];
    ephemeralPublicKeydata = v5->_ephemeralPublicKeydata;
    v5->_ephemeralPublicKeydata = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"receiverPublicKeyHash"];
    receiverPublicKeyHash = v5->_receiverPublicKeyHash;
    v5->_receiverPublicKeyHash = (NSData *)v12;
  }
  return v5;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSData)cipherText
{
  return self->_cipherText;
}

- (void)setCipherText:(id)a3
{
}

- (NSData)ephemeralPublicKeydata
{
  return self->_ephemeralPublicKeydata;
}

- (void)setEphemeralPublicKeydata:(id)a3
{
}

- (NSData)receiverPublicKeyHash
{
  return self->_receiverPublicKeyHash;
}

- (void)setReceiverPublicKeyHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiverPublicKeyHash, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKeydata, 0);
  objc_storeStrong((id *)&self->_cipherText, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end