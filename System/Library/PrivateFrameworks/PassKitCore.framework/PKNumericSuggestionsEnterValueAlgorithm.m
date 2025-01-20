@interface PKNumericSuggestionsEnterValueAlgorithm
- (BOOL)_amountIsValid:(id)a3;
- (BOOL)_lastInputExistsInGeneratedSuggestions:(id)a3 withLastInput:(id)a4;
- (BOOL)_possibleAmountIsValidWithDefaultValue:(id)a3 amount:(id)a4;
- (BOOL)_useMaximumAmountSuggestionWithAmount:(id)a3;
- (BOOL)hasValidDefaultSuggestions;
- (NSArray)defaultValues;
- (NSDecimalNumber)cardBalance;
- (NSDecimalNumber)maxBalance;
- (NSDecimalNumber)maxLoadAmount;
- (NSDecimalNumber)minBalance;
- (NSDecimalNumber)minLoadAmount;
- (NSString)currencyCode;
- (PKNumericSuggestionsEnterValueAlgorithm)init;
- (PKNumericSuggestionsEnterValueAlgorithm)initWithLastInput:(id)a3;
- (id)_generateDefaultSuggestions;
- (id)_generateValuesToDefaults;
- (id)_maxAmountSuggestion;
- (id)_possibleValueForAmount:(id)a3;
- (id)_useMaxAmountSuggestion;
- (id)suggestionsWithAmount:(id)a3;
- (int64_t)decimalPrecision;
- (unint64_t)powerOfTenFactor;
- (void)_generateCalculatedSuggestions;
- (void)setCardBalance:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setDecimalPrecision:(int64_t)a3;
- (void)setDefaultValues:(id)a3;
- (void)setMaxBalance:(id)a3;
- (void)setMaxLoadAmount:(id)a3;
- (void)setMinBalance:(id)a3;
- (void)setMinLoadAmount:(id)a3;
- (void)setPowerOfTenFactor:(unint64_t)a3;
- (void)setUseBuiltInDefaults:(BOOL)a3;
@end

@implementation PKNumericSuggestionsEnterValueAlgorithm

- (PKNumericSuggestionsEnterValueAlgorithm)initWithLastInput:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKNumericSuggestionsEnterValueAlgorithm;
  v6 = [(PKNumericSuggestionsEnterValueAlgorithm *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lastInput, a3);
    v7->_decimalPrecision = 0;
    v7->_powerOfTenFactor = 1;
    v7->_hasValidDefaultSuggestions = 0;
    uint64_t v8 = [MEMORY[0x1E4F28C28] zero];
    cardBalance = v7->_cardBalance;
    v7->_cardBalance = (NSDecimalNumber *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28C30] decimalNumberHandlerWithRoundingMode:0 scale:SLOWORD(v7->_decimalPrecision) raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
    roundingBehavior = v7->_roundingBehavior;
    v7->_roundingBehavior = (NSDecimalNumberHandler *)v10;

    [(PKNumericSuggestionsEnterValueAlgorithm *)v7 _generateCalculatedSuggestions];
  }

  return v7;
}

- (PKNumericSuggestionsEnterValueAlgorithm)init
{
  return [(PKNumericSuggestionsEnterValueAlgorithm *)self initWithLastInput:0];
}

