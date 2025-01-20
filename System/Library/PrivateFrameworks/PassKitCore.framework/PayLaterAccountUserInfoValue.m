@interface PayLaterAccountUserInfoValue
+ (id)_commonDictionaryForAccountUserInfoValue:(id)a3;
+ (id)_predicateForPID:(int64_t)a3;
+ (id)_predicateForUserInfoPID:(int64_t)a3;
+ (id)_propertySettersForPayLaterAccountUserInfoValue;
+ (id)databaseTable;
+ (id)insertPayLaterAccountUserInfoValue:(id)a3 userInfoPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)payLaterAccountUserInfoValueForPID:(id)a3 inDatabase:(id)a4;
+ (void)deletePayLaterAccountUserInfoValueForUserInfoPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterAccountUserInfoValue)initWithPayLaterAccountUserInfoValue:(id)a3 userInfoPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_currencyAmount;
- (id)userInfoValue;
@end

@implementation PayLaterAccountUserInfoValue

+ (id)databaseTable
{
  return @"splitpea";
}

- (PayLaterAccountUserInfoValue)initWithPayLaterAccountUserInfoValue:(id)a3 userInfoPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _commonDictionaryForAccountUserInfoValue:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  v13 = v12;

  return v13;
}

+ (id)insertPayLaterAccountUserInfoValue:(id)a3 userInfoPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [objc_alloc((Class)objc_opt_class()) initWithPayLaterAccountUserInfoValue:v8 userInfoPID:a4 inDatabase:v7];

  return v9;
}

+ (void)deletePayLaterAccountUserInfoValueForUserInfoPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForUserInfoPID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)PayLaterAccountUserInfoValue;
  return [(SQLiteEntity *)&v3 deleteFromDatabase];
}

+ (id)payLaterAccountUserInfoValueForPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a1, "_predicateForPID:", objc_msgSend(a3, "longLongValue"));
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 userInfoValue];

  return v9;
}

+ (id)_predicateForPID:(int64_t)a3
{
  objc_super v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForUserInfoPID:(int64_t)a3
{
  objc_super v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForPayLaterAccountUserInfoValue
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_10074B758;
  v5[1] = &stru_10074B778;
  v4[2] = @"f";
  v4[3] = @"g";
  v5[2] = &stru_10074B798;
  v5[3] = &stru_10074B7B8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

- (id)userInfoValue
{
  id v3 = objc_alloc_init((Class)PKPayLaterAccountUserInfoValue);
  v4 = [(id)objc_opt_class() _propertySettersForPayLaterAccountUserInfoValue];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10036AFAC;
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

- (id)_currencyAmount
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"d"];
  v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"e"];
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = PKCurrencyAmountMake();
  }

  return v8;
}

+ (id)_commonDictionaryForAccountUserInfoValue:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v5 = [v3 text];
  [v4 setObjectOrNull:v5 forKey:@"b"];

  id v6 = [v3 date];
  BOOL v7 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v7 forKey:@"c"];

  id v8 = [v3 currencyAmount];
  id v9 = [v8 amount];
  v10 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v10 forKey:@"d"];

  v11 = [v3 currencyAmount];
  id v12 = [v11 currency];
  [v4 setObjectOrNull:v12 forKey:@"e"];

  id v13 = [v3 odiAttribute];
  [v4 setObjectOrNull:v13 forKey:@"f"];

  id v14 = [v3 hasHiddenValue];
  [v4 setBool:v14 forKey:@"g"];
  return v4;
}

@end