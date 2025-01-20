@interface PKSpendingInsightTrend
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDecimalNumber)percentageChange;
- (PKCurrencyAmount)change;
- (PKCurrencyAmount)previousTotalSpending;
- (PKCurrencyAmount)totalSpending;
- (PKSpendingInsightTrend)initWithCoder:(id)a3;
- (PKSpendingInsightTrend)initWithFHFeatureInsight:(id)a3;
- (id)description;
- (id)formattedPercentage;
- (int64_t)category;
- (unint64_t)direction;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKSpendingInsightTrend

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSpendingInsightTrend)initWithFHFeatureInsight:(id)a3
{
  id v5 = a3;
  v49.receiver = self;
  v49.super_class = (Class)PKSpendingInsightTrend;
  v6 = [(PKSpendingInsightTrend *)&v49 init];
  if (!v6)
  {
LABEL_47:
    v16 = v6;
    goto LABEL_48;
  }
  if (!v5) {
    goto LABEL_11;
  }
  v7 = [v5 type];
  v8 = _MergedGlobals_174();
  id v9 = v7;
  id v10 = v8;
  v11 = v10;
  if (v9 == v10)
  {
  }
  else
  {
    if (!v9 || !v10)
    {

      v13 = v9;
      goto LABEL_13;
    }
    int v12 = [v9 isEqualToString:v10];

    if (!v12) {
      goto LABEL_14;
    }
  }
  v13 = [v5 averageAmount];
  if (!objc_msgSend(v13, "pk_isZeroNumber"))
  {
LABEL_13:

LABEL_14:
LABEL_15:
    id v17 = [v5 type];
    v18 = _MergedGlobals_174();
    id v19 = v17;
    id v20 = v18;
    if (v20 == v19)
    {
    }
    else
    {
      v21 = v20;
      if (!v19 || !v20)
      {

        goto LABEL_23;
      }
      char v22 = [v19 isEqualToString:v20];

      if ((v22 & 1) == 0)
      {
LABEL_23:
        v24 = off_1EB402438();
        id v25 = v19;
        id v26 = v24;
        if (v26 == v25)
        {
        }
        else
        {
          v27 = v26;
          if (!v19 || !v26)
          {

LABEL_31:
            uint64_t v23 = 0;
LABEL_32:

            v6->_type = v23;
            uint64_t v29 = [v5 spendingInsightPercentageValue];
            percentageChange = v6->_percentageChange;
            v6->_percentageChange = (NSDecimalNumber *)v29;

            v31 = [v5 spendAmount];
            uint64_t v32 = PKCurrencyAmountCreate(v31, &cfstr_Usd.isa, 0);
            totalSpending = v6->_totalSpending;
            v6->_totalSpending = (PKCurrencyAmount *)v32;

            v34 = [v5 averageAmount];
            uint64_t v35 = PKCurrencyAmountCreate(v34, &cfstr_Usd.isa, 0);
            previousTotalSpending = v6->_previousTotalSpending;
            v6->_previousTotalSpending = (PKCurrencyAmount *)v35;

            v37 = (void *)[objc_alloc(MEMORY[0x1E4F28C28]) initWithInt:1];
            v38 = [v5 spendAmount];
            char v39 = objc_msgSend(v38, "pk_isZeroNumber");

            uint64_t v40 = 0;
            if ((v39 & 1) == 0)
            {
              uint64_t v47 = [v5 direction];
              if (v47)
              {
                if (v47 == 2)
                {
                  if ([(NSDecimalNumber *)v6->_percentageChange pk_isPositiveNumber]&& [(NSDecimalNumber *)v6->_percentageChange compare:v37] == NSOrderedAscending)
                  {
                    uint64_t v40 = 3;
                  }
                  else
                  {
                    uint64_t v40 = 5;
                  }
                }
                else
                {
                  if (v47 != 1) {
                    goto LABEL_34;
                  }
                  if ([(NSDecimalNumber *)v6->_percentageChange pk_isPositiveNumber]&& [(NSDecimalNumber *)v6->_percentageChange compare:v37] == NSOrderedAscending)
                  {
                    uint64_t v40 = 2;
                  }
                  else
                  {
                    uint64_t v40 = 4;
                  }
                }
              }
              else
              {
                uint64_t v40 = 1;
              }
            }
            v6->_direction = v40;
LABEL_34:
            v41 = [v5 spendingInsightAmount];
            objc_msgSend(v41, "pk_absoluteValue");
            v42 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

            uint64_t v43 = PKCurrencyAmountCreate(v42, &cfstr_Usd.isa, 0);
            change = v6->_change;
            v6->_change = (PKCurrencyAmount *)v43;

            int64_t v45 = 0;
            if (v6->_type == 2)
            {
              off_1EB402430();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v46 = [v5 merchantCategory];
                if ((unint64_t)(v46 - 1) >= 7) {
                  int64_t v45 = 0;
                }
                else {
                  int64_t v45 = v46;
                }
              }
              else
              {
                int64_t v45 = 0;
              }
            }
            v6->_category = v45;
            objc_storeStrong((id *)&v6->_fhInsight, a3);

            goto LABEL_47;
          }
          int v28 = [v25 isEqualToString:v26];

          if (!v28) {
            goto LABEL_31;
          }
        }
        uint64_t v23 = 2;
        goto LABEL_32;
      }
    }
    uint64_t v23 = 1;
    goto LABEL_32;
  }
  v14 = [v5 spendAmount];
  char v15 = objc_msgSend(v14, "pk_isZeroNumber");

  if (v15) {
    goto LABEL_15;
  }
