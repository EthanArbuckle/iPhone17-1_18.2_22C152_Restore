@interface PKRecurringPaymentSummaryItemValidator
+ (Class)validatedClass;
+ (id)validatorWithObject:(id)a3;
- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4;
- (BOOL)isValidWithError:(id *)a3;
- (PKRecurringPaymentSummaryItemValidator)initWithRecurringPaymentSummaryItem:(id)a3;
@end

@implementation PKRecurringPaymentSummaryItemValidator

+ (id)validatorWithObject:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRecurringPaymentSummaryItem:v3];

  return v4;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKRecurringPaymentSummaryItemValidator)initWithRecurringPaymentSummaryItem:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKRecurringPaymentSummaryItemValidator;
  return [(PKPaymentSummaryItemValidator *)&v4 initWithPaymentSummaryItem:a3];
}

- (BOOL)isValidWithError:(id *)a3
{
  return [(PKRecurringPaymentSummaryItemValidator *)self isValidWithAPIType:0 withError:a3];
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PKRecurringPaymentSummaryItemValidator_isValidWithAPIType_withError___block_invoke;
  aBlock[3] = &__block_descriptor_40_e27___NSError_16__0__NSString_8l;
  aBlock[4] = a3;
  v7 = (void (**)(void *, __CFString *))_Block_copy(aBlock);
  v25.receiver = self;
  v25.super_class = (Class)PKRecurringPaymentSummaryItemValidator;
  if ([(PKPaymentSummaryItemValidator *)&v25 isValidWithAPIType:a3 withError:a4])
  {
    v8 = [(PKPaymentSummaryItemValidator *)self item];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v14 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v9 = [(PKPaymentSummaryItemValidator *)self item];
    uint64_t v10 = objc_opt_class();
    if (!_PKPaymentValidateProperty(v9, @"startDate", v10, 0, a3, (uint64_t)a4)) {
      goto LABEL_19;
    }
    v11 = [(PKPaymentSummaryItemValidator *)self item];
    uint64_t v12 = objc_opt_class();
    int v13 = _PKPaymentValidateProperty(v11, @"endDate", v12, 0, a3, (uint64_t)a4);

    BOOL v14 = 0;
    if (v13)
    {
      v8 = [(PKPaymentSummaryItemValidator *)self item];
      v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EE22C038, &unk_1EE22C050, &unk_1EE22C068, &unk_1EE22C080, &unk_1EE22C098, 0);
      if ([v8 intervalCount] > 0)
      {
        v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "intervalUnit"));
        char v16 = [v9 containsObject:v15];

        if ((v16 & 1) == 0)
        {
          if (a4)
          {
            v7[2](v7, @"must have a valid intervalUnit: year, month, day, hour or minute");
            goto LABEL_18;
          }
          goto LABEL_19;
        }
        uint64_t v17 = [v8 startDate];
        if (v17)
        {
          v18 = (void *)v17;
          uint64_t v19 = [v8 endDate];
          if (v19)
          {
            v20 = (void *)v19;
            v21 = [v8 startDate];
            v22 = [v8 endDate];
            uint64_t v23 = [v21 compare:v22];

            if (v23 == 1)
            {
              if (a4)
              {
                v7[2](v7, @"must have a startDate earlier than or equal to endDate");
LABEL_18:
                BOOL v14 = 0;
                *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

                goto LABEL_21;
              }
              goto LABEL_19;
            }
          }
          else
          {
          }
        }
        BOOL v14 = 1;
        goto LABEL_20;
      }
      if (a4)
      {
        v7[2](v7, @"must have a intervalCount >= 1");
        goto LABEL_18;
      }
LABEL_19:
      BOOL v14 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_22:

  return v14;
}

id __71__PKRecurringPaymentSummaryItemValidator_isValidWithAPIType_withError___block_invoke(uint64_t a1, uint64_t a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(*(void *)(a1 + 32) - 1) >= 2) {
    v2 = @"PKRecurringPaymentSummaryItem";
  }
  else {
    v2 = @"Recurring line item";
  }
  id v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28568];
  objc_super v4 = [NSString stringWithFormat:@"%@ %@", v2, a2];
  v9[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [v3 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v5];

  return v6;
}

@end