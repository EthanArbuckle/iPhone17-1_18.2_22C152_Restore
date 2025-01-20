@interface PKBillPaymentSuggestedAmountList
+ (id)boundaryAngle;
+ (id)requiredSuggestedAmountCategories;
+ (id)roundingHandler;
+ (unint64_t)maximumNumberSuggestions;
- (BOOL)_addSuggestedAmount:(id)a3 force:(BOOL)a4;
- (BOOL)_suggestedAmountIsRequiredCategory:(id)a3;
- (BOOL)addSuggestedAmount:(id)a3;
- (BOOL)canAddAmount:(id)a3;
- (BOOL)canAddAmount:(id)a3 andCategory:(unint64_t)a4;
- (BOOL)canAddCategory:(unint64_t)a3;
- (BOOL)isValidWithUnableReason:(unint64_t *)a3;
- (BOOL)suggestedAmount:(id)a3 isAdjoiningSuggestedAmount:(id)a4;
- (NSArray)sortedSuggestedAmounts;
- (NSDecimalNumber)maximumAmount;
- (NSDecimalNumber)minimumAmount;
- (NSDecimalNumber)remainingStatementAmount;
- (NSDecimalNumber)smalllestSuggestionAmountBelowRemainingStatementAmount;
- (NSString)currencyCode;
- (PKBillPaymentSuggestedAmount)initialSuggestedAmount;
- (PKBillPaymentSuggestedAmountList)init;
- (PKBillPaymentSuggestedAmountList)initWithCurrencyCode:(id)a3 remainingMinimumPayment:(id)a4 remainingStatementBalance:(id)a5 currentBalance:(id)a6;
- (id)_boundaryAmount;
- (id)_lastSuggestedAmountThatIsNotRequred;
- (id)_smalllestSuggestionAmountBelowRemainingStatementAmount;
- (id)_sortedAmounts;
- (id)_sortedSuggestedAmounts;
- (id)_suggestedAmountThatIsNotRequired:(id)a3 suggestedAmount2:(id)a4;
- (id)billPaymentSelectedSuggestedAmountDataEventForAmount:(id)a3 accountIdentifier:(id)a4 statementIdentifier:(id)a5;
- (id)description;
- (id)maximumSuggestedAmount;
- (id)maximumSuggestedAmountFromCategories:(id)a3;
- (id)minimumSuggestedAmount;
- (id)minimumSuggestedAmountFromCategories:(id)a3;
- (id)suggestedAmountAfterSuggestedAmount:(id)a3;
- (id)suggestedAmountBeforeSuggestedAmount:(id)a3;
- (id)suggestedAmountGapMessageForStartSuggestedAmount:(id)a3;
- (id)suggestedAmountWithCategory:(unint64_t)a3;
- (void)_createMandatorySuggestions;
- (void)_removeSuggestedAmount:(id)a3;
- (void)_updateValues;
- (void)addSuggestedAmountGapMessage:(id)a3 forStartSuggestedAmount:(id)a4;
- (void)addSuggestedAmountList:(id)a3;
- (void)attemptToPurgeInvalidSuggestedAmounts;
- (void)setInitialSuggestedAmount:(id)a3;
@end

@implementation PKBillPaymentSuggestedAmountList

- (PKBillPaymentSuggestedAmountList)init
{
  return 0;
}

