@interface AppleBalancePromotionConfiguration
+ (id)_commonDictionaryForAppleBalancePromotionConfiguration:(id)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_propertySettersForAppleBalancePromotionConfiguration;
+ (id)appleBalancePromotionConfigurationForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)deleteAppleBalancePromotionConfigurationForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)insertAppleBalancePromotionConfiguration:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertOrUpdateAppleBalancePromotionConfiguration:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (AppleBalancePromotionConfiguration)initWithAppleBalancePromotionConfiguration:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)appleBalancePromotionConfiguration;
- (void)updateWithAppleBalancePromotionConfiguration:(id)a3;
@end

@implementation AppleBalancePromotionConfiguration

+ (id)databaseTable
{
  return @"apple_balance_dtu_promotion_configuration";
}

- (AppleBalancePromotionConfiguration)initWithAppleBalancePromotionConfiguration:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _commonDictionaryForAppleBalancePromotionConfiguration:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  v13 = v12;

  return v13;
}

+ (id)insertAppleBalancePromotionConfiguration:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  if (a3)
  {
    id v8 = a5;
    id v9 = a3;
    id v10 = [objc_alloc((Class)a1) initWithAppleBalancePromotionConfiguration:v9 forAccountPID:a4 inDatabase:v8];
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

+ (id)deleteAppleBalancePromotionConfigurationForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 appleBalancePromotionConfiguration];
  id v10 = [v9 uniqueIdentifier];

  if ([v8 deleteFromDatabase]) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  return v12;
}

+ (id)insertOrUpdateAppleBalancePromotionConfiguration:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a1 _predicateForAccountPID:a4];
  v11 = [a1 anyInDatabase:v8 predicate:v10];

  if (v11)
  {
    [v11 updateWithAppleBalancePromotionConfiguration:v9];
  }
  else
  {
    v11 = +[AppleBalancePromotionConfiguration insertAppleBalancePromotionConfiguration:v9 forAccountPID:a4 inDatabase:v8];
  }

  return v11;
}

- (void)updateWithAppleBalancePromotionConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _commonDictionaryForAppleBalancePromotionConfiguration:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)appleBalancePromotionConfigurationForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 appleBalancePromotionConfiguration];

  return v9;
}

- (id)appleBalancePromotionConfiguration
{
  id v3 = objc_alloc_init((Class)PKAppleBalancePromotionConfiguration);
  id v4 = [(id)objc_opt_class() _propertySettersForAppleBalancePromotionConfiguration];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10031E718;
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

+ (id)_propertySettersForAppleBalancePromotionConfiguration
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_100749088;
  v5[1] = &stru_1007490A8;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_1007490C8;
  v5[3] = &stru_1007490E8;
  v4[4] = @"f";
  v4[5] = @"g";
  v5[4] = &stru_100749108;
  v5[5] = &stru_100749128;
  v4[6] = @"h";
  v4[7] = @"i";
  v5[6] = &stru_100749148;
  v5[7] = &stru_100749168;
  v4[8] = @"j";
  v4[9] = @"k";
  v5[8] = &stru_100749188;
  v5[9] = &stru_1007491A8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:10];
  return v2;
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_commonDictionaryForAppleBalancePromotionConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 promotionType]);
  [v4 setObjectOrNull:v5 forKey:@"b"];

  id v6 = [v3 programIdentifier];
  [v4 setObjectOrNull:v6 forKey:@"c"];

  id v7 = [v3 versionIdentifier];
  [v4 setObjectOrNull:v7 forKey:@"d"];

  id v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 generationIdentifier]);
  [v4 setObjectOrNull:v8 forKey:@"e"];

  id v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 stamp]);
  [v4 setObjectOrNull:v9 forKey:@"f"];

  id v10 = [v3 bonusMinAmount];
  v11 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v11 forKey:@"g"];

  id v12 = [v3 bonusMaxAmount];
  id v13 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v13 forKey:@"h"];

  v14 = [v3 offerText];
  [v4 setObjectOrNull:v14 forKey:@"i"];

  v15 = [v3 conditionText];
  [v4 setObjectOrNull:v15 forKey:@"j"];

  v16 = [v3 lastUpdatedDate];

  v17 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v17 forKey:@"k"];

  return v4;
}

@end