@interface PKPeerPaymentDeviceScoreEncryptedPayloadManager
+ (id)keyForDeviceScoreEncryptedPayloadVersion:(unint64_t)a3 endpointIdentifier:(id)a4 recipientAddress:(id)a5 quoteDestinationType:(unint64_t)a6;
- (PKPeerPaymentDeviceScoreEncryptedPayloadManager)initWithEndpointIdentifier:(id)a3 recipientAddress:(id)a4 deviceScoreEncryptedPayloadVersion:(unint64_t)a5 quoteDestinationType:(unint64_t)a6;
- (id)_createContextForDeviceScorer;
- (id)_errorForUnavailableDeviceScoreWithUnderlyingError:(id)a3;
- (unint64_t)deviceScoreEncryptedPayloadVersion;
- (void)_cristalV1DeviceScoreWithKey:(id)a3 completion:(id)a4;
- (void)_setupDeviceScoreService;
- (void)deviceScoreWithCompletion:(id)a3;
- (void)provideSessionFeedbackWithIngested:(BOOL)a3;
- (void)setDeviceScoreEncryptedPayloadVersion:(unint64_t)a3;
- (void)updateAttributesWithEndpointIdentifier:(id)a3 recipientAddress:(id)a4 quoteDestinationType:(unint64_t)a5;
@end

@implementation PKPeerPaymentDeviceScoreEncryptedPayloadManager

+ (id)keyForDeviceScoreEncryptedPayloadVersion:(unint64_t)a3 endpointIdentifier:(id)a4 recipientAddress:(id)a5 quoteDestinationType:(unint64_t)a6
{
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (a3 == 1)
  {
    v12 = off_1E56EDA98[PKPeerPaymentDeviceScoreTransactionTypeForEndpointIdentifier(v9, a6)];
    if (!v11) {
      goto LABEL_11;
    }
    [NSString stringWithFormat:@"%@-%@", v12, v11];
  }
  else
  {
    if (a3)
    {
      v12 = 0;
      goto LABEL_11;
    }
    if (!v10)
    {
      v13 = (__CFString *)v9;
      goto LABEL_10;
    }
    [NSString stringWithFormat:@"%@-%@", v9, v10];
  }
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v12 = v13;
LABEL_11:

  return v12;
}

- (PKPeerPaymentDeviceScoreEncryptedPayloadManager)initWithEndpointIdentifier:(id)a3 recipientAddress:(id)a4 deviceScoreEncryptedPayloadVersion:(unint64_t)a5 quoteDestinationType:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKPeerPaymentDeviceScoreEncryptedPayloadManager;
  v13 = [(PKPeerPaymentDeviceScoreEncryptedPayloadManager *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_endpointIdentifier, a3);
    objc_storeStrong((id *)&v14->_recipientAddress, a4);
    v14->_deviceScoreEncryptedPayloadVersion = 2;
    v14->_pendingDeviceScoreEncryptedPayloadVersion = 2;
    v15 = objc_alloc_init(PKSecureElement);
    secureElement = v14->_secureElement;
    v14->_secureElement = v15;

    v14->_quoteDestinationType = a6;
    [(PKPeerPaymentDeviceScoreEncryptedPayloadManager *)v14 setDeviceScoreEncryptedPayloadVersion:a5];
    [(PKPeerPaymentDeviceScoreEncryptedPayloadManager *)v14 updateAttributesWithEndpointIdentifier:v14->_endpointIdentifier recipientAddress:v14->_recipientAddress quoteDestinationType:v14->_quoteDestinationType];
  }

  return v14;
}

- (void)updateAttributesWithEndpointIdentifier:(id)a3 recipientAddress:(id)a4 quoteDestinationType:(unint64_t)a5
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = self->_endpointIdentifier;
  id v12 = (NSString *)v9;
  v13 = v12;
  if (v11 == v12)
  {

    goto LABEL_7;
  }
  if (v12 && v11)
  {
    BOOL v14 = [(NSString *)v11 isEqualToString:v12];

    if (!v14) {
      goto LABEL_9;
    }
LABEL_7:
    BOOL v15 = 0;
    goto LABEL_10;
  }

LABEL_9:
  objc_storeStrong((id *)&self->_endpointIdentifier, a3);
  BOOL v15 = self->_deviceScoreEncryptedPayloadVersion == 0;
