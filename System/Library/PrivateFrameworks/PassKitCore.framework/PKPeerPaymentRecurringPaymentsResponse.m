@interface PKPeerPaymentRecurringPaymentsResponse
- (NSArray)recurringPayments;
- (PKPeerPaymentRecurringPaymentsResponse)initWithData:(id)a3 productTimeZone:(id)a4;
@end

@implementation PKPeerPaymentRecurringPaymentsResponse

- (PKPeerPaymentRecurringPaymentsResponse)initWithData:(id)a3 productTimeZone:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PKPeerPaymentRecurringPaymentsResponse;
  v7 = [(PKWebServiceResponse *)&v31 initWithData:a3];
  v8 = v7;
  if (v7)
  {
    v9 = [(PKWebServiceResponse *)v7 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = v9;
      v10 = v9;
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v13 = [v10 PKArrayForKey:@"recurringPayments"];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v34 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = [[PKPeerPaymentRecurringPayment alloc] initWithDictionary:*(void *)(*((void *)&v27 + 1) + 8 * i) productTimeZone:v6];
            if ([(PKPeerPaymentRecurringPayment *)v18 status]) {
              v19 = v11;
            }
            else {
              v19 = v12;
            }
            [v19 addObject:v18];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v34 count:16];
        }
        while (v15);
      }

      uint64_t v20 = [v11 copy];
      recurringPayments = v8->_recurringPayments;
      v8->_recurringPayments = (NSArray *)v20;

      v9 = v26;
      if ([v12 count])
      {
        v22 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v12;
          _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentRecurringPaymentsResponse: received recurring payments with unknown status %@", buf, 0xCu);
        }
      }
    }
    else
    {
      v10 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (objc_class *)objc_opt_class();
        v24 = NSStringFromClass(v23);
        *(_DWORD *)buf = 138543362;
        id v33 = v24;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Malformed PKPeerPaymentRecurringPaymentsResponse: expected dictionary and received %{public}@", buf, 0xCu);
      }
    }
  }
  return v8;
}

- (NSArray)recurringPayments
{
  return self->_recurringPayments;
}

- (void).cxx_destruct
{
}

@end