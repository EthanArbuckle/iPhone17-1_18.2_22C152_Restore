@interface CloudStoreContainerChangeEvent
+ (id)_commonDictionaryForEvent:(id)a3;
+ (id)_eventsForQuery:(id)a3;
+ (id)_predicateForContainerIdentifier:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPID:(int64_t)a3;
+ (id)_predicateForTimestamp:(id)a3;
+ (id)_propertySettersForCloudStoreContainerChangeEvent;
+ (id)changeEventForPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)changeEventWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)changeEventsForContainerIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)insertContainerChangeEvent:(id)a3 inDatabase:(id)a4;
+ (int64_t)changeEventPIDForIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteAllEntriesInDatabase:(id)a3;
+ (void)purgeOldEntriesIfNecessaryInDatabase:(id)a3;
- (id)beginIntervalEventIdentifier;
- (id)errorDescription;
- (id)event;
- (id)identifier;
- (id)timestamp;
- (unint64_t)changeType;
- (unint64_t)eventType;
@end

@implementation CloudStoreContainerChangeEvent

+ (id)databaseTable
{
  return @"cloud_store_container_change_event";
}

+ (id)insertContainerChangeEvent:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PKCloudStoreContainerChangeEvent: Inserting change event %@", (uint8_t *)&v11, 0xCu);
  }

  v8 = [(id)objc_opt_class() _commonDictionaryForEvent:v5];
  v9 = [(SQLiteEntity *)[CloudStoreContainerChangeEvent alloc] initWithPropertyValues:v8 inDatabase:v6];

  return v9;
}

+ (id)changeEventsForContainerIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForContainerIdentifier:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];

  v9 = [a1 _eventsForQuery:v8];

  return v9;
}

+ (id)changeEventWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForIdentifier:a3];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  v9 = [v8 event];

  return v9;
}

+ (id)changeEventForPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForPID:a3];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  v9 = [v8 event];

  return v9;
}

+ (int64_t)changeEventPIDForIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForIdentifier:a3];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 persistentID];
  return (int64_t)v9;
}

+ (id)_eventsForQuery:(id)a3
{
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_1000626C8;
  v10 = &unk_100730E38;
  id v11 = a3;
  id v12 = objc_alloc_init((Class)NSMutableArray);
  id v3 = v12;
  id v4 = v11;
  [v4 enumeratePersistentIDsUsingBlock:&v7];
  id v5 = objc_msgSend(v3, "copy", v7, v8, v9, v10);

  return v5;
}

+ (id)_predicateForContainerIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    +[SQLiteComparisonPredicate predicateWithProperty:@"container_identifier" equalToValue:v3];
  }
  else {
  id v4 = +[SQLiteBooleanPredicate truePredicate];
  }

  return v4;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"identifier" equalToValue:a3];
}

+ (id)_predicateForPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForTimestamp:(id)a3
{
  id v3 = (void *)_SQLValueForDate();
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"timestamp" lessThanValue:v3];

  return v4;
}

+ (void)deleteAllEntriesInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PKCloudStoreContainerChangeEvent: Deleteing container change events from local database.", v8, 2u);
  }

  id v6 = +[SQLiteBooleanPredicate truePredicate];
  v7 = [a1 queryWithDatabase:v4 predicate:v6];
  [v7 deleteAllEntities];
}

+ (void)purgeOldEntriesIfNecessaryInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = +[NSDate date];
  id v6 = [v5 dateByAddingTimeInterval:-1728000.0];

  v7 = [a1 _predicateForTimestamp:v6];
  uint64_t v8 = [a1 queryWithDatabase:v4 predicate:v7];

  uint64_t v9 = (uint64_t)[v8 countOfEntities];
  if (v9 >= 1)
  {
    uint64_t v10 = v9;
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218242;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PKCloudStoreContainerChangeEvent deleting %ld entries older than %@", (uint8_t *)&v12, 0x16u);
    }

    [v8 deleteAllEntities];
  }
}

