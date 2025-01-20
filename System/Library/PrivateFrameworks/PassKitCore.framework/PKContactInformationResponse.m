@interface PKContactInformationResponse
- (PKContactInformation)contactInformation;
- (PKContactInformationResponse)initWithData:(id)a3;
@end

@implementation PKContactInformationResponse

- (PKContactInformationResponse)initWithData:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)PKContactInformationResponse;
  v3 = [(PKWebServiceResponse *)&v15 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      v7 = [[PKContactInformation alloc] initWithDictionary:v6];

      contactInformation = v4->_contactInformation;
      v4->_contactInformation = v7;
    }
    else
    {
      v9 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v10);
        v12 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v17 = v11;
        __int16 v18 = 2112;
        v19 = v12;
        id v13 = v12;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      contactInformation = v4;
      v4 = 0;
    }
  }
  return v4;
}

- (PKContactInformation)contactInformation
{
  return self->_contactInformation;
}

- (void).cxx_destruct
{
}

@end