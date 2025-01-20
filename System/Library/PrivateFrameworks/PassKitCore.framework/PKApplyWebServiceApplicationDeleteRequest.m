@interface PKApplyWebServiceApplicationDeleteRequest
+ (BOOL)supportsSecureCoding;
- (NSString)applicationIdentifier;
- (NSURL)baseURL;
- (PKApplyWebServiceApplicationDeleteRequest)initWithCoder:(id)a3;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
@end

@implementation PKApplyWebServiceApplicationDeleteRequest

- (PKApplyWebServiceApplicationDeleteRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKApplyWebServiceApplicationDeleteRequest;
  v5 = [(PKApplyWebServiceRequest *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationIdentifier"];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseURL"];
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceApplicationDeleteRequest;
  id v4 = a3;
  [(PKApplyWebServiceRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationIdentifier, @"applicationIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_baseURL forKey:@"baseURL"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = v4;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    v9 = PKLogFacilityTypeGetObject(0xDuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    objc_super v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    *(_DWORD *)buf = 138543618;
    v18 = v12;
    __int16 v19 = 2082;
    v20 = "_baseURL";
LABEL_11:
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_12;
  }
  if (!v4)
  {
    v9 = PKLogFacilityTypeGetObject(0xDuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    v13 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138543618;
    v18 = v12;
    __int16 v19 = 2082;
    v20 = "appleAccountInformation";
    goto LABEL_11;
  }
  applicationIdentifier = self->_applicationIdentifier;
  if (applicationIdentifier)
  {
    v16[0] = @"applications";
    v16[1] = applicationIdentifier;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    v9 = [(PKApplyWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v8 queryParameters:0 appleAccountInformation:v5];

    [v9 setHTTPMethod:@"DELETE"];
    id v10 = [v9 copy];
    goto LABEL_13;
  }
  v9 = PKLogFacilityTypeGetObject(0xDuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138543618;
    v18 = v12;
    __int16 v19 = 2082;
    v20 = "_applicationIdentifier";
    goto LABEL_11;
  }
LABEL_12:
  id v10 = 0;
LABEL_13:

  return v10;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end