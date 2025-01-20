@interface PayLaterMerchant
+ (id)_predicateForFinancingPlanPID:(int64_t)a3;
+ (id)_predicateForNoMapsMatch;
+ (id)_predicateForRequiresMerchantReprocessing:(BOOL)a3;
+ (id)_predicateForTransactionDate:(id)a3 withinWindow:(double)a4;
+ (id)_propertySettersForPayLaterMerchant;
+ (id)_propertyValuesForPayLaterMerchant:(id)a3;
+ (id)anyInDatabase:(id)a3 forFinancingPlanPID:(int64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayLaterMerchant:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)payLaterFinancingPlansRequiringMerchantCleanupInDatabase:(id)a3 transactionDateWithinWindow:(double)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deletePayLaterMerchantForFinancingPlanPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterMerchant)initWithPayLaterMerchant:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5;
- (id)payLaterMerchant;
- (void)udpdateProcessedPayLaterMerchant:(id)a3;
- (void)updateWithPayLaterMerchant:(id)a3;
@end

@implementation PayLaterMerchant

+ (id)databaseTable
{
  return @"boysenberry";
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

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v9 = v7;
  if (v7 == @"marionberry.m"
    || v7 && (unsigned int v8 = [@"marionberry.m" isEqualToString:v7], v9, v8))
  {
    [v6 addObject:@"JOIN huckleberry ON huckleberry.pid = boysenberry.a"];
    [v6 addObject:@"JOIN marionberry ON marionberry.a = huckleberry.pid"];
  }
}

- (PayLaterMerchant)initWithPayLaterMerchant:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesForPayLaterMerchant:v9];

  id v11 = [v10 mutableCopy];
  v12 = +[NSNumber numberWithLongLong:a4];
  [v11 setObjectOrNull:v12 forKey:@"a"];

  v13 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  return v13;
}

+ (id)insertOrUpdatePayLaterMerchant:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_100020BFC;
  v25 = sub_1000210F0;
  v10 = [a1 _predicateForFinancingPlanPID:a4];
  id v26 = [a1 anyInDatabase:v9 predicate:v10];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003656F8;
  v15[3] = &unk_10073AFF8;
  v18 = &v21;
  id v11 = v8;
  id v16 = v11;
  id v19 = a1;
  int64_t v20 = a4;
  id v12 = v9;
  id v17 = v12;
  sub_10000817C((uint64_t)v12, v15);
  id v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (void)udpdateProcessedPayLaterMerchant:(id)a3
{
  id v4 = a3;
  id v5 = [(SQLiteEntity *)self database];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100365928;
  v7[3] = &unk_100738A00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_10000817C((uint64_t)v5, v7);
}

- (void)updateWithPayLaterMerchant:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForPayLaterMerchant:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)payLaterFinancingPlansRequiringMerchantCleanupInDatabase:(id)a3 transactionDateWithinWindow:(double)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = [a1 _predicateForRequiresMerchantReprocessing:1];
  [v7 addObject:v8];

  id v9 = [a1 _predicateForNoMapsMatch];
  [v7 addObject:v9];

  if (a4 > 0.0)
  {
    v10 = +[NSDate date];
    id v11 = [a1 _predicateForTransactionDate:v10 withinWindow:a4];

    id v12 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"x"];
    v30[0] = v11;
    v30[1] = v12;
    id v13 = +[NSArray arrayWithObjects:v30 count:2];
    v14 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v13];
    [v7 addObject:v14];
  }
  v15 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v7];
  id v16 = [a1 queryWithDatabase:v6 predicate:v15];
  id v17 = objc_alloc_init((Class)NSMutableArray);
  CFStringRef v29 = @"a";
  v18 = +[NSArray arrayWithObjects:&v29 count:1];
  uint64_t v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  v25 = sub_100365DFC;
  id v26 = &unk_10074B1A0;
  id v27 = v6;
  id v19 = v17;
  id v28 = v19;
  id v20 = v6;
  [v16 enumerateProperties:v18 usingBlock:&v23];

  if (objc_msgSend(v19, "count", v23, v24, v25, v26)) {
    id v21 = [v19 copy];
  }
  else {
    id v21 = 0;
  }

  return v21;
}

+ (id)_predicateForTransactionDate:(id)a3 withinWindow:(double)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = [v5 dateByAddingTimeInterval:a4];
  id v8 = [v5 dateByAddingTimeInterval:-a4];

  id v9 = (void *)_SQLValueForDate();
  v10 = +[SQLiteComparisonPredicate predicateWithProperty:@"marionberry.m" lessThanOrEqualToValue:v9];
  [v6 addObject:v10];

  id v11 = (void *)_SQLValueForDate();
  id v12 = +[SQLiteComparisonPredicate predicateWithProperty:@"marionberry.m" greaterThanOrEqualToValue:v11];
  [v6 addObject:v12];

  id v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v6];

  return v13;
}