- (PKBillPaymentSuggestedAmountList)initWithCurrencyCode:(id)a3 remainingMinimumPayment:(id)a4 remainingStatementBalance:(id)a5 currentBalance:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v34.receiver = self;
  v34.super_class = (Class)PKBillPaymentSuggestedAmountList;
  v15 = [(PKBillPaymentSuggestedAmountList *)&v34 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_currencyCode, a3);
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    suggestionsForCategory = v16->_suggestionsForCategory;
    v16->_suggestionsForCategory = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    suggestionsForAmount = v16->_suggestionsForAmount;
    v16->_suggestionsForAmount = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    suggestedAmountGapMessageForAmount = v16->_suggestedAmountGapMessageForAmount;
    v16->_suggestedAmountGapMessageForAmount = v21;

    v23 = [MEMORY[0x1E4F28C28] zero];
    if (v12 && [v12 compare:v23] != 1)
    {

      id v12 = 0;
    }
    if (v13 && [v13 compare:v23] != 1)
    {

      id v13 = 0;
    }
    if (v14)
    {
      if ([v14 compare:v23] == -1)
      {
        id v24 = v23;

        id v14 = v24;
      }
    }
    else
    {
      id v14 = v23;
    }
    if (v12 && [v12 compare:v14] == 1)
    {
      id v25 = v12;

      id v14 = v25;
    }
    if (v13 && [v13 compare:v14] == 1)
    {
      id v26 = v13;

      id v14 = v26;
    }
    if (v12)
    {
      uint64_t v27 = [v12 copy];
      minimumAmount = v16->_minimumAmount;
      v16->_minimumAmount = (NSDecimalNumber *)v27;
    }
    if (v13)
    {
      uint64_t v29 = [v13 copy];
      remainingStatementAmount = v16->_remainingStatementAmount;
      v16->_remainingStatementAmount = (NSDecimalNumber *)v29;
    }
    uint64_t v31 = [v14 copy];
    maximumAmount = v16->_maximumAmount;
    v16->_maximumAmount = (NSDecimalNumber *)v31;

    [(PKBillPaymentSuggestedAmountList *)v16 _createMandatorySuggestions];
  }

  return v16;
}

- (void)_createMandatorySuggestions
{
  id v12 = self->_minimumAmount;
  v3 = self->_remainingStatementAmount;
  v4 = self->_maximumAmount;
  v5 = v4;
  if (!v3) {
    goto LABEL_7;
  }
  if (v4 && [(NSDecimalNumber *)v4 compare:v3] == NSOrderedSame)
  {

    v5 = 0;
  }
  if (!v12)
  {
LABEL_17:
    id v13 = 0;
    BOOL v6 = v5 != 0;
    goto LABEL_21;
  }
  if ([(NSDecimalNumber *)v12 compare:v3] == NSOrderedSame)
  {

    goto LABEL_17;
  }
LABEL_7:
  BOOL v6 = v5 != 0;
  v7 = v12;
  if (v12) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    if ([(NSDecimalNumber *)v12 compare:v5] == NSOrderedSame)
    {
      v9 = (PKBillPaymentSuggestedAmount *)v12;
      id v12 = 0;
      goto LABEL_19;
    }
LABEL_15:
    v9 = [[PKBillPaymentSuggestedAmount alloc] initWithAmount:v12 category:1];
    [(PKBillPaymentSuggestedAmountList *)self _addSuggestedAmount:v9 force:1];
LABEL_19:

    v7 = v12;
    goto LABEL_20;
  }
  if (v12) {
    goto LABEL_15;
  }
LABEL_20:
  id v13 = v7;
  if (v3)
  {
LABEL_21:
    v10 = [[PKBillPaymentSuggestedAmount alloc] initWithAmount:v3 category:18];
    [(PKBillPaymentSuggestedAmountList *)self _addSuggestedAmount:v10 force:1];

    if (!v6) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (v5)
  {
LABEL_22:
    id v11 = [[PKBillPaymentSuggestedAmount alloc] initWithAmount:v5 category:19];
    [(PKBillPaymentSuggestedAmountList *)self _addSuggestedAmount:v11 force:1];
  }
LABEL_23:
}

+ (id)boundaryAngle
{
  v3 = (void *)MEMORY[0x1E4F28C28];
  LODWORD(v2) = 1054828264;
  v4 = [NSNumber numberWithFloat:v2];
  v5 = v4;
  if (v4)
  {
    [v4 decimalValue];
  }
  else
  {
    v8[0] = 0;
    v8[1] = 0;
    int v9 = 0;
  }
  BOOL v6 = [v3 decimalNumberWithDecimal:v8];

  return v6;
}

