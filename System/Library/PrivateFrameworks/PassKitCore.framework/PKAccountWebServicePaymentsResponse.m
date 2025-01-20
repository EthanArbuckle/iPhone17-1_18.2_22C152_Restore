@interface PKAccountWebServicePaymentsResponse
- (NSArray)payments;
- (PKAccountWebServicePaymentsResponse)initWithData:(id)a3;
- (PKAccountWebServicePaymentsResponse)initWithData:(id)a3 account:(id)a4 request:(id)a5;
@end

@implementation PKAccountWebServicePaymentsResponse

- (PKAccountWebServicePaymentsResponse)initWithData:(id)a3
{
  return [(PKAccountWebServicePaymentsResponse *)self initWithData:a3 account:0 request:0];
}

- (PKAccountWebServicePaymentsResponse)initWithData:(id)a3 account:(id)a4 request:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)PKAccountWebServicePaymentsResponse;
  v8 = [(PKWebServiceResponse *)&v37 initWithData:a3];
  v9 = v8;
  if (!v8)
  {
LABEL_13:
    v24 = v9;
    goto LABEL_17;
  }
  v10 = [(PKWebServiceResponse *)v8 JSONObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v31 = v9;
    v11 = [v10 PKArrayForKey:@"payments"];
    v12 = [MEMORY[0x1E4F1CA48] array];
    id v32 = v7;
    v13 = [v7 creditDetails];
    v14 = [v13 productTimeZone];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v15 = v11;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v21 = v20;
            v22 = [[PKAccountPayment alloc] initWithDictionary:v21 productTimeZone:v14];
            [(NSArray *)v12 safelyAddObject:v22];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v17);
    }

    v9 = v31;
    payments = v31->_payments;
    v31->_payments = v12;

    id v7 = v32;
    goto LABEL_13;
  }
  v25 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    v28 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v28);
    *(_DWORD *)buf = 138543618;
    v40 = v27;
    __int16 v41 = 2114;
    v42 = v29;
    _os_log_impl(&dword_190E10000, v25, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
  }
  v24 = 0;
LABEL_17:

  return v24;
}

- (NSArray)payments
{
  return self->_payments;
}

- (void).cxx_destruct
{
}

@end