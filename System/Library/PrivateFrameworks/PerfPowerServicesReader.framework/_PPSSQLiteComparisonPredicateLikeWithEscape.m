@interface _PPSSQLiteComparisonPredicateLikeWithEscape
- (NSString)escapeCharacter;
- (_PPSSQLiteComparisonPredicateLikeWithEscape)initWithProperty:(id)a3 value:(id)a4 escapeCharacter:(id)a5;
- (id)sqlForEntity:(id)a3;
@end

@implementation _PPSSQLiteComparisonPredicateLikeWithEscape

- (_PPSSQLiteComparisonPredicateLikeWithEscape)initWithProperty:(id)a3 value:(id)a4 escapeCharacter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_PPSSQLiteComparisonPredicateLikeWithEscape;
  v11 = [(PPSSQLiteComparisonPredicate *)&v15 initWithProperty:v8 value:v9 comparisonType:7];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    escapeCharacter = v11->_escapeCharacter;
    v11->_escapeCharacter = (NSString *)v12;
  }
  return v11;
}

- (id)sqlForEntity:(id)a3
{
  id v4 = a3;
  v5 = [(PPSSQLitePropertyPredicate *)self property];
  v6 = [v4 disambiguatedSQLForProperty:v5 shouldEscape:1];

  v7 = [NSString stringWithFormat:@"(%@ LIKE ? ESCAPE '%@')", v6, self->_escapeCharacter];

  return v7;
}

- (NSString)escapeCharacter
{
  return self->_escapeCharacter;
}

- (void).cxx_destruct
{
}

@end