- (BOOL)_lastInputExistsInGeneratedSuggestions:(id)a3 withLastInput:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(PKNumericSuggestionLastInput *)self->_lastInput value];
  v7 = +[PKNumericSuggestion suggestionWithValue:v6 currencyCode:self->_currencyCode];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "isEqual:", v7, (void)v13))
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (id)suggestionsWithAmount:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  if (!v4
    || ([MEMORY[0x1E4F28C28] notANumber],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v4 isEqualToNumber:v6],
        v6,
        v7))
  {
    uint64_t v8 = [MEMORY[0x1E4F28C28] zero];

    id v4 = (id)v8;
  }
  uint64_t v9 = [MEMORY[0x1E4F28C28] zero];
  int v10 = [v4 isEqualToNumber:v9];

  if (v10)
  {
    [v5 addObjectsFromArray:self->_defaultSuggestions];
    lastInput = self->_lastInput;
    if (lastInput)
    {
      v12 = [(PKNumericSuggestionLastInput *)lastInput value];
      if (v12 || [(PKNumericSuggestionLastInput *)self->_lastInput wentToMax])
      {
        BOOL v13 = [(PKNumericSuggestionsEnterValueAlgorithm *)self _lastInputExistsInGeneratedSuggestions:v5 withLastInput:self->_lastInput];

        if (!v13)
        {
          [v5 removeLastObject];
          long long v14 = [(PKNumericSuggestionsEnterValueAlgorithm *)self _maxAmountSuggestion];
          if ([(PKNumericSuggestionLastInput *)self->_lastInput wentToMax] && self->_maxBalance && v14)
          {
            [v5 addObject:v14];
          }
          else
          {
            v33 = [(PKNumericSuggestionLastInput *)self->_lastInput value];
            v34 = +[PKNumericSuggestion suggestionWithValue:v33 currencyCode:self->_currencyCode];
            [v5 addObject:v34];
          }
        }
      }
    }
LABEL_33:
    int v15 = 0;
    goto LABEL_34;
  }
  if (![(PKNumericSuggestionsEnterValueAlgorithm *)self _useMaximumAmountSuggestionWithAmount:v4])
  {
    long long v16 = [(PKNumericSuggestionsEnterValueAlgorithm *)self _possibleValueForAmount:v4];
    int v17 = [v16 isEqual:v4];
    if ((v17 & 1) == 0)
    {
      uint64_t v18 = +[PKNumericSuggestion suggestionWithValue:v16 currencyCode:self->_currencyCode];
      [v5 addObject:v18];
    }
    defaultSuggestions = self->_defaultSuggestions;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __65__PKNumericSuggestionsEnterValueAlgorithm_suggestionsWithAmount___block_invoke;
    v49[3] = &unk_1E56E14A0;
    id v20 = v4;
    id v50 = v20;
    id v21 = v16;
    id v51 = v21;
    v52 = self;
    v22 = [(NSArray *)defaultSuggestions pk_objectsPassingTest:v49];
    [v5 addObjectsFromArray:v22];

    if ((unint64_t)[v5 count] >= 4)
    {
      v23 = objc_msgSend(v5, "subarrayWithRange:", 0, 3);
      uint64_t v24 = [v23 mutableCopy];

      id v5 = (void *)v24;
    }
    valuesToDefaults = self->_valuesToDefaults;
    uint64_t v42 = MEMORY[0x1E4F143A8];
    uint64_t v43 = 3221225472;
    v44 = __65__PKNumericSuggestionsEnterValueAlgorithm_suggestionsWithAmount___block_invoke_2;
    v45 = &unk_1E56E14A0;
    id v46 = v20;
    id v26 = v21;
    id v47 = v26;
    v48 = self;
    v27 = [(NSArray *)valuesToDefaults pk_objectsPassingTest:&v42];
    if (objc_msgSend(v27, "count", v42, v43, v44, v45))
    {
      if ([v5 count] == 3) {
        [v5 removeLastObject];
      }
      v28 = [v27 firstObject];
      [v5 addObject:v28];
    }
    if ((unint64_t)[v5 count] <= 2)
    {
      NSUInteger v29 = [(NSArray *)self->_defaultSuggestions count];
      if ((uint64_t)(v29 - 1) >= 0)
      {
        uint64_t v30 = v29;
        uint64_t v31 = v17 ^ 1u;
        do
        {
          if ((unint64_t)[v5 count] > 2) {
            break;
          }
          v32 = [(NSArray *)self->_defaultSuggestions objectAtIndex:--v30];
          if (([v5 containsObject:v32] & 1) == 0) {
            [v5 insertObject:v32 atIndex:v31];
          }
        }
        while (v30 > 0);
      }
    }

    goto LABEL_33;
  }
  int v15 = 1;
LABEL_34:
  uint64_t v35 = [(PKNumericSuggestionsEnterValueAlgorithm *)self _useMaxAmountSuggestion];
  v36 = (void *)v35;
  if (v15 && v35)
  {
    [v5 removeAllObjects];
    [v5 addObject:v36];
  }
  else if ((unint64_t)[v5 count] < 4)
  {
    if ((unint64_t)[v5 count] <= 2)
    {
      v40 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        int v54 = 3;
        __int16 v55 = 2112;
        v56 = v5;
        _os_log_impl(&dword_190E10000, v40, OS_LOG_TYPE_DEFAULT, "Something went wrong with the suggestions. There should be %d suggestions. But the suggestions were actually %@", buf, 0x12u);
      }

      [v5 removeAllObjects];
      [v5 addObjectsFromArray:self->_defaultSuggestions];
    }
  }
  else
  {
    v37 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v54 = 3;
      __int16 v55 = 2112;
      v56 = v5;
      _os_log_impl(&dword_190E10000, v37, OS_LOG_TYPE_DEFAULT, "Something went wrong with the suggestions. There should be %d suggestions. But the suggestions were actually %@", buf, 0x12u);
    }

    v38 = objc_msgSend(v5, "subarrayWithRange:", 0, 3);
    uint64_t v39 = [v38 mutableCopy];

    id v5 = (void *)v39;
  }

  return v5;
}

