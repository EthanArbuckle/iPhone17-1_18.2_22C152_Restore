@interface PKIdentityProvisioningTransactionKey
+ (BOOL)supportsSecureCoding;
- (NSData)authorization;
- (NSData)casdAttestation;
- (PKIdentityProvisioningTransactionKey)initWithCASDAttestation:(id)a3 authorization:(id)a4;
- (PKIdentityProvisioningTransactionKey)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKIdentityProvisioningTransactionKey

- (PKIdentityProvisioningTransactionKey)initWithCASDAttestation:(id)a3 authorization:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKIdentityProvisioningTransactionKey;
  v9 = [(PKIdentityProvisioningTransactionKey *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_casdAttestation, a3);
    objc_storeStrong((id *)&v10->_authorization, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  casdAttestation = self->_casdAttestation;
  id v5 = a3;
  [v5 encodeObject:casdAttestation forKey:@"transactionKeyAttestation"];
  [v5 encodeObject:self->_authorization forKey:@"transactionKeyAuthorization"];
}

- (PKIdentityProvisioningTransactionKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKIdentityProvisioningTransactionKey;
  id v5 = [(PKIdentityProvisioningTransactionKey *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionKeyAttestation"];
    casdAttestation = v5->_casdAttestation;
    v5->_casdAttestation = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionKeyAuthorization"];
    authorization = v5->_authorization;
    v5->_authorization = (NSData *)v8;
  }
  return v5;
}

- (NSData)casdAttestation
{
  return self->_casdAttestation;
}

- (NSData)authorization
{
  return self->_authorization;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_casdAttestation, 0);
}

@end