LABEL_10:
  p_recipientAddress = (void **)&self->_recipientAddress;
  v17 = self->_recipientAddress;
  objc_super v18 = (NSString *)v10;
  v19 = v18;
  if (v17 == v18)
  {

    goto LABEL_18;
  }
  if (!v18 || !v17)
  {

    goto LABEL_17;
  }
  BOOL v20 = [(NSString *)v17 isEqualToString:v18];

  if (!v20)
  {
LABEL_17:
    objc_storeStrong((id *)&self->_recipientAddress, a4);
    BOOL v15 = self->_deviceScoreEncryptedPayloadVersion == 0;
  }
LABEL_18:
  if (self->_quoteDestinationType == a5)
  {
    if (!v15) {
      goto LABEL_23;
    }
  }
  else
  {
    self->_quoteDestinationType = a5;
  }
  [(PKPeerPaymentDeviceScoreEncryptedPayloadManager *)self _setupDeviceScoreService];
LABEL_23:
  if (!self->_odiServiceProviderAssessment || self->_deviceScoreEncryptedPayloadVersion != 1) {
    goto LABEL_58;
  }
  id v21 = objc_alloc_init(MEMORY[0x1E4F5C978]);
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v23 = +[PKAppleAccountManager sharedInstance];
  v24 = [v23 appleAccountInformation];

  v25 = [v24 firstName];

  if (v25)
  {
    v26 = [v24 firstName];
    [v22 setObject:v26 forKey:*MEMORY[0x1E4F5CA90]];
  }
  v27 = [v24 lastName];

  if (v27)
  {
    v28 = [v24 lastName];
    [v22 setObject:v28 forKey:*MEMORY[0x1E4F5CAB0]];
  }
  if (*p_recipientAddress)
  {
    id v72 = v21;
    v29 = [PKContactResolver alloc];
    id v30 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    uint64_t v31 = *MEMORY[0x1E4F1ADE0];
    v73[0] = *MEMORY[0x1E4F1ADF0];
    v73[1] = v31;
    uint64_t v32 = *MEMORY[0x1E4F1ADC8];
    v73[2] = *MEMORY[0x1E4F1AEE0];
    v73[3] = v32;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:4];
    v34 = [(PKContactResolver *)v29 initWithContactStore:v30 keysToFetch:v33];

    v35 = [(PKContactResolver *)v34 contactForHandle:*p_recipientAddress];
    v36 = v35;
    if (v35)
    {
      v37 = [v35 givenName];

      if (v37)
      {
        v38 = [v36 givenName];
        [v22 setObject:v38 forKey:*MEMORY[0x1E4F5CA00]];
      }
      v39 = objc_msgSend(v36, "familyName", v72);

      if (v39)
      {
        v40 = [v36 familyName];
        [v22 setObject:v40 forKey:*MEMORY[0x1E4F5CA08]];
      }
    }
    BOOL v41 = PKIsEmailAddress(*p_recipientAddress);
    v42 = *p_recipientAddress;
    if (v41)
    {
      [v22 setObject:v42 forKey:*MEMORY[0x1E4F5C9F8]];
      v43 = [v36 phoneNumbers];
      uint64_t v44 = [v43 count];

      if (v44)
      {
        v45 = [v36 phoneNumbers];
        v46 = [v45 firstObject];
        v47 = [v46 value];

        v48 = [v47 stringValue];
        [v22 setObject:v48 forKey:*MEMORY[0x1E4F5CA10]];

LABEL_40:
      }
    }
    else
    {
      [v22 setObject:v42 forKey:*MEMORY[0x1E4F5CA10]];
      v49 = [v36 emailAddresses];
      uint64_t v50 = [v49 count];

      if (v50)
      {
        v51 = [v36 emailAddresses];
        v52 = [v51 firstObject];
        v47 = [v52 value];

        [v22 setObject:v47 forKey:*MEMORY[0x1E4F5C9F8]];
        goto LABEL_40;
      }
    }

    id v21 = v72;
  }
  uint64_t v53 = PKPeerPaymentDeviceScoreTransactionTypeForEndpointIdentifier(self->_endpointIdentifier, self->_quoteDestinationType);
  v54 = @"ACH";
  v55 = @"P2P Request";
  switch(v53)
  {
    case 1:
      goto LABEL_45;
    case 2:
      v55 = @"P2P Send";
LABEL_45:
      uint64_t v57 = *MEMORY[0x1E4F5CA78];
      objc_msgSend(v22, "setObject:forKey:", v55, *MEMORY[0x1E4F5CA78], v72);
      uint64_t v58 = *MEMORY[0x1E4F5CA08];
      *(void *)&long long buf = *MEMORY[0x1E4F5CA00];
      *((void *)&buf + 1) = v58;
      uint64_t v59 = *MEMORY[0x1E4F5C9F8];
      uint64_t v78 = *MEMORY[0x1E4F5CA10];
      uint64_t v79 = v59;
      uint64_t v60 = *MEMORY[0x1E4F5CAB0];
      uint64_t v80 = *MEMORY[0x1E4F5CA90];
      uint64_t v81 = v60;
      uint64_t v82 = v57;
      v61 = (void *)MEMORY[0x1E4F1C978];
      p_long long buf = (uint64_t *)&buf;
      uint64_t v63 = 7;
      goto LABEL_52;
    case 3:
      goto LABEL_51;
    case 4:
      uint64_t v64 = *MEMORY[0x1E4F5CA78];
      [v22 setObject:@"Top-up" forKey:*MEMORY[0x1E4F5CA78]];
      uint64_t v65 = *MEMORY[0x1E4F5CAB0];
      v75[0] = *MEMORY[0x1E4F5CA90];
      v75[1] = v65;
      v75[2] = v64;
      v61 = (void *)MEMORY[0x1E4F1C978];
      p_long long buf = v75;
      goto LABEL_48;
    case 5:
      v54 = @"IFO";
      goto LABEL_51;
    case 6:
      v54 = @"CIP";
LABEL_51:
      uint64_t v68 = *MEMORY[0x1E4F5CA78];
      objc_msgSend(v22, "setObject:forKey:", v54, *MEMORY[0x1E4F5CA78], v72);
      uint64_t v74 = v68;
      v61 = (void *)MEMORY[0x1E4F1C978];
      p_long long buf = &v74;
      uint64_t v63 = 1;
      goto LABEL_52;
    case 7:
      uint64_t v66 = *MEMORY[0x1E4F5CA78];
      [v22 setObject:@"Nearby Send" forKey:*MEMORY[0x1E4F5CA78]];
      uint64_t v67 = *MEMORY[0x1E4F5CAB0];
      v76[0] = *MEMORY[0x1E4F5CA90];
      v76[1] = v67;
      v76[2] = v66;
      v61 = (void *)MEMORY[0x1E4F1C978];
      p_long long buf = v76;
LABEL_48:
      uint64_t v63 = 3;
LABEL_52:
      v56 = objc_msgSend(v61, "arrayWithObjects:count:", p_buf, v63, v72);
      break;
    default:
      v56 = (void *)MEMORY[0x1E4F1CBF0];
      break;
  }
  if (objc_msgSend(v56, "count", v54, v72))
  {
    v69 = [v22 dictionaryWithValuesForKeys:v56];
    uint64_t v70 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v69];

    id v22 = (id)v70;
  }
  [v21 setAttributes:v22];
  v71 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v22;
    _os_log_impl(&dword_190E10000, v71, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentDeviceScoreEncryptedPayloadManager: Updating ODI assessment with attributes: %@", (uint8_t *)&buf, 0xCu);
  }

  [(PKODIAssessment *)self->_odiServiceProviderAssessment updateAssessment:v21];
