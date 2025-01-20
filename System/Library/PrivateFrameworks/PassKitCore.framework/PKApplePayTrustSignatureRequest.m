@interface PKApplePayTrustSignatureRequest
+ (BOOL)supportsSecureCoding;
- (NSData)manifestHash;
- (NSData)nonce;
- (NSString)keyIdentifier;
- (PKApplePayTrustSignatureRequest)initWithCoder:(id)a3;
- (PKApplePayTrustSignatureRequest)initWithKeyIdentifier:(id)a3 manifestHash:(id)a4 nonce:(id)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKApplePayTrustSignatureRequest

- (PKApplePayTrustSignatureRequest)initWithKeyIdentifier:(id)a3 manifestHash:(id)a4 nonce:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKApplePayTrustSignatureRequest;
  v12 = [(PKApplePayTrustSignatureRequest *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_keyIdentifier, a3);
    objc_storeStrong((id *)&v13->_manifestHash, a4);
    objc_storeStrong((id *)&v13->_nonce, a5);
  }

  return v13;
}

- (PKApplePayTrustSignatureRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKApplePayTrustSignatureRequest;
  v5 = [(PKApplePayTrustSignatureRequest *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nonce"];
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manifestHash"];
    manifestHash = v5->_manifestHash;
    v5->_manifestHash = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyIdentifier"];
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  nonce = self->_nonce;
  id v5 = a3;
  [v5 encodeObject:nonce forKey:@"nonce"];
  [v5 encodeObject:self->_manifestHash forKey:@"manifestHash"];
  [v5 encodeObject:self->_keyIdentifier forKey:@"keyIdentifier"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"keyIdentifier: '%@'; ", self->_keyIdentifier];
  objc_msgSend(v3, "appendFormat:", @"manifestHash length: '%lu'; ",
    [(NSData *)self->_manifestHash length]);
  objc_msgSend(v3, "appendFormat:", @"nonce length: '%lu'; ", -[NSData length](self->_nonce, "length"));
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

- (NSData)nonce
{
  return self->_nonce;
}

- (NSData)manifestHash
{
  return self->_manifestHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifestHash, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

@end