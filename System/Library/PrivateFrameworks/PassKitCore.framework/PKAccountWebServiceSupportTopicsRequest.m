@interface PKAccountWebServiceSupportTopicsRequest
- (NSString)accountIdentifier;
- (NSURL)baseURL;
- (PKPaymentTransaction)transaction;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation PKAccountWebServiceSupportTopicsRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    v7 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138543618;
    v23 = v15;
    __int16 v24 = 2082;
    v25 = "_baseURL";
LABEL_12:
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_13;
  }
  if (!v4)
  {
    v7 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    v16 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138543618;
    v23 = v15;
    __int16 v24 = 2082;
    v25 = "appleAccountInformation";
    goto LABEL_12;
  }
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier)
  {
    v21[0] = @"accounts";
    v21[1] = accountIdentifier;
    v21[2] = @"supportTopics";
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
    transaction = self->_transaction;
    if (transaction)
    {
      uint64_t v9 = PKAccountSupportTopicTransactionSubtypeForTransaction(transaction);
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v11 = PKPaymentTransactionTypeToString([(PKPaymentTransaction *)self->_transaction transactionType]);
      [v10 setObject:v11 forKey:@"transactionType"];

      v12 = PKAccountSupportTopicTransactionSubtypeToString(v9);
      [v10 setObject:v12 forKey:@"transactionSubType"];

      v13 = PKPaymentTransactionStatusToString([(PKPaymentTransaction *)self->_transaction transactionStatus]);
      [v10 setObject:v13 forKey:@"transactionStatus"];
    }
    else
    {
      id v10 = 0;
    }
    v19 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:self->_baseURL endpointComponents:v7 queryParameters:v10 appleAccountInformation:v5];
    [v19 setHTTPMethod:@"GET"];
    [v19 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    v18 = (void *)[v19 copy];

    goto LABEL_16;
  }
  v7 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v17);
    *(_DWORD *)buf = 138543618;
    v23 = v15;
    __int16 v24 = 2082;
    v25 = "_accountIdentifier";
    goto LABEL_12;
  }
LABEL_13:
  v18 = 0;
LABEL_16:

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

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end