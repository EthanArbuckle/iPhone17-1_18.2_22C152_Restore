@interface PayLaterCardMagnitudes
+ (id)_commonDictionaryForMagnitudes:(id)a3;
+ (id)_predicateForAccountIdentifier:(id)a3;
+ (id)_propertySettersForMagnitudes;
+ (id)databaseTable;
+ (id)insertOrUpdateMagnitudes:(id)a3 forAccountIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)magnitudesForAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteMagnitudesForAccountIdentifier:(id)a3 inDatabase:(id)a4;
- (PayLaterCardMagnitudes)initWithMagnitudes:(id)a3 forAccountIdentifier:(id)a4 inDatabase:(id)a5;
- (id)magnitudes;
- (void)updateWithMagnitudes:(id)a3;
@end

@implementation PayLaterCardMagnitudes

+ (id)databaseTable
{
  return @"radish";
}

- (PayLaterCardMagnitudes)initWithMagnitudes:(id)a3 forAccountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() _commonDictionaryForMagnitudes:v10];

  [v11 setObjectOrNull:v9 forKey:@"a"];
  v12 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];

  return v12;
}

+ (id)insertOrUpdateMagnitudes:(id)a3 forAccountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [a1 _predicateForAccountIdentifier:v9];
  v12 = [a1 anyInDatabase:v10 predicate:v11];
  if (v12)
  {
    id v13 = v12;
    [v12 updateWithMagnitudes:v8];
  }
  else
  {
    id v13 = [objc_alloc((Class)a1) initWithMagnitudes:v8 forAccountIdentifier:v9 inDatabase:v10];
  }

  return v13;
}

+ (void)deleteMagnitudesForAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForAccountIdentifier:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)magnitudesForAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountIdentifier:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 magnitudes];

  return v9;
}

- (id)magnitudes
{
  id v3 = objc_alloc_init((Class)PKPayLaterCardMagnitudes);
  v4 = [(id)objc_opt_class() _propertySettersForMagnitudes];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10012B7EC;
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

- (void)updateWithMagnitudes:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _commonDictionaryForMagnitudes:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)_predicateForAccountIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_propertySettersForMagnitudes
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_100739160;
  v5[1] = &stru_100739180;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_1007391A0;
  v5[3] = &stru_1007391C0;
  v4[4] = @"f";
  v4[5] = @"g";
  v5[4] = &stru_1007391E0;
  v5[5] = &stru_100739200;
  v4[6] = @"h";
  v4[7] = @"i";
  v5[6] = &stru_100739220;
  v5[7] = &stru_100739240;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:8];
  return v2;
}

+ (id)_commonDictionaryForMagnitudes:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "unknownCount"), @"b");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "foodAndDrinksCount"), @"c");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "shoppingCount"), @"d");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "travelCount"), @"e");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "servicesCount"), @"f");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "funCount"), @"g");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "healthCount"), @"h");
  id v5 = [v3 transportcount];

  [v4 setInteger:v5 forKey:@"i"];
  return v4;
}

@end