@interface PKPaymentEligibilityRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)requiresNonce;
- (NSData)FPInfo;
- (NSData)encryptedCardData;
- (NSData)ephemeralPublicKey;
- (NSData)publicKeyHash;
- (NSData)wrappedKey;
- (NSString)cardholderName;
- (NSString)encryptionVersion;
- (NSString)expiration;
- (NSString)hostApplicationIdentifier;
- (NSString)hostApplicationVersion;
- (NSString)issuerIdentifier;
- (NSString)nonce;
- (NSString)odiAssessment;
- (NSString)odiAssessmentVersion;
- (NSString)passOwnershipToken;
- (NSString)primaryAccountNumber;
- (NSString)productIdentifier;
- (NSString)referrerIdentifier;
- (NSString)region;
- (PKAddPaymentPassRequestConfiguration)addPaymentPassRequestConfiguration;
- (PKEncryptedPushProvisioningTarget)encryptedProvisioningTarget;
- (PKPaymentCredential)paymentCredential;
- (PKPaymentEligibilityRequest)init;
- (PKPaymentEligibilityRequest)initWithAddRequestConfiguration:(id)a3 addRequest:(id)a4;
- (PKPaymentEligibilityRequest)initWithCoder:(id)a3;
- (PKPaymentEligibilityRequest)initWithPaymentCredential:(id)a3;
- (PKPaymentEligibilityRequest)initWithSource:(int64_t)a3;
- (PKPaymentTapToProvisionData)tapToProvisionData;
- (int64_t)cardholderNameInputMethod;
- (int64_t)expirationInputMethod;
- (int64_t)primaryAccountNumberInputMethod;
- (int64_t)source;
- (unint64_t)_requestHTTPMethod;
- (void)_updateRequestForRedirect:(id)a3 overrides:(id)a4 webService:(id)a5 withCompletion:(id)a6;
- (void)_updateRequestForRetry:(id)a3 retryFields:(id)a4 webService:(id)a5 withCompletion:(id)a6;
- (void)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5 certChain:(id)a6 devSigned:(BOOL)a7 deviceData:(id)a8 webService:(id)a9 completion:(id)a10;
- (void)encodeWithCoder:(id)a3;
- (void)setCardholderName:(id)a3;
- (void)setCardholderNameInputMethod:(int64_t)a3;
- (void)setEncryptedCardData:(id)a3;
- (void)setEncryptedProvisioningTarget:(id)a3;
- (void)setEncryptionVersion:(id)a3;
- (void)setEphemeralPublicKey:(id)a3;
- (void)setExpiration:(id)a3;
- (void)setExpirationInputMethod:(int64_t)a3;
- (void)setFPInfo:(id)a3;
- (void)setHostApplicationIdentifier:(id)a3;
- (void)setHostApplicationVersion:(id)a3;
- (void)setIssuerIdentifier:(id)a3;
- (void)setNonce:(id)a3;
- (void)setOdiAssessment:(id)a3;
- (void)setOdiAssessmentVersion:(id)a3;
- (void)setPassOwnershipToken:(id)a3;
- (void)setPaymentCredential:(id)a3;
- (void)setPrimaryAccountNumber:(id)a3;
- (void)setPrimaryAccountNumberInputMethod:(int64_t)a3;
- (void)setProductIdentifier:(id)a3;
- (void)setPublicKeyHash:(id)a3;
- (void)setReferrerIdentifier:(id)a3;
- (void)setRegion:(id)a3;
- (void)setTapToProvisionData:(id)a3;
- (void)setWrappedKey:(id)a3;
@end

@implementation PKPaymentEligibilityRequest

- (PKPaymentEligibilityRequest)init
{
  return [(PKPaymentEligibilityRequest *)self initWithSource:1];
}

- (PKPaymentEligibilityRequest)initWithSource:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentEligibilityRequest;
  result = [(PKOverlayableWebServiceRequest *)&v5 init];
  if (result) {
    result->_source = a3;
  }
  return result;
}

- (PKPaymentEligibilityRequest)initWithPaymentCredential:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(PKPaymentEligibilityRequest *)self init];
  v6 = v5;
  if (v5)
  {
    [(PKPaymentEligibilityRequest *)v5 setPaymentCredential:v4];
    v7 = [v4 state];
    v8 = [v7 requirementsResponse];

    if (v8)
    {
      uint64_t v9 = [v8 region];
      region = v6->_region;
      v6->_region = (NSString *)v9;
    }
    else
    {
      region = [v4 underlyingPaymentPass];
      uint64_t v11 = [region passTypeIdentifier];
      v12 = v6->_region;
      v6->_region = (NSString *)v11;
    }
  }

  return v6;
}

