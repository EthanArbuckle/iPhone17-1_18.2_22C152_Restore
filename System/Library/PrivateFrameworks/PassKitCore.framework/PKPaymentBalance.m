@interface PKPaymentBalance
+ (BOOL)supportsSecureCoding;
+ (id)identifiersFromComponentBalances:(id)a3;
- (BOOL)isComposed;
- (BOOL)isCurrency;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpired;
- (BOOL)isPrimary;
- (NSArray)componentBalances;
- (NSDate)expirationDate;
- (NSDate)lastUpdateDate;
- (NSDecimalNumber)value;
- (NSSet)identifiers;
- (NSString)currencyCode;
- (NSString)formattedValue;
- (NSString)localizedDescription;
- (NSString)localizedTitle;
- (NSString)preformattedString;
- (PKCurrencyAmount)currencyValue;
- (PKPaymentBalance)initWithCoder:(id)a3;
- (PKPaymentBalance)initWithComponentBalances:(id)a3;
- (PKPaymentBalance)initWithComponentBalances:(id)a3 identifiers:(id)a4;
- (PKPaymentBalance)initWithComponentBalances:(id)a3 identifiers:(id)a4 expiredBalances:(id)a5;
- (PKPaymentBalance)initWithDictionary:(id)a3;
- (PKPaymentBalance)initWithIdentifier:(id)a3 forCurrencyAmount:(id)a4;
- (PKPaymentBalance)initWithIdentifier:(id)a3 forValue:(id)a4 roundingToExponent:(int64_t)a5;
- (PKPaymentBalance)initWithIdentifiers:(id)a3 forCurrencyAmount:(id)a4;
- (PKPaymentBalance)initWithIdentifiers:(id)a3 forValue:(id)a4 roundingToExponent:(int64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)exponent;
- (unint64_t)hash;
- (void)_setValueWithRounding:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setComponentBalances:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setExponent:(int64_t)a3;
- (void)setIdentifiers:(id)a3;
- (void)setIsExpired:(BOOL)a3;
- (void)setIsPrimary:(BOOL)a3;
- (void)setLastUpdateDate:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setPreformattedString:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation PKPaymentBalance

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[PKPaymentBalance allocWithZone:](PKPaymentBalance, "allocWithZone:") init];
  uint64_t v6 = [(NSDecimalNumber *)self->_value copyWithZone:a3];
  value = v5->_value;
  v5->_value = (NSDecimalNumber *)v6;

  uint64_t v8 = [(NSString *)self->_currencyCode copyWithZone:a3];
  currencyCode = v5->_currencyCode;
  v5->_currencyCode = (NSString *)v8;

  v5->_exponent = self->_exponent;
  uint64_t v10 = [(NSString *)self->_localizedTitle copyWithZone:a3];
  localizedTitle = v5->_localizedTitle;
  v5->_localizedTitle = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_localizedDescription copyWithZone:a3];
  localizedDescription = v5->_localizedDescription;
  v5->_localizedDescription = (NSString *)v12;

  v5->_isPrimary = self->_isPrimary;
  uint64_t v14 = [(NSDate *)self->_lastUpdateDate copyWithZone:a3];
  lastUpdateDate = v5->_lastUpdateDate;
  v5->_lastUpdateDate = (NSDate *)v14;

  uint64_t v16 = [(NSDate *)self->_expirationDate copyWithZone:a3];
  expirationDate = v5->_expirationDate;
  v5->_expirationDate = (NSDate *)v16;

  uint64_t v18 = [(NSString *)self->_preformattedString copyWithZone:a3];
  preformattedString = v5->_preformattedString;
  v5->_preformattedString = (NSString *)v18;

  uint64_t v20 = [(NSArray *)self->_componentBalances copyWithZone:a3];
  componentBalances = v5->_componentBalances;
  v5->_componentBalances = (NSArray *)v20;

  uint64_t v22 = [(NSSet *)self->_identifiers copyWithZone:a3];
  identifiers = v5->_identifiers;
  v5->_identifiers = (NSSet *)v22;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  value = self->_value;
  id v5 = a3;
  [v5 encodeObject:value forKey:@"value"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  [v5 encodeInteger:self->_exponent forKey:@"exponent"];
  [v5 encodeObject:self->_localizedTitle forKey:@"localizedTitle"];
  [v5 encodeObject:self->_localizedDescription forKey:@"localizedDescription"];
  [v5 encodeBool:self->_isPrimary forKey:@"isPrimaryBalance"];
  [v5 encodeObject:self->_lastUpdateDate forKey:@"lastUpdatedDate"];
  [v5 encodeObject:self->_expirationDate forKey:@"expirationDate"];
  [v5 encodeObject:self->_preformattedString forKey:@"preformattedString"];
  [v5 encodeObject:self->_componentBalances forKey:@"componentBalances"];
  [v5 encodeObject:self->_identifiers forKey:@"identifiers"];
}

