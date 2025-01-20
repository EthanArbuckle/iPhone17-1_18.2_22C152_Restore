@interface PKApplyWebServiceVerificationSubmissionRequest
+ (BOOL)supportsSecureCoding;
- (NSString)applicationIdentifier;
- (NSString)odiAssessment;
- (NSURL)baseURL;
- (PKApplyVerificationInformation)verificationInfo;
- (PKApplyWebServiceVerificationSubmissionRequest)initWithCoder:(id)a3;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (int64_t)channel;
- (unint64_t)featureIdentifier;
- (unint64_t)verificationType;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setChannel:(int64_t)a3;
- (void)setFeatureIdentifier:(unint64_t)a3;
- (void)setOdiAssessment:(id)a3;
- (void)setVerificationInfo:(id)a3;
- (void)setVerificationType:(unint64_t)a3;
@end

@implementation PKApplyWebServiceVerificationSubmissionRequest

- (PKApplyWebServiceVerificationSubmissionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKApplyWebServiceVerificationSubmissionRequest;
  v5 = [(PKApplyWebServiceRequest *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationIdentifier"];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseURL"];
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v8;

    v5->_featureIdentifier = [v4 decodeIntegerForKey:@"featureIdentifier"];
    v5->_verificationType = [v4 decodeIntegerForKey:@"verificationType"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"verificationInfo"];
    verificationInfo = v5->_verificationInfo;
    v5->_verificationInfo = (PKApplyVerificationInformation *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"odiAssessment"];
    odiAssessment = v5->_odiAssessment;
    v5->_odiAssessment = (NSString *)v12;

    v5->_channel = [v4 decodeIntegerForKey:@"channel"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceVerificationSubmissionRequest;
  id v4 = a3;
  [(PKApplyWebServiceRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationIdentifier, @"applicationIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_baseURL forKey:@"baseURL"];
  [v4 encodeInteger:self->_featureIdentifier forKey:@"featureIdentifier"];
  [v4 encodeInteger:self->_verificationType forKey:@"verificationType"];
  [v4 encodeObject:self->_verificationInfo forKey:@"verificationInfo"];
  [v4 encodeObject:self->_odiAssessment forKey:@"odiAssessment"];
  [v4 encodeInteger:self->_channel forKey:@"channel"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(0xDuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138543618;
      v32 = v10;
      __int16 v33 = 2082;
      v34 = "appleAccountInformation";
      goto LABEL_15;
    }
LABEL_16:
    id v14 = 0;
    goto LABEL_24;
  }
  if (!self->_verificationType)
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(0xDuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138543618;
      v32 = v10;
      __int16 v33 = 2082;
      v34 = "_verificationType";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  verificationInfo = self->_verificationInfo;
  if (!verificationInfo)
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(0xDuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138543618;
      v32 = v10;
      __int16 v33 = 2082;
      v34 = "_verificationInfo";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (![(PKApplyVerificationInformation *)verificationInfo skippedVerification])
  {
    unint64_t verificationType = self->_verificationType;
    if (verificationType >= 2)
    {
      if (verificationType == 2)
      {
        objc_super v15 = [(PKApplyVerificationInformation *)self->_verificationInfo trialDeposits];

        if (!v15)
        {
          uint64_t v8 = PKLogFacilityTypeGetObject(0xDuLL);
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_16;
          }
          v29 = (objc_class *)objc_opt_class();
          uint64_t v10 = NSStringFromClass(v29);
          *(_DWORD *)buf = 138543618;
          v32 = v10;
          __int16 v33 = 2082;
          v34 = "[_verificationInfo trialDeposits]";
          goto LABEL_15;
        }
      }
    }
    else
    {
      v7 = [(PKApplyVerificationInformation *)self->_verificationInfo data];

      if (!v7)
      {
        uint64_t v8 = PKLogFacilityTypeGetObject(0xDuLL);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = (objc_class *)objc_opt_class();
          uint64_t v10 = NSStringFromClass(v9);
          *(_DWORD *)buf = 138543618;
          v32 = v10;
          __int16 v33 = 2082;
          v34 = "[_verificationInfo data]";
LABEL_15:
          _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

          goto LABEL_16;
        }
        goto LABEL_16;
      }
    }
  }
  baseURL = self->_baseURL;
  applicationIdentifier = self->_applicationIdentifier;
  v30[0] = @"applications";
  v30[1] = applicationIdentifier;
  v30[2] = @"verification";
  v30[3] = @"submit";
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
  uint64_t v8 = [(PKApplyWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v18 queryParameters:0 appleAccountInformation:v4];

  [v8 setHTTPMethod:@"POST"];
  [v8 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v19 = [(PKApplyWebServiceRequest *)self _createMutableBody];
  v20 = PKApplyVerificationTypeToString(self->_verificationType);
  [v19 setObject:v20 forKey:@"verificationType"];

  v21 = objc_msgSend(NSNumber, "numberWithBool:", -[PKApplyVerificationInformation skippedVerification](self->_verificationInfo, "skippedVerification"));
  [v19 setObject:v21 forKey:@"skippedVerification"];

  v22 = [(PKApplyVerificationInformation *)self->_verificationInfo data];
  [v19 safelySetObject:v22 forKey:@"verificationData"];

  v23 = [(PKApplyVerificationInformation *)self->_verificationInfo trialDeposits];
  [v19 safelySetObject:v23 forKey:@"trialDeposits"];

  odiAssessment = self->_odiAssessment;
  if (odiAssessment) {
    [v19 setObject:odiAssessment forKey:@"odiAssessment"];
  }
  int64_t channel = self->_channel;
  if (channel)
  {
    v26 = PKFeatureApplicationChannelToString(channel);
    [v19 setObject:v26 forKeyedSubscript:@"channel"];
  }
  v27 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v19];
  [v8 setHTTPBody:v27];

  id v14 = [v8 copy];
LABEL_24:

  return v14;
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

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (PKApplyVerificationInformation)verificationInfo
{
  return self->_verificationInfo;
}

- (void)setVerificationInfo:(id)a3
{
}

- (unint64_t)verificationType
{
  return self->_verificationType;
}

- (void)setVerificationType:(unint64_t)a3
{
  self->_unint64_t verificationType = a3;
}

- (NSString)odiAssessment
{
  return self->_odiAssessment;
}

- (void)setOdiAssessment:(id)a3
{
}

- (int64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(int64_t)a3
{
  self->_int64_t channel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odiAssessment, 0);
  objc_storeStrong((id *)&self->_verificationInfo, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end