@interface PKDeferredPaymentSummaryItemValidator
+ (Class)validatedClass;
+ (id)validatorWithObject:(id)a3;
- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4;
- (BOOL)isValidWithError:(id *)a3;
- (PKDeferredPaymentSummaryItemValidator)initWithDeferredPaymentSummaryItem:(id)a3;
@end

@implementation PKDeferredPaymentSummaryItemValidator

+ (id)validatorWithObject:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDeferredPaymentSummaryItem:v3];

  return v4;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKDeferredPaymentSummaryItemValidator)initWithDeferredPaymentSummaryItem:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKDeferredPaymentSummaryItemValidator;
  return [(PKPaymentSummaryItemValidator *)&v4 initWithPaymentSummaryItem:a3];
}

- (BOOL)isValidWithError:(id *)a3
{
  return [(PKDeferredPaymentSummaryItemValidator *)self isValidWithAPIType:0 withError:a3];
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)PKDeferredPaymentSummaryItemValidator;
  if (-[PKPaymentSummaryItemValidator isValidWithAPIType:withError:](&v21, sel_isValidWithAPIType_withError_))
  {
    v7 = [(PKPaymentSummaryItemValidator *)self item];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_11;
    }
    v8 = [(PKPaymentSummaryItemValidator *)self item];
    uint64_t v9 = objc_opt_class();
    int v10 = _PKPaymentValidateProperty(v8, @"deferredDate", v9, 1, a3, (uint64_t)a4);

    if (v10)
    {
      v7 = [(PKPaymentSummaryItemValidator *)self item];
      uint64_t v11 = [v7 deferredDate];
      if (!v11) {
        goto LABEL_13;
      }
      v12 = (void *)v11;
      v13 = [MEMORY[0x1E4F1C9C8] now];
      v14 = [v7 deferredDate];
      uint64_t v15 = [v13 compare:v14];

      if (v15 != 1)
      {
LABEL_13:
        LOBYTE(a4) = 1;
        goto LABEL_14;
      }
      if (!a4)
      {
LABEL_14:

        return (char)a4;
      }
      if ((unint64_t)(a3 - 1) >= 2) {
        v16 = @"PKDeferredPaymentSummaryItem";
      }
      else {
        v16 = @"Deferred line item";
      }
      v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      v18 = [NSString stringWithFormat:@"%@ must have a deferredDate later than current date", v16];
      v23[0] = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      *a4 = [v17 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v19];

LABEL_11:
      LOBYTE(a4) = 0;
      goto LABEL_14;
    }
  }
  LOBYTE(a4) = 0;
  return (char)a4;
}

@end