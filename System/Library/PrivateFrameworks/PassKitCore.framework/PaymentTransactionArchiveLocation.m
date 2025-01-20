@interface PaymentTransactionArchiveLocation
+ (id)_predicateForArchivePID:(int64_t)a3;
+ (id)_predicateForCloudStoreZone:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForCloudStoreZonePID:(int64_t)a3;
+ (id)_predicateForLocation:(id)a3 archivePID:(int64_t)a4 inDatabase:(id)a5;
+ (id)_predicateForType:(unint64_t)a3;
+ (id)_propertySettersForTransactionArchiveLocation;
+ (id)_transactionArchiveLocationsWithQuery:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateTransactionArchiveLocations:(id)a3 forArchivePID:(int64_t)a4 inDatabase:(id)a5;
+ (id)transactionArchiveLocationsForArchivePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteArchiveLocationsForArchivePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteArchiveLocationsForCloudStoreZonePID:(int64_t)a3 inDatabase:(id)a4;
- (PaymentTransactionArchiveLocation)initWithTransactionArchiveLocation:(id)a3 forArchivePID:(int64_t)a4 inDatabase:(id)a5;
- (id)_commonDictionaryForArchiveLocation:(id)a3 inDatabase:(id)a4;
- (id)archiveLocation;
- (id)cloudStoreZone;
- (void)updateWithTransactionArchiveLocation:(id)a3;
@end

@implementation PaymentTransactionArchiveLocation

+ (id)databaseTable
{
  return @"payment_transaction_archive_location";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"archive_pid";
  }
  else {
    return 0;
  }
}

+ (id)insertOrUpdateTransactionArchiveLocations:(id)a3 forArchivePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init((Class)NSMutableSet);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = *(void *)v25;
    *(void *)&long long v12 = 138412290;
    long long v22 = v12;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v15);
        v17 = objc_msgSend(a1, "_predicateForLocation:archivePID:inDatabase:", v16, a4, v9, v22);
        v18 = [a1 anyInDatabase:v9 predicate:v17];

        if (v18)
        {
          [v18 updateWithTransactionArchiveLocation:v16];
LABEL_9:
          [v10 addObject:v18];
          goto LABEL_10;
        }
        v18 = [objc_alloc((Class)a1) initWithTransactionArchiveLocation:v16 forArchivePID:a4 inDatabase:v9];
        if (v18) {
          goto LABEL_9;
        }
        v18 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v22;
          id v29 = obj;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Error: Could not insert PaymentTransactionArchiveLocation into database for locations %@", buf, 0xCu);
        }
LABEL_10:

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v19 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
      id v13 = v19;
    }
    while (v19);
  }

  id v20 = [v10 copy];
  return v20;
}

- (PaymentTransactionArchiveLocation)initWithTransactionArchiveLocation:(id)a3 forArchivePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = [(PaymentTransactionArchiveLocation *)self _commonDictionaryForArchiveLocation:a3 inDatabase:v8];
  id v10 = [v9 mutableCopy];

  id v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"archive_pid"];

  id v12 = [v10 copy];
  id v13 = [(SQLiteEntity *)self initWithPropertyValues:v12 inDatabase:v8];

  uint64_t v14 = v13;
  return v14;
}

- (void)updateWithTransactionArchiveLocation:(id)a3
{
  id v4 = [(PaymentTransactionArchiveLocation *)self _commonDictionaryForArchiveLocation:a3 inDatabase:self->super._database];
  [(SQLiteEntity *)self setValuesWithDictionary:v4];
}

+ (id)_predicateForLocation:(id)a3 archivePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a1 _predicateForArchivePID:a4];
  id v11 = objc_msgSend(v9, "cloudStoreZone", v10);
  id v12 = [a1 _predicateForCloudStoreZone:v11 inDatabase:v8];

  v18[1] = v12;
  id v13 = [v9 type];

  uint64_t v14 = [a1 _predicateForType:v13];
  v18[2] = v14;
  v15 = +[NSArray arrayWithObjects:v18 count:3];
  uint64_t v16 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v15];

  return v16;
}

