@interface PKPaymentOfferWebServiceDynamicContentRequest
- (NSArray)types;
- (NSString)criteriaIdentifier;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setCriteriaIdentifier:(id)a3;
- (void)setTypes:(id)a3;
@end

@implementation PKPaymentOfferWebServiceDynamicContentRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    v9 = PKLogFacilityTypeGetObject(6uLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138543618;
    v21 = v15;
    __int16 v22 = 2082;
    v23 = "_baseURL";
LABEL_13:
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_14;
  }
  criteriaIdentifier = self->_criteriaIdentifier;
  if (!criteriaIdentifier)
  {
    v9 = PKLogFacilityTypeGetObject(6uLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    v16 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138543618;
    v21 = v15;
    __int16 v22 = 2082;
    v23 = "_criteriaIdentifier";
    goto LABEL_13;
  }
  if (!v4)
  {
    v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138543618;
      v21 = v15;
      __int16 v22 = 2082;
      v23 = "appleAccountInformation";
      goto LABEL_13;
    }
LABEL_14:
    id v13 = 0;
    goto LABEL_15;
  }
  v19[0] = @"paymentOfferDynamicContent";
  v19[1] = criteriaIdentifier;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v9 = [(PKPaymentOfferWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v8 queryParameters:0 appleAccountInformation:v5];

  [v9 setHTTPMethod:@"POST"];
  [v9 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v11 = [(NSArray *)self->_types pk_createArrayBySafelyApplyingBlock:&__block_literal_global_98];
  [v10 setObject:v11 forKeyedSubscript:@"types"];

  if (v10)
  {
    v12 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v10];
    [v9 setHTTPBody:v12];
  }
  id v13 = [v9 copy];

LABEL_15:
  return v13;
}

__CFString *__88__PKPaymentOfferWebServiceDynamicContentRequest__urlRequestWithAppleAccountInformation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 integerValue];
  return PKPaymentOfferDynamicContentPageTypeToString(v2);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (NSString)criteriaIdentifier
{
  return self->_criteriaIdentifier;
}

- (void)setCriteriaIdentifier:(id)a3
{
}

- (NSArray)types
{
  return self->_types;
}

- (void)setTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_criteriaIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end