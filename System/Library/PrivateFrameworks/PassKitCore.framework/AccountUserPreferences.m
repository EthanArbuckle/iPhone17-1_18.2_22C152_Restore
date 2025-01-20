@interface AccountUserPreferences
+ (id)_predicateForAccountUserPID:(id)a3;
+ (id)_propertySettersForAccountUserPreferences;
+ (id)_propertyValuesForAccountUserPreferences:(id)a3;
+ (id)anyInDatabase:(id)a3 forAccountUserPID:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateAccountUserPreferences:(id)a3 forAccountUserPID:(id)a4 inDatabase:(id)a5;
- (AccountUserPreferences)initWithAccountUserPreferences:(id)a3 accountUserPID:(id)a4 inDatabase:(id)a5;
- (id)accountUserPreferences;
- (void)updateWithAccountUserPreferences:(id)a3;
@end

@implementation AccountUserPreferences

+ (id)databaseTable
{
  return @"prickly_pear";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"a";
  }
  else {
    return 0;
  }
}

+ (id)insertOrUpdateAccountUserPreferences:(id)a3 forAccountUserPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [a1 anyInDatabase:v10 forAccountUserPID:v9];
  if (v11)
  {
    id v12 = v11;
    [v11 updateWithAccountUserPreferences:v8];
  }
  else
  {
    id v12 = [objc_alloc((Class)a1) initWithAccountUserPreferences:v8 accountUserPID:v9 inDatabase:v10];
  }

  return v12;
}

- (AccountUserPreferences)initWithAccountUserPreferences:(id)a3 accountUserPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() _propertyValuesForAccountUserPreferences:v10];

  id v12 = [v11 mutableCopy];
  [v12 setObjectOrNull:v9 forKey:@"a"];

  v13 = [(SQLiteEntity *)self initWithPropertyValues:v12 inDatabase:v8];
  return v13;
}

- (void)updateWithAccountUserPreferences:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForAccountUserPreferences:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)anyInDatabase:(id)a3 forAccountUserPID:(id)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForAccountUserPID:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

- (id)accountUserPreferences
{
  id v3 = objc_alloc_init((Class)PKAccountUserPreferences);
  id v4 = [(id)objc_opt_class() _propertySettersForAccountUserPreferences];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100481D30;
  v11[3] = &unk_10072DDD8;
  v11[4] = self;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)_predicateForAccountUserPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_propertyValuesForAccountUserPreferences:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "transactionSpendLimitEnabled"), @"b");
  id v5 = [v3 transactionSpendLimitAmount];
  id v6 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v6 forKey:@"c"];

  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "monthlySpendLimitEnabled"), @"d");
  id v7 = [v3 monthlySpendLimitAmount];
  id v8 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v8 forKey:@"e"];

  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "spendingEnabled"), @"f");
  id v9 = [v3 showAvailableCredit];

  [v4 setBool:v9 forKey:@"g"];
  id v10 = [v4 copy];

  return v10;
}

+ (id)_propertySettersForAccountUserPreferences
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_100753CB8;
  v5[1] = &stru_100753CD8;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_100753CF8;
  v5[3] = &stru_100753D18;
  v4[4] = @"f";
  v4[5] = @"g";
  v5[4] = &stru_100753D38;
  v5[5] = &stru_100753D58;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:6];
  return v2;
}

@end