- (PKPaymentEligibilityRequest)initWithAddRequestConfiguration:(id)a3 addRequest:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(PKPaymentEligibilityRequest *)self initWithSource:2];
  if (v9)
  {
    v10 = [v8 encryptionVersion];
    [(PKPaymentEligibilityRequest *)v9 setEncryptionVersion:v10];

    uint64_t v11 = [v8 encryptedPassData];
    [(PKPaymentEligibilityRequest *)v9 setEncryptedCardData:v11];

    v12 = [v8 publicKeyHash];
    [(PKPaymentEligibilityRequest *)v9 setPublicKeyHash:v12];

    v13 = [v8 ephemeralPublicKey];
    [(PKPaymentEligibilityRequest *)v9 setEphemeralPublicKey:v13];

    v14 = [v8 wrappedKey];
    [(PKPaymentEligibilityRequest *)v9 setWrappedKey:v14];

    v15 = [v8 issuerIdentifier];
    [(PKPaymentEligibilityRequest *)v9 setIssuerIdentifier:v15];

    v16 = [v8 hostApplicationIdentifier];
    [(PKPaymentEligibilityRequest *)v9 setHostApplicationIdentifier:v16];

    v17 = [v8 hostApplicationVersion];
    [(PKPaymentEligibilityRequest *)v9 setHostApplicationVersion:v17];

    v18 = [v8 FPInfo];
    [(PKPaymentEligibilityRequest *)v9 setFPInfo:v18];

    v19 = [v8 nonce];
    v20 = [v19 hexEncoding];
    [(PKPaymentEligibilityRequest *)v9 setNonce:v20];

    objc_storeStrong((id *)&v9->_addPaymentPassRequestConfiguration, a3);
  }

  return v9;
}

