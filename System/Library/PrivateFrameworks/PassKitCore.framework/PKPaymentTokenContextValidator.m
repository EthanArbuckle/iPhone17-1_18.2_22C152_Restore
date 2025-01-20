@interface PKPaymentTokenContextValidator
+ (Class)validatedClass;
+ (id)validatorWithObject:(id)a3;
- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4;
- (BOOL)isValidWithError:(id *)a3;
- (NSString)currencyCode;
- (PKPaymentTokenContext)context;
- (PKPaymentTokenContextValidator)initWithPaymentTokenContext:(id)a3;
- (void)setCurrencyCode:(id)a3;
@end

@implementation PKPaymentTokenContextValidator

+ (id)validatorWithObject:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPaymentTokenContext:v3];

  return v4;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKPaymentTokenContextValidator)initWithPaymentTokenContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentTokenContextValidator;
  v6 = [(PKPaymentTokenContextValidator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (BOOL)isValidWithError:(id *)a3
{
  return [(PKPaymentTokenContextValidator *)self isValidWithAPIType:0 withError:a3];
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    context = self->_context;
    uint64_t v8 = objc_opt_class();
    id v36 = 0;
    int v9 = _PKPaymentValidateProperty(context, @"merchantIdentifier", v8, 1, a3, (uint64_t)&v36);
    id v10 = v36;
    if (!v9) {
      goto LABEL_14;
    }
    v11 = self->_context;
    uint64_t v12 = objc_opt_class();
    id v35 = v10;
    int v9 = _PKPaymentValidateProperty(v11, @"externalIdentifier", v12, 1, a3, (uint64_t)&v35);
    id v13 = v35;

    if (v9)
    {
      v14 = self->_context;
      uint64_t v15 = objc_opt_class();
      id v34 = v13;
      int v9 = _PKPaymentValidateProperty(v14, @"merchantName", v15, 1, a3, (uint64_t)&v34);
      id v10 = v34;

      if (!v9) {
        goto LABEL_14;
      }
      v16 = self->_context;
      uint64_t v17 = objc_opt_class();
      id v33 = v10;
      int v18 = _PKPaymentValidateProperty(v16, @"merchantDomain", v17, 0, a3, (uint64_t)&v33);
      id v13 = v33;

      if (v18)
      {
        v19 = self->_context;
        uint64_t v20 = objc_opt_class();
        id v32 = v13;
        int v9 = _PKPaymentValidateProperty(v19, @"amount", v20, 1, a3, (uint64_t)&v32);
        id v10 = v32;

        if (v9)
        {
          v21 = [(PKPaymentTokenContext *)self->_context amount];
          v22 = [MEMORY[0x1E4F28C28] notANumber];
          char v23 = [v21 isEqualToNumber:v22];

          if (v23)
          {
            LOBYTE(v9) = 0;
            if (!a4) {
              goto LABEL_20;
            }
          }
          else
          {
            v27 = [(PKPaymentTokenContextValidator *)self currencyCode];

            if (!v27)
            {
              LOBYTE(v9) = 1;
              goto LABEL_20;
            }
            v28 = [(PKPaymentTokenContext *)self->_context amount];
            v29 = [(PKPaymentTokenContextValidator *)self currencyCode];
            id v31 = v10;
            LOBYTE(v9) = _PKPaymentIsValidCurrencyAmount(v28, v29, &v31);
            id v30 = v31;

            id v10 = v30;
            if (!a4) {
              goto LABEL_20;
            }
          }
          goto LABEL_15;
        }
LABEL_14:
        if (!a4) {
          goto LABEL_20;
        }
        goto LABEL_15;
      }
      LOBYTE(v9) = 0;
    }
    id v10 = v13;
    goto LABEL_14;
  }
  LOBYTE(v9) = 0;
  id v10 = 0;
  if (!a4) {
    goto LABEL_20;
  }
LABEL_15:
  if ((v9 & 1) == 0)
  {
    if ((unint64_t)(a3 - 1) >= 2) {
      v24 = @"PKPaymentTokenContext invalid";
    }
    else {
      v24 = @"Payment token context invalid";
    }
    id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v25 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F28568]];
    [v25 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v25];

    LOBYTE(v9) = 0;
  }
LABEL_20:

  return v9;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (PKPaymentTokenContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
}

@end