+ (id)roundingHandler
{
  return (id)[MEMORY[0x1E4F28C30] decimalNumberHandlerWithRoundingMode:0 scale:4 raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
}

+ (id)requiredSuggestedAmountCategories
{
  if (_MergedGlobals_253 != -1) {
    dispatch_once(&_MergedGlobals_253, &__block_literal_global_154);
  }
  double v2 = (void *)qword_1EB403258;
  return v2;
}

void __69__PKBillPaymentSuggestedAmountList_requiredSuggestedAmountCategories__block_invoke()
{
  v0 = (void *)qword_1EB403258;
  qword_1EB403258 = (uint64_t)&unk_1EE22B108;
}

+ (unint64_t)maximumNumberSuggestions
{
  return 5;
}

- (BOOL)canAddAmount:(id)a3 andCategory:(unint64_t)a4
{
  BOOL v6 = [(PKBillPaymentSuggestedAmountList *)self canAddAmount:a3];
  if (v6)
  {
    LOBYTE(v6) = [(PKBillPaymentSuggestedAmountList *)self canAddCategory:a4];
  }
  return v6;
}

- (BOOL)canAddAmount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28C28] zero];
    if ([v4 isEqualToNumber:v5])
    {
      BOOL v6 = 0;
    }
    else
    {
      v7 = [(NSMutableDictionary *)self->_suggestionsForAmount objectForKey:v4];
      BOOL v6 = v7 == 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)canAddCategory:(unint64_t)a3
{
  suggestionsForCategory = self->_suggestionsForCategory;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [(NSMutableDictionary *)suggestionsForCategory objectForKey:v4];
  LOBYTE(suggestionsForCategory) = v5 == 0;

  return (char)suggestionsForCategory;
}

- (BOOL)addSuggestedAmount:(id)a3
{
  return [(PKBillPaymentSuggestedAmountList *)self _addSuggestedAmount:a3 force:0];
}

- (void)addSuggestedAmountList:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(PKBillPaymentSuggestedAmountList *)self addSuggestedAmount:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)_addSuggestedAmount:(id)a3 force:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 amount];
  uint64_t v8 = [(id)objc_opt_class() roundingHandler];
  long long v9 = [v7 decimalNumberByRoundingAccordingToBehavior:v8];

  [v6 setAmount:v9];
  if (a4
    || ([v6 amount],
        long long v10 = objc_claimAutoreleasedReturnValue(),
        BOOL v11 = -[PKBillPaymentSuggestedAmountList canAddAmount:andCategory:](self, "canAddAmount:andCategory:", v10, [v6 category]), v10, v11))
  {
    suggestionsForCategory = self->_suggestionsForCategory;
    id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "category"));
    [(NSMutableDictionary *)suggestionsForCategory setObject:v6 forKey:v13];

    suggestionsForAmount = self->_suggestionsForAmount;
    v15 = [v6 amount];
    [(NSMutableDictionary *)suggestionsForAmount setObject:v6 forKey:v15];

    [(PKBillPaymentSuggestedAmountList *)self _updateValues];
    BOOL v16 = 1;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (id)suggestedAmountWithCategory:(unint64_t)a3
{
  suggestionsForCategory = self->_suggestionsForCategory;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v5 = [(NSMutableDictionary *)suggestionsForCategory objectForKey:v4];

  return v5;
}

- (id)maximumSuggestedAmount
{
  return [(NSArray *)self->_sortedSuggestedAmounts lastObject];
}

- (id)minimumSuggestedAmount
{
  return [(NSArray *)self->_sortedSuggestedAmounts firstObject];
}

