@interface PKPaymentRequirementsRequest
- (BOOL)sendReducedDeviceData;
- (NSData)challengeResponse;
- (NSData)cryptogram;
- (NSString)cardholderName;
- (NSString)passOwnershipToken;
- (NSString)primaryAccountNumber;
- (NSString)referrerIdentifier;
- (NSString)region;
- (PKDSPContext)context;
- (PKPaymentCredential)paymentCredential;
- (PKPaymentRequirementsRequest)initWithCardholderName:(id)a3 primaryAccountNumber:(id)a4;
- (PKPaymentRequirementsRequest)initWithPaymentCredential:(id)a3;
- (id)_archivedDataForEncryptedDataDictionary:(id)a3;
- (id)_cardDictionary;
- (void)_cardDictionaryForDeviceData:(id)a3 inWebService:(id)a4 includingDeviceScore:(BOOL)a5 withCompletion:(id)a6;
- (void)_deviceScoreUsingWebService:(id)a3 withCompletion:(id)a4;
- (void)_encryptedDataWithDeviceData:(id)a3 certChain:(id)a4 devSigned:(BOOL)a5 includeDeviceScore:(BOOL)a6 inWebService:(id)a7 withCompletion:(id)a8;
- (void)_updateContextUsingWebService:(id)a3 completion:(id)a4;
- (void)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5 certChain:(id)a6 devSigned:(BOOL)a7 deviceData:(id)a8 webService:(id)a9 completion:(id)a10;
- (void)setCardholderName:(id)a3;
- (void)setChallengeResponse:(id)a3;
- (void)setContext:(id)a3;
- (void)setCryptogram:(id)a3;
- (void)setPassOwnershipToken:(id)a3;
- (void)setPaymentCredential:(id)a3;
- (void)setPrimaryAccountNumber:(id)a3;
- (void)setReferrerIdentifier:(id)a3;
- (void)setRegion:(id)a3;
- (void)setSendReducedDeviceData:(BOOL)a3;
@end

@implementation PKPaymentRequirementsRequest

- (PKPaymentRequirementsRequest)initWithPaymentCredential:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentRequirementsRequest;
  v6 = [(PKOverlayableWebServiceRequest *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_paymentCredential, a3);
    v8 = [v5 underlyingPaymentPass];
    uint64_t v9 = [v8 passTypeIdentifier];
    region = v7->_region;
    v7->_region = (NSString *)v9;
  }
  return v7;
}

- (PKPaymentRequirementsRequest)initWithCardholderName:(id)a3 primaryAccountNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentRequirementsRequest;
  v8 = [(PKOverlayableWebServiceRequest *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    cardholderName = v8->_cardholderName;
    v8->_cardholderName = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    primaryAccountNumber = v8->_primaryAccountNumber;
    v8->_primaryAccountNumber = (NSString *)v11;
  }
  return v8;
}

- (id)_cardDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  paymentCredential = self->_paymentCredential;
  if (paymentCredential)
  {
    BOOL v5 = [(PKPaymentCredential *)paymentCredential isContactlessProductCredential];
    id v6 = self->_paymentCredential;
    if (v5)
    {
      id v7 = [(PKPaymentCredential *)v6 contactlessProductCredential];
      v8 = [v7 cardSessionToken];
      if (!v8)
      {
LABEL_17:

        goto LABEL_25;
      }
      uint64_t v9 = @"cardSessionToken";
LABEL_5:
      [v3 setObject:v8 forKeyedSubscript:v9];
      goto LABEL_17;
    }
    if (v6)
    {
      BOOL v10 = [(PKPaymentCredential *)v6 isDigitalIssuanceProductCredential];
      uint64_t v11 = self->_paymentCredential;
      if (v10)
      {
        objc_super v12 = [(PKPaymentCredential *)v11 digitalIssuanceProductCredential];
LABEL_12:
        id v7 = v12;
        v8 = [v12 purchase];
        v15 = [v8 identifier];
        v16 = [v8 partnerMetadata];
        if (v15) {
          [v3 setObject:v15 forKeyedSubscript:@"provisioningToken"];
        }
        if (v16) {
          [v3 setObject:v16 forKeyedSubscript:@"metadata"];
        }

        goto LABEL_17;
      }
      if (v11)
      {
        BOOL v13 = [(PKPaymentCredential *)v11 isPurchasedProductCredential];
        objc_super v14 = self->_paymentCredential;
        if (v13)
        {
          objc_super v12 = [(PKPaymentCredential *)v14 purchasedProductCredential];
          goto LABEL_12;
        }
        if (v14 && [(PKPaymentCredential *)v14 isSafariCredential])
        {
          id v7 = [(PKPaymentCredential *)self->_paymentCredential safariCredential];
          v17 = [v7 cardholderName];
          [v3 setObject:v17 forKeyedSubscript:@"name"];

          v8 = [v7 cardNumber];
          uint64_t v9 = @"primaryAccountNumber";
          goto LABEL_5;
        }
      }
    }
  }
  cardholderName = self->_cardholderName;
  if (cardholderName) {
    [v3 setObject:cardholderName forKeyedSubscript:@"name"];
  }
  primaryAccountNumber = self->_primaryAccountNumber;
  if (primaryAccountNumber) {
    [v3 setObject:primaryAccountNumber forKeyedSubscript:@"primaryAccountNumber"];
  }
