@interface PKAppleBalanceDirectTopUpConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)denominations;
- (NSDecimalNumber)maxAmount;
- (NSDecimalNumber)maxBalance;
- (NSDecimalNumber)minAmount;
- (NSURL)termsURL;
- (PKAppleBalanceDirectTopUpConfiguration)initWithAMSResponseDictionary:(id)a3;
- (PKAppleBalanceDirectTopUpConfiguration)initWithCoder:(id)a3;
- (PKAppleBalanceDirectTopUpConfiguration)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)displayableDenominations;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDenominations:(id)a3;
- (void)setMaxAmount:(id)a3;
- (void)setMaxBalance:(id)a3;
- (void)setMinAmount:(id)a3;
- (void)setTermsURL:(id)a3;
@end

@implementation PKAppleBalanceDirectTopUpConfiguration

- (PKAppleBalanceDirectTopUpConfiguration)initWithDictionary:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKAppleBalanceDirectTopUpConfiguration;
  v5 = [(PKAppleBalanceDirectTopUpConfiguration *)&v29 init];
  if (!v5)
  {
LABEL_11:
    v21 = v5;
    goto LABEL_15;
  }
  if (v4)
  {
    uint64_t v6 = [v4 PKDecimalNumberForKey:@"minAmount"];
    minAmount = v5->_minAmount;
    v5->_minAmount = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 PKDecimalNumberForKey:@"maxAmount"];
    maxAmount = v5->_maxAmount;
    v5->_maxAmount = (NSDecimalNumber *)v8;

    uint64_t v10 = [v4 PKDecimalNumberForKey:@"maxBalance"];
    maxBalance = v5->_maxBalance;
    v5->_maxBalance = (NSDecimalNumber *)v10;

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v13 = [v4 PKArrayForKey:@"denominations"];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [[PKAppleBalanceDirectTopUpConfigurationDenomination alloc] initWithDictionary:*(void *)(*((void *)&v24 + 1) + 8 * v17)];
          [v12 addObject:v18];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v15);
    }
    [(PKAppleBalanceDirectTopUpConfiguration *)v5 setDenominations:v12];
    uint64_t v19 = [v4 PKURLForKey:@"termsURL"];
    termsURL = v5->_termsURL;
    v5->_termsURL = (NSURL *)v19;

    goto LABEL_11;
  }
  v22 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "Error: dtu configuration dictionary missing", buf, 2u);
  }

  v21 = 0;
LABEL_15:

  return v21;
}

- (PKAppleBalanceDirectTopUpConfiguration)initWithAMSResponseDictionary:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)PKAppleBalanceDirectTopUpConfiguration;
  v5 = [(PKAppleBalanceDirectTopUpConfiguration *)&v40 init];
  if (!v5)
  {
LABEL_11:
    v28 = v5;
    goto LABEL_15;
  }
  if (v4)
  {
    uint64_t v6 = [v4 PKDictionaryForKey:@"amount-limit"];
    uint64_t v7 = [v6 PKDecimalNumberForKey:@"max"];
    maxAmount = v5->_maxAmount;
    v5->_maxAmount = (NSDecimalNumber *)v7;

    uint64_t v9 = [v6 PKDecimalNumberForKey:@"min"];
    minAmount = v5->_minAmount;
    v5->_minAmount = (NSDecimalNumber *)v9;

    uint64_t v31 = v6;
    uint64_t v11 = [v6 PKDecimalNumberForKey:@"max-balance"];
    maxBalance = v5->_maxBalance;
    v32 = v5;
    v5->_maxBalance = (NSDecimalNumber *)v11;

    v13 = [v4 PKStringForKey:@"currency-code-iso3a"];
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v33 = v4;
    [v4 PKArrayForKey:@"amounts"];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v36;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v36 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = [*(id *)(*((void *)&v35 + 1) + 8 * v18) PKDecimalNumberForKey:@"amount"];
          v20 = (void *)[objc_alloc(MEMORY[0x1E4F28C28]) initWithInt:1000];
          v21 = [v19 decimalNumberByDividingBy:v20];

          v22 = [PKAppleBalanceDirectTopUpConfigurationDenomination alloc];
          v41[0] = @"amount";
          v41[1] = @"currencyCode";
          v42[0] = v21;
          v42[1] = v13;
          v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
          long long v24 = [(PKAppleBalanceDirectTopUpConfigurationDenomination *)v22 initWithDictionary:v23];

          [v14 addObject:v24];
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v16);
    }
    v5 = v32;
    [(PKAppleBalanceDirectTopUpConfiguration *)v32 setDenominations:v14];
    id v4 = v33;
    long long v25 = [v33 PKStringForKey:@"link-terms-conditions"];
    uint64_t v26 = [MEMORY[0x1E4F1CB10] URLWithString:v25];
    termsURL = v32->_termsURL;
    v32->_termsURL = (NSURL *)v26;

    goto LABEL_11;
  }
  objc_super v29 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Error: ams response dictionary missing", buf, 2u);
  }

  v28 = 0;
