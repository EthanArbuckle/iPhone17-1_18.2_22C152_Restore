@interface PKApplyWebServiceApplicationsRequest
+ (BOOL)supportsSecureCoding;
- (NSURL)applyServiceURL;
- (PKApplyWebServiceApplicationsRequest)initWithCoder:(id)a3;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setApplyServiceURL:(id)a3;
@end

@implementation PKApplyWebServiceApplicationsRequest

- (PKApplyWebServiceApplicationsRequest)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKApplyWebServiceApplicationsRequest;
  return [(PKApplyWebServiceRequest *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKApplyWebServiceApplicationsRequest;
  [(PKApplyWebServiceRequest *)&v3 encodeWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      v9 = [(PKApplyWebServiceRequest *)self _murlRequestWithServiceURL:v6 endpointComponents:&unk_1EE22AC28 queryParameters:0 appleAccountInformation:v7];
      [v9 setHTTPMethod:@"GET"];
      [v9 setCachePolicy:1];
      v10 = (void *)[v9 copy];

      goto LABEL_10;
    }
    v11 = PKLogFacilityTypeGetObject(0xDuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v14);
      int v16 = 138543618;
      v17 = v13;
      __int16 v18 = 2082;
      v19 = "appleAccountInformation";
      goto LABEL_8;
    }
  }
  else
  {
    v11 = PKLogFacilityTypeGetObject(0xDuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      int v16 = 138543618;
      v17 = v13;
      __int16 v18 = 2082;
      v19 = "url";
LABEL_8:
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v16, 0x16u);
    }
  }

  v10 = 0;
LABEL_10:

  return v10;
}

- (NSURL)applyServiceURL
{
  return self->_applyServiceURL;
}

- (void)setApplyServiceURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end