- (id)event
{
  id v3 = objc_alloc_init((Class)PKCloudStoreContainerChangeEvent);
  id v4 = [(id)objc_opt_class() _propertySettersForCloudStoreContainerChangeEvent];
  id v5 = [v4 allKeys];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100062C4C;
  v14[3] = &unk_10072DDD8;
  v14[4] = self;
  id v6 = v4;
  id v15 = v6;
  id v7 = v3;
  id v16 = v7;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v14];

  uint64_t v8 = [(CloudStoreContainerChangeEvent *)self beginIntervalEventIdentifier];
  if ([v8 length])
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [(SQLiteEntity *)self database];
    id v11 = [v9 changeEventWithIdentifier:v8 inDatabase:v10];

    if (v11) {
      +[PKCloudStoreContainerChangeEvent populateEndIntervalEvent:v7 withBeginIntervalEvent:v11];
    }
  }
  id v12 = v7;

  return v12;
}

- (id)identifier
{
  return [(SQLiteEntity *)self valueForProperty:@"identifier"];
}

- (id)beginIntervalEventIdentifier
{
  return [(SQLiteEntity *)self valueForProperty:@"begin_interval_event_identifier"];
}

- (id)timestamp
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"timestamp"];
  id v3 = (void *)_DateForSQLValue();

  return v3;
}

- (id)errorDescription
{
  return [(SQLiteEntity *)self valueForProperty:@"error_description"];
}

- (unint64_t)eventType
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"event_type"];
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (unint64_t)changeType
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"change_type"];
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

+ (id)_commonDictionaryForEvent:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 identifier];
  [v4 setObjectOrNull:v5 forKey:@"identifier"];

  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 changeType]);
  [v4 setObjectOrNull:v6 forKey:@"change_type"];

  id v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 eventType]);
  [v4 setObjectOrNull:v7 forKey:@"event_type"];

  uint64_t v8 = [v3 timestamp];
  uint64_t v9 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v9 forKey:@"timestamp"];

  uint64_t v10 = [v3 containerIdentifier];
  [v4 setObjectOrNull:v10 forKey:@"container_identifier"];

  id v11 = [v3 beginIntervalEventIdentifier];
  [v4 setObjectOrNull:v11 forKey:@"begin_interval_event_identifier"];

  id v12 = [v3 operationGroupName];
  [v4 setObjectOrNull:v12 forKey:@"operation_group_name"];

  uint64_t v13 = [v3 operationGroupNameSuffix];
  [v4 setObjectOrNull:v13 forKey:@"operation_group_name_suffix"];

  __int16 v14 = [v3 errorDescription];
  [v4 setObjectOrNull:v14 forKey:@"error_description"];

  id v15 = [v3 changeToken];
  [v4 setObjectOrNull:v15 forKey:@"change_token"];

  id v16 = [v3 stateName];
  [v4 setObjectOrNull:v16 forKey:@"state_name"];

  v17 = [v3 objectNames];
  v18 = [v17 componentsJoinedByString:@","];
  [v4 setObjectOrNull:v18 forKey:@"object_names"];

  [v3 timeInterval];
  double v20 = v19;

  v21 = +[NSNumber numberWithDouble:v20];
  [v4 setObjectOrNull:v21 forKey:@"time_interval"];

  id v22 = [v4 copy];
  return v22;
}

+ (id)_propertySettersForCloudStoreContainerChangeEvent
{
  v4[0] = @"identifier";
  v4[1] = @"event_type";
  v5[0] = &stru_100730E78;
  v5[1] = &stru_100730E98;
  v4[2] = @"change_type";
  v4[3] = @"timestamp";
  v5[2] = &stru_100730EB8;
  v5[3] = &stru_100730ED8;
  v4[4] = @"container_identifier";
  v4[5] = @"begin_interval_event_identifier";
  v5[4] = &stru_100730EF8;
  v5[5] = &stru_100730F18;
  v4[6] = @"operation_group_name";
  v4[7] = @"operation_group_name_suffix";
  v5[6] = &stru_100730F38;
  v5[7] = &stru_100730F58;
  v4[8] = @"error_description";
  v4[9] = @"state_name";
  v5[8] = &stru_100730F78;
  v5[9] = &stru_100730F98;
  v4[10] = @"object_names";
  v4[11] = @"change_token";
  v5[10] = &stru_100730FB8;
  v5[11] = &stru_100730FD8;
  v4[12] = @"time_interval";
  v5[12] = &stru_100730FF8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:13];
  return v2;
}

@end