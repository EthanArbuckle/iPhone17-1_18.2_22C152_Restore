@interface CloudStoreShareBackoff
+ (id)_predicateForBackoffType:(unint64_t)a3 cloudStoreZonePID:(int64_t)a4 recipientHandle:(id)a5;
+ (id)_predicateForCloudStoreZonePID:(int64_t)a3;
+ (id)anyInDatabase:(id)a3 forBackoffType:(unint64_t)a4 cloudStoreZone:(id)a5 recipientHandle:(id)a6;
+ (id)databaseTable;
+ (id)insertIfNotExistsForBackoffType:(unint64_t)a3 cloudStoreZone:(id)a4 recipientHandle:(id)a5 inDatabase:(id)a6;
+ (void)deleteEntriesForBackoffType:(unint64_t)a3 cloudStoreZone:(id)a4 recipientHandle:(id)a5 inDatabase:(id)a6;
+ (void)deleteEntriesWithCloudStoreZonePID:(int64_t)a3 inDatabase:(id)a4;
- (CloudStoreShareBackoff)initWithForBackoffType:(unint64_t)a3 cloudStoreZone:(id)a4 recipientHandle:(id)a5 inDatabase:(id)a6;
- (id)cloudStoreZone;
- (id)nextPossibleFetchDate;
- (id)recipientHandle;
- (unint64_t)backoffType;
- (void)increaseBackoffLevel;
@end

@implementation CloudStoreShareBackoff

+ (id)databaseTable
{
  return @"cloud_store_share_backoff";
}

+ (id)insertIfNotExistsForBackoffType:(unint64_t)a3 cloudStoreZone:(id)a4 recipientHandle:(id)a5 inDatabase:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [a1 anyInDatabase:v12 forBackoffType:a3 cloudStoreZone:v10 recipientHandle:v11];
  if (!v13)
  {
    id v13 = [objc_alloc((Class)a1) initWithForBackoffType:a3 cloudStoreZone:v10 recipientHandle:v11 inDatabase:v12];
    v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = @"unknown";
      if (a3 == 1) {
        v15 = @"addParticipant";
      }
      v16 = v15;
      v17 = [v10 zoneName];
      v18 = [v13 nextPossibleFetchDate];
      int v20 = 138544130;
      v21 = v16;
      __int16 v22 = 2114;
      v23 = v17;
      __int16 v24 = 2112;
      id v25 = v11;
      __int16 v26 = 2114;
      v27 = v18;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Creating new cloud store share backoff for backoff type %{public}@, zone %{public}@, recipientHandle %@, nextPossibleFetchDate %{public}@", (uint8_t *)&v20, 0x2Au);
    }
  }

  return v13;
}

- (CloudStoreShareBackoff)initWithForBackoffType:(unint64_t)a3 cloudStoreZone:(id)a4 recipientHandle:(id)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  id v14 = [v12 persistentID];

  [v13 setInteger:v14 forKey:@"cloud_store_zone_pid"];
  [v13 setObjectOrNull:v11 forKey:@"recipient_handle"];

  [v13 setInteger:a3 forKey:@"backoff_type"];
  [v13 setInteger:0 forKey:@"backoff_level"];
  v15 = +[NSDate dateWithTimeIntervalSinceNow:30.0];
  v16 = (void *)_SQLValueForDate();
  [v13 setObjectOrNull:v16 forKey:@"next_fetch"];

  id v17 = [v13 copy];
  v18 = [(SQLiteEntity *)self initWithPropertyValues:v17 inDatabase:v10];

  return v18;
}

+ (id)anyInDatabase:(id)a3 forBackoffType:(unint64_t)a4 cloudStoreZone:(id)a5 recipientHandle:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = objc_msgSend(a1, "_predicateForBackoffType:cloudStoreZonePID:recipientHandle:", a4, objc_msgSend(a5, "persistentID"), v10);

  id v13 = [a1 anyInDatabase:v11 predicate:v12];

  return v13;
}

