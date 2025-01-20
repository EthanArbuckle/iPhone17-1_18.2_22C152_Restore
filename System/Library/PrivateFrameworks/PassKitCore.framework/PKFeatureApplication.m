@interface PKFeatureApplication
+ (BOOL)supportsSecureCoding;
- (BOOL)applicationStateDirty;
- (BOOL)hasSufficientOTBForInstallmentConfiguration:(id)a3;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsAuthentication;
- (NSData)authenticationSignaturePayload;
- (NSDate)lastUpdated;
- (NSString)accountIdentifier;
- (NSString)applicationIdentifier;
- (NSString)applicationTermsIdentifier;
- (NSString)businessChatIdentifier;
- (NSString)coreIDVServiceProviderName;
- (NSString)preliminaryAssessmentIdentifier;
- (NSString)referenceIdentifier;
- (NSURL)applicationBaseURL;
- (PKFeatureApplication)initWithCoder:(id)a3;
- (PKFeatureApplication)initWithDictionary:(id)a3;
- (PKFeatureApplicationDeclineDetails)declineDetails;
- (PKFeatureApplicationInvitationDetails)invitationDetails;
- (PKFeatureApplicationOfferDetails)applicationOfferDetails;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)applicationType;
- (int64_t)updateUserInfoSubType;
- (unint64_t)applicationState;
- (unint64_t)applicationStateReason;
- (unint64_t)feature;
- (unint64_t)featureProduct;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setApplicationBaseURL:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setApplicationOfferDetails:(id)a3;
- (void)setApplicationState:(unint64_t)a3;
- (void)setApplicationStateDirty:(BOOL)a3;
- (void)setApplicationStateReason:(unint64_t)a3;
- (void)setApplicationTermsIdentifier:(id)a3;
- (void)setApplicationType:(int64_t)a3;
- (void)setBusinessChatIdentifier:(id)a3;
- (void)setCoreIDVServiceProviderName:(id)a3;
- (void)setDeclineDetails:(id)a3;
- (void)setFeature:(unint64_t)a3;
- (void)setFeatureProduct:(unint64_t)a3;
- (void)setInvitationDetails:(id)a3;
- (void)setLastUpdated:(id)a3;
- (void)setPreliminaryAssessmentIdentifier:(id)a3;
- (void)setReferenceIdentifier:(id)a3;
- (void)setUpdateUserInfoSubType:(int64_t)a3;
@end

@implementation PKFeatureApplication

