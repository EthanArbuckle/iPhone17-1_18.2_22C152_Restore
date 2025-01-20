@interface PKApplyWebServiceRequest
+ (BOOL)supportsSecureCoding;
- (NSDictionary)experimentDetails;
- (NSString)referrerIdentifier;
- (PKApplyWebServiceRequest)initWithCoder:(id)a3;
- (id)_createMutableBody;
- (id)_murlRequestWithServiceURL:(id)a3 endpointComponents:(id)a4 queryParameters:(id)a5 appleAccountInformation:(id)a6;
- (id)_murlRequestWithURL:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setExperimentDetails:(id)a3;
- (void)setReferrerIdentifier:(id)a3;
@end

@implementation PKApplyWebServiceRequest

- (PKApplyWebServiceRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKApplyWebServiceRequest;
  v5 = [(PKOverlayableWebServiceRequest *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referrerIdentifier"];
    referrerIdentifier = v5->_referrerIdentifier;
    v5->_referrerIdentifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"experimentDetails"];
    experimentDetails = v5->_experimentDetails;
    v5->_experimentDetails = (NSDictionary *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceRequest;
  id v4 = a3;
  [(PKOverlayableWebServiceRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_referrerIdentifier, @"referrerIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_experimentDetails forKey:@"experimentDetails"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_murlRequestWithServiceURL:(id)a3 endpointComponents:(id)a4 queryParameters:(id)a5 appleAccountInformation:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)PKApplyWebServiceRequest;
  uint64_t v6 = [(PKPaymentWebServiceRequest *)&v8 _murlRequestWithServiceURL:a3 version:@"1" endpointComponents:a4 queryParameters:a5 appleAccountInformation:a6];
  return v6;
}

- (id)_murlRequestWithURL:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKApplyWebServiceRequest;
  id v4 = [(PKPaymentWebServiceRequest *)&v8 _murlRequestWithURL:a3];
  objc_super v5 = v4;
  referrerIdentifier = self->_referrerIdentifier;
  if (referrerIdentifier) {
    [v4 setValue:referrerIdentifier forHTTPHeaderField:@"x-apple-referrer-identifier"];
  }
  return v5;
}

- (id)_createMutableBody
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  experimentDetails = self->_experimentDetails;
  if (experimentDetails) {
    [v3 setObject:experimentDetails forKeyedSubscript:@"experiment"];
  }
  return v4;
}

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (void)setReferrerIdentifier:(id)a3
{
}

- (NSDictionary)experimentDetails
{
  return self->_experimentDetails;
}

- (void)setExperimentDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentDetails, 0);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
}

@end