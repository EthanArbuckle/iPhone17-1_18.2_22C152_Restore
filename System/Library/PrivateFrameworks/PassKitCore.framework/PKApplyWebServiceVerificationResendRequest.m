@interface PKApplyWebServiceVerificationResendRequest
+ (BOOL)supportsSecureCoding;
- (NSString)applicationIdentifier;
- (NSURL)baseURL;
- (PKApplyWebServiceVerificationResendRequest)initWithCoder:(id)a3;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (unint64_t)verificationType;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setVerificationType:(unint64_t)a3;
@end

@implementation PKApplyWebServiceVerificationResendRequest

- (PKApplyWebServiceVerificationResendRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKApplyWebServiceVerificationResendRequest;
  v5 = [(PKApplyWebServiceRequest *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationIdentifier"];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseURL"];
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v8;

    v5->_verificationType = [v4 decodeIntegerForKey:@"verificationType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceVerificationResendRequest;
  id v4 = a3;
  [(PKApplyWebServiceRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationIdentifier, @"applicationIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_baseURL forKey:@"baseURL"];
  [v4 encodeInteger:self->_verificationType forKey:@"verificationType"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (self->_verificationType)
    {
      baseURL = self->_baseURL;
      applicationIdentifier = self->_applicationIdentifier;
      v17[0] = @"applications";
      v17[1] = applicationIdentifier;
      v17[2] = @"verification";
      v17[3] = @"resend";
      v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];
      uint64_t v8 = [(PKApplyWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v7 queryParameters:0 appleAccountInformation:v4];

      [v8 setHTTPMethod:@"POST"];
      [v8 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
      v9 = [(PKApplyWebServiceRequest *)self _createMutableBody];
      v10 = PKApplyVerificationTypeToString(self->_verificationType);
      [v9 setObject:v10 forKey:@"verificationType"];

      objc_super v11 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v9];
      [v8 setHTTPBody:v11];

      id v12 = [v8 copy];
      goto LABEL_10;
    }
    uint64_t v8 = PKLogFacilityTypeGetObject(0xDuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138543618;
      v19 = v14;
      __int16 v20 = 2082;
      v21 = "_verificationType";
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(0xDuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138543618;
      v19 = v14;
      __int16 v20 = 2082;
      v21 = "appleAccountInformation";
LABEL_8:
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);
    }
  }
  id v12 = 0;
LABEL_10:

  return v12;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (unint64_t)verificationType
{
  return self->_verificationType;
}

- (void)setVerificationType:(unint64_t)a3
{
  self->_verificationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end