LABEL_58:
}

- (void)deviceScoreWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_isScoringInProgress = 1;
  recipientAddress = self->_recipientAddress;
  if (recipientAddress)
  {
    v6 = [NSString stringWithFormat:@"%@-%@", self->_endpointIdentifier, recipientAddress];
  }
  else
  {
    v6 = self->_endpointIdentifier;
  }
  v7 = v6;
  if ((__CFString *)self->_endpointIdentifier == @"registration") {
    goto LABEL_7;
  }
  unint64_t deviceScoreEncryptedPayloadVersion = self->_deviceScoreEncryptedPayloadVersion;
  if (deviceScoreEncryptedPayloadVersion == 1)
  {
    id v9 = [(id)objc_opt_class() keyForDeviceScoreEncryptedPayloadVersion:self->_deviceScoreEncryptedPayloadVersion endpointIdentifier:self->_endpointIdentifier recipientAddress:self->_recipientAddress quoteDestinationType:self->_quoteDestinationType];

    id v10 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      v19 = v9;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentDeviceScoreEncryptedPayloadManager: Score: Calling computeAssessment and waitForAssessmentWithContinueBlock: for key: %@.", buf, 0xCu);
    }

    uint64_t v11 = mach_absolute_time();
    [(PKODIAssessment *)self->_odiServiceProviderAssessment computeAssessment];
    odiServiceProviderAssessment = self->_odiServiceProviderAssessment;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__PKPeerPaymentDeviceScoreEncryptedPayloadManager_deviceScoreWithCompletion___block_invoke;
    v13[3] = &unk_1E56EDA28;
    v7 = v9;
    BOOL v14 = v7;
    BOOL v15 = self;
    uint64_t v17 = v11;
    id v16 = v4;
    [(PKODIAssessment *)odiServiceProviderAssessment waitForAssessmentWithContinueBlock:v13];
  }
  else if (!deviceScoreEncryptedPayloadVersion)
  {
LABEL_7:
    [(PKPeerPaymentDeviceScoreEncryptedPayloadManager *)self _cristalV1DeviceScoreWithKey:v6 completion:v4];
  }
}

