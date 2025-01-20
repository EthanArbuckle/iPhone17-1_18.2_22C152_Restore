@interface PKAutomaticReloadPaymentSummaryItemValidator
+ (Class)validatedClass;
+ (id)validatorWithObject:(id)a3;
- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4;
- (BOOL)isValidWithError:(id *)a3;
- (PKAutomaticReloadPaymentSummaryItemValidator)initWithAutomaticReloadPaymentSummaryItem:(id)a3;
@end

@implementation PKAutomaticReloadPaymentSummaryItemValidator

+ (id)validatorWithObject:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAutomaticReloadPaymentSummaryItem:v3];

  return v4;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKAutomaticReloadPaymentSummaryItemValidator)initWithAutomaticReloadPaymentSummaryItem:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKAutomaticReloadPaymentSummaryItemValidator;
  return [(PKPaymentSummaryItemValidator *)&v4 initWithPaymentSummaryItem:a3];
}

- (BOOL)isValidWithError:(id *)a3
{
  return [(PKAutomaticReloadPaymentSummaryItemValidator *)self isValidWithAPIType:0 withError:a3];
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)PKAutomaticReloadPaymentSummaryItemValidator;
  if (!-[PKPaymentSummaryItemValidator isValidWithAPIType:withError:](&v28, sel_isValidWithAPIType_withError_))
  {
    LOBYTE(v9) = 0;
    id v10 = 0;
LABEL_8:
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_9;
  }
  v7 = [(PKPaymentSummaryItemValidator *)self item];
  uint64_t v8 = objc_opt_class();
  id v27 = 0;
  int v9 = _PKPaymentValidateProperty(v7, @"thresholdAmount", v8, 1, a3, (uint64_t)&v27);
  id v10 = v27;

  if (!v9) {
    goto LABEL_8;
  }
  v11 = [(PKPaymentSummaryItemValidator *)self currencyCode];

  if (!v11)
  {
    LOBYTE(v9) = 1;
    goto LABEL_14;
  }
  v12 = [(PKPaymentSummaryItemValidator *)self item];
  v13 = [v12 thresholdAmount];
  v14 = [(PKPaymentSummaryItemValidator *)self currencyCode];
  id v26 = v10;
  int IsValidCurrencyAmount = _PKPaymentIsValidCurrencyAmount(v13, v14, &v26);
  id v16 = v26;

  if (IsValidCurrencyAmount)
  {
    v17 = [v12 thresholdAmount];
    v18 = [MEMORY[0x1E4F28C28] notANumber];
    int v19 = [v17 isEqualToNumber:v18];

    if (v19)
    {
      v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F28568];
      v30[0] = @"PKAutomaticReloadPaymentSummaryItem thresholdAmount value can't be NaN";
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
      uint64_t v22 = [v20 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v21];

      LOBYTE(v9) = 0;
      id v16 = (id)v22;
    }
    else
    {
      LOBYTE(v9) = 1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  id v10 = v16;
  if (a4)
  {
LABEL_9:
    if ((v9 & 1) == 0)
    {
      if ((unint64_t)(a3 - 1) >= 2) {
        v23 = @"PKAutomaticReloadPaymentSummaryItem has an invalid amount";
      }
      else {
        v23 = @"Automatic reload item has an invalid amount";
      }
      id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v24 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F28568]];
      [v24 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v24];

      LOBYTE(v9) = 0;
    }
  }
LABEL_14:

  return v9;
}

@end