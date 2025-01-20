@interface PKPaymentBackgroundRegisterCredentialRecord
+ (BOOL)supportsSecureCoding;
- (NSData)responseData;
- (NSString)credentialIdentifier;
- (PKPaymentBackgroundRegisterCredentialRecord)initWithCoder:(id)a3;
- (PKPaymentBackgroundRegisterCredentialRecord)initWithCredentialIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCredentialIdentifier:(id)a3;
- (void)setResponseData:(id)a3;
@end

@implementation PKPaymentBackgroundRegisterCredentialRecord

- (PKPaymentBackgroundRegisterCredentialRecord)initWithCredentialIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentBackgroundRegisterCredentialRecord;
  v6 = [(PKPaymentBackgroundRegisterCredentialRecord *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(PKPaymentBackgroundDownloadRecord *)v6 setTaskType:5];
    objc_storeStrong((id *)&v7->_credentialIdentifier, a3);
  }

  return v7;
}

- (PKPaymentBackgroundRegisterCredentialRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentBackgroundRegisterCredentialRecord;
  id v5 = [(PKPaymentBackgroundDownloadRecord *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialIdentifier"];
    [(PKPaymentBackgroundRegisterCredentialRecord *)v5 setCredentialIdentifier:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"responseData"];
    [(PKPaymentBackgroundRegisterCredentialRecord *)v5 setResponseData:v7];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentBackgroundRegisterCredentialRecord;
  id v4 = a3;
  [(PKPaymentBackgroundDownloadRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_credentialIdentifier, @"credentialIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_responseData forKey:@"responseData"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
}

- (NSData)responseData
{
  return self->_responseData;
}

- (void)setResponseData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
}

@end