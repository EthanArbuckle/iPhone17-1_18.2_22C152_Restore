@interface PKAutomaticReloadPaymentRequestValidator
+ (Class)validatedClass;
+ (id)validatorWithObject:(id)a3;
- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4;
- (BOOL)isValidWithError:(id *)a3;
- (NSString)currencyCode;
- (PKAutomaticReloadPaymentRequest)automaticReloadPaymentRequest;
- (PKAutomaticReloadPaymentRequestValidator)initWithAutomaticReloadPaymentRequest:(id)a3;
- (unint64_t)requestType;
- (void)setCurrencyCode:(id)a3;
- (void)setRequestType:(unint64_t)a3;
@end

@implementation PKAutomaticReloadPaymentRequestValidator

+ (id)validatorWithObject:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAutomaticReloadPaymentRequest:v3];

  return v4;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKAutomaticReloadPaymentRequestValidator)initWithAutomaticReloadPaymentRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAutomaticReloadPaymentRequestValidator;
  v6 = [(PKAutomaticReloadPaymentRequestValidator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_automaticReloadPaymentRequest, a3);
  }

  return v7;
}

- (BOOL)isValidWithError:(id *)a3
{
  return [(PKAutomaticReloadPaymentRequestValidator *)self isValidWithAPIType:0 withError:a3];
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  unint64_t v7 = [(PKAutomaticReloadPaymentRequestValidator *)self requestType];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    automaticReloadPaymentRequest = self->_automaticReloadPaymentRequest;
    uint64_t v9 = objc_opt_class();
    id v35 = 0;
    int v10 = _PKPaymentValidateProperty(automaticReloadPaymentRequest, @"paymentDescription", v9, 1, a3, (uint64_t)&v35);
    id v11 = v35;
    if (v10)
    {
      v12 = self->_automaticReloadPaymentRequest;
      uint64_t v13 = objc_opt_class();
      id v34 = v11;
      int v14 = _PKPaymentValidateProperty(v12, @"billingAgreement", v13, 0, a3, (uint64_t)&v34);
      id v15 = v34;

      if (v14)
      {
        v16 = self->_automaticReloadPaymentRequest;
        uint64_t v17 = objc_opt_class();
        id v33 = v15;
        int v10 = _PKPaymentValidateProperty(v16, @"managementURL", v17, v7 != 8, a3, (uint64_t)&v33);
        id v11 = v33;

        if (v10)
        {
          v18 = self->_automaticReloadPaymentRequest;
          uint64_t v19 = objc_opt_class();
          id v32 = v11;
          int v20 = _PKPaymentValidateProperty(v18, @"tokenNotificationURL", v19, 0, a3, (uint64_t)&v32);
          id v21 = v32;

          if (v20)
          {
            v22 = self->_automaticReloadPaymentRequest;
            uint64_t v23 = objc_opt_class();
            id v31 = v21;
            int v10 = _PKPaymentValidateProperty(v22, @"automaticReloadBilling", v23, 1, a3, (uint64_t)&v31);
            id v11 = v31;

            if (v10)
            {
              v24 = [(PKAutomaticReloadPaymentRequest *)self->_automaticReloadPaymentRequest automaticReloadBilling];
              v25 = [(PKPaymentSummaryItemValidator *)[PKAutomaticReloadPaymentSummaryItemValidator alloc] initWithPaymentSummaryItem:v24];
              v26 = [(PKAutomaticReloadPaymentRequestValidator *)self currencyCode];
              [(PKPaymentSummaryItemValidator *)v25 setCurrencyCode:v26];

              id v30 = v11;
              LOBYTE(v10) = [(PKAutomaticReloadPaymentSummaryItemValidator *)v25 isValidWithAPIType:a3 withError:&v30];
              id v27 = v30;

              id v11 = v27;
            }
          }
          else
          {
            LOBYTE(v10) = 0;
            id v11 = v21;
          }
        }
      }
      else
      {
        LOBYTE(v10) = 0;
        id v11 = v15;
      }
    }
  }
  else
  {
    LOBYTE(v10) = 0;
    id v11 = 0;
  }
  if (a4 && (v10 & 1) == 0)
  {
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v28 setObject:@"Invalid automatic reload payment request" forKey:*MEMORY[0x1E4F28568]];
    if (v11) {
      [v28 setObject:v11 forKey:*MEMORY[0x1E4F28A50]];
    }
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v28];
  }
  return v10;
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (PKAutomaticReloadPaymentRequest)automaticReloadPaymentRequest
{
  return self->_automaticReloadPaymentRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automaticReloadPaymentRequest, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
}

@end