- (id)maximumSuggestedAmountFromCategories:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        long long v10 = -[PKBillPaymentSuggestedAmountList suggestedAmountWithCategory:](self, "suggestedAmountWithCategory:", [*(id *)(*((void *)&v14 + 1) + 8 * i) integerValue]);
        BOOL v11 = v10;
        if (!v7 || v10 && [v10 compare:v7] == 1)
        {
          id v12 = v11;

          uint64_t v7 = v12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)minimumSuggestedAmountFromCategories:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        long long v10 = -[PKBillPaymentSuggestedAmountList suggestedAmountWithCategory:](self, "suggestedAmountWithCategory:", [*(id *)(*((void *)&v14 + 1) + 8 * i) integerValue]);
        BOOL v11 = v10;
        if (!v7 || v10 && [v10 compare:v7] == -1)
        {
          id v12 = v11;

          uint64_t v7 = v12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)suggestedAmount:(id)a3 isAdjoiningSuggestedAmount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqual:v7])
  {
    char v8 = 1;
  }
  else
  {
    long long v9 = [(PKBillPaymentSuggestedAmountList *)self suggestedAmountBeforeSuggestedAmount:v6];
    if ([v9 isEqual:v7])
    {
      char v8 = 1;
    }
    else
    {
      long long v10 = [(PKBillPaymentSuggestedAmountList *)self suggestedAmountAfterSuggestedAmount:v6];
      char v8 = [v10 isEqual:v7];
    }
  }

  return v8;
}

- (id)suggestedAmountBeforeSuggestedAmount:(id)a3
{
  NSUInteger v4 = [(NSArray *)self->_sortedSuggestedAmounts indexOfObject:a3];
  if (v4) {
    BOOL v5 = v4 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [(NSArray *)self->_sortedSuggestedAmounts objectAtIndex:v4 - 1];
  }
  return v6;
}

- (id)suggestedAmountAfterSuggestedAmount:(id)a3
{
  unint64_t v4 = [(NSArray *)self->_sortedSuggestedAmounts indexOfObject:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v5 = v4, v4 >= [(NSArray *)self->_sortedSuggestedAmounts count] - 1))
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [(NSArray *)self->_sortedSuggestedAmounts objectAtIndex:v5 + 1];
  }
  return v6;
}

- (id)suggestedAmountGapMessageForStartSuggestedAmount:(id)a3
{
  if (a3)
  {
    unint64_t v4 = [a3 amount];
    unint64_t v5 = [(NSMutableDictionary *)self->_suggestedAmountGapMessageForAmount objectForKey:v4];
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v5;
}

- (void)addSuggestedAmountGapMessage:(id)a3 forStartSuggestedAmount:(id)a4
{
  suggestedAmountGapMessageForAmount = self->_suggestedAmountGapMessageForAmount;
  id v6 = a3;
  id v7 = [a4 amount];
  [(NSMutableDictionary *)suggestedAmountGapMessageForAmount setObject:v6 forKey:v7];
}

- (id)billPaymentSelectedSuggestedAmountDataEventForAmount:(id)a3 accountIdentifier:(id)a4 statementIdentifier:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v32 = a5;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v10 = self->_sortedSuggestedAmounts;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v34 != v13) {
        objc_enumerationMutation(v10);
      }
      long long v15 = *(void **)(*((void *)&v33 + 1) + 8 * v14);
      long long v16 = [v15 amount];
      if ([v8 isEqualToNumber:v16]) {
        break;
      }

      if (v12 == ++v14)
      {
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    long long v17 = v9;
    v18 = &off_1E56D4000;
    v20 = [PKBillPaymentSelectedSuggestedAmountData alloc];
    v21 = [MEMORY[0x1E4F1C9C8] date];
    v22 = [v15 amount];
    v23 = -[PKBillPaymentSelectedSuggestedAmountData initWithStatementIdentifier:transactionDate:transactionAmount:suggestedAmountCategory:](v20, "initWithStatementIdentifier:transactionDate:transactionAmount:suggestedAmountCategory:", v32, v21, v22, [v15 category]);

    uint64_t v19 = v32;
    if (v23) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
    long long v17 = v9;

    v18 = &off_1E56D4000;
    uint64_t v19 = v32;
  }
  id v24 = objc_alloc((Class)v18[375]);
  id v25 = [MEMORY[0x1E4F1C9C8] date];
  v23 = (PKBillPaymentSelectedSuggestedAmountData *)[v24 initWithStatementIdentifier:v19 transactionDate:v25 transactionAmount:v8 suggestedAmountCategory:0];

