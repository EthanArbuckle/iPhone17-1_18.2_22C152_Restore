@interface PKAccountWebServiceCreditRecoveryPaymentPlansResponse
- (NSArray)paymentPlans;
- (PKAccountWebServiceCreditRecoveryPaymentPlansResponse)initWithData:(id)a3;
@end

@implementation PKAccountWebServiceCreditRecoveryPaymentPlansResponse

- (PKAccountWebServiceCreditRecoveryPaymentPlansResponse)initWithData:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v49.receiver = self;
  v49.super_class = (Class)PKAccountWebServiceCreditRecoveryPaymentPlansResponse;
  v3 = [(PKWebServiceResponse *)&v49 initWithData:a3];
  v4 = v3;
  if (!v3)
  {
LABEL_20:
    v24 = v4;
    goto LABEL_28;
  }
  v5 = [(PKWebServiceResponse *)v3 JSONObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 PKArrayForKey:@"eligiblePaymentPlans"];
    v39 = v5;
    v40 = [v5 PKArrayForKey:@"enrolledPaymentPlans"];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v46;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v46 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v45 + 1) + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v29 = PKLogFacilityTypeGetObject(0xEuLL);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              v30 = (objc_class *)objc_opt_class();
              v31 = NSStringFromClass(v30);
              v32 = (objc_class *)objc_opt_class();
              v33 = NSStringFromClass(v32);
              *(_DWORD *)buf = 138543618;
              v53 = v31;
              __int16 v54 = 2114;
              v55 = v33;
              _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected eligible plan to be dictionary and received %{public}@", buf, 0x16u);
            }
            v15 = v8;
LABEL_26:
            v5 = v39;

            goto LABEL_27;
          }
          v14 = [[PKCreditRecoveryPaymentPlan alloc] initWithDictionary:v13 enrolled:0];
          [v7 addObject:v14];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v45 objects:v51 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v15 = v40;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v42;
      while (2)
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v42 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v41 + 1) + 8 * v19);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v29 = PKLogFacilityTypeGetObject(0xEuLL);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              v35 = (objc_class *)objc_opt_class();
              v36 = NSStringFromClass(v35);
              v37 = (objc_class *)objc_opt_class();
              v38 = NSStringFromClass(v37);
              *(_DWORD *)buf = 138543618;
              v53 = v36;
              __int16 v54 = 2114;
              v55 = v38;
              _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected enrolled plan to be dictionary and received %{public}@", buf, 0x16u);
            }
            goto LABEL_26;
          }
          v21 = [[PKCreditRecoveryPaymentPlan alloc] initWithDictionary:v20 enrolled:1];
          [v7 addObject:v21];

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v41 objects:v50 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    uint64_t v22 = [v7 copy];
    paymentPlans = v4->_paymentPlans;
    v4->_paymentPlans = (NSArray *)v22;

    goto LABEL_20;
  }
  v8 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    *(_DWORD *)buf = 138543618;
    v53 = v26;
    __int16 v54 = 2114;
    v55 = v28;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
  }
LABEL_27:

  v24 = 0;
LABEL_28:

  return v24;
}

- (NSArray)paymentPlans
{
  return self->_paymentPlans;
}

- (void).cxx_destruct
{
}

@end