LABEL_25:
  return v3;
}

- (void)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5 certChain:(id)a6 devSigned:(BOOL)a7 deviceData:(id)a8 webService:(id)a9 completion:(id)a10
{
  BOOL v11 = a7;
  v88[5] = *MEMORY[0x1E4F143B8];
  id v65 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__53;
  v82 = __Block_byref_object_dispose__53;
  id v83 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __152__PKPaymentRequirementsRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_certChain_devSigned_deviceData_webService_completion___block_invoke;
  aBlock[3] = &unk_1E56E5C38;
  aBlock[4] = self;
  id v22 = v21;
  id v77 = v22;
  v23 = _Block_copy(aBlock);
  paymentCredential = self->_paymentCredential;
  if (paymentCredential
    && ![(PKPaymentCredential *)paymentCredential isContactlessProductCredential]
    && ![(PKPaymentCredential *)self->_paymentCredential isDigitalIssuanceProductCredential]&& ![(PKPaymentCredential *)self->_paymentCredential isPurchasedProductCredential]&& ![(PKPaymentCredential *)self->_paymentCredential isSafariCredential])
  {
    BOOL context = [(PKPaymentCredential *)self->_paymentCredential isRemoteCredential];
    int v31 = context | [(PKPaymentCredential *)self->_paymentCredential isLocalPassCredential];
    v32 = self->_paymentCredential;
    if (v31 == 1)
    {
      BOOL v57 = [(PKPaymentCredential *)v32 couldSupportSuperEasyProvisioning];
      v33 = self->_paymentCredential;
      if (context)
      {
        contexta = [(PKPaymentCredential *)v33 remoteCredential];
        v88[0] = @"devices";
        v88[1] = v16;
        v88[2] = @"cards";
        v58 = [contexta identifier];
        v88[3] = v58;
        v88[4] = @"provisioningRequirements";
        v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:5];
        uint64_t v35 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v65 endpointComponents:v34 queryParameters:0 appleAccountInformation:v17];
        v36 = (void *)v79[5];
        v79[5] = v35;
      }
      else
      {
        contexta = [(PKPaymentCredential *)v33 localPassCredential];
        v87[0] = @"devices";
        v87[1] = v16;
        v87[2] = @"passes";
        v58 = [contexta passTypeIdentifier];
        v87[3] = v58;
        v56 = [contexta serialNumber];
        v87[4] = v56;
        v87[5] = @"provisioningRequirements";
        v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:6];
        uint64_t v48 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v65 endpointComponents:v47 queryParameters:0 appleAccountInformation:v17];
        v49 = (void *)v79[5];
        v79[5] = v48;
      }
      v37 = [contexta state];
      v59 = [v37 useNonce];

      v50 = (void *)v79[5];
      if (v57)
      {
        [v50 setHTTPMethod:@"POST"];
        contextc = (void *)MEMORY[0x192FDC630]([(id)v79[5] setValue:@"application/binary" forHTTPHeaderField:@"Content-Type"]);
        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = __152__PKPaymentRequirementsRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_certChain_devSigned_deviceData_webService_completion___block_invoke_2;
        v70[3] = &unk_1E56EDCA8;
        id v71 = v19;
        v72 = self;
        id v73 = v59;
        v75 = &v78;
        id v74 = v23;
        [(PKPaymentRequirementsRequest *)self _encryptedDataWithDeviceData:v71 certChain:v18 devSigned:v11 includeDeviceScore:1 inWebService:v20 withCompletion:v70];
      }
      else
      {
        [v50 setHTTPMethod:@"GET"];
        (*((void (**)(void *, uint64_t))v23 + 2))(v23, v79[5]);
      }

      goto LABEL_9;
    }
    BOOL v38 = [(PKPaymentCredential *)v32 isAccountCredential];
    v39 = self->_paymentCredential;
    if (v38)
    {
      v60 = [(PKPaymentCredential *)v39 accountCredential];
      v40 = [v60 passDetailsResponse];
      contextb = [v40 provisioningIdentifier];

      if (![contextb length])
      {
        v41 = PKLogFacilityTypeGetObject(0xEuLL);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v41, OS_LOG_TYPE_DEFAULT, "Error: Missing provisioning identifier for requirements request", buf, 2u);
        }
      }
      if (![v16 length])
      {
        v42 = PKLogFacilityTypeGetObject(0xEuLL);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v42, OS_LOG_TYPE_DEFAULT, "Error: Missing device identifier for requirements request", buf, 2u);
        }
      }
      v86[0] = @"devices";
      v86[1] = v16;
      v86[2] = @"cards";
      v86[3] = contextb;
      v86[4] = @"provisioningRequirements";
      v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:5];
      uint64_t v44 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v65 endpointComponents:v43 queryParameters:0 appleAccountInformation:v17];
      v45 = (void *)v79[5];
      v79[5] = v44;

      [(id)v79[5] setHTTPMethod:@"GET"];
      if (!v79[5])
      {
        v46 = PKLogFacilityTypeGetObject(0xEuLL);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v46, OS_LOG_TYPE_DEFAULT, "Error: Could not generate requirements request", buf, 2u);
        }
      }
    }
    else
    {
      if (![(PKPaymentCredential *)v39 isPeerPaymentCredential])
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Unknown PKPaymentCredential type."];
        goto LABEL_35;
      }
      v60 = [(PKPaymentCredential *)self->_paymentCredential peerPaymentCredential];
      v51 = [v60 passDetailsResponse];
      contextb = [v51 remoteCredential];

      v85[0] = @"devices";
      v85[1] = v16;
      v85[2] = @"cards";
      v52 = [contextb identifier];
      v85[3] = v52;
      v85[4] = @"provisioningRequirements";
      v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:5];
      uint64_t v54 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v65 endpointComponents:v53 queryParameters:0 appleAccountInformation:v17];
      v55 = (void *)v79[5];
      v79[5] = v54;

      [(id)v79[5] setHTTPMethod:@"GET"];
    }