void __77__PKPeerPaymentDeviceScoreEncryptedPayloadManager_deviceScoreWithCompletion___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    v6 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = *(double *)(a1 + 32);
      int v13 = 138412290;
      double v14 = v7;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentDeviceScoreEncryptedPayloadManager: Score: waitForAssessmentWithContinueBlock: Did timeout for key: %@. Calling completion with error", (uint8_t *)&v13, 0xCu);
    }

    v8 = [*(id *)(a1 + 40) _errorForUnavailableDeviceScoreWithUnderlyingError:0];
  }
  else
  {
    v8 = 0;
  }
  uint64_t v9 = mach_absolute_time();
  double v10 = PKSecondsFromMachTimeInterval(v9 - *(void *)(a1 + 56));
  uint64_t v11 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = 134218242;
    double v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentDeviceScoreEncryptedPayloadManager: Score response took: %gs for key: %@.", (uint8_t *)&v13, 0x16u);
  }

  *(unsigned char *)(*(void *)(a1 + 40) + 8) = 0;
  [*(id *)(a1 + 40) setDeviceScoreEncryptedPayloadVersion:*(void *)(*(void *)(a1 + 40) + 16)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)provideSessionFeedbackWithIngested:(BOOL)a3
{
  odiServiceProviderAssessment = self->_odiServiceProviderAssessment;
  if (odiServiceProviderAssessment)
  {
    BOOL v5 = a3;
    if ([(PKODIAssessment *)odiServiceProviderAssessment currentAssessmentDidTimeout]) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = !v5;
    }
    double v7 = self->_odiServiceProviderAssessment;
    [(PKODIAssessment *)v7 provideSessionFeedback:v6];
  }
}

- (void)setDeviceScoreEncryptedPayloadVersion:(unint64_t)a3
{
  if (PKForcePeerPaymentDeviceScoreVersion())
  {
    uint64_t v5 = PKGetPeerPaymentDeviceScoreVersion();
    unint64_t v6 = 1;
    if (v5 != 1) {
      unint64_t v6 = 2;
    }
    if (v5) {
      a3 = v6;
    }
    else {
      a3 = 0;
    }
  }
  if (self->_deviceScoreEncryptedPayloadVersion != a3)
  {
    if (self->_isScoringInProgress)
    {
      self->_pendingDeviceScoreEncryptedPayloadVersion = a3;
    }
    else
    {
      self->_unint64_t deviceScoreEncryptedPayloadVersion = a3;
      self->_pendingDeviceScoreEncryptedPayloadVersion = a3;
      [(PKPeerPaymentDeviceScoreEncryptedPayloadManager *)self _setupDeviceScoreService];
    }
  }
}

