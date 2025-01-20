@interface AccountPhysicalCardShippingUpdate
+ (id)_predicateForEventPID:(int64_t)a3;
+ (id)_predicateForPhysicalCardIdentifier:(id)a3;
+ (id)_propertySettersForAccountPhysicalCardShippingUpdate;
+ (id)_shippingUpdatesWithQuery:(id)a3;
+ (id)databaseTable;
+ (id)insertPhysicalCardShippingUpdate:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)physicalCardShippingUpdatesForPhysicalCardWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)physicalCardShippingUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePhysicalCardShippingUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4;
- (id)physicalCardShippingUpdate;
@end

@implementation AccountPhysicalCardShippingUpdate

+ (id)physicalCardShippingUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForEventPID:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];

  v9 = [a1 _shippingUpdatesWithQuery:v8];

  return v9;
}

+ (id)physicalCardShippingUpdatesForPhysicalCardWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForPhysicalCardIdentifier:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];

  v9 = [a1 _shippingUpdatesWithQuery:v8];

  return v9;
}

+ (id)insertPhysicalCardShippingUpdate:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = +[NSMutableDictionary dictionary];
  v11 = [v9 physicalCardIdentifier];
  [v10 setObjectOrNull:v11 forKey:@"b"];

  v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 shippingStatus]);
  [v10 setObject:v12 forKey:@"c"];

  v13 = [v9 localizedDeliveryExceptionReason];
  [v10 setObjectOrNull:v13 forKey:@"d"];

  v14 = [v9 trackingNumber];
  [v10 setObjectOrNull:v14 forKey:@"e"];

  v15 = [v9 shippingCompany];
  [v10 setObjectOrNull:v15 forKey:@"f"];

  v16 = [v9 timestamp];
  v17 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v17 forKey:@"g"];

  v18 = [v9 estimatedDeliveryDate];

  if (v18)
  {
    id v19 = [v18 day];
    id v20 = [v18 month];
    id v21 = [v18 year];
    v22 = +[NSNumber numberWithUnsignedInteger:v19];
    [v10 setObjectOrNull:v22 forKey:@"i"];

    v23 = +[NSNumber numberWithUnsignedInteger:v20];
    [v10 setObjectOrNull:v23 forKey:@"j"];

    v24 = +[NSNumber numberWithUnsignedInteger:v21];
    [v10 setObjectOrNull:v24 forKey:@"k"];
  }
  v25 = +[NSNumber numberWithLongLong:a4];
  [v10 setObject:v25 forKey:@"a"];

  id v26 = [objc_alloc((Class)a1) initWithPropertyValues:v10 inDatabase:v8];
  return v26;
}

- (id)physicalCardShippingUpdate
{
  id v3 = objc_alloc_init((Class)PKAccountPhysicalCardShippingUpdate);
  v4 = +[AccountPhysicalCardShippingUpdate _propertySettersForAccountPhysicalCardShippingUpdate];
  v5 = [v4 allKeys];
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  id v20 = sub_10031F34C;
  id v21 = &unk_10072EDD0;
  id v6 = v4;
  id v22 = v6;
  id v7 = v3;
  id v23 = v7;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:&v18];

  id v8 = [(SQLiteEntity *)self valueForProperty:@"i", v18, v19, v20, v21];
  id v9 = [v8 unsignedIntegerValue];

  v10 = [(SQLiteEntity *)self valueForProperty:@"j"];
  id v11 = [v10 unsignedIntegerValue];

  v12 = [(SQLiteEntity *)self valueForProperty:@"k"];
  id v13 = [v12 unsignedIntegerValue];

  if (v9 && v11 && v13)
  {
    id v14 = objc_alloc_init((Class)NSDateComponents);
    [v14 setDay:v9];
    [v14 setMonth:v11];
    [v14 setYear:v13];
    [v7 setEstimatedDeliveryDate:v14];
  }
  v15 = v23;
  id v16 = v7;

  return v16;
}

+ (void)deletePhysicalCardShippingUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForEventPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

+ (id)databaseTable
{
  return @"passionfruits";
}

+ (id)_shippingUpdatesWithQuery:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableSet);
  CFStringRef v16 = @"pid";
  v5 = +[NSArray arrayWithObjects:&v16 count:1];
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_10031F550;
  id v13 = &unk_10072ED00;
  id v14 = v3;
  id v6 = v4;
  id v15 = v6;
  id v7 = v3;
  [v7 enumeratePersistentIDsAndProperties:v5 usingBlock:&v10];

  if (objc_msgSend(v6, "count", v10, v11, v12, v13)) {
    id v8 = [v6 copy];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

+ (id)_predicateForEventPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPhysicalCardIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

+ (id)_propertySettersForAccountPhysicalCardShippingUpdate
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_1007491E8;
  v5[1] = &stru_100749208;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_100749228;
  v5[3] = &stru_100749248;
  v4[4] = @"f";
  v4[5] = @"g";
  v5[4] = &stru_100749268;
  v5[5] = &stru_100749288;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:6];
  return v2;
}

@end