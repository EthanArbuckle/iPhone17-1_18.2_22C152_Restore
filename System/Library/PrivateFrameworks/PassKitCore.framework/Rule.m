@interface Rule
+ (id)_predicateForRuleIdentifier:(id)a3;
+ (id)_predicateForRuleIdentifiers:(id)a3;
+ (id)_propertySettersForRule;
+ (id)databaseTable;
+ (id)insertOrUpdateRule:(id)a3 inDatabase:(id)a4;
+ (id)ruleWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)rulesInDatabase:(id)a3;
+ (id)rulesInDatabase:(id)a3 matchingRuleIdentifiers:(id)a4;
+ (void)deleteAllRulesInDatabase:(id)a3;
+ (void)deleteRuleWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteRulesNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4;
- (Rule)initWithRule:(id)a3 inDatabase:(id)a4;
- (id)rule;
- (void)updateWithRule:(id)a3;
@end

@implementation Rule

+ (id)rulesInDatabase:(id)a3
{
  id v4 = a3;
  v5 = +[SQLiteBooleanPredicate truePredicate];
  v6 = [a1 queryWithDatabase:v4 predicate:v5];

  id v7 = objc_alloc_init((Class)NSMutableSet);
  v8 = +[Rule _propertySettersForRule];
  v9 = [v8 allKeys];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100129700;
  v14[3] = &unk_10072EAD8;
  id v16 = v7;
  id v17 = a1;
  id v15 = v8;
  id v10 = v7;
  id v11 = v8;
  [v6 enumeratePersistentIDsAndProperties:v9 usingBlock:v14];
  id v12 = [v10 copy];

  return v12;
}

+ (id)rulesInDatabase:(id)a3 matchingRuleIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForRuleIdentifiers:a4];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = objc_alloc_init((Class)NSMutableSet);
  id v10 = +[Rule _propertySettersForRule];
  id v11 = [v10 allKeys];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001298E8;
  v16[3] = &unk_10072EAD8;
  id v18 = v9;
  id v19 = a1;
  id v17 = v10;
  id v12 = v9;
  id v13 = v10;
  [v8 enumeratePersistentIDsAndProperties:v11 usingBlock:v16];
  id v14 = [v12 copy];

  return v14;
}

+ (id)ruleWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForRuleIdentifier:a3];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)insertOrUpdateRule:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 identifier];
  id v9 = [a1 ruleWithIdentifier:v8 inDatabase:v7];

  if (v9) {
    [v9 updateWithRule:v6];
  }
  else {
    id v9 = [objc_alloc((Class)a1) initWithRule:v6 inDatabase:v7];
  }

  return v9;
}

- (Rule)initWithRule:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  id v9 = [v7 identifier];
  [v8 setObjectOrNull:v9 forKey:@"identifier"];

  id v10 = [v7 predicateFormat];
  [v8 setObjectOrNull:v10 forKey:@"predicate_format"];

  id v11 = [v7 osVersionRequirementRange];

  id v12 = (void *)_SQLValueForOSVersionRequirementRange();
  [v8 setObjectOrNull:v12 forKey:@"os_version_requirement_range"];

  id v13 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v6];
  id v14 = v13;

  return v14;
}

+ (void)deleteRuleWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForRuleIdentifier:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteRulesNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"identifier" values:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteAllRulesInDatabase:(id)a3
{
  id v4 = a3;
  v5 = +[SQLiteBooleanPredicate truePredicate];
  id v6 = [a1 queryWithDatabase:v4 predicate:v5];

  [v6 deleteAllEntities];
}

- (id)rule
{
  id v3 = objc_alloc_init((Class)PKRule);
  id v4 = +[Rule _propertySettersForRule];
  v5 = [v4 allKeys];
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_100129E74;
  id v14 = &unk_10072EDD0;
  id v15 = v4;
  id v6 = v3;
  id v16 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:&v11];

  objc_msgSend(v6, "parsePredicateFormat", v11, v12, v13, v14);
  id v8 = v16;
  id v9 = v6;

  return v9;
}

- (void)updateWithRule:(id)a3
{
  id v4 = a3;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v4 identifier];
  [v9 setObjectOrNull:v5 forKey:@"identifier"];

  id v6 = [v4 predicateFormat];
  [v9 setObjectOrNull:v6 forKey:@"predicate_format"];

  id v7 = [v4 osVersionRequirementRange];

  id v8 = (void *)_SQLValueForOSVersionRequirementRange();
  [v9 setObjectOrNull:v8 forKey:@"os_version_requirement_range"];

  [(SQLiteEntity *)self setValuesWithDictionary:v9];
}

+ (id)_predicateForRuleIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"identifier" equalToValue:a3];
}

+ (id)_predicateForRuleIdentifiers:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:@"identifier" values:a3];
}

+ (id)_propertySettersForRule
{
  v4[0] = @"identifier";
  v4[1] = @"predicate_format";
  v5[0] = &stru_100738F40;
  v5[1] = &stru_100738F60;
  v4[2] = @"os_version_requirement_range";
  v5[2] = &stru_100738F80;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

+ (id)databaseTable
{
  return @"rule";
}

@end