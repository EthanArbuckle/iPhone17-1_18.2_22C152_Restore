@interface MapsBrand
+ (id)_mapsBrandsMatchingQuery:(id)a3;
+ (id)_mapsBrandsWithQuery:(id)a3;
+ (id)_predicateForEndDate:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPID:(id)a3;
+ (id)_predicateForPIDs:(id)a3;
+ (id)_predicateForStartDate:(id)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesForMapsBrand:(id)a3;
+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withPID:(id)a4;
+ (id)databaseTable;
+ (id)insertMapsBrand:(id)a3 inDatabase:(id)a4;
+ (id)insertOrUpdateMapsBrand:(id)a3 inDatabase:(id)a4;
+ (id)mapsBrandsInDatabase:(id)a3;
+ (id)mapsBrandsWithLastUpdatedDateFromStartDate:(id)a3 endDate:(id)a4 limit:(int64_t)a5 inDatabase:(id)a6;
+ (void)associateMapsBrandsToPaymentTransactions:(id)a3 inDatabase:(id)a4;
- (MapsBrand)initWithMapsBrand:(id)a3 inDatabase:(id)a4;
- (id)mapsBrand;
- (void)updateWithMapsBrand:(id)a3;
@end

@implementation MapsBrand

+ (id)databaseTable
{
  return @"plantains";
}

- (MapsBrand)initWithMapsBrand:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(id)objc_opt_class() _propertyValuesForMapsBrand:v7];

  v9 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v6];
  return v9;
}

+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForIdentifier:a4];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 withPID:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPID:a4];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)mapsBrandsInDatabase:(id)a3
{
  v4 = [a1 queryWithDatabase:a3 predicate:0];
  v5 = [a1 _mapsBrandsMatchingQuery:v4];

  return v5;
}

+ (id)mapsBrandsWithLastUpdatedDateFromStartDate:(id)a3 endDate:(id)a4 limit:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  v12 = [a1 _predicateForStartDate:a3];
  v19[0] = v12;
  v13 = [a1 _predicateForEndDate:v11];

  v19[1] = v13;
  v14 = +[NSArray arrayWithObjects:v19 count:2];
  v15 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v14];

  v16 = +[SQLiteEntity queryWithDatabase:v10 predicate:v15 orderingProperties:0 orderingDirections:0 limit:a5];

  v17 = [a1 _mapsBrandsWithQuery:v16];

  return v17;
}

+ (id)_mapsBrandsWithQuery:(id)a3
{
  id v4 = a3;
  v5 = [a1 _propertySetters];
  id v6 = objc_alloc_init((Class)NSMutableSet);
  id v7 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10044BAA8;
  v12[3] = &unk_10072EAD8;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v14 = v8;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  if ([v8 count]) {
    id v10 = [v8 copy];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

+ (void)associateMapsBrandsToPaymentTransactions:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [v6 allKeys];
    id v9 = [a1 _predicateForPIDs:v8];
    id v10 = +[SQLiteEntity queryWithDatabase:v7 predicate:v9];

    id v11 = [a1 _propertySetters];
    v12 = [v11 allKeys];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10044BC88;
    v14[3] = &unk_10072EAD8;
    id v17 = a1;
    id v15 = v11;
    id v16 = v6;
    id v13 = v11;
    [v10 enumeratePersistentIDsAndProperties:v12 usingBlock:v14];
  }
}

+ (id)insertMapsBrand:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithMapsBrand:v7 inDatabase:v6];

  return v8;
}

+ (id)insertOrUpdateMapsBrand:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isValid])
  {
    id v7 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v5 identifier]);
    id v8 = +[MapsBrand anyInDatabase:v6 withIdentifier:v7];

    if (v8)
    {
      [v8 updateWithMapsBrand:v5];
    }
    else
    {
      id v8 = +[MapsBrand insertMapsBrand:v5 inDatabase:v6];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)updateWithMapsBrand:(id)a3
{
  id v4 = a3;
  id v5 = [(SQLiteEntity *)self valueForProperty:@"last_processed_date"];
  id v6 = (void *)_DateForSQLValue();

  id v7 = [v4 lastProcessedDate];
  id v8 = v7;
  if (v7 || !v6)
  {
    if (!v7 || !v6 || ([v7 timeIntervalSinceDate:v6], v13 >= 0.0))
    {
      id v14 = [(id)objc_opt_class() _propertyValuesForMapsBrand:v4];
      [(SQLiteEntity *)self setValuesWithDictionary:v14];

      goto LABEL_13;
    }
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412802;
      id v16 = v4;
      __int16 v17 = 2112;
      v18 = v8;
      __int16 v19 = 2112;
      v20 = v6;
      id v10 = "Not updating mapsBrand %@ since the new brand date %@ is older than the current last processed date %@.";
      id v11 = v9;
      uint32_t v12 = 32;
      goto LABEL_10;
    }
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      v18 = v6;
      id v10 = "Not updating mapsBrand %@ since the new brand doesnt have a last processed date defined. The current last pr"
            "ocessed date is %@";
      id v11 = v9;
      uint32_t v12 = 22;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
    }
  }

