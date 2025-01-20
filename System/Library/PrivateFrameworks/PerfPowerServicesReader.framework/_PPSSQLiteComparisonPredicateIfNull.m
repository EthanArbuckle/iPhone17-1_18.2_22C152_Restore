@interface _PPSSQLiteComparisonPredicateIfNull
- (BOOL)isEqual:(id)a3;
- (_PPSSQLiteComparisonPredicateIfNull)initWithProperty:(id)a3 ifPropertyIsNullValue:(id)a4 value:(id)a5 comparisonType:(int64_t)a6;
- (id)description;
- (id)ifPropertyIsNullValue;
- (id)sqlForEntity:(id)a3;
- (unint64_t)hash;
@end

@implementation _PPSSQLiteComparisonPredicateIfNull

- (_PPSSQLiteComparisonPredicateIfNull)initWithProperty:(id)a3 ifPropertyIsNullValue:(id)a4 value:(id)a5 comparisonType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_PPSSQLiteComparisonPredicateIfNull;
  v13 = [(PPSSQLiteComparisonPredicate *)&v17 initWithProperty:v10 value:v12 comparisonType:a6];
  if (v13)
  {
    if ([v11 conformsToProtocol:&unk_270715960]) {
      id v14 = (id)[v11 copy];
    }
    else {
      id v14 = v11;
    }
    id ifPropertyIsNullValue = v13->_ifPropertyIsNullValue;
    v13->_id ifPropertyIsNullValue = v14;
  }
  return v13;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)_PPSSQLiteComparisonPredicateIfNull;
  unint64_t v3 = [(PPSSQLiteComparisonPredicate *)&v7 hash];
  v4 = [(_PPSSQLiteComparisonPredicateIfNull *)self ifPropertyIsNullValue];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_PPSSQLiteComparisonPredicateIfNull;
  if ([(PPSSQLiteComparisonPredicate *)&v8 isEqual:v4])
  {
    id ifPropertyIsNullValue = self->_ifPropertyIsNullValue;
    if (ifPropertyIsNullValue == (id)v4[4]) {
      char v6 = 1;
    }
    else {
      char v6 = objc_msgSend(ifPropertyIsNullValue, "isEqual:");
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)sqlForEntity:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PPSSQLitePropertyPredicate *)self property];
  char v6 = [v4 disambiguatedSQLForProperty:v5 shouldEscape:1];

  objc_super v7 = NSString;
  objc_super v8 = [(PPSSQLiteComparisonPredicate *)self _comparisonTypeString];
  v9 = [v7 stringWithFormat:@"(IFNULL(%@, ?) %@ ?)", v6, v8];

  return v9;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = [(PPSSQLitePropertyPredicate *)self property];
  id ifPropertyIsNullValue = self->_ifPropertyIsNullValue;
  char v6 = [(PPSSQLiteComparisonPredicate *)self _comparisonTypeString];
  objc_super v7 = [(PPSSQLiteComparisonPredicate *)self value];
  objc_super v8 = [v3 stringWithFormat:@"'(%@, %@)' %@ %@", v4, ifPropertyIsNullValue, v6, v7];

  return v8;
}

- (id)ifPropertyIsNullValue
{
  return self->_ifPropertyIsNullValue;
}

- (void).cxx_destruct
{
}

@end