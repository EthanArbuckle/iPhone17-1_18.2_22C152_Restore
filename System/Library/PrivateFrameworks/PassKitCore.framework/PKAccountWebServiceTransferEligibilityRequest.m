@interface PKAccountWebServiceTransferEligibilityRequest
- (NSString)accountIdentifier;
- (NSURL)baseURL;
- (PKCurrencyAmount)currencyAmount;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (unint64_t)type;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setCurrencyAmount:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKAccountWebServiceTransferEligibilityRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PKAccountWebServiceTransferEligibilityRequest *)self baseURL];
  if (!v5)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138543618;
    v25 = v17;
    __int16 v26 = 2082;
    v27 = "baseURL";
LABEL_17:
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_18;
  }
  if (!v4)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    v18 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138543618;
    v25 = v17;
    __int16 v26 = 2082;
    v27 = "appleAccountInformation";
    goto LABEL_17;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    v19 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v19);
    *(_DWORD *)buf = 138543618;
    v25 = v17;
    __int16 v26 = 2082;
    v27 = "_accountIdentifier";
    goto LABEL_17;
  }
  if (!self->_currencyAmount)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    v20 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v20);
    *(_DWORD *)buf = 138543618;
    v25 = v17;
    __int16 v26 = 2082;
    v27 = "_currencyAmount";
    goto LABEL_17;
  }
  if (self->_type)
  {
    v23[0] = @"accounts";
    v23[1] = accountIdentifier;
    v23[2] = @"transfers";
    v23[3] = @"eligibility";
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
    v8 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:v5 endpointComponents:v7 queryParameters:0 appleAccountInformation:v4];

    [v8 setHTTPMethod:@"POST"];
    [v8 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    v9 = [MEMORY[0x1E4F1CA60] dictionary];
    v10 = [(PKCurrencyAmount *)self->_currencyAmount amount];
    v11 = [v10 stringValue];
    [v9 setObject:v11 forKeyedSubscript:@"amount"];

    v12 = [(PKCurrencyAmount *)self->_currencyAmount currency];
    [v9 setObject:v12 forKeyedSubscript:@"currencyCode"];

    v13 = PKAccountTransferTypeToString(self->_type);
    [v9 setObject:v13 forKeyedSubscript:@"type"];

    v14 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v9];
    [v8 setHTTPBody:v14];

    id v15 = [v8 copy];
    goto LABEL_19;
  }
  v8 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v21);
    *(_DWORD *)buf = 138543618;
    v25 = v17;
    __int16 v26 = 2082;
    v27 = "_type";
    goto LABEL_17;
  }
LABEL_18:
  id v15 = 0;
LABEL_19:

  return v15;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (void)setCurrencyAmount:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end