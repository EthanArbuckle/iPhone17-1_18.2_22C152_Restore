@interface PKAccountWebServiceFinancingOptionsResponse
- (NSArray)acceptedFundingSources;
- (NSArray)lastUsedFundingSources;
- (NSString)sessionIdentifier;
- (PKAccountWebServiceFinancingOptionsResponse)initWithData:(id)a3;
- (PKPayLaterDynamicContent)dynamicContent;
- (PKPayLaterProductAssessmentCollection)assessmentCollection;
- (unint64_t)languageDisclosureLocation;
@end

@implementation PKAccountWebServiceFinancingOptionsResponse

- (PKAccountWebServiceFinancingOptionsResponse)initWithData:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  v69.receiver = self;
  v69.super_class = (Class)PKAccountWebServiceFinancingOptionsResponse;
  v3 = [(PKWebServiceResponse *)&v69 initWithData:a3];
  v4 = v3;
  if (!v3)
  {
LABEL_57:
    v30 = v4;
    goto LABEL_58;
  }
  v5 = [(PKWebServiceResponse *)v3 JSONObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 objectForKey:@"productAssessments"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      if ([v7 count])
      {
        v8 = [[PKPayLaterProductAssessmentCollection alloc] initWithArray:v7];
        assessmentCollection = v4->_assessmentCollection;
        v4->_assessmentCollection = v8;
      }
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v11 = [v5 objectForKey:@"acceptedFundingSources"];
      objc_opt_class();
      v60 = v11;
      v58 = v7;
      v59 = v4;
      if (objc_opt_isKindOfClass())
      {
        id v12 = v11;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v65 objects:v71 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v66;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v66 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v65 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v18 = v17;
                v19 = [[PKAccountPaymentFundingSource alloc] initWithDictionary:v18];

                [v10 safelyAddObject:v19];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v65 objects:v71 count:16];
          }
          while (v14);
        }

        v4 = v59;
      }
      uint64_t v20 = [v10 count];
      if (v20) {
        v21 = (void *)[v10 copy];
      }
      else {
        v21 = 0;
      }
      objc_storeStrong((id *)&v4->_acceptedFundingSources, v21);
      if (v20) {

      }
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v32 = [v5 objectForKey:@"lastUsedFundingSources"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v57 = v5;
        id v33 = v32;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v61 objects:v70 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v62;
          do
          {
            for (uint64_t j = 0; j != v35; ++j)
            {
              if (*(void *)v62 != v36) {
                objc_enumerationMutation(v33);
              }
              v38 = *(void **)(*((void *)&v61 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v39 = v38;
                v40 = [[PKPayLaterLastUsedFundingSource alloc] initWithDictionary:v39];

                [v31 safelyAddObject:v40];
              }
            }
            uint64_t v35 = [v33 countByEnumeratingWithState:&v61 objects:v70 count:16];
          }
          while (v35);
        }

        v7 = v58;
        v4 = v59;
        v5 = v57;
      }
      uint64_t v41 = [v31 count];
      if (v41) {
        v42 = (void *)[v31 copy];
      }
      else {
        v42 = 0;
      }
      objc_storeStrong((id *)&v4->_lastUsedFundingSources, v42);
      if (v41) {

      }
      v43 = [v5 objectForKey:@"dynamicContent"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v44 = [[PKPayLaterDynamicContent alloc] initWithDictionary:v43];
        dynamicContent = v4->_dynamicContent;
        v4->_dynamicContent = v44;
      }
      uint64_t v46 = [v5 PKStringForKey:@"sessionIdentifier"];
      sessionIdentifier = v4->_sessionIdentifier;
      v4->_sessionIdentifier = (NSString *)v46;

      v48 = v5;
      v49 = [v5 PKStringForKey:@"languageDisclosureLocation"];
      v50 = v49;
      BOOL v51 = 0;
      if (v49 != @"tabAction" && v49)
      {
        char v52 = [@"tabAction" isEqualToString:v49];

        if (v52)
        {
          BOOL v51 = 0;
        }
        else
        {
          v53 = v50;
          BOOL v51 = 1;
          if (v53 != @"continueAction")
          {
            v54 = v53;
            int v55 = [@"continueAction" isEqualToString:v53];

            if (!v55) {
              BOOL v51 = 0;
            }
          }
          v4 = v59;
        }
      }

      v4->_languageDisclosureLocation = v51;
      goto LABEL_57;
    }
    v23 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    v29 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v29);
    *(_DWORD *)buf = 138543362;
    v73 = v25;
    v26 = "Malformed productAssessments array: expected array and received %{public}@";
    v27 = v23;
    uint32_t v28 = 12;
LABEL_23:
    _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);

LABEL_24:
    goto LABEL_25;
  }
  v6 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    *(_DWORD *)buf = 138543618;
    v73 = v23;
    __int16 v74 = 2114;
    v75 = v25;
    v26 = "Malformed %{public}@: expected dictionary and received %{public}@";
    v27 = v6;
    uint32_t v28 = 22;
    goto LABEL_23;
  }
LABEL_25:

  v30 = 0;
LABEL_58:

  return v30;
}

- (PKPayLaterProductAssessmentCollection)assessmentCollection
{
  return self->_assessmentCollection;
}

- (NSArray)acceptedFundingSources
{
  return self->_acceptedFundingSources;
}

- (NSArray)lastUsedFundingSources
{
  return self->_lastUsedFundingSources;
}

- (PKPayLaterDynamicContent)dynamicContent
{
  return self->_dynamicContent;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (unint64_t)languageDisclosureLocation
{
  return self->_languageDisclosureLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_dynamicContent, 0);
  objc_storeStrong((id *)&self->_lastUsedFundingSources, 0);
  objc_storeStrong((id *)&self->_acceptedFundingSources, 0);
  objc_storeStrong((id *)&self->_assessmentCollection, 0);
}

@end