@interface AccountUserNotificationSettings
+ (id)_predicateForAccountUserPID:(id)a3;
+ (id)_propertySettersForAccountUserNotificationSettings;
+ (id)_propertyValuesForAccountUserNotificationSettings:(id)a3;
+ (id)anyInDatabase:(id)a3 forAccountUserPID:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateAccountUserNotificationSettings:(id)a3 forAccountUserPID:(id)a4 inDatabase:(id)a5;
- (AccountUserNotificationSettings)initWithAccountUserNotificationSettings:(id)a3 accountUserPID:(id)a4 inDatabase:(id)a5;
- (id)accountUserNotificationSettings;
- (void)updateWithAccountUserNotificationSettings:(id)a3;
@end

@implementation AccountUserNotificationSettings

+ (id)databaseTable
{
  return @"mulberry";
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

+ (id)insertOrUpdateAccountUserNotificationSettings:(id)a3 forAccountUserPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [a1 anyInDatabase:v10 forAccountUserPID:v9];
  if (v11)
  {
    id v12 = v11;
    [v11 updateWithAccountUserNotificationSettings:v8];
  }
  else
  {
    id v12 = [objc_alloc((Class)a1) initWithAccountUserNotificationSettings:v8 accountUserPID:v9 inDatabase:v10];
  }

  return v12;
}

- (AccountUserNotificationSettings)initWithAccountUserNotificationSettings:(id)a3 accountUserPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() _propertyValuesForAccountUserNotificationSettings:v10];

  id v12 = [v11 mutableCopy];
  [v12 setObjectOrNull:v9 forKey:@"a"];

  v13 = [(SQLiteEntity *)self initWithPropertyValues:v12 inDatabase:v8];
  return v13;
}

- (void)updateWithAccountUserNotificationSettings:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForAccountUserNotificationSettings:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)anyInDatabase:(id)a3 forAccountUserPID:(id)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForAccountUserPID:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

- (id)accountUserNotificationSettings
{
  id v3 = objc_alloc_init((Class)PKAccountUserNotificationSettings);
  id v4 = [(id)objc_opt_class() _propertySettersForAccountUserNotificationSettings];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10037CFE0;
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

+ (id)_propertyValuesForAccountUserNotificationSettings:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "transactionNotificationsEnabled"), @"b");
  id v5 = [v3 transactionNotificationThreshold];
  id v6 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v6 forKey:@"c"];

  id v7 = [v3 monthlySpendNotificationThreshold];

  id v8 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v8 forKey:@"d"];

  id v9 = [v4 copy];
  return v9;
}

+ (id)_propertySettersForAccountUserNotificationSettings
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_10074C020;
  v5[1] = &stru_10074C040;
  v4[2] = @"d";
  v5[2] = &stru_10074C060;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

@end