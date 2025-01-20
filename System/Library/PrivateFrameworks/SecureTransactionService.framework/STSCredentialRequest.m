@interface STSCredentialRequest
+ (BOOL)supportsSecureCoding;
- (STSCredentialRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STSCredentialRequest

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_credentialIdentifier forKey:@"credentialIdentifier"];
}

- (STSCredentialRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  self->_unint64_t type = [v4 decodeIntegerForKey:@"type"];
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialIdentifier"];

  credentialIdentifier = self->_credentialIdentifier;
  self->_credentialIdentifier = v5;

  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

@end