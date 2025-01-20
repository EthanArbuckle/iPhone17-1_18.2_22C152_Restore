@interface AppleBalanceInStoreTopUpToken
+ (id)_commonDictionaryForInStoreTopUpToken:(id)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_propertySettersForInStoreTopUpToken;
+ (id)databaseTable;
+ (id)inStoreTopUpTokenForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)insertInStoreTopUpToken:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertOrUpdateInStoreTopUpToken:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteInStoreTopUpTokenForAccountPID:(int64_t)a3 inDatabase:(id)a4;
- (AppleBalanceInStoreTopUpToken)initWithInStoreTopUpToken:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)topUpToken;
- (void)updateWithInStoreTopUpToken:(id)a3;
@end

@implementation AppleBalanceInStoreTopUpToken

+ (id)databaseTable
{
  return @"garlic";
}

- (AppleBalanceInStoreTopUpToken)initWithInStoreTopUpToken:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _commonDictionaryForInStoreTopUpToken:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  v13 = v12;

  return v13;
}

+ (id)insertInStoreTopUpToken:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  if (a3)
  {
    id v8 = a5;
    id v9 = a3;
    id v10 = [objc_alloc((Class)a1) initWithInStoreTopUpToken:v9 forAccountPID:a4 inDatabase:v8];
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

+ (void)deleteInStoreTopUpTokenForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  [v8 deleteFromDatabase];
}

+ (id)insertOrUpdateInStoreTopUpToken:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a1 _predicateForAccountPID:a4];
  v11 = [a1 anyInDatabase:v8 predicate:v10];

  if (v11)
  {
    [v11 updateWithInStoreTopUpToken:v9];
  }
  else
  {
    v11 = +[AppleBalanceInStoreTopUpToken insertInStoreTopUpToken:v9 forAccountPID:a4 inDatabase:v8];
  }

  return v11;
}

- (void)updateWithInStoreTopUpToken:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _commonDictionaryForInStoreTopUpToken:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)inStoreTopUpTokenForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 topUpToken];

  return v9;
}

- (id)topUpToken
{
  id v3 = objc_alloc_init((Class)PKAppleBalanceInStoreTopUpToken);
  id v4 = [(id)objc_opt_class() _propertySettersForInStoreTopUpToken];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10042C99C;
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

+ (id)_propertySettersForInStoreTopUpToken
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_100750A68;
  v5[1] = &stru_100750A88;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_100750AA8;
  v5[3] = &stru_100750AC8;
  v4[4] = @"f";
  v4[5] = @"g";
  v5[4] = &stru_100750AE8;
  v5[5] = &stru_100750B08;
  v4[6] = @"h";
  v4[7] = @"i";
  v5[6] = &stru_100750B28;
  v5[7] = &stru_100750B48;
  v4[8] = @"j";
  v5[8] = &stru_100750B68;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:9];
  return v2;
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_commonDictionaryForInStoreTopUpToken:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 token];
  [v4 setObjectOrNull:v5 forKey:@"b"];

  id v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 tokenType]);
  [v4 setObjectOrNull:v6 forKey:@"c"];

  id v7 = [v3 tokenIdentifier];
  [v4 setObjectOrNull:v7 forKey:@"d"];

  id v8 = [v3 expirationDate];
  id v9 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v9 forKey:@"e"];

  id v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 state]);
  [v4 setObjectOrNull:v10 forKey:@"f"];

  v11 = [v3 termsURL];
  id v12 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v12 forKey:@"g"];

  id v13 = [v3 certificateChain];
  v14 = _SQLValueForCertificateChain(v13);
  [v4 setObjectOrNull:v14 forKey:@"h"];

  v15 = [v3 payload];
  [v4 setObjectOrNull:v15 forKey:@"i"];

  v16 = [v3 signature];

  [v4 setObjectOrNull:v16 forKey:@"j"];
  return v4;
}

@end