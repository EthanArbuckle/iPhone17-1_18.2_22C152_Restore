@interface PKPayment
+ (BOOL)supportsSecureCoding;
+ (PKPayment)paymentWithProtobuf:(id)a3;
+ (int64_t)version;
- (ABRecordRef)billingAddress;
- (ABRecordRef)shippingAddress;
- (NSData)credential;
- (NSMutableDictionary)authKitAuthenticationResults;
- (NSString)installmentAuthorizationToken;
- (PKContact)billingContact;
- (PKContact)shippingContact;
- (PKPayment)initWithCoder:(id)a3;
- (PKPayment)initWithToken:(id)a3;
- (PKPaymentToken)token;
- (PKShippingMethod)shippingMethod;
- (id)description;
- (id)dictionaryRepresentation;
- (id)protobuf;
- (int64_t)biometricAuthorizationAttempts;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthKitAuthenticationResults:(id)a3;
- (void)setBillingContact:(id)a3;
- (void)setBiometricAuthorizationAttempts:(int64_t)a3;
- (void)setCredential:(id)a3;
- (void)setInstallmentAuthorizationToken:(id)a3;
- (void)setShippingContact:(id)a3;
- (void)setShippingMethod:(id)a3;
- (void)setToken:(id)a3;
@end

@implementation PKPayment

+ (PKPayment)paymentWithProtobuf:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PKPayment);
  v5 = [v3 token];
  v6 = +[PKPaymentToken paymentTokenWithProtobuf:v5];
  [(PKPayment *)v4 setToken:v6];

  v7 = [v3 billingContact];

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v9 = objc_opt_class();
    v10 = [v3 billingContact];
    v11 = [v8 unarchivedObjectOfClass:v9 fromData:v10 error:0];
    [(PKPayment *)v4 setBillingContact:v11];
  }
  v12 = [v3 shippingContact];

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v14 = objc_opt_class();
    v15 = [v3 shippingContact];
    v16 = [v13 unarchivedObjectOfClass:v14 fromData:v15 error:0];
    [(PKPayment *)v4 setShippingContact:v16];
  }
  v17 = [v3 shippingMethod];

  if (v17)
  {
    v18 = [v3 shippingMethod];
    v19 = +[PKShippingMethod shippingMethodWithProtobuf:v18];
    [(PKPayment *)v4 setShippingMethod:v19];
  }
  return v4;
}

- (id)protobuf
{
  id v3 = objc_alloc_init(PKProtobufPayment);
  v4 = [(PKPayment *)self token];
  v5 = [v4 protobuf];
  [(PKProtobufPayment *)v3 setToken:v5];

  v6 = [(PKPayment *)self billingContact];

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4F28DB0];
    v8 = [(PKPayment *)self billingContact];
    uint64_t v9 = [v7 archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];
    [(PKProtobufPayment *)v3 setBillingContact:v9];
  }
  v10 = [(PKPayment *)self shippingContact];

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E4F28DB0];
    v12 = [(PKPayment *)self shippingContact];
    v13 = [v11 archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];
    [(PKProtobufPayment *)v3 setShippingContact:v13];
  }
  uint64_t v14 = [(PKPayment *)self shippingMethod];

  if (v14)
  {
    v15 = [(PKPayment *)self shippingMethod];
    v16 = [v15 shippingMethodProtobuf];
    [(PKProtobufPayment *)v3 setShippingMethod:v16];
  }
  return v3;
}

+ (int64_t)version
{
  return 4;
}

- (PKPayment)initWithToken:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayment;
  v6 = [(PKPayment *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_token, a3);
  }

  return v7;
}

- (ABRecordRef)shippingAddress
{
  v2 = [(PKContact *)self->_shippingContact cnMutableContact];
  id v3 = (const void *)[v2 ABPerson];

  return v3;
}

- (ABRecordRef)billingAddress
{
  v2 = [(PKContact *)self->_billingContact cnMutableContact];
  id v3 = (const void *)[v2 ABPerson];

  return v3;
}