- (PKPaymentEligibilityRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PKPaymentEligibilityRequest;
  objc_super v5 = [(PKOverlayableWebServiceRequest *)&v50 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PKPaymentCredential"];
    paymentCredential = v5->_paymentCredential;
    v5->_paymentCredential = (PKPaymentCredential *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productIdentifier"];
    productIdentifier = v5->_productIdentifier;
    v5->_productIdentifier = (NSString *)v8;

    v5->_cardholderNameInputMethod = [v4 decodeIntegerForKey:@"cardholderNameInputMethod"];
    v5->_primaryAccountNumberInputMethod = [v4 decodeIntegerForKey:@"primaryAccountNumberInputMethod"];
    v5->_expirationInputMethod = [v4 decodeIntegerForKey:@"expirationInputMethod"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"issuerIdentifier"];
    issuerIdentifier = v5->_issuerIdentifier;
    v5->_issuerIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hostApplicationIdentifier"];
    hostApplicationIdentifier = v5->_hostApplicationIdentifier;
    v5->_hostApplicationIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hostApplicationVersion"];
    hostApplicationVersion = v5->_hostApplicationVersion;
    v5->_hostApplicationVersion = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FPInfo"];
    FPInfo = v5->_FPInfo;
    v5->_FPInfo = (NSData *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptionVersion"];
    encryptionVersion = v5->_encryptionVersion;
    v5->_encryptionVersion = (NSString *)v18;

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardholderName"];
    uint64_t v21 = objc_msgSend(v20, "pk_zString");
    cardholderName = v5->_cardholderName;
    v5->_cardholderName = (NSString *)v21;

    v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryAccountNumber"];
    uint64_t v24 = objc_msgSend(v23, "pk_zString");
    primaryAccountNumber = v5->_primaryAccountNumber;
    v5->_primaryAccountNumber = (NSString *)v24;

    v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expiration"];
    uint64_t v27 = objc_msgSend(v26, "pk_zString");
    expiration = v5->_expiration;
    v5->_expiration = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptedCardData"];
    encryptedCardData = v5->_encryptedCardData;
    v5->_encryptedCardData = (NSData *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKeyHash"];
    publicKeyHash = v5->_publicKeyHash;
    v5->_publicKeyHash = (NSData *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ephemeralPublicKey"];
    ephemeralPublicKey = v5->_ephemeralPublicKey;
    v5->_ephemeralPublicKey = (NSData *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wrappedKey"];
    wrappedKey = v5->_wrappedKey;
    v5->_wrappedKey = (NSData *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nonce"];
    nonce = v5->_nonce;
    v5->_nonce = (NSString *)v37;

    v5->_source = [v4 decodeIntegerForKey:@"source"];
    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referrerIdentifier"];
    referrerIdentifier = v5->_referrerIdentifier;
    v5->_referrerIdentifier = (NSString *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"addPaymentPassRequestConfiguration"];
    addPaymentPassRequestConfiguration = v5->_addPaymentPassRequestConfiguration;
    v5->_addPaymentPassRequestConfiguration = (PKAddPaymentPassRequestConfiguration *)v41;

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tapToProvisionData"];
    tapToProvisionData = v5->_tapToProvisionData;
    v5->_tapToProvisionData = (PKPaymentTapToProvisionData *)v43;

    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"odiAssessment"];
    odiAssessment = v5->_odiAssessment;
    v5->_odiAssessment = (NSString *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"odiAssessmentVersion"];
    odiAssessmentVersion = v5->_odiAssessmentVersion;
    v5->_odiAssessmentVersion = (NSString *)v47;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentEligibilityRequest;
  id v4 = a3;
  [(PKOverlayableWebServiceRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_paymentCredential, @"paymentCredential", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_productIdentifier forKey:@"productIdentifier"];
  [v4 encodeInteger:self->_cardholderNameInputMethod forKey:@"cardholderNameInputMethod"];
  [v4 encodeInteger:self->_primaryAccountNumberInputMethod forKey:@"primaryAccountNumberInputMethod"];
  [v4 encodeInteger:self->_expirationInputMethod forKey:@"expirationInputMethod"];
  [v4 encodeObject:self->_issuerIdentifier forKey:@"issuerIdentifier"];
  [v4 encodeObject:self->_hostApplicationIdentifier forKey:@"hostApplicationIdentifier"];
  [v4 encodeObject:self->_hostApplicationVersion forKey:@"hostApplicationVersion"];
  [v4 encodeObject:self->_FPInfo forKey:@"FPInfo"];
  [v4 encodeObject:self->_encryptionVersion forKey:@"encryptionVersion"];
  [v4 encodeObject:self->_cardholderName forKey:@"cardholderName"];
  [v4 encodeObject:self->_primaryAccountNumber forKey:@"primaryAccountNumber"];
  [v4 encodeObject:self->_expiration forKey:@"expiration"];
  [v4 encodeObject:self->_encryptedCardData forKey:@"encryptedCardData"];
  [v4 encodeObject:self->_publicKeyHash forKey:@"publicKeyHash"];
  [v4 encodeObject:self->_ephemeralPublicKey forKey:@"ephemeralPublicKey"];
  [v4 encodeObject:self->_wrappedKey forKey:@"wrappedKey"];
  [v4 encodeObject:self->_nonce forKey:@"nonce"];
  [v4 encodeInteger:self->_source forKey:@"source"];
  [v4 encodeObject:self->_referrerIdentifier forKey:@"referrerIdentifier"];
  [v4 encodeObject:self->_addPaymentPassRequestConfiguration forKey:@"addPaymentPassRequestConfiguration"];
  [v4 encodeObject:self->_tapToProvisionData forKey:@"tapToProvisionData"];
  [v4 encodeObject:self->_odiAssessment forKey:@"odiAssessment"];
  [v4 encodeObject:self->_odiAssessmentVersion forKey:@"odiAssessmentVersion"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setPaymentCredential:(id)a3
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_paymentCredential, a3);
  if ([v10 isContactlessProductCredential])
  {
    int64_t v5 = 3;
LABEL_13:
    self->_source = v5;
    goto LABEL_14;
  }
  if ([v10 isIdentityCredential])
  {
    int64_t v5 = 6;
    goto LABEL_13;
  }
  if ([v10 isShareableCredential])
  {
    uint64_t v6 = [v10 shareableCredential];
    uint64_t v7 = [v6 source];

    if ((unint64_t)(v7 - 1) >= 0xB) {
      int64_t v8 = 1;
    }
    else {
      int64_t v8 = v7;
    }
    self->_source = v8;
    goto LABEL_14;
  }
  if (([v10 isDigitalIssuanceProductCredential] & 1) != 0
    || [v10 isPurchasedProductCredential])
  {
    int64_t v5 = 4;
    goto LABEL_13;
  }
  if ([v10 isSafariCredential])
  {
    int64_t v5 = 8;
    goto LABEL_13;
  }
  if (![v10 isAppleBalanceCredential])
  {
    int64_t v5 = 1;
    goto LABEL_13;
  }
  uint64_t v9 = [v10 appleBalanceCredential];
  self->_source = [v9 eligibilitySource];

LABEL_14:
}

- (unint64_t)_requestHTTPMethod
{
  paymentCredential = self->_paymentCredential;
  if (!paymentCredential) {
    return 2;
  }
  if ([(PKPaymentCredential *)paymentCredential isIdentityCredential])
  {
    id v4 = [(PKPaymentCredential *)self->_paymentCredential identityCredential];
    char v5 = [v4 hasExistingPassInformation];

    if (v5) {
      return 2;
    }
  }
  if ([(PKPaymentCredential *)self->_paymentCredential isContactlessProductCredential]
    || [(PKPaymentCredential *)self->_paymentCredential isDigitalIssuanceProductCredential]|| [(PKPaymentCredential *)self->_paymentCredential isPurchasedProductCredential]|| [(PKPaymentCredential *)self->_paymentCredential isShareableCredential]|| [(PKPaymentCredential *)self->_paymentCredential isSafariCredential]|| [(PKPaymentCredential *)self->_paymentCredential isAppleBalanceCredential]|| [(PKPaymentCredential *)self->_paymentCredential isIdentityCredential])
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)requiresNonce
{
  return [(PKPaymentEligibilityRequest *)self _requestHTTPMethod] == 2;
}

- (void)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5 certChain:(id)a6 devSigned:(BOOL)a7 deviceData:(id)a8 webService:(id)a9 completion:(id)a10
{
  BOOL v143 = a7;
  v159[5] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v145 = a9;
  id v20 = a10;
  v146 = v19;
  if ([(PKPaymentEligibilityRequest *)self _requestHTTPMethod] != 1)
  {
    v151[0] = @"devices";
    v151[1] = v16;
    id v140 = v16;
    v151[2] = @"cards";
    v137 = [MEMORY[0x1E4F1C978] arrayWithObjects:v151 count:3];
    uint64_t v29 = -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v15);
    [v29 setHTTPMethod:@"POST"];
    [v29 setValue:@"application/binary" forHTTPHeaderField:@"Content-Type"];
    referrerIdentifier = self->_referrerIdentifier;
    if (referrerIdentifier) {
      [v29 setValue:referrerIdentifier forHTTPHeaderField:@"x-apple-referrer-identifier"];
    }
    encryptedCardData = self->_encryptedCardData;
    id v141 = v15;
    v138 = v20;
    id v139 = v17;
    if (encryptedCardData)
    {
      v32 = [(NSData *)encryptedCardData base64EncodedDataWithOptions:0];
      v144 = 0;
      id v33 = 0;
LABEL_67:
      id v87 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v88 = [NSNumber numberWithInteger:self->_source];
      [v87 setObject:v88 forKeyedSubscript:@"source"];

      if (v32)
      {
        v89 = (void *)[[NSString alloc] initWithData:v32 encoding:4];
        [v87 setObject:v89 forKeyedSubscript:@"encryptedCardData"];
        if (self->_encryptionVersion) {
          encryptionVersion = (__CFString *)self->_encryptionVersion;
        }
        else {
          encryptionVersion = @"EV_ECC_v1-ASN.1";
        }
        [v87 setObject:encryptionVersion forKeyedSubscript:@"encryptionVersion"];
      }
      productIdentifier = self->_productIdentifier;
      if (productIdentifier) {
        [v87 setObject:productIdentifier forKeyedSubscript:@"productIdentifier"];
      }
      switch(self->_primaryAccountNumberInputMethod)
      {
        case 0:
          goto LABEL_80;
        case 1:
          v92 = @"manual";
          goto LABEL_79;
        case 2:
          v92 = @"camera";
          goto LABEL_79;
        case 3:
          v92 = @"tapToProvision";
          goto LABEL_79;
        default:
          v92 = @"unknown";
LABEL_79:
          [v87 setObject:v92 forKeyedSubscript:@"panInputMethod"];
LABEL_80:
          switch(self->_expirationInputMethod)
          {
            case 0:
              goto LABEL_86;
            case 1:
              v93 = @"manual";
              goto LABEL_85;
            case 2:
              v93 = @"camera";
              goto LABEL_85;
            case 3:
              v93 = @"tapToProvision";
              goto LABEL_85;
            default:
              v93 = @"unknown";
LABEL_85:
              [v87 setObject:v93 forKeyedSubscript:@"expirationInputMethod"];
LABEL_86:
              switch(self->_cardholderNameInputMethod)
              {
                case 0:
                  goto LABEL_92;
                case 1:
                  v94 = @"manual";
                  goto LABEL_91;
                case 2:
                  v94 = @"camera";
                  goto LABEL_91;
                case 3:
                  v94 = @"tapToProvision";
                  goto LABEL_91;
                default:
                  v94 = @"unknown";
LABEL_91:
                  [v87 setObject:v94 forKeyedSubscript:@"nameInputMethod"];
LABEL_92:
                  uint64_t v37 = v18;
                  issuerIdentifier = self->_issuerIdentifier;
                  if (issuerIdentifier) {
                    [v87 setObject:issuerIdentifier forKeyedSubscript:@"issuerIdentifier"];
                  }
                  v96 = [(PKPaymentTapToProvisionData *)self->_tapToProvisionData dictionaryRepresentation];
                  [v87 setObject:v96 forKeyedSubscript:@"tapToProvisionCardData"];

                  if (self->_hostApplicationIdentifier || self->_hostApplicationVersion)
                  {
                    v97 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
                    v98 = v97;
                    hostApplicationIdentifier = self->_hostApplicationIdentifier;
                    if (hostApplicationIdentifier) {
                      [v97 setObject:hostApplicationIdentifier forKeyedSubscript:@"identifier"];
                    }
                    hostApplicationVersion = self->_hostApplicationVersion;
                    if (hostApplicationVersion) {
                      [v98 setObject:hostApplicationVersion forKeyedSubscript:@"version"];
                    }
                    [v87 setObject:v98 forKeyedSubscript:@"hostApplication"];
                  }
                  FPInfo = self->_FPInfo;
                  if (FPInfo)
                  {
                    v102 = [(NSData *)FPInfo base64EncodedStringWithOptions:0];
                    [v87 setObject:v102 forKeyedSubscript:@"fpai"];
                  }
                  ephemeralPublicKey = self->_ephemeralPublicKey;
                  if (ephemeralPublicKey)
                  {
                    v104 = [(NSData *)ephemeralPublicKey base64EncodedStringWithOptions:0];
                    [v87 setObject:v104 forKeyedSubscript:@"ephemeralPublicKey"];
                  }
                  wrappedKey = self->_wrappedKey;
                  if (wrappedKey)
                  {
                    v106 = [(NSData *)wrappedKey base64EncodedStringWithOptions:0];
                    [v87 setObject:v106 forKeyedSubscript:@"wrappedKey"];
                  }
                  publicKeyHash = self->_publicKeyHash;
                  if ((unint64_t)publicKeyHash | (unint64_t)v33)
                  {
                    if (publicKeyHash) {
                      v108 = self->_publicKeyHash;
                    }
                    else {
                      v108 = (NSData *)v33;
                    }
                    v109 = [(NSData *)v108 hexEncoding];
                    [v87 setObject:v109 forKeyedSubscript:@"publicKeyHash"];
                  }
                  nonce = self->_nonce;
                  if (nonce) {
                    [v87 setValue:nonce forKey:@"nonce"];
                  }
                  paymentCredential = self->_paymentCredential;
                  if (!paymentCredential) {
                    goto LABEL_128;
                  }
                  BOOL v112 = [(PKPaymentCredential *)paymentCredential isShareableCredential];
                  v113 = self->_paymentCredential;
                  if (v112)
                  {
                    v114 = [(PKPaymentCredential *)v113 shareableCredential];
                    v115 = [v114 encryptedProvisioningTarget];

                    if (v115)
                    {
                      v116 = [v114 encryptedProvisioningTarget];
                      v117 = [v116 asWebServiceDictionary];
                      [v87 addEntriesFromDictionary:v117];
                    }
                    else
                    {
                      v116 = [v114 sharingInstanceIdentifier];
                      [v87 setObject:v116 forKeyedSubscript:@"sharingInstanceIdentifier"];
                    }

                    v122 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v114, "isBackgroundProvisioning"));
                    [v87 setObject:v122 forKeyedSubscript:@"backgroundProvisioning"];

                    if ((self->_source | 4) == 5)
                    {
                      v123 = PKPairedOrPairingDevice();
                      v124 = PKSerialNumberFromNRDevice(v123);

                      if (v124)
                      {
                        v150 = v124;
                        v125 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v150 count:1];
                        [v87 setObject:v125 forKeyedSubscript:@"companionDeviceSerialNumbers"];
                      }
                    }
                  }
                  else
                  {
                    if (![(PKPaymentCredential *)v113 isIdentityCredential]) {
                      goto LABEL_128;
                    }
                    v114 = [(PKPaymentCredential *)self->_paymentCredential identityCredential];
                    encryptedProvisioningTarget = self->_encryptedProvisioningTarget;
                    if (encryptedProvisioningTarget)
                    {
                      v119 = [(PKEncryptedPushProvisioningTarget *)encryptedProvisioningTarget asWebServiceDictionary];
                      [v87 addEntriesFromDictionary:v119];
                    }
                    v120 = [v114 passSerialNumber];
                    [v87 setObject:v120 forKeyedSubscript:@"passSerial"];

                    v121 = [v114 passTypeIdentifier];
                    [v87 setObject:v121 forKeyedSubscript:@"passTypeIdentifier"];

                    [v87 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"backgroundProvisioning"];
                  }

LABEL_128:
                  [(PKOverlayableWebServiceRequest *)self _applyOverlayToDictionary:v87];
                  [(PKOverlayableWebServiceRequest *)self setOverlayParameters:v87];
                  [(PKOverlayableWebServiceRequest *)self _setOverriddenKeys:&unk_1EE22B138];
                  [(PKOverlayableWebServiceRequest *)self setRequiresConfigurationForRetry:1];
                  [(PKOverlayableWebServiceRequest *)self setRequiresConfigurationForRedirect:1];
                  v126 = [(PKOverlayableWebServiceRequest *)self archivedData];
                  if (v126) {
                    [MEMORY[0x1E4F18DA0] setProperty:v126 forKey:@"overlayRequest" inRequest:v29];
                  }
                  v127 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v87];
                  [v29 setHTTPBody:v127];

                  v147[0] = MEMORY[0x1E4F143A8];
                  v147[1] = 3221225472;
                  v147[2] = __151__PKPaymentEligibilityRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_certChain_devSigned_deviceData_webService_completion___block_invoke;
                  v147[3] = &unk_1E56EDD70;
                  id v148 = v138;
                  v38 = v145;
                  [(PKPaymentWebServiceRequest *)self _signRequest:v29 webService:v145 completion:v147];

                  id v20 = v138;
                  id v16 = v140;
                  id v15 = v141;
                  id v17 = v139;
                  break;
              }
              break;
          }
          break;
      }
      goto LABEL_131;
    }
    uint64_t v39 = self->_paymentCredential;
    if (v39)
    {
      BOOL v40 = [(PKPaymentCredential *)v39 isContactlessProductCredential];
      uint64_t v39 = self->_paymentCredential;
      if (v40)
      {
        uint64_t v41 = [(PKPaymentCredential *)v39 contactlessProductCredential];
        v42 = [v41 productIdentifier];

        if (v42)
        {
          uint64_t v43 = [v41 productIdentifier];
          v44 = self->_productIdentifier;
          self->_productIdentifier = v43;
        }
        id v45 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v46 = [v41 cardSessionToken];
        if (!v46) {
          goto LABEL_53;
        }
        uint64_t v47 = @"cardSessionToken";
        goto LABEL_52;
      }
      if (v39)
      {
        BOOL v60 = [(PKPaymentCredential *)v39 isDigitalIssuanceProductCredential];
        uint64_t v39 = self->_paymentCredential;
        if (v60)
        {
          id v142 = v18;
          v61 = [(PKPaymentCredential *)v39 digitalIssuanceProductCredential];
LABEL_43:
          v68 = v61;
          v69 = [v61 productIdentifier];

          if (v69)
          {
            v70 = [v68 productIdentifier];
            v71 = self->_productIdentifier;
            self->_productIdentifier = v70;
          }
          id v72 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v73 = [v68 purchase];
          v74 = [v73 identifier];
          v75 = [v73 partnerMetadata];
          if (v74) {
            [v72 setObject:v74 forKeyedSubscript:@"provisioningToken"];
          }
          id v45 = v72;
          if (v75) {
            [v72 setObject:v75 forKeyedSubscript:@"metadata"];
          }

          id v18 = v142;
          goto LABEL_55;
        }
        if (v39)
        {
          BOOL v67 = [(PKPaymentCredential *)v39 isPurchasedProductCredential];
          uint64_t v39 = self->_paymentCredential;
          if (v67)
          {
            id v142 = v18;
            v61 = [(PKPaymentCredential *)v39 purchasedProductCredential];
            goto LABEL_43;
          }
        }
      }
    }
    if (![(PKPaymentCredential *)v39 isSafariCredential])
    {
      v128 = self->_paymentCredential;
      if (v128)
      {
        if ([(PKPaymentCredential *)v128 isAppleBalanceCredential])
        {
          id v45 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          uint64_t v41 = [(PKPaymentCredential *)self->_paymentCredential appleBalanceCredential];
          v129 = [v41 product];
          v130 = [v129 productIdentifier];
          v131 = self->_productIdentifier;
          self->_productIdentifier = v130;

          int64_t v132 = [(PKPaymentCredential *)self->_paymentCredential credentialType];
          if (!v132) {
            goto LABEL_54;
          }
          v46 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v132);
          uint64_t v47 = @"cardTypeCode";
          goto LABEL_52;
        }
        v128 = self->_paymentCredential;
      }
      if ([(PKPaymentCredential *)v128 isShareableCredential]
        || [(PKPaymentCredential *)self->_paymentCredential isIdentityCredential])
      {
        v144 = 0;
        id v33 = 0;
        v32 = 0;
        goto LABEL_67;
      }
      id v133 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v45 = v133;
      primaryAccountNumber = self->_primaryAccountNumber;
      if (primaryAccountNumber) {
        [v133 setObject:primaryAccountNumber forKeyedSubscript:@"primaryAccountNumber"];
      }
      expiration = self->_expiration;
      if (expiration) {
        [v45 setObject:expiration forKeyedSubscript:@"expiration"];
      }
      cardholderName = self->_cardholderName;
      if (cardholderName) {
        [v45 setObject:cardholderName forKeyedSubscript:@"name"];
      }
LABEL_55:
      if (v45)
      {
        v78 = [v19 primaryJSBLSequenceCounter];
        if (v78)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v79 = [v78 stringValue];
            v80 = [v79 dataUsingEncoding:4];
            v81 = [v80 hexEncoding];
            [v45 setObject:v81 forKeyedSubscript:@"jsblSequenceCounter"];
          }
        }
        [v45 setObject:self->_odiAssessment forKeyedSubscript:@"deviceScore"];
        [v45 setObject:self->_odiAssessmentVersion forKeyedSubscript:@"deviceScoreVersion"];
        [(PKOverlayableWebServiceRequest *)self _applySecureOverlayToDictionary:v45];
        v82 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v45];
        v83 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
        {
          v84 = NSString;
          v85 = [v45 allKeys];
          id v86 = [v84 stringWithFormat:@"Encrypted Eligibility Fields: %@", v85];
          *(_DWORD *)buf = 138477827;
          id v153 = v86;
          _os_log_impl(&dword_190E10000, v83, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
        }
        id v149 = 0;
        v32 = PKPaymentEncryptDataWithCertChain(v82, v18, v143, &v149);
        id v33 = v149;
        if (!v32)
        {
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_190E10000, v83, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate eligibility request encryptedCardData. This is bad!", buf, 2u);
          }
        }
        v144 = v45;
      }
      else
      {
        v144 = 0;
        id v33 = 0;
        v32 = 0;
      }
      goto LABEL_67;
    }
    id v45 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v41 = [(PKPaymentCredential *)self->_paymentCredential safariCredential];
    v76 = [v41 cardNumber];
    [v45 setObject:v76 forKeyedSubscript:@"primaryAccountNumber"];

    v77 = [v41 expiration];
    [v45 setObject:v77 forKeyedSubscript:@"expiration"];

    v46 = [v41 cardholderName];
    uint64_t v47 = @"name";
