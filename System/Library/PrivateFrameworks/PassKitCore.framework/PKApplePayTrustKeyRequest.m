@interface PKApplePayTrustKeyRequest
+ (BOOL)supportsSecureCoding;
- (NSData)subjectIdentifier;
- (NSString)keyIdentifier;
- (PKApplePayTrustKeyRequest)initWithCoder:(id)a3;
- (PKApplePayTrustKeyRequest)initWithKeyIdentifier:(id)a3 subjectIdentifier:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKApplePayTrustKeyRequest

- (PKApplePayTrustKeyRequest)initWithKeyIdentifier:(id)a3 subjectIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKApplePayTrustKeyRequest;
  v9 = [(PKApplePayTrustKeyRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyIdentifier, a3);
    objc_storeStrong((id *)&v10->_subjectIdentifier, a4);
  }

  return v10;
}

- (PKApplePayTrustKeyRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKApplePayTrustKeyRequest;
  v5 = [(PKApplePayTrustKeyRequest *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyIdentifier"];
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subjectIdentifier"];
    subjectIdentifier = v5->_subjectIdentifier;
    v5->_subjectIdentifier = (NSData *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  keyIdentifier = self->_keyIdentifier;
  id v5 = a3;
  [v5 encodeObject:keyIdentifier forKey:@"keyIdentifier"];
  [v5 encodeObject:self->_subjectIdentifier forKey:@"subjectIdentifier"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"keyIdentifier: '%@'; ", self->_keyIdentifier];
  [v3 appendFormat:@"subjectIdentifier: '%@'; ", self->_subjectIdentifier];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (NSData)subjectIdentifier
{
  return self->_subjectIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subjectIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

@end