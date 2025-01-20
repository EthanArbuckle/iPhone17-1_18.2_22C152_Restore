@interface PKApplyWebServiceRequestAuthenticationContext
+ (BOOL)supportsSecureCoding;
- (NSArray)certificates;
- (NSData)authenticationCrediential;
- (NSData)signature;
- (NSData)signaturePayload;
- (PKApplyWebServiceRequestAuthenticationContext)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthenticationCrediential:(id)a3;
- (void)setCertificates:(id)a3;
- (void)setSignature:(id)a3;
- (void)setSignaturePayload:(id)a3;
@end

@implementation PKApplyWebServiceRequestAuthenticationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplyWebServiceRequestAuthenticationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKApplyWebServiceRequestAuthenticationContext;
  v5 = [(PKApplyWebServiceRequestAuthenticationContext *)&v18 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"certificates"];
    certificates = v5->_certificates;
    v5->_certificates = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signaturePayload"];
    signaturePayload = v5->_signaturePayload;
    v5->_signaturePayload = (NSData *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
    signature = v5->_signature;
    v5->_signature = (NSData *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authenticationCrediential"];
    authenticationCrediential = v5->_authenticationCrediential;
    v5->_authenticationCrediential = (NSData *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  certificates = self->_certificates;
  id v5 = a3;
  [v5 encodeObject:certificates forKey:@"certificates"];
  [v5 encodeObject:self->_signaturePayload forKey:@"signaturePayload"];
  [v5 encodeObject:self->_signature forKey:@"signature"];
  [v5 encodeObject:self->_authenticationCrediential forKey:@"authenticationCrediential"];
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
}

- (NSData)signaturePayload
{
  return self->_signaturePayload;
}

- (void)setSignaturePayload:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (NSData)authenticationCrediential
{
  return self->_authenticationCrediential;
}

- (void)setAuthenticationCrediential:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationCrediential, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_signaturePayload, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
}

@end