LABEL_52:
    [v45 setObject:v46 forKeyedSubscript:v47];
LABEL_53:

LABEL_54:
    goto LABEL_55;
  }
  uint64_t v21 = self->_paymentCredential;
  if (v21)
  {
    BOOL v22 = [(PKPaymentCredential *)v21 isRemoteCredential];
    v23 = self->_paymentCredential;
    if (v22)
    {
      id v24 = v20;
      id v25 = v17;
      v26 = [(PKPaymentCredential *)v23 remoteCredential];
      v159[0] = @"devices";
      v159[1] = v16;
      v159[2] = @"cards";
      uint64_t v27 = [v26 identifier];
      v159[3] = v27;
      v159[4] = @"eligibility";
      v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v159 count:5];
      goto LABEL_24;
    }
    BOOL v48 = [(PKPaymentCredential *)v23 isAccountCredential];
    v49 = self->_paymentCredential;
    if (v48)
    {
      id v24 = v20;
      id v25 = v17;
      v26 = [(PKPaymentCredential *)v49 accountCredential];
      v158[0] = @"devices";
      v158[1] = v16;
      v158[2] = @"cards";
      uint64_t v27 = [v26 passDetailsResponse];
      objc_super v50 = [v27 provisioningIdentifier];
      v158[3] = v50;
      v158[4] = @"eligibility";
      v51 = (void *)MEMORY[0x1E4F1C978];
      v52 = v158;
    }
    else
    {
      BOOL v54 = [(PKPaymentCredential *)v49 isLocalPassCredential];
      v55 = self->_paymentCredential;
      if (v54)
      {
        id v24 = v20;
        id v25 = v17;
        v26 = [(PKPaymentCredential *)v55 localPassCredential];
        v157[0] = @"devices";
        v157[1] = v16;
        v157[2] = @"passes";
        uint64_t v27 = [v26 passTypeIdentifier];
        v157[3] = v27;
        objc_super v50 = [v26 serialNumber];
        v157[4] = v50;
        v157[5] = @"eligibility";
        v51 = (void *)MEMORY[0x1E4F1C978];
        v52 = v157;
        uint64_t v53 = 6;
        goto LABEL_23;
      }
      if (![(PKPaymentCredential *)v55 isPeerPaymentCredential]) {
        goto LABEL_36;
      }
      id v24 = v20;
      id v25 = v17;
      v26 = [(PKPaymentCredential *)self->_paymentCredential peerPaymentCredential];
      uint64_t v27 = [v26 passDetailsResponse];
      v156[0] = @"devices";
      v156[1] = v16;
      v156[2] = @"cards";
      objc_super v50 = [v27 provisioningIdentifier];
      v156[3] = v50;
      v156[4] = @"eligibility";
      v51 = (void *)MEMORY[0x1E4F1C978];
      v52 = v156;
    }
    uint64_t v53 = 5;
