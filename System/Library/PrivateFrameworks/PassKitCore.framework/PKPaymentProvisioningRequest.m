@interface PKPaymentProvisioningRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)disableDeviceScore;
- (BOOL)includeExternalDestinationDevices;
- (BOOL)isDeviceProvisioningDataExpected;
- (BOOL)removeFromSourceDevice;
- (BOOL)sendReducedDeviceData;
- (NSArray)authorizationKeyAttestation;
- (NSArray)externalDestinationDevices;
- (NSArray)isoDeviceEncryptionAttestation;
- (NSArray)transactionKeyCertificateChain;
- (NSArray)transactionKeys;
- (NSData)activationData;
- (NSData)challengeResponse;
- (NSData)cryptogram;
- (NSData)fidoAttestation;
- (NSData)fidoKey;
- (NSData)fidoSignedChallenge;
- (NSData)isoDeviceEncryptionAuthorization;
- (NSData)longTermPrivacyKey;
- (NSData)progenitorKeyCASDAttestation;
- (NSData)seBlobDeviceEncryptionCertificate;
- (NSData)serverAttestedProvisioningData;
- (NSData)transactionKey;
- (NSData)transactionKeyAttestation;
- (NSData)transactionKeyAuthorization;
- (NSData)transactionKeySignature;
- (NSMapTable)auxiliaryCapabilities;
- (NSString)applicationIdentifier;
- (NSString)cardSecurityCode;
- (NSString)cardholderName;
- (NSString)identityAccountKeyIdentifier;
- (NSString)nonce;
- (NSString)odiAssessment;
- (NSString)referrerIdentifier;
- (NSString)subCredentialIdentifier;
- (NSString)transferFromDevice;
- (PKDSPContext)context;
- (PKPaymentEligibilityResponse)eligibilityResponse;
- (PKPaymentProvisioningRequest)init;
- (PKPaymentProvisioningRequest)initWithCoder:(id)a3;
- (PKPaymentProvisioningRequest)initWithEligibilityResponse:(id)a3;
- (PKPaymentProvisioningRequest)initWithEligibilityResponse:(id)a3 addRequestConfiguration:(id)a4 addRequest:(id)a5;
- (PKPaymentProvisioningRequest)initWithEligibilityResponse:(id)a3 style:(int64_t)a4;
- (id)_secureParameters;
- (int64_t)style;
- (void)_deviceScoreWithCompletion:(id)a3;
- (void)_encryptSecureDictionary:(id)a3 intoDictionary:(id)a4;
- (void)_requestBodyWithWebService:(id)a3 completion:(id)a4;
- (void)_updateContextUsingWebService:(id)a3 completion:(id)a4;
- (void)_updateRequestForRedirect:(id)a3 overrides:(id)a4 webService:(id)a5 withCompletion:(id)a6;
- (void)_updateRequestForRetry:(id)a3 retryFields:(id)a4 webService:(id)a5 withCompletion:(id)a6;
- (void)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5 certChain:(id)a6 devSigned:(BOOL)a7 deviceData:(id)a8 webService:(id)a9 completion:(id)a10;
- (void)encodeWithCoder:(id)a3;
- (void)setActivationData:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setAuthorizationKeyAttestation:(id)a3;
- (void)setAuxiliaryCapabilities:(id)a3;
- (void)setCardSecurityCode:(id)a3;
- (void)setCardholderName:(id)a3;
- (void)setChallengeResponse:(id)a3;
- (void)setContext:(id)a3;
- (void)setCryptogram:(id)a3;
- (void)setDisableDeviceScore:(BOOL)a3;
- (void)setEligibilityResponse:(id)a3;
- (void)setExternalDestinationDevices:(id)a3;
- (void)setFidoAttestation:(id)a3;
- (void)setFidoKey:(id)a3;
- (void)setFidoSignedChallenge:(id)a3;
- (void)setIdentityAccountKeyIdentifier:(id)a3;
- (void)setIncludeExternalDestinationDevices:(BOOL)a3;
- (void)setIsoDeviceEncryptionAttestation:(id)a3;
- (void)setIsoDeviceEncryptionAuthorization:(id)a3;
- (void)setLongTermPrivacyKey:(id)a3;
- (void)setNonce:(id)a3;
- (void)setOdiAssessment:(id)a3;
- (void)setProgenitorKeyCASDAttestation:(id)a3;
- (void)setReferrerIdentifier:(id)a3;
- (void)setRemoveFromSourceDevice:(BOOL)a3;
- (void)setSeBlobDeviceEncryptionCertificate:(id)a3;
- (void)setSendReducedDeviceData:(BOOL)a3;
- (void)setServerAttestedProvisioningData:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSubCredentialIdentifier:(id)a3;
- (void)setTransactionKey:(id)a3;
- (void)setTransactionKeyAttestation:(id)a3;
- (void)setTransactionKeyAuthorization:(id)a3;
- (void)setTransactionKeyCertificateChain:(id)a3;
- (void)setTransactionKeySignature:(id)a3;
- (void)setTransactionKeys:(id)a3;
- (void)setTransferFromDevice:(id)a3;
@end

@implementation PKPaymentProvisioningRequest

- (PKPaymentProvisioningRequest)init
{
  return [(PKPaymentProvisioningRequest *)self initWithEligibilityResponse:0];
}

- (PKPaymentProvisioningRequest)initWithEligibilityResponse:(id)a3
{
  return [(PKPaymentProvisioningRequest *)self initWithEligibilityResponse:a3 style:0];
}

- (PKPaymentProvisioningRequest)initWithEligibilityResponse:(id)a3 style:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentProvisioningRequest;
  v8 = [(PKOverlayableWebServiceRequest *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_style = a4;
    objc_storeStrong((id *)&v8->_eligibilityResponse, a3);
  }

  return v9;
}

