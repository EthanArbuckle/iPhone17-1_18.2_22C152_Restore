@interface PKAutoTopUpActionItem
+ (BOOL)supportsSecureCoding;
- (NSArray)defaultAmountSuggestions;
- (NSArray)defaultThresholdSuggestions;
- (NSArray)lowBalanceReminderOptions;
- (NSDictionary)serviceProviderData;
- (NSString)currency;
- (PKAutoTopUpActionItem)init;
- (PKAutoTopUpActionItem)initWithCoder:(id)a3;
- (PKAutoTopUpActionItem)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKAutoTopUpActionItem

- (PKAutoTopUpActionItem)init
{
  return 0;
}

- (PKAutoTopUpActionItem)initWithDictionary:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)PKAutoTopUpActionItem;
  v5 = [(PKAutoTopUpActionItem *)&v65 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"currency"];
    uint64_t v7 = [v6 copy];
    currency = v5->_currency;
    v5->_currency = (NSString *)v7;

    v9 = [v4 PKDictionaryForKey:@"serviceProviderData"];
    uint64_t v10 = [v9 copy];
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = (NSDictionary *)v10;

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v13 = [v4 PKArrayContaining:objc_opt_class() forKey:@"defaultAmountSuggestions"];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v61 objects:v68 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v62;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v62 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v61 + 1) + 8 * v17);
          v19 = (void *)MEMORY[0x1E4F28C28];
          if (v18)
          {
            [v18 decimalValue];
          }
          else
          {
            v59[0] = 0;
            v59[1] = 0;
            int v60 = 0;
          }
          v20 = [v19 decimalNumberWithDecimal:v59];
          if (v20) {
            [v12 addObject:v20];
          }

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v61 objects:v68 count:16];
      }
      while (v15);
    }

    uint64_t v21 = [v12 copy];
    defaultAmountSuggestions = v5->_defaultAmountSuggestions;
    v5->_defaultAmountSuggestions = (NSArray *)v21;

    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v24 = [v4 PKArrayContaining:objc_opt_class() forKey:@"defaultThresholdSuggestions"];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v55 objects:v67 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v56;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v56 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v55 + 1) + 8 * v28);
          v30 = (void *)MEMORY[0x1E4F28C28];
          if (v29)
          {
            [v29 decimalValue];
          }
          else
          {
            v53[0] = 0;
            v53[1] = 0;
            int v54 = 0;
          }
          v31 = [v30 decimalNumberWithDecimal:v53];
          if (v31) {
            [v23 addObject:v31];
          }

          ++v28;
        }
        while (v26 != v28);
        uint64_t v26 = [v24 countByEnumeratingWithState:&v55 objects:v67 count:16];
      }
      while (v26);
    }

    uint64_t v32 = [v23 copy];
    defaultThresholdSuggestions = v5->_defaultThresholdSuggestions;
    v5->_defaultThresholdSuggestions = (NSArray *)v32;

    v34 = [MEMORY[0x1E4F1CA48] array];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v46 = v4;
    v35 = [v4 PKArrayContaining:objc_opt_class() forKey:@"lowBalanceReminderOptions"];
    uint64_t v36 = [v35 countByEnumeratingWithState:&v49 objects:v66 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v50;
      do
      {
        uint64_t v39 = 0;
        do
        {
          if (*(void *)v50 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = *(void **)(*((void *)&v49 + 1) + 8 * v39);
          v41 = (void *)MEMORY[0x1E4F28C28];
          if (v40)
          {
            [v40 decimalValue];
          }
          else
          {
            v47[0] = 0;
            v47[1] = 0;
            int v48 = 0;
          }
          v42 = [v41 decimalNumberWithDecimal:v47];
          if (v42) {
            [v34 addObject:v42];
          }

          ++v39;
        }
        while (v37 != v39);
        uint64_t v37 = [v35 countByEnumeratingWithState:&v49 objects:v66 count:16];
      }
      while (v37);
    }

    uint64_t v43 = [v34 copy];
    lowBalanceReminderOptions = v5->_lowBalanceReminderOptions;
    v5->_lowBalanceReminderOptions = (NSArray *)v43;

    id v4 = v46;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAutoTopUpActionItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKAutoTopUpActionItem;
  v5 = [(PKAutoTopUpActionItem *)&v31 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"defaultAmountSuggestions"];
    uint64_t v10 = [v9 copy];
    defaultAmountSuggestions = v5->_defaultAmountSuggestions;
    v5->_defaultAmountSuggestions = (NSArray *)v10;

    id v12 = [v4 decodeObjectOfClasses:v8 forKey:@"defaultThresholdSuggestions"];
    uint64_t v13 = [v12 copy];
    defaultThresholdSuggestions = v5->_defaultThresholdSuggestions;
    v5->_defaultThresholdSuggestions = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClasses:v8 forKey:@"lowBalanceReminderOptions"];
    uint64_t v16 = [v15 copy];
    lowBalanceReminderOptions = v5->_lowBalanceReminderOptions;
    v5->_lowBalanceReminderOptions = (NSArray *)v16;

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currency"];
    uint64_t v19 = [v18 copy];
    currency = v5->_currency;
    v5->_currency = (NSString *)v19;

    uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_msgSend(v21, "setWithObjects:", v22, v23, v24, v25, objc_opt_class(), 0);
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"serviceProviderData"];
    uint64_t v28 = [v27 copy];
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = (NSDictionary *)v28;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  defaultAmountSuggestions = self->_defaultAmountSuggestions;
  id v5 = a3;
  [v5 encodeObject:defaultAmountSuggestions forKey:@"defaultAmountSuggestions"];
  [v5 encodeObject:self->_defaultThresholdSuggestions forKey:@"defaultThresholdSuggestions"];
  [v5 encodeObject:self->_lowBalanceReminderOptions forKey:@"lowBalanceReminderOptions"];
  [v5 encodeObject:self->_currency forKey:@"currency"];
  [v5 encodeObject:self->_serviceProviderData forKey:@"serviceProviderData"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSArray *)self->_defaultAmountSuggestions copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSArray *)self->_defaultThresholdSuggestions copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_currency copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  uint64_t v12 = [(NSArray *)self->_lowBalanceReminderOptions copyWithZone:a3];
  uint64_t v13 = (void *)v5[3];
  v5[3] = v12;

  uint64_t v14 = [(NSDictionary *)self->_serviceProviderData copyWithZone:a3];
  uint64_t v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (NSArray)defaultAmountSuggestions
{
  return self->_defaultAmountSuggestions;
}

- (NSArray)defaultThresholdSuggestions
{
  return self->_defaultThresholdSuggestions;
}

- (NSArray)lowBalanceReminderOptions
{
  return self->_lowBalanceReminderOptions;
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
  objc_storeStrong((id *)&self->_defaultThresholdSuggestions, 0);
  objc_storeStrong((id *)&self->_defaultAmountSuggestions, 0);
}

@end