- (void)_setupDeviceScoreService
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v3 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t deviceScoreEncryptedPayloadVersion = self->_deviceScoreEncryptedPayloadVersion;
    endpointIdentifier = self->_endpointIdentifier;
    int v39 = 134218242;
    unint64_t v40 = deviceScoreEncryptedPayloadVersion;
    __int16 v41 = 2112;
    v42 = endpointIdentifier;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentDeviceScoreEncryptedPayloadManager: Score: Calling _setupDeviceScoreService with payload version: %lu, endpointIdentifier: %@.", (uint8_t *)&v39, 0x16u);
  }

  unint64_t v6 = self->_deviceScoreEncryptedPayloadVersion;
  if (v6 == 1)
  {
    if ((__CFString *)self->_endpointIdentifier == @"registration")
    {
      odiServiceProviderAssessment = self->_odiServiceProviderAssessment;
      self->_odiServiceProviderAssessment = 0;
LABEL_38:
      uint64_t v15 = 24;
      goto LABEL_39;
    }
    odiServiceProviderAssessment = PKPassKitCoreBundle();
    unint64_t quoteDestinationType = self->_quoteDestinationType;
    uint64_t v11 = self->_endpointIdentifier;
    uint64_t v12 = @"requestToken";
    if (v12 == (__CFString *)v11)
    {
    }
    else
    {
      int v13 = v12;
      if (!v11 || !v12)
      {

LABEL_19:
        uint64_t v17 = v11;
        objc_super v18 = @"identityVerification";
        if (v18 == v17)
        {
        }
        else
        {
          v19 = v18;
          if (!v11 || !v18)
          {

LABEL_42:
            uint64_t v31 = v17;
            uint64_t v32 = @"quote";
            if (v32 == v31) {
              goto LABEL_53;
            }
            v33 = v32;
            if (v11 && v32)
            {
              char v34 = [(__CFString *)v31 isEqualToString:v32];

              if (v34) {
                goto LABEL_54;
              }
            }
            else
            {
            }
            v35 = v31;
            v36 = @"performQuote";
            if (v36 == v35)
            {
LABEL_53:
            }
            else
            {
              v37 = v36;
              if (!v11 || !v36)
              {

LABEL_57:
                id v21 = 0;
LABEL_27:

                id v22 = [(PKODIServiceProviderAssessment *)self->_odiServiceProviderAssessment serviceIdentifier];
                id v23 = v21;
                id v24 = v22;
                if (v23 != v24)
                {
                  v25 = v24;
                  if (v23 && v24)
                  {
                    char v26 = [v23 isEqualToString:v24];

                    if (v26) {
                      goto LABEL_37;
                    }
                  }
                  else
                  {
                  }
                  v27 = self->_odiServiceProviderAssessment;
                  if (v27)
                  {
                    [(PKODIServiceProviderAssessment *)v27 setServiceIdentifier:v23];
                  }
                  else
                  {
                    v28 = [[PKODIServiceProviderAssessment alloc] initWithServiceProviderIdentifier:v23 locationBundle:odiServiceProviderAssessment];
                    v29 = self->_odiServiceProviderAssessment;
                    self->_odiServiceProviderAssessment = v28;

                    [(PKODIAssessment *)self->_odiServiceProviderAssessment startAssessment];
                  }
                  goto LABEL_37;
                }

LABEL_37:
                goto LABEL_38;
              }
              char v38 = [(__CFString *)v35 isEqualToString:v36];

              if ((v38 & 1) == 0) {
                goto LABEL_57;
              }
            }
LABEL_54:
            switch(quoteDestinationType)
            {
              case 0uLL:
              case 1uLL:
                goto LABEL_17;
              case 2uLL:
              case 4uLL:
                uint64_t v16 = (id *)MEMORY[0x1E4F5CAD8];
                goto LABEL_26;
              case 3uLL:
                uint64_t v16 = (id *)MEMORY[0x1E4F5CAF8];
                goto LABEL_26;
              case 5uLL:
                uint64_t v16 = (id *)MEMORY[0x1E4F5CAF0];
                goto LABEL_26;
              default:
                goto LABEL_57;
            }
          }
          int v20 = [(__CFString *)v17 isEqualToString:v18];

          if (!v20) {
            goto LABEL_42;
          }
        }
        uint64_t v16 = (id *)MEMORY[0x1E4F5CAE0];
LABEL_26:
        id v21 = *v16;
        goto LABEL_27;
      }
      BOOL v14 = [(NSString *)v11 isEqualToString:v12];

      if (!v14) {
        goto LABEL_19;
      }
    }
LABEL_17:
    uint64_t v16 = (id *)MEMORY[0x1E4F5CAE8];
    goto LABEL_26;
  }
  if (v6) {
    return;
  }
  if (+[PKDeviceScorer deviceScoringSupported])
  {
    odiServiceProviderAssessment = [(PKPeerPaymentDeviceScoreEncryptedPayloadManager *)self _createContextForDeviceScorer];
    v8 = [[PKDeviceScorer alloc] initWithContext:odiServiceProviderAssessment];
    deviceScorer = self->_deviceScorer;
    self->_deviceScorer = v8;
  }
  else
  {
    odiServiceProviderAssessment = self->_deviceScorer;
    self->_deviceScorer = 0;
  }
  uint64_t v15 = 32;
