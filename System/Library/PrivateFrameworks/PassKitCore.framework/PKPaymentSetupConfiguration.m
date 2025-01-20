@interface PKPaymentSetupConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)usePaymentSetupFeaturesFromCDN;
- (NSArray)signedFields;
- (NSString)merchantIdentifier;
- (NSString)referrerIdentifier;
- (NSString)signature;
- (NSURL)originatingURL;
- (PKPaymentSetupConfiguration)init;
- (PKPaymentSetupConfiguration)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setMerchantIdentifier:(id)a3;
- (void)setOriginatingURL:(id)a3;
- (void)setReferrerIdentifier:(id)a3;
- (void)setSignature:(id)a3;
- (void)setSignedFields:(id)a3;
- (void)setUsePaymentSetupFeaturesFromCDN:(BOOL)a3;
@end

@implementation PKPaymentSetupConfiguration

- (PKPaymentSetupConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupConfiguration;
  result = [(PKPaymentSetupConfiguration *)&v3 init];
  if (result) {
    result->_usePaymentSetupFeaturesFromCDN = 1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentSetupConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPaymentSetupConfiguration;
  v5 = [(PKPaymentSetupConfiguration *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referrerIdentifier"];
    referrerIdentifier = v5->_referrerIdentifier;
    v5->_referrerIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantIdentifier"];
    merchantIdentifier = v5->_merchantIdentifier;
    v5->_merchantIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originatingURL"];
    originatingURL = v5->_originatingURL;
    v5->_originatingURL = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
    signature = v5->_signature;
    v5->_signature = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"signedFields"];
    signedFields = v5->_signedFields;
    v5->_signedFields = (NSArray *)v17;

    v5->_usePaymentSetupFeaturesFromCDN = [v4 decodeBoolForKey:@"usePaymentSetupFeaturesFromCDN"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  referrerIdentifier = self->_referrerIdentifier;
  id v5 = a3;
  [v5 encodeObject:referrerIdentifier forKey:@"referrerIdentifier"];
  [v5 encodeObject:self->_merchantIdentifier forKey:@"merchantIdentifier"];
  [v5 encodeObject:self->_originatingURL forKey:@"originatingURL"];
  [v5 encodeObject:self->_signature forKey:@"signature"];
  [v5 encodeObject:self->_signedFields forKey:@"signedFields"];
  [v5 encodeBool:self->_usePaymentSetupFeaturesFromCDN forKey:@"usePaymentSetupFeaturesFromCDN"];
}

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (void)setReferrerIdentifier:(id)a3
{
}

- (BOOL)usePaymentSetupFeaturesFromCDN
{
  return self->_usePaymentSetupFeaturesFromCDN;
}

- (void)setUsePaymentSetupFeaturesFromCDN:(BOOL)a3
{
  self->_usePaymentSetupFeaturesFromCDN = a3;
}

- (NSURL)originatingURL
{
  return self->_originatingURL;
}

- (void)setOriginatingURL:(id)a3
{
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
}

- (NSArray)signedFields
{
  return self->_signedFields;
}

- (void)setSignedFields:(id)a3
{
}

- (NSString)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_signedFields, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_originatingURL, 0);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
}

@end