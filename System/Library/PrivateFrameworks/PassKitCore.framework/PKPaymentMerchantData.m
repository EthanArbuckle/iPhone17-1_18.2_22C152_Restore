@interface PKPaymentMerchantData
- (NSData)applicationData;
- (NSString)merchantIdentifier;
- (PKPaymentMerchantData)init;
- (PKPaymentMerchantData)initWithMerchantIdentifier:(id)a3 applicationData:(id)a4 merchantSession:(id)a5;
- (id)encode;
@end

@implementation PKPaymentMerchantData

- (PKPaymentMerchantData)initWithMerchantIdentifier:(id)a3 applicationData:(id)a4 merchantSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentMerchantData;
  v11 = [(PKPaymentMerchantData *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    merchantIdentifier = v11->_merchantIdentifier;
    v11->_merchantIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    applicationData = v11->_applicationData;
    v11->_applicationData = (NSData *)v14;

    objc_storeStrong((id *)&v11->_merchantSession, a5);
  }

  return v11;
}

- (PKPaymentMerchantData)init
{
  return [(PKPaymentMerchantData *)self initWithMerchantIdentifier:0 applicationData:0 merchantSession:0];
}

- (id)encode
{
  v3 = [MEMORY[0x1E4F1CA58] data];
  applicationData = self->_applicationData;
  if (applicationData)
  {
    v5 = [(NSData *)applicationData SHA256Hash];
    [v3 appendData:v5];
  }
  merchantSession = self->_merchantSession;
  if (merchantSession)
  {
    v7 = [(PKPaymentMerchantSession *)merchantSession merchantIdentifier];
    objc_msgSend(v7, "pk_decodeHexadecimal");
  }
  else
  {
    v7 = [(NSString *)self->_merchantIdentifier dataUsingEncoding:4];
    [v7 SHA256Hash];
  id v8 = };
  [v3 appendData:v8];

  id v9 = [v3 SHA256Hash];

  return v9;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (NSData)applicationData
{
  return self->_applicationData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantSession, 0);
}

@end