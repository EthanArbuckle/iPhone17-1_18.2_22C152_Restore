@interface PKPeerPaymentPreferencesResponse
- (PKPeerPaymentPreferences)peerPaymentPreferences;
- (PKPeerPaymentPreferencesResponse)initWithData:(id)a3;
@end

@implementation PKPeerPaymentPreferencesResponse

- (PKPeerPaymentPreferencesResponse)initWithData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentPreferencesResponse;
  v3 = [(PKWebServiceResponse *)&v16 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      v7 = [PKPeerPaymentPreferences alloc];
      v8 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v9 = [(PKPeerPaymentPreferences *)v7 initWithDictionary:v6 lastUpdated:v8];

      peerPaymentPreferences = v4->_peerPaymentPreferences;
      v4->_peerPaymentPreferences = (PKPeerPaymentPreferences *)v9;
    }
    else
    {
      v8 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138543618;
        v18 = v12;
        __int16 v19 = 2114;
        v20 = v14;
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
      }
    }
  }
  return v4;
}

- (PKPeerPaymentPreferences)peerPaymentPreferences
{
  return self->_peerPaymentPreferences;
}

- (void).cxx_destruct
{
}

@end