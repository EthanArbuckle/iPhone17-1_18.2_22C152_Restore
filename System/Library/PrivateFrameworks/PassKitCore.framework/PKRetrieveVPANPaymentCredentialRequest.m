@interface PKRetrieveVPANPaymentCredentialRequest
- (NSArray)endpointComponents;
- (NSString)deviceIdentifier;
- (NSString)merchantHost;
- (NSString)nonce;
- (NSString)vpanIdentifier;
- (PKRetrieveVPANPaymentCredentialRequest)initWithPaymentPass:(id)a3 vpanIdentifier:(id)a4 deviceIdentifier:(id)a5 nonce:(id)a6 encryptionFields:(id)a7 merchantHost:(id)a8;
- (PKSecureElementPass)paymentPass;
- (PKVirtualCardEncryptionFields)encryptionFields;
- (void)_urlRequestWithServiceURL:(id)a3 rewrapData:(id)a4 appleAccountInformation:(id)a5 webService:(id)a6 completion:(id)a7;
- (void)setDeviceIdentifier:(id)a3;
- (void)setEncryptionFields:(id)a3;
- (void)setMerchantHost:(id)a3;
- (void)setNonce:(id)a3;
- (void)setPaymentPass:(id)a3;
- (void)setVpanIdentifier:(id)a3;
@end

@implementation PKRetrieveVPANPaymentCredentialRequest

- (NSArray)endpointComponents
{
  v5[3] = *MEMORY[0x1E4F143B8];
  deviceIdentifier = self->_deviceIdentifier;
  v5[0] = @"devices";
  v5[1] = deviceIdentifier;
  v5[2] = @"virtualCardPaymentCredential";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  return (NSArray *)v3;
}

- (PKRetrieveVPANPaymentCredentialRequest)initWithPaymentPass:(id)a3 vpanIdentifier:(id)a4 deviceIdentifier:(id)a5 nonce:(id)a6 encryptionFields:(id)a7 merchantHost:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v32.receiver = self;
  v32.super_class = (Class)PKRetrieveVPANPaymentCredentialRequest;
  v21 = [(PKOverlayableWebServiceRequest *)&v32 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_paymentPass, a3);
    uint64_t v23 = [v16 copy];
    vpanIdentifier = v22->_vpanIdentifier;
    v22->_vpanIdentifier = (NSString *)v23;

    uint64_t v25 = [v17 copy];
    deviceIdentifier = v22->_deviceIdentifier;
    v22->_deviceIdentifier = (NSString *)v25;

    uint64_t v27 = [v18 copy];
    nonce = v22->_nonce;
    v22->_nonce = (NSString *)v27;

    objc_storeStrong((id *)&v22->_encryptionFields, a7);
    uint64_t v29 = [v20 copy];
    merchantHost = v22->_merchantHost;
    v22->_merchantHost = (NSString *)v29;
  }
  return v22;
}

- (void)_urlRequestWithServiceURL:(id)a3 rewrapData:(id)a4 appleAccountInformation:(id)a5 webService:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = a5;
  id v16 = a3;
  id v17 = [(PKRetrieveVPANPaymentCredentialRequest *)self endpointComponents];
  id v18 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v16 version:@"1" endpointComponents:v17 queryParameters:0 appleAccountInformation:v15];

  [v18 setHTTPMethod:@"POST"];
  id v19 = [MEMORY[0x1E4F1CA60] dictionary];
  [v19 setObject:self->_vpanIdentifier forKeyedSubscript:@"virtualCardNumberIdentifier"];
  id v20 = [(PKSecureElementPass *)self->_paymentPass primaryAccountIdentifier];
  [v19 setObject:v20 forKeyedSubscript:@"primaryAccountIdentifier"];

  [v19 setObject:self->_nonce forKeyedSubscript:@"nOnce"];
  merchantHost = self->_merchantHost;
  if (merchantHost) {
    [v19 setObject:merchantHost forKeyedSubscript:@"merchantDomain"];
  }
  v22 = [(PKVirtualCardEncryptionFields *)self->_encryptionFields dictionaryRepresentation];
  [v19 setObject:v22 forKeyedSubscript:@"virtualCardEncryptionFields"];

  uint64_t v23 = [(PKPass *)self->_paymentPass serialNumber];
  [v19 setObject:v23 forKeyedSubscript:@"passSerialNumber"];

  if (v12)
  {
    v24 = [v12 platformData];
    uint64_t v25 = [v24 hexEncoding];
    [v19 setObject:v25 forKeyedSubscript:@"pairedSEP"];

    v26 = [v12 platformDataSignature];
    uint64_t v27 = [v26 hexEncoding];
    [v19 setObject:v27 forKeyedSubscript:@"pairedSEPSignature"];
  }
  v28 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v19];
  [v18 setHTTPBody:v28];

  uint64_t v29 = [v18 HTTPBody];
  v30 = [v29 SHA256Hash];

  if (v13)
  {
    v31 = [v13 targetDevice];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __125__PKRetrieveVPANPaymentCredentialRequest__urlRequestWithServiceURL_rewrapData_appleAccountInformation_webService_completion___block_invoke;
    v32[3] = &unk_1E56D8540;
    id v33 = v18;
    id v34 = v14;
    [v31 paymentWebService:v13 signData:v30 signatureEntanglementMode:0 withCompletionHandler:v32];
  }
  else if (v14)
  {
    (*((void (**)(id, void *))v14 + 2))(v14, v18);
  }
}

uint64_t __125__PKRetrieveVPANPaymentCredentialRequest__urlRequestWithServiceURL_rewrapData_appleAccountInformation_webService_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  PKUpdateURLRequestWithSignatureDataAndInfo(*(void **)(a1 + 32), a2, a3);
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (PKSecureElementPass)paymentPass
{
  return self->_paymentPass;
}

- (void)setPaymentPass:(id)a3
{
}

- (NSString)vpanIdentifier
{
  return self->_vpanIdentifier;
}

- (void)setVpanIdentifier:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (PKVirtualCardEncryptionFields)encryptionFields
{
  return self->_encryptionFields;
}

- (void)setEncryptionFields:(id)a3
{
}

- (NSString)merchantHost
{
  return self->_merchantHost;
}

- (void)setMerchantHost:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantHost, 0);
  objc_storeStrong((id *)&self->_encryptionFields, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_vpanIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
}

@end