- (PKFeatureApplication)initWithDictionary:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PKFeatureApplication;
  v5 = [(PKFeatureApplication *)&v46 init];
  if (!v5) {
    goto LABEL_36;
  }
  uint64_t v6 = [v4 PKStringForKey:@"applicationIdentifier"];
  applicationIdentifier = v5->_applicationIdentifier;
  v5->_applicationIdentifier = (NSString *)v6;

  if ([(NSString *)v5->_applicationIdentifier length])
  {
    uint64_t v8 = [v4 PKURLForKey:@"applicationBaseURL"];
    applicationBaseURL = v5->_applicationBaseURL;
    v5->_applicationBaseURL = (NSURL *)v8;

    if (v5->_applicationBaseURL)
    {
      v10 = [v4 PKStringForKey:@"featureIdentifier"];
      uint64_t v11 = PKFeatureIdentifierFromString(v10);
      v5->_feature = v11;
      if (!v11)
      {
        v12 = PKLogFacilityTypeGetObject(0xDuLL);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v48 = v10;
          _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Error: Feature identifier: %@ unknown", buf, 0xCu);
        }
        goto LABEL_21;
      }
      v12 = [v4 PKStringForKey:@"applicationType"];
      uint64_t v13 = PKFeatureApplicationTypeFromString(v12);
      v5->_applicationType = v13;
      if (!v13)
      {
        v14 = PKLogFacilityTypeGetObject(0xDuLL);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v48 = v12;
          _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Error: Application type: %@ unknown", buf, 0xCu);
        }
        goto LABEL_20;
      }
      v14 = [v4 PKStringForKey:@"updateUserInfoSubType"];
      v5->_updateUserInfoSubType = PKFeatureApplicationUpdateUserInfoSubTypeFromString(v14);
      v15 = [v4 PKStringForKey:@"applicationState"];
      v5->_unint64_t applicationState = PKFeatureApplicationStateFromString(v15);
      v16 = [v4 PKStringForKey:@"applicationStateReason"];
      v5->_applicationStateReason = PKFeatureApplicationStateReasonFromString(v16);
      unint64_t applicationState = v5->_applicationState;
      switch(applicationState)
      {
        case 6uLL:
          v21 = [v4 PKDictionaryForKey:@"offerDetails"];
          if (v21
            || ([v4 PKDictionaryForKey:@"offer"],
                (v21 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v22 = [[PKFeatureApplicationOfferDetails alloc] initWithDictionary:v21];
            applicationOfferDetails = v5->_applicationOfferDetails;
            v5->_applicationOfferDetails = v22;
          }
          unint64_t applicationState = v5->_applicationState;
          break;
        case 0uLL:
          v18 = PKLogFacilityTypeGetObject(0xDuLL);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "Error: Application state unknown", buf, 2u);
          }

LABEL_20:
LABEL_21:

          goto LABEL_22;
        case 7uLL:
          v24 = [v4 PKDictionaryForKey:@"declineDetails"];
          if (v24)
          {
            v25 = [[PKFeatureApplicationDeclineDetails alloc] initWithDictionary:v24];
            declineDetails = v5->_declineDetails;
            v5->_declineDetails = v25;
          }
          break;
      }
      uint64_t v27 = [v4 PKStringForKey:@"applicationTermsIdentifier"];
      applicationTermsIdentifier = v5->_applicationTermsIdentifier;
      v5->_applicationTermsIdentifier = (NSString *)v27;

      uint64_t v29 = [v4 PKDateForKey:@"lastUpdated"];
      lastUpdated = v5->_lastUpdated;
      v5->_lastUpdated = (NSDate *)v29;

      uint64_t v31 = [v4 PKStringForKey:@"businessChatIdentifier"];
      businessChatIdentifier = v5->_businessChatIdentifier;
      v5->_businessChatIdentifier = (NSString *)v31;

      uint64_t v33 = [v4 PKStringForKey:@"coreIDVServiceProviderName"];
      coreIDVServiceProviderName = v5->_coreIDVServiceProviderName;
      v5->_coreIDVServiceProviderName = (NSString *)v33;

      v35 = [v4 PKStringForKey:@"productType"];
      v5->_featureProduct = PKFeatureProductFromString(v35);

      uint64_t v36 = [v4 PKStringForKey:@"accountIdentifier"];
      accountIdentifier = v5->_accountIdentifier;
      v5->_accountIdentifier = (NSString *)v36;

      uint64_t v38 = [v4 PKStringForKey:@"referenceIdentifier"];
      referenceIdentifier = v5->_referenceIdentifier;
      v5->_referenceIdentifier = (NSString *)v38;

      if (v5->_applicationType == 2)
      {
        v40 = [v4 PKDictionaryForKey:@"invitationDetails"];
        if (v40)
        {
          v41 = [[PKFeatureApplicationInvitationDetails alloc] initWithDictionary:v40];
          invitationDetails = v5->_invitationDetails;
          v5->_invitationDetails = v41;
        }
      }
      uint64_t v43 = [v4 PKStringForKey:@"preliminaryAssessmentIdentifier"];
      preliminaryAssessmentIdentifier = v5->_preliminaryAssessmentIdentifier;
      v5->_preliminaryAssessmentIdentifier = (NSString *)v43;

LABEL_36:
      v20 = v5;
      goto LABEL_37;
    }
    v10 = PKLogFacilityTypeGetObject(0xDuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v19 = "Error: Application baseURL missing";
      goto LABEL_15;
    }
  }
  else
  {
    v10 = PKLogFacilityTypeGetObject(0xDuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v19 = "Error: Application identifier missing";
LABEL_15:
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
    }
  }
LABEL_22:

  v20 = 0;
LABEL_37:

  return v20;
}

- (BOOL)isActive
{
  return (self->_applicationState < 0x11) & (0x101FEu >> self->_applicationState);
}

