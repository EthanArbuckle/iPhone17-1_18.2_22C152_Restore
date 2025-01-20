@interface PKPaymentEligibilityResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasEnableRequirements;
- (BOOL)shouldGenerateAuxiliaryCapabilities;
- (BOOL)shouldGenerateFidoKey;
- (BOOL)shouldGenerateISO18013EncryptionKey;
- (BOOL)shouldGenerateLongTermPrivacyKey;
- (BOOL)shouldGenerateTransactionKey;
- (BOOL)shouldSignFidoChallenge;
- (BOOL)supportsVirtualCardNumber;
- (NSArray)auxiliaryCapabilityDecryptions;
- (NSArray)auxiliaryCapabilitySignatures;
- (NSArray)paymentApplications;
- (NSArray)requiredPaymentSetupFields;
- (NSData)fidoChallenge;
- (NSDictionary)transactionKeyInformation;
- (NSString)applicationIdentifier;
- (NSString)credentialAuthorityIdentifier;
- (NSString)dpanIdentifier;
- (NSString)fpanIdentifier;
- (NSString)identifier;
- (NSString)nonce;
- (NSString)region;
- (NSString)sanitizedPrimaryAccountNumber;
- (NSString)termsID;
- (NSURL)learnMoreURL;
- (NSURL)termsURL;
- (PKPaymentEligibilityFIDOProfile)fidoProfile;
- (PKPaymentEligibilityResponse)initWithData:(id)a3;
- (PKPaymentEligibilitySupplementaryData)supplementaryData;
- (int64_t)cardType;
- (int64_t)eligibilityStatus;
- (int64_t)supersededBy;
- (unint64_t)deviceProvisioningDataExpected;
@end

@implementation PKPaymentEligibilityResponse

