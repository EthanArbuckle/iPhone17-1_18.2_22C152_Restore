@interface PKPaymentVehicleManufacturerRequest
+ (id)requestMetadataWithPartnerIdentifier:(id)a3 brandIdentifier:(id)a4;
- (PKPaymentVehicleManufacturerRequest)initWithInvitation:(id)a3 encryptedVehicleDataRequest:(id)a4;
- (PKPaymentVehicleManufacturerRequest)initWithPartnerIdentifier:(id)a3 brandIdentifier:(id)a4 encryptedVehicleDataRequest:(id)a5;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (id)requestBody;
@end

@implementation PKPaymentVehicleManufacturerRequest

+ (id)requestMetadataWithPartnerIdentifier:(id)a3 brandIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = PKPartnerIdentifierOverride();
  v8 = (void *)v7;
  if (v7) {
    v9 = (void *)v7;
  }
  else {
    v9 = v5;
  }
  id v10 = v9;
  if ([v8 length])
  {
    v11 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      v16 = v8;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Overriding partner identifier with value %@ (was %@)", (uint8_t *)&v15, 0x16u);
    }
  }
  v12 = 0;
  if (v6 && v10)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v13 setObject:v10 forKeyedSubscript:@"partnerID"];
    [v13 setObject:v6 forKeyedSubscript:@"brand"];
    v12 = (void *)[v13 copy];
  }
  return v12;
}

- (PKPaymentVehicleManufacturerRequest)initWithInvitation:(id)a3 encryptedVehicleDataRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 partnerIdentifier];
  v9 = [v7 brandIdentifier];

  id v10 = [(PKPaymentVehicleManufacturerRequest *)self initWithPartnerIdentifier:v8 brandIdentifier:v9 encryptedVehicleDataRequest:v6];
  return v10;
}

- (PKPaymentVehicleManufacturerRequest)initWithPartnerIdentifier:(id)a3 brandIdentifier:(id)a4 encryptedVehicleDataRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentVehicleManufacturerRequest;
  v11 = [(PKOverlayableWebServiceRequest *)&v21 init];
  if (!v11) {
    goto LABEL_4;
  }
  uint64_t v12 = dictionaryFromSubcredentialEncryptedRequest(v10);
  encryptedVehicleDataRequest = v11->_encryptedVehicleDataRequest;
  v11->_encryptedVehicleDataRequest = (NSDictionary *)v12;

  if (!v11->_encryptedVehicleDataRequest)
  {
    __int16 v17 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      id v18 = "Missing encryptedVehicleDataRequest on vehicle manufacturer request";
LABEL_9:
      _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, v18, v20, 2u);
    }
LABEL_10:

    v16 = 0;
    goto LABEL_11;
  }
  uint64_t v14 = [(id)objc_opt_class() requestMetadataWithPartnerIdentifier:v8 brandIdentifier:v9];
  metadata = v11->_metadata;
  v11->_metadata = (NSDictionary *)v14;

  if (!v11->_metadata)
  {
    __int16 v17 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      id v18 = "Missing metadata on vehicle manufacturer request";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_4:
  v16 = v11;
LABEL_11:

  return v16;
}

- (id)requestBody
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_encryptedVehicleDataRequest forKeyedSubscript:@"vehicleData"];
  [v3 setObject:self->_metadata forKeyedSubscript:@"metadata"];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = @"devices";
  id v20 = a4;
  objc_super v21 = @"vehicleManufacturerData";
  id v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v8 arrayWithObjects:&v19 count:3];

  id v13 = -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v11, v12, 0, v9, v19, v20, v21, v22);

  [v13 setHTTPMethod:@"POST"];
  uint64_t v14 = objc_opt_class();
  int v15 = [(PKPaymentVehicleManufacturerRequest *)self requestBody];
  v16 = [v14 _HTTPBodyWithDictionary:v15];
  [v13 setHTTPBody:v16];

  __int16 v17 = (void *)[v13 copy];
  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_encryptedVehicleDataRequest, 0);
}

@end