- (BOOL)hasSufficientOTBForInstallmentConfiguration:(id)a3
{
  id v4 = [a3 openToBuyThresholdAmount];
  v5 = [(PKFeatureApplicationOfferDetails *)self->_applicationOfferDetails creditLimit];
  uint64_t v6 = v5;
  BOOL v7 = 0;
  if (v4 && v5) {
    BOOL v7 = [v5 compare:v4] != -1;
  }

  return v7;
}

- (BOOL)supportsAuthentication
{
  return (unint64_t)(self->_applicationType - 1) <= 2 && self->_feature == 2;
}

- (NSData)authenticationSignaturePayload
{
  if (self->_applicationType == 2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    id v4 = [(PKFeatureApplicationInvitationDetails *)self->_invitationDetails accountUserAltDSID];
    [v3 appendString:v4];

    v5 = PKAccountAccessLevelToString([(PKFeatureApplicationInvitationDetails *)self->_invitationDetails accountUserAccessLevel]);
    [v3 appendString:v5];

    if ([(NSString *)self->_accountIdentifier length]) {
      [v3 appendString:self->_accountIdentifier];
    }
    uint64_t v6 = [v3 dataUsingEncoding:4];
    BOOL v7 = [v6 SHA256Hash];
  }
  else
  {
    BOOL v7 = 0;
  }
  return (NSData *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFeatureApplication)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKFeatureApplication;
  v5 = [(PKFeatureApplication *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationIdentifier"];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationBaseURL"];
    applicationBaseURL = v5->_applicationBaseURL;
    v5->_applicationBaseURL = (NSURL *)v8;

    v5->_feature = [v4 decodeIntegerForKey:@"feature"];
    v5->_featureProduct = [v4 decodeIntegerForKey:@"featureProduct"];
    v5->_applicationType = [v4 decodeIntegerForKey:@"applicationType"];
    v5->_updateUserInfoSubType = [v4 decodeIntegerForKey:@"updateUserInfoSubType"];
    v5->_unint64_t applicationState = [v4 decodeIntegerForKey:@"applicationState"];
    v5->_applicationStateReason = [v4 decodeIntegerForKey:@"applicationStateReason"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationTermsIdentifier"];
    applicationTermsIdentifier = v5->_applicationTermsIdentifier;
    v5->_applicationTermsIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationOfferDetails"];
    applicationOfferDetails = v5->_applicationOfferDetails;
    v5->_applicationOfferDetails = (PKFeatureApplicationOfferDetails *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"declineDetails"];
    declineDetails = v5->_declineDetails;
    v5->_declineDetails = (PKFeatureApplicationDeclineDetails *)v14;

    v5->_applicationStateDirty = [v4 decodeBoolForKey:@"applicationStateDirty"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdated"];
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"businessChatIdentifier"];
    businessChatIdentifier = v5->_businessChatIdentifier;
    v5->_businessChatIdentifier = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coreIDVServiceProviderName"];
    coreIDVServiceProviderName = v5->_coreIDVServiceProviderName;
    v5->_coreIDVServiceProviderName = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referenceIdentifier"];
    referenceIdentifier = v5->_referenceIdentifier;
    v5->_referenceIdentifier = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invitationDetails"];
    invitationDetails = v5->_invitationDetails;
    v5->_invitationDetails = (PKFeatureApplicationInvitationDetails *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preliminaryAssessmentIdentifier"];
    preliminaryAssessmentIdentifier = v5->_preliminaryAssessmentIdentifier;
    v5->_preliminaryAssessmentIdentifier = (NSString *)v28;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  applicationIdentifier = self->_applicationIdentifier;
  id v5 = a3;
  [v5 encodeObject:applicationIdentifier forKey:@"applicationIdentifier"];
  [v5 encodeObject:self->_applicationBaseURL forKey:@"applicationBaseURL"];
  [v5 encodeInteger:self->_applicationState forKey:@"applicationState"];
  [v5 encodeInteger:self->_applicationType forKey:@"applicationType"];
  [v5 encodeInteger:self->_updateUserInfoSubType forKey:@"updateUserInfoSubType"];
  [v5 encodeInteger:self->_feature forKey:@"feature"];
  [v5 encodeInteger:self->_featureProduct forKey:@"featureProduct"];
  [v5 encodeInteger:self->_applicationStateReason forKey:@"applicationStateReason"];
  [v5 encodeObject:self->_applicationTermsIdentifier forKey:@"applicationTermsIdentifier"];
  [v5 encodeObject:self->_applicationOfferDetails forKey:@"applicationOfferDetails"];
  [v5 encodeObject:self->_declineDetails forKey:@"declineDetails"];
  [v5 encodeBool:self->_applicationStateDirty forKey:@"applicationStateDirty"];
  [v5 encodeObject:self->_lastUpdated forKey:@"lastUpdated"];
  [v5 encodeObject:self->_businessChatIdentifier forKey:@"businessChatIdentifier"];
  [v5 encodeObject:self->_coreIDVServiceProviderName forKey:@"coreIDVServiceProviderName"];
  [v5 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v5 encodeObject:self->_referenceIdentifier forKey:@"referenceIdentifier"];
  [v5 encodeObject:self->_invitationDetails forKey:@"invitationDetails"];
  [v5 encodeObject:self->_preliminaryAssessmentIdentifier forKey:@"preliminaryAssessmentIdentifier"];
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"applicationIdentifier: '%@'; ", self->_applicationIdentifier];
  [v3 appendFormat:@"applicationBaseURL: '%@'; ", self->_applicationBaseURL];
  id v4 = PKFeatureApplicationStateToString(self->_applicationState);
  [v3 appendFormat:@"state: '%@'; ", v4];

  id v5 = PKFeatureApplicationStateReasonToString(self->_applicationStateReason);
  [v3 appendFormat:@"applicationStateReason: '%@'; ", v5];

  uint64_t v6 = PKFeatureIdentifierToString(self->_feature);
  [v3 appendFormat:@"feature: '%@'; ", v6];

  BOOL v7 = PKFeatureProductToString(self->_featureProduct);
  [v3 appendFormat:@"featureProduct: '%@'; ", v7];

  unint64_t v8 = self->_applicationType - 1;
  if (v8 > 5) {
    v9 = @"unknown";
  }
  else {
    v9 = off_1E56F3088[v8];
  }
  [v3 appendFormat:@"applicationType: '%@'; ", v9];
  unint64_t v10 = self->_updateUserInfoSubType - 1;
  if (v10 > 3) {
    uint64_t v11 = @"unknown";
  }
  else {
    uint64_t v11 = off_1E56F30B8[v10];
  }
  [v3 appendFormat:@"updateUserInfoSubType: '%@'; ", v11];
  [v3 appendFormat:@"applicationTermsIdentifier: '%@'; ", self->_applicationTermsIdentifier];
  uint64_t v12 = [(PKFeatureApplicationOfferDetails *)self->_applicationOfferDetails description];
  [v3 appendFormat:@"offerDetails: %@; ", v12];

  uint64_t v13 = [(PKFeatureApplicationDeclineDetails *)self->_declineDetails description];
  [v3 appendFormat:@"declineDetails: %@; ", v13];

  if (self->_applicationStateDirty) {
    uint64_t v14 = @"YES";
  }
  else {
    uint64_t v14 = @"NO";
  }
  [v3 appendFormat:@"applicationStateDirty: %@; ", v14];
  v15 = [(NSDate *)self->_lastUpdated description];
  [v3 appendFormat:@"lastUpdated: %@; ", v15];

  [v3 appendFormat:@"businessChatIdentifier: %@; ", self->_businessChatIdentifier];
  [v3 appendFormat:@"coreIDVServiceProviderName: %@; ", self->_coreIDVServiceProviderName];
  [v3 appendFormat:@"accountIdentifier: '%@'; ", self->_accountIdentifier];
  [v3 appendFormat:@"referenceIdentifier: '%@'; ", self->_referenceIdentifier];
  [v3 appendFormat:@"invitationDetails: '%@'; ", self->_invitationDetails];
  objc_msgSend(v3, "appendFormat:", @"preliminaryAssessmentIdentifier: '%@'; ",
    self->_preliminaryAssessmentIdentifier);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_40;
  }
  applicationIdentifier = self->_applicationIdentifier;
  uint64_t v6 = (NSString *)v4[2];
  if (applicationIdentifier && v6)
  {
    if ((-[NSString isEqual:](applicationIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_40;
    }
  }
  else if (applicationIdentifier != v6)
  {
    goto LABEL_40;
  }
  applicationBaseURL = self->_applicationBaseURL;
  unint64_t v8 = (NSURL *)v4[3];
  if (applicationBaseURL && v8)
  {
    if ((-[NSURL isEqual:](applicationBaseURL, "isEqual:") & 1) == 0) {
      goto LABEL_40;
    }
  }
  else if (applicationBaseURL != v8)
  {
    goto LABEL_40;
  }
  if (self->_feature != v4[4] || self->_featureProduct != v4[5]) {
    goto LABEL_40;
  }
  applicationOfferDetails = self->_applicationOfferDetails;
  unint64_t v10 = (PKFeatureApplicationOfferDetails *)v4[11];
  if (applicationOfferDetails && v10)
  {
    if (!-[PKFeatureApplicationOfferDetails isEqual:](applicationOfferDetails, "isEqual:")) {
      goto LABEL_40;
    }
  }
  else if (applicationOfferDetails != v10)
  {
    goto LABEL_40;
  }
  declineDetails = self->_declineDetails;
  uint64_t v12 = (PKFeatureApplicationDeclineDetails *)v4[12];
  if (declineDetails && v12)
  {
    if (!-[PKFeatureApplicationDeclineDetails isEqual:](declineDetails, "isEqual:")) {
      goto LABEL_40;
    }
  }
  else if (declineDetails != v12)
  {
    goto LABEL_40;
  }
  if (self->_applicationState != v4[9]
    || self->_applicationType != v4[6]
    || self->_updateUserInfoSubType != v4[8]
    || self->_applicationStateReason != v4[10])
  {
    goto LABEL_40;
  }
  uint64_t v13 = (void *)v4[13];
  uint64_t v14 = self->_applicationTermsIdentifier;
  v15 = v13;
  if (v14 == v15)
  {
  }
  else
  {
    uint64_t v16 = v15;
    char v36 = 0;
    if (!v14 || !v15) {
      goto LABEL_73;
    }
    BOOL v17 = [(NSString *)v14 isEqualToString:v15];

    if (!v17) {
      goto LABEL_40;
    }
  }
  if (self->_applicationStateDirty != *((unsigned __int8 *)v4 + 8)) {
    goto LABEL_40;
  }
  lastUpdated = self->_lastUpdated;
  v19 = (NSDate *)v4[14];
  if (lastUpdated && v19)
  {
    if ((-[NSDate isEqual:](lastUpdated, "isEqual:") & 1) == 0) {
      goto LABEL_40;
    }
  }
  else if (lastUpdated != v19)
  {
    goto LABEL_40;
  }
  uint64_t v22 = (void *)v4[15];
  uint64_t v14 = self->_businessChatIdentifier;
  v23 = v22;
  if (v14 != v23)
  {
    uint64_t v16 = v23;
    char v36 = 0;
    if (v14 && v23)
    {
      BOOL v24 = [(NSString *)v14 isEqualToString:v23];

      if (!v24) {
        goto LABEL_40;
      }
      goto LABEL_48;
    }
LABEL_73:

    BOOL v20 = v36;
    goto LABEL_41;
  }

LABEL_48:
  coreIDVServiceProviderName = self->_coreIDVServiceProviderName;
  uint64_t v26 = (NSString *)v4[16];
  if (coreIDVServiceProviderName && v26)
  {
    if ((-[NSString isEqual:](coreIDVServiceProviderName, "isEqual:") & 1) == 0) {
      goto LABEL_40;
    }
  }
  else if (coreIDVServiceProviderName != v26)
  {
    goto LABEL_40;
  }
  accountIdentifier = self->_accountIdentifier;
  uint64_t v28 = (NSString *)v4[17];
  if (accountIdentifier && v28)
  {
    if ((-[NSString isEqual:](accountIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_40;
    }
  }
  else if (accountIdentifier != v28)
  {
    goto LABEL_40;
  }
  referenceIdentifier = self->_referenceIdentifier;
  v30 = (NSString *)v4[7];
  if (referenceIdentifier && v30)
  {
    if ((-[NSString isEqual:](referenceIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_40;
    }
  }
  else if (referenceIdentifier != v30)
  {
    goto LABEL_40;
  }
  invitationDetails = self->_invitationDetails;
  v32 = (PKFeatureApplicationInvitationDetails *)v4[18];
  if (invitationDetails && v32)
  {
    if (-[PKFeatureApplicationInvitationDetails isEqual:](invitationDetails, "isEqual:"))
    {
LABEL_68:
      preliminaryAssessmentIdentifier = self->_preliminaryAssessmentIdentifier;
      v34 = (void *)v4[19];
      uint64_t v14 = preliminaryAssessmentIdentifier;
      v35 = v34;
      if (v14 == v35)
      {
        char v36 = 1;
        uint64_t v16 = v14;
      }
      else
      {
        uint64_t v16 = v35;
        char v36 = 0;
        if (v14 && v35) {
          char v36 = [(NSString *)v14 isEqualToString:v35];
        }
      }
      goto LABEL_73;
    }
  }
  else if (invitationDetails == v32)
  {
    goto LABEL_68;
  }
LABEL_40:
  BOOL v20 = 0;
LABEL_41:

  return v20;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_applicationIdentifier];
  [v3 safelyAddObject:self->_applicationOfferDetails];
  [v3 safelyAddObject:self->_declineDetails];
  [v3 safelyAddObject:self->_applicationBaseURL];
  [v3 safelyAddObject:self->_applicationTermsIdentifier];
  [v3 safelyAddObject:self->_lastUpdated];
  [v3 safelyAddObject:self->_businessChatIdentifier];
  [v3 safelyAddObject:self->_coreIDVServiceProviderName];
  [v3 safelyAddObject:self->_accountIdentifier];
  [v3 safelyAddObject:self->_referenceIdentifier];
  [v3 safelyAddObject:self->_invitationDetails];
  [v3 safelyAddObject:self->_preliminaryAssessmentIdentifier];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_applicationState - v4 + 32 * v4;
  unint64_t v6 = self->_applicationStateReason - v5 + 32 * v5;
  unint64_t v7 = self->_feature - v6 + 32 * v6;
  unint64_t v8 = self->_featureProduct - v7 + 32 * v7;
  int64_t v9 = self->_applicationType - v8 + 32 * v8;
  int64_t v10 = self->_updateUserInfoSubType - v9 + 32 * v9;
  unint64_t v11 = self->_applicationStateDirty - v10 + 32 * v10;

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[PKFeatureApplication allocWithZone:](PKFeatureApplication, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_applicationIdentifier copyWithZone:a3];
  applicationIdentifier = v5->_applicationIdentifier;
  v5->_applicationIdentifier = (NSString *)v6;

  unint64_t v8 = [(PKFeatureApplicationOfferDetails *)self->_applicationOfferDetails copyWithZone:a3];
  applicationOfferDetails = v5->_applicationOfferDetails;
  v5->_applicationOfferDetails = v8;

  int64_t v10 = [(PKFeatureApplicationDeclineDetails *)self->_declineDetails copyWithZone:a3];
  declineDetails = v5->_declineDetails;
  v5->_declineDetails = v10;

  uint64_t v12 = [(NSURL *)self->_applicationBaseURL copyWithZone:a3];
  applicationBaseURL = v5->_applicationBaseURL;
  v5->_applicationBaseURL = (NSURL *)v12;

  uint64_t v14 = [(NSString *)self->_applicationTermsIdentifier copyWithZone:a3];
  applicationTermsIdentifier = v5->_applicationTermsIdentifier;
  v5->_applicationTermsIdentifier = (NSString *)v14;

  uint64_t v16 = [(NSDate *)self->_lastUpdated copyWithZone:a3];
  lastUpdated = v5->_lastUpdated;
  v5->_lastUpdated = (NSDate *)v16;

  v5->_unint64_t applicationState = self->_applicationState;
  v5->_applicationStateReason = self->_applicationStateReason;
  v5->_feature = self->_feature;
  v5->_featureProduct = self->_featureProduct;
  v5->_applicationStateReason = self->_applicationStateReason;
  objc_storeStrong((id *)&v5->_businessChatIdentifier, self->_businessChatIdentifier);
  objc_storeStrong((id *)&v5->_coreIDVServiceProviderName, self->_coreIDVServiceProviderName);
  v5->_updateUserInfoSubType = self->_updateUserInfoSubType;
  v5->_applicationType = self->_applicationType;
  uint64_t v18 = [(NSString *)self->_accountIdentifier copyWithZone:a3];
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSString *)v18;

  uint64_t v20 = [(NSString *)self->_referenceIdentifier copyWithZone:a3];
  referenceIdentifier = v5->_referenceIdentifier;
  v5->_referenceIdentifier = (NSString *)v20;

  uint64_t v22 = [(PKFeatureApplicationInvitationDetails *)self->_invitationDetails copyWithZone:a3];
  invitationDetails = v5->_invitationDetails;
  v5->_invitationDetails = v22;

  uint64_t v24 = [(NSString *)self->_preliminaryAssessmentIdentifier copyWithZone:a3];
  preliminaryAssessmentIdentifier = v5->_preliminaryAssessmentIdentifier;
  v5->_preliminaryAssessmentIdentifier = (NSString *)v24;

  return v5;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSURL)applicationBaseURL
{
  return self->_applicationBaseURL;
}

- (void)setApplicationBaseURL:(id)a3
{
}

- (unint64_t)feature
{
  return self->_feature;
}

- (void)setFeature:(unint64_t)a3
{
  self->_feature = a3;
}

- (unint64_t)featureProduct
{
  return self->_featureProduct;
}

- (void)setFeatureProduct:(unint64_t)a3
{
  self->_featureProduct = a3;
}

- (int64_t)applicationType
{
  return self->_applicationType;
}

- (void)setApplicationType:(int64_t)a3
{
  self->_applicationType = a3;
}

- (NSString)referenceIdentifier
{
  return self->_referenceIdentifier;
}

- (void)setReferenceIdentifier:(id)a3
{
}

- (int64_t)updateUserInfoSubType
{
  return self->_updateUserInfoSubType;
}

- (void)setUpdateUserInfoSubType:(int64_t)a3
{
  self->_updateUserInfoSubType = a3;
}

- (unint64_t)applicationState
{
  return self->_applicationState;
}

- (void)setApplicationState:(unint64_t)a3
{
  self->_unint64_t applicationState = a3;
}

- (unint64_t)applicationStateReason
{
  return self->_applicationStateReason;
}

- (void)setApplicationStateReason:(unint64_t)a3
{
  self->_applicationStateReason = a3;
}

- (PKFeatureApplicationOfferDetails)applicationOfferDetails
{
  return self->_applicationOfferDetails;
}

- (void)setApplicationOfferDetails:(id)a3
{
}

- (PKFeatureApplicationDeclineDetails)declineDetails
{
  return self->_declineDetails;
}

- (void)setDeclineDetails:(id)a3
{
}

- (NSString)applicationTermsIdentifier
{
  return self->_applicationTermsIdentifier;
}

- (void)setApplicationTermsIdentifier:(id)a3
{
}

- (BOOL)applicationStateDirty
{
  return self->_applicationStateDirty;
}

- (void)setApplicationStateDirty:(BOOL)a3
{
  self->_applicationStateDirty = a3;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
}

- (NSString)businessChatIdentifier
{
  return self->_businessChatIdentifier;
}

- (void)setBusinessChatIdentifier:(id)a3
{
}

- (NSString)coreIDVServiceProviderName
{
  return self->_coreIDVServiceProviderName;
}

- (void)setCoreIDVServiceProviderName:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preliminaryAssessmentIdentifier, 0);
  objc_storeStrong((id *)&self->_invitationDetails, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_coreIDVServiceProviderName, 0);
  objc_storeStrong((id *)&self->_businessChatIdentifier, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_applicationTermsIdentifier, 0);
  objc_storeStrong((id *)&self->_declineDetails, 0);
  objc_storeStrong((id *)&self->_applicationOfferDetails, 0);
  objc_storeStrong((id *)&self->_referenceIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBaseURL, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end