- (PKPaymentEligibilityResponse)initWithData:(id)a3
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  v109.receiver = self;
  v109.super_class = (Class)PKPaymentEligibilityResponse;
  v3 = [(PKWebServiceResponse *)&v109 initWithData:a3];
  if (!v3) {
    return 0;
  }
  v4 = v3;
  v5 = [(PKWebServiceResponse *)v3 JSONObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v5 objectForKeyedSubscript:@"eligibilityStatus"],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    v7 = [v5 objectForKeyedSubscript:@"identifier"];
    uint64_t v8 = [v7 copy];
    identifier = v4->_identifier;
    v4->_identifier = (NSString *)v8;

    v10 = [v5 objectForKeyedSubscript:@"eligibilityStatus"];
    v4->_eligibilityStatus = [v10 integerValue];

    v11 = [v5 PKStringForKey:@"nonce"];
    uint64_t v12 = [v11 copy];
    nonce = v4->_nonce;
    v4->_nonce = (NSString *)v12;

    v14 = [v5 objectForKeyedSubscript:@"cardType"];
    v4->_cardType = [v14 integerValue];

    v15 = (void *)MEMORY[0x1E4F1CB10];
    v16 = [v5 objectForKeyedSubscript:@"termsURL"];
    uint64_t v17 = [v15 URLWithString:v16];
    termsURL = v4->_termsURL;
    v4->_termsURL = (NSURL *)v17;

    v19 = [v5 objectForKeyedSubscript:@"termsID"];
    uint64_t v20 = [v19 copy];
    termsID = v4->_termsID;
    v4->_termsID = (NSString *)v20;

    v22 = [v5 objectForKeyedSubscript:@"applicationIdentifier"];
    uint64_t v23 = [v22 copy];
    applicationIdentifier = v4->_applicationIdentifier;
    v4->_applicationIdentifier = (NSString *)v23;

    v25 = [v5 objectForKeyedSubscript:@"region"];
    uint64_t v26 = [v25 copy];
    region = v4->_region;
    v4->_region = (NSString *)v26;

    v28 = (void *)MEMORY[0x1E4F1CB10];
    v29 = [v5 objectForKeyedSubscript:@"learnMoreURL"];
    uint64_t v30 = [v28 URLWithString:v29];
    learnMoreURL = v4->_learnMoreURL;
    v4->_learnMoreURL = (NSURL *)v30;

    v32 = [v5 PKStringForKey:@"credentialAuthorityIdentifier"];
    uint64_t v33 = [v32 copy];
    credentialAuthorityIdentifier = v4->_credentialAuthorityIdentifier;
    v4->_credentialAuthorityIdentifier = (NSString *)v33;

    uint64_t v35 = [v5 objectForKeyedSubscript:@"supplementaryData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v36 = [[PKPaymentEligibilitySupplementaryData alloc] initWithDictionary:v35 accountFeatureIdentifier:4 * (v4->_cardType == 135)];
      supplementaryData = v4->_supplementaryData;
      v4->_supplementaryData = v36;
    }
    v103 = (PKPaymentEligibilityResponse *)v35;
    v104 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    v38 = [v5 PKArrayContaining:objc_opt_class() forKey:@"requiredFields"];
    uint64_t v39 = [v38 countByEnumeratingWithState:&v105 objects:v114 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v106;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v106 != v41) {
            objc_enumerationMutation(v38);
          }
          uint64_t v43 = *(void *)(*((void *)&v105 + 1) + 8 * i);
          v44 = [v5 PKDictionaryForKey:@"requiredFieldOptions"];
          [v44 PKDictionaryForKey:v43];
          v46 = v45 = v5;

          v47 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:v43 configuration:v46];
          [v104 safelyAddObject:v47];

          v5 = v45;
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v105 objects:v114 count:16];
      }
      while (v40);
    }

    uint64_t v48 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v104];
    v49 = v4;
    requiredPaymentSetupFields = v4->_requiredPaymentSetupFields;
    v4->_requiredPaymentSetupFields = (NSArray *)v48;

    v51 = [v5 PKDictionaryForKey:@"auxiliaryCapabilities"];
    if (v51)
    {
      v52 = [v51 PKArrayContaining:objc_opt_class() forKey:@"deviceDecryptions"];
      uint64_t v53 = objc_msgSend(v52, "pk_createArrayBySafelyApplyingBlock:", &__block_literal_global_229);
      auxiliaryCapabilityDecryptions = v4->_auxiliaryCapabilityDecryptions;
      v4->_auxiliaryCapabilityDecryptions = (NSArray *)v53;

      v55 = [v51 PKArrayContaining:objc_opt_class() forKey:@"deviceSignatures"];
      uint64_t v56 = objc_msgSend(v55, "pk_createArrayBySafelyApplyingBlock:", &__block_literal_global_410);
      auxiliaryCapabilitySignatures = v4->_auxiliaryCapabilitySignatures;
      v4->_auxiliaryCapabilitySignatures = (NSArray *)v56;
    }
    v58 = [v5 objectForKeyedSubscript:@"fidoProfile"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v60 = [PKPaymentEligibilityFIDOProfile alloc];
      v61 = [v5 objectForKeyedSubscript:@"fidoProfile"];
      uint64_t v62 = [(PKPaymentEligibilityFIDOProfile *)v60 initWithDictionary:v61];
      fidoProfile = v4->_fidoProfile;
      v4->_fidoProfile = (PKPaymentEligibilityFIDOProfile *)v62;
    }
    v64 = [v5 PKStringForKey:@"fidoChallenge"];
    if (v64)
    {
      uint64_t v65 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v64 options:1];
      fidoChallenge = v4->_fidoChallenge;
      v4->_fidoChallenge = (NSData *)v65;
    }
    v67 = [v5 objectForKeyedSubscript:@"transactionKeyInformation"];
    objc_opt_class();
    char v68 = objc_opt_isKindOfClass();

    v69 = v103;
    if (v68)
    {
      v70 = [v5 objectForKeyedSubscript:@"transactionKeyInformation"];
      uint64_t v71 = [v70 copy];
      transactionKeyInformation = v4->_transactionKeyInformation;
      v4->_transactionKeyInformation = (NSDictionary *)v71;
    }
    v73 = [v5 objectForKeyedSubscript:@"enableRequirements"];
    objc_opt_class();
    char v74 = objc_opt_isKindOfClass();

    if (v74)
    {
      id v75 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      v76 = [v5 objectForKeyedSubscript:@"enableRequirements"];
      uint64_t v77 = [v75 initWithArray:v76];
      enableRequirements = v4->_enableRequirements;
      v4->_enableRequirements = (NSSet *)v77;
    }
    v79 = [v5 objectForKeyedSubscript:@"deviceProvisioningDataExpected"];
    v80 = v79;
    if (v79)
    {
      int v81 = [v79 BOOLValue];
      uint64_t v82 = 1;
      if (!v81) {
        uint64_t v82 = 2;
      }
    }
    else
    {
      uint64_t v82 = 0;
    }
    v4->_deviceProvisioningDataExpected = v82;
    v88 = [v5 objectForKeyedSubscript:@"supportsVirtualCardNumber"];
    v4->_supportsVirtualCardNumber = [v88 BOOLValue];

    v89 = [v5 objectForKeyedSubscript:@"FPANIdentifier"];
    uint64_t v90 = [v89 copy];
    fpanIdentifier = v4->_fpanIdentifier;
    v4->_fpanIdentifier = (NSString *)v90;

    v92 = [v5 objectForKeyedSubscript:@"sanitizedPrimaryAccountNumber"];
    uint64_t v93 = [v92 copy];
    sanitizedPrimaryAccountNumber = v4->_sanitizedPrimaryAccountNumber;
    v4->_sanitizedPrimaryAccountNumber = (NSString *)v93;

    v95 = [v5 objectForKeyedSubscript:@"isCardOnFile"];
    int v96 = [v95 BOOLValue];

    if (v96) {
      v4->_supersededBy = 1;
    }
    uint64_t v97 = [v5 PKStringForKey:@"DPANIdentifier"];
    dpanIdentifier = v4->_dpanIdentifier;
    v4->_dpanIdentifier = (NSString *)v97;

    v99 = [v5 PKArrayContaining:objc_opt_class() forKey:@"paymentApplications"];
    v100 = objc_msgSend(v99, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_449);

    if ([v100 count]) {
      v101 = v100;
    }
    else {
      v101 = 0;
    }
    objc_storeStrong((id *)&v4->_paymentApplications, v101);

    v83 = v104;
  }
  else
  {
    v83 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      v84 = (objc_class *)objc_opt_class();
      v85 = NSStringFromClass(v84);
      v86 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v111 = v85;
      __int16 v112 = 2112;
      v113 = v86;
      id v87 = v86;
      _os_log_impl(&dword_190E10000, v83, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
    }
    v69 = v4;
    v49 = 0;
  }

  return v49;
}

