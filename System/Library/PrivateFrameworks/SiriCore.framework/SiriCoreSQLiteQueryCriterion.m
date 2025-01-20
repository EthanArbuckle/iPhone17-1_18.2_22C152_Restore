@interface SiriCoreSQLiteQueryCriterion
+ (id)andQueryCriterionWithSubcriteria:(id)a3;
+ (id)andQueryCriterionWithSubcriteriaProvider:(id)a3;
+ (id)betweenQueryCriterionWithColumnName:(id)a3 fromValue:(id)a4 toValue:(id)a5 negation:(BOOL)a6;
+ (id)equalToQueryCriterionWithColumnName:(id)a3 value:(id)a4;
+ (id)greaterThanOrEqualToQueryCriterionWithColumnName:(id)a3 value:(id)a4;
+ (id)greaterThanQueryCriterionWithColumnName:(id)a3 value:(id)a4;
+ (id)inQueryCriterionWithColumnName:(id)a3 values:(id)a4 negation:(BOOL)a5;
+ (id)isNullQueryCriterionWithColumnName:(id)a3 negation:(BOOL)a4;
+ (id)isQueryCriterionWithColumnName:(id)a3 value:(id)a4 negation:(BOOL)a5;
+ (id)lessThanOrEqualToQueryCriterionWithColumnName:(id)a3 value:(id)a4;
+ (id)lessThanQueryCriterionWithColumnName:(id)a3 value:(id)a4;
+ (id)likeQueryCriterionWithColumnName:(id)a3 value:(id)a4 negation:(BOOL)a5;
+ (id)notEqualToQueryCriterionWithColumnName:(id)a3 value:(id)a4;
+ (id)orQueryCriterionWithSubcriteria:(id)a3;
+ (id)orQueryCriterionWithSubcriteriaProvider:(id)a3;
- (NSArray)subcriteria;
- (NSArray)values;
- (NSString)columnName;
- (SiriCoreSQLiteQueryCriterion)initWithColumnName:(id)a3 comparisonOperator:(int64_t)a4 logicalOperator:(int64_t)a5 value:(id)a6 values:(id)a7 subcriteria:(id)a8;
- (SiriCoreSQLiteQueryCriterion)initWithColumnName:(id)a3 comparisonOperator:(int64_t)a4 logicalOperator:(int64_t)a5 value:(id)a6 values:(id)a7 subcriteriaProvider:(id)a8;
- (SiriCoreSQLiteValue)value;
- (int64_t)comparisonOperator;
- (int64_t)logicalOperator;
@end

@implementation SiriCoreSQLiteQueryCriterion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subcriteria, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_columnName, 0);
}

- (NSArray)subcriteria
{
  return self->_subcriteria;
}

- (NSArray)values
{
  return self->_values;
}

- (SiriCoreSQLiteValue)value
{
  return self->_value;
}

- (int64_t)logicalOperator
{
  return self->_logicalOperator;
}

- (int64_t)comparisonOperator
{
  return self->_comparisonOperator;
}

- (NSString)columnName
{
  return self->_columnName;
}

- (SiriCoreSQLiteQueryCriterion)initWithColumnName:(id)a3 comparisonOperator:(int64_t)a4 logicalOperator:(int64_t)a5 value:(id)a6 values:(id)a7 subcriteriaProvider:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  if (a8)
  {
    (*((void (**)(id))a8 + 2))(a8);
    a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = [(SiriCoreSQLiteQueryCriterion *)self initWithColumnName:v14 comparisonOperator:a4 logicalOperator:a5 value:v15 values:v16 subcriteria:a8];

  return v17;
}

- (SiriCoreSQLiteQueryCriterion)initWithColumnName:(id)a3 comparisonOperator:(int64_t)a4 logicalOperator:(int64_t)a5 value:(id)a6 values:(id)a7 subcriteria:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)SiriCoreSQLiteQueryCriterion;
  v18 = [(SiriCoreSQLiteQueryCriterion *)&v28 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    columnName = v18->_columnName;
    v18->_columnName = (NSString *)v19;

    v18->_comparisonOperator = a4;
    v18->_logicalOperator = a5;
    uint64_t v21 = [v15 copy];
    value = v18->_value;
    v18->_value = (SiriCoreSQLiteValue *)v21;

    uint64_t v23 = [v16 copy];
    values = v18->_values;
    v18->_values = (NSArray *)v23;

    uint64_t v25 = [v17 copy];
    subcriteria = v18->_subcriteria;
    v18->_subcriteria = (NSArray *)v25;
  }
  return v18;
}

+ (id)likeQueryCriterionWithColumnName:(id)a3 value:(id)a4 negation:(BOOL)a5
{
  if (a5) {
    uint64_t v6 = 10;
  }
  else {
    uint64_t v6 = 7;
  }
  id v7 = a4;
  id v8 = a3;
  v9 = [[SiriCoreSQLiteQueryCriterion alloc] initWithColumnName:v8 comparisonOperator:0 logicalOperator:v6 value:v7 values:0 subcriteria:0];

  return v9;
}