LABEL_35:
    (*((void (**)(void *, uint64_t))v23 + 2))(v23, v79[5]);
    goto LABEL_9;
  }
  v84[0] = @"devices";
  v84[1] = v16;
  v84[2] = @"provisioningRequirements";
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:3];
  uint64_t v26 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v65 endpointComponents:v25 queryParameters:0 appleAccountInformation:v17];
  v27 = (void *)v79[5];
  v79[5] = v26;

  [(id)v79[5] setHTTPMethod:@"POST"];
  uint64_t v28 = [(id)v79[5] setValue:@"application/binary" forHTTPHeaderField:@"Content-Type"];
  referrerIdentifier = self->_referrerIdentifier;
  if (referrerIdentifier) {
    uint64_t v28 = [(id)v79[5] setValue:referrerIdentifier forHTTPHeaderField:@"x-apple-referrer-identifier"];
  }
  v30 = (void *)MEMORY[0x192FDC630](v28);
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __152__PKPaymentRequirementsRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_certChain_devSigned_deviceData_webService_completion___block_invoke_386;
  v66[3] = &unk_1E56EDCD0;
  v66[4] = self;
  v68 = &v78;
  id v67 = v23;
  [(PKPaymentRequirementsRequest *)self _encryptedDataWithDeviceData:v19 certChain:v18 devSigned:v11 includeDeviceScore:0 inWebService:v20 withCompletion:v66];

