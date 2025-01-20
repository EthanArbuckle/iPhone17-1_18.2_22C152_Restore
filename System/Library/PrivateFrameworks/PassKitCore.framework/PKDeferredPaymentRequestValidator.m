@interface PKDeferredPaymentRequestValidator
+ (Class)validatedClass;
+ (id)validatorWithObject:(id)a3;
- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4;
- (BOOL)isValidWithError:(id *)a3;
- (NSString)currencyCode;
- (PKDeferredPaymentRequest)deferredPaymentRequest;
- (PKDeferredPaymentRequestValidator)initWithDeferredPaymentRequest:(id)a3;
- (void)setCurrencyCode:(id)a3;
@end

@implementation PKDeferredPaymentRequestValidator

+ (id)validatorWithObject:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDeferredPaymentRequest:v3];

  return v4;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKDeferredPaymentRequestValidator)initWithDeferredPaymentRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDeferredPaymentRequestValidator;
  v6 = [(PKDeferredPaymentRequestValidator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_deferredPaymentRequest, a3);
  }

  return v7;
}

- (BOOL)isValidWithError:(id *)a3
{
  return [(PKDeferredPaymentRequestValidator *)self isValidWithAPIType:0 withError:a3];
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v9) = 0;
    id v10 = 0;
    if (!a4) {
      goto LABEL_21;
    }
    goto LABEL_17;
  }
  deferredPaymentRequest = self->_deferredPaymentRequest;
  uint64_t v8 = objc_opt_class();
  id v41 = 0;
  LODWORD(v9) = _PKPaymentValidateProperty(deferredPaymentRequest, @"paymentDescription", v8, 1, a3, (uint64_t)&v41);
  id v10 = v41;
  if (!v9)
  {
LABEL_16:
    if (!a4) {
      goto LABEL_21;
    }
    goto LABEL_17;
  }
  v11 = self->_deferredPaymentRequest;
  uint64_t v12 = objc_opt_class();
  id v40 = v10;
  int v13 = _PKPaymentValidateProperty(v11, @"billingAgreement", v12, 0, a3, (uint64_t)&v40);
  id v14 = v40;

  if (!v13) {
    goto LABEL_15;
  }
  v15 = self->_deferredPaymentRequest;
  uint64_t v16 = objc_opt_class();
  id v39 = v14;
  LODWORD(v9) = _PKPaymentValidateProperty(v15, @"managementURL", v16, 1, a3, (uint64_t)&v39);
  id v10 = v39;

  if (!v9) {
    goto LABEL_16;
  }
  v17 = self->_deferredPaymentRequest;
  uint64_t v18 = objc_opt_class();
  id v38 = v10;
  int v19 = _PKPaymentValidateProperty(v17, @"tokenNotificationURL", v18, 0, a3, (uint64_t)&v38);
  id v14 = v38;

  if (!v19)
  {
LABEL_15:
    LOBYTE(v9) = 0;
    id v10 = v14;
    goto LABEL_16;
  }
  v20 = self->_deferredPaymentRequest;
  uint64_t v21 = objc_opt_class();
  id v37 = v14;
  LODWORD(v9) = _PKPaymentValidateProperty(v20, @"deferredBilling", v21, 1, a3, (uint64_t)&v37);
  id v10 = v37;

  if (!v9) {
    goto LABEL_16;
  }
  v22 = [(PKDeferredPaymentRequest *)self->_deferredPaymentRequest deferredBilling];
  v23 = [(PKPaymentSummaryItemValidator *)[PKDeferredPaymentSummaryItemValidator alloc] initWithPaymentSummaryItem:v22];
  v24 = [(PKDeferredPaymentRequestValidator *)self currencyCode];
  [(PKPaymentSummaryItemValidator *)v23 setCurrencyCode:v24];

  id v36 = v10;
  LODWORD(v24) = [(PKDeferredPaymentSummaryItemValidator *)v23 isValidWithAPIType:a3 withError:&v36];
  id v25 = v36;

  if (v24)
  {
    v26 = [(PKDeferredPaymentRequest *)self->_deferredPaymentRequest freeCancellationDate];
    BOOL v27 = v26 == 0;

    v28 = [(PKDeferredPaymentRequest *)self->_deferredPaymentRequest freeCancellationDateTimeZone];
    BOOL v29 = v28 != 0;

    if ((v27 ^ v29))
    {
      uint64_t v9 = [(PKDeferredPaymentRequest *)self->_deferredPaymentRequest deferredBilling];
      id v30 = [(id)v9 deferredDate];

      uint64_t v31 = [(PKDeferredPaymentRequest *)self->_deferredPaymentRequest freeCancellationDate];
      v32 = (void *)v31;
      LOBYTE(v9) = 1;
      if (v30 && v31 && [v30 compare:v31] == -1)
      {
        uint64_t v9 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [(id)v9 setObject:@"A deferred payment request's deferred billing date cannot be before its freeCancellationDate" forKey:*MEMORY[0x1E4F28568]];
        uint64_t v33 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v9];

        LOBYTE(v9) = 0;
        id v25 = (id)v33;
      }
    }
    else
    {
      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v30];
      LOBYTE(v9) = 0;
      v32 = v25;
      id v25 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  id v10 = v25;
  if (a4)
  {
LABEL_17:
    if ((v9 & 1) == 0)
    {
      id v34 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v34 setObject:@"Invalid deferred payment request" forKey:*MEMORY[0x1E4F28568]];
      if (v10) {
        [v34 setObject:v10 forKey:*MEMORY[0x1E4F28A50]];
      }
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v34];
    }
  }
LABEL_21:

  return v9;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (PKDeferredPaymentRequest)deferredPaymentRequest
{
  return self->_deferredPaymentRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredPaymentRequest, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
}

@end