- (PKPaymentBalance)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKPaymentBalance;
  id v5 = [(PKPaymentBalance *)&v34 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    value = v5->_value;
    v5->_value = (NSDecimalNumber *)v8;

    v5->_exponent = [v4 decodeIntegerForKey:@"exponent"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDescription"];
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v12;

    v5->_isPrimary = [v4 decodeBoolForKey:@"isPrimaryBalance"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdatedDate"];
    lastUpdateDate = v5->_lastUpdateDate;
    v5->_lastUpdateDate = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preformattedString"];
    preformattedString = v5->_preformattedString;
    v5->_preformattedString = (NSString *)v18;

    id v20 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_msgSend(v20, "initWithObjects:", v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"componentBalances"];
    componentBalances = v5->_componentBalances;
    v5->_componentBalances = (NSArray *)v23;

    id v25 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v26 = objc_opt_class();
    v27 = objc_msgSend(v25, "initWithObjects:", v26, objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"identifiers"];
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSSet *)v28;

    if (!v5->_identifiers)
    {
      v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
      if (v30)
      {
        uint64_t v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v30, 0);
        v32 = v5->_identifiers;
        v5->_identifiers = (NSSet *)v31;
      }
    }
  }

  return v5;
}

- (PKPaymentBalance)initWithDictionary:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKPaymentBalance;
  id v5 = [(PKPaymentBalance *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKArrayForKey:@"identifiers"];
    if (v6)
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v6];
      identifiers = v5->_identifiers;
      v5->_identifiers = (NSSet *)v7;
    }
    else
    {
      identifiers = [v4 PKStringForKey:@"identifier"];
      if (identifiers)
      {
        uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", identifiers, 0);
        uint64_t v10 = v5->_identifiers;
        v5->_identifiers = (NSSet *)v9;
      }
    }

    uint64_t v11 = [v4 PKStringForKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v11;

    v5->_exponent = [v4 PKIntegerForKey:@"exponent"];
    v13 = [v4 PKDecimalNumberForKey:@"value"];
    [(PKPaymentBalance *)v5 _setValueWithRounding:v13];

    uint64_t v14 = [v4 PKStringForKey:@"localizedTitle"];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v14;

    uint64_t v16 = [v4 PKStringForKey:@"localizedDescription"];
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v16;

    v5->_isPrimary = [v4 PKBoolForKey:@"isPrimaryBalance"];
    uint64_t v18 = [v4 PKDateForKey:@"lastUpdatedDate"];
    lastUpdateDate = v5->_lastUpdateDate;
    v5->_lastUpdateDate = (NSDate *)v18;

    uint64_t v20 = [v4 PKDateForKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v20;

    uint64_t v22 = [v4 PKStringForKey:@"preformattedString"];
    preformattedString = v5->_preformattedString;
    v5->_preformattedString = (NSString *)v22;
  }
  return v5;
}