- (PKPaymentProvisioningRequest)initWithEligibilityResponse:(id)a3 addRequestConfiguration:(id)a4 addRequest:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = [a4 style];
  if (v10 <= 1) {
    self = [(PKPaymentProvisioningRequest *)self initWithEligibilityResponse:v8 style:v10];
  }
  if (self)
  {
    objc_super v11 = [v9 activationData];
    [(PKPaymentProvisioningRequest *)self setActivationData:v11];
  }
  return self;
}

- (PKPaymentProvisioningRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v90.receiver = self;
  v90.super_class = (Class)PKPaymentProvisioningRequest;
  v5 = [(PKOverlayableWebServiceRequest *)&v90 initWithCoder:v4];
  if (v5)
  {
    v5->_style = [v4 decodeIntegerForKey:@"style"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eligibilityResponse"];
    eligibilityResponse = v5->_eligibilityResponse;
    v5->_eligibilityResponse = (PKPaymentEligibilityResponse *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nonce"];
    nonce = v5->_nonce;
    v5->_nonce = (NSString *)v8;

    unint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardholderName"];
    uint64_t v11 = objc_msgSend(v10, "pk_zString");
    cardholderName = v5->_cardholderName;
    v5->_cardholderName = (NSString *)v11;

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardSecurityCode"];
    uint64_t v14 = objc_msgSend(v13, "pk_zString");
    cardSecurityCode = v5->_cardSecurityCode;
    v5->_cardSecurityCode = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activationData"];
    activationData = v5->_activationData;
    v5->_activationData = (NSData *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
    context = v5->_context;
    v5->_context = (PKDSPContext *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cryptogram"];
    cryptogram = v5->_cryptogram;
    v5->_cryptogram = (NSData *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"challengeResponse"];
    challengeResponse = v5->_challengeResponse;
    v5->_challengeResponse = (NSData *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referrerIdentifier"];
    referrerIdentifier = v5->_referrerIdentifier;
    v5->_referrerIdentifier = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryJSBLSequenceCounter"];
    primaryJSBLSequenceCounter = v5->_primaryJSBLSequenceCounter;
    v5->_primaryJSBLSequenceCounter = (NSNumber *)v26;

    uint64_t v28 = [v4 decodePropertyListForKey:@"certChain"];
    certChain = v5->_certChain;
    v5->_certChain = (NSArray *)v28;

    v5->_devSigned = [v4 decodeBoolForKey:@"devSigned"];
    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceData"];
    deviceData = v5->_deviceData;
    v5->_deviceData = (PKPaymentDeviceMetadata *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"odiAssessment"];
    odiAssessment = v5->_odiAssessment;
    v5->_odiAssessment = (NSString *)v32;

    v34 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v35 = objc_opt_class();
    v36 = objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"externalDestinationDevices"];
    externalDestinationDevices = v5->_externalDestinationDevices;
    v5->_externalDestinationDevices = (NSArray *)v37;

    v5->_includeExternalDestinationDevices = [v4 decodeBoolForKey:@"includeExternalDestinationDevices"];
    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferFromDevice"];
    transferFromDevice = v5->_transferFromDevice;
    v5->_transferFromDevice = (NSString *)v39;

    v5->_removeFromSourceDevice = [v4 decodeBoolForKey:@"removeFromSourceDevice"];
    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationIdentifier"];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v41;

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fidoAttestation"];
    fidoAttestation = v5->_fidoAttestation;
    v5->_fidoAttestation = (NSData *)v43;

    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fidoKey"];
    fidoKey = v5->_fidoKey;
    v5->_fidoKey = (NSData *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fidoSignedChallenge"];
    fidoSignedChallenge = v5->_fidoSignedChallenge;
    v5->_fidoSignedChallenge = (NSData *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seBlobDeviceEncryptionCertificate"];
    seBlobDeviceEncryptionCertificate = v5->_seBlobDeviceEncryptionCertificate;
    v5->_seBlobDeviceEncryptionCertificate = (NSData *)v49;

    v51 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v52 = objc_opt_class();
    v53 = objc_msgSend(v51, "setWithObjects:", v52, objc_opt_class(), 0);
    uint64_t v54 = [v4 decodeObjectOfClasses:v53 forKey:@"transactionKeyCertificateChain"];
    transactionKeyCertificateChain = v5->_transactionKeyCertificateChain;
    v5->_transactionKeyCertificateChain = (NSArray *)v54;

    uint64_t v56 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"longTermPrivacyKey"];
    longTermPrivacyKey = v5->_longTermPrivacyKey;
    v5->_longTermPrivacyKey = (NSData *)v56;

    uint64_t v58 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionKey"];
    transactionKey = v5->_transactionKey;
    v5->_transactionKey = (NSData *)v58;

    v60 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v61 = objc_opt_class();
    v62 = objc_msgSend(v60, "setWithObjects:", v61, objc_opt_class(), 0);
    uint64_t v63 = [v4 decodeObjectOfClasses:v62 forKey:@"isoDeviceEncryptionAttestation"];
    isoDeviceEncryptionAttestation = v5->_isoDeviceEncryptionAttestation;
    v5->_isoDeviceEncryptionAttestation = (NSArray *)v63;

    uint64_t v65 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isoDeviceEncryptionAuthorization"];
    isoDeviceEncryptionAuthorization = v5->_isoDeviceEncryptionAuthorization;
    v5->_isoDeviceEncryptionAuthorization = (NSData *)v65;

    uint64_t v67 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subCredentialIdentifier"];
    subCredentialIdentifier = v5->_subCredentialIdentifier;
    v5->_subCredentialIdentifier = (NSString *)v67;

    v69 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v70 = objc_opt_class();
    v71 = objc_msgSend(v69, "setWithObjects:", v70, objc_opt_class(), 0);
    uint64_t v72 = [v4 decodeObjectOfClasses:v71 forKey:@"authorizationKeyAttestation"];
    authorizationKeyAttestation = v5->_authorizationKeyAttestation;
    v5->_authorizationKeyAttestation = (NSArray *)v72;

    uint64_t v74 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionKeyAttestation"];
    transactionKeyAttestation = v5->_transactionKeyAttestation;
    v5->_transactionKeyAttestation = (NSData *)v74;

    uint64_t v76 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionKeySignature"];
    transactionKeySignature = v5->_transactionKeySignature;
    v5->_transactionKeySignature = (NSData *)v76;

    uint64_t v78 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionKeyAuthorization"];
    transactionKeyAuthorization = v5->_transactionKeyAuthorization;
    v5->_transactionKeyAuthorization = (NSData *)v78;

    uint64_t v80 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"progenitorKeyAttestation"];
    progenitorKeyCASDAttestation = v5->_progenitorKeyCASDAttestation;
    v5->_progenitorKeyCASDAttestation = (NSData *)v80;

    v82 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v83 = objc_opt_class();
    v84 = objc_msgSend(v82, "setWithObjects:", v83, objc_opt_class(), 0);
    uint64_t v85 = [v4 decodeObjectOfClasses:v84 forKey:@"transactionKeyData"];
    transactionKeys = v5->_transactionKeys;
    v5->_transactionKeys = (NSArray *)v85;

    uint64_t v87 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverAttestedProvisioningData"];
    serverAttestedProvisioningData = v5->_serverAttestedProvisioningData;
    v5->_serverAttestedProvisioningData = (NSData *)v87;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentProvisioningRequest;
  id v4 = a3;
  [(PKOverlayableWebServiceRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_style, @"style", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_eligibilityResponse forKey:@"eligibilityResponse"];
  [v4 encodeObject:self->_nonce forKey:@"nonce"];
  [v4 encodeObject:self->_cardholderName forKey:@"cardholderName"];
  [v4 encodeObject:self->_cardSecurityCode forKey:@"cardSecurityCode"];
  [v4 encodeObject:self->_activationData forKey:@"activationData"];
  [v4 encodeObject:self->_context forKey:@"context"];
  [v4 encodeObject:self->_cryptogram forKey:@"cryptogram"];
  [v4 encodeObject:self->_challengeResponse forKey:@"challengeResponse"];
  [v4 encodeObject:self->_referrerIdentifier forKey:@"referrerIdentifier"];
  [v4 encodeObject:self->_primaryJSBLSequenceCounter forKey:@"primaryJSBLSequenceCounter"];
  [v4 encodeObject:self->_certChain forKey:@"certChain"];
  [v4 encodeBool:self->_devSigned forKey:@"devSigned"];
  [v4 encodeObject:self->_deviceData forKey:@"deviceData"];
  [v4 encodeObject:self->_odiAssessment forKey:@"odiAssessment"];
  [v4 encodeObject:self->_externalDestinationDevices forKey:@"externalDestinationDevices"];
  [v4 encodeBool:self->_includeExternalDestinationDevices forKey:@"includeExternalDestinationDevices"];
  [v4 encodeObject:self->_transferFromDevice forKey:@"transferFromDevice"];
  [v4 encodeBool:self->_removeFromSourceDevice forKey:@"removeFromSourceDevice"];
  [v4 encodeObject:self->_applicationIdentifier forKey:@"applicationIdentifier"];
  [v4 encodeObject:self->_fidoAttestation forKey:@"fidoAttestation"];
  [v4 encodeObject:self->_fidoKey forKey:@"fidoKey"];
  [v4 encodeObject:self->_fidoSignedChallenge forKey:@"fidoSignedChallenge"];
  [v4 encodeObject:self->_seBlobDeviceEncryptionCertificate forKey:@"seBlobDeviceEncryptionCertificate"];
  [v4 encodeObject:self->_transactionKeyCertificateChain forKey:@"transactionKeyCertificateChain"];
  [v4 encodeObject:self->_longTermPrivacyKey forKey:@"longTermPrivacyKey"];
  [v4 encodeObject:self->_transactionKey forKey:@"transactionKey"];
  [v4 encodeObject:self->_isoDeviceEncryptionAttestation forKey:@"isoDeviceEncryptionAttestation"];
  [v4 encodeObject:self->_isoDeviceEncryptionAuthorization forKey:@"isoDeviceEncryptionAuthorization"];
  [v4 encodeObject:self->_subCredentialIdentifier forKey:@"subCredentialIdentifier"];
  [v4 encodeObject:self->_authorizationKeyAttestation forKey:@"authorizationKeyAttestation"];
  [v4 encodeObject:self->_transactionKeyAttestation forKey:@"transactionKeyAttestation"];
  [v4 encodeObject:self->_transactionKeySignature forKey:@"transactionKeySignature"];
  [v4 encodeObject:self->_transactionKeyAuthorization forKey:@"transactionKeyAuthorization"];
  [v4 encodeObject:self->_progenitorKeyCASDAttestation forKey:@"progenitorKeyAttestation"];
  [v4 encodeObject:self->_transactionKeys forKey:@"transactionKeyData"];
  [v4 encodeObject:self->_serverAttestedProvisioningData forKey:@"serverAttestedProvisioningData"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isDeviceProvisioningDataExpected
{
  v3 = [(PKPaymentProvisioningRequest *)self eligibilityResponse];
  uint64_t v4 = [v3 cardType];

  if (v4 == 107 || self->_style == 1) {
    int v5 = 1;
  }
  else {
    int v5 = PKProvisioningForceAccessStyle();
  }
  unint64_t v6 = [(PKPaymentEligibilityResponse *)self->_eligibilityResponse deviceProvisioningDataExpected];
  BOOL v7 = v6 == 1 && v5 == 0;
  if (v7 || v6 == 1 && ((v5 ^ 1) & 1) == 0 && self->_sendReducedDeviceData) {
    return 1;
  }
  if (v6) {
    return 0;
  }
  return v5 ^ 1;
}

- (void)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5 certChain:(id)a6 devSigned:(BOOL)a7 deviceData:(id)a8 webService:(id)a9 completion:(id)a10
{
  v41[5] = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  id v17 = a8;
  id v35 = a9;
  id v34 = a10;
  id v18 = a6;
  id v19 = a5;
  id v20 = a3;
  v36 = v17;
  v21 = [v17 primaryJSBLSequenceCounter];
  uint64_t v22 = (NSNumber *)[v21 copy];
  primaryJSBLSequenceCounter = self->_primaryJSBLSequenceCounter;
  self->_primaryJSBLSequenceCounter = v22;

  uint64_t v24 = (NSArray *)[v18 copy];
  certChain = self->_certChain;
  self->_certChain = v24;
  uint64_t v26 = v16;

  self->_devSigned = a7;
  objc_storeStrong((id *)&self->_deviceData, a8);
  v41[0] = @"devices";
  v41[1] = v16;
  v41[2] = @"cards";
  v27 = [(PKPaymentEligibilityResponse *)self->_eligibilityResponse identifier];
  v41[3] = v27;
  v41[4] = @"enable";
  uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:5];
  v29 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v20 endpointComponents:v28 queryParameters:0 appleAccountInformation:v19];

  [v29 setHTTPMethod:@"POST"];
  [v29 setValue:@"application/binary" forHTTPHeaderField:@"Content-Type"];
  referrerIdentifier = self->_referrerIdentifier;
  if (referrerIdentifier) {
    [v29 setValue:referrerIdentifier forHTTPHeaderField:@"x-apple-referrer-identifier"];
  }
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __152__PKPaymentProvisioningRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_certChain_devSigned_deviceData_webService_completion___block_invoke;
  v37[3] = &unk_1E56EDDC0;
  v37[4] = self;
  id v38 = v29;
  id v39 = v35;
  id v40 = v34;
  id v31 = v34;
  id v32 = v35;
  id v33 = v29;
  [(PKPaymentProvisioningRequest *)self _requestBodyWithWebService:v32 completion:v37];
}

void __152__PKPaymentProvisioningRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_certChain_devSigned_deviceData_webService_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setOverlayParameters:v4];
  [*(id *)(a1 + 32) setRequiresConfigurationForRetry:1];
  int v5 = [*(id *)(a1 + 32) archivedData];
  if (v5) {
    [MEMORY[0x1E4F18DA0] setProperty:v5 forKey:@"overlayRequest" inRequest:*(void *)(a1 + 40)];
  }
  unint64_t v6 = *(void **)(a1 + 40);
  BOOL v7 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v4];

  [v6 setHTTPBody:v7];
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __152__PKPaymentProvisioningRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_certChain_devSigned_deviceData_webService_completion___block_invoke_2;
  v11[3] = &unk_1E56EDD70;
  uint64_t v10 = *(void *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  [v8 _signRequest:v9 webService:v10 completion:v11];
}

void __152__PKPaymentProvisioningRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_certChain_devSigned_deviceData_webService_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (id)[a2 copy];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)_updateRequestForRetry:(id)a3 retryFields:(id)a4 webService:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = [a4 PKStringForKey:@"nonce"];
  if (v13)
  {
    objc_storeStrong((id *)&self->_nonce, v13);
  }
  else
  {
    uint64_t v14 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Error: Retry response data did not contain nonce", buf, 2u);
    }
  }
  [(PKPaymentProvisioningRequest *)self setCryptogram:0];
  [(PKPaymentProvisioningRequest *)self setChallengeResponse:0];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __93__PKPaymentProvisioningRequest__updateRequestForRetry_retryFields_webService_withCompletion___block_invoke;
  v18[3] = &unk_1E56EDDC0;
  id v19 = v10;
  id v20 = self;
  id v21 = v11;
  id v22 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [(PKPaymentProvisioningRequest *)self _requestBodyWithWebService:v16 completion:v18];
}

void __93__PKPaymentProvisioningRequest__updateRequestForRetry_retryFields_webService_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v4];

  [v3 setHTTPBody:v5];
  uint64_t v7 = *(void *)(a1 + 32);
  unint64_t v6 = *(void **)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__PKPaymentProvisioningRequest__updateRequestForRetry_retryFields_webService_withCompletion___block_invoke_2;
  v9[3] = &unk_1E56EDD70;
  uint64_t v8 = *(void *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  [v6 _signRequest:v7 webService:v8 completion:v9];
}