uint64_t __65__PKNumericSuggestionsEnterValueAlgorithm_suggestionsWithAmount___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 value];
  if ([v4 isEqualToNumber:a1[4]])
  {
    uint64_t v5 = 0;
  }
  else
  {
    v6 = [v3 value];
    if ([v6 isEqualToNumber:a1[5]])
    {
      uint64_t v5 = 0;
    }
    else
    {
      int v7 = (void *)a1[6];
      uint64_t v8 = [v3 value];
      uint64_t v5 = [v7 _possibleAmountIsValidWithDefaultValue:v8 amount:a1[4]];
    }
  }

  return v5;
}

uint64_t __65__PKNumericSuggestionsEnterValueAlgorithm_suggestionsWithAmount___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 value];
  if ([v4 isEqualToNumber:a1[4]])
  {
    uint64_t v5 = 0;
  }
  else
  {
    v6 = [v3 value];
    if ([v6 isEqualToNumber:a1[5]])
    {
      uint64_t v5 = 0;
    }
    else
    {
      int v7 = (void *)a1[6];
      uint64_t v8 = [v3 value];
      uint64_t v5 = [v7 _possibleAmountIsValidWithDefaultValue:v8 amount:a1[4]];
    }
  }

  return v5;
}

- (void)setDefaultValues:(id)a3
{
  if (self->_defaultValues != a3)
  {
    id v4 = (NSArray *)[a3 copy];
    defaultValues = self->_defaultValues;
    self->_defaultValues = v4;

    [(PKNumericSuggestionsEnterValueAlgorithm *)self _generateCalculatedSuggestions];
  }
}

- (void)setPowerOfTenFactor:(unint64_t)a3
{
  if (self->_powerOfTenFactor != a3)
  {
    self->_powerOfTenFactor = (unint64_t)fmax((double)a3, 1.0);
    [(PKNumericSuggestionsEnterValueAlgorithm *)self _generateCalculatedSuggestions];
  }
}

- (void)setMinBalance:(id)a3
{
  id v4 = (NSDecimalNumber *)a3;
  if (self->_minBalance != v4)
  {
    uint64_t v9 = v4;
    uint64_t v5 = [MEMORY[0x1E4F28C28] notANumber];
    char v6 = [(NSDecimalNumber *)v9 isEqualToNumber:v5];

    if (v6) {
      int v7 = 0;
    }
    else {
      int v7 = (NSDecimalNumber *)[(NSDecimalNumber *)v9 copy];
    }
    minBalance = self->_minBalance;
    self->_minBalance = v7;

    [(PKNumericSuggestionsEnterValueAlgorithm *)self _generateCalculatedSuggestions];
    id v4 = v9;
  }
}

- (void)setMaxBalance:(id)a3
{
  id v4 = (NSDecimalNumber *)a3;
  if (self->_maxBalance != v4)
  {
    int v10 = v4;
    uint64_t v5 = [MEMORY[0x1E4F28C28] notANumber];
    if ([(NSDecimalNumber *)v10 isEqualToNumber:v5])
    {
    }
    else
    {
      char v6 = [MEMORY[0x1E4F28C28] zero];
      char v7 = [(NSDecimalNumber *)v10 isEqualToNumber:v6];

      if ((v7 & 1) == 0)
      {
        uint64_t v8 = (NSDecimalNumber *)[(NSDecimalNumber *)v10 copy];
        goto LABEL_7;
      }
    }
    uint64_t v8 = 0;
LABEL_7:
    maxBalance = self->_maxBalance;
    self->_maxBalance = v8;

    [(PKNumericSuggestionsEnterValueAlgorithm *)self _generateCalculatedSuggestions];
    id v4 = v10;
  }
}