LABEL_11:
  v16 = 0;
LABEL_48:

  return v16;
}

- (PKSpendingInsightTrend)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKSpendingInsightTrend;
  id v5 = [(PKSpendingInsightTrend *)&v11 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    v5->_direction = [v4 decodeIntegerForKey:@"direction"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"percentageChange"];
    percentageChange = v5->_percentageChange;
    v5->_percentageChange = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"change"];
    change = v5->_change;
    v5->_change = (PKCurrencyAmount *)v8;

    v5->_category = [v4 decodeIntegerForKey:@"category"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeInteger:self->_direction forKey:@"direction"];
  [v5 encodeObject:self->_percentageChange forKey:@"percentageChange"];
  [v5 encodeObject:self->_change forKey:@"change"];
  [v5 encodeInteger:self->_category forKey:@"category"];
}

- (id)formattedPercentage
{
  [(NSDecimalNumber *)self->_percentageChange floatValue];
  if (v2 <= 1000.0)
  {
    double v3 = v2;
    BOOL v4 = v2 >= 1.0 || v2 <= 0.0;
    double v5 = 1.0;
    if (v4) {
      double v5 = v3;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"%.0f%%", *(void *)&v5);
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%.0f%%+", 0x408F400000000000);
  uint64_t v6 = };
  return v6;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"type: '%lu'; ", self->_type);
  objc_msgSend(v3, "appendFormat:", @"direction: '%lu'; ", self->_direction);
  [v3 appendFormat:@"percentageChange: '%@'; ", self->_percentageChange];
  [v3 appendFormat:@"change: '%@'; ", self->_change];
  BOOL v4 = PKMerchantCategoryToString(self->_category);
  [v3 appendFormat:@"category: '%@'; ", v4];

  [v3 appendFormat:@"fhInsight: '%@'; ", self->_fhInsight];
  [v3 appendFormat:@">"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_15;
  }
  percentageChange = self->_percentageChange;
  uint64_t v6 = (NSDecimalNumber *)v4[4];
  if (percentageChange && v6)
  {
    if ((-[NSDecimalNumber isEqual:](percentageChange, "isEqual:") & 1) == 0) {
      goto LABEL_15;
    }
  }
  else if (percentageChange != v6)
  {
    goto LABEL_15;
  }
  change = self->_change;
  uint64_t v8 = (PKCurrencyAmount *)v4[5];
  if (!change || !v8)
  {
    if (change == v8) {
      goto LABEL_12;
    }
LABEL_15:
    BOOL v9 = 0;
    goto LABEL_16;
  }
  if (!-[PKCurrencyAmount isEqual:](change, "isEqual:")) {
    goto LABEL_15;
  }
LABEL_12:
  if (self->_type != v4[2] || self->_direction != v4[3]) {
    goto LABEL_15;
  }
  BOOL v9 = self->_category == v4[6];
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_percentageChange];
  [v3 safelyAddObject:self->_change];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;
  unint64_t v6 = self->_direction - v5 + 32 * v5;
  unint64_t v7 = self->_category - v6 + 32 * v6;

  return v7;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (NSDecimalNumber)percentageChange
{
  return self->_percentageChange;
}

- (PKCurrencyAmount)change
{
  return self->_change;
}

- (int64_t)category
{
  return self->_category;
}

- (PKCurrencyAmount)totalSpending
{
  return self->_totalSpending;
}

- (PKCurrencyAmount)previousTotalSpending
{
  return self->_previousTotalSpending;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousTotalSpending, 0);
  objc_storeStrong((id *)&self->_totalSpending, 0);
  objc_storeStrong((id *)&self->_change, 0);
  objc_storeStrong((id *)&self->_percentageChange, 0);
  objc_storeStrong((id *)&self->_fhInsight, 0);
}

@end