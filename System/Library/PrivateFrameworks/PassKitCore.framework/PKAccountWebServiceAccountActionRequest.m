@interface PKAccountWebServiceAccountActionRequest
- (NSString)accountIdentifier;
- (NSString)accountUserAltDSID;
- (NSURL)baseURL;
- (PKAccountAction)action;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountUserAltDSID:(id)a3;
- (void)setAction:(id)a3;
- (void)setBaseURL:(id)a3;
@end

@implementation PKAccountWebServiceAccountActionRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    *(_DWORD *)buf = 138543618;
    v35 = v24;
    __int16 v36 = 2082;
    v37 = "_baseURL";
LABEL_23:
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_24;
  }
  if (!v4)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    v25 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v25);
    *(_DWORD *)buf = 138543618;
    v35 = v24;
    __int16 v36 = 2082;
    v37 = "appleAccountInformation";
    goto LABEL_23;
  }
  if (!self->_accountIdentifier)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    v26 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v26);
    *(_DWORD *)buf = 138543618;
    v35 = v24;
    __int16 v36 = 2082;
    v37 = "_accountIdentifier";
    goto LABEL_23;
  }
  action = self->_action;
  if (!action)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    v27 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v27);
    *(_DWORD *)buf = 138543618;
    v35 = v24;
    __int16 v36 = 2082;
    v37 = "_action";
    goto LABEL_23;
  }
  if (![(PKAccountAction *)action actionType])
  {
    v29 = [(PKAccountAction *)self->_action amount];

    if (!v29)
    {
      v10 = PKLogFacilityTypeGetObject(0xEuLL);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      v32 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v32);
      *(_DWORD *)buf = 138543618;
      v35 = v24;
      __int16 v36 = 2082;
      v37 = "[_action amount]";
      goto LABEL_23;
    }
    v30 = [(PKAccountAction *)self->_action currencyCode];

    if (v30) {
      goto LABEL_6;
    }
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v31 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v31);
      *(_DWORD *)buf = 138543618;
      v35 = v24;
      __int16 v36 = 2082;
      v37 = "[_action currencyCode]";
      goto LABEL_23;
    }
LABEL_24:
    id v22 = 0;
    goto LABEL_25;
  }
LABEL_6:
  baseURL = self->_baseURL;
  accountIdentifier = self->_accountIdentifier;
  v33[0] = @"accounts";
  v33[1] = accountIdentifier;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  v10 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v9 queryParameters:0 appleAccountInformation:v5];

  [v10 setHTTPMethod:@"POST"];
  [v10 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v11 = [MEMORY[0x1E4F1CA60] dictionary];
  v12 = PKAccountActionTypeToString([(PKAccountAction *)self->_action actionType]);
  [v11 setObject:v12 forKey:@"action"];

  accountUserAltDSID = self->_accountUserAltDSID;
  if (accountUserAltDSID) {
    [v11 setObject:accountUserAltDSID forKey:@"accountUserAltDSID"];
  }
  if (![(PKAccountAction *)self->_action actionType])
  {
    v14 = [(PKAccountAction *)self->_action amount];
    v15 = [v14 stringValue];
    [v11 setObject:v15 forKey:@"amount"];

    v16 = [(PKAccountAction *)self->_action currencyCode];
    [v11 setObject:v16 forKey:@"currencyCode"];

    v17 = [(PKAccountAction *)self->_action identifier];
    [v11 setObject:v17 forKey:@"identifier"];

    v18 = PKAccountRewardRedemptionTypeToString([(PKAccountAction *)self->_action redemptionType]);
    [v11 setObject:v18 forKey:@"rewardRedemptionType"];
  }
  if ([(PKAccountAction *)self->_action actionType] == 2)
  {
    v19 = PKAccountRewardRedemptionTypeToString([(PKAccountAction *)self->_action redemptionType]);
    [v11 setObject:v19 forKey:@"rewardRedemptionType"];

    v20 = [(PKAccountAction *)self->_action identifier];
    if ([v20 length]) {
      [v11 setObject:v20 forKey:@"identifier"];
    }
  }
  v21 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v11];
  [v10 setHTTPBody:v21];

  id v22 = [v10 copy];
LABEL_25:

  return v22;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)accountUserAltDSID
{
  return self->_accountUserAltDSID;
}

- (void)setAccountUserAltDSID:(id)a3
{
}

- (PKAccountAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
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
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_accountUserAltDSID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end