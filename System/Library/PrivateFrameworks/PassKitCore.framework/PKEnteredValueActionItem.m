@interface PKEnteredValueActionItem
+ (BOOL)supportsSecureCoding;
- (BOOL)maxAmountIncludesLocalBalance;
- (NSArray)defaultSuggestions;
- (NSArray)lowBalanceReminderOptions;
- (NSDecimalNumber)maxAmount;
- (NSDecimalNumber)maxLoadAmount;
- (NSDecimalNumber)maxLoadedBalance;
- (NSDecimalNumber)minAmount;
- (NSDecimalNumber)minLoadAmount;
- (NSDecimalNumber)minLoadedBalance;
- (NSDictionary)serviceProviderData;
- (NSString)currency;
- (PKEnteredValueActionItem)init;
- (PKEnteredValueActionItem)initWithCoder:(id)a3;
- (PKEnteredValueActionItem)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKEnteredValueActionItem

- (PKEnteredValueActionItem)init
{
  return 0;
}

- (PKEnteredValueActionItem)initWithDictionary:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v67.receiver = self;
  v67.super_class = (Class)PKEnteredValueActionItem;
  v5 = [(PKEnteredValueActionItem *)&v67 init];
  if (v5)
  {
    v6 = [v4 PKDecimalNumberForKey:@"minLoadAmount"];
    uint64_t v7 = [v6 copy];
    minLoadAmount = v5->_minLoadAmount;
    v5->_minLoadAmount = (NSDecimalNumber *)v7;

    v9 = [v4 PKDecimalNumberForKey:@"maxLoadAmount"];
    uint64_t v10 = [v9 copy];
    maxLoadAmount = v5->_maxLoadAmount;
    v5->_maxLoadAmount = (NSDecimalNumber *)v10;

    v12 = [v4 PKDecimalNumberForKey:@"minLoadedBalance"];
    uint64_t v13 = [v12 copy];
    minLoadedBalance = v5->_minLoadedBalance;
    v5->_minLoadedBalance = (NSDecimalNumber *)v13;

    v15 = [v4 PKDecimalNumberForKey:@"maxLoadedBalance"];
    uint64_t v16 = [v15 copy];
    maxLoadedBalance = v5->_maxLoadedBalance;
    v5->_maxLoadedBalance = (NSDecimalNumber *)v16;

    if (!v5->_minLoadAmount)
    {
      v18 = [v4 PKDecimalNumberForKey:@"minAmount"];
      uint64_t v19 = [v18 copy];
      v20 = v5->_minLoadAmount;
      v5->_minLoadAmount = (NSDecimalNumber *)v19;

      v21 = [v4 PKDecimalNumberForKey:@"maxAmount"];
      uint64_t v22 = [v21 copy];
      v23 = v5->_maxLoadedBalance;
      v5->_maxLoadedBalance = (NSDecimalNumber *)v22;
    }
    v5->_maxAmountIncludesLocalBalance = [v4 PKBoolForKey:@"maxAmountIncludesLocalBalance"];
    v24 = [v4 PKStringForKey:@"currency"];
    uint64_t v25 = [v24 copy];
    currency = v5->_currency;
    v5->_currency = (NSString *)v25;

    v27 = [v4 PKDictionaryForKey:@"serviceProviderData"];
    uint64_t v28 = [v27 copy];
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = (NSDictionary *)v28;

    v30 = [MEMORY[0x1E4F1CA48] array];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v54 = v4;
    v31 = [v4 PKArrayForKey:@"defaultSuggestions"];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v63 objects:v69 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v64;
      do
      {
        uint64_t v35 = 0;
        do
        {
          if (*(void *)v64 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = *(void **)(*((void *)&v63 + 1) + 8 * v35);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v37 = (void *)MEMORY[0x1E4F28C28];
            if (v36)
            {
              [v36 decimalValue];
            }
            else
            {
              v61[0] = 0;
              v61[1] = 0;
              int v62 = 0;
            }
            v38 = [v37 decimalNumberWithDecimal:v61];
            if (v38) {
              [v30 addObject:v38];
            }
          }
          ++v35;
        }
        while (v33 != v35);
        uint64_t v33 = [v31 countByEnumeratingWithState:&v63 objects:v69 count:16];
      }
      while (v33);
    }

    uint64_t v39 = [v30 copy];
    defaultSuggestions = v5->_defaultSuggestions;
    v53 = v5;
    v5->_defaultSuggestions = (NSArray *)v39;

    v41 = [MEMORY[0x1E4F1CA48] array];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v42 = [v54 PKArrayForKey:@"lowBalanceReminderOptions"];
    uint64_t v43 = [v42 countByEnumeratingWithState:&v57 objects:v68 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v58;
      do
      {
        uint64_t v46 = 0;
        do
        {
          if (*(void *)v58 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = *(void **)(*((void *)&v57 + 1) + 8 * v46);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v48 = (void *)MEMORY[0x1E4F28C28];
            if (v47)
            {
              [v47 decimalValue];
            }
            else
            {
              v55[0] = 0;
              v55[1] = 0;
              int v56 = 0;
            }
            v49 = [v48 decimalNumberWithDecimal:v55];
            if (v49) {
              [v41 addObject:v49];
            }
          }
          ++v46;
        }
        while (v44 != v46);
        uint64_t v44 = [v42 countByEnumeratingWithState:&v57 objects:v68 count:16];
      }
      while (v44);
    }

    uint64_t v50 = [v41 copy];
    v5 = v53;
    lowBalanceReminderOptions = v53->_lowBalanceReminderOptions;
    v53->_lowBalanceReminderOptions = (NSArray *)v50;

    id v4 = v54;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKEnteredValueActionItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PKEnteredValueActionItem;
  v5 = [(PKEnteredValueActionItem *)&v46 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minLoadAmount"];
    uint64_t v7 = [v6 copy];
    minLoadAmount = v5->_minLoadAmount;
    v5->_minLoadAmount = (NSDecimalNumber *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxLoadAmount"];
    uint64_t v10 = [v9 copy];
    maxLoadAmount = v5->_maxLoadAmount;
    v5->_maxLoadAmount = (NSDecimalNumber *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minLoadedBalance"];
    uint64_t v13 = [v12 copy];
    minLoadedBalance = v5->_minLoadedBalance;
    v5->_minLoadedBalance = (NSDecimalNumber *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxLoadedBalance"];
    uint64_t v16 = [v15 copy];
    maxLoadedBalance = v5->_maxLoadedBalance;
    v5->_maxLoadedBalance = (NSDecimalNumber *)v16;

    if (!v5->_minLoadAmount)
    {
      v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minAmount"];
      uint64_t v19 = [v18 copy];
      v20 = v5->_minLoadAmount;
      v5->_minLoadAmount = (NSDecimalNumber *)v19;
    }
    if (!v5->_maxLoadedBalance)
    {
      v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxAmount"];
      uint64_t v22 = [v21 copy];
      v23 = v5->_maxLoadedBalance;
      v5->_maxLoadedBalance = (NSDecimalNumber *)v22;
    }
    v5->_maxAmountIncludesLocalBalance = [v4 decodeBoolForKey:@"maxAmountIncludesLocalBalance"];
    v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    v27 = [v4 decodeObjectOfClasses:v26 forKey:@"defaultSuggestions"];
    uint64_t v28 = [v27 copy];
    defaultSuggestions = v5->_defaultSuggestions;
    v5->_defaultSuggestions = (NSArray *)v28;

    v30 = [v4 decodeObjectOfClasses:v26 forKey:@"lowBalanceReminderOptions"];
    uint64_t v31 = [v30 copy];
    lowBalanceReminderOptions = v5->_lowBalanceReminderOptions;
    v5->_lowBalanceReminderOptions = (NSArray *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currency"];
    uint64_t v34 = [v33 copy];
    currency = v5->_currency;
    v5->_currency = (NSString *)v34;

    v36 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v37 = objc_opt_class();
    uint64_t v38 = objc_opt_class();
    uint64_t v39 = objc_opt_class();
    uint64_t v40 = objc_opt_class();
    v41 = objc_msgSend(v36, "setWithObjects:", v37, v38, v39, v40, objc_opt_class(), 0);
    v42 = [v4 decodeObjectOfClasses:v41 forKey:@"serviceProviderData"];
    uint64_t v43 = [v42 copy];
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = (NSDictionary *)v43;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  minLoadAmount = self->_minLoadAmount;
  id v5 = a3;
  [v5 encodeObject:minLoadAmount forKey:@"minLoadAmount"];
  [v5 encodeObject:self->_maxLoadAmount forKey:@"maxLoadAmount"];
  [v5 encodeObject:self->_minLoadedBalance forKey:@"minLoadedBalance"];
  [v5 encodeObject:self->_maxLoadedBalance forKey:@"maxLoadedBalance"];
  [v5 encodeBool:self->_maxAmountIncludesLocalBalance forKey:@"maxAmountIncludesLocalBalance"];
  [v5 encodeObject:self->_defaultSuggestions forKey:@"defaultSuggestions"];
  [v5 encodeObject:self->_lowBalanceReminderOptions forKey:@"lowBalanceReminderOptions"];
  [v5 encodeObject:self->_currency forKey:@"currency"];
  [v5 encodeObject:self->_serviceProviderData forKey:@"serviceProviderData"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSDecimalNumber *)self->_minLoadAmount copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSDecimalNumber *)self->_maxLoadAmount copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSDecimalNumber *)self->_minLoadedBalance copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSDecimalNumber *)self->_maxLoadedBalance copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  uint64_t v14 = [(NSArray *)self->_defaultSuggestions copyWithZone:a3];
  v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  uint64_t v16 = [(NSString *)self->_currency copyWithZone:a3];
  v17 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v16;

  uint64_t v18 = [(NSArray *)self->_lowBalanceReminderOptions copyWithZone:a3];
  uint64_t v19 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v18;

  uint64_t v20 = [(NSDictionary *)self->_serviceProviderData copyWithZone:a3];
  v21 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v20;

  *(unsigned char *)(v5 + 8) = self->_maxAmountIncludesLocalBalance;
  return (id)v5;
}

- (NSDecimalNumber)minAmount
{
  v2 = (void *)[(NSDecimalNumber *)self->_minLoadAmount copy];
  return (NSDecimalNumber *)v2;
}

- (NSDecimalNumber)maxAmount
{
  v2 = (void *)[(NSDecimalNumber *)self->_maxLoadedBalance copy];
  return (NSDecimalNumber *)v2;
}

- (NSDecimalNumber)minLoadAmount
{
  return self->_minLoadAmount;
}

- (NSDecimalNumber)maxLoadAmount
{
  return self->_maxLoadAmount;
}

- (NSDecimalNumber)minLoadedBalance
{
  return self->_minLoadedBalance;
}

- (NSDecimalNumber)maxLoadedBalance
{
  return self->_maxLoadedBalance;
}

- (NSArray)defaultSuggestions
{
  return self->_defaultSuggestions;
}

- (NSArray)lowBalanceReminderOptions
{
  return self->_lowBalanceReminderOptions;
}

- (BOOL)maxAmountIncludesLocalBalance
{
  return self->_maxAmountIncludesLocalBalance;
}

- (NSString)currency
{
  return self->_currency;
}

- (NSDictionary)serviceProviderData
{
  return self->_serviceProviderData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProviderData, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_lowBalanceReminderOptions, 0);
  objc_storeStrong((id *)&self->_defaultSuggestions, 0);
  objc_storeStrong((id *)&self->_maxLoadedBalance, 0);
  objc_storeStrong((id *)&self->_minLoadedBalance, 0);
  objc_storeStrong((id *)&self->_maxLoadAmount, 0);
  objc_storeStrong((id *)&self->_minLoadAmount, 0);
}

@end