- (PKPayment)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPayment;
  id v5 = [(PKPayment *)&v15 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"token"];
    [(PKPayment *)v5 setToken:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shippingContact"];
    [(PKPayment *)v5 setShippingContact:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"billingContact"];
    [(PKPayment *)v5 setBillingContact:v8];

    objc_super v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shippingMethod"];
    [(PKPayment *)v5 setShippingMethod:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credential"];
    [(PKPayment *)v5 setCredential:v10];

    v11 = [v4 decodePropertyListForKey:@"authKitAuthenticationResults"];
    v12 = (void *)[v11 mutableCopy];
    [(PKPayment *)v5 setAuthKitAuthenticationResults:v12];

    -[PKPayment setBiometricAuthorizationAttempts:](v5, "setBiometricAuthorizationAttempts:", [v4 decodeIntegerForKey:@"biometryAttempts"]);
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentAuthorizationToken"];
    [(PKPayment *)v5 setInstallmentAuthorizationToken:v13];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPayment *)self token];
  [v4 encodeObject:v5 forKey:@"token"];

  v6 = [(PKPayment *)self shippingContact];
  [v4 encodeObject:v6 forKey:@"shippingContact"];

  v7 = [(PKPayment *)self billingContact];
  [v4 encodeObject:v7 forKey:@"billingContact"];

  v8 = [(PKPayment *)self shippingMethod];
  [v4 encodeObject:v8 forKey:@"shippingMethod"];

  objc_super v9 = [(PKPayment *)self credential];
  [v4 encodeObject:v9 forKey:@"credential"];

  v10 = [(PKPayment *)self authKitAuthenticationResults];
  v11 = (void *)[v10 copy];
  [v4 encodeObject:v11 forKey:@"authKitAuthenticationResults"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[PKPayment biometricAuthorizationAttempts](self, "biometricAuthorizationAttempts"), @"biometryAttempts");
  id v12 = [(PKPayment *)self installmentAuthorizationToken];
  [v4 encodeObject:v12 forKey:@"installmentAuthorizationToken"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = v3;
  if (self->_token) {
    [v3 appendFormat:@"token: %@", self->_token];
  }
  [v4 appendFormat:@">"];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  shippingContact = self->_shippingContact;
  if (shippingContact)
  {
    id v5 = [(PKContact *)shippingContact dictionaryRepresentation];
    [v3 setObject:v5 forKeyedSubscript:@"shippingContact"];
  }
  billingContact = self->_billingContact;
  if (billingContact)
  {
    v7 = [(PKContact *)billingContact dictionaryRepresentation];
    [v3 setObject:v7 forKeyedSubscript:@"billingContact"];
  }
  shippingMethod = self->_shippingMethod;
  if (shippingMethod)
  {
    objc_super v9 = [(PKShippingMethod *)shippingMethod dictionaryRepresentation];
    [v3 setObject:v9 forKeyedSubscript:@"shippingMethod"];
  }
  token = self->_token;
  if (token)
  {
    v11 = [(PKPaymentToken *)token dictionaryRepresentation];
    [v3 setObject:v11 forKeyedSubscript:@"paymentToken"];
  }
  id v12 = (void *)[v3 copy];

  return v12;
}

- (PKPaymentToken)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (PKContact)billingContact
{
  return self->_billingContact;
}

- (void)setBillingContact:(id)a3
{
}

- (PKContact)shippingContact
{
  return self->_shippingContact;
}

- (void)setShippingContact:(id)a3
{
}

- (PKShippingMethod)shippingMethod
{
  return self->_shippingMethod;
}

- (void)setShippingMethod:(id)a3
{
}

- (NSData)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
}

- (NSMutableDictionary)authKitAuthenticationResults
{
  return self->_authKitAuthenticationResults;
}

- (void)setAuthKitAuthenticationResults:(id)a3
{
}

- (int64_t)biometricAuthorizationAttempts
{
  return self->_biometricAuthorizationAttempts;
}

- (void)setBiometricAuthorizationAttempts:(int64_t)a3
{
  self->_biometricAuthorizationAttempts = a3;
}

- (NSString)installmentAuthorizationToken
{
  return self->_installmentAuthorizationToken;
}

- (void)setInstallmentAuthorizationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentAuthorizationToken, 0);
  objc_storeStrong((id *)&self->_authKitAuthenticationResults, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_shippingMethod, 0);
  objc_storeStrong((id *)&self->_shippingContact, 0);
  objc_storeStrong((id *)&self->_billingContact, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end