@interface PKRecurringPaymentRequestValidator
+ (Class)validatedClass;
+ (id)validatorWithObject:(id)a3;
- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4;
- (BOOL)isValidWithError:(id *)a3;
- (NSString)currencyCode;
- (PKRecurringPaymentRequest)recurringPaymentRequest;
- (PKRecurringPaymentRequestValidator)initWithRecurringPaymentRequest:(id)a3;
- (void)setCurrencyCode:(id)a3;
@end

@implementation PKRecurringPaymentRequestValidator

+ (id)validatorWithObject:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRecurringPaymentRequest:v3];

  return v4;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKRecurringPaymentRequestValidator)initWithRecurringPaymentRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKRecurringPaymentRequestValidator;
  v6 = [(PKRecurringPaymentRequestValidator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_recurringPaymentRequest, a3);
  }

  return v7;
}

- (BOOL)isValidWithError:(id *)a3
{
  return [(PKRecurringPaymentRequestValidator *)self isValidWithAPIType:0 withError:a3];
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v9 = 0;
    id v10 = 0;
    goto LABEL_11;
  }
  recurringPaymentRequest = self->_recurringPaymentRequest;
  uint64_t v8 = objc_opt_class();
  id v44 = 0;
  int v9 = _PKPaymentValidateProperty(recurringPaymentRequest, @"paymentDescription", v8, 1, a3, (uint64_t)&v44);
  id v10 = v44;
  if (v9)
  {
    v11 = self->_recurringPaymentRequest;
    uint64_t v12 = objc_opt_class();
    id v43 = v10;
    int v13 = _PKPaymentValidateProperty(v11, @"billingAgreement", v12, 0, a3, (uint64_t)&v43);
    id v14 = v43;

    if (!v13) {
      goto LABEL_10;
    }
    v15 = self->_recurringPaymentRequest;
    uint64_t v16 = objc_opt_class();
    id v42 = v14;
    int v9 = _PKPaymentValidateProperty(v15, @"managementURL", v16, 1, a3, (uint64_t)&v42);
    id v10 = v42;

    if (v9)
    {
      v17 = self->_recurringPaymentRequest;
      uint64_t v18 = objc_opt_class();
      id v41 = v10;
      int v19 = _PKPaymentValidateProperty(v17, @"tokenNotificationURL", v18, 0, a3, (uint64_t)&v41);
      id v14 = v41;

      if (!v19) {
        goto LABEL_10;
      }
      v20 = self->_recurringPaymentRequest;
      uint64_t v21 = objc_opt_class();
      id v40 = v14;
      int v9 = _PKPaymentValidateProperty(v20, @"regularBilling", v21, 1, a3, (uint64_t)&v40);
      id v10 = v40;

      if (v9)
      {
        v22 = self->_recurringPaymentRequest;
        uint64_t v23 = objc_opt_class();
        id v39 = v10;
        int v24 = _PKPaymentValidateProperty(v22, @"trialBilling", v23, 0, a3, (uint64_t)&v39);
        id v14 = v39;

        if (v24)
        {
          v25 = [(PKRecurringPaymentRequest *)self->_recurringPaymentRequest regularBilling];
          v26 = [(PKPaymentSummaryItemValidator *)[PKRecurringPaymentSummaryItemValidator alloc] initWithPaymentSummaryItem:v25];
          v27 = [(PKRecurringPaymentRequestValidator *)self currencyCode];
          [(PKPaymentSummaryItemValidator *)v26 setCurrencyCode:v27];

          id v38 = v14;
          int v9 = [(PKRecurringPaymentSummaryItemValidator *)v26 isValidWithAPIType:a3 withError:&v38];
          id v10 = v38;

          goto LABEL_11;
        }
LABEL_10:
        int v9 = 0;
        id v10 = v14;
      }
    }
  }
LABEL_11:
  uint64_t v28 = [(PKRecurringPaymentRequest *)self->_recurringPaymentRequest trialBilling];
  v29 = (void *)v28;
  if (v9 && v28)
  {
    v30 = [(PKPaymentSummaryItemValidator *)[PKRecurringPaymentSummaryItemValidator alloc] initWithPaymentSummaryItem:v28];
    v31 = [(PKRecurringPaymentRequestValidator *)self currencyCode];
    [(PKPaymentSummaryItemValidator *)v30 setCurrencyCode:v31];

    id v37 = v10;
    LOBYTE(v9) = [(PKRecurringPaymentSummaryItemValidator *)v30 isValidWithAPIType:a3 withError:&v37];
    id v32 = v37;

    id v10 = v32;
  }
  if (a4 && (v9 & 1) == 0)
  {
    id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v33 setObject:@"Invalid recurring payment request." forKeyedSubscript:*MEMORY[0x1E4F28568]];
    [v33 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    v34 = (void *)MEMORY[0x1E4F28C58];
    v35 = (void *)[v33 copy];
    *a4 = [v34 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v35];
  }
  return v9;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (PKRecurringPaymentRequest)recurringPaymentRequest
{
  return self->_recurringPaymentRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recurringPaymentRequest, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
}

@end