- (void)setMinLoadAmount:(id)a3
{
  id v4 = (NSDecimalNumber *)a3;
  if (self->_minLoadAmount != v4)
  {
    int v10 = v4;
    uint64_t v5 = [MEMORY[0x1E4F28C28] notANumber];
    if ([(NSDecimalNumber *)v10 isEqualToNumber:v5])
    {
    }
    else
    {
      char v6 = [MEMORY[0x1E4F28C28] zero];
      char v7 = [(NSDecimalNumber *)v10 isEqualToNumber:v6];

      if ((v7 & 1) == 0)
      {
        uint64_t v8 = (NSDecimalNumber *)[(NSDecimalNumber *)v10 copy];
        goto LABEL_7;
      }
    }
    uint64_t v8 = 0;
LABEL_7:
    minLoadAmount = self->_minLoadAmount;
    self->_minLoadAmount = v8;

    [(PKNumericSuggestionsEnterValueAlgorithm *)self _generateCalculatedSuggestions];
    id v4 = v10;
  }
}

- (void)setMaxLoadAmount:(id)a3
{
  id v4 = (NSDecimalNumber *)a3;
  if (self->_maxLoadAmount != v4)
  {
    int v10 = v4;
    uint64_t v5 = [MEMORY[0x1E4F28C28] notANumber];
    if ([(NSDecimalNumber *)v10 isEqualToNumber:v5])
    {
    }
    else
    {
      char v6 = [MEMORY[0x1E4F28C28] zero];
      char v7 = [(NSDecimalNumber *)v10 isEqualToNumber:v6];

      if ((v7 & 1) == 0)
      {
        uint64_t v8 = (NSDecimalNumber *)[(NSDecimalNumber *)v10 copy];
        goto LABEL_7;
      }
    }
    uint64_t v8 = 0;
LABEL_7:
    maxLoadAmount = self->_maxLoadAmount;
    self->_maxLoadAmount = v8;

    [(PKNumericSuggestionsEnterValueAlgorithm *)self _generateCalculatedSuggestions];
    id v4 = v10;
  }
}

- (void)setDecimalPrecision:(int64_t)a3
{
  if (self->_decimalPrecision != a3)
  {
    self->_decimalPrecision = a3;
    id v4 = [MEMORY[0x1E4F28C30] decimalNumberHandlerWithRoundingMode:0 scale:(__int16)a3 raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
    roundingBehavior = self->_roundingBehavior;
    self->_roundingBehavior = v4;

    [(PKNumericSuggestionsEnterValueAlgorithm *)self _generateCalculatedSuggestions];
  }
}

- (void)setCardBalance:(id)a3
{
  if (self->_cardBalance != a3)
  {
    id v4 = (NSDecimalNumber *)[a3 copy];
    cardBalance = self->_cardBalance;
    self->_cardBalance = v4;

    [(PKNumericSuggestionsEnterValueAlgorithm *)self _generateCalculatedSuggestions];
  }
}

- (void)setUseBuiltInDefaults:(BOOL)a3
{
  if (self->_useBuiltInDefaults != a3)
  {
    self->_useBuiltInDefaults = a3;
    [(PKNumericSuggestionsEnterValueAlgorithm *)self _generateCalculatedSuggestions];
  }
}

- (BOOL)_amountIsValid:(id)a3
{
  id v4 = a3;
  if (!v4
    || ([MEMORY[0x1E4F28C28] notANumber],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v4 isEqualToNumber:v5],
        v5,
        (v6 & 1) != 0)
    || self->_minLoadAmount && objc_msgSend(v4, "compare:") == -1
    || self->_maxLoadAmount && objc_msgSend(v4, "compare:") == 1)
  {
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v9 = [(NSDecimalNumber *)self->_cardBalance decimalNumberByAdding:v4];
    int v10 = v9;
    BOOL v7 = (!self->_minBalance || objc_msgSend(v9, "compare:") != -1)
      && (!self->_maxBalance || objc_msgSend(v10, "compare:") != 1);
  }
  return v7;
}

- (BOOL)_useMaximumAmountSuggestionWithAmount:(id)a3
{
  id v4 = a3;
  maxLoadAmount = self->_maxLoadAmount;
  if (maxLoadAmount && [(NSDecimalNumber *)maxLoadAmount compare:v4] == NSOrderedAscending)
  {
    BOOL v8 = 1;
  }
  else
  {
    char v6 = [(NSDecimalNumber *)self->_cardBalance decimalNumberByAdding:v4];
    maxBalance = self->_maxBalance;
    BOOL v8 = maxBalance && [(NSDecimalNumber *)maxBalance compare:v6] == NSOrderedAscending;
  }
  return v8;
}