LABEL_23:
    v28 = [v51 arrayWithObjects:v52 count:v53];

LABEL_24:
    id v17 = v25;
    id v20 = v24;
    if (v28)
    {
      v56 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v15 endpointComponents:v28 queryParameters:0 appleAccountInformation:v17];
      [v56 setHTTPMethod:@"GET"];
      v57 = self->_referrerIdentifier;
      if (v57) {
        [v56 setValue:v57 forHTTPHeaderField:@"x-apple-referrer-identifier"];
      }
      passOwnershipToken = self->_passOwnershipToken;
      uint64_t v37 = v18;
      v38 = v145;
      if (passOwnershipToken) {
        [v56 setValue:passOwnershipToken forHTTPHeaderField:@"X-Apple-Ownership-Token"];
      }
      if (v20)
      {
        v59 = (void *)[v56 copy];
        (*((void (**)(id, void *))v20 + 2))(v20, v59);
      }
LABEL_39:

      goto LABEL_131;
    }
LABEL_36:
    v62 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      v63 = (objc_class *)objc_opt_class();
      v64 = NSStringFromClass(v63);
      v65 = (objc_class *)objc_opt_class();
      v66 = NSStringFromClass(v65);
      *(_DWORD *)buf = 138412546;
      id v153 = v64;
      __int16 v154 = 2112;
      v155 = v66;
      _os_log_impl(&dword_190E10000, v62, OS_LOG_TYPE_DEFAULT, "Error: Not able to create a %@ for credential type: %@", buf, 0x16u);
    }
    (*((void (**)(id, void))v20 + 2))(v20, 0);
    v28 = 0;
    v56 = 0;
    uint64_t v37 = v18;
    v38 = v145;
    goto LABEL_39;
  }
  v34 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v35 = (objc_class *)objc_opt_class();
    v36 = NSStringFromClass(v35);
    *(_DWORD *)buf = 138412290;
    id v153 = v36;
    _os_log_impl(&dword_190E10000, v34, OS_LOG_TYPE_DEFAULT, "Error: Not able to create a %@ with nil credential", buf, 0xCu);
  }
  (*((void (**)(id, void))v20 + 2))(v20, 0);
  uint64_t v37 = v18;
  v38 = v145;
