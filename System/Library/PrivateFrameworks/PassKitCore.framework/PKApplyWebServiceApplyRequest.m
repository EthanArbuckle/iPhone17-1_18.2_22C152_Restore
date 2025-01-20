@interface PKApplyWebServiceApplyRequest
+ (BOOL)supportsSecureCoding;
- (NSArray)certificates;
- (NSSet)termsIdentifiers;
- (NSString)accountIdentifier;
- (NSString)actionIdentifier;
- (NSString)applicationIdentifier;
- (NSString)coreIDVNextStepToken;
- (NSString)odiAssessment;
- (NSString)preliminaryAssessmentIdentifier;
- (NSString)previousContextIdentifier;
- (NSString)referenceIdentifier;
- (NSURL)baseURL;
- (PKApplyWebServiceApplyRequest)initWithCoder:(id)a3;
- (PKApplyWebServiceRequestAuthenticationContext)authenticationContext;
- (PKFeatureApplicationInvitationDetails)invitationDetails;
- (PKPaymentDeviceMetadata)deviceMetadata;
- (PKPaymentInstallmentConfiguration)installmentConfiguration;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (int64_t)applicationType;
- (int64_t)channel;
- (int64_t)updateUserInfoSubType;
- (unint64_t)featureIdentifier;
- (unint64_t)featureProduct;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setActionIdentifier:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setApplicationType:(int64_t)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setCertificates:(id)a3;
- (void)setChannel:(int64_t)a3;
- (void)setCoreIDVNextStepToken:(id)a3;
- (void)setDeviceMetadata:(id)a3;
- (void)setFeatureIdentifier:(unint64_t)a3;
- (void)setFeatureProduct:(unint64_t)a3;
- (void)setInstallmentConfiguration:(id)a3;
- (void)setInvitationDetails:(id)a3;
- (void)setOdiAssessment:(id)a3;
- (void)setPreliminaryAssessmentIdentifier:(id)a3;
- (void)setPreviousContextIdentifier:(id)a3;
- (void)setReferenceIdentifier:(id)a3;
- (void)setTermsIdentifiers:(id)a3;
- (void)setUpdateUserInfoSubType:(int64_t)a3;
@end

@implementation PKApplyWebServiceApplyRequest

- (PKApplyWebServiceApplyRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)PKApplyWebServiceApplyRequest;
  v5 = [(PKApplyWebServiceRequest *)&v43 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationIdentifier"];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseURL"];
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coreIDVNextStepToken"];
    coreIDVNextStepToken = v5->_coreIDVNextStepToken;
    v5->_coreIDVNextStepToken = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"certificates"];
    certificates = v5->_certificates;
    v5->_certificates = (NSArray *)v15;

    v5->_featureIdentifier = [v4 decodeIntegerForKey:@"featureIdentifier"];
    v5->_featureProduct = [v4 decodeIntegerForKey:@"featureProduct"];
    v5->_updateUserInfoSubType = [v4 decodeIntegerForKey:@"updateUserInfoSubType"];
    v5->_channel = [v4 decodeIntegerForKey:@"channel"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previousContextIdentifier"];
    previousContextIdentifier = v5->_previousContextIdentifier;
    v5->_previousContextIdentifier = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionIdentifier"];
    actionIdentifier = v5->_actionIdentifier;
    v5->_actionIdentifier = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentConfiguration"];
    installmentConfiguration = v5->_installmentConfiguration;
    v5->_installmentConfiguration = (PKPaymentInstallmentConfiguration *)v21;

    v5->_applicationType = [v4 decodeIntegerForKey:@"applicationType"];
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referenceIdentifier"];
    referenceIdentifier = v5->_referenceIdentifier;
    v5->_referenceIdentifier = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invitationDetails"];
    invitationDetails = v5->_invitationDetails;
    v5->_invitationDetails = (PKFeatureApplicationInvitationDetails *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preliminaryAssessmentIdentifier"];
    preliminaryAssessmentIdentifier = v5->_preliminaryAssessmentIdentifier;
    v5->_preliminaryAssessmentIdentifier = (NSString *)v29;

    v31 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v32 = objc_opt_class();
    v33 = objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"termsIdentifiers"];
    termsIdentifiers = v5->_termsIdentifiers;
    v5->_termsIdentifiers = (NSSet *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceMetadata"];
    deviceMetadata = v5->_deviceMetadata;
    v5->_deviceMetadata = (PKPaymentDeviceMetadata *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authenticationContext"];
    authenticationContext = v5->_authenticationContext;
    v5->_authenticationContext = (PKApplyWebServiceRequestAuthenticationContext *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"odiAssessment"];
    odiAssessment = v5->_odiAssessment;
    v5->_odiAssessment = (NSString *)v40;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceApplyRequest;
  id v4 = a3;
  [(PKApplyWebServiceRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationIdentifier, @"applicationIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_baseURL forKey:@"baseURL"];
  [v4 encodeObject:self->_coreIDVNextStepToken forKey:@"coreIDVNextStepToken"];
  [v4 encodeObject:self->_certificates forKey:@"certificates"];
  [v4 encodeInteger:self->_featureIdentifier forKey:@"featureIdentifier"];
  [v4 encodeInteger:self->_featureProduct forKey:@"featureProduct"];
  [v4 encodeInteger:self->_updateUserInfoSubType forKey:@"updateUserInfoSubType"];
  [v4 encodeInteger:self->_channel forKey:@"channel"];
  [v4 encodeObject:self->_previousContextIdentifier forKey:@"previousContextIdentifier"];
  [v4 encodeObject:self->_actionIdentifier forKey:@"actionIdentifier"];
  [v4 encodeObject:self->_installmentConfiguration forKey:@"installmentConfiguration"];
  [v4 encodeInteger:self->_applicationType forKey:@"applicationType"];
  [v4 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v4 encodeObject:self->_referenceIdentifier forKey:@"referenceIdentifier"];
  [v4 encodeObject:self->_invitationDetails forKey:@"invitationDetails"];
  [v4 encodeObject:self->_preliminaryAssessmentIdentifier forKey:@"preliminaryAssessmentIdentifier"];
  [v4 encodeObject:self->_termsIdentifiers forKey:@"termsIdentifiers"];
  [v4 encodeObject:self->_deviceMetadata forKey:@"deviceMetadata"];
  [v4 encodeObject:self->_authenticationContext forKey:@"authenticationContext"];
  [v4 encodeObject:self->_odiAssessment forKey:@"odiAssessment"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = v4;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    v9 = PKLogFacilityTypeGetObject(0xDuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    uint64_t v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    *(_DWORD *)buf = 138543618;
    v67 = v28;
    __int16 v68 = 2082;
    v69 = "_baseURL";
LABEL_20:
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_21;
  }
  if (!v4)
  {
    v9 = PKLogFacilityTypeGetObject(0xDuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    uint64_t v29 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v29);
    *(_DWORD *)buf = 138543618;
    v67 = v28;
    __int16 v68 = 2082;
    v69 = "appleAccountInformation";
    goto LABEL_20;
  }
  applicationIdentifier = self->_applicationIdentifier;
  if (!applicationIdentifier)
  {
    v9 = PKLogFacilityTypeGetObject(0xDuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v30);
      *(_DWORD *)buf = 138543618;
      v67 = v28;
      __int16 v68 = 2082;
      v69 = "_applicationIdentifier";
      goto LABEL_20;
    }
LABEL_21:
    id v31 = 0;
    goto LABEL_66;
  }
  v65[0] = @"applications";
  v65[1] = applicationIdentifier;
  v65[2] = @"apply";
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:3];
  v9 = [(PKApplyWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v8 queryParameters:0 appleAccountInformation:v5];

  [v9 setHTTPMethod:@"POST"];
  [v9 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [v9 setCachePolicy:1];
  uint64_t v10 = [(PKApplyWebServiceRequest *)self _createMutableBody];
  v11 = [(PKOverlayableWebServiceRequest *)self secureOverlayParameters];
  uint64_t v12 = [v11 count];

  unint64_t v13 = 0x1E4F1C000uLL;
  if (v12)
  {
    if ([(NSArray *)self->_certificates count])
    {
      PKLogFacilityTypeGetObject(0x23uLL);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, self);
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v16 = v15;
        if (os_signpost_enabled(v14))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_190E10000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "request:applyRequest:encryption", "", buf, 2u);
        }
      }

      uint64_t v17 = (void *)MEMORY[0x192FDC630]();
      v18 = [MEMORY[0x1E4F1CA60] dictionary];
      [(PKOverlayableWebServiceRequest *)self _applySecureOverlayToDictionary:v18];
      if ([v18 count])
      {
        v63 = v17;
        uint64_t v19 = PKLogFacilityTypeGetObject(0xDuLL);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = NSString;
          uint64_t v21 = [v18 allKeys];
          v22 = [v20 stringWithFormat:@"Encrypted Apply Fields: %@", v21];
          *(_DWORD *)buf = 138477827;
          v67 = v22;
          _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
        }
        uint64_t v23 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v18];
        certificates = self->_certificates;
        id v64 = 0;
        uint64_t v25 = PKFeatureEncryptDataWithCertChain(v23, certificates, &v64, self->_featureIdentifier);
        v26 = v64;

        if (v25)
        {
          unint64_t v13 = 0x1E4F1C000;
          uint64_t v17 = v63;
        }
        else
        {
          uint64_t v17 = v63;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate apply request encryptedCardData. This is bad!", buf, 2u);
          }

          uint64_t v25 = 0;
          unint64_t v13 = 0x1E4F1C000uLL;
        }
      }
      else
      {
        v26 = 0;
        uint64_t v25 = 0;
      }

      uint64_t v32 = v14;
      os_signpost_id_t v33 = os_signpost_id_make_with_pointer(v32, self);
      if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v34 = v33;
        if (os_signpost_enabled(v32))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_190E10000, v32, OS_SIGNPOST_INTERVAL_END, v34, "request:applyRequest:encryption", "", buf, 2u);
        }
      }

      if (v25)
      {
        v35 = (void *)[[NSString alloc] initWithData:v25 encoding:4];
        [v10 setObject:@"EV_ECC_v1-ASN.1" forKey:@"encryptionVersion"];
        [v10 setObject:v35 forKey:@"encryptedInputData"];
        uint64_t v36 = [v26 hexEncoding];
        [v10 setObject:v36 forKey:@"publicKeyHash"];
      }
    }
    else
    {
      v26 = PKLogFacilityTypeGetObject(0xDuLL);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v26, OS_LOG_TYPE_DEFAULT, "Error: Tried to apply without certificates", buf, 2u);
      }
      uint64_t v25 = v9;
      v9 = 0;
    }
  }
  v37 = [*(id *)(v13 + 2656) dictionary];
  [(PKOverlayableWebServiceRequest *)self _applyOverlayToDictionary:v37];
  [v10 setObject:v37 forKey:@"inputData"];
  coreIDVNextStepToken = self->_coreIDVNextStepToken;
  if (coreIDVNextStepToken) {
    [v10 setObject:coreIDVNextStepToken forKey:@"coreIDVNextStepToken"];
  }
  previousContextIdentifier = self->_previousContextIdentifier;
  if (previousContextIdentifier) {
    [v10 setObject:previousContextIdentifier forKey:@"previousContextIdentifier"];
  }
  actionIdentifier = self->_actionIdentifier;
  if (actionIdentifier) {
    [v10 setObject:actionIdentifier forKey:@"actionIdentifier"];
  }
  installmentConfiguration = self->_installmentConfiguration;
  if (installmentConfiguration) {
    [(PKPaymentInstallmentConfiguration *)installmentConfiguration encodeToBodyDictionary:v10];
  }
  unint64_t featureProduct = self->_featureProduct;
  if (featureProduct)
  {
    objc_super v43 = PKFeatureProductToString(featureProduct);
    [v10 setObject:v43 forKeyedSubscript:@"productType"];
  }
  int64_t applicationType = self->_applicationType;
  if (applicationType)
  {
    v45 = PKFeatureApplicationTypeToString(applicationType);
    [v10 setObject:v45 forKeyedSubscript:@"applicationType"];

    [v10 setObject:self->_referenceIdentifier forKeyedSubscript:@"referenceIdentifier"];
    if (self->_applicationType == 2)
    {
      [v10 setObject:self->_accountIdentifier forKeyedSubscript:@"accountIdentifier"];
      v46 = [(PKFeatureApplicationInvitationDetails *)self->_invitationDetails jsonRepresentation];
      [v10 setObject:v46 forKeyedSubscript:@"invitationDetails"];
    }
  }
  preliminaryAssessmentIdentifier = self->_preliminaryAssessmentIdentifier;
  if (preliminaryAssessmentIdentifier) {
    [v10 setObject:preliminaryAssessmentIdentifier forKeyedSubscript:@"preliminaryAssessmentIdentifier"];
  }
  if ([(NSSet *)self->_termsIdentifiers count])
  {
    v48 = [(NSSet *)self->_termsIdentifiers allObjects];
    [v10 setObject:v48 forKeyedSubscript:@"termsIdentifiers"];
  }
  int64_t updateUserInfoSubType = self->_updateUserInfoSubType;
  if (updateUserInfoSubType)
  {
    v50 = PKFeatureApplicationUpdateUserInfoSubTypeToString(updateUserInfoSubType);
    [v10 setObject:v50 forKeyedSubscript:@"updateUserInfoSubType"];
  }
  int64_t channel = self->_channel;
  if (channel)
  {
    v52 = PKFeatureApplicationChannelToString(channel);
    [v10 setObject:v52 forKeyedSubscript:@"channel"];
  }
  v53 = [(PKPaymentDeviceMetadata *)self->_deviceMetadata dictionaryRepresentation];
  if (v53) {
    [v10 setObject:v53 forKey:@"deviceMetadata"];
  }
  authenticationContext = self->_authenticationContext;
  if (!authenticationContext) {
    goto LABEL_63;
  }
  v55 = [(PKApplyWebServiceRequestAuthenticationContext *)authenticationContext certificates];
  if (![v55 count]) {
    goto LABEL_62;
  }
  v56 = [(PKApplyWebServiceRequestAuthenticationContext *)self->_authenticationContext signature];

  if (v56)
  {
    v57 = [(PKApplyWebServiceRequestAuthenticationContext *)self->_authenticationContext certificates];
    v55 = objc_msgSend(v57, "pk_arrayByApplyingBlock:", &__block_literal_global_388);

    [v10 setObject:v55 forKeyedSubscript:@"certificates"];
    v58 = [(PKApplyWebServiceRequestAuthenticationContext *)self->_authenticationContext signature];
    v59 = [v58 base64EncodedStringWithOptions:0];
    [v10 setObject:v59 forKeyedSubscript:@"signature"];

LABEL_62:
  }
