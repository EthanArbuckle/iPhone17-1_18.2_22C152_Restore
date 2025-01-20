@interface PKApplyWebServiceTermsRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)termsAccepted;
- (NSString)applicationIdentifier;
- (NSString)applicationTermsIdentifier;
- (NSString)odiAssessment;
- (NSString)offerTermsIdentifier;
- (NSString)pathIdentifier;
- (NSString)pathTermsIdentifier;
- (NSURL)baseURL;
- (PKApplyWebServiceRequestAuthenticationContext)authenticationContext;
- (PKApplyWebServiceTermsRequest)initWithCoder:(id)a3;
- (PKPaymentDeviceMetadata)deviceMetadata;
- (PKPaymentInstallmentConfiguration)installmentConfiguration;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setApplicationTermsIdentifier:(id)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setDeviceMetadata:(id)a3;
- (void)setInstallmentConfiguration:(id)a3;
- (void)setOdiAssessment:(id)a3;
- (void)setOfferTermsIdentifier:(id)a3;
- (void)setPathIdentifier:(id)a3;
- (void)setPathTermsIdentifier:(id)a3;
- (void)setTermsAccepted:(BOOL)a3;
@end

@implementation PKApplyWebServiceTermsRequest

- (PKApplyWebServiceTermsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKApplyWebServiceTermsRequest;
  v5 = [(PKApplyWebServiceRequest *)&v27 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationIdentifier"];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v6;

    v5->_termsAccepted = [v4 decodeBoolForKey:@"termsAccepted"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseURL"];
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationTermsIdentifier"];
    applicationTermsIdentifier = v5->_applicationTermsIdentifier;
    v5->_applicationTermsIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"offerTermsIdentifier"];
    offerTermsIdentifier = v5->_offerTermsIdentifier;
    v5->_offerTermsIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pathTermsIdentifier"];
    pathTermsIdentifier = v5->_pathTermsIdentifier;
    v5->_pathTermsIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pathIdentifier"];
    pathIdentifier = v5->_pathIdentifier;
    v5->_pathIdentifier = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceMetadata"];
    deviceMetadata = v5->_deviceMetadata;
    v5->_deviceMetadata = (PKPaymentDeviceMetadata *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentConfiguration"];
    installmentConfiguration = v5->_installmentConfiguration;
    v5->_installmentConfiguration = (PKPaymentInstallmentConfiguration *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"odiAssessment"];
    odiAssessment = v5->_odiAssessment;
    v5->_odiAssessment = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authenticationContext"];
    authenticationContext = v5->_authenticationContext;
    v5->_authenticationContext = (PKApplyWebServiceRequestAuthenticationContext *)v24;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceTermsRequest;
  id v4 = a3;
  [(PKApplyWebServiceRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationIdentifier, @"applicationIdentifier", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_termsAccepted forKey:@"termsAccepted"];
  [v4 encodeObject:self->_baseURL forKey:@"baseURL"];
  [v4 encodeObject:self->_applicationTermsIdentifier forKey:@"applicationTermsIdentifier"];
  [v4 encodeObject:self->_offerTermsIdentifier forKey:@"offerTermsIdentifier"];
  [v4 encodeObject:self->_pathTermsIdentifier forKey:@"pathTermsIdentifier"];
  [v4 encodeObject:self->_pathIdentifier forKey:@"pathIdentifier"];
  [v4 encodeObject:self->_deviceMetadata forKey:@"deviceMetadata"];
  [v4 encodeObject:self->_installmentConfiguration forKey:@"installmentConfiguration"];
  [v4 encodeObject:self->_odiAssessment forKey:@"odiAssessment"];
  [v4 encodeObject:self->_authenticationContext forKey:@"authenticationContext"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = v4;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    v9 = PKLogFacilityTypeGetObject(0xDuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    uint64_t v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138543618;
    v33 = v13;
    __int16 v34 = 2082;
    v35 = "_baseURL";
LABEL_12:
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_13;
  }
  if (!v4)
  {
    v9 = PKLogFacilityTypeGetObject(0xDuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    uint64_t v14 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138543618;
    v33 = v13;
    __int16 v34 = 2082;
    v35 = "appleAccountInformation";
    goto LABEL_12;
  }
  applicationIdentifier = self->_applicationIdentifier;
  if (!applicationIdentifier)
  {
    v9 = PKLogFacilityTypeGetObject(0xDuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138543618;
      v33 = v13;
      __int16 v34 = 2082;
      v35 = "_applicationIdentifier";
      goto LABEL_12;
    }
LABEL_13:
    id v16 = 0;
    goto LABEL_32;
  }
  v31[0] = @"applications";
  v31[1] = applicationIdentifier;
  v31[2] = @"terms";
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];
  v9 = [(PKApplyWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v8 queryParameters:0 appleAccountInformation:v5];

  [v9 setHTTPMethod:@"POST"];
  [v9 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  uint64_t v10 = [(PKApplyWebServiceRequest *)self _createMutableBody];
  v11 = v10;
  if (self->_applicationTermsIdentifier || self->_offerTermsIdentifier) {
    objc_msgSend(v10, "setObject:forKey:");
  }
  pathTermsIdentifier = self->_pathTermsIdentifier;
  if (pathTermsIdentifier) {
    [v11 setObject:pathTermsIdentifier forKey:@"pathTermsIdentifier"];
  }
  pathIdentifier = self->_pathIdentifier;
  if (pathIdentifier) {
    [v11 setObject:pathIdentifier forKey:@"pathIdentifier"];
  }
  v19 = [NSNumber numberWithBool:self->_termsAccepted];
  [v11 setObject:v19 forKey:@"termsAccepted"];

  uint64_t v20 = [(PKPaymentDeviceMetadata *)self->_deviceMetadata dictionaryRepresentation];
  if (v20) {
    [v11 setObject:v20 forKey:@"deviceMetadata"];
  }
  installmentConfiguration = self->_installmentConfiguration;
  if (installmentConfiguration) {
    [(PKPaymentInstallmentConfiguration *)installmentConfiguration encodeToBodyDictionary:v11];
  }
  odiAssessment = self->_odiAssessment;
  if (odiAssessment) {
    [v11 setObject:odiAssessment forKey:@"odiAssessment"];
  }
  authenticationContext = self->_authenticationContext;
  if (!authenticationContext) {
    goto LABEL_31;
  }
  uint64_t v24 = [(PKApplyWebServiceRequestAuthenticationContext *)authenticationContext certificates];
  if (![v24 count]) {
    goto LABEL_30;
  }
  v25 = [(PKApplyWebServiceRequestAuthenticationContext *)self->_authenticationContext signature];

  if (v25)
  {
    v26 = [(PKApplyWebServiceRequestAuthenticationContext *)self->_authenticationContext certificates];
    uint64_t v24 = objc_msgSend(v26, "pk_arrayByApplyingBlock:", &__block_literal_global_571);

    [v11 setObject:v24 forKeyedSubscript:@"certificates"];
    objc_super v27 = [(PKApplyWebServiceRequestAuthenticationContext *)self->_authenticationContext signature];
    v28 = [v27 base64EncodedStringWithOptions:0];
    [v11 setObject:v28 forKeyedSubscript:@"signature"];

LABEL_30:
  }
LABEL_31:
  v29 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v11];
  [v9 setHTTPBody:v29];

  id v16 = [v9 copy];
LABEL_32:

  return v16;
}

uint64_t __72__PKApplyWebServiceTermsRequest__urlRequestWithAppleAccountInformation___block_invoke(uint64_t a1, void *a2)
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

- (NSString)applicationTermsIdentifier
{
  return self->_applicationTermsIdentifier;
}

- (void)setApplicationTermsIdentifier:(id)a3
{
}

- (NSString)offerTermsIdentifier
{
  return self->_offerTermsIdentifier;
}

- (void)setOfferTermsIdentifier:(id)a3
{
}

- (NSString)pathTermsIdentifier
{
  return self->_pathTermsIdentifier;
}

- (void)setPathTermsIdentifier:(id)a3
{
}

- (NSString)pathIdentifier
{
  return self->_pathIdentifier;
}

- (void)setPathIdentifier:(id)a3
{
}

- (BOOL)termsAccepted
{
  return self->_termsAccepted;
}

- (void)setTermsAccepted:(BOOL)a3
{
  self->_termsAccepted = a3;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (PKPaymentDeviceMetadata)deviceMetadata
{
  return self->_deviceMetadata;
}

- (void)setDeviceMetadata:(id)a3
{
}

- (PKPaymentInstallmentConfiguration)installmentConfiguration
{
  return self->_installmentConfiguration;
}

- (void)setInstallmentConfiguration:(id)a3
{
}

- (NSString)odiAssessment
{
  return self->_odiAssessment;
}

- (void)setOdiAssessment:(id)a3
{
}

- (PKApplyWebServiceRequestAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (void)setAuthenticationContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationContext, 0);
  objc_storeStrong((id *)&self->_odiAssessment, 0);
  objc_storeStrong((id *)&self->_installmentConfiguration, 0);
  objc_storeStrong((id *)&self->_deviceMetadata, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_pathIdentifier, 0);
  objc_storeStrong((id *)&self->_pathTermsIdentifier, 0);
  objc_storeStrong((id *)&self->_offerTermsIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationTermsIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end