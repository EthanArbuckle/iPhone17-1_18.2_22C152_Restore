@interface PKSpendingInsightTrendCollection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCategoryInsights;
- (BOOL)isEqual:(id)a3;
- (PKSpendingInsightTrend)overallSpendingTrend;
- (PKSpendingInsightTrendCollection)initWithCoder:(id)a3;
- (PKSpendingInsightTrendCollection)initWithFHFeatureInsights:(id)a3;
- (id)description;
- (id)spendingTrendForMerchantCategory:(int64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKSpendingInsightTrendCollection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSpendingInsightTrendCollection)initWithFHFeatureInsights:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKSpendingInsightTrendCollection;
  v5 = [(PKSpendingInsightTrendCollection *)&v35 init];
  if (!v5) {
    goto LABEL_24;
  }
  v6 = objc_msgSend(v4, "pk_firstObjectPassingTest:", &__block_literal_global_105);
  v7 = [[PKSpendingInsightTrend alloc] initWithFHFeatureInsight:v6];
  overallSpendingTrend = v5->_overallSpendingTrend;
  v5->_overallSpendingTrend = v7;

  v9 = [v6 averageAmount];
  int v10 = objc_msgSend(v9, "pk_isZeroNumber");

  if (v10)
  {
    v11 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    categoryInsights = v5->_categoryInsights;
    v5->_categoryInsights = v11;
    goto LABEL_23;
  }
  v29 = v6;
  categoryInsights = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v30 = v4;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (!v14) {
    goto LABEL_22;
  }
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v32;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v32 != v16) {
        objc_enumerationMutation(v13);
      }
      v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      v19 = [v18 type];
      v20 = getFHInsightTypeCategorySpend[0]();
      v21 = v19;
      v22 = v20;
      if (v21 == v22)
      {

LABEL_18:
        v21 = [[PKSpendingInsightTrend alloc] initWithFHFeatureInsight:v18];
        v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "merchantCategory"));
        [(NSDictionary *)categoryInsights setObject:v21 forKeyedSubscript:v23];
LABEL_19:

        continue;
      }
      v23 = v22;
      if (v21) {
        BOOL v24 = v22 == 0;
      }
      else {
        BOOL v24 = 1;
      }
      if (v24)
      {

        goto LABEL_19;
      }
      char v25 = [(PKSpendingInsightTrend *)v21 isEqualToString:v22];

      if (v25) {
        goto LABEL_18;
      }
    }
    uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
  }
  while (v15);
LABEL_22:

  uint64_t v26 = [(NSDictionary *)categoryInsights copy];
  v27 = v5->_categoryInsights;
  v5->_categoryInsights = (NSDictionary *)v26;

  id v4 = v30;
  v6 = v29;
LABEL_23:

LABEL_24:
  return v5;
}

uint64_t __62__PKSpendingInsightTrendCollection_initWithFHFeatureInsights___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 type];
  v3 = getFHInsightTypeOverallSpend[0]();
  id v4 = v2;
  id v5 = v3;
  v6 = v5;
  if (v4 == v5)
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = 0;
    if (v4 && v5) {
      uint64_t v7 = [v4 isEqualToString:v5];
    }
  }

  return v7;
}

- (BOOL)hasCategoryInsights
{
  return [(NSDictionary *)self->_categoryInsights count] != 0;
}

- (id)spendingTrendForMerchantCategory:(int64_t)a3
{
  categoryInsights = self->_categoryInsights;
  id v4 = [NSNumber numberWithInteger:a3];
  id v5 = [(NSDictionary *)categoryInsights objectForKeyedSubscript:v4];

  return v5;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"overallSpendingTrend: '%@'; ", self->_overallSpendingTrend];
  [v3 appendFormat:@"categoryInsights: '%@'; ", self->_categoryInsights];
  [v3 appendFormat:@">"];
  return v3;
}

- (PKSpendingInsightTrendCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKSpendingInsightTrendCollection;
  id v5 = [(PKSpendingInsightTrendCollection *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"overallSpendingTrend"];
    overallSpendingTrend = v5->_overallSpendingTrend;
    v5->_overallSpendingTrend = (PKSpendingInsightTrend *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"overallSpendingTrend"];
    categoryInsights = v5->_categoryInsights;
    v5->_categoryInsights = (NSDictionary *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  overallSpendingTrend = self->_overallSpendingTrend;
  id v5 = a3;
  [v5 encodeObject:overallSpendingTrend forKey:@"overallSpendingTrend"];
  [v5 encodeObject:self->_categoryInsights forKey:@"categoryInsights"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  overallSpendingTrend = self->_overallSpendingTrend;
  uint64_t v6 = (PKSpendingInsightTrend *)v4[2];
  if (!overallSpendingTrend || !v6)
  {
    if (overallSpendingTrend == v6) {
      goto LABEL_5;
    }
LABEL_9:
    char v9 = 0;
    goto LABEL_10;
  }
  if (!-[PKSpendingInsightTrend isEqual:](overallSpendingTrend, "isEqual:")) {
    goto LABEL_9;
  }
LABEL_5:
  categoryInsights = self->_categoryInsights;
  v8 = (NSDictionary *)v4[1];
  if (categoryInsights && v8) {
    char v9 = -[NSDictionary isEqual:](categoryInsights, "isEqual:");
  }
  else {
    char v9 = categoryInsights == v8;
  }
LABEL_10:

  return v9;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_overallSpendingTrend];
  [v3 safelyAddObject:self->_categoryInsights];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (PKSpendingInsightTrend)overallSpendingTrend
{
  return self->_overallSpendingTrend;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overallSpendingTrend, 0);
  objc_storeStrong((id *)&self->_categoryInsights, 0);
}

@end