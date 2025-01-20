@interface PKPaymentRemoteContentPassActionResponse
- (PKPaymentPassAction)updatedAction;
- (PKPaymentRemoteContentPassActionResponse)initWithExistingAction:(id)a3 pass:(id)a4 data:(id)a5;
- (void)setUpdatedAction:(id)a3;
@end

@implementation PKPaymentRemoteContentPassActionResponse

- (PKPaymentRemoteContentPassActionResponse)initWithExistingAction:(id)a3 pass:(id)a4 data:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentRemoteContentPassActionResponse;
  v10 = [(PKWebServiceResponse *)&v23 initWithData:a5];
  v11 = v10;
  if (v10)
  {
    v12 = [(PKWebServiceResponse *)v10 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v12;
      v14 = [v9 secureElementPass];
      v15 = [v14 actionLocalizations];
      uint64_t v16 = [v8 actionUpdatedWithDictionary:v13 localizations:v15];

      updatedAction = v11->_updatedAction;
      v11->_updatedAction = (PKPaymentPassAction *)v16;
    }
    else
    {
      v15 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (objc_class *)objc_opt_class();
        v19 = NSStringFromClass(v18);
        v20 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v25 = v19;
        __int16 v26 = 2112;
        v27 = v20;
        id v21 = v20;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      v14 = v11;
      v11 = 0;
    }
  }
  return v11;
}

- (PKPaymentPassAction)updatedAction
{
  return self->_updatedAction;
}

- (void)setUpdatedAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end