LABEL_131:
}

void __151__PKPaymentEligibilityRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_certChain_devSigned_deviceData_webService_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = (id)[a2 copy];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)_updateRequestForRetry:(id)a3 retryFields:(id)a4 webService:(id)a5 withCompletion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = [a4 PKStringForKey:@"nonce"];
  if (v13)
  {
    objc_storeStrong((id *)&self->_nonce, v13);
    [(PKOverlayableWebServiceRequest *)self setOverlayValue:v13 forKey:@"nonce"];
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
  id v15 = objc_opt_class();
  id v16 = [(PKOverlayableWebServiceRequest *)self overlayParameters];
  id v17 = [v15 _HTTPBodyWithDictionary:v16];
  [v12 setHTTPBody:v17];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __92__PKPaymentEligibilityRequest__updateRequestForRetry_retryFields_webService_withCompletion___block_invoke;
  v19[3] = &unk_1E56EDD70;
  id v20 = v10;
  id v18 = v10;
  [(PKPaymentWebServiceRequest *)self _signRequest:v12 webService:v11 completion:v19];
}

uint64_t __92__PKPaymentEligibilityRequest__updateRequestForRetry_retryFields_webService_withCompletion___block_invoke(uint64_t a1)
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
  v15[2] = __93__PKPaymentEligibilityRequest__updateRequestForRedirect_overrides_webService_withCompletion___block_invoke;
  v15[3] = &unk_1E56EDD98;
  v15[4] = self;
  id v16 = v10;
  id v17 = v11;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentEligibilityRequest;
  id v12 = v11;
  id v13 = v10;
  [(PKOverlayableWebServiceRequest *)&v14 _updateRequestForRedirect:a3 overrides:a4 webService:v13 withCompletion:v15];
}

