@interface PKAccountWebServiceAccountTransactionAnswerRequest
- (NSDictionary)answers;
- (NSString)accountIdentifier;
- (NSString)accountUserAltDSID;
- (NSString)transactionIdentifier;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountUserAltDSID:(id)a3;
- (void)setAnswers:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setTransactionIdentifier:(id)a3;
@end

@implementation PKAccountWebServiceAccountTransactionAnswerRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!PKRunningInPassd())
  {
    id v23 = 0;
    goto LABEL_31;
  }
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    v21 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    *(_DWORD *)buf = 138543618;
    v44 = v25;
    __int16 v45 = 2082;
    v46 = "_baseURL";
LABEL_28:
    _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_29;
  }
  if (!v4)
  {
    v21 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
    v26 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v26);
    *(_DWORD *)buf = 138543618;
    v44 = v25;
    __int16 v45 = 2082;
    v46 = "appleAccountInformation";
    goto LABEL_28;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    v21 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
    v27 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v27);
    *(_DWORD *)buf = 138543618;
    v44 = v25;
    __int16 v45 = 2082;
    v46 = "_accountIdentifier";
    goto LABEL_28;
  }
  transactionIdentifier = self->_transactionIdentifier;
  if (!transactionIdentifier)
  {
    v21 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
    v28 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v28);
    *(_DWORD *)buf = 138543618;
    v44 = v25;
    __int16 v45 = 2082;
    v46 = "_transactionIdentifier";
    goto LABEL_28;
  }
  if (self->_answers)
  {
    v42[0] = @"accounts";
    v42[1] = accountIdentifier;
    v42[2] = @"transactions";
    v42[3] = transactionIdentifier;
    v42[4] = @"answer";
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:5];
    id v33 = v4;
    v9 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v8 queryParameters:0 appleAccountInformation:v4];

    [v9 setHTTPMethod:@"POST"];
    v32 = v9;
    [v9 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSDictionary count](self->_answers, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obj = self->_answers;
    uint64_t v11 = [(NSDictionary *)obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          v39[0] = @"question";
          v16 = PKPaymentTransactionQuestionTypeToString(objc_msgSend(v15, "integerValue", v31));
          v39[1] = @"answer";
          v40[0] = v16;
          v17 = [(NSDictionary *)self->_answers objectForKey:v15];
          v40[1] = v17;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
          v19 = v18 = self;
          [v10 addObject:v19];

          self = v18;
        }
        uint64_t v12 = [(NSDictionary *)obj countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v12);
    }

    v20 = v31;
    [v31 setObject:v10 forKeyedSubscript:@"answers"];
    [v31 setObject:self->_accountUserAltDSID forKeyedSubscript:@"accountUserAltDSID"];
    v21 = v32;
    if (v31)
    {
      v22 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v31];
      [v32 setHTTPBody:v22];
    }
    id v23 = [v32 copy];

    id v4 = v33;
    goto LABEL_30;
  }
  v21 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v29 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v29);
    *(_DWORD *)buf = 138543618;
    v44 = v25;
    __int16 v45 = 2082;
    v46 = "_answers";
    goto LABEL_28;
  }
LABEL_29:
  id v23 = 0;
LABEL_30:

LABEL_31:
  return v23;
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

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void)setTransactionIdentifier:(id)a3
{
}

- (NSDictionary)answers
{
  return self->_answers;
}

- (void)setAnswers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_answers, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountUserAltDSID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end