LABEL_9:

  _Block_object_dispose(&v78, 8);
}

void __152__PKPaymentRequirementsRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_certChain_devSigned_deviceData_webService_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 128);
  id v10 = v3;
  if (v5)
  {
    [v3 setValue:v5 forHTTPHeaderField:@"x-apple-referrer-identifier"];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v6 = *(void *)(v4 + 160);
  if (v6) {
    [v10 setValue:v6 forHTTPHeaderField:@"X-Apple-Ownership-Token"];
  }
  uint64_t v7 = *(void *)(a1 + 40);
  v8 = v10;
  if (v7)
  {
    uint64_t v9 = (void *)[v10 copy];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);

    v8 = v10;
  }
}

void __152__PKPaymentRequirementsRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_certChain_devSigned_deviceData_webService_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v14 = (id)[a2 mutableCopy];
  id v3 = [*(id *)(a1 + 32) phoneNumber];
  [v14 setValue:v3 forKey:@"devicePhoneNumber"];

  uint64_t v4 = [*(id *)(a1 + 32) signedPhoneNumber];
  [v14 setValue:v4 forKey:@"signedDevicePhoneNumber"];

  uint64_t v5 = [*(id *)(a1 + 32) signedPhoneNumberVersion];
  [v14 setValue:v5 forKey:@"signedDevicePhoneNumberVersion"];

  if (!*(unsigned char *)(*(void *)(a1 + 40) + 88))
  {
    uint64_t v6 = [*(id *)(a1 + 32) deviceName];
    [v14 setValue:v6 forKey:@"deviceName"];

    uint64_t v7 = [*(id *)(a1 + 32) extensiveLatitude];
    [v14 setValue:v7 forKey:@"extensiveLatitude"];

    v8 = [*(id *)(a1 + 32) extensiveLongitude];
    [v14 setValue:v8 forKey:@"extensiveLongitude"];
  }
  [v14 setValue:*(void *)(a1 + 48) forKey:@"nonce"];
  uint64_t v9 = [*(id *)(a1 + 40) _archivedDataForEncryptedDataDictionary:v14];
  if (v9) {
    [MEMORY[0x1E4F18DA0] setProperty:v9 forKey:@"overlayRequest" inRequest:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  }
  id v10 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  BOOL v11 = objc_opt_class();
  objc_super v12 = (void *)[v14 copy];
  BOOL v13 = [v11 _HTTPBodyWithDictionary:v12];
  [v10 setHTTPBody:v13];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __152__PKPaymentRequirementsRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_certChain_devSigned_deviceData_webService_completion___block_invoke_386(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v7 = [v3 _archivedDataForEncryptedDataDictionary:v4];
  if (v7) {
    [MEMORY[0x1E4F18DA0] setProperty:v7 forKey:@"overlayRequest" inRequest:*(void *)(*(void *)(a1[6] + 8) + 40)];
  }
  uint64_t v5 = *(void **)(*(void *)(a1[6] + 8) + 40);
  uint64_t v6 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v4];

  [v5 setHTTPBody:v6];
  (*(void (**)(void))(a1[5] + 16))();
}

- (void)_encryptedDataWithDeviceData:(id)a3 certChain:(id)a4 devSigned:(BOOL)a5 includeDeviceScore:(BOOL)a6 inWebService:(id)a7 withCompletion:(id)a8
{
  BOOL v10 = a6;
  id v14 = a4;
  id v15 = a8;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __128__PKPaymentRequirementsRequest__encryptedDataWithDeviceData_certChain_devSigned_includeDeviceScore_inWebService_withCompletion___block_invoke;
  v18[3] = &unk_1E56EDCF8;
  v18[4] = self;
  id v19 = v14;
  BOOL v21 = a5;
  id v20 = v15;
  id v16 = v15;
  id v17 = v14;
  [(PKPaymentRequirementsRequest *)self _cardDictionaryForDeviceData:a3 inWebService:a7 includingDeviceScore:v10 withCompletion:v18];
}

