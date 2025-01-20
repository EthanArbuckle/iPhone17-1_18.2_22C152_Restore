@interface PKPaymentConfigurationResponse
- (NSData)data;
- (NSData)signature;
- (NSDictionary)configuration;
- (NSString)version;
- (PKPaymentConfigurationResponse)initWithData:(id)a3;
@end

@implementation PKPaymentConfigurationResponse

- (PKPaymentConfigurationResponse)initWithData:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentConfigurationResponse;
  v3 = [(PKWebServiceResponse *)&v19 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 objectForKey:@"data"];
      if (v6)
      {
        uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
        data = v4->_data;
        v4->_data = (NSData *)v7;
      }
      v9 = [v5 objectForKey:@"signature"];
      if (v9)
      {
        uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v9 options:0];
        signature = v4->_signature;
        v4->_signature = (NSData *)v10;
      }
      uint64_t v12 = [v5 objectForKey:@"version"];
      version = v4->_version;
      v4->_version = (NSString *)v12;
    }
    else
    {
      v9 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        v16 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v21 = v15;
        __int16 v22 = 2112;
        v23 = v16;
        id v17 = v16;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      v6 = v4;
      v4 = 0;
    }
  }
  return v4;
}

- (NSData)data
{
  return self->_data;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSString)version
{
  return self->_version;
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end