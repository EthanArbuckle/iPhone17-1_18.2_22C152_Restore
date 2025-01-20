@interface PKApplePayTrustKey
+ (BOOL)supportsSecureCoding;
- (NSData)certificate;
- (NSData)publicKeyHash;
- (NSData)signedEnrollmentData;
- (NSString)identifier;
- (PKApplePayTrustKey)initWithCoder:(id)a3;
- (PKApplePayTrustKey)initWithKey:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKApplePayTrustKey

- (PKApplePayTrustKey)initWithKey:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKApplePayTrustKey;
  v5 = [(PKApplePayTrustKey *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = [v4 keyAttestation];
    uint64_t v9 = objc_msgSend(v8, "pk_decodeHexadecimal");
    signedEnrollmentData = v5->_signedEnrollmentData;
    v5->_signedEnrollmentData = (NSData *)v9;

    v11 = [v4 publicKey];
    uint64_t v12 = [v11 SHA256Hash];
    publicKeyHash = v5->_publicKeyHash;
    v5->_publicKeyHash = (NSData *)v12;

    v14 = [v4 keyAttestationAuthority];
    uint64_t v15 = objc_msgSend(v14, "pk_decodeHexadecimal");
    certificate = v5->_certificate;
    v5->_certificate = (NSData *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  signedEnrollmentData = self->_signedEnrollmentData;
  id v5 = a3;
  [v5 encodeObject:signedEnrollmentData forKey:@"signedEnrollmentData"];
  [v5 encodeObject:self->_publicKeyHash forKey:@"publicKeyHash"];
  [v5 encodeObject:self->_certificate forKey:@"certificate"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
}

- (PKApplePayTrustKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKApplePayTrustKey;
  id v5 = [(PKApplePayTrustKey *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signedEnrollmentData"];
    signedEnrollmentData = v5->_signedEnrollmentData;
    v5->_signedEnrollmentData = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKeyHash"];
    publicKeyHash = v5->_publicKeyHash;
    v5->_publicKeyHash = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"certificate"];
    certificate = v5->_certificate;
    v5->_certificate = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v3 appendFormat:@"signedEnrollmentData: '%@'; ", self->_signedEnrollmentData];
  [v3 appendFormat:@"publicKeyHash: '%@'; ", self->_publicKeyHash];
  [v3 appendFormat:@"certificate: '%@'; ", self->_certificate];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)signedEnrollmentData
{
  return self->_signedEnrollmentData;
}

- (NSData)publicKeyHash
{
  return self->_publicKeyHash;
}

- (NSData)certificate
{
  return self->_certificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_signedEnrollmentData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end