uint64_t __93__PKPaymentProvisioningRequest__updateRequestForRetry_retryFields_webService_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_updateRequestForRedirect:(id)a3 overrides:(id)a4 webService:(id)a5 withCompletion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __94__PKPaymentProvisioningRequest__updateRequestForRedirect_overrides_webService_withCompletion___block_invoke;
  v15[3] = &unk_1E56EDD98;
  v15[4] = self;
  id v16 = v10;
  id v17 = v11;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentProvisioningRequest;
  id v12 = v11;
  id v13 = v10;
  [(PKOverlayableWebServiceRequest *)&v14 _updateRequestForRedirect:a3 overrides:a4 webService:v13 withCompletion:v15];
}

void __94__PKPaymentProvisioningRequest__updateRequestForRedirect_overrides_webService_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __94__PKPaymentProvisioningRequest__updateRequestForRedirect_overrides_webService_withCompletion___block_invoke_2;
  v5[3] = &unk_1E56EDD70;
  id v6 = *(id *)(a1 + 48);
  [v3 _signRequest:a2 webService:v4 completion:v5];
}

uint64_t __94__PKPaymentProvisioningRequest__updateRequestForRedirect_overrides_webService_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_requestBodyWithWebService:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__PKPaymentProvisioningRequest__requestBodyWithWebService_completion___block_invoke;
  v8[3] = &unk_1E56D8A18;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(PKPaymentProvisioningRequest *)self _updateContextUsingWebService:a3 completion:v8];
}

