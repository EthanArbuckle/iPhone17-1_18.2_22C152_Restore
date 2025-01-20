@interface PLValueComparison
- (BOOL)hasEqualComparisonComponent;
- (BOOL)hasGreaterThanComparisonComponent;
- (BOOL)hasLessThanComparisonComponent;
- (BOOL)hasNilComparisonComponent;
- (NSString)comparisonOperationString;
- (NSString)key;
- (NSString)sqlWhereClause;
- (PLValueComparison)initWithKey:(id)a3 withValue:(id)a4 withComparisonOperation:(signed __int16)a5;
- (id)value;
- (signed)comparisonOperation;
@end

@implementation PLValueComparison

- (PLValueComparison)initWithKey:(id)a3 withValue:(id)a4 withComparisonOperation:(signed __int16)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PLValueComparison;
  v11 = [(PLValueComparison *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_key, a3);
    objc_storeStrong(&v12->_value, a4);
    v12->_comparisonOperation = a5;
    if (!v10 && ![(PLValueComparison *)v12 hasNilComparisonComponent])
    {
      if ([(PLValueComparison *)v12 hasEqualComparisonComponent]) {
        __int16 v13 = 6;
      }
      else {
        __int16 v13 = 7;
      }
      v12->_comparisonOperation = v13;
    }
  }

  return v12;
}

- (BOOL)hasNilComparisonComponent
{
  return [(PLValueComparison *)self comparisonOperation] == 6
      || [(PLValueComparison *)self comparisonOperation] == 7;
}

- (BOOL)hasEqualComparisonComponent
{
  return ![(PLValueComparison *)self comparisonOperation]
      || [(PLValueComparison *)self comparisonOperation] == 3
      || [(PLValueComparison *)self comparisonOperation] == 5;
}

- (BOOL)hasGreaterThanComparisonComponent
{
  return [(PLValueComparison *)self comparisonOperation] == 2
      || [(PLValueComparison *)self comparisonOperation] == 3;
}

- (BOOL)hasLessThanComparisonComponent
{
  return [(PLValueComparison *)self comparisonOperation] == 4
      || [(PLValueComparison *)self comparisonOperation] == 5;
}

- (NSString)comparisonOperationString
{
  if (comparisonOperationString_onceToken != -1) {
    dispatch_once(&comparisonOperationString_onceToken, &__block_literal_global_11);
  }
  v3 = (void *)comparisonOperationString_comparisonOperationStrings;
  uint64_t v4 = [(PLValueComparison *)self comparisonOperation];
  return (NSString *)[v3 objectAtIndexedSubscript:v4];
}

void __46__PLValueComparison_comparisonOperationString__block_invoke()
{
  v0 = (void *)comparisonOperationString_comparisonOperationStrings;
  comparisonOperationString_comparisonOperationStrings = (uint64_t)&unk_1F1585AA8;
}

- (NSString)sqlWhereClause
{
  if ([(PLValueComparison *)self comparisonOperation] == 6
    || [(PLValueComparison *)self comparisonOperation] == 7)
  {
    v3 = NSString;
    uint64_t v4 = [(PLValueComparison *)self key];
    v5 = [(PLValueComparison *)self comparisonOperationString];
    v6 = [v3 stringWithFormat:@"\"%@\" %@", v4, v5];
  }
  else
  {
    v7 = NSString;
    uint64_t v4 = [(PLValueComparison *)self key];
    v5 = [(PLValueComparison *)self comparisonOperationString];
    v8 = [(PLValueComparison *)self value];
    v6 = [v7 stringWithFormat:@"\"%@\"%@\"%@\"", v4, v5, v8];
  }
  return (NSString *)v6;
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)value
{
  return objc_getProperty(self, a2, 24, 1);
}

- (signed)comparisonOperation
{
  return self->_comparisonOperation;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end