LABEL_12:
  id v26 = objc_alloc_init(PKAccountEvent);
  uint64_t v27 = [MEMORY[0x1E4F1CAD0] setWithObject:v23];
  [(PKAccountEvent *)v26 setItems:v27];

  [(PKAccountEvent *)v26 setType:14];
  [(PKAccountEvent *)v26 setAccountIdentifier:v17];
  v28 = [(PKBillPaymentSelectedSuggestedAmountData *)v23 transactionDate];
  [(PKAccountEvent *)v26 setDate:v28];

  uint64_t v29 = [MEMORY[0x1E4F29128] UUID];
  v30 = [v29 UUIDString];
  [(PKAccountEvent *)v26 setIdentifier:v30];

  return v26;
}

- (BOOL)isValidWithUnableReason:(unint64_t *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Validating the Bill Payment Suggested Amount List.", buf, 2u);
  }

  uint64_t v6 = [(PKBillPaymentSuggestedAmountList *)self suggestedAmountWithCategory:18];
  uint64_t v7 = [(PKBillPaymentSuggestedAmountList *)self suggestedAmountWithCategory:19];
  if (v6 | v7)
  {
    id v9 = [(PKBillPaymentSuggestedAmountList *)self maximumSuggestedAmount];
    if ([v9 category] == 18 || objc_msgSend(v9, "category") == 19)
    {
      v22 = a3;
      uint64_t v23 = v7;
      uint64_t v24 = v6;
      long long v10 = [(PKBillPaymentSuggestedAmountList *)self _boundaryAmount];
      if ([(NSArray *)self->_sortedSuggestedAmounts count] != 1)
      {
        unint64_t v11 = 0;
        do
        {
          uint64_t v12 = [(NSArray *)self->_sortedSuggestedAmounts objectAtIndex:v11];
          uint64_t v13 = [(NSArray *)self->_sortedSuggestedAmounts objectAtIndex:++v11];
          uint64_t v14 = [v12 amount];
          long long v15 = [v13 amount];
          long long v16 = [v15 decimalNumberBySubtracting:v14];
          if ([v16 compare:v10] == -1)
          {
            BOOL v17 = [(PKBillPaymentSuggestedAmountList *)self _suggestedAmountIsRequiredCategory:v12];
            BOOL v18 = [(PKBillPaymentSuggestedAmountList *)self _suggestedAmountIsRequiredCategory:v13];
            if (!v17 || !v18)
            {
              if (v22) {
                unint64_t *v22 = 3;
              }

LABEL_32:
              BOOL v8 = 0;
              goto LABEL_33;
            }
            if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Bill payment suggestions are overlapping. The suggestions that are overlapping are both required, so they cannot be removed from the bill payment suggestion list", buf, 2u);
            }

            if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v26 = v12;
              _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Overlapping suggestion 1: %@", buf, 0xCu);
            }

            if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v26 = v13;
              _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Overlapping suggestion 2: %@", buf, 0xCu);
            }
          }
        }
        while (v11 < [(NSArray *)self->_sortedSuggestedAmounts count] - 1);
      }
      unint64_t v19 = [(NSArray *)self->_sortedSuggestedAmounts count];
      if (v19 <= [(id)objc_opt_class() maximumNumberSuggestions])
      {
        if (v22) {
          unint64_t *v22 = 0;
        }
        BOOL v8 = 1;
      }
      else
      {
        if (!v22) {
          goto LABEL_32;
        }
        BOOL v8 = 0;
        unint64_t *v22 = 4;
      }
LABEL_33:
      uint64_t v7 = v23;
      uint64_t v6 = v24;
      id v9 = v21;
    }
    else
    {
      BOOL v8 = 0;
      if (a3) {
        *a3 = 2;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
    if (a3) {
      *a3 = 1;
    }
  }

  return v8;
}

