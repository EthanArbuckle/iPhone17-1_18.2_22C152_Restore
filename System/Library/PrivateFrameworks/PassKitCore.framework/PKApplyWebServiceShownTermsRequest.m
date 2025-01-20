@interface PKApplyWebServiceShownTermsRequest
+ (BOOL)supportsSecureCoding;
- (NSString)applicationIdentifier;
- (NSString)termsIdentifier;
- (NSString)termsType;
- (NSURL)baseURL;
- (PKApplyWebServiceShownTermsRequest)initWithCoder:(id)a3;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setTermsIdentifier:(id)a3;
- (void)setTermsType:(id)a3;
@end

@implementation PKApplyWebServiceShownTermsRequest

- (PKApplyWebServiceShownTermsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKApplyWebServiceShownTermsRequest;
  v5 = [(PKApplyWebServiceRequest *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationIdentifier"];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseURL"];
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"termsIdentifier"];
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"termsType"];
    termsType = v5->_termsType;
    v5->_termsType = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceShownTermsRequest;
  id v4 = a3;
  [(PKApplyWebServiceRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationIdentifier, @"applicationIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_baseURL forKey:@"baseURL"];
  [v4 encodeObject:self->_termsIdentifier forKey:@"termsIdentifier"];
  [v4 encodeObject:self->_termsType forKey:@"termsType"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(0xDuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    uint64_t v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138543618;
    v20 = v13;
    __int16 v21 = 2082;
    v22 = "_baseURL";
LABEL_14:
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_15;
  }
  if (!self->_termsIdentifier)
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(0xDuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    v14 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138543618;
    v20 = v13;
    __int16 v21 = 2082;
    v22 = "_termsIdentifier";
    goto LABEL_14;
  }
  applicationIdentifier = self->_applicationIdentifier;
  if (!applicationIdentifier)
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(0xDuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    objc_super v15 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138543618;
    v20 = v13;
    __int16 v21 = 2082;
    v22 = "_applicationIdentifier";
    goto LABEL_14;
  }
  if (self->_termsType)
  {
    v18[0] = @"applications";
    v18[1] = applicationIdentifier;
    v18[2] = @"shownTerms";
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
    uint64_t v8 = [(PKApplyWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v7 queryParameters:0 appleAccountInformation:v4];

    [v8 setHTTPMethod:@"POST"];
    [v8 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    v9 = [(PKApplyWebServiceRequest *)self _createMutableBody];
    [v9 setObject:self->_termsType forKey:@"termsType"];
    [v9 setObject:self->_termsIdentifier forKey:@"termsIdentifier"];
    uint64_t v10 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v9];
    [v8 setHTTPBody:v10];

    id v11 = [v8 copy];
    goto LABEL_16;
  }
  uint64_t v8 = PKLogFacilityTypeGetObject(0xDuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138543618;
    v20 = v13;
    __int16 v21 = 2082;
    v22 = "_termsType";
    goto LABEL_14;
  }
LABEL_15:
  id v11 = 0;
LABEL_16:

  return v11;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSString)termsIdentifier
{
  return self->_termsIdentifier;
}

- (void)setTermsIdentifier:(id)a3
{
}

- (NSString)termsType
{
  return self->_termsType;
}

- (void)setTermsType:(id)a3
{
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_termsType, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end