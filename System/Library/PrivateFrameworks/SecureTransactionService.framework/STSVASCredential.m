@interface STSVASCredential
+ (BOOL)supportsSecureCoding;
+ (id)vasCredentialWithMerchantId:(id)a3 data:(id)a4 mobileToken:(id)a5 userInterventionRequired:(BOOL)a6;
- (BOOL)userInterventionRequired;
- (NSData)data;
- (NSData)merchantId;
- (NSData)mobileToken;
- (STSVASCredential)initWithCoder:(id)a3;
- (STSVASCredential)initWithMerchantId:(id)a3 data:(id)a4 mobileToken:(id)a5 userInterventionRequired:(BOOL)a6;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setMerchantId:(id)a3;
- (void)setMobileToken:(id)a3;
- (void)setUserInterventionRequired:(BOOL)a3;
@end

@implementation STSVASCredential

+ (id)vasCredentialWithMerchantId:(id)a3 data:(id)a4 mobileToken:(id)a5 userInterventionRequired:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [[STSVASCredential alloc] initWithMerchantId:v11 data:v10 mobileToken:v9 userInterventionRequired:v6];

  return v12;
}

- (STSVASCredential)initWithMerchantId:(id)a3 data:(id)a4 mobileToken:(id)a5 userInterventionRequired:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)STSVASCredential;
  v14 = [(STSAuxiliaryCredential *)&v17 initWithType:1];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_merchantId, a3);
    objc_storeStrong((id *)&v15->_data, a4);
    objc_storeStrong((id *)&v15->_mobileToken, a5);
    v15->_userInterventionRequired = a6;
  }

  return v15;
}

- (STSVASCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STSVASCredential;
  v5 = [(STSAuxiliaryCredential *)&v13 initWithType:1];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"STSVASCredentialKeyMerchantId"];
    merchantId = v5->_merchantId;
    v5->_merchantId = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"STSVASCredentialKeyData"];
    data = v5->_data;
    v5->_data = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"STSVASCredentialKeyMobileToken"];
    mobileToken = v5->_mobileToken;
    v5->_mobileToken = (NSData *)v10;

    v5->_userInterventionRequired = [v4 decodeBoolForKey:@"STSVASCredentialKeyUserInterventionRequired"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STSVASCredential;
  id v4 = a3;
  [(STSAuxiliaryCredential *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_merchantId, @"STSVASCredentialKeyMerchantId", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_data forKey:@"STSVASCredentialKeyData"];
  [v4 encodeObject:self->_mobileToken forKey:@"STSVASCredentialKeyMobileToken"];
  [v4 encodeBool:self->_userInterventionRequired forKey:@"STSVASCredentialKeyUserInterventionRequired"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)merchantId
{
  return self->_merchantId;
}

- (void)setMerchantId:(id)a3
{
}

- (BOOL)userInterventionRequired
{
  return self->_userInterventionRequired;
}

- (void)setUserInterventionRequired:(BOOL)a3
{
  self->_userInterventionRequired = a3;
}

- (NSData)mobileToken
{
  return self->_mobileToken;
}

- (void)setMobileToken:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_mobileToken, 0);
  objc_storeStrong((id *)&self->_merchantId, 0);
}

@end