+ (id)_predicateForArchivePID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"archive_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForType:(unint64_t)a3
{
  v3 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"type" equalToValue:v3];

  return v4;
}

+ (id)_predicateForCloudStoreZone:(id)a3 inDatabase:(id)a4
{
  v5 = +[CloudStoreZone anyInDatabase:a4 forCloudStoreZone:a3];
  id v6 = [v5 persistentID];

  return [a1 _predicateForCloudStoreZonePID:v6];
}

+ (id)_predicateForCloudStoreZonePID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"cloud_store_zone_pid" equalToValue:v3];

  return v4;
}

+ (void)deleteArchiveLocationsForArchivePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForArchivePID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteArchiveLocationsForCloudStoreZonePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForCloudStoreZonePID:a3];
  v12[0] = v7;
  id v8 = [a1 _predicateForType:0];
  v12[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v12 count:2];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  id v11 = [a1 queryWithDatabase:v6 predicate:v10];

  [v11 deleteAllEntities];
}

+ (id)transactionArchiveLocationsForArchivePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForArchivePID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _transactionArchiveLocationsWithQuery:v8];

  return v9;
}

- (id)archiveLocation
{
  id v3 = objc_alloc_init((Class)PKPaymentTransactionArchiveLocation);
  id v4 = +[PaymentTransactionArchiveLocation _propertySettersForTransactionArchiveLocation];
  v5 = [v4 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  void v12[2] = sub_10037A8A0;
  v12[3] = &unk_10072DDD8;
  v12[4] = self;
  id v13 = v4;
  id v6 = v3;
  id v14 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v12];

  id v8 = [(PaymentTransactionArchiveLocation *)self cloudStoreZone];
  [v6 setCloudStoreZone:v8];

  id v9 = v14;
  id v10 = v6;

  return v10;
}

- (id)cloudStoreZone
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"cloud_store_zone_pid"];
  id v4 = [v3 longValue];

  database = self->super._database;
  return +[CloudStoreZone cloudStoreZoneWithPID:v4 inDatabase:database];
}

+ (id)_transactionArchiveLocationsWithQuery:(id)a3
{
  id v4 = a3;
  v5 = [a1 _propertySettersForTransactionArchiveLocation];
  id v6 = [v5 allKeys];
  CFStringRef v21 = @"cloud_store_zone_pid";
  id v7 = +[NSArray arrayWithObjects:&v21 count:1];
  id v8 = [v6 arrayByAddingObjectsFromArray:v7];

  id v9 = objc_alloc_init((Class)NSMutableSet);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10037AB28;
  v15[3] = &unk_10074B5F8;
  id v19 = a1;
  id v20 = (char *)[v8 count] - 1;
  id v16 = v5;
  id v17 = v4;
  id v18 = v9;
  id v10 = v9;
  id v11 = v4;
  id v12 = v5;
  [v11 enumeratePersistentIDsAndProperties:v8 usingBlock:v15];
  id v13 = [v10 copy];

  return v13;
}

- (id)_commonDictionaryForArchiveLocation:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isArchived]);
  [v7 setObjectOrNull:v8 forKey:@"archived"];

  id v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 type]);
  [v7 setObjectOrNull:v9 forKey:@"type"];

  id v10 = [v5 cloudStoreZone];

  if (v10)
  {
    id v11 = [v5 cloudStoreZone];
    id v12 = +[CloudStoreZone anyInDatabase:v6 forCloudStoreZone:v11];

    if (v12)
    {
      id v13 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v12 persistentID]);
      [v7 setObjectOrNull:v13 forKey:@"cloud_store_zone_pid"];
    }
  }
  id v14 = [v7 copy];

  return v14;
}

+ (id)_propertySettersForTransactionArchiveLocation
{
  v4[0] = @"type";
  v4[1] = @"archived";
  v5[0] = &stru_10074BF00;
  v5[1] = &stru_10074BF20;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

@end