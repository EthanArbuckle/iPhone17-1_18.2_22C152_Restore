@interface PKInstantFundsOutFeeSummaryItemValidator
+ (Class)validatedClass;
+ (id)validatorWithObject:(id)a3;
- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4;
- (BOOL)isValidWithError:(id *)a3;
- (PKInstantFundsOutFeeSummaryItemValidator)initWithInstantFundsOutFeeSummaryItem:(id)a3;
@end

@implementation PKInstantFundsOutFeeSummaryItemValidator

+ (id)validatorWithObject:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInstantFundsOutFeeSummaryItem:v3];

  return v4;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKInstantFundsOutFeeSummaryItemValidator)initWithInstantFundsOutFeeSummaryItem:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKInstantFundsOutFeeSummaryItemValidator;
  return [(PKPaymentSummaryItemValidator *)&v4 initWithPaymentSummaryItem:a3];
}

- (BOOL)isValidWithError:(id *)a3
{
  return [(PKInstantFundsOutFeeSummaryItemValidator *)self isValidWithAPIType:0 withError:a3];
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PKInstantFundsOutFeeSummaryItemValidator;
  unsigned int v6 = -[PKPaymentSummaryItemValidator isValidWithAPIType:withError:](&v16, sel_isValidWithAPIType_withError_, a3);
  v7 = [(PKPaymentSummaryItemValidator *)self item];
  v8 = v7;
  if (v6)
  {
    v9 = [v7 amount];
    int v10 = objc_msgSend(v9, "pk_isNegativeNumber");

    if (!v10)
    {
      v13 = 0;
      LOBYTE(a4) = 1;
      goto LABEL_8;
    }
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"PKInstantFundsOutFeeSummaryItem amount must be non-negative";
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v13 = [v11 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v12];

    if (!a4) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  v13 = 0;
  if (a4)
  {
LABEL_6:
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v14 setObject:@"PKInstantFundsOutFeeSummaryItem has an invalid amount" forKeyedSubscript:*MEMORY[0x1E4F28568]];
    [v14 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v14];

    LOBYTE(a4) = 0;
  }
LABEL_8:

  return (char)a4;
}

@end