void __128__PKPaymentRequirementsRequest__encryptedDataWithDeviceData_certChain_devSigned_includeDeviceScore_inWebService_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSString;
    uint64_t v6 = [v3 allKeys];
    id v7 = [v5 stringWithFormat:@"Encrypted COF Requirements Fields: %@", v6];
    *(_DWORD *)buf = 138477827;
    v24 = v7;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
  }
  v8 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v3];
  uint64_t v9 = *(void **)(a1 + 40);
  int v10 = *(unsigned __int8 *)(a1 + 56);
  id v22 = 0;
  BOOL v11 = PKPaymentEncryptDataWithCertChain(v8, v9, v10, &v22);
  id v12 = v22;
  if (!v11)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate COF requirements request encryptedCardData. This is bad!", buf, 2u);
    }
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v13 setObject:@"EV_ECC_v1-ASN.1" forKeyedSubscript:@"encryptionVersion"];
  if (v11)
  {
    id v14 = (void *)[[NSString alloc] initWithData:v11 encoding:4];
    [v13 setObject:v14 forKeyedSubscript:@"encryptedCardData"];
  }
  if (v12)
  {
    id v15 = [v12 hexEncoding];
    [v13 setObject:v15 forKeyedSubscript:@"publicKeyHash"];
  }
  id v16 = *(void **)(*(void *)(a1 + 32) + 104);
  if (v16)
  {
    int v17 = [v16 isContactlessProductCredential];
    id v18 = *(void **)(*(void *)(a1 + 32) + 104);
    if (v17)
    {
      id v19 = [v18 contactlessProductCredential];
    }
    else
    {
      if (!v18 || ![v18 isDigitalIssuanceProductCredential]) {
        goto LABEL_20;
      }
      id v19 = [*(id *)(*(void *)(a1 + 32) + 104) digitalIssuanceProductCredential];
    }
    id v20 = v19;
    BOOL v21 = [v19 productIdentifier];

    if (v21) {
      [v13 setObject:v21 forKeyedSubscript:@"productIdentifier"];
    }
  }
LABEL_20:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_cardDictionaryForDeviceData:(id)a3 inWebService:(id)a4 includingDeviceScore:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  id v13 = [(PKPaymentRequirementsRequest *)self _cardDictionary];
  id v14 = [v12 primaryJSBLSequenceCounter];

  id v15 = [v14 stringValue];

  if (v15)
  {
    id v16 = [v15 dataUsingEncoding:4];
    int v17 = [v16 hexEncoding];
    [v13 setObject:v17 forKeyedSubscript:@"jsblSequenceCounter"];
  }
  if (v7)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __110__PKPaymentRequirementsRequest__cardDictionaryForDeviceData_inWebService_includingDeviceScore_withCompletion___block_invoke;
    v18[3] = &unk_1E56EDD20;
    id v19 = v13;
    id v20 = v11;
    [(PKPaymentRequirementsRequest *)self _deviceScoreUsingWebService:v10 withCompletion:v18];
  }
  else
  {
    (*((void (**)(id, void *))v11 + 2))(v11, v13);
  }
}

uint64_t __110__PKPaymentRequirementsRequest__cardDictionaryForDeviceData_inWebService_includingDeviceScore_withCompletion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:@"deviceScore"];
    if (a3) {
      uint64_t v5 = @"2";
    }
    else {
      uint64_t v5 = @"1";
    }
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"deviceScoreVersion"];
  }
  uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v6();
}

