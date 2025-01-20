@interface PKAccountWebServiceTransfersRequest
- (NSDate)beginDate;
- (NSDate)endDate;
- (NSString)accountIdentifier;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (unint64_t)state;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setBeginDate:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation PKAccountWebServiceTransfersRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    *(_DWORD *)buf = 138543618;
    v24 = v18;
    __int16 v25 = 2082;
    v26 = "_baseURL";
LABEL_17:
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_18;
  }
  if (!v4)
  {
    v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    v19 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v19);
    *(_DWORD *)buf = 138543618;
    v24 = v18;
    __int16 v25 = 2082;
    v26 = "appleAccountInformation";
    goto LABEL_17;
  }
  if (!self->_accountIdentifier)
  {
    v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138543618;
      v24 = v18;
      __int16 v25 = 2082;
      v26 = "_accountIdentifier";
      goto LABEL_17;
    }
LABEL_18:
    v16 = 0;
    goto LABEL_19;
  }
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  beginDate = self->_beginDate;
  if (beginDate)
  {
    v8 = PKISO8601DateStringFromDate(beginDate);
    [v6 setObject:v8 forKey:@"beginDate"];
  }
  endDate = self->_endDate;
  if (endDate)
  {
    v10 = PKISO8601DateStringFromDate(endDate);
    [v6 setObject:v10 forKey:@"endDate"];
  }
  unint64_t state = self->_state;
  if (state)
  {
    v12 = PKAccountTransferStateStringForState(state);
    [v6 setObject:v12 forKey:@"state"];
  }
  accountIdentifier = self->_accountIdentifier;
  v22[0] = @"accounts";
  v22[1] = accountIdentifier;
  v22[2] = @"transfers";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  v15 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:self->_baseURL endpointComponents:v14 queryParameters:v6 appleAccountInformation:v5];
  [v15 setHTTPMethod:@"GET"];
  [v15 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v16 = (void *)[v15 copy];

LABEL_19:
  return v16;
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

- (NSDate)beginDate
{
  return self->_beginDate;
}

- (void)setBeginDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_unint64_t state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end