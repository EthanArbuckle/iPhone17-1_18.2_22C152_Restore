@interface PKAccountWebServiceDocumentRequest
- (NSDate)beginDate;
- (NSDate)endDate;
- (NSString)accountIdentifier;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (int64_t)type;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setBeginDate:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PKAccountWebServiceDocumentRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    *(_DWORD *)buf = 138543618;
    v26 = v20;
    __int16 v27 = 2082;
    v28 = "_baseURL";
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
    v21 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v21);
    *(_DWORD *)buf = 138543618;
    v26 = v20;
    __int16 v27 = 2082;
    v28 = "appleAccountInformation";
    goto LABEL_22;
  }
  if (!self->_accountIdentifier)
  {
    v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      __int16 v27 = 2082;
      v28 = "_accountIdentifier";
      goto LABEL_22;
    }
LABEL_23:
    v18 = 0;
    goto LABEL_24;
  }
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  int64_t type = self->_type;
  v8 = @"statement";
  if (type != 1) {
    v8 = 0;
  }
  if (type == 2) {
    v9 = @"taxForm";
  }
  else {
    v9 = v8;
  }
  v10 = v9;
  if (v10) {
    [v6 setObject:v10 forKey:@"documentType"];
  }
  beginDate = self->_beginDate;
  if (beginDate)
  {
    v12 = PKISO8601DateStringFromDate(beginDate);
    [v6 setObject:v12 forKey:@"beginDate"];
  }
  endDate = self->_endDate;
  if (endDate)
  {
    v14 = PKISO8601DateStringFromDate(endDate);
    [v6 setObject:v14 forKey:@"endDate"];
  }
  accountIdentifier = self->_accountIdentifier;
  v24[0] = @"accounts";
  v24[1] = accountIdentifier;
  v24[2] = @"documents";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
  v17 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:self->_baseURL endpointComponents:v16 queryParameters:v6 appleAccountInformation:v5];
  [v17 setHTTPMethod:@"GET"];
  [v17 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v18 = (void *)[v17 copy];

LABEL_24:
  return v18;
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

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end