- (void)attemptToPurgeInvalidSuggestedAmounts
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v40 = 0;
  unint64_t v4 = 0x1E4F28000uLL;
  id v36 = v3;
  do
  {
    -[PKBillPaymentSuggestedAmountList isValidWithUnableReason:](self, "isValidWithUnableReason:", &v40, v36);
    unint64_t v5 = [*(id *)(v4 + 3792) numberWithUnsignedInteger:v40];
    int v6 = [v3 containsObject:v5];
    if (v40) {
      int v7 = v6;
    }
    else {
      int v7 = 1;
    }

    BOOL v8 = [*(id *)(v4 + 3792) numberWithUnsignedInteger:v40];
    [v3 addObject:v8];

    if (v40 == 2)
    {
      int v37 = v7;
      NSUInteger v27 = [(NSArray *)self->_sortedSuggestedAmounts count];
      uint64_t v13 = [(PKBillPaymentSuggestedAmountList *)self suggestedAmountWithCategory:18];
      uint64_t v28 = [(PKBillPaymentSuggestedAmountList *)self suggestedAmountWithCategory:19];
      if (v13 | v28)
      {
        uint64_t v14 = (void *)v28;
        uint64_t v29 = [(PKBillPaymentSuggestedAmountList *)self maximumSuggestedAmount];
        if (v29)
        {
          v30 = (void *)v29;
          do
          {
            if ([v30 category] == 18) {
              break;
            }
            uint64_t v31 = [v30 category];
            BOOL v32 = v27-- != 0;
            BOOL v33 = v32;
            if (v31 == 19 || !v33) {
              break;
            }
            long long v34 = PKLogFacilityTypeGetObject(0xEuLL);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v42 = (uint64_t)v30;
              _os_log_impl(&dword_190E10000, v34, OS_LOG_TYPE_DEFAULT, "Removing maximum suggestion that has the wrong category from list %@", buf, 0xCu);
            }

            [(PKBillPaymentSuggestedAmountList *)self _removeSuggestedAmount:v30];
            uint64_t v35 = [(PKBillPaymentSuggestedAmountList *)self maximumSuggestedAmount];

            v30 = (void *)v35;
          }
          while (v35);
        }
      }
      else
      {
        uint64_t v14 = 0;
        uint64_t v13 = 0;
      }
    }
    else
    {
      if (v40 != 3)
      {
        if (v40 == 4)
        {
          while (1)
          {
            unint64_t v9 = [(NSArray *)self->_sortedSuggestedAmounts count];
            if (v9 <= [(id)objc_opt_class() maximumNumberSuggestions]) {
              break;
            }
            long long v10 = [(PKBillPaymentSuggestedAmountList *)self _lastSuggestedAmountThatIsNotRequred];
            unint64_t v11 = PKLogFacilityTypeGetObject(0xEuLL);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v42 = (uint64_t)v10;
              _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Removing extra suggested amount from bill payment suggested amount list %@", buf, 0xCu);
            }

            [(PKBillPaymentSuggestedAmountList *)self _removeSuggestedAmount:v10];
          }
        }
        continue;
      }
      int v37 = v7;
      NSUInteger v12 = [(NSArray *)self->_sortedSuggestedAmounts count];
      uint64_t v13 = 0;
      while (1)
      {
        NSUInteger v38 = v12;

        uint64_t v14 = [(PKBillPaymentSuggestedAmountList *)self _boundaryAmount];
        unint64_t v15 = 0;
        uint64_t v13 = 0;
        v39 = v14;
        do
        {
          if (v15 >= [(NSArray *)self->_sortedSuggestedAmounts count] - 1) {
            break;
          }
          long long v16 = [(NSArray *)self->_sortedSuggestedAmounts objectAtIndex:v15];
          BOOL v17 = [(NSArray *)self->_sortedSuggestedAmounts objectAtIndex:++v15];
          BOOL v18 = [v16 amount];
          unint64_t v19 = [v17 amount];
          v20 = [v19 decimalNumberBySubtracting:v18];
          uint64_t v21 = [v20 compare:v14];
          if (v21 == -1)
          {
            v22 = (void *)v13;
            uint64_t v23 = [v16 priority];
            if (v23 == [v17 priority])
            {
              id v24 = [(PKBillPaymentSuggestedAmountList *)self _suggestedAmountThatIsNotRequired:v16 suggestedAmount2:v17];
            }
            else
            {
              uint64_t v25 = [v16 priority];
              if (v25 <= [v17 priority]) {
                id v24 = v16;
              }
              else {
                id v24 = v17;
              }
            }
            uint64_t v13 = (uint64_t)v24;

            uint64_t v14 = v39;
          }
        }
        while (v21 != -1);
        if (!v13) {
          break;
        }
        id v26 = PKLogFacilityTypeGetObject(0xEuLL);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v42 = v13;
          _os_log_impl(&dword_190E10000, v26, OS_LOG_TYPE_DEFAULT, "Removing overlapping suggested amount from bill payment suggested amount list %@", buf, 0xCu);
        }

        [(PKBillPaymentSuggestedAmountList *)self _removeSuggestedAmount:v13];
        NSUInteger v12 = v38 - 1;

        if (v38 == 1) {
          goto LABEL_43;
        }
      }
    }