LABEL_13:
}

- (id)mapsBrand
{
  id v3 = objc_alloc_init((Class)PKMapsBrand);
  id v4 = [(id)objc_opt_class() _propertySetters];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10044C20C;
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

+ (id)_mapsBrandsMatchingQuery:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _propertySetters];
  id v6 = +[NSMutableSet set];
  id v7 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10044C398;
  v12[3] = &unk_10072EAD8;
  id v14 = v6;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  id v10 = [v8 copy];
  return v10;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_predicateForPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:a3];
}

+ (id)_predicateForPIDs:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:@"pid" values:a3];
}

+ (id)_predicateForStartDate:(id)a3
{
  if (a3)
  {
    id v3 = (void *)_SQLValueForDate();
    id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"last_processed_date" greaterThanOrEqualToValue:v3];
  }
  else
  {
    id v4 = +[SQLiteBooleanPredicate truePredicate];
  }
  return v4;
}

+ (id)_predicateForEndDate:(id)a3
{
  if (a3)
  {
    id v3 = (void *)_SQLValueForDate();
    id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"last_processed_date" lessThanOrEqualToValue:v3];
  }
  else
  {
    id v4 = +[SQLiteBooleanPredicate truePredicate];
  }
  return v4;
}

+ (id)_propertyValuesForMapsBrand:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v4, "setUnsignedLongLong:forKey:", objc_msgSend(v3, "identifier"), @"a");
  id v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 resultProviderIdentifier]);
  [v4 setObjectOrNull:v5 forKey:@"b"];

  id v6 = [v3 name];
  [v4 setObjectOrNull:v6 forKey:@"c"];

  id v7 = [v3 phoneNumber];
  [v4 setObjectOrNull:v7 forKey:@"d"];

  id v8 = [v3 url];
  id v9 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v9 forKey:@"e"];

  id v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 category]);
  [v4 setObjectOrNull:v10 forKey:@"g"];

  id v11 = [v3 detailedCategory];
  [v4 setObjectOrNull:v11 forKey:@"h"];

  id v12 = [v3 logoURL];
  id v13 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v13 forKey:@"i"];

  id v14 = [v3 lastProcessedDate];
  id v15 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v15 forKey:@"last_processed_date"];

  id v16 = [v3 businessChatURL];

  if (v16)
  {
    __int16 v17 = [v3 businessChatURL];
    v18 = (void *)_SQLValueForURL();
    [v4 setObjectOrNull:v18 forKey:@"m"];
  }
  __int16 v19 = [v3 heroImageURL];

  if (v19)
  {
    v20 = [v3 heroImageURL];
    v21 = (void *)_SQLValueForURL();
    [v4 setObjectOrNull:v21 forKey:@"n"];
  }
  v22 = [v3 heroImageAttributionName];

  if (v22)
  {
    v23 = [v3 heroImageAttributionName];
    [v4 setObjectOrNull:v23 forKey:@"o"];
  }
  v24 = [v3 stylingInfoData];
  [v4 setObjectOrNull:v24 forKey:@"l"];

  id v25 = [v4 copy];
  return v25;
}

+ (id)_propertySetters
{
  v4[0] = @"a";
  v4[1] = @"b";
  v5[0] = &stru_100751E40;
  v5[1] = &stru_100751E60;
  v4[2] = @"c";
  v4[3] = @"d";
  v5[2] = &stru_100751E80;
  v5[3] = &stru_100751EA0;
  v4[4] = @"e";
  v4[5] = @"g";
  v5[4] = &stru_100751EC0;
  v5[5] = &stru_100751EE0;
  v4[6] = @"h";
  v4[7] = @"i";
  v5[6] = &stru_100751F00;
  v5[7] = &stru_100751F20;
  v4[8] = @"m";
  v4[9] = @"n";
  v5[8] = &stru_100751F40;
  v5[9] = &stru_100751F60;
  v4[10] = @"o";
  v4[11] = @"last_processed_date";
  v5[10] = &stru_100751F80;
  v5[11] = &stru_100751FA0;
  v4[12] = @"l";
  v5[12] = &stru_100751FC0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:13];
  return v2;
}

@end