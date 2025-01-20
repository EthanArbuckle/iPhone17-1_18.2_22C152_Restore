@interface PKApplyWebServiceFeatureTermsDataRequest
+ (BOOL)supportsSecureCoding;
- (NSString)termsDataFormat;
- (NSString)termsIdentifier;
- (PKApplyWebServiceFeatureTermsDataRequest)initWithCoder:(id)a3;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (unint64_t)featureIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setFeatureIdentifier:(unint64_t)a3;
- (void)setTermsDataFormat:(id)a3;
- (void)setTermsIdentifier:(id)a3;
@end

@implementation PKApplyWebServiceFeatureTermsDataRequest

- (PKApplyWebServiceFeatureTermsDataRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKApplyWebServiceFeatureTermsDataRequest;
  v5 = [(PKApplyWebServiceRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_featureIdentifier = [v4 decodeIntegerForKey:@"featureIdentifier"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"termsDataFormat"];
    termsDataFormat = v5->_termsDataFormat;
    v5->_termsDataFormat = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceFeatureTermsDataRequest;
  id v4 = a3;
  [(PKApplyWebServiceRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_featureIdentifier, @"featureIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_termsDataFormat forKey:@"termsDataFormat"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_termsDataFormat)
  {
    v8 = PKFeatureIdentifierToString(self->_featureIdentifier);
    objc_super v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", @"applications", v8, @"termsData", 0);
    v10 = v9;
    if (self->_termsIdentifier) {
      objc_msgSend(v9, "addObject:");
    }
    v11 = [(PKApplyWebServiceRequest *)self _murlRequestWithServiceURL:v6 endpointComponents:v10 queryParameters:0 appleAccountInformation:v7];
    [v11 setHTTPMethod:@"POST"];
    [v11 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    v12 = [(PKApplyWebServiceRequest *)self _createMutableBody];
    [v12 setObject:self->_termsDataFormat forKey:@"format"];
    v13 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v12];
    [v11 setHTTPBody:v13];

    v14 = (void *)[v11 copy];
  }
  else
  {
    v15 = PKLogFacilityTypeGetObject(0xDuLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138543618;
      v20 = v17;
      __int16 v21 = 2082;
      v22 = "_termsDataFormat";
      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);
    }
    v14 = 0;
  }

  return v14;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(unint64_t)a3
{
  self->_featureIdentifier = a3;
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
}

@end