void __93__PKPaymentEligibilityRequest__updateRequestForRedirect_overrides_webService_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __93__PKPaymentEligibilityRequest__updateRequestForRedirect_overrides_webService_withCompletion___block_invoke_2;
  v5[3] = &unk_1E56EDD70;
  id v6 = *(id *)(a1 + 48);
  [v3 _signRequest:a2 webService:v4 completion:v5];
}

uint64_t __93__PKPaymentEligibilityRequest__updateRequestForRedirect_overrides_webService_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
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

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
}

- (int64_t)cardholderNameInputMethod
{
  return self->_cardholderNameInputMethod;
}

- (void)setCardholderNameInputMethod:(int64_t)a3
{
  self->_cardholderNameInputMethod = a3;
}

- (int64_t)primaryAccountNumberInputMethod
{
  return self->_primaryAccountNumberInputMethod;
}

- (void)setPrimaryAccountNumberInputMethod:(int64_t)a3
{
  self->_primaryAccountNumberInputMethod = a3;
}

- (int64_t)expirationInputMethod
{
  return self->_expirationInputMethod;
}

- (void)setExpirationInputMethod:(int64_t)a3
{
  self->_expirationInputMethod = a3;
}

- (NSString)issuerIdentifier
{
  return self->_issuerIdentifier;
}