+ (void)deleteEntriesForBackoffType:(unint64_t)a3 cloudStoreZone:(id)a4 recipientHandle:(id)a5 inDatabase:(id)a6
{
  id v10 = a5;
  id v11 = [a1 anyInDatabase:a6 forBackoffType:a3 cloudStoreZone:a4 recipientHandle:v10];
  if (v11)
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v11 backoffType];
      id v14 = @"unknown";
      if (v13 == (id)1) {
        id v14 = @"addParticipant";
      }
      v15 = v14;
      v16 = [v11 cloudStoreZone];
      id v17 = [v16 zoneName];
      int v18 = 138543874;
      v19 = v15;
      __int16 v20 = 2114;
      v21 = v17;
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Deleting cloud store share backoff level for backoff type %{public}@, cloud store zone %{public}@, recipientHandle %@", (uint8_t *)&v18, 0x20u);
    }
    [v11 deleteFromDatabase];
  }
}

+ (void)deleteEntriesWithCloudStoreZonePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForCloudStoreZonePID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

+ (id)_predicateForBackoffType:(unint64_t)a3 cloudStoreZonePID:(int64_t)a4 recipientHandle:(id)a5
{
  id v8 = a5;
  v9 = +[NSNumber numberWithUnsignedInteger:a3];
  id v10 = +[SQLiteComparisonPredicate predicateWithProperty:@"backoff_type" equalToValue:v9];
  id v11 = objc_msgSend(a1, "_predicateForCloudStoreZonePID:", a4, v10);
  v16[1] = v11;
  id v12 = +[SQLiteComparisonPredicate predicateWithProperty:@"recipient_handle" equalToValue:v8];

  v16[2] = v12;
  id v13 = +[NSArray arrayWithObjects:v16 count:3];
  id v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v13];

  return v14;
}

+ (id)_predicateForCloudStoreZonePID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"cloud_store_zone_pid" equalToValue:v3];

  return v4;
}

- (void)increaseBackoffLevel
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"backoff_level"];
  v4 = (char *)[v3 integerValue];

  v5 = v4 + 1;
  uint64_t v6 = 13;
  if ((unint64_t)(v4 + 1) < 0xD) {
    uint64_t v6 = (uint64_t)(v4 + 1);
  }
  v7 = +[NSDate dateWithTimeIntervalSinceNow:dbl_1005B3960[v6]];
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v9 = [(CloudStoreShareBackoff *)self backoffType];
    id v10 = @"unknown";
    if (v9 == 1) {
      id v10 = @"addParticipant";
    }
    id v11 = v10;
    id v12 = [(CloudStoreShareBackoff *)self cloudStoreZone];
    id v13 = [v12 zoneName];
    id v14 = [(CloudStoreShareBackoff *)self recipientHandle];
    *(_DWORD *)buf = 138544130;
    v21 = v11;
    __int16 v22 = 2114;
    id v23 = v13;
    __int16 v24 = 2112;
    id v25 = v14;
    __int16 v26 = 2114;
    v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Increasing cloud store share backoff level for backoff type %{public}@, cloudStoreZone %{public}@, recipientHandle %@, next fetch date %{public}@", buf, 0x2Au);
  }
  v15 = [(SQLiteEntity *)self database];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10039526C;
  v17[3] = &unk_10073DBA0;
  id v18 = v7;
  v19 = v5;
  v17[4] = self;
  id v16 = v7;
  sub_10000817C((uint64_t)v15, v17);
}

- (id)nextPossibleFetchDate
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"next_fetch"];
  v3 = (void *)_DateForSQLValue();

  return v3;
}

- (unint64_t)backoffType
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"backoff_type"];
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (id)recipientHandle
{
  return [(SQLiteEntity *)self valueForProperty:@"recipient_handle"];
}

- (id)cloudStoreZone
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"cloud_store_zone_pid"];
  id v4 = [v3 unsignedLongLongValue];
  v5 = [(SQLiteEntity *)self database];
  uint64_t v6 = +[CloudStoreZone cloudStoreZoneWithPID:v4 inDatabase:v5];

  return v6;
}

@end