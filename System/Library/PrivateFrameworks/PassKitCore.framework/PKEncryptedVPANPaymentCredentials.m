@interface PKEncryptedVPANPaymentCredentials
- (NSData)encryptedCardData;
- (NSData)ephemeralPublicKey;
- (PKEncryptedVPANPaymentCredentials)initWithDictionary:(id)a3;
@end

@implementation PKEncryptedVPANPaymentCredentials

- (PKEncryptedVPANPaymentCredentials)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKEncryptedVPANPaymentCredentials;
  v5 = [(PKEncryptedVPANPaymentCredentials *)&v13 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"ephemeralPublicKey"];
    if (v6)
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
      ephemeralPublicKey = v5->_ephemeralPublicKey;
      v5->_ephemeralPublicKey = (NSData *)v7;
    }
    v9 = [v4 PKStringForKey:@"encryptedData"];
    if (v9)
    {
      uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v9 options:0];
      encryptedCardData = v5->_encryptedCardData;
      v5->_encryptedCardData = (NSData *)v10;
    }
  }

  return v5;
}

- (NSData)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (NSData)encryptedCardData
{
  return self->_encryptedCardData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedCardData, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
}

@end