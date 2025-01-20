@interface PKApplyWebServiceTermsDataRequest
+ (BOOL)supportsSecureCoding;
- (NSString)applicationIdentifier;
- (NSString)termsDataFormat;
- (NSString)termsIdentifier;
- (NSURL)baseURL;
- (PKApplyWebServiceTermsDataRequest)initWithCoder:(id)a3;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (unint64_t)featureIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setFeatureIdentifier:(unint64_t)a3;
- (void)setTermsDataFormat:(id)a3;
- (void)setTermsIdentifier:(id)a3;
@end

@implementation PKApplyWebServiceTermsDataRequest

- (PKApplyWebServiceTermsDataRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKApplyWebServiceTermsDataRequest;
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

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"termsDataFormat"];
    termsDataFormat = v5->_termsDataFormat;
    v5->_termsDataFormat = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceTermsDataRequest;
  id v4 = a3;
  [(PKApplyWebServiceRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationIdentifier, @"applicationIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_baseURL forKey:@"baseURL"];
  [v4 encodeObject:self->_termsIdentifier forKey:@"termsIdentifier"];
  [v4 encodeObject:self->_termsDataFormat forKey:@"termsDataFormat"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    v9 = PKLogFacilityTypeGetObject(0xDuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    uint64_t v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 138543618;
    v24 = v11;
    __int16 v25 = 2082;
    v26 = "_baseURL";
LABEL_12:
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_13;
  }
  termsIdentifier = self->_termsIdentifier;
  if (!termsIdentifier)
  {
    v9 = PKLogFacilityTypeGetObject(0xDuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    uint64_t v12 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138543618;
    v24 = v11;
    __int16 v25 = 2082;
    v26 = "_termsIdentifier";
    goto LABEL_12;
  }
  if (self->_termsDataFormat)
  {
    applicationIdentifier = self->_applicationIdentifier;
    if (applicationIdentifier)
    {
      v22[0] = @"applications";
      v22[1] = applicationIdentifier;
      v22[2] = @"termsData";
      v22[3] = termsIdentifier;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
      v9 = [(PKApplyWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v8 queryParameters:0 appleAccountInformation:v4];
    }
    else
    {
      uint64_t v8 = PKFeatureIdentifierToString(self->_featureIdentifier);
      objc_super v15 = self->_baseURL;
      v21[0] = @"applications";
      v21[1] = v8;
      v16 = self->_termsIdentifier;
      v21[2] = @"termsData";
      v21[3] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
      v9 = [(PKApplyWebServiceRequest *)self _murlRequestWithServiceURL:v15 endpointComponents:v17 queryParameters:0 appleAccountInformation:v4];
    }
    [v9 setHTTPMethod:@"POST"];
    [v9 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    v18 = [(PKApplyWebServiceRequest *)self _createMutableBody];
    [v18 setObject:self->_termsDataFormat forKey:@"format"];
    v19 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v18];
    [v9 setHTTPBody:v19];

    id v14 = [v9 copy];
    goto LABEL_16;
  }
  v9 = PKLogFacilityTypeGetObject(0xDuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138543618;
    v24 = v11;
    __int16 v25 = 2082;
    v26 = "_termsDataFormat";
    goto LABEL_12;
  }
LABEL_13:
  id v14 = 0;
LABEL_16:

  return v14;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
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

- (NSString)termsDataFormat
{
  return self->_termsDataFormat;
}

- (void)setTermsDataFormat:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsDataFormat, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end