- (void)_deviceScoreUsingWebService:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (+[PKDeviceScorer deviceScoringSupported]
      && [(PKPaymentCredential *)self->_paymentCredential couldSupportSuperEasyProvisioning])
    {
      v8 = [PKODIServiceProviderAssessment alloc];
      uint64_t v9 = *MEMORY[0x1E4F5CB48];
      id v10 = PKPassKitCoreBundle();
      id v11 = [(PKODIServiceProviderAssessment *)v8 initWithServiceProviderIdentifier:v9 locationBundle:v10];

      [(PKODIAssessment *)v11 startAssessment];
      [(PKODIAssessment *)v11 computeAssessment];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __75__PKPaymentRequirementsRequest__deviceScoreUsingWebService_withCompletion___block_invoke;
      v12[3] = &unk_1E56EDD48;
      id v13 = v7;
      [(PKODIAssessment *)v11 waitForAssessmentWithTimeout:1 startTimeoutFromAssessmentStart:0 continueBlock:v12];
    }
    else
    {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

uint64_t __75__PKPaymentRequirementsRequest__deviceScoreUsingWebService_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateContextUsingWebService:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (!+[PKDeviceScorer deviceScoringSupported]
    || ([(PKPaymentRequirementsRequest *)self cryptogram], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0)
    && (uint64_t v9 = (void *)v8,
        [(PKPaymentRequirementsRequest *)self challengeResponse],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    if (v7) {
      v7[2](v7);
    }
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Fetching local crypto and challenge for request", buf, 2u);
    }

    if (PKRunningInPassd()) {
      [v6 targetDevice];
    }
    else {
    id v12 = +[PKPaymentWebServiceTargetDevice localTargetDevice];
    }
    if (v12)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __73__PKPaymentRequirementsRequest__updateContextUsingWebService_completion___block_invoke;
      v13[3] = &unk_1E56D8658;
      v13[4] = self;
      id v14 = v7;
      [v12 paymentWebService:v6 setNewAuthRandomIfNecessaryReturningPairingState:v13];
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Error: No targetDevice to configure context with", buf, 2u);
      }

      if (v7) {
        v7[2](v7);
      }
    }
  }
}

void __73__PKPaymentRequirementsRequest__updateContextUsingWebService_completion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if ((a2 & 1) == 0)
  {
    uint64_t v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Cannot fetch local crypto and challenge for request", v11, 2u);
    }
  }
  [*(id *)(a1 + 32) setCryptogram:v7];
  [*(id *)(a1 + 32) setChallengeResponse:v8];
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
}

- (id)_archivedDataForEncryptedDataDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PKPaymentWebServiceRequest);
  [(PKOverlayableWebServiceRequest *)v4 setRequiresConfigurationForRedirect:1];
  [(PKOverlayableWebServiceRequest *)v4 setOverlayParameters:v3];

  [(PKOverlayableWebServiceRequest *)v4 _setOverriddenKeys:&unk_1EE22B120];
  uint64_t v5 = [(PKOverlayableWebServiceRequest *)v4 archivedData];

  return v5;
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (PKPaymentCredential)paymentCredential
{
  return self->_paymentCredential;
}

- (void)setPaymentCredential:(id)a3
{
}

- (NSString)cardholderName
{
  return self->_cardholderName;
}

- (void)setCardholderName:(id)a3
{
}

- (NSString)primaryAccountNumber
{
  return self->_primaryAccountNumber;
}

- (void)setPrimaryAccountNumber:(id)a3
{
}

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (void)setReferrerIdentifier:(id)a3
{
}

- (PKDSPContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSData)cryptogram
{
  return self->_cryptogram;
}

- (void)setCryptogram:(id)a3
{
}

- (NSData)challengeResponse
{
  return self->_challengeResponse;
}

- (void)setChallengeResponse:(id)a3
{
}

- (BOOL)sendReducedDeviceData
{
  return self->_sendReducedDeviceData;
}

- (void)setSendReducedDeviceData:(BOOL)a3
{
  self->_sendReducedDeviceData = a3;
}

- (NSString)passOwnershipToken
{
  return self->_passOwnershipToken;
}

- (void)setPassOwnershipToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passOwnershipToken, 0);
  objc_storeStrong((id *)&self->_challengeResponse, 0);
  objc_storeStrong((id *)&self->_cryptogram, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryAccountNumber, 0);
  objc_storeStrong((id *)&self->_cardholderName, 0);
  objc_storeStrong((id *)&self->_paymentCredential, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end