LABEL_39:

  id v30 = *(Class *)((char *)&self->super.isa + v15);
  *(Class *)((char *)&self->super.isa + v15) = 0;
}

- (void)_cristalV1DeviceScoreWithKey:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (+[PKDeviceScorer deviceScoringSupported])
  {
    secureElement = self->_secureElement;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __91__PKPeerPaymentDeviceScoreEncryptedPayloadManager__cristalV1DeviceScoreWithKey_completion___block_invoke;
    v11[3] = &unk_1E56EDA78;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    [(PKSecureElement *)secureElement SEPPairingInfoWithCompletion:v11];
  }
  else
  {
    uint64_t v9 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentDeviceScoreEncryptedPayloadManager: Score: Device scoring not supported for key: %@. Calling completion", buf, 0xCu);
    }

    self->_isScoringInProgress = 0;
    [(PKPeerPaymentDeviceScoreEncryptedPayloadManager *)self setDeviceScoreEncryptedPayloadVersion:self->_pendingDeviceScoreEncryptedPayloadVersion];
    double v10 = [(PKPeerPaymentDeviceScoreEncryptedPayloadManager *)self _errorForUnavailableDeviceScoreWithUnderlyingError:0];
    (*((void (**)(id, void, void, void, void *))v7 + 2))(v7, 0, 0, 0, v10);
  }
}

void __91__PKPeerPaymentDeviceScoreEncryptedPayloadManager__cristalV1DeviceScoreWithKey_completion___block_invoke(id *a1, int a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!a2)
  {
    double v10 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = a1[5];
      *(_DWORD *)long long buf = 138412290;
      id v24 = v15;
      uint64_t v16 = "PKPeerPaymentDeviceScoreEncryptedPayloadManager: Score: Failed to fetch cryptogram and challengeResponse for"
            " key: %@. Calling completion with error.";
LABEL_10:
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
    }
LABEL_11:

    *((unsigned char *)a1[4] + 8) = 0;
    [a1[4] setDeviceScoreEncryptedPayloadVersion:*((void *)a1[4] + 2)];
    id v18 = a1[6];
    v19 = [a1[4] _errorForUnavailableDeviceScoreWithUnderlyingError:0];
    (*((void (**)(id, void, void, void, void *))v18 + 2))(v18, 0, 0, 0, v19);

    goto LABEL_12;
  }
  uint64_t v9 = *((void *)a1[4] + 3);
  double v10 = PKLogFacilityTypeGetObject(0xBuLL);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (v11)
    {
      id v17 = a1[5];
      *(_DWORD *)long long buf = 138412290;
      id v24 = v17;
      uint64_t v16 = "PKPeerPaymentDeviceScoreEncryptedPayloadManager: Score: nil _deviceScorer for key: %@. Calling completion";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v11)
  {
    id v12 = a1[5];
    *(_DWORD *)long long buf = 138412290;
    id v24 = v12;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentDeviceScoreEncryptedPayloadManager: Score: Successfully fetched cryptogram and challengeResponse for key: %@. Calling peerPaymentDeviceScoreWithCryptogram:challengeResponse:completion:.", buf, 0xCu);
  }

  id v13 = a1[4];
  BOOL v14 = (void *)v13[3];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __91__PKPeerPaymentDeviceScoreEncryptedPayloadManager__cristalV1DeviceScoreWithKey_completion___block_invoke_35;
  v20[3] = &unk_1E56EDA50;
  v20[4] = v13;
  id v21 = a1[5];
  id v22 = a1[6];
  [v14 peerPaymentDeviceScoreWithCryptogram:v7 challengeResponse:v8 completion:v20];