PKPassAuxiliaryRegistrationDecryptionRequirement *__45__PKPaymentEligibilityResponse_initWithData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKPassAuxiliaryRegistrationDecryptionRequirement alloc] initWithDictionary:v2];

  return v3;
}

PKPassAuxiliaryRegistrationSignatureRequirement *__45__PKPaymentEligibilityResponse_initWithData___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKPassAuxiliaryRegistrationSignatureRequirement alloc] initWithDictionary:v2];

  return v3;
}

PKProvisioningPaymentApplication *__45__PKPaymentEligibilityResponse_initWithData___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKProvisioningPaymentApplication alloc] initWithDictionary:v2];

  return v3;
}

- (BOOL)shouldGenerateFidoKey
{
  enableRequirements = self->_enableRequirements;
  if (enableRequirements) {
    LOBYTE(enableRequirements) = [(NSSet *)enableRequirements containsObject:@"GENERATE_FIDO_KEYS"];
  }
  return (char)enableRequirements;
}

- (BOOL)shouldSignFidoChallenge
{
  enableRequirements = self->_enableRequirements;
  if (enableRequirements) {
    LOBYTE(enableRequirements) = [(NSSet *)enableRequirements containsObject:@"SIGN_FIDO_CHALLENGE"];
  }
  return (char)enableRequirements;
}

- (BOOL)shouldGenerateISO18013EncryptionKey
{
  enableRequirements = self->_enableRequirements;
  if (enableRequirements) {
    LOBYTE(enableRequirements) = [(NSSet *)enableRequirements containsObject:@"GENERATE_ISO180135_ENCRYPTION_KEY"];
  }
  return (char)enableRequirements;
}

