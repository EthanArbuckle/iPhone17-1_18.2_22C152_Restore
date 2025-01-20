@interface PKDisbursementPaymentRequestValidator
+ (Class)validatedClass;
+ (id)validatorWithObject:(id)a3;
+ (id)validatorWithObject:(id)a3 shouldSkipValidation:(BOOL)a4;
- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4;
- (BOOL)isValidWithError:(id *)a3;
- (BOOL)shouldSkipSummaryItemValidation;
- (NSString)currencyCode;
- (PKDisbursementPaymentRequest)disbursementPaymentRequest;
- (PKDisbursementPaymentRequestValidator)initWithDisbursementPaymentRequest:(id)a3;
- (PKDisbursementPaymentRequestValidator)initWithDisbursementPaymentRequest:(id)a3 shouldSkipSummaryItemValidation:(BOOL)a4;
- (void)setCurrencyCode:(id)a3;
@end

@implementation PKDisbursementPaymentRequestValidator

+ (id)validatorWithObject:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() validatorWithObject:v3 shouldSkipValidation:0];

  return v4;
}

+ (id)validatorWithObject:(id)a3 shouldSkipValidation:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDisbursementPaymentRequest:v5 shouldSkipSummaryItemValidation:v4];

  return v6;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKDisbursementPaymentRequestValidator)initWithDisbursementPaymentRequest:(id)a3
{
  return [(PKDisbursementPaymentRequestValidator *)self initWithDisbursementPaymentRequest:a3 shouldSkipSummaryItemValidation:0];
}

- (PKDisbursementPaymentRequestValidator)initWithDisbursementPaymentRequest:(id)a3 shouldSkipSummaryItemValidation:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDisbursementPaymentRequestValidator;
  v8 = [(PKDisbursementPaymentRequestValidator *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_disbursementPaymentRequest, a3);
    v9->_shouldSkipSummaryItemValidation = a4;
  }

  return v9;
}

- (BOOL)isValidWithError:(id *)a3
{
  return [(PKDisbursementPaymentRequestValidator *)self isValidWithAPIType:0 withError:a3];
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self->_shouldSkipSummaryItemValidation)
    {
      id v7 = 0;
      id v8 = 0;
      char v9 = 1;
      goto LABEL_20;
    }
    v10 = [(PKPaymentRequest *)self->_disbursementPaymentRequest paymentSummaryItems];
    objc_super v11 = [v10 firstObject];
    uint64_t v12 = objc_opt_class();
    LOBYTE(v12) = [(id)v12 isEqual:objc_opt_class()];

    if (v12)
    {
      v13 = [v10 lastObject];
      uint64_t v14 = objc_opt_class();
      LOBYTE(v14) = [(id)v14 isEqual:objc_opt_class()];

      if (v14)
      {
        PKMerchantCapability v15 = [(PKPaymentRequest *)self->_disbursementPaymentRequest merchantCapabilities];
        uint64_t v16 = objc_msgSend(v10, "pk_firstObjectPassingTest:", &__block_literal_global_146);
        v17 = (void *)v16;
        BOOL v18 = v16 != 0;
        if ((v15 & 0x80) == 0 || v16)
        {
          id v7 = 0;
          if ((v15 & 0x80) != 0 || !v16)
          {
LABEL_25:

            if (((v15 >> 7) & 1) == v18)
            {
              v26 = objc_msgSend(v10, "pk_objectsPassingTest:", &__block_literal_global_407);
              if ((unint64_t)[v26 count] < 2)
              {

                v26 = objc_msgSend(v10, "pk_objectsPassingTest:", &__block_literal_global_409);
                if ((unint64_t)[v26 count] < 2)
                {

                  aBlock[0] = MEMORY[0x1E4F143A8];
                  aBlock[1] = 3221225472;
                  aBlock[2] = __70__PKDisbursementPaymentRequestValidator_isValidWithAPIType_withError___block_invoke_4;
                  aBlock[3] = &unk_1E56ED228;
                  aBlock[4] = self;
                  v29 = _Block_copy(aBlock);
                  disbursementPaymentRequest = self->_disbursementPaymentRequest;
                  v31 = objc_opt_class();
                  id v32 = 0;
                  char v9 = _PKPaymentValidatePropertyArray(disbursementPaymentRequest, @"paymentSummaryItems", v31, v29, 1, a3, &v32);
                  id v8 = v32;

LABEL_15:
                  if (!a4) {
                    goto LABEL_20;
                  }
                  goto LABEL_16;
                }
                v27 = &PKDisbursementRequestValidationErrorMultipleDisbursementSummaryItems;
              }
              else
              {
                v27 = PKDisbursementRequestValidationErrorMultipleIFOSummaryItems;
              }
              v28 = *v27;

              char v9 = 0;
              id v8 = 0;
              id v7 = v28;
              goto LABEL_15;
            }
LABEL_14:
            char v9 = 0;
            id v8 = 0;
            goto LABEL_15;
          }
          v19 = PKDisbursementRequestValidationErrorIFOSummaryItemButNoIFOCapability;
        }
        else
        {
          v19 = PKDisbursementRequestValidationErrorIFOCapabilityButNoIFOSummaryItem;
        }
        id v7 = *v19;
        goto LABEL_25;
      }
      v20 = PKDisbursementRequestValidationErrorFinalSummaryItemNotDisbursementSummaryItem;
    }
    else
    {
      v20 = PKDisbursementRequestValidationErrorFirstSummaryItemNotPaymentSummaryItem;
    }
    id v7 = *v20;
    goto LABEL_14;
  }
  char v9 = 0;
  id v7 = 0;
  id v8 = 0;
  if (!a4) {
    goto LABEL_20;
  }
LABEL_16:
  if ((v9 & 1) == 0)
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v22 = *MEMORY[0x1E4F28568];
    [v21 setObject:@"Invalid Disbursement request" forKeyedSubscript:*MEMORY[0x1E4F28568]];
    if (!v8)
    {
      v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v34 = v22;
      v35[0] = v7;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
      id v8 = [v23 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v24];
    }
    [v21 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v21];

    char v9 = 0;
  }
LABEL_20:

  return v9;
}

uint64_t __70__PKDisbursementPaymentRequestValidator_isValidWithAPIType_withError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __70__PKDisbursementPaymentRequestValidator_isValidWithAPIType_withError___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __70__PKDisbursementPaymentRequestValidator_isValidWithAPIType_withError___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __70__PKDisbursementPaymentRequestValidator_isValidWithAPIType_withError___block_invoke_4(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 24);
    id v4 = v6;
    id v5 = [v3 currencyCode];
    [v4 setCurrencyCode:v5];
  }
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (PKDisbursementPaymentRequest)disbursementPaymentRequest
{
  return self->_disbursementPaymentRequest;
}

- (BOOL)shouldSkipSummaryItemValidation
{
  return self->_shouldSkipSummaryItemValidation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disbursementPaymentRequest, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
}

@end