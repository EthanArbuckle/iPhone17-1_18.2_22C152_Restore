@interface STSCredentialSelect
+ (BOOL)supportsSecureCoding;
- (STSCredentialSelect)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STSCredentialSelect

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_credentialIdentifier forKey:@"credentialIdentifier"];
  [v5 encodeObject:self->_elementsByNamespace forKey:@"elementsByNamespace"];
  authData = self->_authData;
  if (authData) {
    [v5 encodeObject:authData forKey:@"authData"];
  }
}

- (STSCredentialSelect)initWithCoder:(id)a3
{
  if (self)
  {
    id v4 = a3;
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialIdentifier"];
    credentialIdentifier = self->_credentialIdentifier;
    self->_credentialIdentifier = v5;

    v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    v11 = [v4 decodeObjectOfClasses:v10 forKey:@"elementsByNamespace"];
    elementsByNamespace = self->_elementsByNamespace;
    self->_elementsByNamespace = v11;

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authData"];

    authData = self->_authData;
    self->_authData = v13;
  }
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authData, 0);
  objc_storeStrong((id *)&self->_elementsByNamespace, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
}

@end