- (PKPaymentBalance)initWithIdentifier:(id)a3 forCurrencyAmount:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    uint64_t v7 = (objc_class *)MEMORY[0x1E4F1CAD0];
    id v8 = a3;
    a3 = (id)objc_msgSend([v7 alloc], "initWithObjects:", v8, 0);
  }
  uint64_t v9 = [(PKPaymentBalance *)self initWithIdentifiers:a3 forCurrencyAmount:v6];

  return v9;
}

- (PKPaymentBalance)initWithIdentifiers:(id)a3 forCurrencyAmount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentBalance;
  id v8 = [(PKPaymentBalance *)&v17 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifiers = v8->_identifiers;
    v8->_identifiers = (NSSet *)v9;

    uint64_t v11 = [v7 currency];
    currencyCode = v8->_currencyCode;
    v8->_currencyCode = (NSString *)v11;

    v8->_exponent = [v7 exponent];
    uint64_t v13 = [v7 preformattedString];
    preformattedString = v8->_preformattedString;
    v8->_preformattedString = (NSString *)v13;

    v15 = [v7 amount];
    [(PKPaymentBalance *)v8 _setValueWithRounding:v15];
  }
  return v8;
}

- (PKPaymentBalance)initWithIdentifier:(id)a3 forValue:(id)a4 roundingToExponent:(int64_t)a5
{
  id v8 = a4;
  if (a3)
  {
    uint64_t v9 = (objc_class *)MEMORY[0x1E4F1CAD0];
    id v10 = a3;
    a3 = (id)objc_msgSend([v9 alloc], "initWithObjects:", v10, 0);
  }
  uint64_t v11 = [(PKPaymentBalance *)self initWithIdentifiers:a3 forValue:v8 roundingToExponent:a5];

  return v11;
}

- (PKPaymentBalance)initWithIdentifiers:(id)a3 forValue:(id)a4 roundingToExponent:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentBalance;
  id v10 = [(PKPaymentBalance *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    identifiers = v10->_identifiers;
    v10->_identifiers = (NSSet *)v11;

    v10->_exponent = a5;
    objc_storeStrong((id *)&v10->_currencyCode, @"XXX");
    [(PKPaymentBalance *)v10 _setValueWithRounding:v9];
  }

  return v10;
}

- (PKPaymentBalance)initWithComponentBalances:(id)a3
{
  return [(PKPaymentBalance *)self initWithComponentBalances:a3 identifiers:0];
}

- (PKPaymentBalance)initWithComponentBalances:(id)a3 identifiers:(id)a4
{
  return [(PKPaymentBalance *)self initWithComponentBalances:a3 identifiers:a4 expiredBalances:0];
}

