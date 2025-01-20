@interface PKPrivacyDeviceAssessmentRetrieveStateResponse
- (NSNumber)privacyUiState;
- (PKPrivacyDeviceAssessmentRetrieveStateResponse)initWithData:(id)a3;
- (void)setPrivacyUiState:(id)a3;
@end

@implementation PKPrivacyDeviceAssessmentRetrieveStateResponse

- (PKPrivacyDeviceAssessmentRetrieveStateResponse)initWithData:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)PKPrivacyDeviceAssessmentRetrieveStateResponse;
  v3 = [(PKWebServiceResponse *)&v14 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 PKNumberForKey:@"privacyUiState"];
      privacyUiState = v4->_privacyUiState;
      v4->_privacyUiState = (NSNumber *)v6;
    }
    else
    {
      v8 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        v11 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v16 = v10;
        __int16 v17 = 2112;
        v18 = v11;
        id v12 = v11;
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      privacyUiState = v4;
      v4 = 0;
    }
  }
  return v4;
}

- (NSNumber)privacyUiState
{
  return self->_privacyUiState;
}

- (void)setPrivacyUiState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end