+ (id)isNullQueryCriterionWithColumnName:(id)a3 negation:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 11;
  }
  else {
    uint64_t v4 = 6;
  }
  id v5 = a3;
  uint64_t v6 = [[SiriCoreSQLiteQueryCriterion alloc] initWithColumnName:v5 comparisonOperator:0 logicalOperator:v4 value:0 values:0 subcriteria:0];

  return v6;
}

+ (id)isQueryCriterionWithColumnName:(id)a3 value:(id)a4 negation:(BOOL)a5
{
  if (a5) {
    uint64_t v6 = 5;
  }
  else {
    uint64_t v6 = 4;
  }
  id v7 = a4;
  id v8 = a3;
  v9 = [[SiriCoreSQLiteQueryCriterion alloc] initWithColumnName:v8 comparisonOperator:0 logicalOperator:v6 value:v7 values:0 subcriteria:0];

  return v9;
}

+ (id)inQueryCriterionWithColumnName:(id)a3 values:(id)a4 negation:(BOOL)a5
{
  if (a5) {
    uint64_t v6 = 9;
  }
  else {
    uint64_t v6 = 3;
  }
  id v7 = a4;
  id v8 = a3;
  v9 = [[SiriCoreSQLiteQueryCriterion alloc] initWithColumnName:v8 comparisonOperator:0 logicalOperator:v6 value:0 values:v7 subcriteria:0];

  return v9;
}

+ (id)betweenQueryCriterionWithColumnName:(id)a3 fromValue:(id)a4 toValue:(id)a5 negation:(BOOL)a6
{
  v16[2] = *MEMORY[0x263EF8340];
  if (a6) {
    uint64_t v8 = 8;
  }
  else {
    uint64_t v8 = 2;
  }
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [SiriCoreSQLiteQueryCriterion alloc];
  v16[0] = v10;
  v16[1] = v9;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];

  id v14 = [(SiriCoreSQLiteQueryCriterion *)v12 initWithColumnName:v11 comparisonOperator:0 logicalOperator:v8 value:0 values:v13 subcriteria:0];

  return v14;
}

+ (id)orQueryCriterionWithSubcriteriaProvider:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[SiriCoreSQLiteQueryCriterion alloc] initWithColumnName:0 comparisonOperator:0 logicalOperator:12 value:0 values:0 subcriteriaProvider:v3];

  return v4;
}

+ (id)orQueryCriterionWithSubcriteria:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[SiriCoreSQLiteQueryCriterion alloc] initWithColumnName:0 comparisonOperator:0 logicalOperator:12 value:0 values:0 subcriteria:v3];

  return v4;
}

+ (id)andQueryCriterionWithSubcriteriaProvider:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[SiriCoreSQLiteQueryCriterion alloc] initWithColumnName:0 comparisonOperator:0 logicalOperator:1 value:0 values:0 subcriteriaProvider:v3];

  return v4;
}

+ (id)andQueryCriterionWithSubcriteria:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[SiriCoreSQLiteQueryCriterion alloc] initWithColumnName:0 comparisonOperator:0 logicalOperator:1 value:0 values:0 subcriteria:v3];

  return v4;
}

+ (id)notEqualToQueryCriterionWithColumnName:(id)a3 value:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SiriCoreSQLiteQueryCriterion alloc] initWithColumnName:v6 comparisonOperator:6 logicalOperator:0 value:v5 values:0 subcriteria:0];

  return v7;
}

+ (id)lessThanOrEqualToQueryCriterionWithColumnName:(id)a3 value:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SiriCoreSQLiteQueryCriterion alloc] initWithColumnName:v6 comparisonOperator:5 logicalOperator:0 value:v5 values:0 subcriteria:0];

  return v7;
}

+ (id)lessThanQueryCriterionWithColumnName:(id)a3 value:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SiriCoreSQLiteQueryCriterion alloc] initWithColumnName:v6 comparisonOperator:4 logicalOperator:0 value:v5 values:0 subcriteria:0];

  return v7;
}

+ (id)greaterThanOrEqualToQueryCriterionWithColumnName:(id)a3 value:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SiriCoreSQLiteQueryCriterion alloc] initWithColumnName:v6 comparisonOperator:3 logicalOperator:0 value:v5 values:0 subcriteria:0];

  return v7;
}

+ (id)greaterThanQueryCriterionWithColumnName:(id)a3 value:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SiriCoreSQLiteQueryCriterion alloc] initWithColumnName:v6 comparisonOperator:2 logicalOperator:0 value:v5 values:0 subcriteria:0];

  return v7;
}

+ (id)equalToQueryCriterionWithColumnName:(id)a3 value:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SiriCoreSQLiteQueryCriterion alloc] initWithColumnName:v6 comparisonOperator:1 logicalOperator:0 value:v5 values:0 subcriteria:0];

  return v7;
}

@end