LABEL_43:
    id v3 = v36;
    unint64_t v4 = 0x1E4F28000;
    int v7 = v37;
  }
  while (!v7);
}

- (id)description
{
  return [(NSArray *)self->_sortedSuggestedAmounts description];
}

- (void)_removeSuggestedAmount:(id)a3
{
  suggestionsForCategory = self->_suggestionsForCategory;
  unint64_t v5 = NSNumber;
  id v6 = a3;
  int v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "category"));
  [(NSMutableDictionary *)suggestionsForCategory removeObjectForKey:v7];

  suggestionsForAmount = self->_suggestionsForAmount;
  unint64_t v9 = [v6 amount];

  [(NSMutableDictionary *)suggestionsForAmount removeObjectForKey:v9];
  [(PKBillPaymentSuggestedAmountList *)self _updateValues];
}

- (id)_sortedAmounts
{
  double v2 = [(NSMutableDictionary *)self->_suggestionsForAmount allKeys];
  id v3 = [v2 sortedArrayUsingSelector:sel_compare_];

  return v3;
}

- (id)_sortedSuggestedAmounts
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKBillPaymentSuggestedAmountList *)self _sortedAmounts];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = -[NSMutableDictionary objectForKey:](self->_suggestionsForAmount, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  unint64_t v11 = (void *)[v4 copy];
  return v11;
}

- (id)_smalllestSuggestionAmountBelowRemainingStatementAmount
{
  id v3 = [(PKBillPaymentSuggestedAmountList *)self remainingStatementAmount];
  if (v3)
  {
    id v4 = [(PKBillPaymentSuggestedAmountList *)self minimumSuggestedAmount];
    id v5 = [v4 amount];

    if ([v5 compare:v3] == -1) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)_suggestedAmountIsRequiredCategory:(id)a3
{
  uint64_t v3 = [a3 category];
  id v4 = [(id)objc_opt_class() requiredSuggestedAmountCategories];
  id v5 = [NSNumber numberWithUnsignedInteger:v3];
  char v6 = [v4 containsObject:v5];

  return v6;
}

- (id)_lastSuggestedAmountThatIsNotRequred
{
  NSUInteger v3 = [(NSArray *)self->_sortedSuggestedAmounts count];
  if ((uint64_t)(v3 - 1) < 0)
  {
LABEL_5:
    id v5 = 0;
  }
  else
  {
    uint64_t v4 = v3;
    while (1)
    {
      id v5 = [(NSArray *)self->_sortedSuggestedAmounts objectAtIndex:--v4];
      if (![(PKBillPaymentSuggestedAmountList *)self _suggestedAmountIsRequiredCategory:v5])break; {

      }
      if (v4 <= 0) {
        goto LABEL_5;
      }
    }
  }
  return v5;
}

- (id)_suggestedAmountThatIsNotRequired:(id)a3 suggestedAmount2:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(PKBillPaymentSuggestedAmountList *)self _suggestedAmountIsRequiredCategory:v6];
  BOOL v9 = [(PKBillPaymentSuggestedAmountList *)self _suggestedAmountIsRequiredCategory:v7];
  if (v8 && v9)
  {
    id v10 = 0;
  }
  else
  {
    if (v8) {
      unint64_t v11 = v7;
    }
    else {
      unint64_t v11 = v6;
    }
    id v10 = v11;
  }

  return v10;
}