- (PKPaymentBalance)initWithComponentBalances:(id)a3 identifiers:(id)a4 expiredBalances:(id)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count] || objc_msgSend(v10, "count"))
  {
    v55 = self;
    uint64_t v11 = [v8 count];
    if (v11) {
      uint64_t v12 = v8;
    }
    else {
      uint64_t v12 = v10;
    }
    id v13 = v12;
    objc_super v14 = [v13 firstObject];
    v15 = [v14 currencyCode];
    uint64_t v58 = [v14 exponent];
    v57 = [MEMORY[0x1E4F28C28] zero];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id obj = v13;
    uint64_t v16 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      id v18 = 0;
      uint64_t v19 = *(void *)v61;
      id v53 = v9;
      id v54 = v8;
      v51 = v14;
      id v52 = v10;
LABEL_8:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v61 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void **)(*((void *)&v60 + 1) + 8 * v20);
        uint64_t v22 = objc_msgSend(v21, "currencyCode", v51, v52, v53, v54);
        id v23 = v15;
        id v24 = v22;
        if (v23 == v24)
        {
        }
        else
        {
          objc_super v25 = v24;
          if (!v15 || !v24)
          {

LABEL_37:
            v45 = PKLogFacilityTypeGetObject(0);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              v47 = [v21 currencyCode];
              *(_DWORD *)buf = 138412546;
              uint64_t v65 = (uint64_t)v23;
              __int16 v66 = 2112;
              uint64_t v67 = (uint64_t)v47;
              _os_log_impl(&dword_190E10000, v45, OS_LOG_TYPE_DEFAULT, "Cannot create a combined balance with multiple currency codes (%@, %@)", buf, 0x16u);
            }
LABEL_39:
            id v9 = v53;
            id v8 = v54;
            objc_super v14 = v51;
            id v10 = v52;
            v32 = obj;
            v35 = v57;

            v48 = 0;
            goto LABEL_44;
          }
          char v26 = [v23 isEqualToString:v24];

          if ((v26 & 1) == 0) {
            goto LABEL_37;
          }
        }
        if (v58 != [v21 exponent])
        {
          v45 = PKLogFacilityTypeGetObject(0);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v46 = [v21 exponent];
            *(_DWORD *)buf = 134218240;
            uint64_t v65 = v58;
            __int16 v66 = 2048;
            uint64_t v67 = v46;
            _os_log_impl(&dword_190E10000, v45, OS_LOG_TYPE_DEFAULT, "Cannot create a combined balance with multiple exponents (%ld, %ld)", buf, 0x16u);
          }
          goto LABEL_39;
        }
        if (v11)
        {
          v27 = [v21 value];
          if (v27)
          {
            uint64_t v28 = [v57 decimalNumberByAdding:v27];

            v57 = (void *)v28;
          }
        }
        v29 = [v21 lastUpdateDate];
        v30 = v29;
        if (v18 || !v29)
        {
          if ([v18 compare:v29] == -1)
          {
            id v31 = v30;

            id v18 = v31;
          }
        }
        else
        {
          id v18 = v29;
        }

        if (v17 == ++v20)
        {
          uint64_t v17 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
          id v9 = v53;
          id v8 = v54;
          objc_super v14 = v51;
          id v10 = v52;
          if (v17) {
            goto LABEL_8;
          }
          goto LABEL_31;
        }
      }
    }
    id v18 = 0;
LABEL_31:
    v32 = obj;

    v59.receiver = v55;
    v59.super_class = (Class)PKPaymentBalance;
    v33 = [(PKPaymentBalance *)&v59 init];
    objc_super v34 = v33;
    v35 = v57;
    if (v33)
    {
      objc_storeStrong((id *)&v33->_currencyCode, v15);
      objc_storeStrong((id *)&v34->_value, v57);
      v34->_exponent = v58;
      v36 = [obj firstObject];
      uint64_t v37 = [v36 localizedTitle];
      localizedTitle = v34->_localizedTitle;
      v34->_localizedTitle = (NSString *)v37;

      v39 = [obj firstObject];
      uint64_t v40 = [v39 localizedDescription];
      localizedDescription = v34->_localizedDescription;
      v34->_localizedDescription = (NSString *)v40;

      objc_storeStrong((id *)&v34->_lastUpdateDate, v18);
      uint64_t v42 = [v8 copy];
      componentBalances = v34->_componentBalances;
      v34->_componentBalances = (NSArray *)v42;

      if (v9)
      {
        uint64_t v44 = [v9 copy];
      }
      else
      {
        uint64_t v44 = [(id)objc_opt_class() identifiersFromComponentBalances:v34->_componentBalances];
      }
      identifiers = v34->_identifiers;
      v34->_identifiers = (NSSet *)v44;
    }
    v48 = v34;
    v55 = v48;
LABEL_44:

    self = v55;
  }
  else
  {
    v48 = 0;
  }

  return v48;
}

- (NSSet)identifiers
{
  identifiers = self->_identifiers;
  if (identifiers) {
    v3 = identifiers;
  }
  else {
    v3 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"ApplicationStoredValueBalanceDefault", 0);
  }
  return v3;
}

