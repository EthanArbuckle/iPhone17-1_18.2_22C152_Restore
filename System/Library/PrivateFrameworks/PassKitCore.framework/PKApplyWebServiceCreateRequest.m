@interface PKApplyWebServiceCreateRequest
+ (BOOL)supportsSecureCoding;
- (NSString)accountIdentifier;
- (NSString)fundingSourceIdentifier;
- (NSString)odiAssessment;
- (NSString)preliminaryAssessmentIdentifier;
- (NSString)referenceIdentifier;
- (NSURL)applyServiceURL;
- (PKApplyWebServiceCreateRequest)initWithCoder:(id)a3;
- (PKFeatureApplicationInvitationDetails)invitationDetails;
- (PKPaymentInstallmentConfiguration)installmentConfiguration;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (int64_t)applicationType;
- (int64_t)associatedIntent;
- (int64_t)channel;
- (int64_t)updateUserInfoSubType;
- (unint64_t)featureIdentifier;
- (unint64_t)featureProduct;
- (unint64_t)verificationType;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setApplicationType:(int64_t)a3;
- (void)setApplyServiceURL:(id)a3;
- (void)setAssociatedIntent:(int64_t)a3;
- (void)setChannel:(int64_t)a3;
- (void)setFeatureIdentifier:(unint64_t)a3;
- (void)setFeatureProduct:(unint64_t)a3;
- (void)setFundingSourceIdentifier:(id)a3;
- (void)setInstallmentConfiguration:(id)a3;
- (void)setInvitationDetails:(id)a3;
- (void)setOdiAssessment:(id)a3;
- (void)setPreliminaryAssessmentIdentifier:(id)a3;
- (void)setReferenceIdentifier:(id)a3;
- (void)setUpdateUserInfoSubType:(int64_t)a3;
- (void)setVerificationType:(unint64_t)a3;
@end

@implementation PKApplyWebServiceCreateRequest

- (PKApplyWebServiceCreateRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKApplyWebServiceCreateRequest;
  v5 = [(PKApplyWebServiceRequest *)&v21 initWithCoder:v4];
  if (v5)
  {
    v5->_featureIdentifier = [v4 decodeIntegerForKey:@"featureIdentifier"];
    v5->_featureProduct = [v4 decodeIntegerForKey:@"featureProduct"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentConfiguration"];
    installmentConfiguration = v5->_installmentConfiguration;
    v5->_installmentConfiguration = (PKPaymentInstallmentConfiguration *)v6;

    v5->_updateUserInfoSubType = [v4 decodeIntegerForKey:@"updateUserInfoSubType"];
    v5->_channel = [v4 decodeIntegerForKey:@"channel"];
    v5->_applicationType = [v4 decodeIntegerForKey:@"applicationType"];
    v5->_verificationType = [v4 decodeIntegerForKey:@"verificationType"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referenceIdentifier"];
    referenceIdentifier = v5->_referenceIdentifier;
    v5->_referenceIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fundingSourceIdentifier"];
    fundingSourceIdentifier = v5->_fundingSourceIdentifier;
    v5->_fundingSourceIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invitationDetails"];
    invitationDetails = v5->_invitationDetails;
    v5->_invitationDetails = (PKFeatureApplicationInvitationDetails *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preliminaryAssessmentIdentifier"];
    preliminaryAssessmentIdentifier = v5->_preliminaryAssessmentIdentifier;
    v5->_preliminaryAssessmentIdentifier = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"odiAssessment"];
    odiAssessment = v5->_odiAssessment;
    v5->_odiAssessment = (NSString *)v18;

    v5->_associatedIntent = [v4 decodeIntegerForKey:@"associatedIntent"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceCreateRequest;
  id v4 = a3;
  [(PKApplyWebServiceRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_featureIdentifier, @"featureIdentifier", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_featureProduct forKey:@"featureProduct"];
  [v4 encodeObject:self->_installmentConfiguration forKey:@"installmentConfiguration"];
  [v4 encodeInteger:self->_updateUserInfoSubType forKey:@"updateUserInfoSubType"];
  [v4 encodeInteger:self->_channel forKey:@"channel"];
  [v4 encodeInteger:self->_applicationType forKey:@"applicationType"];
  [v4 encodeInteger:self->_verificationType forKey:@"verificationType"];
  [v4 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v4 encodeObject:self->_referenceIdentifier forKey:@"referenceIdentifier"];
  [v4 encodeObject:self->_fundingSourceIdentifier forKey:@"fundingSourceIdentifier"];
  [v4 encodeObject:self->_invitationDetails forKey:@"invitationDetails"];
  [v4 encodeObject:self->_preliminaryAssessmentIdentifier forKey:@"preliminaryAssessmentIdentifier"];
  [v4 encodeObject:self->_odiAssessment forKey:@"odiAssessment"];
  [v4 encodeInteger:self->_associatedIntent forKey:@"associatedIntent"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6)
  {
    uint64_t v10 = PKLogFacilityTypeGetObject(0xDuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    v34 = (objc_class *)objc_opt_class();
    v35 = NSStringFromClass(v34);
    *(_DWORD *)buf = 138543618;
    v41 = v35;
    __int16 v42 = 2082;
    v43 = "url";
LABEL_32:
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_33;
  }
  if (!v7)
  {
    uint64_t v10 = PKLogFacilityTypeGetObject(0xDuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    v36 = (objc_class *)objc_opt_class();
    v35 = NSStringFromClass(v36);
    *(_DWORD *)buf = 138543618;
    v41 = v35;
    __int16 v42 = 2082;
    v43 = "appleAccountInformation";
    goto LABEL_32;
  }
  unint64_t featureIdentifier = self->_featureIdentifier;
  if (!featureIdentifier)
  {
    uint64_t v10 = PKLogFacilityTypeGetObject(0xDuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v37 = (objc_class *)objc_opt_class();
      v35 = NSStringFromClass(v37);
      *(_DWORD *)buf = 138543618;
      v41 = v35;
      __int16 v42 = 2082;
      v43 = "_featureIdentifier";
      goto LABEL_32;
    }
LABEL_33:
    v33 = 0;
    goto LABEL_34;
  }
  uint64_t v10 = PKFeatureIdentifierToString(featureIdentifier);
  v39[0] = @"applications";
  v39[1] = v10;
  v39[2] = @"create";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:3];
  uint64_t v12 = [(PKApplyWebServiceRequest *)self _murlRequestWithServiceURL:v6 endpointComponents:v11 queryParameters:0 appleAccountInformation:v8];

  [v12 setHTTPMethod:@"POST"];
  [v12 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v13 = [(PKApplyWebServiceRequest *)self _createMutableBody];
  installmentConfiguration = self->_installmentConfiguration;
  if (installmentConfiguration) {
    [(PKPaymentInstallmentConfiguration *)installmentConfiguration encodeToBodyDictionary:v13];
  }
  unint64_t featureProduct = self->_featureProduct;
  if (featureProduct)
  {
    uint64_t v16 = PKFeatureProductToString(featureProduct);
    [v13 setObject:v16 forKeyedSubscript:@"productType"];
  }
  int64_t applicationType = self->_applicationType;
  if (applicationType)
  {
    uint64_t v18 = PKFeatureApplicationTypeToString(applicationType);
    [v13 setObject:v18 forKeyedSubscript:@"applicationType"];

    [v13 setObject:self->_referenceIdentifier forKeyedSubscript:@"referenceIdentifier"];
    int64_t v19 = self->_applicationType;
    if (v19 == 2)
    {
      v20 = [(PKFeatureApplicationInvitationDetails *)self->_invitationDetails jsonRepresentation];
      [v13 setObject:v20 forKeyedSubscript:@"invitationDetails"];

      [v13 setObject:self->_accountIdentifier forKeyedSubscript:@"accountIdentifier"];
      int64_t v19 = self->_applicationType;
    }
    if (v19 == 6)
    {
      objc_super v21 = PKApplyVerificationTypeToString(self->_verificationType);
      [v13 setObject:v21 forKeyedSubscript:@"verificationType"];
    }
  }
  preliminaryAssessmentIdentifier = self->_preliminaryAssessmentIdentifier;
  if (preliminaryAssessmentIdentifier) {
    [v13 setObject:preliminaryAssessmentIdentifier forKeyedSubscript:@"preliminaryAssessmentIdentifier"];
  }
  v23 = [(PKApplyWebServiceRequest *)self experimentDetails];

  if (v23)
  {
    v24 = [(PKApplyWebServiceRequest *)self experimentDetails];
    [v13 setObject:v24 forKeyedSubscript:@"experiment"];
  }
  odiAssessment = self->_odiAssessment;
  if (odiAssessment) {
    [v13 setObject:odiAssessment forKeyedSubscript:@"odiAssessment"];
  }
  int64_t updateUserInfoSubType = self->_updateUserInfoSubType;
  if (updateUserInfoSubType)
  {
    v27 = PKFeatureApplicationUpdateUserInfoSubTypeToString(updateUserInfoSubType);
    [v13 setObject:v27 forKeyedSubscript:@"updateUserInfoSubType"];
  }
  int64_t channel = self->_channel;
  if (channel)
  {
    v29 = PKFeatureApplicationChannelToString(channel);
    [v13 setObject:v29 forKeyedSubscript:@"channel"];
  }
  int64_t associatedIntent = self->_associatedIntent;
  if (associatedIntent)
  {
    v31 = PKFeatureApplicationAssociatedIntentToString(associatedIntent);
    [v13 setObject:v31 forKeyedSubscript:@"associatedIntent"];
  }
  [v13 safelySetObject:self->_fundingSourceIdentifier forKey:@"fundingSourceIdentifier"];
  v32 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v13];
  [v12 setHTTPBody:v32];

  v33 = (void *)[v12 copy];
LABEL_34:

  return v33;
}

- (NSURL)applyServiceURL
{
  return self->_applyServiceURL;
}

- (void)setApplyServiceURL:(id)a3
{
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(unint64_t)a3
{
  self->_unint64_t featureIdentifier = a3;
}

- (unint64_t)featureProduct
{
  return self->_featureProduct;
}

- (void)setFeatureProduct:(unint64_t)a3
{
  self->_unint64_t featureProduct = a3;
}

- (PKPaymentInstallmentConfiguration)installmentConfiguration
{
  return self->_installmentConfiguration;
}

- (void)setInstallmentConfiguration:(id)a3
{
}

- (int64_t)applicationType
{
  return self->_applicationType;
}

- (void)setApplicationType:(int64_t)a3
{
  self->_int64_t applicationType = a3;
}

- (int64_t)updateUserInfoSubType
{
  return self->_updateUserInfoSubType;
}

- (void)setUpdateUserInfoSubType:(int64_t)a3
{
  self->_int64_t updateUserInfoSubType = a3;
}

- (unint64_t)verificationType
{
  return self->_verificationType;
}

- (void)setVerificationType:(unint64_t)a3
{
  self->_verificationType = a3;
}

- (int64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(int64_t)a3
{
  self->_int64_t channel = a3;
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

- (NSString)fundingSourceIdentifier
{
  return self->_fundingSourceIdentifier;
}

- (void)setFundingSourceIdentifier:(id)a3
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

- (NSString)odiAssessment
{
  return self->_odiAssessment;
}

- (void)setOdiAssessment:(id)a3
{
}

- (int64_t)associatedIntent
{
  return self->_associatedIntent;
}

- (void)setAssociatedIntent:(int64_t)a3
{
  self->_int64_t associatedIntent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odiAssessment, 0);
  objc_storeStrong((id *)&self->_preliminaryAssessmentIdentifier, 0);
  objc_storeStrong((id *)&self->_invitationDetails, 0);
  objc_storeStrong((id *)&self->_fundingSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_referenceIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_installmentConfiguration, 0);
  objc_storeStrong((id *)&self->_applyServiceURL, 0);
}

@end