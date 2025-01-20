@interface PKPaymentActivationResponse
+ (id)responseWithData:(id)a3 forPass:(id)a4;
- (NSArray)verificationChannels;
- (NSDictionary)requiredVerificationFieldData;
- (NSString)previousStepIdentifier;
- (NSString)stepIdentifier;
- (NSURL)passURL;
- (PKPaymentActivationResponse)initWithData:(id)a3 forPass:(id)a4;
- (int64_t)verificationStatus;
- (void)setVerificationChannels:(id)a3;
- (void)setVerificationStatus:(int64_t)a3;
@end

@implementation PKPaymentActivationResponse

+ (id)responseWithData:(id)a3 forPass:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithData:v6 forPass:v5];

  return v7;
}

- (PKPaymentActivationResponse)initWithData:(id)a3 forPass:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v47.receiver = self;
  v47.super_class = (Class)PKPaymentActivationResponse;
  v7 = [(PKWebServiceResponse *)&v47 initWithData:a3];
  v8 = v7;
  if (!v7) {
    goto LABEL_39;
  }
  v9 = [(PKWebServiceResponse *)v7 JSONObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v9 objectForKeyedSubscript:@"status"];
    v11 = v10;
    if (v10)
    {
      v8->_verificationStatus = [v10 integerValue];
      uint64_t v12 = [v9 PKStringForKey:@"stepIdentifier"];
      stepIdentifier = v8->_stepIdentifier;
      v8->_stepIdentifier = (NSString *)v12;

      uint64_t v14 = [v9 PKStringForKey:@"previousStepIdentifier"];
      previousStepIdentifier = v8->_previousStepIdentifier;
      v8->_previousStepIdentifier = (NSString *)v14;

      verificationStatus = v8->_verificationStatus;
      if (verificationStatus != 1)
      {
        if (verificationStatus == 2)
        {
          v40 = v11;
          v42 = v8;
          v41 = v9;
          v24 = [v9 PKArrayContaining:objc_opt_class() forKey:@"methods"];
          v25 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v24, "count"));
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          v17 = v24;
          uint64_t v26 = [v17 countByEnumeratingWithState:&v43 objects:v52 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v44;
            do
            {
              for (uint64_t i = 0; i != v27; ++i)
              {
                if (*(void *)v44 != v28) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v30 = *(void *)(*((void *)&v43 + 1) + 8 * i);
                v31 = [v6 organizationName];
                v32 = +[PKVerificationChannel verificationChannelWithDictionary:v30 andOrganizationName:v31];

                [(NSArray *)v25 addObject:v32];
              }
              uint64_t v27 = [v17 countByEnumeratingWithState:&v43 objects:v52 count:16];
            }
            while (v27);
          }

          v8 = v42;
          verificationChannels = v42->_verificationChannels;
          v42->_verificationChannels = v25;
          v34 = v25;

          uint64_t v35 = [(NSArray *)v42->_verificationChannels count];
          if (v35)
          {
            v11 = v40;
            v9 = v41;
LABEL_37:

            goto LABEL_38;
          }
          v36 = PKLogFacilityTypeGetObject(6uLL);
          v11 = v40;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_190E10000, v36, OS_LOG_TYPE_DEFAULT, "Error: no verification channels returned", buf, 2u);
          }

          v9 = v41;
        }
        else
        {
          if (verificationStatus == 3)
          {
            v17 = [v9 objectForKey:@"passURL"];
            if (v17)
            {
              uint64_t v18 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v17];
              passURL = v8->_passURL;
              v8->_passURL = (NSURL *)v18;
            }
            if (!v8->_passURL)
            {
              v38 = PKLogFacilityTypeGetObject(6uLL);
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_190E10000, v38, OS_LOG_TYPE_DEFAULT, "Error: passURL malformed or empty", buf, 2u);
              }
            }
            goto LABEL_37;
          }
          v17 = PKLogFacilityTypeGetObject(0);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            v49 = verificationStatus;
            _os_log_error_impl(&dword_190E10000, v17, OS_LOG_TYPE_ERROR, "Error: unknown state for activation returned : %ldl", buf, 0xCu);
          }
        }
        goto LABEL_31;
      }
      objc_storeStrong((id *)&v8->_requiredVerificationFieldData, v9);
      if ([(NSDictionary *)v8->_requiredVerificationFieldData count])
      {
LABEL_38:

LABEL_39:
        v37 = v8;
        goto LABEL_40;
      }
      v17 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v23 = "Error: no verfication fields returned";
        goto LABEL_13;
      }
    }
    else
    {
      v17 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v23 = "Error: no verfication status returned";
LABEL_13:
        _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
      }
    }
LABEL_31:

    goto LABEL_32;
  }
  v11 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v20);
    v21 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v49 = v17;
    __int16 v50 = 2112;
    v51 = v21;
    id v22 = v21;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

    goto LABEL_31;
  }
LABEL_32:

  v37 = 0;
LABEL_40:

  return v37;
}

- (NSString)stepIdentifier
{
  return self->_stepIdentifier;
}

- (NSString)previousStepIdentifier
{
  return self->_previousStepIdentifier;
}

- (int64_t)verificationStatus
{
  return self->_verificationStatus;
}

- (void)setVerificationStatus:(int64_t)a3
{
  self->_verificationStatus = a3;
}

- (NSDictionary)requiredVerificationFieldData
{
  return self->_requiredVerificationFieldData;
}

- (NSArray)verificationChannels
{
  return self->_verificationChannels;
}

- (void)setVerificationChannels:(id)a3
{
}

- (NSURL)passURL
{
  return self->_passURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passURL, 0);
  objc_storeStrong((id *)&self->_verificationChannels, 0);
  objc_storeStrong((id *)&self->_requiredVerificationFieldData, 0);
  objc_storeStrong((id *)&self->_previousStepIdentifier, 0);
  objc_storeStrong((id *)&self->_stepIdentifier, 0);
}

@end