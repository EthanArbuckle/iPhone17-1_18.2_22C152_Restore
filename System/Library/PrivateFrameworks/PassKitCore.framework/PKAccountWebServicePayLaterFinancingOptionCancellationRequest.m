@interface PKAccountWebServicePayLaterFinancingOptionCancellationRequest
- (NSError)error;
- (NSString)accountIdentifier;
- (NSString)optionIdentifier;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (unint64_t)reason;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setError:(id)a3;
- (void)setOptionIdentifier:(id)a3;
- (void)setReason:(unint64_t)a3;
@end

@implementation PKAccountWebServicePayLaterFinancingOptionCancellationRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138543618;
    v25 = v19;
    __int16 v26 = 2082;
    v27 = "_baseURL";
LABEL_13:
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_14;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    v20 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v20);
    *(_DWORD *)buf = 138543618;
    v25 = v19;
    __int16 v26 = 2082;
    v27 = "_accountIdentifier";
    goto LABEL_13;
  }
  optionIdentifier = self->_optionIdentifier;
  if (!optionIdentifier)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138543618;
      v25 = v19;
      __int16 v26 = 2082;
      v27 = "_optionIdentifier";
      goto LABEL_13;
    }
LABEL_14:
    id v17 = 0;
    goto LABEL_15;
  }
  v23[0] = @"accounts";
  v23[1] = accountIdentifier;
  v23[2] = @"financingOptions";
  v23[3] = optionIdentifier;
  v23[4] = @"cancel";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:5];
  v9 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v8 queryParameters:0 appleAccountInformation:v4];

  [v9 setHTTPMethod:@"POST"];
  [v9 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v11 = PKPayLaterFinancingOptionCancellationReasonToString(self->_reason);
  [v10 setObject:v11 forKeyedSubscript:@"reason"];

  error = self->_error;
  if (error)
  {
    v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSError code](error, "code"));
    [v10 setObject:v13 forKeyedSubscript:@"errorCode"];

    v14 = [(NSError *)self->_error domain];
    [v10 setObject:v14 forKeyedSubscript:@"errorDomain"];

    v15 = [(NSError *)self->_error description];
    [v10 setObject:v15 forKeyedSubscript:@"errorDescription"];
  }
  v16 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v10];
  [v9 setHTTPBody:v16];

  id v17 = [v9 copy];
LABEL_15:

  return v17;
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

- (NSString)optionIdentifier
{
  return self->_optionIdentifier;
}

- (void)setOptionIdentifier:(id)a3
{
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_optionIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end