- (void)setIssuerIdentifier:(id)a3
{
}

- (NSString)hostApplicationIdentifier
{
  return self->_hostApplicationIdentifier;
}

- (void)setHostApplicationIdentifier:(id)a3
{
}

- (NSString)hostApplicationVersion
{
  return self->_hostApplicationVersion;
}

- (void)setHostApplicationVersion:(id)a3
{
}

- (NSData)FPInfo
{
  return self->_FPInfo;
}

- (void)setFPInfo:(id)a3
{
}

- (NSString)encryptionVersion
{
  return self->_encryptionVersion;
}

- (void)setEncryptionVersion:(id)a3
{
}

- (PKEncryptedPushProvisioningTarget)encryptedProvisioningTarget
{
  return self->_encryptedProvisioningTarget;
}

- (void)setEncryptedProvisioningTarget:(id)a3
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

- (NSString)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
}

- (NSString)odiAssessment
{
  return self->_odiAssessment;
}

- (void)setOdiAssessment:(id)a3
{
}

- (NSString)odiAssessmentVersion
{
  return self->_odiAssessmentVersion;
}

- (void)setOdiAssessmentVersion:(id)a3
{
}

- (NSData)encryptedCardData
{
  return self->_encryptedCardData;
}

- (void)setEncryptedCardData:(id)a3
{
}

- (NSData)publicKeyHash
{
  return self->_publicKeyHash;
}

- (void)setPublicKeyHash:(id)a3
{
}

- (NSData)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (void)setEphemeralPublicKey:(id)a3
{
}

- (NSData)wrappedKey
{
  return self->_wrappedKey;
}

- (void)setWrappedKey:(id)a3
{
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (int64_t)source
{
  return self->_source;
}

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (void)setReferrerIdentifier:(id)a3
{
}

- (PKAddPaymentPassRequestConfiguration)addPaymentPassRequestConfiguration
{
  return self->_addPaymentPassRequestConfiguration;
}

- (PKPaymentTapToProvisionData)tapToProvisionData
{
  return self->_tapToProvisionData;
}

- (void)setTapToProvisionData:(id)a3
{
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
  objc_storeStrong((id *)&self->_tapToProvisionData, 0);
  objc_storeStrong((id *)&self->_addPaymentPassRequestConfiguration, 0);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_wrappedKey, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_encryptedCardData, 0);
  objc_storeStrong((id *)&self->_odiAssessmentVersion, 0);
  objc_storeStrong((id *)&self->_odiAssessment, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_primaryAccountNumber, 0);
  objc_storeStrong((id *)&self->_cardholderName, 0);
  objc_storeStrong((id *)&self->_encryptedProvisioningTarget, 0);
  objc_storeStrong((id *)&self->_encryptionVersion, 0);
  objc_storeStrong((id *)&self->_FPInfo, 0);
  objc_storeStrong((id *)&self->_hostApplicationVersion, 0);
  objc_storeStrong((id *)&self->_hostApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_issuerIdentifier, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentCredential, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end