+ (id)anyInDatabase:(id)a3 forFinancingPlanPID:(int64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForFinancingPlanPID:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (void)deletePayLaterMerchantForFinancingPlanPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForFinancingPlanPID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)PayLaterMerchant;
  return [(SQLiteEntity *)&v3 deleteFromDatabase];
}

- (id)payLaterMerchant
{
  id v3 = objc_alloc_init((Class)PKPayLaterMerchant);
  id v4 = [(id)objc_opt_class() _propertySettersForPayLaterMerchant];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100366228;
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

+ (id)_predicateForFinancingPlanPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForRequiresMerchantReprocessing:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"w" equalToValue:v3];

  return v4;
}

+ (id)_predicateForNoMapsMatch
{
  v2 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"u"];
  v7[0] = v2;
  id v3 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"v"];
  v7[1] = v3;
  id v4 = +[NSArray arrayWithObjects:v7 count:2];
  id v5 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v4];

  return v5;
}

+ (id)_propertyValuesForPayLaterMerchant:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 merchantIdentifier];
  [v4 setObjectOrNull:v5 forKey:@"b"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "merchantCategoryCode"), @"c");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "merchantCategory"), @"d");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "fallbackCategory"), @"p");
  id v6 = [v3 rawName];
  [v4 setObjectOrNull:v6 forKey:@"e"];

  id v7 = [v3 rawCANL];
  [v4 setObjectOrNull:v7 forKey:@"f"];

  id v8 = [v3 rawCity];
  [v4 setObjectOrNull:v8 forKey:@"g"];

  id v9 = [v3 rawState];
  [v4 setObjectOrNull:v9 forKey:@"h"];

  v10 = [v3 rawCountry];
  [v4 setObjectOrNull:v10 forKey:@"i"];

  id v11 = [v3 name];
  [v4 setObjectOrNull:v11 forKey:@"j"];

  id v12 = [v3 city];
  [v4 setObjectOrNull:v12 forKey:@"k"];

  id v13 = [v3 state];
  [v4 setObjectOrNull:v13 forKey:@"l"];

  v14 = [v3 zipcode];
  [v4 setObjectOrNull:v14 forKey:@"m"];

  v15 = [v3 country];
  [v4 setObjectOrNull:v15 forKey:@"n"];

  id v16 = [v3 authNetworkData];
  [v4 setObjectOrNull:v16 forKey:@"s"];

  id v17 = [v3 clearingNetworkData];
  [v4 setObjectOrNull:v17 forKey:@"t"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "industryCode"), @"r");
  v18 = [v3 industryCategory];
  [v4 setObjectOrNull:v18 forKey:@"q"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "cleanConfidence"), @"o");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "adamIdentifier"), @"y");
  id v19 = [v3 webMerchantName];
  [v4 setObjectOrNull:v19 forKey:@"z"];

  id v20 = [v3 webMerchantIdentifier];
  [v4 setObjectOrNull:v20 forKey:@"aa"];

  id v21 = [v3 originURL];

  v22 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v22 forKey:@"bb"];

  id v23 = [v4 copy];
  return v23;
}

+ (id)_propertySettersForPayLaterMerchant
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_10074B1E0;
  v5[1] = &stru_10074B200;
  v4[2] = @"d";
  v4[3] = @"p";
  v5[2] = &stru_10074B220;
  v5[3] = &stru_10074B240;
  v4[4] = @"e";
  v4[5] = @"f";
  v5[4] = &stru_10074B260;
  v5[5] = &stru_10074B280;
  v4[6] = @"g";
  v4[7] = @"h";
  v5[6] = &stru_10074B2A0;
  v5[7] = &stru_10074B2C0;
  v4[8] = @"i";
  v4[9] = @"j";
  v5[8] = &stru_10074B2E0;
  v5[9] = &stru_10074B300;
  v4[10] = @"k";
  v4[11] = @"l";
  v5[10] = &stru_10074B320;
  v5[11] = &stru_10074B340;
  v4[12] = @"m";
  v4[13] = @"n";
  v5[12] = &stru_10074B360;
  v5[13] = &stru_10074B380;
  v4[14] = @"s";
  v4[15] = @"t";
  v5[14] = &stru_10074B3A0;
  v5[15] = &stru_10074B3C0;
  v4[16] = @"q";
  v4[17] = @"r";
  v5[16] = &stru_10074B3E0;
  v5[17] = &stru_10074B400;
  v4[18] = @"w";
  v4[19] = @"x";
  v5[18] = &stru_10074B420;
  v5[19] = &stru_10074B440;
  v4[20] = @"o";
  v4[21] = @"y";
  v5[20] = &stru_10074B460;
  v5[21] = &stru_10074B480;
  v4[22] = @"z";
  v4[23] = @"aa";
  v5[22] = &stru_10074B4A0;
  v5[23] = &stru_10074B4C0;
  v4[24] = @"bb";
  v5[24] = &stru_10074B4E0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:25];
  return v2;
}

@end