- (BOOL)isExpired
{
  if (!self->_expirationDate) {
    return 0;
  }
  v3 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v4 = [v3 compare:self->_expirationDate] == 1;

  return v4;
}

- (void)_setValueWithRounding:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    if ([(PKPaymentBalance *)self isCurrency])
    {
      PKCurrencyDecimalAmountRound(v8);
      BOOL v4 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      value = self->_value;
      self->_value = v4;
    }
    else
    {
      value = [MEMORY[0x1E4F28C30] decimalNumberHandlerWithRoundingMode:0 scale:SLOWORD(self->_exponent) raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
      id v6 = [v8 decimalNumberByRoundingAccordingToBehavior:value];
      id v7 = self->_value;
      self->_value = v6;
    }
  }
  else
  {
    value = self->_value;
    self->_value = 0;
  }
}

- (BOOL)isCurrency
{
  currencyCode = self->_currencyCode;
  if (currencyCode) {
    LOBYTE(currencyCode) = ![(NSString *)currencyCode isEqualToString:@"XXX"];
  }
  return (char)currencyCode;
}

- (PKCurrencyAmount)currencyValue
{
  v3 = [(PKPaymentBalance *)self preformattedString];

  if (v3)
  {
    BOOL v4 = [[PKCurrencyAmount alloc] initWithAmount:self->_value exponent:self->_exponent preformattedString:self->_preformattedString];
  }
  else if ([(PKPaymentBalance *)self isCurrency])
  {
    PKCurrencyAmountCreate(self->_value, self->_currencyCode, self->_exponent);
    BOOL v4 = (PKCurrencyAmount *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

- (NSString)formattedValue
{
  v3 = [(PKPaymentBalance *)self currencyValue];
  BOOL v4 = v3;
  if (v3) {
    [v3 formattedStringValue];
  }
  else {
  id v5 = PKFormattedStringMinimalFractionDigitsFromNumber(self->_value, self->_exponent);
  }

  return (NSString *)v5;
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = [(NSSet *)self->_identifiers allObjects];
  id v5 = [v4 componentsJoinedByString:@", "];
  if (self->_isPrimary) {
    id v6 = " (Primary)";
  }
  else {
    id v6 = "";
  }
  id v7 = [(PKPaymentBalance *)self formattedValue];
  id v8 = [v3 stringWithFormat:@"{%@}%s: %@", v5, v6, v7];

  return v8;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_value];
  if (self->_currencyCode) {
    currencyCode = (__CFString *)self->_currencyCode;
  }
  else {
    currencyCode = @"XXX";
  }
  [v3 safelyAddObject:currencyCode];
  [v3 safelyAddObject:self->_localizedTitle];
  [v3 safelyAddObject:self->_localizedDescription];
  [v3 safelyAddObject:self->_lastUpdateDate];
  [v3 safelyAddObject:self->_componentBalances];
  [v3 safelyAddObject:self->_identifiers];
  uint64_t v5 = PKCombinedHash(17, v3);
  int64_t v6 = self->_exponent - v5 + 32 * v5;
  unint64_t v7 = self->_isPrimary - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  value = self->_value;
  uint64_t v6 = [v4 value];
  unint64_t v7 = (void *)v6;
  if (value) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (value == (NSDecimalNumber *)v6)
    {
LABEL_9:
      if (self->_currencyCode) {
        currencyCode = (__CFString *)self->_currencyCode;
      }
      else {
        currencyCode = @"XXX";
      }
      uint64_t v12 = [v4 currencyCode];
      id v13 = (void *)v12;
      if (v12) {
        objc_super v14 = (__CFString *)v12;
      }
      else {
        objc_super v14 = @"XXX";
      }
      if (![(__CFString *)currencyCode isEqualToString:v14]
        || (int64_t exponent = self->_exponent, exponent != [v4 exponent]))
      {
        char v9 = 0;
LABEL_49:

        goto LABEL_50;
      }
      localizedTitle = self->_localizedTitle;
      uint64_t v17 = [v4 localizedTitle];
      id v18 = (void *)v17;
      if (localizedTitle && v17)
      {
        if ([(NSString *)localizedTitle isEqual:v17])
        {
LABEL_20:
          localizedDescription = self->_localizedDescription;
          uint64_t v20 = [v4 localizedDescription];
          uint64_t v21 = (void *)v20;
          if (localizedDescription && v20)
          {
            if (([(NSString *)localizedDescription isEqual:v20] & 1) == 0) {
              goto LABEL_38;
            }
          }
          else if (localizedDescription != (NSString *)v20)
          {
            goto LABEL_38;
          }
          int isPrimary = self->_isPrimary;
          if (isPrimary == [v4 isPrimary])
          {
            lastUpdateDate = self->_lastUpdateDate;
            uint64_t v24 = [v4 lastUpdateDate];
            objc_super v25 = (void *)v24;
            if (lastUpdateDate && v24)
            {
              if ([(NSDate *)lastUpdateDate isEqual:v24])
              {
LABEL_32:
                componentBalances = self->_componentBalances;
                uint64_t v27 = [v4 componentBalances];
                uint64_t v28 = (void *)v27;
                if (componentBalances && v27)
                {
                  if ([(NSArray *)componentBalances isEqual:v27]) {
                    goto LABEL_35;
                  }
                }
                else if (componentBalances == (NSArray *)v27)
                {
LABEL_35:
                  identifiers = self->_identifiers;
                  uint64_t v30 = [v4 identifiers];
                  id v31 = (void *)v30;
                  if (identifiers && v30) {
                    char v9 = [(NSSet *)identifiers isEqual:v30];
                  }
                  else {
                    char v9 = identifiers == (NSSet *)v30;
                  }

                  goto LABEL_45;
                }
                char v9 = 0;
LABEL_45:

                goto LABEL_46;
              }
            }
            else if (lastUpdateDate == (NSDate *)v24)
            {
              goto LABEL_32;
            }
            char v9 = 0;
LABEL_46:

            goto LABEL_47;
          }
LABEL_38:
          char v9 = 0;
LABEL_47:

          goto LABEL_48;
        }
      }
      else if (localizedTitle == (NSString *)v17)
      {
        goto LABEL_20;
      }
      char v9 = 0;
LABEL_48:

      goto LABEL_49;
    }
  }
  else
  {
    char v10 = [(NSDecimalNumber *)value isEqual:v6];
    if (v10) {
      goto LABEL_9;
    }
  }
  char v9 = 0;
LABEL_50:

  return v9;
}

+ (id)identifiersFromComponentBalances:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v3, "count"));
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
        char v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "identifiers", (void)v13);
        [v4 unionSet:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = (void *)[v4 copy];
  return v11;
}

- (BOOL)isComposed
{
  return self->_componentBalances != 0;
}

- (void)setIdentifiers:(id)a3
{
}

- (NSDecimalNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (int64_t)exponent
{
  return self->_exponent;
}

- (void)setExponent:(int64_t)a3
{
  self->_int64_t exponent = a3;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (void)setIsPrimary:(BOOL)a3
{
  self->_int isPrimary = a3;
}

- (NSDate)lastUpdateDate
{
  return self->_lastUpdateDate;
}

- (void)setLastUpdateDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (NSString)preformattedString
{
  return self->_preformattedString;
}

- (void)setPreformattedString:(id)a3
{
}

- (void)setIsExpired:(BOOL)a3
{
  self->_isExpired = a3;
}

- (NSArray)componentBalances
{
  return self->_componentBalances;
}

- (void)setComponentBalances:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentBalances, 0);
  objc_storeStrong((id *)&self->_preformattedString, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end