void __70__PKPaymentProvisioningRequest__requestBodyWithWebService_completion___block_invoke(uint64_t a1)
{
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = __Block_byref_object_copy__53;
  uint64_t v41 = __Block_byref_object_dispose__53;
  id v42 = [MEMORY[0x1E4F1CA60] dictionary];
  [*(id *)(a1 + 32) _applyOverlayToDictionary:v38[5]];
  uint64_t v2 = (void *)v38[5];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 136) termsID];
  [v2 setValue:v3 forKey:@"termsID"];

  int v4 = [*(id *)(a1 + 32) isDeviceProvisioningDataExpected];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v4)
  {
    id v6 = (void *)v38[5];
    id v7 = [*(id *)(v5 + 112) phoneNumber];
    [v6 setValue:v7 forKey:@"devicePhoneNumber"];

    uint64_t v8 = (void *)v38[5];
    id v9 = [*(id *)(*(void *)(a1 + 32) + 112) signedPhoneNumber];
    [v8 setValue:v9 forKey:@"signedDevicePhoneNumber"];

    id v10 = (void *)v38[5];
    id v11 = [*(id *)(*(void *)(a1 + 32) + 112) signedPhoneNumberVersion];
    [v10 setValue:v11 forKey:@"signedDevicePhoneNumberVersion"];

    uint64_t v5 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v5 + 121))
    {
      id v12 = (void *)v38[5];
      id v13 = [*(id *)(v5 + 112) deviceName];
      [v12 setValue:v13 forKey:@"deviceName"];

      objc_super v14 = (void *)v38[5];
      id v15 = [*(id *)(*(void *)(a1 + 32) + 112) extensiveLatitude];
      [v14 setValue:v15 forKey:@"extensiveLatitude"];

      id v16 = (void *)v38[5];
      id v17 = [*(id *)(*(void *)(a1 + 32) + 112) extensiveLongitude];
      [v16 setValue:v17 forKey:@"extensiveLongitude"];

      uint64_t v5 = *(void *)(a1 + 32);
    }
  }
  uint64_t v18 = *(void *)(v5 + 152);
  if (v18)
  {
    [(id)v38[5] setValue:v18 forKey:@"nonce"];
    uint64_t v5 = *(void *)(a1 + 32);
  }
  id v19 = *(void **)(v5 + 176);
  if (v19)
  {
    id v20 = (void *)v38[5];
    id v21 = [v19 base64EncodedStringWithOptions:0];
    [v20 setValue:v21 forKey:@"activationData"];

    uint64_t v5 = *(void *)(a1 + 32);
  }
  id v22 = *(void **)(v5 + 280);
  if (v22)
  {
    v23 = (void *)v38[5];
    uint64_t v24 = [v22 base64EncodedStringWithOptions:0];
    [v23 setObject:v24 forKey:@"longTermPrivacyKey"];

    uint64_t v5 = *(void *)(a1 + 32);
  }
  [(id)v38[5] setObject:*(void *)(v5 + 224) forKeyedSubscript:@"transferFromDevice"];
  uint64_t v25 = MEMORY[0x1E4F1CC38];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 123)) {
    uint64_t v26 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v26 = 0;
  }
  [(id)v38[5] setObject:v26 forKeyedSubscript:@"removeFromSourceDevice"];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 122)) {
    uint64_t v27 = v25;
  }
  else {
    uint64_t v27 = 0;
  }
  [(id)v38[5] setObject:v27 forKeyedSubscript:@"includeExternalDestinationDevices"];
  uint64_t v28 = [*(id *)(a1 + 32) _secureParameters];
  v29 = v28;
  uint64_t v30 = *(void **)(a1 + 32);
  uint64_t v31 = v30[16];
  if (v31)
  {
    if (v31 == 1)
    {
      [*(id *)(a1 + 32) _encryptSecureDictionary:v28 intoDictionary:v38[5]];
      uint64_t v32 = *(void *)(a1 + 40);
      if (v32) {
        (*(void (**)(uint64_t, uint64_t))(v32 + 16))(v32, v38[5]);
      }
    }
  }
  else
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __70__PKPaymentProvisioningRequest__requestBodyWithWebService_completion___block_invoke_2;
    v33[3] = &unk_1E56EDDE8;
    v33[4] = v30;
    id v34 = v28;
    v36 = &v37;
    id v35 = *(id *)(a1 + 40);
    [v30 _deviceScoreWithCompletion:v33];
  }
  _Block_object_dispose(&v37, 8);
}

