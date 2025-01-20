@interface PKPaymentRewrapResponseBase
- (NSData)rewrappedPaymentData;
- (NSString)primaryAccountNumberSuffix;
- (NSString)transactionIdentifier;
- (NSURL)issuerInstallmentManagementURL;
- (PKAccount)account;
- (PKPayLaterFinancingPlan)financingPlan;
- (PKPaymentRewardsRedemption)redemption;
- (PKPaymentRewrapResponseBase)initWithData:(id)a3;
- (void)setRewrappedPaymentData:(id)a3;
@end

@implementation PKPaymentRewrapResponseBase

- (PKPaymentRewrapResponseBase)initWithData:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v52.receiver = self;
  v52.super_class = (Class)PKPaymentRewrapResponseBase;
  v3 = [(PKWebServiceResponse *)&v52 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      p_super = [v5 objectForKey:@"header"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = [p_super PKStringForKey:@"transactionId"];
        transactionIdentifier = v4->_transactionIdentifier;
        v4->_transactionIdentifier = (NSString *)v7;
      }
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v10 = [v5 objectForKey:@"data"];
      [v9 safelySetObject:v10 forKey:@"data"];

      [v9 safelySetObject:p_super forKey:@"header"];
      v11 = [v5 objectForKey:@"signature"];
      [v9 safelySetObject:v11 forKey:@"signature"];

      v12 = [v5 objectForKey:@"version"];
      [v9 safelySetObject:v12 forKey:@"version"];

      id v51 = 0;
      v13 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v9 options:0 error:&v51];
      id v14 = v51;
      if (v13)
      {
        [(PKPaymentRewrapResponseBase *)v4 setRewrappedPaymentData:v13];
      }
      else
      {
        v21 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v54 = v22;
          __int16 v55 = 2112;
          id v56 = v14;
          id v23 = v22;
          _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "Could not create rewrappedPaymentData for %{public}@: %@", buf, 0x16u);
        }
      }
      uint64_t v24 = [v5 PKStringForKey:@"primaryAccountNumberSuffix"];
      primaryAccountNumberSuffix = v4->_primaryAccountNumberSuffix;
      v4->_primaryAccountNumberSuffix = (NSString *)v24;

      v26 = [v5 PKDictionaryForKey:@"financingPlan"];
      if (v26)
      {
        v27 = [[PKPayLaterFinancingPlan alloc] initWithDictionary:v26];
        financingPlan = v4->_financingPlan;
        v4->_financingPlan = v27;
      }
      v29 = [v5 PKDictionaryForKey:@"account"];
      if (v29)
      {
        v30 = [[PKAccount alloc] initWithDictionary:v29];
        account = v4->_account;
        v4->_account = v30;
      }
      v32 = [v5 PKDictionaryForKey:@"redemption"];
      if (v32)
      {
        v46 = [PKPaymentRewardsRedemption alloc];
        v33 = [v32 PKStringForKey:@"identifier"];
        [v32 PKStringForKey:@"balanceIdentifier"];
        v49 = v13;
        v34 = v47 = v5;
        [v32 PKStringForKey:@"status"];
        v35 = id v50 = v9;
        v36 = v29;
        v37 = v26;
        uint64_t v38 = PKPaymentRewardsRedemptionStatusFromString(v35);
        [v32 PKURLForKey:@"statusLink"];
        v39 = v48 = p_super;
        uint64_t v40 = v38;
        v26 = v37;
        v29 = v36;
        uint64_t v41 = [(PKPaymentRewardsRedemption *)v46 initWithIdentifier:v33 balanceIdentifier:v34 status:v40 statusLink:v39 paymentHash:v4->_transactionIdentifier];
        redemption = v4->_redemption;
        v4->_redemption = (PKPaymentRewardsRedemption *)v41;

        p_super = v48;
        id v9 = v50;

        v5 = v47;
        v13 = v49;
      }
      uint64_t v43 = [v5 PKURLForKey:@"issuerInstallmentManagementURL"];
      issuerInstallmentManagementURL = v4->_issuerInstallmentManagementURL;
      v4->_issuerInstallmentManagementURL = (NSURL *)v43;
    }
    else
    {
      if (v5 || ![(id)objc_opt_class() jsonDataOptional])
      {
        v16 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = (objc_class *)objc_opt_class();
          v18 = NSStringFromClass(v17);
          v19 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v54 = v18;
          __int16 v55 = 2112;
          id v56 = v19;
          id v20 = v19;
          _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
        }
        p_super = &v4->super.super.super;
        v4 = 0;
        goto LABEL_25;
      }
      p_super = PKLogFacilityTypeGetObject(6uLL);
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
LABEL_25:

        return v4;
      }
      v15 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v54 = v15;
      id v9 = v15;
      _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "No data received in re-wrap of %@ (which is allowed)", buf, 0xCu);
    }

    goto LABEL_25;
  }
  return v4;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (NSData)rewrappedPaymentData
{
  return self->_rewrappedPaymentData;
}

- (void)setRewrappedPaymentData:(id)a3
{
}

- (NSString)primaryAccountNumberSuffix
{
  return self->_primaryAccountNumberSuffix;
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (PKAccount)account
{
  return self->_account;
}

- (PKPaymentRewardsRedemption)redemption
{
  return self->_redemption;
}

- (NSURL)issuerInstallmentManagementURL
{
  return self->_issuerInstallmentManagementURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issuerInstallmentManagementURL, 0);
  objc_storeStrong((id *)&self->_redemption, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_primaryAccountNumberSuffix, 0);
  objc_storeStrong((id *)&self->_rewrappedPaymentData, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
}

@end