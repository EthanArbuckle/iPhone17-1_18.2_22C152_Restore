@interface PKShippingMethodValidator
+ (Class)validatedClass;
+ (id)validatorWithObject:(id)a3;
- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4;
- (BOOL)isValidWithError:(id *)a3;
- (PKShippingMethodValidator)initWithShippingMethod:(id)a3;
@end

@implementation PKShippingMethodValidator

+ (id)validatorWithObject:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithShippingMethod:v3];

  return v4;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKShippingMethodValidator)initWithShippingMethod:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKShippingMethodValidator;
  return [(PKPaymentSummaryItemValidator *)&v4 initWithPaymentSummaryItem:a3];
}

- (BOOL)isValidWithError:(id *)a3
{
  return [(PKShippingMethodValidator *)self isValidWithAPIType:0 withError:a3];
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)PKShippingMethodValidator;
  if (!-[PKPaymentSummaryItemValidator isValidWithAPIType:withError:](&v22, sel_isValidWithAPIType_withError_)) {
    goto LABEL_9;
  }
  v7 = [(PKPaymentSummaryItemValidator *)self item];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  v8 = [(PKPaymentSummaryItemValidator *)self item];
  uint64_t v9 = objc_opt_class();
  if ((_PKPaymentValidateProperty(v8, @"identifier", v9, 1, a3, (uint64_t)a4) & 1) == 0)
  {

LABEL_8:
    goto LABEL_9;
  }
  v10 = [(PKPaymentSummaryItemValidator *)self item];
  uint64_t v11 = objc_opt_class();
  int v12 = _PKPaymentValidateProperty(v10, @"detail", v11, 0, a3, (uint64_t)a4);

  if (v12)
  {
    v13 = [MEMORY[0x1E4F28C28] zero];
    v14 = [(PKPaymentSummaryItemValidator *)self item];
    v15 = [v14 amount];
    uint64_t v16 = [v13 compare:v15];

    if (v16 != 1) {
      return 1;
    }
  }
LABEL_9:
  if (a4)
  {
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    if ((unint64_t)(a3 - 1) >= 2) {
      v19 = @"PKShippingMethod";
    }
    else {
      v19 = @"Shipping method";
    }
    v20 = [NSString stringWithFormat:@"%@ must have an identifier and an amount >= 0", v19];
    v24[0] = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    *a4 = [v18 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v21];
  }
  return 0;
}

@end