LABEL_63:
  odiAssessment = self->_odiAssessment;
  if (odiAssessment) {
    [v10 setObject:odiAssessment forKeyedSubscript:@"odiAssessment"];
  }
  v61 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v10];
  [v9 setHTTPBody:v61];

  id v31 = [v9 copy];
LABEL_66:

  return v31;
}

uint64_t __72__PKApplyWebServiceApplyRequest__urlRequestWithAppleAccountInformation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 base64EncodedStringWithOptions:0];
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(unint64_t)a3
{
  self->_featureIdentifier = a3;
}

- (unint64_t)featureProduct
{
  return self->_featureProduct;
}

- (void)setFeatureProduct:(unint64_t)a3
{
  self->_unint64_t featureProduct = a3;
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (NSString)coreIDVNextStepToken
{
  return self->_coreIDVNextStepToken;
}

- (void)setCoreIDVNextStepToken:(id)a3
{
}

- (NSString)previousContextIdentifier
{
  return self->_previousContextIdentifier;
}

- (void)setPreviousContextIdentifier:(id)a3
{
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
}

- (PKPaymentInstallmentConfiguration)installmentConfiguration
{
  return self->_installmentConfiguration;
}

- (void)setInstallmentConfiguration:(id)a3
{
}

- (int64_t)updateUserInfoSubType
{
  return self->_updateUserInfoSubType;
}

- (void)setUpdateUserInfoSubType:(int64_t)a3
{
  self->_int64_t updateUserInfoSubType = a3;
}

- (int64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(int64_t)a3
{
  self->_int64_t channel = a3;
}

- (int64_t)applicationType
{
  return self->_applicationType;
}

- (void)setApplicationType:(int64_t)a3
{
  self->_int64_t applicationType = a3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)referenceIdentifier
{
  return self->_referenceIdentifier;
}

- (void)setReferenceIdentifier:(id)a3
{
}

- (PKFeatureApplicationInvitationDetails)invitationDetails
{
  return self->_invitationDetails;
}

- (void)setInvitationDetails:(id)a3
{
}

- (NSString)preliminaryAssessmentIdentifier
{
  return self->_preliminaryAssessmentIdentifier;
}

- (void)setPreliminaryAssessmentIdentifier:(id)a3
{
}

- (NSSet)termsIdentifiers
{
  return self->_termsIdentifiers;
}

- (void)setTermsIdentifiers:(id)a3
{
}

- (PKPaymentDeviceMetadata)deviceMetadata
{
  return self->_deviceMetadata;
}

- (void)setDeviceMetadata:(id)a3
{
}

- (PKApplyWebServiceRequestAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (void)setAuthenticationContext:(id)a3
{
}

- (NSString)odiAssessment
{
  return self->_odiAssessment;
}

- (void)setOdiAssessment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odiAssessment, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
  objc_storeStrong((id *)&self->_deviceMetadata, 0);
  objc_storeStrong((id *)&self->_termsIdentifiers, 0);
  objc_storeStrong((id *)&self->_preliminaryAssessmentIdentifier, 0);
  objc_storeStrong((id *)&self->_invitationDetails, 0);
  objc_storeStrong((id *)&self->_referenceIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_installmentConfiguration, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_previousContextIdentifier, 0);
  objc_storeStrong((id *)&self->_coreIDVNextStepToken, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end