void __70__PKPaymentProvisioningRequest__requestBodyWithWebService_completion___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v20 = a2;
  uint64_t v5 = (void *)MEMORY[0x192FDC630]();
  id v6 = [*(id *)(a1 + 32) overlayParameters];
  id v7 = [v6 objectForKey:@"cardSecurityCode"];

  uint64_t v8 = [*(id *)(a1 + 32) secureOverlayParameters];
  id v9 = [v8 objectForKey:@"cardSecurityCode"];

  uint64_t v10 = *(void *)(a1 + 32);
  if (*(void *)(v10 + 168))
  {
    BOOL v11 = !*(void *)(v10 + 176) && v7 == 0;
    if (v11 && v9 == 0) {
      objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:");
    }
  }
  if (v20)
  {
    [*(id *)(a1 + 40) setObject:v20 forKeyedSubscript:@"deviceScore"];
    if (a3) {
      id v13 = @"2";
    }
    else {
      id v13 = @"1";
    }
    [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:@"deviceScoreVersion"];
  }
  objc_super v14 = *(id **)(a1 + 32);
  if (v14[11])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    objc_super v14 = *(id **)(a1 + 32);
    if (isKindOfClass)
    {
      id v16 = [v14[11] stringValue];
      id v17 = [v16 dataUsingEncoding:4];
      uint64_t v18 = [v17 hexEncoding];
      [*(id *)(a1 + 40) setObject:v18 forKeyedSubscript:@"jsblSequenceCounter"];

      objc_super v14 = *(id **)(a1 + 32);
    }
  }
  [v14 _encryptSecureDictionary:*(void *)(a1 + 40) intoDictionary:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  uint64_t v19 = *(void *)(a1 + 48);
  if (v19) {
    (*(void (**)(uint64_t, void))(v19 + 16))(v19, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  }
}

- (void)_encryptSecureDictionary:(id)a3 intoDictionary:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(PKOverlayableWebServiceRequest *)self _applySecureOverlayToDictionary:v6];
  if ([v6 count])
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = NSString;
      uint64_t v10 = [v6 allKeys];
      BOOL v11 = [v9 stringWithFormat:@"Encrypted Provisioning Fields: %@", v10];
      *(_DWORD *)buf = 138477827;
      id v20 = v11;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
    }
    id v12 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v6];
    certChain = self->_certChain;
    BOOL devSigned = self->_devSigned;
    id v18 = 0;
    id v15 = PKPaymentEncryptDataWithCertChain(v12, certChain, devSigned, &v18);
    id v16 = v18;

    if (!v15)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate provisioning request encryptedCardData. This is bad!", buf, 2u);
      }
      goto LABEL_10;
    }
    if (v16)
    {
      uint64_t v8 = [[NSString alloc] initWithData:v15 encoding:4];
      [v7 setValue:@"EV_ECC_v1-ASN.1" forKey:@"encryptionVersion"];
      [v7 setValue:v8 forKey:@"encryptedCardData"];
      id v17 = [v16 hexEncoding];
      [v7 setValue:v17 forKey:@"publicKeyHash"];

LABEL_10:
    }
  }
  else
  {
    id v15 = 0;
  }
}

