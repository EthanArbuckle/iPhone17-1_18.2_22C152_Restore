@interface PKPaymentVehicleManufacturerResponse
- (NSData)encryptedData;
- (NSString)encryptionScheme;
- (NSString)ephemeralPublicKey;
- (NSString)publicKeyHash;
- (PKPaymentVehicleManufacturerResponse)initWithData:(id)a3;
- (PKPaymentVehicleManufacturerResponse)initWithEncryptionScheme:(id)a3 ephemeralPublicKey:(id)a4 publicKeyHash:(id)a5 encryptedData:(id)a6;
@end

@implementation PKPaymentVehicleManufacturerResponse

- (PKPaymentVehicleManufacturerResponse)initWithData:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentVehicleManufacturerResponse;
  v3 = [(PKWebServiceResponse *)&v21 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 PKDictionaryForKey:@"oemData"];
      uint64_t v7 = [v6 PKStringForKey:@"version"];
      encryptionScheme = v4->_encryptionScheme;
      v4->_encryptionScheme = (NSString *)v7;

      uint64_t v9 = [v6 PKStringForKey:@"ephemeralPublicKey"];
      ephemeralPublicKey = v4->_ephemeralPublicKey;
      v4->_ephemeralPublicKey = (NSString *)v9;

      uint64_t v11 = [v6 PKStringForKey:@"publicKeyHash"];
      publicKeyHash = v4->_publicKeyHash;
      v4->_publicKeyHash = (NSString *)v11;

      v13 = [v6 PKStringForKey:@"data"];
      if (v13)
      {
        uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v13 options:1];
        encryptedData = v4->_encryptedData;
        v4->_encryptedData = (NSData *)v14;
      }
    }
    else
    {
      v13 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (objc_class *)objc_opt_class();
        v17 = NSStringFromClass(v16);
        v18 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v23 = v17;
        __int16 v24 = 2112;
        v25 = v18;
        id v19 = v18;
        _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      v6 = v4;
      v4 = 0;
    }
  }
  return v4;
}

- (PKPaymentVehicleManufacturerResponse)initWithEncryptionScheme:(id)a3 ephemeralPublicKey:(id)a4 publicKeyHash:(id)a5 encryptedData:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PKPaymentVehicleManufacturerResponse;
  uint64_t v14 = [(PKPaymentVehicleManufacturerResponse *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    encryptionScheme = v14->_encryptionScheme;
    v14->_encryptionScheme = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    ephemeralPublicKey = v14->_ephemeralPublicKey;
    v14->_ephemeralPublicKey = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    publicKeyHash = v14->_publicKeyHash;
    v14->_publicKeyHash = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    encryptedData = v14->_encryptedData;
    v14->_encryptedData = (NSData *)v21;
  }
  return v14;
}

- (NSString)encryptionScheme
{
  return self->_encryptionScheme;
}

- (NSString)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (NSString)publicKeyHash
{
  return self->_publicKeyHash;
}

- (NSData)encryptedData
{
  return self->_encryptedData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedData, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
  objc_storeStrong((id *)&self->_encryptionScheme, 0);
}

@end