LABEL_15:

  return v28;
}

- (void)setDenominations:(id)a3
{
  id v4 = [a3 sortedArrayUsingComparator:&__block_literal_global_125];
  denominations = self->_denominations;
  self->_denominations = v4;
}

BOOL __59__PKAppleBalanceDirectTopUpConfiguration_setDenominations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 amount];
  uint64_t v6 = [v4 amount];

  BOOL v7 = [v5 compare:v6] == 1;
  return v7;
}

- (id)displayableDenominations
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[(NSArray *)self->_denominations copy];
  if ((unint64_t)[v3 count] >= 4)
  {
    denominations = self->_denominations;
    [(NSArray *)denominations count];
    NSUInteger v5 = [(NSArray *)self->_denominations count] - 3;
    if ([(NSArray *)self->_denominations count] <= 3) {
      NSUInteger v6 = [(NSArray *)self->_denominations count];
    }
    else {
      NSUInteger v6 = 3;
    }
    uint64_t v7 = -[NSArray subarrayWithRange:](denominations, "subarrayWithRange:", v5, v6);

    v3 = (void *)v7;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v15 = [PKNumericSuggestion alloc];
        uint64_t v16 = objc_msgSend(v14, "amount", (void)v21);
        uint64_t v17 = [v14 currencyCode];
        uint64_t v18 = [(PKNumericSuggestion *)v15 initWithValue:v16 currencyCode:v17];

        [v8 addObject:v18];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  uint64_t v19 = (void *)[v8 copy];
  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAppleBalanceDirectTopUpConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(PKAppleBalanceDirectTopUpConfiguration *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minAmount"];
    minAmount = v5->_minAmount;
    v5->_minAmount = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxAmount"];
    maxAmount = v5->_maxAmount;
    v5->_maxAmount = (NSDecimalNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxBalance"];
    maxBalance = v5->_maxBalance;
    v5->_maxBalance = (NSDecimalNumber *)v10;

    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    id v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"denominations"];

    [(PKAppleBalanceDirectTopUpConfiguration *)v5 setDenominations:v15];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"termsURL"];
    termsURL = v5->_termsURL;
    v5->_termsURL = (NSURL *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  minAmount = self->_minAmount;
  id v5 = a3;
  [v5 encodeObject:minAmount forKey:@"minAmount"];
  [v5 encodeObject:self->_maxAmount forKey:@"maxAmount"];
  [v5 encodeObject:self->_maxBalance forKey:@"maxBalance"];
  [v5 encodeObject:self->_denominations forKey:@"denominations"];
  [v5 encodeObject:self->_termsURL forKey:@"termsURL"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_24;
  }
  minAmount = self->_minAmount;
  uint64_t v6 = (NSDecimalNumber *)v4[1];
  if (minAmount && v6)
  {
    if ((-[NSDecimalNumber isEqual:](minAmount, "isEqual:") & 1) == 0) {
      goto LABEL_24;
    }
  }
  else if (minAmount != v6)
  {
    goto LABEL_24;
  }
  maxAmount = self->_maxAmount;
  uint64_t v8 = (NSDecimalNumber *)v4[2];
  if (maxAmount && v8)
  {
    if ((-[NSDecimalNumber isEqual:](maxAmount, "isEqual:") & 1) == 0) {
      goto LABEL_24;
    }
  }
  else if (maxAmount != v8)
  {
    goto LABEL_24;
  }
  maxBalance = self->_maxBalance;
  uint64_t v10 = (NSDecimalNumber *)v4[3];
  if (maxBalance && v10)
  {
    if ((-[NSDecimalNumber isEqual:](maxBalance, "isEqual:") & 1) == 0) {
      goto LABEL_24;
    }
  }
  else if (maxBalance != v10)
  {
    goto LABEL_24;
  }
  denominations = self->_denominations;
  uint64_t v12 = (NSArray *)v4[4];
  if (!denominations || !v12)
  {
    if (denominations == v12) {
      goto LABEL_20;
    }
LABEL_24:
    char v15 = 0;
    goto LABEL_25;
  }
  if ((-[NSArray isEqual:](denominations, "isEqual:") & 1) == 0) {
    goto LABEL_24;
  }
LABEL_20:
  termsURL = self->_termsURL;
  id v14 = (NSURL *)v4[5];
  if (termsURL && v14) {
    char v15 = -[NSURL isEqual:](termsURL, "isEqual:");
  }
  else {
    char v15 = termsURL == v14;
  }
LABEL_25:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = [(NSDecimalNumber *)self->_minAmount hash];
  uint64_t v16 = [(NSDecimalNumber *)self->_maxAmount hash];
  uint64_t v17 = [(NSDecimalNumber *)self->_maxBalance hash];
  uint64_t v18 = [(NSURL *)self->_termsURL hash];
  uint64_t v19 = 0;
  unint64_t v3 = SipHash();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_denominations;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        unint64_t v20 = v3;
        uint64_t v21 = 0;
        uint64_t v21 = objc_msgSend(v9, "hash", (void)v11);
        unint64_t v3 = SipHash();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v22 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)description
{
  unint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = [(NSDecimalNumber *)self->_minAmount description];
  [v3 appendFormat:@"minAmount: '%@'; ", v4];

  uint64_t v5 = [(NSDecimalNumber *)self->_maxAmount description];
  [v3 appendFormat:@"maxAmount: '%@'; ", v5];

  uint64_t v6 = [(NSDecimalNumber *)self->_maxBalance description];
  [v3 appendFormat:@"maxBalance: '%@'; ", v6];

  uint64_t v7 = [(NSArray *)self->_denominations description];
  [v3 appendFormat:@"denominations: '%@'; ", v7];

  uint64_t v8 = [(NSURL *)self->_termsURL description];
  [v3 appendFormat:@"termsURL: '%@'; ", v8];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[PKAppleBalanceDirectTopUpConfiguration allocWithZone:](PKAppleBalanceDirectTopUpConfiguration, "allocWithZone:") init];
  uint64_t v6 = [(NSDecimalNumber *)self->_minAmount copyWithZone:a3];
  minAmount = v5->_minAmount;
  v5->_minAmount = (NSDecimalNumber *)v6;

  uint64_t v8 = [(NSDecimalNumber *)self->_maxAmount copyWithZone:a3];
  maxAmount = v5->_maxAmount;
  v5->_maxAmount = (NSDecimalNumber *)v8;

  uint64_t v10 = [(NSDecimalNumber *)self->_maxBalance copyWithZone:a3];
  maxBalance = v5->_maxBalance;
  v5->_maxBalance = (NSDecimalNumber *)v10;

  uint64_t v12 = [(NSArray *)self->_denominations copyWithZone:a3];
  denominations = v5->_denominations;
  v5->_denominations = (NSArray *)v12;

  uint64_t v14 = [(NSURL *)self->_termsURL copyWithZone:a3];
  termsURL = v5->_termsURL;
  v5->_termsURL = (NSURL *)v14;

  return v5;
}

- (NSDecimalNumber)minAmount
{
  return self->_minAmount;
}

- (void)setMinAmount:(id)a3
{
}

- (NSDecimalNumber)maxAmount
{
  return self->_maxAmount;
}

- (void)setMaxAmount:(id)a3
{
}

- (NSDecimalNumber)maxBalance
{
  return self->_maxBalance;
}

- (void)setMaxBalance:(id)a3
{
}

- (NSArray)denominations
{
  return self->_denominations;
}

- (NSURL)termsURL
{
  return self->_termsURL;
}

- (void)setTermsURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsURL, 0);
  objc_storeStrong((id *)&self->_denominations, 0);
  objc_storeStrong((id *)&self->_maxBalance, 0);
  objc_storeStrong((id *)&self->_maxAmount, 0);
  objc_storeStrong((id *)&self->_minAmount, 0);
}

@end