- (id)_secureParameters
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v4 = v3;
  externalDestinationDevices = self->_externalDestinationDevices;
  if (externalDestinationDevices) {
    [v3 setObject:externalDestinationDevices forKeyedSubscript:@"externalDestinationDevices"];
  }
  applicationIdentifier = self->_applicationIdentifier;
  if (applicationIdentifier) {
    [v4 setObject:applicationIdentifier forKey:@"applicationIdentifier"];
  }
  fidoAttestation = self->_fidoAttestation;
  if (fidoAttestation)
  {
    uint64_t v8 = [(NSData *)fidoAttestation base64EncodedStringWithOptions:0];
    [v4 setObject:v8 forKey:@"fidoAttestation"];
  }
  fidoKey = self->_fidoKey;
  if (fidoKey)
  {
    uint64_t v10 = [(NSData *)fidoKey base64EncodedStringWithOptions:0];
    [v4 setObject:v10 forKey:@"fidoKey"];
  }
  fidoSignedChallenge = self->_fidoSignedChallenge;
  if (fidoSignedChallenge)
  {
    id v12 = [(NSData *)fidoSignedChallenge base64EncodedStringWithOptions:0];
    [v4 setObject:v12 forKey:@"fidoSignedChallenge"];
  }
  seBlobDeviceEncryptionCertificate = self->_seBlobDeviceEncryptionCertificate;
  if (seBlobDeviceEncryptionCertificate)
  {
    objc_super v14 = [(NSData *)seBlobDeviceEncryptionCertificate base64EncodedStringWithOptions:0];
    [v4 setObject:v14 forKey:@"seBlobDeviceEncryptionCertificate"];
  }
  transactionKeyCertificateChain = self->_transactionKeyCertificateChain;
  if (transactionKeyCertificateChain)
  {
    id v16 = [(NSArray *)transactionKeyCertificateChain pk_arrayByApplyingBlock:&__block_literal_global_155];
    [v4 setObject:v16 forKey:@"transactionKeyCertificateChain"];
  }
  transactionKey = self->_transactionKey;
  if (transactionKey)
  {
    id v18 = [(NSData *)transactionKey base64EncodedStringWithOptions:0];
    [v4 setObject:v18 forKey:@"transactionKey"];
  }
  isoDeviceEncryptionAttestation = self->_isoDeviceEncryptionAttestation;
  if (isoDeviceEncryptionAttestation) {
    [v4 setObject:isoDeviceEncryptionAttestation forKey:@"isoDeviceEncryptionAttestation"];
  }
  isoDeviceEncryptionAuthorization = self->_isoDeviceEncryptionAuthorization;
  if (isoDeviceEncryptionAuthorization)
  {
    uint64_t v21 = [(NSData *)isoDeviceEncryptionAuthorization base64EncodedStringWithOptions:0];
    [v4 setObject:v21 forKey:@"isoDeviceEncryptionAuthorization"];
  }
  subCredentialIdentifier = self->_subCredentialIdentifier;
  if (subCredentialIdentifier) {
    [v4 setObject:subCredentialIdentifier forKey:@"subCredentialIdentifier"];
  }
  authorizationKeyAttestation = self->_authorizationKeyAttestation;
  if (authorizationKeyAttestation) {
    [v4 setObject:authorizationKeyAttestation forKey:@"authorizationKeyAttestation"];
  }
  transactionKeyAttestation = self->_transactionKeyAttestation;
  if (transactionKeyAttestation)
  {
    uint64_t v25 = [(NSData *)transactionKeyAttestation base64EncodedStringWithOptions:0];
    [v4 setObject:v25 forKey:@"transactionKeyAttestation"];
  }
  transactionKeySignature = self->_transactionKeySignature;
  if (transactionKeySignature)
  {
    uint64_t v27 = [(NSData *)transactionKeySignature base64EncodedStringWithOptions:0];
    [v4 setObject:v27 forKey:@"transactionKeySignature"];
  }
  transactionKeyAuthorization = self->_transactionKeyAuthorization;
  if (transactionKeyAuthorization)
  {
    v29 = [(NSData *)transactionKeyAuthorization base64EncodedStringWithOptions:0];
    [v4 setObject:v29 forKey:@"transactionKeyAuthorization"];
  }
  progenitorKeyCASDAttestation = self->_progenitorKeyCASDAttestation;
  if (progenitorKeyCASDAttestation)
  {
    uint64_t v31 = [(NSData *)progenitorKeyCASDAttestation base64EncodedStringWithOptions:0];
    [v4 setObject:v31 forKey:@"progenitorKeyAttestation"];
  }
  transactionKeys = self->_transactionKeys;
  if (transactionKeys)
  {
    id v33 = [(NSArray *)transactionKeys pk_arrayByApplyingBlock:&__block_literal_global_871_0];
    [v4 setObject:v33 forKey:@"transactionKeyData"];
  }
  serverAttestedProvisioningData = self->_serverAttestedProvisioningData;
  if (serverAttestedProvisioningData)
  {
    id v35 = [(NSData *)serverAttestedProvisioningData base64EncodedStringWithOptions:0];
    [v4 setObject:v35 forKey:@"serverAttestedProvisioningData"];
  }
  if (self->_auxiliaryCapabilities)
  {
    uint64_t v54 = v4;
    id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v38 = [(NSMapTable *)self->_auxiliaryCapabilities keyEnumerator];
    uint64_t v39 = [v38 nextObject];
    if (v39)
    {
      id v40 = (void *)v39;
      while (1)
      {
        uint64_t v41 = [(NSMapTable *)self->_auxiliaryCapabilities objectForKey:v40];
        uint64_t v42 = [v40 role];
        uint64_t v43 = v36;
        if (v42 == 1) {
          goto LABEL_43;
        }
        if (v42 == 2) {
          break;
        }
LABEL_45:

        uint64_t v50 = [v38 nextObject];

        id v40 = (void *)v50;
        if (!v50) {
          goto LABEL_46;
        }
      }
      uint64_t v43 = v37;
LABEL_43:
      id v44 = v43;
      if (v44)
      {
        uint64_t v45 = v44;
        v46 = [v41 dictionaryRepresentation];
        uint64_t v47 = (void *)[v46 mutableCopy];

        v48 = [v40 dictionaryRepresentation];
        [v47 setObject:v48 forKeyedSubscript:@"requirement"];

        uint64_t v49 = (void *)[v47 copy];
        [v45 addObject:v49];
      }
      goto LABEL_45;
    }
LABEL_46:
    int v4 = v54;
    if ([v36 count])
    {
      v51 = (void *)[v36 copy];
      [v54 setObject:v51 forKey:@"deviceDecryptions"];
    }
    if ([v37 count])
    {
      uint64_t v52 = (void *)[v37 copy];
      [v54 setObject:v52 forKey:@"deviceSignatures"];
    }
  }
  return v4;
}

