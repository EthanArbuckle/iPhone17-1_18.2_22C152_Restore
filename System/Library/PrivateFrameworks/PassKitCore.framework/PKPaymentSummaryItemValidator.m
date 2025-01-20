@interface PKPaymentSummaryItemValidator
+ (Class)validatedClass;
+ (id)validatorWithObject:(id)a3;
- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4;
- (BOOL)isValidWithError:(id *)a3;
- (NSString)currencyCode;
- (PKPaymentSummaryItem)item;
- (PKPaymentSummaryItemValidator)initWithPaymentSummaryItem:(id)a3;
- (void)setCurrencyCode:(id)a3;
@end

@implementation PKPaymentSummaryItemValidator

+ (id)validatorWithObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = PKRecurringPaymentSummaryItemValidator;
LABEL_11:
    uint64_t v5 = [(__objc2_class *)v4 validatorWithObject:v3];
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = PKDeferredPaymentSummaryItemValidator;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = PKAutomaticReloadPaymentSummaryItemValidator;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = PKDisbursementSummaryItemValidator;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = PKInstantFundsOutFeeSummaryItemValidator;
    goto LABEL_11;
  }
  uint64_t v5 = [objc_alloc((Class)objc_opt_class()) initWithPaymentSummaryItem:v3];
LABEL_12:
  v6 = (void *)v5;

  return v6;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKPaymentSummaryItemValidator)initWithPaymentSummaryItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSummaryItemValidator;
  v6 = [(PKPaymentSummaryItemValidator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_item, a3);
  }

  return v7;
}

- (BOOL)isValidWithError:(id *)a3
{
  return [(PKPaymentSummaryItemValidator *)self isValidWithAPIType:0 withError:a3];
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  v38[1] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v8 = [(PKPaymentSummaryItem *)self->_item amount];
  objc_super v9 = [MEMORY[0x1E4F28C28] notANumber];
  int v10 = [v8 isEqualToNumber:v9];

  if ((isKindOfClass & 1) == 0)
  {
    if (!a4)
    {
      char IsValidCurrencyAmount = 0;
      id v14 = 0;
      goto LABEL_24;
    }
    if ((unint64_t)(a3 - 1) >= 2) {
      v16 = @"PKPaymentSummaryItem has an invalid label or amount property";
    }
    else {
      v16 = @"Line item has an invalid label or amount";
    }
    goto LABEL_15;
  }
  item = self->_item;
  uint64_t v12 = objc_opt_class();
  id v34 = 0;
  int v13 = _PKPaymentValidateProperty(item, @"label", v12, 1, a3, (uint64_t)&v34);
  id v14 = v34;
  if ((v13 ^ 1 | v10))
  {
    char IsValidCurrencyAmount = 0;
  }
  else
  {
    if ([(PKPaymentSummaryItem *)self->_item type])
    {
      char IsValidCurrencyAmount = 1;
      goto LABEL_24;
    }
    v25 = self->_item;
    uint64_t v26 = objc_opt_class();
    id v33 = v14;
    int v27 = _PKPaymentValidateProperty(v25, @"amount", v26, 1, a3, (uint64_t)&v33);
    id v28 = v33;

    if (v27)
    {
      v29 = [(PKPaymentSummaryItemValidator *)self currencyCode];

      if (!v29)
      {
        char IsValidCurrencyAmount = 1;
        id v14 = v28;
        goto LABEL_24;
      }
      v30 = [(PKPaymentSummaryItem *)self->_item amount];
      v31 = [(PKPaymentSummaryItemValidator *)self currencyCode];
      id v32 = v28;
      char IsValidCurrencyAmount = _PKPaymentIsValidCurrencyAmount(v30, v31, &v32);
      id v14 = v32;
    }
    else
    {
      char IsValidCurrencyAmount = 0;
      id v14 = v28;
    }
  }
  if (a4 && (IsValidCurrencyAmount & 1) == 0)
  {
    if ((unint64_t)(a3 - 1) >= 2) {
      v16 = @"PKPaymentSummaryItem has an invalid label or amount property";
    }
    else {
      v16 = @"Line item has an invalid label or amount";
    }
    if (v14)
    {
      uint64_t v17 = *MEMORY[0x1E4F28568];
LABEL_20:
      v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F28A50];
      v35[0] = v17;
      v35[1] = v22;
      v36[0] = v16;
      v36[1] = v14;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
      *a4 = [v21 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v23];

      char IsValidCurrencyAmount = 0;
      goto LABEL_24;
    }
LABEL_15:
    v18 = @"Unknown error occurred";
    if (v10) {
      v18 = @"Item's amount is not a valid decimal number";
    }
    if ((isKindOfClass & 1) == 0) {
      v18 = @"Item is not a kind of PKPaymentSymmaryItem";
    }
    v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    uint64_t v37 = *MEMORY[0x1E4F28568];
    v38[0] = v18;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    id v14 = [v19 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v20];

    goto LABEL_20;
  }
LABEL_24:

  return IsValidCurrencyAmount;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (PKPaymentSummaryItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
}

@end