- (BOOL)shouldGenerateTransactionKey
{
  enableRequirements = self->_enableRequirements;
  if (enableRequirements) {
    LOBYTE(enableRequirements) = [(NSSet *)enableRequirements containsObject:@"GENERATE_TRANSACTION_KEY"];
  }
  return (char)enableRequirements;
}

- (BOOL)shouldGenerateLongTermPrivacyKey
{
  enableRequirements = self->_enableRequirements;
  if (enableRequirements) {
    LOBYTE(enableRequirements) = [(NSSet *)enableRequirements containsObject:@"GENERATE_LONG_TERM_PRIVACY_KEY"];
  }
  return (char)enableRequirements;
}

- (BOOL)hasEnableRequirements
{
  enableRequirements = self->_enableRequirements;
  if (enableRequirements) {
    LOBYTE(enableRequirements) = [(NSSet *)enableRequirements count] != 0;
  }
  return (char)enableRequirements;
}

- (BOOL)shouldGenerateAuxiliaryCapabilities
{
  return [(NSArray *)self->_auxiliaryCapabilitySignatures count]
      || [(NSArray *)self->_auxiliaryCapabilityDecryptions count] != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)eligibilityStatus
{
  return self->_eligibilityStatus;
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (unint64_t)deviceProvisioningDataExpected
{
  return self->_deviceProvisioningDataExpected;
}

- (NSURL)termsURL
{
  return self->_termsURL;
}

- (NSString)termsID
{
  return self->_termsID;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (NSString)region
{
  return self->_region;
}

- (NSString)nonce
{
  return self->_nonce;
}

- (NSURL)learnMoreURL
{
  return self->_learnMoreURL;
}

- (PKPaymentEligibilitySupplementaryData)supplementaryData
{
  return self->_supplementaryData;
}

- (NSArray)requiredPaymentSetupFields
{
  return self->_requiredPaymentSetupFields;
}

- (PKPaymentEligibilityFIDOProfile)fidoProfile
{
  return self->_fidoProfile;
}

- (NSData)fidoChallenge
{
  return self->_fidoChallenge;
}

- (NSDictionary)transactionKeyInformation
{
  return self->_transactionKeyInformation;
}

- (NSArray)auxiliaryCapabilityDecryptions
{
  return self->_auxiliaryCapabilityDecryptions;
}

- (NSArray)auxiliaryCapabilitySignatures
{
  return self->_auxiliaryCapabilitySignatures;
}

- (NSString)credentialAuthorityIdentifier
{
  return self->_credentialAuthorityIdentifier;
}

- (BOOL)supportsVirtualCardNumber
{
  return self->_supportsVirtualCardNumber;
}

- (NSString)fpanIdentifier
{
  return self->_fpanIdentifier;
}

- (NSString)sanitizedPrimaryAccountNumber
{
  return self->_sanitizedPrimaryAccountNumber;
}

- (int64_t)supersededBy
{
  return self->_supersededBy;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (NSArray)paymentApplications
{
  return self->_paymentApplications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentApplications, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
  objc_storeStrong((id *)&self->_sanitizedPrimaryAccountNumber, 0);
  objc_storeStrong((id *)&self->_fpanIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialAuthorityIdentifier, 0);
  objc_storeStrong((id *)&self->_auxiliaryCapabilitySignatures, 0);
  objc_storeStrong((id *)&self->_auxiliaryCapabilityDecryptions, 0);
  objc_storeStrong((id *)&self->_transactionKeyInformation, 0);
  objc_storeStrong((id *)&self->_fidoChallenge, 0);
  objc_storeStrong((id *)&self->_fidoProfile, 0);
  objc_storeStrong((id *)&self->_requiredPaymentSetupFields, 0);
  objc_storeStrong((id *)&self->_supplementaryData, 0);
  objc_storeStrong((id *)&self->_learnMoreURL, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_termsID, 0);
  objc_storeStrong((id *)&self->_termsURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_enableRequirements, 0);
}

@end