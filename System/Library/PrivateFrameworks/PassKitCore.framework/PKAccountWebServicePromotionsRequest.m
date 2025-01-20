@interface PKAccountWebServicePromotionsRequest
- (NSDate)addedSinceDate;
- (NSString)accountIdentifier;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAddedSinceDate:(id)a3;
- (void)setBaseURL:(id)a3;
@end

@implementation PKAccountWebServicePromotionsRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    __int16 v21 = 2082;
    v22 = "_baseURL";
LABEL_13:
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_14;
  }
  if (!v4)
  {
    v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    v15 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    __int16 v21 = 2082;
    v22 = "appleAccountInformation";
    goto LABEL_13;
  }
  if (!self->_accountIdentifier)
  {
    v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138543618;
      v20 = v14;
      __int16 v21 = 2082;
      v22 = "_accountIdentifier";
      goto LABEL_13;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  addedSinceDate = self->_addedSinceDate;
  if (addedSinceDate)
  {
    v8 = PKW3CDateStringFromDate(addedSinceDate);
    [v6 setObject:v8 forKey:@"addedSinceDate"];
  }
  accountIdentifier = self->_accountIdentifier;
  v18[0] = @"accounts";
  v18[1] = accountIdentifier;
  v18[2] = @"promotions";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  v11 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:self->_baseURL endpointComponents:v10 queryParameters:v6 appleAccountInformation:v5];
  [v11 setHTTPMethod:@"GET"];
  [v11 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v12 = (void *)[v11 copy];

LABEL_15:
  return v12;
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

- (NSDate)addedSinceDate
{
  return self->_addedSinceDate;
}

- (void)setAddedSinceDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedSinceDate, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end