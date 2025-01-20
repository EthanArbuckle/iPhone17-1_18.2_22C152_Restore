@interface PKIdentityRequest
- (NSData)nonce;
- (NSString)merchantIdentifier;
- (NSString)merchantNameOverride;
- (NSURL)merchantPrivacyPolicyOverride;
- (id)asDIIdentityRequest;
- (id)description;
- (id)descriptor;
- (void)setDescriptor:(id)descriptor;
- (void)setMerchantIdentifier:(NSString *)merchantIdentifier;
- (void)setMerchantNameOverride:(id)a3;
- (void)setMerchantPrivacyPolicyOverride:(id)a3;
- (void)setNonce:(NSData *)nonce;
@end

@implementation PKIdentityRequest

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v4 = v3;
  if (self->_descriptor) {
    [v3 appendFormat:@"descriptor: %@, ", self->_descriptor];
  }
  if (self->_nonce) {
    [v4 appendFormat:@"nonce: %@, ", self->_nonce];
  }
  if (self->_merchantIdentifier) {
    [v4 appendFormat:@"merchantIdentifier: %@, ", self->_merchantIdentifier];
  }
  if (self->_merchantNameOverride) {
    [v4 appendFormat:@"merchantNameOverride: %@, ", self->_merchantNameOverride];
  }
  if (self->_merchantPrivacyPolicyOverride) {
    [v4 appendFormat:@"merchantPrivacyPolicyOverride: %@, ", self->_merchantPrivacyPolicyOverride];
  }
  [v4 appendFormat:@">"];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)asDIIdentityRequest
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F5C1D8]);
  descriptor = self->_descriptor;
  if (descriptor)
  {
    v5 = DIIdentityDocumentDescriptorFromPKIdentityDocumentDescriptor(descriptor);
    [v3 setDescriptor:v5];
  }
  [v3 setNonce:self->_nonce];
  [v3 setMerchantIdentifier:self->_merchantIdentifier];
  [v3 setMerchantNameOverride:self->_merchantNameOverride];
  [v3 setMerchantPrivacyPolicyOverride:self->_merchantPrivacyPolicyOverride];
  return v3;
}

- (id)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)descriptor
{
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(NSData *)nonce
{
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(NSString *)merchantIdentifier
{
}

- (NSString)merchantNameOverride
{
  return self->_merchantNameOverride;
}

- (void)setMerchantNameOverride:(id)a3
{
}

- (NSURL)merchantPrivacyPolicyOverride
{
  return self->_merchantPrivacyPolicyOverride;
}

- (void)setMerchantPrivacyPolicyOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantPrivacyPolicyOverride, 0);
  objc_storeStrong((id *)&self->_merchantNameOverride, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end