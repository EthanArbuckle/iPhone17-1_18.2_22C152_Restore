@interface PKPaymentDeviceCheckInResponse
- (PKPaymentDeviceCheckInResponse)initWithData:(id)a3;
- (int64_t)action;
- (void)setAction:(int64_t)a3;
@end

@implementation PKPaymentDeviceCheckInResponse

- (PKPaymentDeviceCheckInResponse)initWithData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentDeviceCheckInResponse;
  v3 = [(PKWebServiceResponse *)&v16 initWithData:a3];
  v4 = v3;
  if (!v3) {
    goto LABEL_21;
  }
  v5 = [(PKWebServiceResponse *)v3 JSONObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 PKStringForKey:@"deviceAction"];
    if (v6)
    {
      v7 = v6;
      if ([v6 isEqualToString:@"updateConfig"])
      {
        uint64_t v8 = 1;
      }
      else if ([v7 isEqualToString:@"updateRegistration"])
      {
        uint64_t v8 = 2;
      }
      else if ([v7 isEqualToString:@"reRegister"])
      {
        uint64_t v8 = 3;
      }
      else if ([v7 isEqualToString:@"checkInRequiresAuth"])
      {
        uint64_t v8 = 4;
      }
      else
      {
        if (([v7 isEqualToString:@"reRegisterPeerPayment"] & 1) == 0)
        {
LABEL_20:

LABEL_21:
          v14 = v4;
          goto LABEL_22;
        }
        uint64_t v8 = 5;
      }
      v4->_action = v8;
      goto LABEL_20;
    }
    v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Error: Device check in did not return an action", buf, 2u);
    }
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
      v18 = v11;
      __int16 v19 = 2112;
      v20 = v12;
      id v13 = v12;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
    }
  }

  v14 = 0;
LABEL_22:

  return v14;
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

@end