uint64_t __49__PKPaymentProvisioningRequest__secureParameters__block_invoke(uint64_t a1, void *a2)
{
  return [a2 base64EncodedStringWithOptions:0];
}

id __49__PKPaymentProvisioningRequest__secureParameters__block_invoke_2(uint64_t a1, void *a2)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"transactionKeyAttestation";
  id v2 = a2;
  id v3 = [v2 casdAttestation];
  int v4 = [v3 base64EncodedStringWithOptions:0];
  v9[1] = @"transactionKeyAuthorization";
  v10[0] = v4;
  uint64_t v5 = [v2 authorization];

  id v6 = [v5 base64EncodedStringWithOptions:0];
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (void)_deviceScoreWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    if (+[PKDeviceScorer deviceScoringSupported]
      && [(PKPaymentProvisioningRequest *)self isDeviceProvisioningDataExpected]
      && !self->_disableDeviceScore)
    {
      uint64_t v5 = (void (*)(void))*((void *)v6 + 2);
    }
    else
    {
      uint64_t v5 = (void (*)(void))*((void *)v6 + 2);
    }
    v5();
    id v4 = v6;
  }
}

- (void)_updateContextUsingWebService:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (!+[PKDeviceScorer deviceScoringSupported]
    || ([(PKPaymentProvisioningRequest *)self cryptogram], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0)
    && (id v9 = (void *)v8,
        [(PKPaymentProvisioningRequest *)self challengeResponse],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
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
    BOOL v11 = PKLogFacilityTypeGetObject(6uLL);
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
      v13[2] = __73__PKPaymentProvisioningRequest__updateContextUsingWebService_completion___block_invoke;
      v13[3] = &unk_1E56D8658;
      v13[4] = self;
      objc_super v14 = v7;
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

void __73__PKPaymentProvisioningRequest__updateContextUsingWebService_completion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if ((a2 & 1) == 0)
  {
    id v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v11 = 0;
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

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (PKPaymentEligibilityResponse)eligibilityResponse
{
  return self->_eligibilityResponse;
}

- (void)setEligibilityResponse:(id)a3
{
}

- (BOOL)disableDeviceScore
{
  return self->_disableDeviceScore;
}

- (void)setDisableDeviceScore:(BOOL)a3
{
  self->_disableDeviceScore = a3;
}

- (BOOL)sendReducedDeviceData
{
  return self->_sendReducedDeviceData;
}

- (void)setSendReducedDeviceData:(BOOL)a3
{
  self->_sendReducedDeviceData = a3;
}

- (NSString)odiAssessment
{
  return self->_odiAssessment;
}

- (void)setOdiAssessment:(id)a3
{
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (NSString)cardholderName
{
  return self->_cardholderName;
}

- (void)setCardholderName:(id)a3
{
}

- (NSString)cardSecurityCode
{
  return self->_cardSecurityCode;
}

- (void)setCardSecurityCode:(id)a3
{
}

- (NSData)activationData
{
  return self->_activationData;
}

- (void)setActivationData:(id)a3
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

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (void)setReferrerIdentifier:(id)a3
{
}

- (BOOL)includeExternalDestinationDevices
{
  return self->_includeExternalDestinationDevices;
}

- (void)setIncludeExternalDestinationDevices:(BOOL)a3
{
  self->_includeExternalDestinationDevices = a3;
}

- (NSArray)externalDestinationDevices
{
  return self->_externalDestinationDevices;
}

- (void)setExternalDestinationDevices:(id)a3
{
}

- (NSString)transferFromDevice
{
  return self->_transferFromDevice;
}

- (void)setTransferFromDevice:(id)a3
{
}

- (BOOL)removeFromSourceDevice
{
  return self->_removeFromSourceDevice;
}

- (void)setRemoveFromSourceDevice:(BOOL)a3
{
  self->_removeFromSourceDevice = a3;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSData)fidoAttestation
{
  return self->_fidoAttestation;
}

- (void)setFidoAttestation:(id)a3
{
}

- (NSData)fidoKey
{
  return self->_fidoKey;
}

- (void)setFidoKey:(id)a3
{
}

- (NSData)fidoSignedChallenge
{
  return self->_fidoSignedChallenge;
}

- (void)setFidoSignedChallenge:(id)a3
{
}

- (NSData)seBlobDeviceEncryptionCertificate
{
  return self->_seBlobDeviceEncryptionCertificate;
}

- (void)setSeBlobDeviceEncryptionCertificate:(id)a3
{
}

- (NSArray)transactionKeyCertificateChain
{
  return self->_transactionKeyCertificateChain;
}

- (void)setTransactionKeyCertificateChain:(id)a3
{
}

- (NSData)longTermPrivacyKey
{
  return self->_longTermPrivacyKey;
}

- (void)setLongTermPrivacyKey:(id)a3
{
}

- (NSData)transactionKey
{
  return self->_transactionKey;
}

- (void)setTransactionKey:(id)a3
{
}

- (NSArray)isoDeviceEncryptionAttestation
{
  return self->_isoDeviceEncryptionAttestation;
}

- (void)setIsoDeviceEncryptionAttestation:(id)a3
{
}

- (NSData)isoDeviceEncryptionAuthorization
{
  return self->_isoDeviceEncryptionAuthorization;
}

- (void)setIsoDeviceEncryptionAuthorization:(id)a3
{
}

- (NSString)subCredentialIdentifier
{
  return self->_subCredentialIdentifier;
}

- (void)setSubCredentialIdentifier:(id)a3
{
}

- (NSString)identityAccountKeyIdentifier
{
  return self->_identityAccountKeyIdentifier;
}

- (void)setIdentityAccountKeyIdentifier:(id)a3
{
}

- (NSArray)authorizationKeyAttestation
{
  return self->_authorizationKeyAttestation;
}

- (void)setAuthorizationKeyAttestation:(id)a3
{
}

- (NSData)transactionKeyAttestation
{
  return self->_transactionKeyAttestation;
}

- (void)setTransactionKeyAttestation:(id)a3
{
}

- (NSData)transactionKeySignature
{
  return self->_transactionKeySignature;
}

- (void)setTransactionKeySignature:(id)a3
{
}

- (NSData)transactionKeyAuthorization
{
  return self->_transactionKeyAuthorization;
}

- (void)setTransactionKeyAuthorization:(id)a3
{
}

- (NSData)progenitorKeyCASDAttestation
{
  return self->_progenitorKeyCASDAttestation;
}

- (void)setProgenitorKeyCASDAttestation:(id)a3
{
}

- (NSArray)transactionKeys
{
  return self->_transactionKeys;
}

- (void)setTransactionKeys:(id)a3
{
}

- (NSData)serverAttestedProvisioningData
{
  return self->_serverAttestedProvisioningData;
}

- (void)setServerAttestedProvisioningData:(id)a3
{
}

- (NSMapTable)auxiliaryCapabilities
{
  return self->_auxiliaryCapabilities;
}

- (void)setAuxiliaryCapabilities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryCapabilities, 0);
  objc_storeStrong((id *)&self->_serverAttestedProvisioningData, 0);
  objc_storeStrong((id *)&self->_transactionKeys, 0);
  objc_storeStrong((id *)&self->_progenitorKeyCASDAttestation, 0);
  objc_storeStrong((id *)&self->_transactionKeyAuthorization, 0);
  objc_storeStrong((id *)&self->_transactionKeySignature, 0);
  objc_storeStrong((id *)&self->_transactionKeyAttestation, 0);
  objc_storeStrong((id *)&self->_authorizationKeyAttestation, 0);
  objc_storeStrong((id *)&self->_identityAccountKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_subCredentialIdentifier, 0);
  objc_storeStrong((id *)&self->_isoDeviceEncryptionAuthorization, 0);
  objc_storeStrong((id *)&self->_isoDeviceEncryptionAttestation, 0);
  objc_storeStrong((id *)&self->_transactionKey, 0);
  objc_storeStrong((id *)&self->_longTermPrivacyKey, 0);
  objc_storeStrong((id *)&self->_transactionKeyCertificateChain, 0);
  objc_storeStrong((id *)&self->_seBlobDeviceEncryptionCertificate, 0);
  objc_storeStrong((id *)&self->_fidoSignedChallenge, 0);
  objc_storeStrong((id *)&self->_fidoKey, 0);
  objc_storeStrong((id *)&self->_fidoAttestation, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_transferFromDevice, 0);
  objc_storeStrong((id *)&self->_externalDestinationDevices, 0);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
  objc_storeStrong((id *)&self->_challengeResponse, 0);
  objc_storeStrong((id *)&self->_cryptogram, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_activationData, 0);
  objc_storeStrong((id *)&self->_cardSecurityCode, 0);
  objc_storeStrong((id *)&self->_cardholderName, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_odiAssessment, 0);
  objc_storeStrong((id *)&self->_eligibilityResponse, 0);
  objc_storeStrong((id *)&self->_deviceData, 0);
  objc_storeStrong((id *)&self->_certChain, 0);
  objc_storeStrong((id *)&self->_primaryJSBLSequenceCounter, 0);
}

@end