- (BOOL)_possibleAmountIsValidWithDefaultValue:(id)a3 amount:(id)a4
{
  id v6 = a3;
  BOOL v7 = [(PKNumericSuggestionsEnterValueAlgorithm *)self _possibleValueForAmount:a4];
  uint64_t v8 = [v7 compare:v6];

  return (unint64_t)(v8 + 1) < 2;
}

- (id)_possibleValueForAmount:(id)a3
{
  id v4 = a3;
  unint64_t powerOfTenFactor = self->_powerOfTenFactor;
  id v6 = [v4 stringValue];
  if ((uint64_t)(powerOfTenFactor - [v6 length] + 1) < 0)
  {
    __int16 v9 = 0;
  }
  else
  {
    int v7 = self->_powerOfTenFactor;
    uint64_t v8 = [v4 stringValue];
    __int16 v9 = v7 - [v8 length] + 1;
  }
  int v10 = [v4 decimalNumberByMultiplyingByPowerOf10:v9 withBehavior:self->_roundingBehavior];

  return v10;
}

- (void)_generateCalculatedSuggestions
{
  id v3 = [(PKNumericSuggestionsEnterValueAlgorithm *)self _generateDefaultSuggestions];
  defaultSuggestions = self->_defaultSuggestions;
  self->_defaultSuggestions = v3;

  uint64_t v5 = [(PKNumericSuggestionsEnterValueAlgorithm *)self _generateValuesToDefaults];
  valuesToDefaults = self->_valuesToDefaults;
  self->_valuesToDefaults = v5;
}

- (id)_useMaxAmountSuggestion
{
  maxBalance = self->_maxBalance;
  if (maxBalance)
  {
    id v4 = [(NSDecimalNumber *)maxBalance decimalNumberBySubtracting:self->_cardBalance withBehavior:self->_roundingBehavior];
  }
  else
  {
    id v4 = 0;
  }
  maxLoadAmount = self->_maxLoadAmount;
  if (maxLoadAmount && [(NSDecimalNumber *)maxLoadAmount compare:v4] == NSOrderedAscending)
  {
    v11 = [(NSDecimalNumber *)self->_maxLoadAmount decimalNumberByAdding:self->_cardBalance withBehavior:self->_roundingBehavior];
    uint64_t v12 = [v11 compare:self->_maxBalance];

    if (v12 == 1)
    {
      BOOL v13 = [(NSDecimalNumber *)self->_maxBalance decimalNumberBySubtracting:self->_cardBalance withBehavior:self->_roundingBehavior];
    }
    else
    {
      BOOL v13 = self->_maxLoadAmount;
    }
    long long v14 = v13;

    id v4 = v14;
    if (!v14) {
      goto LABEL_15;
    }
  }
  else if (!v4)
  {
    goto LABEL_15;
  }
  id v6 = [MEMORY[0x1E4F28C28] zero];
  if ([v4 compare:v6])
  {
    int v7 = [MEMORY[0x1E4F28C28] zero];
    uint64_t v8 = [v4 compare:v7];

    if (v8 == 1)
    {
      __int16 v9 = [[PKNumericSuggestion alloc] initWithValue:v4 currencyCode:self->_currencyCode];
      int v10 = PKLocalizedPaymentString(&cfstr_NumericSuggest.isa, 0);
      [(PKNumericSuggestion *)v9 setDisplayValue:v10];

      [(PKNumericSuggestion *)v9 setUsedMaximumSuggestion:1];
      goto LABEL_16;
    }
  }
  else
  {
  }
LABEL_15:
  __int16 v9 = 0;
LABEL_16:

  return v9;
}

