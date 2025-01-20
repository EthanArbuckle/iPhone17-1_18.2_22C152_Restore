@interface PKPayLaterAccountProductEligibleSpend
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)financingOptions;
- (NSDate)expirationDate;
- (PKCurrencyAmount)availableToSpend;
- (PKPayLaterAccountProductEligibleSpend)initWithCoder:(id)a3;
- (PKPayLaterAccountProductEligibleSpend)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAvailableToSpend:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setFinancingOptions:(id)a3;
@end

@implementation PKPayLaterAccountProductEligibleSpend

- (PKPayLaterAccountProductEligibleSpend)initWithDictionary:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKPayLaterAccountProductEligibleSpend;
  v5 = [(PKPayLaterAccountProductEligibleSpend *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKDateForKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v6;

    uint64_t v8 = [v4 PKCurrencyAmountForKey:@"availableToSpend"];
    availableToSpend = v5->_availableToSpend;
    v5->_availableToSpend = (PKCurrencyAmount *)v8;

    v10 = [v4 PKArrayContaining:objc_opt_class() forKey:@"financingOptions"];
    if ([v10 count])
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v12 = v10;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v26;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * v16);
            v18 = [PKPayLaterFinancingOption alloc];
            v19 = -[PKPayLaterFinancingOption initWithDictionary:](v18, "initWithDictionary:", v17, (void)v25);
            [v11 safelyAddObject:v19];

            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v31 count:16];
        }
        while (v14);
      }

      v20 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"apr" ascending:1];
      v30 = v20;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
      [v11 sortUsingDescriptors:v21];

      if ([v11 count])
      {
        uint64_t v22 = [v11 copy];
        financingOptions = v5->_financingOptions;
        v5->_financingOptions = (NSArray *)v22;
      }
      else
      {
        financingOptions = v5->_financingOptions;
        v5->_financingOptions = 0;
      }
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterAccountProductEligibleSpend)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterAccountProductEligibleSpend;
  v5 = [(PKPayLaterAccountProductEligibleSpend *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"availableToSpend"];
    availableToSpend = v5->_availableToSpend;
    v5->_availableToSpend = (PKCurrencyAmount *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    id v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"financingOptions"];
    financingOptions = v5->_financingOptions;
    v5->_financingOptions = (NSArray *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  expirationDate = self->_expirationDate;
  id v5 = a3;
  [v5 encodeObject:expirationDate forKey:@"expirationDate"];
  [v5 encodeObject:self->_availableToSpend forKey:@"availableToSpend"];
  [v5 encodeObject:self->_financingOptions forKey:@"financingOptions"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_14;
  }
  expirationDate = self->_expirationDate;
  uint64_t v6 = (NSDate *)v4[1];
  if (expirationDate && v6)
  {
    if ((-[NSDate isEqual:](expirationDate, "isEqual:") & 1) == 0) {
      goto LABEL_14;
    }
  }
  else if (expirationDate != v6)
  {
    goto LABEL_14;
  }
  availableToSpend = self->_availableToSpend;
  uint64_t v8 = (PKCurrencyAmount *)v4[2];
  if (!availableToSpend || !v8)
  {
    if (availableToSpend == v8) {
      goto LABEL_10;
    }
LABEL_14:
    char v11 = 0;
    goto LABEL_15;
  }
  if (!-[PKCurrencyAmount isEqual:](availableToSpend, "isEqual:")) {
    goto LABEL_14;
  }
LABEL_10:
  financingOptions = self->_financingOptions;
  v10 = (NSArray *)v4[3];
  if (financingOptions && v10) {
    char v11 = -[NSArray isEqual:](financingOptions, "isEqual:");
  }
  else {
    char v11 = financingOptions == v10;
  }
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_expirationDate];
  [v3 safelyAddObject:self->_availableToSpend];
  [v3 safelyAddObject:self->_financingOptions];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"expirationDate: '%@'; ", self->_expirationDate];
  [v3 appendFormat:@"availableToSpend: '%@'; ", self->_availableToSpend];
  [v3 appendFormat:@"financingOptions: '%@'; ", self->_financingOptions];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPayLaterAccountProductEligibleSpend allocWithZone:](PKPayLaterAccountProductEligibleSpend, "allocWithZone:") init];
  uint64_t v6 = [(NSDate *)self->_expirationDate copyWithZone:a3];
  expirationDate = v5->_expirationDate;
  v5->_expirationDate = (NSDate *)v6;

  uint64_t v8 = [(PKCurrencyAmount *)self->_availableToSpend copyWithZone:a3];
  availableToSpend = v5->_availableToSpend;
  v5->_availableToSpend = v8;

  uint64_t v10 = [(NSArray *)self->_financingOptions copyWithZone:a3];
  financingOptions = v5->_financingOptions;
  v5->_financingOptions = (NSArray *)v10;

  return v5;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (PKCurrencyAmount)availableToSpend
{
  return self->_availableToSpend;
}

- (void)setAvailableToSpend:(id)a3
{
}

- (NSArray)financingOptions
{
  return self->_financingOptions;
}

- (void)setFinancingOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_financingOptions, 0);
  objc_storeStrong((id *)&self->_availableToSpend, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end