LABEL_12:
}

void __91__PKPeerPaymentDeviceScoreEncryptedPayloadManager__cristalV1DeviceScoreWithKey_completion___block_invoke_35(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  double v10 = PKLogFacilityTypeGetObject(0xBuLL);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      uint64_t v12 = *(void *)(a1 + 40);
      int v16 = 138412290;
      uint64_t v17 = v12;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentDeviceScoreEncryptedPayloadManager: Score: peerPaymentDeviceScoreWithCryptogram: successfully returned a deviceScore for key: %@. Calling completion with score.", (uint8_t *)&v16, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
    [*(id *)(a1 + 32) setDeviceScoreEncryptedPayloadVersion:*(void *)(*(void *)(a1 + 32) + 16)];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (v11)
    {
      uint64_t v13 = *(void *)(a1 + 40);
      int v16 = 138412290;
      uint64_t v17 = v13;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentDeviceScoreEncryptedPayloadManager: Score: peerPaymentDeviceScoreWithCryptogram: failed to return a deviceScore for key: %@. Calling completion with error.", (uint8_t *)&v16, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
    [*(id *)(a1 + 32) setDeviceScoreEncryptedPayloadVersion:*(void *)(*(void *)(a1 + 32) + 16)];
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = [*(id *)(a1 + 32) _errorForUnavailableDeviceScoreWithUnderlyingError:v9];
    (*(void (**)(uint64_t, void, void, void, void *))(v14 + 16))(v14, 0, 0, 0, v15);
  }
}

- (id)_createContextForDeviceScorer
{
  v3 = objc_alloc_init(PKDSPContext);
  id v4 = +[PKAppleAccountManager sharedInstance];
  uint64_t v5 = [v4 appleAccountInformation];
  [(PKDSPContext *)v3 setPrimaryAppleAccount:v5];

  id v6 = [(PKSecureElement *)self->_secureElement primarySecureElementIdentifier];
  [(PKDSPContext *)v3 setSecureElementID:v6];

  if (self->_endpointIdentifier) {
    -[PKDSPContext setServerEndpointIdentifier:](v3, "setServerEndpointIdentifier:");
  }
  uint64_t recipientAddress = (uint64_t)self->_recipientAddress;
  if (recipientAddress)
  {
    -[PKDSPContext setPeerPaymentRecipientAddress:](v3, "setPeerPaymentRecipientAddress:");
    if (self->_recipientAddress)
    {
      id v8 = +[PKPeerPaymentRecipientCache sharedCache];
      int v9 = [v8 lowFrequencyDeviceScoreSubmissionRequiredForRecipientAddress:self->_recipientAddress];

      if (v9) {
        uint64_t recipientAddress = 1;
      }
      else {
        uint64_t recipientAddress = 2;
      }
    }
    else
    {
      uint64_t recipientAddress = 0;
    }
  }
  [(PKDSPContext *)v3 setEventFrequency:recipientAddress];
  return v3;
}

- (id)_errorForUnavailableDeviceScoreWithUnderlyingError:(id)a3
{
  id v3 = a3;
  id v4 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentGen.isa, 0);
  uint64_t v5 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentGen_0.isa, 0);
  id v6 = [v5 stringByAppendingString:@"\n\n(Internal Only: Device Score Unavailable)"];

  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  [v7 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F28588]];
  [v7 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F285A0]];
  id v8 = [NSString stringWithFormat:@"%@ - %@", v4, v6];
  [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28568]];

  if (v3) {
    [v7 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  int v9 = (void *)MEMORY[0x1E4F28C58];
  double v10 = (void *)[v7 copy];
  BOOL v11 = [v9 errorWithDomain:@"PKPassKitErrorDomain" code:-7000 userInfo:v10];

  return v11;
}

- (unint64_t)deviceScoreEncryptedPayloadVersion
{
  return self->_deviceScoreEncryptedPayloadVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientAddress, 0);
  objc_storeStrong((id *)&self->_endpointIdentifier, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_odiServiceProviderAssessment, 0);
  objc_storeStrong((id *)&self->_deviceScorer, 0);
}

@end