@interface PKAccountWebserviceInstallmentBindResponse
- (NSString)bindToken;
- (PKAccountWebserviceInstallmentBindResponse)initWithData:(id)a3;
@end

@implementation PKAccountWebserviceInstallmentBindResponse

- (PKAccountWebserviceInstallmentBindResponse)initWithData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PKAccountWebserviceInstallmentBindResponse;
  v3 = [(PKWebServiceResponse *)&v16 initWithData:a3];
  v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  v5 = [(PKWebServiceResponse *)v3 JSONObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138543618;
      v18 = v11;
      __int16 v19 = 2114;
      v20 = v13;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

LABEL_10:
    }
LABEL_11:

    v8 = 0;
    goto LABEL_12;
  }
  uint64_t v6 = [v5 PKStringForKey:@"bindToken"];
  bindToken = v4->_bindToken;
  v4->_bindToken = (NSString *)v6;

  if (!v4->_bindToken)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138543362;
      v18 = v11;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected bindToken", buf, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_11;
  }

LABEL_5:
  v8 = v4;
LABEL_12:

  return v8;
}

- (NSString)bindToken
{
  return self->_bindToken;
}

- (void).cxx_destruct
{
}

@end