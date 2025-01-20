@interface PKAccountWebServiceBalanceHistoryRequest
- (NSDate)beginDate;
- (NSDate)endDate;
- (NSString)accountIdentifier;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (unint64_t)type;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setBeginDate:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKAccountWebServiceBalanceHistoryRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138543618;
    v25 = v19;
    __int16 v26 = 2082;
    v27 = "_baseURL";
LABEL_22:
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_23;
  }
  if (!v4)
  {
    v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    v20 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v20);
    *(_DWORD *)buf = 138543618;
    v25 = v19;
    __int16 v26 = 2082;
    v27 = "appleAccountInformation";
    goto LABEL_22;
  }
  if (!self->_accountIdentifier)
  {
    v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138543618;
      v25 = v19;
      __int16 v26 = 2082;
      v27 = "_accountIdentifier";
      goto LABEL_22;
    }
LABEL_23:
    v17 = 0;
    goto LABEL_24;
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
  unint64_t type = self->_type;
  if (type)
  {
    v12 = @"day";
    if (type != 1) {
      v12 = 0;
    }
    if (type == 2) {
      v13 = @"tenMinutes";
    }
    else {
      v13 = v12;
    }
    [v6 setObject:v13 forKey:@"type"];
  }
  accountIdentifier = self->_accountIdentifier;
  v23[0] = @"accounts";
  v23[1] = accountIdentifier;
  v23[2] = @"balanceHistory";
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  v16 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:self->_baseURL endpointComponents:v15 queryParameters:v6 appleAccountInformation:v5];
  [v16 setHTTPMethod:@"GET"];
  [v16 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v17 = (void *)[v16 copy];

LABEL_24:
  return v17;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
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

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end