- (id)_maxAmountSuggestion
{
  maxBalance = self->_maxBalance;
  if (maxBalance)
  {
    id v4 = [(NSDecimalNumber *)maxBalance decimalNumberBySubtracting:self->_cardBalance withBehavior:self->_roundingBehavior];
  }
  else
  {
    id v4 = 0;
  }
  maxLoadAmount = self->_maxLoadAmount;
  if (maxLoadAmount && [(NSDecimalNumber *)maxLoadAmount compare:v4] == NSOrderedAscending)
  {
    uint64_t v11 = [(NSDecimalNumber *)self->_maxLoadAmount decimalNumberBySubtracting:self->_cardBalance withBehavior:self->_roundingBehavior];

    id v4 = (void *)v11;
    if (!v11) {
      goto LABEL_13;
    }
  }
  else if (!v4)
  {
    goto LABEL_13;
  }
  id v6 = [MEMORY[0x1E4F28C28] zero];
  if ([v4 compare:v6])
  {
    int v7 = [MEMORY[0x1E4F28C28] zero];
    uint64_t v8 = [v4 compare:v7];

    if (v8 == 1)
    {
      __int16 v9 = [[PKNumericSuggestion alloc] initWithValue:v4 currencyCode:self->_currencyCode];
      int v10 = PKLocalizedPaymentString(&cfstr_NumericSuggest.isa, 0);
      [(PKNumericSuggestion *)v9 setDisplayValue:v10];

      [(PKNumericSuggestion *)v9 setUsedMaximumSuggestion:1];
      goto LABEL_14;
    }
  }
  else
  {
  }
LABEL_13:
  __int16 v9 = 0;
LABEL_14:

  return v9;
}

- (id)_generateDefaultSuggestions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = self->_defaultValues;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        __int16 v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int v10 = objc_msgSend(MEMORY[0x1E4F28C28], "zero", (void)v18);
        uint64_t v11 = [v9 compare:v10];

        if (v11 == 1)
        {
          uint64_t v12 = +[PKNumericSuggestion suggestionWithValue:v9 currencyCode:self->_currencyCode];
          [v3 addObject:v12];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  BOOL v13 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v3];
  long long v14 = [v13 array];
  int v15 = (void *)[v14 mutableCopy];

  self->_hasValidDefaultSuggestions = [v15 count] == 3;
  [v15 sortUsingComparator:&__block_literal_global_48];
  long long v16 = (void *)[v15 copy];

  return v16;
}

uint64_t __70__PKNumericSuggestionsEnterValueAlgorithm__generateDefaultSuggestions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 value];
  uint64_t v6 = [v4 value];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_generateValuesToDefaults
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = self->_defaultSuggestions;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v19 + 1) + 8 * i) value];
        cardBalance = self->_cardBalance;
        int v10 = v8;
        if (cardBalance)
        {
          uint64_t v11 = [MEMORY[0x1E4F28C28] notANumber];
          char v12 = [(NSDecimalNumber *)cardBalance isEqualToNumber:v11];

          int v10 = v8;
          if ((v12 & 1) == 0)
          {
            int v10 = [v8 decimalNumberBySubtracting:self->_cardBalance];
          }
        }
        BOOL v13 = [MEMORY[0x1E4F28C28] zero];
        uint64_t v14 = [v10 compare:v13];

        if (v14 == 1
          && ([v10 isEqualToNumber:v8] & 1) == 0
          && [(PKNumericSuggestionsEnterValueAlgorithm *)self _amountIsValid:v10])
        {
          int v15 = +[PKNumericSuggestion suggestionWithValue:v10 currencyCode:self->_currencyCode];
          [v18 addObject:v15];
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  long long v16 = (void *)[v18 copy];
  return v16;
}

- (NSDecimalNumber)cardBalance
{
  return self->_cardBalance;
}

- (NSDecimalNumber)minBalance
{
  return self->_minBalance;
}

- (NSDecimalNumber)maxBalance
{
  return self->_maxBalance;
}

- (NSDecimalNumber)minLoadAmount
{
  return self->_minLoadAmount;
}

- (NSDecimalNumber)maxLoadAmount
{
  return self->_maxLoadAmount;
}

- (NSArray)defaultValues
{
  return self->_defaultValues;
}

- (unint64_t)powerOfTenFactor
{
  return self->_powerOfTenFactor;
}

- (int64_t)decimalPrecision
{
  return self->_decimalPrecision;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (BOOL)hasValidDefaultSuggestions
{
  return self->_hasValidDefaultSuggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_defaultValues, 0);
  objc_storeStrong((id *)&self->_maxLoadAmount, 0);
  objc_storeStrong((id *)&self->_minLoadAmount, 0);
  objc_storeStrong((id *)&self->_maxBalance, 0);
  objc_storeStrong((id *)&self->_minBalance, 0);
  objc_storeStrong((id *)&self->_cardBalance, 0);
  objc_storeStrong((id *)&self->_lastInput, 0);
  objc_storeStrong((id *)&self->_defaultSuggestions, 0);
  objc_storeStrong((id *)&self->_valuesToDefaults, 0);
  objc_storeStrong((id *)&self->_roundingBehavior, 0);
}

@end