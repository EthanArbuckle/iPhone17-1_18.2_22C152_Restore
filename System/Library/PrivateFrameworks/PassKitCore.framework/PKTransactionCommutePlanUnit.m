@interface PKTransactionCommutePlanUnit
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (NSString)label;
- (PKCurrencyAmount)valueCount;
- (PKTransactionCommutePlanUnit)initWithCoder:(id)a3;
- (PKTransactionCommutePlanUnit)initWithCountPlanIdentifier:(id)a3 currencyCode:(id)a4 value:(id)a5 label:(id)a6;
- (PKTransactionCommutePlanUnit)initWithDictionary:(id)a3;
- (PKTransactionCommutePlanUnit)initWithTimedPlanIdentifier:(id)a3 label:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)planType;
- (void)encodeWithCoder:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation PKTransactionCommutePlanUnit

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[PKTransactionCommutePlanUnit allocWithZone:](PKTransactionCommutePlanUnit, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v5->_planType = self->_planType;
  v8 = [(PKCurrencyAmount *)self->_valueCount copyWithZone:a3];
  valueCount = v5->_valueCount;
  v5->_valueCount = v8;

  uint64_t v10 = [(NSString *)self->_label copyWithZone:a3];
  label = v5->_label;
  v5->_label = (NSString *)v10;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_valueCount forKey:@"valueCount"];
  [v5 encodeInteger:self->_planType forKey:@"planType"];
  [v5 encodeObject:self->_label forKey:@"label"];
}

- (PKTransactionCommutePlanUnit)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKTransactionCommutePlanUnit;
  id v5 = [(PKTransactionCommutePlanUnit *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"valueCount"];
    valueCount = v5->_valueCount;
    v5->_valueCount = (PKCurrencyAmount *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    v5->_planType = [v4 decodeIntegerForKey:@"planType"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v10;
  }
  return v5;
}

- (PKTransactionCommutePlanUnit)initWithTimedPlanIdentifier:(id)a3 label:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKTransactionCommutePlanUnit;
  v9 = [(PKTransactionCommutePlanUnit *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v10->_planType = 0;
    objc_storeStrong((id *)&v10->_label, a4);
  }

  return v10;
}

- (PKTransactionCommutePlanUnit)initWithCountPlanIdentifier:(id)a3 currencyCode:(id)a4 value:(id)a5 label:(id)a6
{
  id v11 = a3;
  objc_super v12 = (NSString *)a4;
  objc_super v13 = (NSDecimalNumber *)a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PKTransactionCommutePlanUnit;
  v15 = [(PKTransactionCommutePlanUnit *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    v16->_planType = 1;
    uint64_t v17 = PKCurrencyAmountCreate(v13, v12, 0);
    valueCount = v16->_valueCount;
    v16->_valueCount = (PKCurrencyAmount *)v17;

    objc_storeStrong((id *)&v16->_label, a6);
  }

  return v16;
}

- (PKTransactionCommutePlanUnit)initWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 PKIntegerForKey:@"value"];
  uint64_t v6 = [v4 PKStringForKey:@"currencyCode"];
  id v7 = [v4 PKStringForKey:@"localizedTitle"];
  if (!v7)
  {
    id v7 = [v4 PKStringForKey:@"label"];
  }
  id v8 = [v4 PKStringForKey:@"identifier"];
  if (v8)
  {
    if (v6 && v5)
    {
      v9 = [MEMORY[0x1E4F28C28] numberWithInteger:v5];
      self = [(PKTransactionCommutePlanUnit *)self initWithCountPlanIdentifier:v8 currencyCode:v6 value:v9 label:v7];

      uint64_t v10 = self;
    }
    else
    {
      self = [(PKTransactionCommutePlanUnit *)self initWithTimedPlanIdentifier:v8 label:v7];
      uint64_t v10 = self;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)description
{
  unint64_t planType = self->_planType;
  id v4 = NSString;
  if (planType == 1)
  {
    identifier = self->_identifier;
    label = self->_label;
    id v7 = [(PKCurrencyAmount *)self->_valueCount currency];
    id v8 = [(PKCurrencyAmount *)self->_valueCount amount];
    v9 = [v4 stringWithFormat:@"Plan Type: %@, Identifier: %@, Label: %@, Currency: %@, Value: %ld", @"count plan", identifier, label, v7, objc_msgSend(v8, "integerValue")];
  }
  else
  {
    if (planType) {
      uint64_t v10 = @"unknown plan";
    }
    else {
      uint64_t v10 = @"timed plan";
    }
    v9 = [NSString stringWithFormat:@"Plan Type: %@, Identifier: %@, Label: %@", v10, self->_identifier, self->_label];
  }
  return v9;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_identifier forKeyedSubscript:@"identifier"];
  id v4 = [(PKCurrencyAmount *)self->_valueCount currency];
  [v3 setObject:v4 forKeyedSubscript:@"currencyCode"];

  uint64_t v5 = NSNumber;
  uint64_t v6 = [(PKCurrencyAmount *)self->_valueCount amount];
  id v7 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "integerValue"));
  [v3 setObject:v7 forKeyedSubscript:@"value"];

  label = self->_label;
  if (label) {
    [v3 setObject:label forKeyedSubscript:@"label"];
  }
  v9 = (void *)[v3 copy];

  return v9;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_valueCount];
  [v3 safelyAddObject:self->_label];
  [v3 safelyAddObject:self->_identifier];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_planType - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    identifier = self->_identifier;
    uint64_t v6 = [v4 identifier];
    id v7 = identifier;
    id v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
    }
    else
    {
      LOBYTE(v10) = 0;
      if (!v7 || !v8)
      {
        id v14 = v8;
        goto LABEL_23;
      }
      BOOL v11 = [(NSString *)v7 isEqualToString:v8];

      if (!v11)
      {
        LOBYTE(v10) = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    label = self->_label;
    objc_super v13 = [v4 label];
    id v14 = label;
    v15 = v13;
    id v7 = v15;
    if (v14 == v15)
    {
    }
    else
    {
      if (!v14 || !v15)
      {

        LOBYTE(v10) = 0;
        goto LABEL_23;
      }
      BOOL v10 = [(NSString *)v14 isEqualToString:v15];

      if (!v10) {
        goto LABEL_24;
      }
    }
    unint64_t planType = self->_planType;
    if (planType != [v4 planType])
    {
      LOBYTE(v10) = 0;
LABEL_24:

      goto LABEL_25;
    }
    valueCount = self->_valueCount;
    uint64_t v18 = [v4 valueCount];
    id v14 = (NSString *)v18;
    if (valueCount && v18) {
      LOBYTE(v10) = [(PKCurrencyAmount *)valueCount isEqual:v18];
    }
    else {
      LOBYTE(v10) = valueCount == (PKCurrencyAmount *)v18;
    }
LABEL_23:

    goto LABEL_24;
  }
  LOBYTE(v10) = 0;
LABEL_26:

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (unint64_t)planType
{
  return self->_planType;
}

- (PKCurrencyAmount)valueCount
{
  return self->_valueCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueCount, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end