- (void)_updateValues
{
  NSUInteger v3 = [(PKBillPaymentSuggestedAmountList *)self _sortedSuggestedAmounts];
  sortedSuggestedAmounts = self->_sortedSuggestedAmounts;
  self->_sortedSuggestedAmounts = v3;

  id v5 = [(PKBillPaymentSuggestedAmountList *)self _smalllestSuggestionAmountBelowRemainingStatementAmount];
  smalllestSuggestionAmountBelowRemainingStatementAmount = self->_smalllestSuggestionAmountBelowRemainingStatementAmount;
  self->_smalllestSuggestionAmountBelowRemainingStatementAmount = v5;
}

- (id)_boundaryAmount
{
  minimumAmount = self->_minimumAmount;
  if (minimumAmount)
  {
    uint64_t v4 = minimumAmount;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28C28] zero];
  }
  id v5 = v4;
  maximumAmount = self->_maximumAmount;
  if (maximumAmount)
  {
    id v7 = maximumAmount;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28C28] zero];
  }
  BOOL v8 = v7;
  BOOL v9 = [(id)objc_opt_class() boundaryAngle];
  id v10 = [(NSDecimalNumber *)v8 decimalNumberBySubtracting:v5];
  unint64_t v11 = (void *)MEMORY[0x1E4F28C28];
  LODWORD(v12) = 1086918619;
  long long v13 = [NSNumber numberWithFloat:v12];
  long long v14 = v13;
  if (v13)
  {
    [v13 decimalValue];
  }
  else
  {
    v19[0] = 0;
    v19[1] = 0;
    int v20 = 0;
  }
  long long v15 = [v11 decimalNumberWithDecimal:v19];
  long long v16 = [v9 decimalNumberByDividingBy:v15];
  BOOL v17 = [v16 decimalNumberByMultiplyingBy:v10];

  return v17;
}

- (NSArray)sortedSuggestedAmounts
{
  return self->_sortedSuggestedAmounts;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (NSDecimalNumber)minimumAmount
{
  return self->_minimumAmount;
}

- (NSDecimalNumber)remainingStatementAmount
{
  return self->_remainingStatementAmount;
}

- (NSDecimalNumber)maximumAmount
{
  return self->_maximumAmount;
}

- (NSDecimalNumber)smalllestSuggestionAmountBelowRemainingStatementAmount
{
  return self->_smalllestSuggestionAmountBelowRemainingStatementAmount;
}

- (PKBillPaymentSuggestedAmount)initialSuggestedAmount
{
  return self->_initialSuggestedAmount;
}

- (void)setInitialSuggestedAmount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialSuggestedAmount, 0);
  objc_storeStrong((id *)&self->_smalllestSuggestionAmountBelowRemainingStatementAmount, 0);
  objc_storeStrong((id *)&self->_maximumAmount, 0);
  objc_storeStrong((id *)&self->_remainingStatementAmount, 0);
  objc_storeStrong((id *)&self->_minimumAmount, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_sortedSuggestedAmounts, 0);
  objc_storeStrong((id *)&self->_suggestedAmountGapMessageForAmount, 0);
  objc_storeStrong((id *)&self->_suggestionsForAmount, 0);
  objc_storeStrong((id *)&self->_suggestionsForCategory, 0);
}

@end